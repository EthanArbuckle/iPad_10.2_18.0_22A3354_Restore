@implementation EXPivotTable

+ (id)edPivotTableFromXmlPivotTableElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CXNamespace *v10;
  CXNamespace *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;
  CXNamespace *v18;
  uint64_t v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  void *v23;
  CXNamespace *v24;
  uint64_t v25;
  void *v26;
  CXNamespace *v27;
  uint64_t v28;
  void *v29;
  CXNamespace *v30;
  uint64_t v31;
  void *v32;
  CXNamespace *v33;
  uint64_t v34;
  void *v35;
  CXNamespace *v36;
  uint64_t v37;
  void *v38;
  id v39;
  _BOOL4 v40;
  id v41;
  _BOOL4 v42;
  id v43;
  _BOOL4 v44;
  id v45;
  _BOOL4 v46;
  id v47;
  id v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDPivotTable pivotTableWithResources:](EDPivotTable, "pivotTableWithResources:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readLocationFrom:toPivotTable:", OCXFindChild(a3, v10, "location"), v9);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readStyleInfoFrom:toPivotTable:", OCXFindChild(a3, v11, "pivotTableStyleInfo"), v9);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = OCXFindChild(a3, v12, "pivotFields");
    objc_msgSend(v9, "pivotFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readPivotFieldsFrom:toCollection:state:", v13, v14, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v16 = OCXFindChild(a3, v15, "rowFields");
    objc_msgSend(v9, "rowFields");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFieldsFrom:toCollection:state:", v16, v17, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v19 = OCXFindChild(a3, v18, "rowItems");
    objc_msgSend(v9, "rowItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readItemsFrom:toCollection:state:", v19, v20, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(a3, v21, "colFields");
    objc_msgSend(v9, "columnFields");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFieldsFrom:toCollection:state:", v22, v23, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v25 = OCXFindChild(a3, v24, "colItems");
    objc_msgSend(v9, "columnItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readItemsFrom:toCollection:state:", v25, v26, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v28 = OCXFindChild(a3, v27, "pageFields");
    objc_msgSend(v9, "pageFields");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readPageFieldsFrom:toCollection:state:", v28, v29, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v31 = OCXFindChild(a3, v30, "dataFields");
    objc_msgSend(v9, "dataFields");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readDataFieldsFrom:toCollection:state:", v31, v32, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v34 = OCXFindChild(a3, v33, "conditionalFormats");
    objc_msgSend(v9, "conditionalFormats");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readConditionalFormatsFrom:toCollection:state:", v34, v35, v7);

    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v37 = OCXFindChild(a3, v36, "pivotAreas");
    objc_msgSend(v9, "pivotAreas");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readPivotAreasFrom:toCollection:state:", v37, v38, v7);

    v58 = 0;
    LODWORD(v36) = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"colHeaderCaption", &v58);
    v39 = v58;
    if ((_DWORD)v36)
      objc_msgSend(v9, "setColumnHeaderCaption:", v39);
    v57 = v39;
    v40 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"rowHeaderCaption", &v57);
    v41 = v57;

    if (v40)
      objc_msgSend(v9, "setRowHeaderCaption:", v41);
    v56 = v41;
    v42 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"pageStyleName", &v56);
    v43 = v56;

    if (v42)
      objc_msgSend(v9, "setPageStyleName:", v43);
    v55 = v43;
    v44 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"pivotTableStyle", &v55);
    v45 = v55;

    if (v44)
      objc_msgSend(v9, "setStyleName:", v45);
    v54 = v45;
    v46 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v54);
    v47 = v54;

    if (v46)
      objc_msgSend(v9, "setName:", v47);
    v53 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyNumberFormats", &v53))
      objc_msgSend(v9, "setApplyNumberFormats:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyBorderFormats", &v53))
      objc_msgSend(v9, "setApplyBorderFormats:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyFontFormats", &v53))
      objc_msgSend(v9, "setApplyFontFormats:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyPatternFormats", &v53))
      objc_msgSend(v9, "setApplyPatternFormats:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyAlignmentFormats", &v53))
      objc_msgSend(v9, "setApplyAlignmentFormats:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyWidthHeightFormats", &v53))
      objc_msgSend(v9, "setApplyWidthHeightFormats:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"colGrandTotals", &v53))
      objc_msgSend(v9, "setColGrandTotals:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"useAutoFormatting", &v53))
      objc_msgSend(v9, "setUseAutoFormatting:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rowGrandTotals", &v53))
      objc_msgSend(v9, "setRowGrandTotals:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"customListSort", &v53))
      objc_msgSend(v9, "setCustomListSort:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"compactData", &v53))
      objc_msgSend(v9, "setCompactData:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"compact", &v53))
      objc_msgSend(v9, "setCompact:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataCaption", &v53))
      objc_msgSend(v9, "setDataCaption:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataOnRows", &v53))
      objc_msgSend(v9, "setDataOnRows:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"mergeItem", &v53))
      objc_msgSend(v9, "setMergeItem:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"disableFieldList", &v53))
      objc_msgSend(v9, "setDisableFieldList:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"multipleFieldFilters", &v53))
      objc_msgSend(v9, "setMultipleFieldFilters:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outline", &v53))
      objc_msgSend(v9, "setOutline:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineData", &v53))
      objc_msgSend(v9, "setOutlineData:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"pageOverThenDown", &v53))
      objc_msgSend(v9, "setPageOverThenDown:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showCalcMbrs", &v53))
      objc_msgSend(v9, "setShowCalcMbrs:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showDataDropDown", &v53))
      objc_msgSend(v9, "setShowDataDropDown:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showDropZones", &v53))
      objc_msgSend(v9, "setShowDropZones:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showEmptyCol", &v53))
      objc_msgSend(v9, "setShowEmptyCol:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showEmptyRow", &v53))
      objc_msgSend(v9, "setShowEmptyRow:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showHeaders", &v53))
      objc_msgSend(v9, "setShowHeaders:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMemberPropertyTips", &v53))
      objc_msgSend(v9, "setShowMemberPropertyTips:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMultipleLabel", &v53))
      objc_msgSend(v9, "setShowMultipleLabel:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMissing", &v53))
      objc_msgSend(v9, "setShowMissing:", v53);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"subtotalHiddenItems", &v53))
      objc_msgSend(v9, "setSubtotalHiddenItems:", v53);
    v52 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"pageWrap", &v52))
      objc_msgSend(v9, "setPageWrap:", v52);
    v51 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"autoFormatId", &v51))
      objc_msgSend(v9, "setAutoFormatId:", v51);
    v50 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataPosition", &v50))
      objc_msgSend(v9, "setDataPosition:", v50);
    v48 = v9;

  }
  else
  {
    v48 = 0;
  }

  return v48;
}

