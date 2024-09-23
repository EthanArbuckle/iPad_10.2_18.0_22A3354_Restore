@implementation EBWorksheet

+ (void)readWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WORD v13[6];
  int v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  unsigned __int16 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;

  v4 = a3;
  objc_msgSend(v4, "edSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "processors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setupProcessors:", v6);

    XlWorksheetProperties::XlWorksheetProperties((XlWorksheetProperties *)v13);
    v7 = objc_msgSend(v4, "xlReader");
    (*(void (**)(uint64_t, _WORD *))(*(_QWORD *)v7 + 376))(v7, v13);
    if (v14 == -1)
    {
      objc_msgSend(v4, "readerState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "columnWidthConvertor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v10) = v13[4];
      objc_msgSend(v9, "xlColumnWidthFromXlBaseColumnWidth:", (double)v10);
      objc_msgSend(v5, "setDefaultColumnWidth:");

    }
    else
    {
      objc_msgSend(v5, "setDefaultColumnWidth:", (double)v14 * 0.00390625);
    }
    objc_msgSend(v5, "setDefaultRowHeight:", v15);
    objc_msgSend(v5, "setFitToPage:", v19);
    if (v16)
      v11 = v16 - 1;
    else
      v11 = 0;
    objc_msgSend(v5, "setMaxRowOutlineLevel:", v11);
    if (v17)
      v12 = v17 - 1;
    else
      v12 = 0;
    objc_msgSend(v5, "setMaxColumnOutlineLevel:", v12);
    objc_msgSend(v5, "setIsDialogSheet:", v18);
    XlWorksheetProperties::~XlWorksheetProperties((XlWorksheetProperties *)v13);
  }

}

+ (void)setupProcessors:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());

}

+ (void)readChildrenWithState:(id)a3
{
  id v4;

  v4 = a3;
  +[EBColumnTable readWithState:](EBColumnTable, "readWithState:");
  +[EBRowBlocks readWithState:](EBRowBlocks, "readWithState:", v4);
  +[EBGraphic readGraphicsWithState:](EBGraphic, "readGraphicsWithState:", v4);
  objc_msgSend(a1, "readSheetPresentationInfoWithState:", v4);
  +[EBMergeTable readWithState:](EBMergeTable, "readWithState:", v4);
  +[EBConditionalFormatTable readWithState:](EBConditionalFormatTable, "readWithState:", v4);
  +[EBHyperlinkTable readWithState:](EBHyperlinkTable, "readWithState:", v4);

}

+ (void)readSheetPresentationInfoWithState:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE v12[8];
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  XlSheetPresentationTable::XlSheetPresentationTable((XlSheetPresentationTable *)v12);
  v4 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v4 + 384))(v4, v12);
  if (((v14 - v13) & 0x7FFFFFFF8) != 0)
  {
    v5 = XlConditionalFormatTable::at((XlConditionalFormatTable *)v12, 0);
    v6 = v5;
    if (v5)
    {
      v7 = *(_QWORD *)(v5 + 8);
      if (v7)
      {
        objc_msgSend(v3, "edSheet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[EBPane readXlPaneFrom:state:](EBPane, "readXlPaneFrom:state:", v6, v3);
        objc_msgSend(v8, "setDisplayFormulas:", *(unsigned __int8 *)(v7 + 24));
        objc_msgSend(v8, "setDisplayGridlines:", *(unsigned __int8 *)(v7 + 25));
        v9 = *(unsigned int *)(v7 + 16);
        if (+[EDColorsCollection isSystemColorId:](EDColorsCollection, "isSystemColorId:", (int)v9))
        {
          if (+[EDColorsCollection systemColorIdFromIndex:](EDColorsCollection, "systemColorIdFromIndex:", (int)v9))
          {
            v9 = v9;
          }
          else
          {
            v9 = 64;
          }
        }
        objc_msgSend(v3, "resources");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDefaultGridlineColorReference:", v11);

      }
    }
  }
  XlSheetPresentationTable::~XlSheetPresentationTable((XlSheetPresentationTable *)v12);

}

@end
