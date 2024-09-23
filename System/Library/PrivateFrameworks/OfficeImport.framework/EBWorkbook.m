@implementation EBWorkbook

+ (id)readWithState:(id)a3 reader:(id)a4
{
  id v6;
  EDWorkbook *v7;
  void *v8;
  EDWorkbook *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int SheetCount;
  void *v20;
  unint64_t v21;
  int v22;
  EDWorkbook *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  char *v32;
  void *v33;
  id v35;
  void (**v36)(XlPivotInfoTable *__hidden);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a3;
  v6 = a4;
  v7 = [EDWorkbook alloc];
  objc_msgSend(v6, "fileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EDWorkbook initWithFileName:andStringOptimization:](v7, "initWithFileName:andStringOptimization:", v8, objc_msgSend(v6, "useStringOptimization"));

  v10 = v35;
  -[OCDDocument setReader:](v9, "setReader:", v6);
  objc_msgSend(v6, "temporaryDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDWorkbook setTemporaryDirectory:](v9, "setTemporaryDirectory:", v11);

  -[EDWorkbook processors](v9, "processors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setupProcessors:", v12);

  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read workbook globals"), 10.0, 1.0);
  objc_msgSend(v35, "setWorkbook:", v9);
  -[EDWorkbook resources](v9, "resources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setResources:", v13);

  objc_msgSend(a1, "readDocumentProperties:state:", v9, v35);
  objc_msgSend(a1, "readDocumentPresentation:state:", v9, v35);
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  +[EBFontTable readWithState:](EBFontTable, "readWithState:", v35);
  +[EBContentFormatTable readWithState:](EBContentFormatTable, "readWithState:", v35);
  +[EBCellFormatTable readWithState:](EBCellFormatTable, "readWithState:", v35);
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 2.0);
  v36 = &off_24F3AFC18;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v14 = objc_msgSend(v35, "xlReader");
  (*(void (**)(uint64_t, void (***)(XlPivotInfoTable *__hidden)))(*(_QWORD *)v14 + 352))(v14, &v36);
  if (((v38 - v37) & 0x7FFFFFFF8) != 0)
    objc_msgSend(v35, "reportWarning:", ECPivotTables);
  +[EBColorTable readWithState:](EBColorTable, "readWithState:", v35);
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  objc_msgSend(v35, "readGlobalXlObjects");
  +[EBLinkTable readFromState:](EBLinkTable, "readFromState:", v35);
  +[EBNameTable readFromState:](EBNameTable, "readFromState:", v35);
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  +[EBStringTable readWithState:](EBStringTable, "readWithState:", v35);
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 3.0);
  if (*(int *)(objc_msgSend(v35, "xlReader") + 200) >= 1)
  {
    +[EBEscher readRootObjectWithType:state:](EBEscher, "readRootObjectWithType:state:", 1, v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v35, "oaState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABDrawingGroup readBlipsFromDrawingGroup:toDocument:state:](OABDrawingGroup, "readBlipsFromDrawingGroup:toDocument:state:", v15, v9, v16);

      -[OCDDocument theme](v9, "theme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "oaState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABDrawingGroup readGraphicalDefaultsFromDrawingGroup:toTheme:state:](OABDrawingGroup, "readGraphicalDefaultsFromDrawingGroup:toTheme:state:", v15, v17, v18);

    }
    v10 = v35;
  }
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  SheetCount = XlBinaryReader::getSheetCount((XlBinaryReader *)objc_msgSend(v10, "xlReader"));
  objc_msgSend(v6, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "readerDidStartDocument:withElementCount:", v9, SheetCount);
  if (SheetCount)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      if (objc_msgSend(v35, "isCancelled"))
        +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
      +[EBSheet readSheetWithIndex:state:](EBSheet, "readSheetWithIndex:state:", v21, v35);
      if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v23 = v9;
        -[EDWorkbook sheetAtIndex:](v9, "sheetAtIndex:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v6;
        v26 = objc_msgSend(v6, "isThumbnail");
        objc_msgSend(v35, "workbook");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 >= SheetCount - 1)
          v28 = 1;
        else
          v28 = v26;
        objc_msgSend(v20, "readerDidReadElement:atIndex:inDocument:isLastElement:", v24, v21, v27, v28);

        v22 |= objc_msgSend(v24, "isHidden") ^ 1;
        if ((v22 & 1) != 0 && (objc_msgSend(v25, "isThumbnail") & 1) != 0)
        {

          v6 = v25;
          v9 = v23;
          break;
        }

        v6 = v25;
        v9 = v23;
      }
      ++v21;
    }
    while (SheetCount != v21);
  }
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  v29 = objc_msgSend(v35, "xlReader");
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v29 + 88))(v29))
  {
    -[OCDDocument summary](v9, "summary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (_QWORD *)objc_msgSend(v35, "xlReader");
    if (v31)
      v32 = (char *)v31 + *(_QWORD *)(*v31 - 24);
    else
      v32 = 0;
    +[OCBSummary readSummary:reader:](OCBSummary, "readSummary:reader:", v30, v32);

    -[OCDDocument theme](v9, "theme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "validateTheme");

  }
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v20, "readerDidEndDocument:", v9);

  XlPivotInfoTable::~XlPivotInfoTable((XlPivotInfoTable *)&v36);
  return v9;
}