+ (void)readLocationFrom:(_xmlNode *)a3 toPivotTable:(id)a4
{
  id v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  if (a3)
  {
    v14 = 0;
    v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v14);
    v7 = v14;
    if (v6)
    {
      +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPivotTableRange:", v8);

    }
    v13 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstHeaderRow", &v13))
      objc_msgSend(v5, "setFirstHeaderRow:", v13);
    v12 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstDataRow", &v12))
      objc_msgSend(v5, "setFirstDataRow:", v12);
    v11 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstDataCol", &v11))
      objc_msgSend(v5, "setFirstDataColumn:", v11);
    v10 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rowPageCount", &v10))
      objc_msgSend(v5, "setRowPageCount:", v10);
    v9 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"colPageCount", &v9))
      objc_msgSend(v5, "setColumnPageCount:", v9);

  }
}

+ (void)readStyleInfoFrom:(_xmlNode *)a3 toPivotTable:(id)a4
{
  id v5;
  _BOOL4 v6;
  id v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  id v13;

  v5 = a4;
  if (a3)
  {
    v13 = 0;
    v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v13);
    v7 = v13;
    if (v6)
      objc_msgSend(v5, "setStyleName:", v7);
    v12 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showLastColumn", &v12))
      objc_msgSend(v5, "setShowLastColumn:", v12);
    v11 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showRowStripes", &v11))
      objc_msgSend(v5, "setShowRowStripes:", v11);
    v10 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showColStripes", &v10))
      objc_msgSend(v5, "setShowColumnStripes:", v10);
    v9 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showRowHeaders", &v9))
      objc_msgSend(v5, "setShowRowHeaders:", v9);
    v8 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showColHeaders", &v8))
      objc_msgSend(v5, "setShowColumnHeaders:", v8);

  }
}

