object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'View Char'
  ClientHeight = 301
  ClientWidth = 181
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 181
    Height = 238
    Align = alClient
    Center = True
    ExplicitTop = 16
    ExplicitWidth = 188
    ExplicitHeight = 218
  end
  object Panel1: TPanel
    Left = 0
    Top = 238
    Width = 181
    Height = 44
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 258
    ExplicitWidth = 323
    object bPrev: TButton
      Left = 10
      Top = 10
      Width = 33
      Height = 25
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = bPrevClick
    end
    object bNext: TButton
      Left = 49
      Top = 10
      Width = 33
      Height = 25
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = bNextClick
    end
    object CheckBox1: TCheckBox
      Left = 124
      Top = 14
      Width = 62
      Height = 17
      Caption = 'Stretch'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 282
    Width = 181
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitLeft = 98
    ExplicitTop = 476
    ExplicitWidth = 0
  end
end
