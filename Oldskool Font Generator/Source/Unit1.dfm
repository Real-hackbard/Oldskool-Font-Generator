object Form1: TForm1
  Left = 381
  Top = 129
  ClientHeight = 569
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 550
    Width = 774
    Height = 19
    Panels = <
      item
        Text = 'Count :'
        Width = 50
      end
      item
        Text = '0'
        Width = 70
      end
      item
        Text = 'Chars :'
        Width = 50
      end
      item
        Text = '0'
        Width = 70
      end
      item
        Text = 'Size :'
        Width = 40
      end
      item
        Text = 'X-(0)-Y(0)'
        Width = 150
      end
      item
        Text = 'Process :'
        Width = 60
      end
      item
        Text = 'ready.'
        Width = 50
      end>
    ExplicitTop = 549
    ExplicitWidth = 770
  end
  object Panel4: TPanel
    Left = 0
    Top = 57
    Width = 145
    Height = 493
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel4'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    ExplicitHeight = 492
    object ListBox1: TListBox
      Left = 0
      Top = 0
      Width = 145
      Height = 493
      TabStop = False
      Style = lbOwnerDrawFixed
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ItemHeight = 52
      TabOrder = 0
      OnClick = ListBox1Click
      OnDrawItem = ListBox1DrawItem
      ExplicitHeight = 492
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 770
    object Label1: TLabel
      Left = 22
      Top = 8
      Width = 311
      Height = 39
      Caption = 'Oldskool Font Generator'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 336
      Top = 29
      Width = 140
      Height = 13
      Caption = 'Generate Bitmap Fonts easy.'
    end
    object Memo1: TMemo
      Left = 701
      Top = 8
      Width = 56
      Height = 43
      TabStop = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      Visible = False
    end
  end
  object PageControl1: TPageControl
    Left = 145
    Top = 57
    Width = 629
    Height = 493
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 3
    TabStop = False
    ExplicitWidth = 625
    ExplicitHeight = 492
    object TabSheet1: TTabSheet
      Caption = 'Generator'
      object Splitter1: TSplitter
        Left = 0
        Top = 272
        Width = 621
        Height = 5
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 257
        ExplicitWidth = 571
      end
      object Panel3: TPanel
        Left = 0
        Top = 377
        Width = 621
        Height = 88
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 376
        ExplicitWidth = 617
        object Label10: TLabel
          Left = 15
          Top = 17
          Width = 29
          Height = 13
          Caption = 'Text :'
        end
        object Label11: TLabel
          Left = 12
          Top = 52
          Width = 32
          Height = 13
          Caption = 'Scale :'
        end
        object SpeedButton1: TSpeedButton
          Left = 284
          Top = 15
          Width = 25
          Height = 25
          Hint = 'Stretch Bitmap Image'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000130B0000130B00000000000000000000F5F5F5CCCCCC
            CCCCCCCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCC
            CCCCCCCCCCCCCCF5F5F5CCCCCC0000003D3D3D666666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF6666663D3D3D000000CCCCCCCCCCCC3D3D3D
            7A7A7AE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1
            E17A7A7A3D3D3DCCCCCCCCCCCC666666E0E0E0525252FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF525252E0E0E0666666CCCCCCD6D6D6858585
            FFFFFF5C5C5CD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D65C5C
            5CFFFFFF858585D6D6D6FFFFFFFFFFFFFFFFFFFFFFFF707070C2C2C2FFFFFFFF
            FFFFFFFFFFFFFFFFC2C2C2707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEBEBEB858585C2C2C2FFFFFFFFFFFFC2C2C2858585EBEBEBFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEB707070D6
            D6D6D6D6D6707070EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C2EB
            EBEBEBEBEBC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC2C2C2858585EBEBEBEBEBEB858585C2C2C2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6707070EBEBEBFF
            FFFFFFFFFFEBEBEB707070D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFF5F5F5E0E0E0
            FFFFFFD6D6D65C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5CD6D6
            D6FFFFFFE0E0E0F5F5F5CCCCCC666666C2C2C2707070FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF707070C2C2C2666666CCCCCCCCCCCC292929
            858585EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEB
            EB858585292929CCCCCCCCCCCC0000001F1F1F333333FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF5C5C5C3333331F1F1F000000CCCCCC}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 308
          Top = 15
          Width = 25
          Height = 25
          Hint = 'Transparent'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777877877877877777787787787787777880880880880887777877877877
            8777777877877877877778808808808808877778778778778777777877877877
            8777788088088088088777787787787787777778778778778777788088088088
            0887777877877877877777787787787787777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 332
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Calculate Grayscale'
          Flat = True
          Glyph.Data = {
            E6010000424DE60100000000000036000000280000000C0000000C0000000100
            180000000000B0010000120B0000120B00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
            0B0B0B0B0B0B2020202020202020202020202020202020202020202020202020
            202020202020202020203B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
            3B3B3B3B3B3B3B3B3B3B3B3B3B3B5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A
            5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A7A7A7A7A7A7A7A7A7A7A7A7A7A7A
            7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A9B9B9B9B9B9B9B9B9B9B
            9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BBABABABABABA
            BABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAD6D6
            D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
            D6D6EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
            EEEEEEEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 356
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Invert Image Negativ'
          Flat = True
          Glyph.Data = {
            66010000424D660100000000000076000000280000000F0000000F0000000100
            080000000000F0000000120B0000120B00001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
            0707070707070707070007070707070707070707070707070700070707070700
            0000000000000007070007070707070008080808080800070700070000000000
            0808080808080007070007000F0B0B000808080808080007070007000B0F0F00
            0808080808080007070007000F0B0B000808080808080007070007000B0F0F00
            0000000000000007070007000F0B0B0F0B0F0B0F00070707070007000B0F0F0B
            0F0B0F0B00070707070007000B0F0F0B0F0B0F0B000707070700070000000000
            0000000000070707070007070707070707070707070707070700070707070707
            07070707070707070700}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton4Click
        end
        object SpeedButton5: TSpeedButton
          Left = 380
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Resample Pixel Bits'
          Flat = True
          Glyph.Data = {
            E6010000424DE60100000000000036000000280000000C0000000C0000000100
            180000000000B0010000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFBFBFBEEEEEEE4E4E4E0E0E0E4E4E4EEEEEEFBFBFBFFFFFFFFFFFFFFFF
            FFFFFFFFF6F6F6E0E0E0CACACAB9B9B9B3B3B3B9B9B9CACACAE0E0E0F6F6F6FF
            FFFFFFFFFFFBFBFBE0E0E0BFBFBF9F9F9F8888888080808888889F9F9FBFBFBF
            E0E0E0FBFBFBFFFFFFEEEEEECACACA9F9F9F7676765757574C4C4C5757577676
            769F9F9FCACACAEEEEEEFFFFFFE4E4E4B9B9B98888885757573030301F1F1F30
            3030575757888888B9B9B9E4E4E4FFFFFFE0E0E0B3B3B38080804C4C4C1F1F1F
            0000001F1F1F4C4C4C808080B3B3B3E0E0E0FFFFFFE4E4E4B9B9B98888885757
            573030301F1F1F303030575757888888B9B9B9E4E4E4FFFFFFEEEEEECACACA9F
            9F9F7676765757574C4C4C5757577676769F9F9FCACACAEEEEEEFFFFFFFBFBFB
            E0E0E0BFBFBF9F9F9F8888888080808888889F9F9FBFBFBFE0E0E0FBFBFBFFFF
            FFFFFFFFF6F6F6E0E0E0CACACAB9B9B9B3B3B3B9B9B9CACACAE0E0E0F6F6F6FF
            FFFFFFFFFFFFFFFFFFFFFFFBFBFBEEEEEEE4E4E4E0E0E0E4E4E4EEEEEEFBFBFB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton5Click
        end
        object SpeedButton6: TSpeedButton
          Left = 403
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Turn Image Vertical'
          Flat = True
          Glyph.Data = {
            E6010000424DE60100000000000036000000280000000C0000000C0000000100
            180000000000B0010000130B0000130B00000000000000000000EAEAEAE6E6E6
            E3E3E3DEDEDED9D9D9D2D2D2CBCBCBC4C4C4BDBDBDB6B6B6B0B0B0ABABABEDED
            EDEAEAEAE6E6E6E1E1E1DBDBDBD3D3D3CBCBCBC3C3C3BABABAB3B3B3ACACACA7
            A7A7F0F0F0EDEDEDEAEAEAE5E5E5DEDEDED5D5D5CBCBCBC0C0C0B6B6B6AEAEAE
            A7A7A7A1A1A1F4F4F4F1F1F1EEEEEEEAEAEAE3E3E3D9D9D9CBCBCBBDBDBDB0B0
            B0A7A7A7A0A0A09B9B9BF7F7F7F6F6F6F4F4F4F0F0F0EAEAEADEDEDECBCBCBB6
            B6B6A7A7A79D9D9D979797939393FBFBFBFBFBFBF9F9F9F7F7F7F4F4F4EAEAEA
            CBCBCBA7A7A79797979090908C8C8C8989890000000000000000000000000000
            0000000034343480808080808080808080808080808004040404040406060608
            08080B0B0B1515153434345858586868686F6F6F737373767676080808090909
            0B0B0B0F0F0F1515152121213434344949495858586262626868686C6C6C0B0B
            0B0E0E0E1111111515151C1C1C2626263434344242424F4F4F5858585F5F5F64
            64640F0F0F1212121515151A1A1A2121212A2A2A3434343F3F3F494949515151
            5858585E5E5E1212121515151919191E1E1E2424242C2C2C3434343C3C3C4545
            454C4C4C535353585858}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton6Click
        end
        object SpeedButton7: TSpeedButton
          Left = 427
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Turn Image Horizontal'
          Flat = True
          Glyph.Data = {
            E6010000424DE60100000000000036000000280000000C0000000C0000000100
            180000000000B0010000120B0000120B00000000000000000000ABABABA7A7A7
            A1A1A19B9B9B9393938989898080807676766C6C6C6464645E5E5E585858B0B0
            B0ACACACA7A7A7A0A0A09797978C8C8C8080807373736868685F5F5F58585853
            5353B6B6B6B3B3B3AEAEAEA7A7A79D9D9D9090908080806F6F6F626262585858
            5151514C4C4CBDBDBDBABABAB6B6B6B0B0B0A7A7A79797978080806868685858
            584F4F4F494949454545C4C4C4C3C3C3C0C0C0BDBDBDB6B6B6A7A7A780808058
            58584949494242423F3F3F3C3C3CCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCB
            343434343434343434343434343434343434D2D2D2D3D3D3D5D5D5D9D9D9DEDE
            DEEAEAEA0000001515152121212626262A2A2A2C2C2CD9D9D9DBDBDBDEDEDEE3
            E3E3EAEAEAF4F4F40000000B0B0B1515151C1C1C212121242424DEDEDEE1E1E1
            E5E5E5EAEAEAF0F0F0F7F7F70000000808080F0F0F1515151A1A1A1E1E1EE3E3
            E3E6E6E6EAEAEAEEEEEEF4F4F4F9F9F90000000606060B0B0B11111115151519
            1919E6E6E6EAEAEAEDEDEDF1F1F1F6F6F6FBFBFB0000000404040909090E0E0E
            121212151515EAEAEAEDEDEDF0F0F0F4F4F4F7F7F7FBFBFB0000000404040808
            080B0B0B0F0F0F121212}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton7Click
        end
        object SpeedButton8: TSpeedButton
          Left = 450
          Top = 14
          Width = 25
          Height = 25
          Hint = 'Calculate RGB to Image'
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000F7F7F7E7E7E7
            DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
            DFDFDFDFE7E7E7F7F7F7EDEDED43434B25253D1F1F3F1F1F3F1F27371F37271F
            3F1F1F3F1F27371F37271F3F1F1F3F1F1F371F1F3F3737E7E7E7F1F1F1A3A3BB
            1212D90000DF0000DF0017C700C71700DF0000DF0017C700C71700DF0000DF00
            00C70000371F1FDFDFDFF7F7F7AFAFCF1818F70000FF0000FF001FDF00DF1F00
            FF0000FF001FDF00DF1F00FF0000FF0000DF00003F1F1FDFDFDFF7F7F7AFAFCF
            1818F70000FF0000FF001FDF00DF1F00FF0000FF001FDF00DF1F00FF0000FF00
            00DF00003F1F1FDFDFDFF7F7F7AFAFCF1818F70000FF0000FF001FDF00DF1F00
            FF0000FF001FDF00DF1F00FF0000FF0000DF00003F1F1FDFDFDFF7F7F7AFAFCF
            1818F70000FF0000FF001FDF00DF1F00FF0000FF001FDF00DF1F00FF0000FF00
            00DF00003F1F1FDFDFDFF7F7F7AFAFCF1818F70000FF0000FF001FDF00DF1F00
            FF0000FF001FDF00DF1F00FF0000FF0000DF00003F1F1FDFDFDFF7F7F7AFAFCF
            1818F70000FF0000FF001FDF00DF1F00FF0000FF001FDF00DF1F00FF0000FF00
            00DF00003F1F1FDFDFDFF7F7F7AFAFCF1818F70000FF0000FF001FDF00DF1F00
            FF0000FF001FDF00DF1F00FF0000FF0000DF00003F1F1FDFDFDFF7F7F7AFAFCF
            1818F70000FF0000FF001FDF00DF1F00FF0000FF001FDF00DF1F00FF0000FF00
            00DF00003F1F1FDFDFDFF7F7F7AFAFCF1818F70000FF0000FF001FDF00DF1F00
            FF0000FF001FDF00DF1F00FF0000FF0000DF00003F1F1FDFDFDFF7F7F7AFAFCF
            1818F70000FF0000FF001FDF00DF1F00FF0000FF001FDF00DF1F00FF0000FF00
            00DF00003F1F1FDFDFDFF7F7F7B5B5CD2A2AF11818F71818F7182FDF18DF2F18
            F71818F7182FDF18DF2F18F71818F71818D912123D2525DFDFDFF9F9F9C7C7CF
            B5B5CDAFAFCFAFAFCFAFB7C7AFC7B7AFCFAFAFCFAFB7C7AFC7B7AFCFAFAFCFAF
            AFBBA3A34B4343E7E7E7FDFDFDF9F9F9F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F1F1F1EDEDEDF7F7F7}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton8Click
        end
        object SpeedButton9: TSpeedButton
          Left = 583
          Top = 15
          Width = 25
          Height = 25
          Hint = 'Undo'
          Glyph.Data = {
            06030000424D060300000000000036000000280000000F0000000F0000000100
            180000000000D0020000C30E0000C30E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF9ECE9EFD3CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFDFCFDF0D5CEF1B9A0E1A58BE2
            E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            F2E5E3ECBDAAF7C09FFFE0C1E9B99EC1A29AF7F6F6FEFCFCFEFEFEFFFFFFFFFF
            FFFFFFFFFFFFFF000000FAF5F5F0CABDF1B797FCCDA9FFDBBAFFDBBEFCD8BFF2
            CBB5F5CEBBEDC1B2E2C9C1F0DDD8F9FAFAFFFFFFFFFFFF000000EEB59FFBC69F
            FFD3AEFFD4B3FFD7B9FFDABFFFE1C8FFE7D4FFECDBFFF5EAFFF4EDF0D4CCE0BC
            B2F1EAE9FFFFFF000000E19376FEC59EFFD8B3FFD6B3FFD8B8FFDBC0FFE1C9FF
            E7D5FFEEDEFFF3E9FFFBF7FFFFFFFBDFCBDAAA95F0EEEE000000D59E90DF5D37
            F7A985FFD5B3FFDCBEFFDDC2FED9C0FDD5BBFEDECBFEE9DCFEF6F2FFFFFDFFEB
            D3F0AD86D3B3A9000000F2F0EFCB9283D26241F1906AFDC8A8FFE3CAFDCEB2F9
            B48BF7AD85FAAE89FDB99BFDCEB9FED9BDF8AC83C89E91000000FFFFFFF9FEFF
            DACAC5CE856FE78762FEBE9CF6BB9DB88B7BBFAEA7C69D8FDB9277F2946FFCA8
            83F4956EC59C8F000000FFFFFFFFFFFFFFFFFFEFF2F3D2B0A6DD9273E8A27BC2
            A59CFEFFFFFDFFFFD8CCCBD46948F28760F68B65C69E93000000FFFFFFFFFFFF
            FFFFFFFFFFFFFDFFFFE4DDDBC3A196D0C9C6FFFFFFF8E4DEE8A289DE6742E46C
            48F68E68C8A297000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
            FFFFF3F2F3E6AD93EE8F66E2724EF9916ADB7F5FC0B0AB000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF0E3A488F9976FF99B75D880
            61AF8F86EDF1F2000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF9FDFEE3AE9BD4886AB7897ABEB3B1F0F4F5FFFFFF000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEAEAD2D1D2EFF4F5FFFF
            FFFFFFFFFFFFFF000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton9Click
        end
        object Edit1: TEdit
          Left = 50
          Top = 15
          Width = 228
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          TabOrder = 0
          Text = 'TESTSTRING'
          OnChange = Edit1Change
          OnKeyPress = Edit1KeyPress
        end
        object ScrollBar1: TScrollBar
          Left = 50
          Top = 52
          Width = 228
          Height = 17
          Max = 1000
          Min = 2
          PageSize = 0
          Position = 2
          TabOrder = 1
          OnChange = ScrollBar1Change
        end
        object ComboBox1: TComboBox
          Left = 481
          Top = 16
          Width = 96
          Height = 22
          Style = csOwnerDrawVariable
          DropDownCount = 25
          TabOrder = 2
          TabStop = False
          OnDrawItem = ComboBox1DrawItem
        end
        object CheckBox1: TCheckBox
          Left = 450
          Top = 51
          Width = 151
          Height = 17
          TabStop = False
          Caption = 'Export Image Transparent'
          TabOrder = 3
        end
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 277
        Width = 621
        Height = 100
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alBottom
        BevelOuter = bvRaised
        BevelKind = bkSoft
        TabOrder = 1
        object Image2: TImage
          Left = 2
          Top = 3
          Width = 65
          Height = 28
          AutoSize = True
          Center = True
          PopupMenu = PopupMenu2
          OnDblClick = Image2DblClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 272
        Align = alClient
        BevelOuter = bvNone
        Caption = 'View'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        ExplicitWidth = 617
        ExplicitHeight = 271
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 621
          Height = 272
          Align = alClient
          Center = True
          ExplicitLeft = 59
          ExplicitTop = 38
          ExplicitWidth = 163
          ExplicitHeight = 78
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Chars'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label2: TLabel
          Left = 17
          Top = 49
          Width = 31
          Height = 13
          Caption = 'Lines :'
        end
        object Label3: TLabel
          Left = 21
          Top = 18
          Width = 27
          Height = 13
          Caption = 'Cols :'
        end
        object Label4: TLabel
          Left = 104
          Top = 49
          Width = 10
          Height = 13
          Caption = '@'
        end
        object Label5: TLabel
          Left = 104
          Top = 17
          Width = 10
          Height = 13
          Caption = '@'
        end
        object Label6: TLabel
          Left = 167
          Top = 49
          Width = 27
          Height = 13
          Caption = 'pixels'
        end
        object Label7: TLabel
          Left = 167
          Top = 17
          Width = 27
          Height = 13
          Caption = 'pixels'
        end
        object Label8: TLabel
          Left = 215
          Top = 49
          Width = 68
          Height = 13
          Caption = 'Chars height :'
        end
        object Label9: TLabel
          Left = 219
          Top = 18
          Width = 64
          Height = 13
          Caption = 'Chars width :'
        end
        object lCharsH: TLabel
          Left = 335
          Top = 49
          Width = 27
          Height = 13
          Caption = 'pixels'
        end
        object lCharsW: TLabel
          Left = 335
          Top = 17
          Width = 27
          Height = 13
          Caption = 'pixels'
        end
        object lWarn: TLabel
          Left = 57
          Top = 73
          Width = 54
          Height = 13
          Caption = 'WARNING'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object eFontLines: TEdit
          Left = 57
          Top = 46
          Width = 41
          Height = 21
          TabStop = False
          TabOrder = 0
          Text = '6'
        end
        object eFontCols: TEdit
          Left = 57
          Top = 14
          Width = 41
          Height = 21
          TabStop = False
          TabOrder = 1
          Text = '10'
        end
        object Button2: TButton
          Left = 446
          Top = 17
          Width = 75
          Height = 25
          Caption = '&Go !'
          Default = True
          TabOrder = 2
          TabStop = False
          Visible = False
          OnClick = Button2Click
        end
        object eFontHeight: TEdit
          Left = 121
          Top = 46
          Width = 41
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
        end
        object eFontWidth: TEdit
          Left = 121
          Top = 14
          Width = 41
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
        end
        object eCharsWidth: TEdit
          Left = 289
          Top = 14
          Width = 41
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 5
        end
        object eCharsHeight: TEdit
          Left = 289
          Top = 46
          Width = 41
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 6
        end
      end
      object ListView1: TListView
        Left = 0
        Top = 97
        Width = 621
        Height = 368
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Columns = <>
        PopupMenu = PopupMenu1
        SmallImages = ImageList1
        TabOrder = 1
        ViewStyle = vsSmallIcon
        OnDblClick = ListView1DblClick
        ExplicitLeft = 2
        ExplicitTop = 95
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Bitmap (*.BMP)|*.bmp'
    Left = 46
    Top = 94
  end
  object PopupMenu1: TPopupMenu
    Left = 44
    Top = 241
    object View: TMenuItem
      Caption = 'View'
      OnClick = ViewClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Export1: TMenuItem
      Caption = 'Export'
      OnClick = Export1Click
    end
    object List1: TMenuItem
      Caption = 'List'
      object Arrange1: TMenuItem
        AutoCheck = True
        Caption = 'Arrange'
        Checked = True
        RadioItem = True
        OnClick = Arrange1Click
      end
      object Image3: TMenuItem
        AutoCheck = True
        Caption = 'Image'
        RadioItem = True
        OnClick = Image3Click
      end
    end
  end
  object ImageList1: TImageList
    DrawingStyle = dsTransparent
    Left = 46
    Top = 165
  end
  object PopupMenu2: TPopupMenu
    Left = 45
    Top = 314
    object View1: TMenuItem
      Caption = 'View'
      OnClick = View1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Save1: TMenuItem
      Caption = 'Save'
      OnClick = Save1Click
    end
  end
  object SaveDialog2: TSaveDialog
    Filter = 
      'Bitmap (*.BMP)|*.bmp|Jpg/Jpeg (*.JPG; *.JPEG)|*.jpg|Graphics Int' +
      'erchange Format (*.GIF)|*.gif|Portable Network Graphic (*.PNG)|*' +
      '.png'
    Left = 45
    Top = 384
  end
end