+ (void)setupProcessors:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());

}

+ (void)readDocumentProperties:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v17[8];
  __int16 v18;
  _BYTE v19[12];
  uint64_t v20;
  unsigned int v21;

  v5 = a3;
  v6 = a4;
  XlDocumentProperties::XlDocumentProperties((XlDocumentProperties *)v17);
  v7 = objc_msgSend(v6, "xlReader");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v7 + 152))(v7, v17);
  if (v18 == 1900)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v5, "setDateBase:", v8);
  objc_msgSend(v6, "oaState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "useXmlBlobs");

  if (v10)
  {
    v11 = v20;
    v12 = v21;
    objc_msgSend(v5, "theme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oaState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "xmlDrawingState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTheme readFromThemeData:themeDataSize:toTheme:xmlDrawingState:](OAXTheme, "readFromThemeData:themeDataSize:toTheme:xmlDrawingState:", v11, v12, v13, v15);

  }
  if (v19[10])
  {
    +[EBReference edReferenceFromXlRef:](EBReference, "edReferenceFromXlRef:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisibleRange:", v16);

  }
  XlDocumentProperties::~XlDocumentProperties((XlDocumentProperties *)v17);

}

+ (void)readDocumentPresentation:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  if (*(_BYTE *)(objc_msgSend(v6, "xlReader") + 1344))
  {
    objc_msgSend(v5, "setActiveSheetIndex:", 0);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = objc_msgSend(v6, "xlReader", &off_24F3AF328);
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 160))(v7, &v9);
    if (((v11 - v10) & 0x7FFFFFFF8) != 0)
    {
      v8 = XlConditionalFormatTable::at((XlConditionalFormatTable *)&v9, 0);
      if (v8)
        objc_msgSend(v5, "setActiveSheetIndex:", *(__int16 *)(v8 + 8));
    }
    XlDocumentPresentationTable::~XlDocumentPresentationTable((XlDocumentPresentationTable *)&v9);
  }

}

+ (void)createSheetNamesFromWorkbook:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  OcText v13;

  v3 = a3;
  v4 = operator new();
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  v5 = objc_msgSend(v3, "sheetCount");
  if (v5)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "sheetAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        OcText::OcText(&v13);
        objc_msgSend(v7, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "copyToOcText:", &v13);

        v10 = *(_QWORD *)(v4 + 8);
        if (v10 >= *(_QWORD *)(v4 + 16))
        {
          v11 = std::vector<OcText,ChAllocator<OcText>>::__push_back_slow_path<OcText const&>((uint64_t *)v4, &v13);
        }
        else
        {
          OcText::OcText(*(OcText **)(v4 + 8), &v13);
          v11 = v10 + 48;
          *(_QWORD *)(v4 + 8) = v10 + 48;
        }
        *(_QWORD *)(v4 + 8) = v11;
        OcText::~OcText(&v13);
      }

      ++v6;
    }
    while (v5 != v6);
  }

  return (void *)v4;
}

+ (int)xlSheetTypeEnumFromEDSheet:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
  }

  return v4;
}

@end
