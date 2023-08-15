object mainForm: TmainForm
  Left = 0
  Top = 0
  Caption = 'SMS Sender'
  ClientHeight = 450
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 450
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 677
      Height = 153
      Align = alTop
      Caption = 'Dados SMS'
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label2: TLabel
        Left = 295
        Top = 24
        Width = 20
        Height = 13
        Caption = 'SMS'
      end
      object edtMaskTelefone: TMaskEdit
        Left = 16
        Top = 43
        Width = 253
        Height = 21
        Hint = 'Insira aqui o n'#250'mero de telefone a ser enviado o SMS.'
        EditMask = '(99)99999-9999;0;_'
        MaxLength = 14
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = ''
        TextHint = 'Telefone'
      end
      object btnClear: TBitBtn
        Left = 16
        Top = 104
        Width = 121
        Height = 32
        Caption = '&LIMPAR'
        TabOrder = 1
        OnClick = btnClearClick
      end
      object btnEnviar: TBitBtn
        Left = 148
        Top = 104
        Width = 121
        Height = 32
        Caption = '&ENVIAR'
        TabOrder = 2
        OnClick = btnEnviarClick
      end
    end
    object memoSMS: TMemo
      Left = 296
      Top = 44
      Width = 361
      Height = 93
      MaxLength = 128
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 154
      Width = 677
      Height = 295
      Align = alClient
      TabOrder = 2
      ExplicitTop = 160
      object Label3: TLabel
        Left = 16
        Top = 10
        Width = 39
        Height = 13
        Caption = 'Retorno'
      end
      object Label4: TLabel
        Left = 16
        Top = 248
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object memoRetorno: TMemo
        Left = 16
        Top = 29
        Width = 640
        Height = 213
        Lines.Strings = (
          '')
        TabOrder = 0
      end
      object btnConsultar: TBitBtn
        Left = 535
        Top = 253
        Width = 121
        Height = 32
        Hint = 'Insira o ID da mensagem para consultar o STATUS'
        Caption = '&CONSULTAR'
        TabOrder = 1
        OnClick = btnConsultarClick
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 264
        Width = 513
        Height = 21
        Hint = 'Insira o ID da mensagem para consultar o STATUS'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://api.smsempresa.com.br/v1/send'
    Params = <>
    Left = 344
    Top = 64
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body427353CF24834609B7FB2F40EB09D705'
        Value = 
          '{'#13#10'        "key" : "4XIQLC87WV7E8SJ8XO10P4LB27LRWTFRMVK17QM8YSZ7' +
          'U6GHB0KR7CC644HH5NZJRSFFJ6HWG08JB2TE75I35RYRZ2ICELSPKENEDXDS0SBI' +
          'E5LCA0LAFXAQUYSYS9M1",'#13#10'        "type" : 9,'#13#10'        "number" : ' +
          '45998440549,'#13#10'        "msg" : "Teste de envio 1"'#13#10'    }'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    Left = 448
    Top = 64
  end
  object RESTResponse1: TRESTResponse
    Left = 560
    Top = 64
  end
  object RESTClient2: TRESTClient
    BaseURL = 'https://api.smsempresa.com.br/v1/dlr'
    Params = <>
    Left = 88
    Top = 232
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body79BB86DF3BB443AEA2B246C5F559D409'
        Value = 
          '{'#13#10'    "key" : "4XIQLC87WV7E8SJ8XO10P4LB27LRWTFRMVK17QM8YSZ7U6GH' +
          'B0KR7CC644HH5NZJRSFFJ6HWG08JB2TE75I35RYRZ2ICELSPKENEDXDS0SBIE5LC' +
          'A0LAFXAQUYSYS9M1",'#13#10'    "id" : [3085011055]'#13#10'}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse2
    Left = 192
    Top = 232
  end
  object RESTResponse2: TRESTResponse
    Left = 296
    Top = 232
  end
end
