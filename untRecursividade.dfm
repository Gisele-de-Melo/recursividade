object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Recursividade'
  ClientHeight = 354
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblDirectory: TLabel
    Left = 8
    Top = 8
    Width = 96
    Height = 15
    Caption = 'Caminho da Pasta'
  end
  object edtDirectory: TEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 23
    TabOrder = 0
  end
  object btnListFiles: TButton
    Left = 199
    Top = 23
    Width = 105
    Height = 25
    Caption = 'Listar Arquivos'
    TabOrder = 1
    OnClick = btnListFilesClick
  end
  object memoFiles: TMemo
    Left = 8
    Top = 54
    Width = 296
    Height = 291
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
