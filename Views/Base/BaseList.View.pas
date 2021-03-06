unit BaseList.View;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.View, Vcl.StdCtrls, RzLabel,
   dxGDIPlusClasses,
   Vcl.ExtCtrls, RzPanel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
   Vcl.Menus, dxSkinsCore,
   dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, cxButtons, cxControls,
   cxStyles, cxCustomData,
   cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
   cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
   cxGridLevel,
   cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxGrid,
   Vcl.Mask, RzEdit, cxContainer, cxLabel, cxTextEdit, FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
   FireDAC.DApt.Intf,
   FireDAC.Comp.DataSet, FireDAC.Comp.Client,
   ormbr.container.DataSet.interfaces, Types.Controllers,
   FireDAC.Stan.Async, FireDAC.DApt, dxSkinOffice2016Colorful,
   dxSkinOffice2016Dark,
   dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
   dxSkinOffice2007Silver,
   dxSkinDarkRoom, dxSkinDarkSide, System.ImageList, Vcl.ImgList, cxImageList;

type
   TFBaseListView = class(TFBaseView)
      PnContent: TRzPanel;
      DbDados: TcxGrid;
      VwDados: TcxGridDBTableView;
      LvDados: TcxGridLevel;
      PnHeaderButtons: TRzPanel;
      PnGridHeader: TRzPanel;
      PnGridFooter: TRzPanel;
      LbTotalRegistros: TRzLabel;
      PnDuplicate: TRzPanel;
      BtDuplicate: TcxButton;
      PnDelete: TRzPanel;
      BtDelete: TcxButton;
      PnShow: TRzPanel;
      BtShow: TcxButton;
      PnUpdate: TRzPanel;
      BtUpdate: TcxButton;
      PnInsert: TRzPanel;
      BtInsert: TcxButton;
      PnGrid: TRzPanel;
      LbBuscar: TcxLabel;
      StGridStyles: TcxStyleRepository;
      StHeader: TcxStyle;
      RzOptionShow: TRzPanel;
      BtOptionShow: TcxButton;
      TxBuscar: TcxTextEdit;
      FdData: TFDMemTable;
      DsData: TDataSource;
      stContentOdd: TcxStyle;
      stContentEven: TcxStyle;
      StInactive: TcxStyle;
      StSelection: TcxStyle;
      FdQData: TFDQuery;
      StIndicator: TcxStyle;
      IlImages: TcxImageList;
      StDefaultColumn: TcxStyle;
      StColumnSelected: TcxStyle;
      StHeaderColumnSelected: TcxStyle;
      StDefaultHeaderColumn: TcxStyle;
      procedure BtInsertClick(Sender: TObject);
      procedure BtUpdateClick(Sender: TObject);
      procedure BtShowClick(Sender: TObject);
      procedure BtDeleteClick(Sender: TObject);
      procedure BtDuplicateClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure VwDadosCustomDrawCell(Sender: TcxCustomGridTableView;
        ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
        var ADone: Boolean);
      procedure VwDadosColumnHeaderClick(Sender: TcxGridTableView;
        AColumn: TcxGridColumn);
   private
   protected
      FColumnStatus: TcxGridColumn;
      FOperation: TTypeOperation;

      procedure filterRecords;
      procedure totalRecords;

      procedure disableButtonsWhenfdQDataEmpty;
      procedure disableButtonsWhenfdDataEmpty;
   public
   end;

var
   FBaseListView: TFBaseListView;

implementation

{$R *.dfm}
{ TFBaseListView }

procedure TFBaseListView.BtDeleteClick(Sender: TObject);
begin
   inherited;
   FOperation := toDelete;
end;

procedure TFBaseListView.BtDuplicateClick(Sender: TObject);
begin
   inherited;
   FOperation := toDuplicate;
end;

procedure TFBaseListView.BtInsertClick(Sender: TObject);
begin
   inherited;
   FOperation := toInsert;
end;

procedure TFBaseListView.BtShowClick(Sender: TObject);
begin
   inherited;
   FOperation := toShow;
end;

procedure TFBaseListView.BtUpdateClick(Sender: TObject);
begin
   inherited;
   FOperation := toUpdate;
end;

procedure TFBaseListView.disableButtonsWhenfdDataEmpty;
begin
   BtUpdate.Enabled := not(FdData.IsEmpty);
   BtShow.Enabled := not(FdData.IsEmpty);
   BtDelete.Enabled := not(FdData.IsEmpty);
   BtDuplicate.Enabled := not(FdData.IsEmpty);
end;

procedure TFBaseListView.disableButtonsWhenfdQDataEmpty;
begin
   BtUpdate.Enabled := not(FdQData.IsEmpty);
   BtShow.Enabled := not(FdQData.IsEmpty);
   BtDelete.Enabled := not(FdQData.IsEmpty);
   BtDuplicate.Enabled := not(FdQData.IsEmpty);
end;

procedure TFBaseListView.filterRecords;
begin
   DsData.DataSet.Filtered := False;

   if not(TxBuscar.Text = EmptyStr) and not(FFieldOrder = EmptyStr) then
   begin
      DsData.DataSet.Filter := UpperCase(FFieldOrder) + ' like ''%' +
        AnsiUpperCase(TxBuscar.Text) + '%''';

      DsData.DataSet.Filtered := True;
   end;
end;

procedure TFBaseListView.FormCreate(Sender: TObject);
begin
   inherited;
   FdQData.Connection := FFdConnection;
end;

procedure TFBaseListView.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if Key = VK_ESCAPE then
      Close;
end;

procedure TFBaseListView.totalRecords;
begin
   FTotalRecords := DsData.DataSet.RecordCount;
   FRecordShow := FUtils.iff(DsData.DataSet.IsEmpty, 0, 1);

   LbTotalRegistros.Caption := Format('Mostrando de %d at� %d de %d registros',
     [FRecordShow, FTotalRecords, FTotalRecords]);
end;

procedure TFBaseListView.VwDadosColumnHeaderClick(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
var
   I: Integer;
begin
   inherited;
   FFieldOrder := prepareStringOrderField(AColumn.Name);

   for I := 0 to Pred(VwDados.ColumnCount) do
   begin
      VwDados.Columns[I].Styles.Header := StDefaultHeaderColumn;
      VwDados.Columns[I].Styles.Content := StDefaultColumn;
   end;

   AColumn.Styles.Header := StHeaderColumnSelected;
   AColumn.Styles.Content := StColumnSelected;
end;

procedure TFBaseListView.VwDadosCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
   inherited;

   try
      if (AViewInfo.GridRecord.Values[FColumnStatus.Index] = 1) then
      begin
         ACanvas.Font.Style := [fsStrikeOut];
         ACanvas.Font.Color := $009F9A7D;
      end;
   except
      on E: Exception do
   end;
end;

end.
