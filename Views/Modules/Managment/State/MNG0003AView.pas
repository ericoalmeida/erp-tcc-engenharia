unit MNG0003AView;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseList.View, cxGraphics,
   cxLookAndFeels,
   cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinDevExpressDarkStyle,
   dxSkinDevExpressStyle,
   cxControls, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData,
   cxDataStorage,
   cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
   Data.DB, cxDBData,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
   FireDAC.Stan.Error, FireDAC.DatS,
   FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client, cxClasses,
   cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxGrid,
   cxTextEdit, cxLabel, Vcl.StdCtrls, cxButtons, RzLabel, dxGDIPlusClasses,
   Vcl.ExtCtrls, RzPanel,
   FireDAC.Stan.Async, FireDAC.DApt, Base.View.interf, dxSkinOffice2016Colorful,
   dxSkinOffice2016Dark,
   dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
   dxSkinOffice2007Silver,
   dxSkinDarkRoom, dxSkinDarkSide, System.ImageList, Vcl.ImgList, cxImageList;

type
   TFMNG0003AView = class(TFBaseListView, iBaseListView)
      FdQDataCODE: TStringField;
      FdQDataSTATEID: TIntegerField;
      FdQDataNAME: TStringField;
      FdQDataINITIALS: TStringField;
      FdQDataCOUNTRYID: TStringField;
      FdQDataCOUNTRYNAME: TStringField;
      FdQDataCREATEDAT: TSQLTimeStampField;
      FdQDataUPDATEDAT: TSQLTimeStampField;
      VwDadosSTATEID: TcxGridDBColumn;
      VwDadosNAME: TcxGridDBColumn;
      VwDadosINITIALS: TcxGridDBColumn;
      VwDadosCOUNTRYNAME: TcxGridDBColumn;
      VwDadosCREATEDAT: TcxGridDBColumn;
      VwDadosUPDATEDAT: TcxGridDBColumn;
      procedure FormShow(Sender: TObject);
      procedure TxBuscarPropertiesChange(Sender: TObject);
      procedure BtInsertClick(Sender: TObject);
      procedure BtUpdateClick(Sender: TObject);
      procedure BtShowClick(Sender: TObject);
      procedure BtDeleteClick(Sender: TObject);
      procedure BtDuplicateClick(Sender: TObject);
   private

   public
      class function new: iBaseListView;

      procedure insertRecord;
      procedure updateRecord;
      procedure showRecord;
      procedure deleteRecord;
      procedure duplicateRecord;

      procedure listRecords;

      procedure &end;
   end;

var
   FMNG0003AView: TFMNG0003AView;

implementation

{$R *.dfm}

uses Facade.View, Types.Views;

procedure TFMNG0003AView.BtDeleteClick(Sender: TObject);
begin
   inherited;

   { 1 } deleteRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0003AView.BtDuplicateClick(Sender: TObject);
begin
   inherited;

   { 1 } duplicateRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0003AView.BtInsertClick(Sender: TObject);
begin
   inherited;

   { 1 } insertRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0003AView.BtShowClick(Sender: TObject);
begin
   inherited;

   { 1 } showRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0003AView.BtUpdateClick(Sender: TObject);
begin
   inherited;

   { 1 } updateRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0003AView.deleteRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0003BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

procedure TFMNG0003AView.duplicateRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0003BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

procedure TFMNG0003AView.&end;
begin

   Show;
end;

procedure TFMNG0003AView.FormShow(Sender: TObject);
begin
   inherited;
   FFieldOrder := 'NAME';

   { 1 } listRecords;
   { 2 } totalRecords;
   { 3 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0003AView.insertRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0003BView).operation(FOperation).&end;
end;

procedure TFMNG0003AView.listRecords;
begin
   FdQData.Close();
   FdQData.Open();
end;

class function TFMNG0003AView.new: iBaseListView;
begin
   Result := Self.Create(nil);
end;

procedure TFMNG0003AView.showRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0003BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

procedure TFMNG0003AView.TxBuscarPropertiesChange(Sender: TObject);
begin
   inherited;

   filterRecords;
   totalRecords;
end;

procedure TFMNG0003AView.updateRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0003BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

end.
