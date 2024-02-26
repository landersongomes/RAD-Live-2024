object CarregamentosResource1: TCarregamentosResource1
  Height = 375
  Width = 992
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 38
    Top = 20
  end
  object qryCOUNTRY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from COUNTRY'
      '{if !SORT}order by !SORT{fi}')
    Left = 163
    Top = 20
    MacroData = <
      item
        Value = Null
        Name = 'SORT'
      end>
  end
  object dsrCOUNTRY: TEMSDataSetResource
    AllowedActions = [List, Get, Post, Put, Delete]
    DataSet = qryCOUNTRY
    Left = 163
    Top = 80
  end
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\lande\Documents\Embarcadero\Studio\Projects\RA' +
        'D Live 2024\Server\database\KMTRANSPORTES.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=IB')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvCmdExecMode, rvDefaultStoreFormat, rvAutoReconnect]
    ResourceOptions.CmdExecMode = amNonBlocking
    ResourceOptions.DefaultStoreFormat = sfXML
    ResourceOptions.AutoReconnect = True
    Connected = True
    LoginPrompt = False
    Left = 416
    Top = 16
  end
  object FDQBases: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from bases')
    Left = 520
    Top = 24
  end
  object FDQEmpresas: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from empresas')
    Left = 816
    Top = 24
  end
  object FDQCarregamentos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from carregamentos')
    Left = 664
    Top = 24
  end
  object dsrBases: TEMSDataSetResource
    AllowedActions = [List, Get]
    DataSet = FDQBases
    Left = 520
    Top = 104
  end
  object dsrCarregamentos: TEMSDataSetResource
    AllowedActions = [List, Get, Post]
    DataSet = FDQCarregamentos
    Left = 664
    Top = 112
  end
  object dsrEmpresas: TEMSDataSetResource
    AllowedActions = [List, Get]
    DataSet = FDQEmpresas
    Left = 816
    Top = 104
  end
end
