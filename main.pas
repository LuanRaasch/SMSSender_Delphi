unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.ExtCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter;

type
  TmainForm = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    memoSMS: TMemo;
    edtMaskTelefone: TMaskEdit;
    btnClear: TBitBtn;
    btnEnviar: TBitBtn;
    GroupBox2: TGroupBox;
    memoRetorno: TMemo;
    Label3: TLabel;
    btnConsultar: TBitBtn;
    edtCodigo: TEdit;
    Label4: TLabel;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    procedure btnClearClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    procedure enviarSMS(telefone, mensagem : String);
    procedure consultarStatusSMS(id: String);
  const
    API_KEY: String = '4XIQLC87WV7E8SJ8XO10P4LB27LRWTFRMVK17QM8YSZ7U6GHB0KR7CC644HH5NZJRSFFJ6HWG08JB2TE75I35RYRZ2ICELSPKENEDXDS0SBIE5LCA0LAFXAQUYSYS9M1';
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;


implementation

{$R *.dfm}

procedure TmainForm.btnClearClick(Sender: TObject);
begin
  edtMaskTelefone.Clear;
  memoSMS.Clear;
end;

procedure TmainForm.btnConsultarClick(Sender: TObject);
var
  id: String;
begin
  id := edtCodigo.Text;
  consultarStatusSMS(id);
end;

procedure TmainForm.btnEnviarClick(Sender: TObject);
  var
  fone, sms : String;
begin
  //Verifica o preenchimento dos campos
  if edtMaskTelefone.text = EmptyStr then
    ShowMessage('Telefone n�o informado!')
  else if memoSMS.Text = EmptyStr then
    ShowMessage('Digite sua mensagem!')
  else
    begin
      //Tratamento de EXCE��ES
      try
        fone := edtMaskTelefone.Text;
        sms  := memoSMS.Text;

        enviarSMS(fone, sms);
        
        except on E: Exception do
          ShowMessage('Erro ao enviar SMS!' + e.Message);
      end;
    end;
end;

procedure TmainForm.enviarSMS(telefone, mensagem : String);
var
  json: String;
begin
  //Body do JSON
  json := '{ ' +
          '"key" : "' + API_KEY + '", ' +
          '"type" : 9, ' +
          '"number" : ' + telefone + ', ' +
          '"msg" : "' + mensagem + '" ' +             
          '}';
          
  //Atribui o JSON a REQUEST
  RESTRequest1.Params[0].Value := json;
  
  //Executa a REQUEST
  RESTRequest1.Execute;
  //ShowMessage(IntToStr(RESTResponse1.StatusCode));

  memoRetorno.Lines.Add(IntToStr(RESTResponse1.StatusCode));
  memoRetorno.Lines.Add(RESTResponse1.Content);


end;

procedure TmainForm.consultarStatusSMS(id: string);
var
  json: String;
begin
  //Body do JSON
  json := '{' +
          '"key" : "' + API_KEY + '",' +
          '"id" : [' + id + ']' +
          '}';
  //Atribui o JSON a REQUEST
  RESTRequest2.Params[0].Value := json;

  //Executa a REQUEST
  RESTRequest2.Execute;

  memoRetorno.Lines.Add(RESTResponse2.Content);
end;

end.
