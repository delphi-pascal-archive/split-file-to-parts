object Form1: TForm1
  Left = 235
  Top = 136
  AlphaBlendValue = 200
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1079#1073#1086#1088#1082#1072' / '#1057#1073#1086#1088#1082#1072' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 276
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 147
    Height = 16
    Caption = #1056#1072#1079#1084#1077#1088' '#1090#1086#1084#1072' '#1074' '#1073#1072#1081#1090#1072#1093':'
  end
  object Label2: TLabel
    Left = 116
    Top = 20
    Width = 59
    Height = 18
    Alignment = taCenter
    Caption = '<'#1060#1072#1081#1083'>'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = #1056#1072#1079#1073#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 72
    Width = 177
    Height = 25
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    Text = '1449984'
  end
  object Button2: TButton
    Left = 192
    Top = 8
    Width = 97
    Height = 25
    Caption = #1057#1086#1073#1088#1072#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 257
    Width = 298
    Height = 19
    Panels = <
      item
        Style = psOwnerDraw
        Width = 120
      end
      item
        Text = ' '#1043#1086#1090#1086#1074#1086
        Width = 50
      end>
  end
  object Edit2: TEdit
    Left = 192
    Top = 72
    Width = 97
    Height = 24
    Hint = 'CRC32'
    Color = clBlack
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    Text = 'CRC32'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 104
    Width = 281
    Height = 145
    Caption = ' '#1054#1087#1094#1080#1080' '#1089#1086#1079#1076#1072#1085#1080#1103' BAT-'#1092#1072#1081#1083#1072' '
    TabOrder = 5
    object CheckBox1: TCheckBox
      Left = 16
      Top = 24
      Width = 257
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1077' '#1089#1073#1086#1088#1082#1080' '#1074' '#1086#1076#1080#1085' '#1092#1072#1081#1083
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 48
      Width = 249
      Height = 81
      Caption = ' '#1055#1072#1091#1079#1072' '
      ItemIndex = 0
      Items.Strings = (
        #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
        #1042' '#1082#1086#1085#1094#1077' '#1074#1089#1077#1093' '#1089#1073#1086#1088#1086#1082
        #1042' '#1082#1086#1085#1094#1077' '#1082#1072#1078#1076#1086#1081' '#1089#1073#1086#1088#1082#1080)
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofNoNetworkButton, ofEnableIncludeNotify, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083#1099' '
    Left = 200
    Top = 168
  end
  object XPManifest1: TXPManifest
    Left = 232
    Top = 168
  end
  object OpenDialog2: TOpenDialog
    Filter = #1055#1077#1088#1074#1099#1081' '#1090#1086#1084'|*.part001|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofNoNetworkButton, ofEnableIncludeNotify, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1074#1099#1081' '#1090#1086#1084
    Left = 232
    Top = 200
  end
  object SaveDialog1: TSaveDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofNoNetworkButton, ofEnableIncludeNotify, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Title = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1082#1086#1085#1077#1095#1085#1086#1075#1086' '#1092#1072#1081#1083#1072
    Left = 168
    Top = 168
  end
end
