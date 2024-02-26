program ZxingDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uMainForm in 'uMainForm.pas' {MainForm},
  uAudioManager in 'uAudioManager.pas',
  DM.Comunicacao in 'DM.Comunicacao.pas' {dmComunicacao: TDataModule};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TdmComunicacao, dmComunicacao);
  Application.Run;
end.
