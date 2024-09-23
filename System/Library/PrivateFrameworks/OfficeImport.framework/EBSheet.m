@implementation EBSheet

+ (void)readSheetWithIndex:(unsigned int)a3 state:(id)a4
{
  uint64_t v4;
  XlSheetInfoTable *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  EBSheetContext *v16;
  void *v17;
  id v18;

  v4 = *(_QWORD *)&a3;
  v18 = a4;
  v6 = (XlSheetInfoTable *)objc_msgSend(v18, "xlSheetInfoTable");
  v7 = (objc_class *)objc_msgSend(a1, "edSheetClassFromXlSheetTypeEnum:", XlSheetInfoTable::getSheetType(v6, v4));
  if (v7)
  {
    v8 = *((_QWORD *)v6 + 1);
    if (((unint64_t)(*((_QWORD *)v6 + 2) - v8) >> 3) <= v4)
      std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
    v9 = *(_QWORD *)(v8 + 8 * v4);
    v10 = [v7 alloc];
    objc_msgSend(v18, "workbook");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithWorkbook:", v11);

    v13 = *(_QWORD *)(v9 + 16);
    objc_msgSend(v18, "resources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setName:", v15);

    objc_msgSend(v12, "setHidden:", XlSheetInfoTable::getSheetHiddenState(v6, v4) != 0);
    v16 = -[EBSheetContext initWithSheetIndex:state:]([EBSheetContext alloc], "initWithSheetIndex:state:", v4, v18);
    objc_msgSend(v12, "setDelayedContext:", v16);
    objc_msgSend(v18, "workbook");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSheet:", v12);

  }
}

+ (Class)edSheetClassFromXlSheetTypeEnum:(int)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (void)readDelayedSheetWithIndex:(unsigned int)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _WORD v12[5];
  char v13;

  v6 = a4;
  XlBinaryReader::setSheet((_DWORD *)objc_msgSend(v6, "xlReader"), a3);
  objc_msgSend(v6, "readerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  XlFormulaProcessor::clearBaseFormulas((XlFormulaProcessor *)objc_msgSend(v7, "xlFormulaProcessor"));

  objc_msgSend(v6, "edSheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "ebSheetClassFromEDSheet:", v8);

  objc_msgSend(v9, "readWithState:", v6);
  +[EBPageProperties readWithState:](EBPageProperties, "readWithState:", v6);
  objc_msgSend(v9, "readChildrenWithState:", v6);
  XlWorksheetProtection::XlWorksheetProtection((XlWorksheetProtection *)v12);
  v10 = objc_msgSend(v6, "xlReader");
  (*(void (**)(uint64_t, _WORD *))(*(_QWORD *)v10 + 520))(v10, v12);
  if (v12[4] || v13)
  {
    objc_msgSend(v6, "readerState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportWarning:", ECPasswordProtectedSheet);

  }
}

+ (Class)ebSheetClassFromEDSheet:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

@end
