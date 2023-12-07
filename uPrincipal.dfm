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
    ActivePage = TSPedidos
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    ExplicitTop = 1
    ExplicitHeight = 501
    object TSPedidos: TTabSheet
      Caption = 'Pedidos'
      ExplicitHeight = 473
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
        ExplicitTop = 330
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
          Caption = 'GBPersonalizada'
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
        ExplicitTop = 282
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
      Enabled = False
      ImageIndex = 1
      ExplicitHeight = 473
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
          OnExit = DBEditVlrUnitExit
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
        ExplicitHeight = 42
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
      AC0000009619E0BD010000001800000006000000000003000000AC00046E7065
      640100490010000100055749445448020002000A0007636C69656E7465010049
      001000010005574944544802000200320008656E64657265636F010049001000
      010005574944544802000200C800066369646164650100490010000100055749
      4454480200020064000275660100490010000100055749445448020002000A00
      0576616C6F7208000400100000000000}
    Active = True
    Aggregates = <>
    FileName = 'C:\xampp\htdocs\portfolio\DesafioConsiga\db\db.xml'
    Params = <>
    Left = 692
    Top = 200
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
    Left = 724
    Top = 200
  end
  object CDSItem: TClientDataSet
    PersistDataPacket.Data = {
      840000009619E0BD010000001800000006000000000003000000840005696470
      656404000100100000000A69645F636C69656E74650400010010000000077072
      6F6475746F010049001000010005574944544802000200640003717464080004
      001000000007766C72556E6974080004001000000008766C72746F74616C0800
      0400100000000000}
    Active = True
    Aggregates = <>
    FileName = 'C:\xampp\htdocs\portfolio\DesafioConsiga\db\dbListItem.xml'
    Params = <>
    Left = 780
    Top = 200
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
    Left = 836
    Top = 200
  end
end