+ (int)edPivotFieldAxisFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("axisCol")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("axisPage")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("axisRow")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_9;
    }
LABEL_8:
    v5 = 3;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

+ (int)edPivotItemTypeFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("avg")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("blank")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("count")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("countA")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("data")) & 1) == 0)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("default")) & 1) != 0)
      {
        v5 = 5;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("grand")) & 1) != 0)
      {
        v5 = 6;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("max")) & 1) != 0)
      {
        v5 = 7;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("min")) & 1) != 0)
      {
        v5 = 8;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("product")) & 1) != 0)
      {
        v5 = 9;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("stdDev")) & 1) != 0)
      {
        v5 = 10;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("stdDevP")) & 1) != 0)
      {
        v5 = 11;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("sum")) & 1) != 0)
      {
        v5 = 12;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("var")) & 1) != 0)
      {
        v5 = 13;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("varP")) & 1) != 0)
      {
        v5 = 14;
        goto LABEL_12;
      }
    }
LABEL_11:
    v5 = 4;
    goto LABEL_12;
  }
  v5 = 0;
LABEL_12:

  return v5;
}

+ (int)edPivotDatFieldFormatFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_20;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("difference")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("index")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("normal")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("percent")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("percentDiff")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("percentOfCol")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("percentOfRow")) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("percentOfTotal")) & 1) != 0)
    {
      v5 = 7;
      goto LABEL_21;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("runTotal")) & 1) != 0)
    {
      v5 = 8;
      goto LABEL_21;
    }
LABEL_20:
    v5 = 9;
    goto LABEL_21;
  }
  v5 = 0;
LABEL_21:

  return v5;
}

+ (void)readFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "field");

    while (Child)
    {
      v14 = -1;
      if (CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", &v14))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      objc_msgSend(v9, "EXSpreadsheetMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"field");

    }
  }

}

+ (void)readItemsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *Child;
  void *v11;
  id v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *i;
  _xmlNode *v16;
  void *v17;
  CXNamespace *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  v19 = a1;
  v20 = a4;
  v7 = a5;
  v8 = v7;
  if (a3)
  {
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v9, "i");

    while (Child)
    {
      +[EDPivotItem pivotItem](EDPivotItem, "pivotItem", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      if (CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"r", &v24))
        objc_msgSend(v11, "setRepeatedItemCounts:", v24);
      v23 = 0;
      v21 = v11;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"t", &v23);
      v12 = v23;
      objc_msgSend(v11, "setType:", objc_msgSend(v19, "edPivotItemTypeFrom:", v12));
      objc_msgSend(v11, "itemIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "EXSpreadsheetMLNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      for (i = (_xmlNode *)OCXFindChild(Child, v14, "x"); ; i = OCXFindNextChild(v16, v14, (xmlChar *)"x"))
      {
        v16 = i;

        if (!v16)
          break;
        v22 = 0;
        CXOptionalLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"v", &v22);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v17);

        objc_msgSend(v8, "EXSpreadsheetMLNamespace");
        v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "addObject:", v21);
      objc_msgSend(v8, "EXSpreadsheetMLNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v18, (xmlChar *)"i");

    }
  }

}

