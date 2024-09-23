@implementation EXTable

+ (id)edTableFromXmlTableElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  EDTable *v6;
  void *v7;
  EDTable *v8;
  _BOOL4 v9;
  id v10;
  _BOOL4 v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  CXNamespace *v18;
  _xmlNode *Child;
  void *v20;
  CXNamespace *v21;
  CXNamespace *v22;
  void *v23;
  _xmlNode *v24;
  void *v25;
  CXNamespace *v26;
  _xmlNode *v27;
  void *v28;
  CXNamespace *v29;
  CXNamespace *v30;
  _xmlNode *v31;
  _BOOL4 v32;
  id v33;
  void *v35;
  id v36;
  id v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;

  v5 = a4;
  if (a3)
  {
    v6 = [EDTable alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDTable initWithResources:](v6, "initWithResources:", v7);

    v54 = 0;
    v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v54);
    v10 = v54;
    if (v9)
      -[EDTable setName:](v8, "setName:", v10);
    v37 = v10;
    v53 = 0;
    v11 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"displayName", &v53);
    v12 = v53;
    if (v11)
      -[EDTable setDisplayName:](v8, "setDisplayName:", v12);
    v35 = v12;
    v52 = 0;
    v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v52);
    v36 = v52;
    if (v13)
    {
      +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDTable setTableRange:](v8, "setTableRange:", v14);

    }
    v51 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowCount", &v51))
      -[EDTable setTotalsRowCount:](v8, "setTotalsRowCount:", v51);
    v50 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowCount", &v50))
      -[EDTable setHeaderRowCount:](v8, "setHeaderRowCount:", v50);
    v49 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowBorderDxfId", &v49))
      -[EDTable setHeaderRowBorderDxfIndex:](v8, "setHeaderRowBorderDxfIndex:", v49);
    v48 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataAreaBorderDxfId", &v48))
      -[EDTable setDataAreaBorderDxfIndex:](v8, "setDataAreaBorderDxfIndex:", v48);
    v47 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowBorderDxfId", &v47))
      -[EDTable setTotalsRowBorderDxfIndex:](v8, "setTotalsRowBorderDxfIndex:", v47);
    v46 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowDxfId", &v46))
      -[EDTable setHeaderRowDxfIndex:](v8, "setHeaderRowDxfIndex:", v46);
    v45 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataDxfId", &v45))
      -[EDTable setDataAreaDxfIndex:](v8, "setDataAreaDxfIndex:", v45);
    v44 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowDxfId", &v44))
      -[EDTable setTotalsRowDxfIndex:](v8, "setTotalsRowDxfIndex:", v44);
    v43 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tableBorderDxfId", &v43))
      -[EDTable setTableBorderDxfIndex:](v8, "setTableBorderDxfIndex:", v43);
    -[EDTable tableColumns](v8, "tableColumns");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = (_xmlNode *)OCXFindChild(a3, v16, "tableColumns");

    if (v17)
    {
      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = (_xmlNode *)OCXFindChild(v17, v18, "tableColumn");

      while (Child)
      {
        +[EXTableColumn edTableColumnFromXmlTableColumnElement:state:](EXTableColumn, "edTableColumnFromXmlTableColumnElement:state:", Child, v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

        objc_msgSend(v5, "EXSpreadsheetMLNamespace");
        v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v21, (xmlChar *)"tableColumn");

      }
    }
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v23 = v37;
    v24 = (_xmlNode *)OCXFindChild(a3, v22, "autoFilter");

    if (v24)
    {
      -[EDTable columnFilters](v8, "columnFilters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v27 = (_xmlNode *)OCXFindChild(v24, v26, "filterColumn");

      while (v27)
      {
        +[EXTableFilterColumn edTableFilterColumnFromXmlTableFilterColumnElement:state:](EXTableFilterColumn, "edTableFilterColumnFromXmlTableFilterColumnElement:state:", v27, v5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v28);

        objc_msgSend(v5, "EXSpreadsheetMLNamespace");
        v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v27 = OCXFindNextChild(v27, v29, (xmlChar *)"filterColumn");

      }
      v23 = v37;
    }
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v31 = (_xmlNode *)OCXFindChild(a3, v30, "tableStyleInfo");

    if (v31)
    {
      v42 = 0;
      v32 = CXOptionalStringAttribute(v31, (void *)CXNoNamespace, (xmlChar *)"name", &v42);
      v33 = v42;
      if (v32)
        -[EDTable setStyleName:](v8, "setStyleName:", v33);
      v41 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showFirstColumn", &v41))
        -[EDTable setShowFirstColumn:](v8, "setShowFirstColumn:", v41);
      v40 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showLastColumn", &v40))
        -[EDTable setShowLastColumn:](v8, "setShowLastColumn:", v40);
      v39 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showRowStripes", &v39))
        -[EDTable setShowRowStripes:](v8, "setShowRowStripes:", v39);
      v38 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showColumnStripes", &v38))
        -[EDTable setShowColumnStripes:](v8, "setShowColumnStripes:", v38);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
