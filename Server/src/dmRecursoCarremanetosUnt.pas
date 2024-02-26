unit dmRecursoCarremanetosUnt;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services,  EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  EMS.DataSetResource, EMS.ResourceAPI,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  [ResourceName('carregamentos')]
  TCarregamentosResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryCOUNTRY: TFDQuery;
    [ResourceSuffix('country')]
    dsrCOUNTRY: TEMSDataSetResource;

    // POC Structure Connection and Queries
    FDConn: TFDConnection;
    FDQBases: TFDQuery;
    FDQEmpresas: TFDQuery;
    FDQCarregamentos: TFDQuery;
    [ResourceSuffix('bases')]
    dsrBases: TEMSDataSetResource;
    [ResourceSuffix('volumes')]
    dsrCarregamentos: TEMSDataSetResource;
    [ResourceSuffix('empresas')]
    dsrEmpresas: TEMSDataSetResource;

  published
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Register;
begin
  RegisterResource(TypeInfo(TCarregamentosResource1));
end;

initialization
  Register;
end.