+ (void)readPivotFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  void *v13;
  id v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;
  CXNamespace *v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  id v26;
  uint64_t v27;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v11, "pivotField");

    while (Child)
    {
      +[EDPivotField pivotField](EDPivotField, "pivotField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", &v27);
      objc_msgSend(v13, "setNumFmtId:", v27);
      v26 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"axis", &v26);
      v14 = v26;
      objc_msgSend(v13, "setAxis:", objc_msgSend(a1, "edPivotFieldAxisFrom:", v14));
      v25 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"compact", &v25);
      objc_msgSend(v13, "setCompact:", v25);
      v24 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataField", &v24);
      objc_msgSend(v13, "setDataField:", v24);
      v23 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"showDefaultSubTotal", &v23);
      objc_msgSend(v13, "setShowDefaultSubTotal:", v23);
      v22 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"insertBlankRow", &v22);
      objc_msgSend(v13, "setInsertBlankRow:", v22);
      v21 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"outline", &v21);
      objc_msgSend(v13, "setOutlineItems:", v21);
      v20 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"showAll", &v20);
      objc_msgSend(v13, "setShowAllItems:", v20);
      v19 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"subtotalTop", &v19);
      objc_msgSend(v13, "setSubtotalTop:", v19);
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v16 = OCXFindChild(Child, v15, "items");

      objc_msgSend(v13, "pivotFieldItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readFieldItemsFrom:toCollection:state:", v16, v17, v10);

      objc_msgSend(v8, "addObject:", v13);
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v18, (xmlChar *)"pivotField");

    }
  }

}

+ (void)readFieldItemsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  void *v13;
  id v14;
  CXNamespace *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v11, "item");

    while (Child)
    {
      +[EDPivotFieldItem pivotFieldItem](EDPivotFieldItem, "pivotFieldItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"c", &v23);
      objc_msgSend(v13, "setChildItems:", v23);
      v22 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"d", &v22);
      objc_msgSend(v13, "setExpanded:", v22);
      v21 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"f", &v21);
      objc_msgSend(v13, "setCalculatedMember:", v21);
      v20 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"m", &v20);
      objc_msgSend(v13, "setMissed:", v20);
      v19 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"s", &v19);
      objc_msgSend(v13, "setHidden:", v19);
      v18 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"sd", &v18);
      objc_msgSend(v13, "setDetailsHidden:", v18);
      v17 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", &v17);
      objc_msgSend(v13, "setItemIndex:", v17);
      v16 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"t", &v16);
      v14 = v16;
      objc_msgSend(v13, "setType:", objc_msgSend(a1, "edPivotItemTypeFrom:", v14));
      objc_msgSend(v8, "addObject:", v13);
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v15, (xmlChar *)"item");

    }
  }

}

+ (void)readDataFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  void *v13;
  id v14;
  id v15;
  CXNamespace *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v11, "dataField");

    while (Child)
    {
      +[EDPivotDataField pivotDataField](EDPivotDataField, "pivotDataField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseField", &v22);
      objc_msgSend(v13, "setBaseField:", v22);
      v21 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseItem", &v21);
      objc_msgSend(v13, "setBaseItem:", v21);
      v20 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"fId", &v20);
      objc_msgSend(v13, "setFieldId:", v20);
      v19 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", &v19);
      objc_msgSend(v13, "setNumFmtId:", v19);
      v18 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"name", &v18);
      v14 = v18;
      objc_msgSend(v13, "setName:", v14);
      v17 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"showDataAs", &v17);
      v15 = v17;
      objc_msgSend(v13, "setShowDataAs:", objc_msgSend(a1, "edPivotDatFieldFormatFrom:", v15));
      objc_msgSend(v8, "addObject:", v13);
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v16, (xmlChar *)"dataField");

    }
  }

}

+ (void)readConditionalFormatsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  void *v13;
  id v14;
  id v15;
  CXNamespace *v16;
  uint64_t v17;
  void *v18;
  CXNamespace *v19;
  id v20;
  id v21;
  uint64_t v22;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v11, "conditionalFormat");

    while (Child)
    {
      +[EDPivotConditionalFormat pivotConditionalFormat](EDPivotConditionalFormat, "pivotConditionalFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"priority", &v22);
      objc_msgSend(v13, "setPriority:", v22);
      v21 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"type", &v21);
      v14 = v21;
      objc_msgSend(v13, "setType:", objc_msgSend(a1, "edPivotConditionalFormatTypeFrom:", v14));
      v20 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"scope", &v20);
      v15 = v20;
      objc_msgSend(v13, "setScope:", objc_msgSend(a1, "edPivotConditionalFormatScopeFrom:", v15));
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v17 = OCXFindChild(Child, v16, "pivotAreas");

      objc_msgSend(v13, "pivotAreas");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readPivotAreasFrom:toCollection:state:", v17, v18, v10);

      objc_msgSend(v8, "addObject:", v13);
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v19, (xmlChar *)"conditionalFormat");

    }
  }

}

