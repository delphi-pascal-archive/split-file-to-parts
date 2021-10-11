unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, XPMan, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    XPManifest1: TXPManifest;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    OpenDialog2: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pb   : TProgressBar;

implementation

{$R *.dfm}

uses
SplitUtils, CommCtrl;

resourcestring
READY       = ' Готово';
WORKING     = ' Работаю...';
ONLYDIGITS  = 'Неправильно указан размер тома,'#13'вводите только цифры !';
ERRORDIGITS = 'Неправильно указан размер тома,'#13'он больше размера исходного файла !';
IPROTECT    = 'Разборку и сборку файлов можно производить только на жёстком диске !';

function GetPanelRect: TRect;
begin
SendMessage(Form1.StatusBar1.Handle, SB_GETRECT, 0, integer(@result));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
pb              := TProgressBar.Create(StatusBar1);
pb.Visible      := false;
pb.Parent       := StatusBar1;
pb.BoundsRect   := GetPanelRect;
pb.Smooth       := true;
pb.Step         := 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
MASK  = '.part*';
COPY_ = 'copy /b';
var
ITOG, FIND,
inFile,
DT, BATNAME, FSIZE            : String;
H                             : Integer;
begin
opendialog1.FileName      := '';
if opendialog1.Execute then
begin
if not FileExists(opendialog1.FileName) then EXIT;
if not IsDigits(Edit1.Text) then
begin
ShowMessage(ONLYDIGITS);
EXIT;
end;
if GetFileSize(opendialog1.Files[0]) <= StrToInt(Edit1.Text) then
begin
ShowMessage(ERRORDIGITS);
EXIT;
end;
if not FileDriveIsFixed(OpenDialog1.FileName) then
begin
ShowMessage(IPROTECT);
EXIT;
end;
if opendialog1.Files.Count > 1 then
begin
StatusBar1.Panels[1].Text := WORKING;
pb.Visible                := true;
for H := 0 To opendialog1.Files.Count - 1 do
begin
Edit2.Text                := GetFileCRC32Hex(opendialog1.Files[H]);
inFile                    := {ExtractShortPathName(}opendialog1.Files[H]{)};
SplitFile(inFile, StrToInt(Edit1.Text), pb);
FIND                      := inFile + MASK;
ITOG                      := FORMAT('%s %s "%s"', [COPY_, GetPartList(FIND), ExtractFileName(inFile)]);
if CheckBox1.Checked then
begin
BATNAME                   := Format('%d Files.bat', [opendialog1.Files.Count]);
DT                        := Format('[%s %s]', [DateToStr(Date), TimeToStr(Time)]);
FSIZE                     := Format('Размер: %s', [GetKByte(GetFileSize(inFile))]);
SaveBat(BATNAME, Format('REM <%s> CRC32: %s %s %s', [ExtractFileName(inFile), Edit2.Text, FSIZE, DT]), True);
SaveBat(BATNAME, ITOG, True);
if RadioGroup1.ItemIndex = 2 then SaveBat(BATNAME, 'Pause', True);
end else
begin
BATNAME                   := Format('%s.bat', [opendialog1.Files[H]]);
DT                        := Format('[%s %s]', [DateToStr(Date), TimeToStr(Time)]);
FSIZE                     := Format('Размер: %s', [GetKByte(GetFileSize(inFile))]);
SaveBat(BATNAME, Format('REM <%s> CRC32: %s %s %s', [ExtractFileName(inFile), Edit2.Text, FSIZE, DT]), False);
SaveBat(BATNAME, ITOG, True);
if RadioGroup1.ItemIndex > 0 then SaveBat(BATNAME, 'Pause', True);
end;
end;
if RadioGroup1.ItemIndex = 1 then SaveBat(BATNAME, 'Pause', True);
end else
begin
Edit2.Text                := GetFileCRC32Hex(opendialog1.FileName);
StatusBar1.Panels[1].Text := WORKING;
pb.Visible                := true;
inFile                    := {ExtractShortPathName(}opendialog1.filename{)};
SplitFile(inFile, StrToInt(Edit1.Text), pb);
FIND                      := inFile + MASK;
ITOG                      := FORMAT('%s %s "%s"', [COPY_, GetPartList(FIND), ExtractFileName(inFile)]);
BATNAME                   := FORMAT('%s.bat', [opendialog1.filename]);
DT                        := Format('[%s %s]', [DateToStr(Date), TimeToStr(Time)]);
FSIZE                     := Format('Размер: %s', [GetKByte(GetFileSize(inFile))]);
SaveBat(BATNAME, Format('REM <%s> CRC32: %s %s %s', [ExtractFileName(inFile), Edit2.Text, FSIZE, DT]), False);
SaveBat(BATNAME, ITOG, True);
if RadioGroup1.ItemIndex > 0 then SaveBat(BATNAME, 'Pause', True);
end;
end;
pb.Position               := 0;
pb.Visible                := false;
StatusBar1.Panels[1].Text := READY;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
opendialog2.FileName      := '';
if opendialog2.Execute then
begin
if not FileExists(opendialog2.FileName) then EXIT;
savedialog1.FileName      := ChangeFileExt(opendialog2.FileName, '');
if savedialog1.execute then
begin
if savedialog1.FileName = '' then EXIT;
if not FileDriveIsFixed(SaveDialog1.FileName) then
begin
ShowMessage(IPROTECT);
EXIT;
end;
StatusBar1.Panels[1].Text := WORKING;
CombineFiles(opendialog2.filename, savedialog1.filename);
Edit2.Text                := GetFileCRC32Hex(savedialog1.FileName);
StatusBar1.Panels[1].Text := READY;
end;
end;
end;

//Можно добавить опцию преобразования имён файлов в формат DOS
//Можно добавить возможность удаления исходных файлов после разбиения или сборки
//Можно добавить открытие конечной папки после разбивки
//Можно добавить возможность выхода из приложения после обработки файлов
//Можно добавить возможность сохранения настроек в ИНИ и только на жёстком диске

end.
