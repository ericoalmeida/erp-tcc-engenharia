unit Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxRibbonCustomizationForm, dxBar,
  dxBarApplicationMenu,
  dxRibbon, cxClasses, dxStatusBar, dxRibbonStatusBar, dxGDIPlusClasses,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, cxImageList, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TFMainView = class(TForm)
    TbAdministration: TdxRibbonTab;
    RbMainMenu: TdxRibbon;
    StStatus: TdxRibbonStatusBar;
    BrManager: TdxBarManager;
    ApMainMenu: TdxBarApplicationMenu;
    ImLogo: TImage;
    BmCadastros: TdxBar;
    BtClient: TdxBarLargeButton;
    BtServices: TdxBarLargeButton;
    BtMachine: TdxBarLargeButton;
    BmAtalhos: TdxBar;
    BmRotinas: TdxBar;
    BtServicesProvision: TdxBarLargeButton;
    BtCost: TdxBarLargeButton;
    BmRelatorios: TdxBar;
    BtReportServicesProvision: TdxBarLargeButton;
    BtReportCost: TdxBarLargeButton;
    TmMainMenu: TTimer;
    BtTypeCost: TdxBarLargeButton;
    BmGeral: TdxBar;
    TbGeral: TdxRibbonTab;
    BtEmpresas: TdxBarLargeButton;
    BtUsuarios: TdxBarLargeButton;
    BtDistrict: TdxBarLargeButton;
    BtCity: TdxBarLargeButton;
    BtStates: TdxBarLargeButton;
    BtCountry: TdxBarLargeButton;
    BtFinanceOpr: TdxBarLargeButton;
    BtCashBook: TdxBarLargeButton;
    BtReportCashBook: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    procedure TmMainMenuTimer(Sender: TObject);
    procedure BtEmpresasClick(Sender: TObject);
    procedure BtCountryClick(Sender: TObject);
    procedure BtStatesClick(Sender: TObject);
    procedure BtCityClick(Sender: TObject);
    procedure BtDistrictClick(Sender: TObject);
    procedure BtUsuariosClick(Sender: TObject);
    procedure BtTypeCostClick(Sender: TObject);
    procedure BtMachineClick(Sender: TObject);
    procedure BtServicesClick(Sender: TObject);
    procedure BtFinanceOprClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainView: TFMainView;

implementation

{$R *.dfm}

uses Facade.Controller, Facade.View, Types.Views;

procedure TFMainView.BtEmpresasClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ManagmentFactoryView
      .showProgramOfListing(tpMNG0005AView)
      .&end;
end;

procedure TFMainView.BtFinanceOprClick(Sender: TObject);
begin
  TFacadeController.New
   .ModulesFacadeController
    .OrdemOfServiceController
     .serviceController
      .insert
       .companyId('{4FC5A103-F75F-43E9-AA50-E454DA804E20}')
       .description('GRADIAGEM')
       .measuredUnit('HR')
       .price('65')
       .status(0)
       .userId('{177524BA-A3DA-4ECC-BFA4-388A3A06DF9F}')
      .save;
end;

procedure TFMainView.BtMachineClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .assetsFactoryView
      .showProgramOfListing(tpASS0002AView)
      .&end;
end;

procedure TFMainView.BtDistrictClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ManagmentFactoryView
      .showProgramOfListing(tpMNG0001AView)
      .&end;
end;

procedure TFMainView.BtCityClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ManagmentFactoryView
      .showProgramOfListing(tpMNG0004AView)
      .&end;
end;

procedure TFMainView.BtServicesClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ordemOfService
      .showProgramOfListing(tpORD0001AView)
      .&end;
end;

procedure TFMainView.BtStatesClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ManagmentFactoryView
      .showProgramOfListing(tpMNG0003AView)
      .&end;
end;

procedure TFMainView.BtTypeCostClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .assetsFactoryView
      .showProgramOfListing(tpASS0001AView)
      .&end;
end;

procedure TFMainView.BtUsuariosClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ManagmentFactoryView
      .showProgramOfListing(tpMNG0006AView)
      .&end;
end;

procedure TFMainView.BtCountryClick(Sender: TObject);
begin
  TFacadeView.New
    .modulesFacadeView
     .ManagmentFactoryView
      .showProgramOfListing(tpMNG0002AView)
      .&end;
end;

procedure TFMainView.TmMainMenuTimer(Sender: TObject);
begin
  if Self.MDIChildCount <= 0 then
    RbMainMenu.ShowTabGroups := True
  else
    RbMainMenu.ShowTabGroups := False
end;

end.