+ (void)readPivotAreasFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  void *v13;
  id v14;
  id v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  CXNamespace *v20;
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3)
  {
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v11, "pivotArea");

    while (Child)
    {
      +[EDPivotArea pivotArea](EDPivotArea, "pivotArea");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"grandCol", &v25);
      objc_msgSend(v13, "setGrandCol:", v25);
      v24 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"grandRow", &v24);
      objc_msgSend(v13, "setGrandRow:", v24);
      v23 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"outline", &v23);
      objc_msgSend(v13, "setOutline:", v23);
      v22 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"type", &v22);
      v14 = v22;
      objc_msgSend(v13, "setType:", objc_msgSend(a1, "edPivotAreaTypeFrom:", v14));
      v21 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"offset", &v21);
      v15 = v21;
      +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOffset:", v16);

      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v18 = OCXFindChild(Child, v17, "references");

      objc_msgSend(v13, "references");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readPivotAreaReferencesFrom:toCollection:state:", v18, v19, v10);

      objc_msgSend(v8, "addObject:", v13);
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v20, (xmlChar *)"pivotArea");

    }
  }

}

+ (void)readPivotAreaReferencesFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  void *v12;
  CXNamespace *v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "reference");

    while (Child)
    {
      +[EDPivotAreaReference pivotAreaReference](EDPivotAreaReference, "pivotAreaReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -1;
      CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fieldId", &v18);
      objc_msgSend(v12, "setFieldId:", v18);
      v17 = -1;
      CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"count", &v17);
      objc_msgSend(v12, "setCount:", v17);
      v16 = 0;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"byPosition", &v16);
      objc_msgSend(v12, "setByPosition:", v16);
      v15 = 0;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"relative", &v15);
      objc_msgSend(v12, "setRelative:", v15);
      v14 = 0;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"selected", &v14);
      objc_msgSend(v12, "setSelected:", v14);
      objc_msgSend(v7, "addObject:", v12);
      objc_msgSend(v9, "EXSpreadsheetMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"reference");

    }
  }

}

+ (void)readPageFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  void *v12;
  id v13;
  id v14;
  CXNamespace *v15;
  id v16;
  id v17;
  uint64_t v18;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "pageField");

    while (Child)
    {
      +[EDPivotPageField pivotPageField](EDPivotPageField, "pivotPageField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"fId", &v18);
      objc_msgSend(v12, "setFieldId:", v18);
      v17 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"name", &v17);
      v13 = v17;
      objc_msgSend(v12, "setName:", v13);
      v16 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"cap", &v16);
      v14 = v16;
      objc_msgSend(v12, "setCap:", v14);
      objc_msgSend(v7, "addObject:", v12);
      objc_msgSend(v9, "EXSpreadsheetMLNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v15, (xmlChar *)"pageField");

    }
  }

}

+ (int)edPivotConditionalFormatTypeFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("all")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("column")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_11;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_11;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("row")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_11;
    }
LABEL_10:
    v5 = 4;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

+ (int)edPivotConditionalFormatScopeFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("data")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("field")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("selection")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_9;
    }
LABEL_8:
    v5 = 3;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

+ (int)edPivotAreaTypeFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("all")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("button")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_10;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("data")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_10;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("none")) & 1) == 0)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("noraml")) & 1) != 0)
      {
        v5 = 4;
        goto LABEL_10;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("origin")) & 1) != 0)
      {
        v5 = 5;
        goto LABEL_10;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("topRight")) & 1) != 0
        || (objc_msgSend(v4, "isEqualToString:", CFSTR("topEnd")) & 1) != 0)
      {
        v5 = 6;
        goto LABEL_10;
      }
    }
LABEL_9:
    v5 = 3;
    goto LABEL_10;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

@end
