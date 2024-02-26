object dmComunicacao: TdmComunicacao
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://7bde-138-59-122-155.ngrok.io/conferencia'
    ContentType = 'application/json'
    Params = <>
    SynchronizedEvents = False
    Left = 112
    Top = 56
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyDF4700133A964C30BEC44808425B1B69'
        Value = '{'#13#10'    "ID": "-1",'#13#10'    "EMPRESA": "TRANPORTADORA C"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Resource = 'carregamentos/'
    Response = RESTResponseCarregamentos
    SynchronizedEvents = False
    Left = 256
    Top = 56
  end
  object RESTResponseCarregamentos: TRESTResponse
    Left = 456
    Top = 56
  end
end
