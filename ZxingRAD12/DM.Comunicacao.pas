unit DM.Comunicacao;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TdmComunicacao = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponseCarregamentos: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarJSONCarregamento (ARequest: TRESTRequest; AEtiqueta: string; AEmpresa, ABase: integer): string;
    procedure ConfigurarConexaoCarregamento(AClient: TRESTClient; ARequest: TRESTRequest; ABody: string);

  end;

var
  dmComunicacao: TdmComunicacao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
uses
  System.JSON.Types,
  System.JSON.Writers;

{$R *.dfm}

{ TdmComunicacao }

CONST
  // NGROK const for Server Adrress
  NGROK = 'https://4783-177-131-189-154.ngrok-free.app/'  ;

procedure TdmComunicacao.ConfigurarConexaoCarregamento(AClient: TRESTClient; ARequest: TRESTRequest; ABody: string);
begin
  AClient.BaseURL := NGROK + 'carregamentos';
  ARequest.Method :=  rmPost;
  ARequest.Resource := 'volumes/' ;
  ARequest.Body.Add(ABody, DefaultRESTContentType.ctAPPLICATION_JSON);
end;

function TdmComunicacao.GerarJSONCarregamento(ARequest: TRESTRequest; AEtiqueta: string; AEmpresa, ABase: integer): string;
var
  Writer: TJsonTextWriter;
  StringWriter: TStringWriter;
begin
  Result := EmptyStr;
  ARequest.Body.ClearBody;

  ARequest.Body.JSONWriter.WriteStartObject;
  ARequest.Body.JSONWriter.WritePropertyName('ID');
  ARequest.Body.JSONWriter.WriteValue(-1);
  ARequest.Body.JSONWriter.WritePropertyName('ID_BASE');
  ARequest.Body.JSONWriter.WriteValue(ABase);
  ARequest.Body.JSONWriter.WritePropertyName('ETIQUETA');
  ARequest.Body.JSONWriter.WriteValue(AEtiqueta);
  ARequest.Body.JSONWriter.WritePropertyName('ID_EMPRESA');
  ARequest.Body.JSONWriter.WriteValue(3);
  ARequest.Body.JSONWriter.WritePropertyName('DATA');
  ARequest.Body.JSONWriter.WriteValue(FormatDateTime('dd/mm/yyyy', Now));
  ARequest.Body.JSONWriter.WritePropertyName('HORA');
  ARequest.Body.JSONWriter.WriteValue(FormatDateTime('HH:MM:SS', Now));
  ARequest.Body.JSONWriter.WriteEndObject;
  Result := ARequest.Body.JSONWriter.ToString;

{$region 'Modelo de JSON usado'}

{
    "ID": -1,
    "ID_BASE": 1,
    "DATA": "",
    "HORA": "",
    "ETIQUETA": "",
    "ID_EMPRESA": 1,
}

{$endregion}

end;

end.


