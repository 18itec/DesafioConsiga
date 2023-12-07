object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Desafio Delphi'
  ClientHeight = 500
  ClientWidth = 888
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PGControl: TPageControl
    Left = 0
    Top = 0
    Width = 888
    Height = 500
    ActivePage = TSItens
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object TSPedidos: TTabSheet
      Caption = 'Pedidos'
      object LblTitulo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 874
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 56
      end
      object GridPedidos: TDBGrid
        Left = 0
        Top = 25
        Width = 880
        Height = 263
        Align = alClient
        DataSource = DS
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GridItensDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'nped'
            Title.Caption = 'Nro. Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente'
            Title.Caption = 'Cliente'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Title.Caption = 'Endere'#231'o'
            Width = 270
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Title.Caption = 'Cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uf'
            Title.Caption = 'UF'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Caption = 'Valor'
            Width = 70
            Visible = True
          end>
      end
      object GBImpVendas: TGroupBox
        Left = 0
        Top = 329
        Width = 880
        Height = 143
        Align = alBottom
        Caption = 'Impress'#245'es de Venda'
        TabOrder = 1
        object RGCondPgto: TRadioGroup
          Left = 16
          Top = 16
          Width = 675
          Height = 105
          Caption = 'Condi'#231#245'es de Pagamento'
          Columns = 2
          Items.Strings = (
            'A vista Sem Desconto'
            'A visra com Desconto de 5%'
            'A vista com Desconto de 10%'
            'A vista com Desconto de (Informar %)'
            'Acrescimo de 10%'
            'Acrescimo de 12%'
            'Acrescimo de (Informar %)')
          TabOrder = 0
        end
        object GBPersonalizada: TGroupBox
          Left = 697
          Top = 16
          Width = 168
          Height = 73
          Caption = 'Condi'#231#245'es Personalizada'
          TabOrder = 1
          object LblPercentual: TLabel
            Left = 31
            Top = 32
            Width = 11
            Height = 13
            Caption = '%'
          end
          object EdtPercentPerson: TEdit
            Left = 48
            Top = 28
            Width = 81
            Height = 21
            NumbersOnly = True
            TabOrder = 0
            Text = '0'
          end
        end
        object BtnSimulaVda: TButton
          Left = 697
          Top = 95
          Width = 168
          Height = 25
          Caption = 'Simular Venda em Memo'
          TabOrder = 2
          OnClick = BtnSimulaVdaClick
        end
      end
      object PnlBotoes: TPanel
        Left = 0
        Top = 288
        Width = 880
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object BtnNovo: TButton
          Left = 169
          Top = 9
          Width = 170
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = BtnNovoClick
        end
        object BtnEditar: TButton
          Left = 345
          Top = 9
          Width = 170
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = BtnEditarClick
        end
        object BtnExcluir: TButton
          Left = 521
          Top = 10
          Width = 170
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = BtnExcluirClick
        end
      end
    end
    object TSItens: TTabSheet
      Caption = 'Itens'
      ImageIndex = 1
      object LblTituloIItens: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 874
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 56
      end
      object LblItens: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 133
        Width = 874
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 42
      end
      object LblLancItens: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 328
        Width = 874
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Lan'#231'amento de Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 171
      end
      object PnlCamposPed: TPanel
        Left = 0
        Top = 25
        Width = 880
        Height = 105
        Align = alTop
        BevelOuter = bvSpace
        TabOrder = 0
        object LblTitNunPed: TLabel
          Left = 33
          Top = 16
          Width = 53
          Height = 13
          Caption = 'Nro.Pedido'
        end
        object LblTitCliente: TLabel
          Left = 8
          Top = 43
          Width = 78
          Height = 13
          Caption = 'Nome do Cliente'
        end
        object LblTitEnd: TLabel
          Left = 41
          Top = 70
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object LblTitCidade: TLabel
          Left = 480
          Top = 70
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object LblTitUF: TLabel
          Left = 786
          Top = 70
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object DBEditNPed: TDBEdit
          Left = 92
          Top = 13
          Width = 121
          Height = 21
          DataField = 'nped'
          DataSource = DS
          Enabled = False
          TabOrder = 0
        end
        object DBEditCliente: TDBEdit
          Left = 92
          Top = 40
          Width = 778
          Height = 21
          DataField = 'cliente'
          DataSource = DS
          MaxLength = 150
          TabOrder = 1
        end
        object DBEditEnd: TDBEdit
          Left = 92
          Top = 67
          Width = 382
          Height = 21
          DataField = 'endereco'
          DataSource = DS
          MaxLength = 150
          TabOrder = 2
        end
        object DBEditUF: TDBEdit
          Left = 805
          Top = 67
          Width = 65
          Height = 21
          DataField = 'uf'
          DataSource = DS
          MaxLength = 2
          TabOrder = 4
        end
        object DBEditCidade: TDBEdit
          Left = 519
          Top = 67
          Width = 261
          Height = 21
          DataField = 'cidade'
          DataSource = DS
          MaxLength = 30
          TabOrder = 3
        end
      end
      object GridItens: TDBGrid
        Left = 0
        Top = 155
        Width = 880
        Height = 170
        Align = alTop
        DataSource = DSItem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GridItensDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'produto'
            Title.Caption = 'Produto'
            Width = 630
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtd'
            Title.Caption = 'Quantidade'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlrUnit'
            Title.Caption = 'Valor Unit.'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlrtotal'
            Title.Caption = 'Valor Total'
            Width = 70
            Visible = True
          end>
      end
      object PnlLancItens: TPanel
        Left = 0
        Top = 350
        Width = 880
        Height = 50
        Align = alTop
        BevelOuter = bvSpace
        TabOrder = 2
        object Label15: TLabel
          Left = 735
          Top = 15
          Width = 64
          Height = 13
          Caption = 'Valor Unit'#225'rio'
        end
        object LblTitQuant: TLabel
          Left = 488
          Top = 15
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object LblTitProduto: TLabel
          Left = 8
          Top = 15
          Width = 38
          Height = 13
          Caption = 'Produto'
        end
        object DBEditProduto: TDBEdit
          Left = 52
          Top = 11
          Width = 430
          Height = 21
          DataField = 'produto'
          DataSource = DSItem
          Enabled = False
          TabOrder = 0
        end
        object DBEditVlrUnit: TDBEdit
          Left = 805
          Top = 11
          Width = 65
          Height = 21
          DataField = 'vlrUnit'
          DataSource = DSItem
          Enabled = False
          TabOrder = 2
          OnChange = DBEditVlrUnitChange
        end
        object DBEditQtd: TDBEdit
          Left = 549
          Top = 11
          Width = 179
          Height = 21
          DataField = 'qtd'
          DataSource = DSItem
          Enabled = False
          TabOrder = 1
        end
      end
      object BtnNav: TDBNavigator
        AlignWithMargins = True
        Left = 325
        Top = 403
        Width = 230
        Height = 25
        Margins.Left = 325
        Margins.Right = 325
        DataSource = DSItem
        Align = alTop
        TabOrder = 3
        OnClick = BtnNavClick
      end
      object PnlBtnItens: TPanel
        Left = 0
        Top = 431
        Width = 880
        Height = 41
        Align = alClient
        TabOrder = 4
        object BtnCancPed: TButton
          Left = 570
          Top = 3
          Width = 146
          Height = 30
          Caption = 'Cancelar Pedido'
          TabOrder = 0
          OnClick = BtnCancPedClick
        end
        object BtnGravaPed: TButton
          Left = 722
          Top = 3
          Width = 148
          Height = 30
          Caption = 'Gravar Pedido'
          TabOrder = 1
          OnClick = BtnGravaPedClick
        end
      end
    end
  end
  object CDS: TClientDataSet
    PersistDataPacket.Data = {
      040400009619E0BD010000001800000006000D00000003000000D301046E7065
      640100490010000100055749445448020002000A0007636C69656E7465010049
      001000010005574944544802000200320008656E64657265636F010049001000
      010005574944544802000200C800066369646164650100490010000100055749
      4454480200020064000275660100490010000100055749445448020002000A00
      0576616C6F72080004001000000001000A4348414E47455F4C4F470400820045
      0000000100000000000000040000000100000000000000020000000200000000
      0000000400000002000000000000000200000003000000000000000400000003
      0000000000000002000000040000000000000004000000050000000000000004
      0000000400000000000000020000000500000000000000020000000600000000
      0000000400000006000000000000000200000007000000000000000400000008
      0000000700000008000000080000000000000002000000090000000000000004
      0000000900000000000000020000000A00000000000000040000000A00000000
      000000020000000B00000000000000040000000B00000000000000020000000C
      00000000000000040000000D0000000000000004000000060000033132330931
      3231313232313232093131323132313231320631323132313202313200000000
      0000000006000002373402313102313103313131023131000000000000000006
      0000033232320432323232043232323203323232023232000000000030714006
      0000033434340434343434053434343434033434340234340000000000307240
      0600000234320731313531353135053131353135043135353102353100000000
      0000184006000002353502353502353503353535023535000000000000344005
      000003333333043333333304333333330333333302333300000000000046400E
      0000033333331448454245522044412053494C56412043494E54490E53414F20
      5041554C4F2C2031323309415241C74154554241025350000000000000464006
      0000023735053534353435043435343404353434350235340000000000003640
      06000004343234351448656265722064612053696C76612043696E7469264176
      2E20416775696E616C646F204665726E616E646F20646F732053416E746F2C20
      3134333909417261E7617475626102535014AE47E17AE0754006000001310667
      68646A616806686A6B686A6B06686A6B686A6B02686A00000000000034400400
      0001310B48656265722043696E7469154176656E696461205061756C69737461
      2C2031323309417261E76174756261025350EC51B81E856B4E40040000013211
      7465737465206465206772617661E7E36F057465737465057465737465027370
      0000000000003440}
    Active = True
    Aggregates = <>
    FileName = 'C:\xampp\htdocs\portfolio\DesafioConsiga\db\db.xml'
    Params = <>
    Left = 684
    Top = 288
    object CDSnped: TStringField
      FieldName = 'nped'
      Size = 10
    end
    object CDScliente: TStringField
      FieldName = 'cliente'
      Size = 50
    end
    object CDSendereco: TStringField
      FieldName = 'endereco'
      Size = 200
    end
    object CDScidade: TStringField
      FieldName = 'cidade'
      Size = 100
    end
    object CDSuf: TStringField
      FieldName = 'uf'
      Size = 10
    end
    object CDSvalor: TFloatField
      FieldName = 'valor'
      DisplayFormat = '0.##'
    end
  end
  object DS: TDataSource
    DataSet = CDS
    Left = 716
    Top = 288
  end
  object CDSItem: TClientDataSet
    PersistDataPacket.Data = {
      410700009619E0BD010000001800000006001C00000003000000130305696470
      656404000100100000000A69645F636C69656E74650400010010000000077072
      6F6475746F010049001000010005574944544802000200640003717464080004
      001000000007766C72556E6974080004001000000008766C72746F74616C0800
      04001000000001000A4348414E47455F4C4F47040082009F0000000100000000
      0000000400000002000000000000000400000001000000000000000200000002
      0000000000000002000000030000000000000004000000040000000000000004
      0000000300000000000000020000000400000000000000020000000500000000
      0000000400000006000000000000000400000005000000000000000200000006
      0000000000000002000000070000000000000004000000080000000000000004
      0000000900000000000000040000000700000000000000020000000800000000
      000000020000000900000000000000020000000A00000000000000040000000B
      00000000000000040000000A00000000000000020000000B0000000000000002
      0000000C00000000000000040000000D00000000000000040000000D00000000
      000000020000000C00000000000000020000000E00000000000000040000000F
      00000000000000040000000E00000000000000020000000F0000000000000002
      0000001000000000000000040000001000000000000000020000001100000000
      0000000400000011000000000000000200000012000000000000000400000013
      0000000000000004000000140000000000000004000000120000000000000002
      0000001400000000000000020000001500000000000000040000001500000000
      0000000200000013000000000000000200000016000000000000000400000017
      0000000000000004000000180000000000000004000000160000000000000002
      0000001800000000000000020000001700000000000000020000001900000000
      000000040000001900000000000000020000001A00000000000000040000001B
      00000000000000040000001C00000000000000040000000604007B0000000574
      657374650000000000000040000000000000344000000000000044400604007B
      0000000861736461736461730000000000001840000000000000144000000000
      00003E400604004A0000000431323132000000000000F03F0000000000000040
      00000000000000400604004A000000033737370000000000C08B400000000000
      003640000000000014D3400604000400000001320000000000004C4000000000
      0000144000000000008071400604000400000001370000000000004D40000000
      000000144000000000002072400604005C110000013500000000000014400000
      00000000144000000000000039400604005C1100000339393900000000000020
      40000000000000204000000000000050400604005C1100000137000000000000
      1440000000000000204000000000000044400604002B02000003353535000000
      0000001440000000000000144000000000000039400604002B02000003343434
      0000000000001040000000000000104000000000000030400605000332323200
      0000000000004000000000000000400000000000001040060400DE0000000335
      35350000000000804B4000000000000014400000000000307140060400BC0100
      0003343434000000000000104000000000000010400000000000003040060400
      BC010000033535350000000000804B4000000000000014400000000000307140
      0604002A0000000770726F6475746F0000000000000040000000000000084000
      0000000000184006040037000000023130000000000000244000000000000000
      4000000000000034400604004D0100000970726F6475746F2031000000000000
      0040000000000000084000000000000018400604004D0100000770726F647574
      6F000000000000144000000000000018400000000000003E400604004D010000
      076D61697320756D000000000000104000000000000000400000000000002040
      0604004B0000000479797979000000000000F03F000000000000364000000000
      00003640060400951000000F50726F6475746F20746573746520310000000000
      00244000000000000029400000000000405F40060400951000001250726F6475
      746F205465737465205850544F00000000000028406666666666662640CDCCCC
      CCCCCC6040060400951000001B4D61697320756D2070726F6475746F20706172
      61205465737461720000000000000840F6285C8FC2353E40B81E85EB51A85640
      0604000100000005646164617300000000000024400000000000000040000000
      0000003440040400010000000C4E6F766F2050726F6475746F00000000000024
      4000000000000004400000000000003940040400010000000D4D657520697465
      6D206E6F766F0000000000001040EC51B81E85EB2140EC51B81E85EB41400404
      00020000000774657374652078000000000000F03F0000000000003440000000
      0000003440}
    Active = True
    Aggregates = <>
    FileName = 'C:\xampp\htdocs\portfolio\DesafioConsiga\db\dbListItem.xml'
    Params = <>
    Left = 788
    Top = 288
    object CDSItemidped: TIntegerField
      FieldName = 'idped'
    end
    object CDSItemproduto: TStringField
      FieldName = 'produto'
      Size = 100
    end
    object CDSItemqtd: TFloatField
      FieldName = 'qtd'
    end
    object CDSItemvlrUnit: TFloatField
      FieldName = 'vlrUnit'
      DisplayFormat = '0.##'
    end
    object CDSItemvlrtotal: TFloatField
      FieldName = 'vlrtotal'
      DisplayFormat = '0.##'
    end
  end
  object DSItem: TDataSource
    DataSet = CDSItem
    Left = 828
    Top = 288
  end
end
