@implementation EXWorksheet

+ (id)edSheetWithState:(id)a3
{
  id v4;
  EDWorksheet *v5;
  void *v6;
  EDWorksheet *v7;
  void *v8;

  v4 = a3;
  v5 = [EDWorksheet alloc];
  objc_msgSend(v4, "workbook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDSheet initWithWorkbook:](v5, "initWithWorkbook:", v6);

  -[EDSheet processors](v7, "processors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setupProcessors:", v8);

  return v7;
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
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());

}

+ (void)readTables:(id)a3
{
  void *v3;
  void *v4;
  OCPPackagePart *v5;
  void *v6;
  void *v7;
  unsigned int i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _xmlDoc *v13;
  xmlNodePtr v14;
  xmlNodePtr v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  OCPPackagePart *v21;
  OCXState *v22;

  v22 = (OCXState *)a3;
  -[OCXState currentSheet](v22, "currentSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[OCXState currentPart](v22, "currentPart");
  v5 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
  OCXPartRelationshipsByTypeWithFallback(v5, v22, (objc_selector *)sel_OCXTableRelationshipType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[EXTableStyleTable readPredefinedTableStylesWithState:](EXTableStyleTable, "readPredefinedTableStylesWithState:", v22);
    -[OCPPackagePart package](v5, "package");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v5;
    if (!v7)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    for (i = 0; ; i = v9 + 1)
    {
      v9 = i;
      if (objc_msgSend(v6, "count", v21) <= (unint64_t)i)
        break;
      objc_msgSend(v6, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "partForLocation:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      v13 = (_xmlDoc *)objc_msgSend(v12, "xmlDocument");
      if (!v13)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      v14 = OCXGetRootElement(v13);
      v15 = v14;
      if (!v14
        || !xmlStrEqual(v14->name, (const xmlChar *)"table")
        || (-[OCXState EXSpreadsheetMLNamespace](v22, "EXSpreadsheetMLNamespace"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "containsNode:", v15),
            v16,
            (v17 & 1) == 0))
      {
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      }
      +[EXTable edTableFromXmlTableElement:state:](EXTable, "edTableFromXmlTableElement:state:", v15, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      objc_msgSend(v6, "objectAtIndex:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resetPartForLocation:", v20);

    }
    v5 = v21;
  }

}

+ (void)readOtherSheetComponentsWithState:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "readCommentTextFrom:");
  objc_msgSend(a1, "readPivotTables:", v4);

}

+ (void)readCommentTextFrom:(id)a3
{
  OCXState *v3;
  OCPPackagePart *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _xmlDoc *v10;
  xmlNodePtr v11;
  _xmlNode *v12;
  void *v13;
  char v14;
  id v15;
  CXNamespace *v16;
  _xmlNode *v17;
  CXNamespace *v18;
  _xmlNode *Child;
  void *v20;
  void *v21;
  CXNamespace *v22;
  CXNamespace *v23;
  _xmlNode *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  CXNamespace *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  CXNamespace *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  OCPPackagePart *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;

  v3 = (OCXState *)a3;
  -[OCXState currentPart](v3, "currentPart");
  v4 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
  OCXPartRelationshipsByTypeWithFallback(v4, v3, (objc_selector *)sel_OCXCommentsRelationshipType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[OCPPackagePart package](v4, "package");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partForLocation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v42 = v9;
      v10 = (_xmlDoc *)objc_msgSend(v9, "xmlDocument");
      if (v10)
      {
        v39 = v6;
        v41 = v4;
        v43 = v5;
        v11 = OCXGetRootElement(v10);
        v12 = v11;
        if (!v11
          || !xmlStrEqual(v11->name, (const xmlChar *)"comments")
          || (-[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "containsNode:", v12),
              v13,
              (v14 & 1) == 0))
        {
          +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage, v6);
        }
        v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace");
        v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v17 = (_xmlNode *)OCXFindChild(v12, v16, "authors");

        -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace");
        v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = (_xmlNode *)OCXFindChild(v17, v18, "author");

        while (Child)
        {
          +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", Child, v39);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[EDString edStringWithString:](EDString, "edStringWithString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            +[EDString string](EDString, "string");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v15, "addObject:", v21);
          -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace");
          v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          Child = OCXFindNextChild(Child, v22, (xmlChar *)"author");

        }
        -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace", v39);
        v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v24 = (_xmlNode *)OCXFindChild(v12, v23, "commentList");

        -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace");
        v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v26 = (_xmlNode *)OCXFindChild(v24, v25, "comment");

        while (v26)
        {
          v45 = 0;
          v27 = CXOptionalStringAttribute(v26, (void *)CXNoNamespace, (xmlChar *)"ref", &v45);
          v28 = v45;
          if (v27)
          {
            +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = 0;
          }
          v44 = 0;
          if (CXOptionalLongAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"authorId", &v44)
            && (v30 = v44, v30 < objc_msgSend(v15, "count")))
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", v44);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v29)
              goto LABEL_23;
          }
          else
          {
            v31 = 0;
            if (!v29)
LABEL_23:
              +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
          }
          -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace");
          v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v33 = OCXFindChild(v26, v32, "text");

          +[EDTextBox textBox](EDTextBox, "textBox");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[EXString edStringWithRunsFromXmlStringElement:state:](EXString, "edStringWithRunsFromXmlStringElement:state:", v33, v3);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setText:", v35);

          -[OCXState setTextBox:author:forReference:](v3, "setTextBox:author:forReference:", v34, v31, v29);
          -[OCXState EXSpreadsheetMLNamespace](v3, "EXSpreadsheetMLNamespace");
          v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v26 = OCXFindNextChild(v26, v36, (xmlChar *)"comment");

        }
        v9 = v42;
        v6 = v40;
        objc_msgSend(v43, "objectAtIndex:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "targetLocation");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "resetPartForLocation:", v38);

        v4 = v41;
        v5 = v43;
      }
    }

  }
}

+ (void)readPivotTables:(id)a3
{
  void *v3;
  void *v4;
  OCPPackagePart *v5;
  void *v6;
  void *v7;
  unsigned int i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _xmlDoc *v13;
  xmlNodePtr v14;
  xmlNodePtr v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  OCPPackagePart *v21;
  OCXState *v22;

  v22 = (OCXState *)a3;
  -[OCXState currentSheet](v22, "currentSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pivotTables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[OCXState currentPart](v22, "currentPart");
  v5 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
  OCXPartRelationshipsByTypeWithFallback(v5, v22, (objc_selector *)sel_OCXPivotTableRelationshipType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[EXTableStyleTable readPredefinedTableStylesWithState:](EXTableStyleTable, "readPredefinedTableStylesWithState:", v22);
    -[OCPPackagePart package](v5, "package");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    if (objc_msgSend(v6, "count", v5))
      -[OCXState reportWorksheetWarning:](v22, "reportWorksheetWarning:", ECPivotTables);
    for (i = 0; ; i = v9 + 1)
    {
      v9 = i;
      if (objc_msgSend(v6, "count") <= (unint64_t)i)
        break;
      objc_msgSend(v6, "objectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "partForLocation:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      v13 = (_xmlDoc *)objc_msgSend(v12, "xmlDocument");
      if (!v13)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      v14 = OCXGetRootElement(v13);
      v15 = v14;
      if (!v14
        || !xmlStrEqual(v14->name, (const xmlChar *)"pivotTableDefinition")
        || (-[OCXState EXSpreadsheetMLNamespace](v22, "EXSpreadsheetMLNamespace"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "containsNode:", v15),
            v16,
            (v17 & 1) == 0))
      {
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      }
      +[EXPivotTable edPivotTableFromXmlPivotTableElement:state:](EXPivotTable, "edPivotTableFromXmlPivotTableElement:state:", v15, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      objc_msgSend(v6, "objectAtIndex:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resetPartForLocation:", v20);

    }
    v5 = v21;
  }

}

+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  id v6;
  const xmlChar *v7;
  xmlNodePtr v8;
  xmlChar *Attribute;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a4;
  v7 = xmlTextReaderConstLocalName(a3);
  if (xmlStrEqual(v7, (const xmlChar *)"sheetData"))
  {
    +[EXRow readRowsFrom:state:](EXRow, "readRowsFrom:state:", a3, v6);
LABEL_3:
    v8 = 0;
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_3;
  v8 = xmlTextReaderExpand(a3);
LABEL_6:
  if (xmlStrEqual(v7, (const xmlChar *)"sheetViews"))
  {
    objc_msgSend(a1, "readWorksheetViewsFrom:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"sheetFormatPr"))
  {
    objc_msgSend(a1, "readWorksheetFormatPropertiesFrom:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"cols"))
  {
    objc_msgSend(a1, "readColumnInfosFrom:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"mergeCells"))
  {
    +[EXMergeTable readFrom:state:](EXMergeTable, "readFrom:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"conditionalFormatting"))
  {
    +[EXConditionalFormatting readFrom:x14:state:](EXConditionalFormatting, "readFrom:x14:state:", v8, 0, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"hyperlinks"))
  {
    objc_msgSend(a1, "readHyperlinksFrom:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"oleObjects"))
  {
    objc_msgSend(a1, "readOleObjectsFrom:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"dimension"))
  {
    Attribute = xmlTextReaderGetAttribute(a3, (const xmlChar *)"ref");
    objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:", Attribute);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Attribute);
    +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSheetDimension:", v11);

  }
  else
  {
    if (!xmlStrEqual(v7, (const xmlChar *)"extLst"))
    {
      v12 = 0;
      goto LABEL_25;
    }
    objc_msgSend(a1, "readSheetExtensions:state:", v8, v6);
  }
  v12 = 1;
LABEL_25:

  return v12;
}

+ (void)readWorksheetViewsFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *v8;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v8 = (_xmlNode *)OCXFindChild(a3, v7, "sheetView");

    if (v8)
    {
      objc_msgSend(v6, "currentSheet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "EXSpreadsheetMLNamespace");
      v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v11 = OCXFindChild(v8, v10, "pane");

      if (v11)
      {
        +[EXPane edPaneFromXMLPaneElement:](EXPane, "edPaneFromXMLPaneElement:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPane:", v12);

      }
      v19 = 1;
      if (CXOptionalBoolAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"showFormulas", &v19))
        objc_msgSend(v9, "setDisplayFormulas:", v19);
      v18 = 1;
      if (CXOptionalBoolAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"showGridLines", &v18))
        objc_msgSend(v9, "setDisplayGridlines:", v18);
      v17 = 1;
      CXOptionalBoolAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultGridColor", &v17);
      if (!v17)
      {
        v16 = 0;
        if (CXOptionalUnsignedLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"colorId", &v16))
        {
          v13 = v16;
          objc_msgSend(v6, "resources");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[EDColorReference colorReferenceWithColorIndex:resources:](EDColorReference, "colorReferenceWithColorIndex:resources:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDefaultGridlineColorReference:", v15);

        }
      }

    }
  }

}

+ (void)readWorksheetFormatPropertiesFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;

  v5 = a4;
  objc_msgSend(v5, "currentSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v13 = 0.0;
    if (!CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultColWidth", &v13))
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defColWidth", &v13);
    v7 = v13;
    if (v13 == 0.0)
    {
      v12 = 8.0;
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseColWidth", &v12);
      objc_msgSend(v5, "columnWidthConvertor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "xlColumnWidthFromXlBaseColumnWidth:", v12);
      v13 = v9;

      v7 = v13;
    }
    objc_msgSend(v6, "setDefaultColumnWidth:", v7);
    objc_msgSend(v5, "setDefaultColumnWidth:", v13);
    v12 = 15.0;
    if (!CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultRowHeight", &v12))
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defRowHeight", &v12);
    objc_msgSend(v6, "setDefaultRowHeight:", (int)(v12 * 20.0));
    objc_msgSend(v5, "setDefaultRowHeight:", v12 * 20.0);
    v11 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineLevelRow", &v11))
      objc_msgSend(v6, "setMaxRowOutlineLevel:", v11);
    v10 = 0;
    if (CXOptionalUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineLevelCol", &v10))
      objc_msgSend(v6, "setMaxColumnOutlineLevel:", v10);
  }

}

+ (void)readColumnInfosFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *Child;
  void *v9;
  CXNamespace *v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "currentSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(v11, "EXSpreadsheetMLNamespace");
    v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v7, "col");

    while (Child)
    {
      +[EXColumnInfo edColumnInfoFromXmlColumnInfoElement:state:](EXColumnInfo, "edColumnInfoFromXmlColumnInfoElement:state:", Child, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      objc_msgSend(v11, "EXSpreadsheetMLNamespace");
      v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v10, (xmlChar *)"col");

    }
  }

}

+ (void)readHyperlinksFrom:(_xmlNode *)a3 state:(id)a4
{
  CXNamespace *v5;
  _xmlNode *Child;
  void *v7;
  void *v8;
  void *v9;
  CXNamespace *v10;
  id v11;

  v11 = a4;
  if (a3)
  {
    objc_msgSend(v11, "EXSpreadsheetMLNamespace");
    v5 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v5, "hyperlink");

    if (Child)
    {
      v7 = 0;
      do
      {
        if (!v7)
        {
          objc_msgSend(v11, "currentSheet");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "hyperlinks");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        +[EXHyperlink edHyperlinkFromXmlHyperlinkElement:state:](EXHyperlink, "edHyperlinkFromXmlHyperlinkElement:state:", Child, v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

        objc_msgSend(v11, "EXSpreadsheetMLNamespace");
        v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v10, (xmlChar *)"hyperlink");

      }
      while (Child);

    }
  }

}

+ (void)readOleObjectsFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  _xmlNode *parent;
  CXNamespace *v7;
  CXNamespace *v8;
  _xmlNode *Child;
  int v10;
  uint64_t v11;
  OADOle *v12;
  OADOle *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  int v21;
  CXNamespace *v22;
  _xmlNode *v23;
  CXNamespace *v24;
  _xmlNode *v25;
  void *v26;
  EDTwoCellAnchor *v27;
  CXNamespace *v28;
  _xmlNode *v29;
  uint64_t v30;
  uint64_t v31;
  CXNamespace *v32;
  _xmlNode *v33;
  uint64_t v34;
  uint64_t v35;
  CXNamespace *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a4;
  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read OLE objects"), 1.0, 1.0);
  if (a3)
  {
    objc_msgSend(v40, "currentPart");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "package");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    parent = a3->parent;
    if (parent)
    {
      objc_msgSend(v40, "EXSpreadsheetMLNamespace");
      v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      OCXFindChild(parent, v7, "oleObjects");

    }
    objc_msgSend(v40, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v8, "oleObject");

    if (Child)
    {
      v10 = -1;
      v38 = v5;
      do
      {
        +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read OLE object"), 1.0, (double)ldexp(1.0, v10));
        CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"progId", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(OADOle);
        v13 = v12;
        if (v11)
          -[OADOle setAnsiProgID:](v12, "setAnsiProgID:", v11);
        CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"shapeId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)v11;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_x0000_s%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "oavState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "drawableForVmlShapeId:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v17;
          objc_msgSend(v18, "setOle:", v13);
        }
        else
        {
          v19 = objc_opt_class();
          TSUDynamicCast(v19, (uint64_t)v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "type");

          if (v21 != 75)
            goto LABEL_15;
          -[OADOle object](v13, "object");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_15:
        objc_msgSend(v40, "EXSpreadsheetMLNamespace");
        v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v23 = (_xmlNode *)OCXFindChild(Child, v22, "objectPr");

        if (v23)
        {
          objc_msgSend(v40, "EXSpreadsheetMLNamespace");
          v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v25 = (_xmlNode *)OCXFindChild(v23, v24, "anchor");

          if (v25)
          {
            objc_msgSend(v17, "clientData");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = objc_alloc_init(EDTwoCellAnchor);
              -[EDTwoCellAnchor setRelative:](v27, "setRelative:", 0);
              -[EDTwoCellAnchor setEditAs:](v27, "setEditAs:", 1);
              objc_msgSend(v40, "EXSpreadsheetMLNamespace");
              v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
              v29 = OCXFirstChild(v25, v28, (xmlChar *)"from");

              v30 = +[EXDrawing readAnchorMarkerFromNode:state:](EXDrawing, "readAnchorMarkerFromNode:state:", v29, v40);
              -[EDTwoCellAnchor setFrom:](v27, "setFrom:", v30, v31);
              objc_msgSend(v40, "EXSpreadsheetMLNamespace");
              v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
              v33 = OCXNextSibling(v29, v32, (xmlChar *)"to");

              v34 = +[EXDrawing readAnchorMarkerFromNode:state:](EXDrawing, "readAnchorMarkerFromNode:state:", v33, v40);
              -[EDTwoCellAnchor setTo:](v27, "setTo:", v34, v35);
              objc_msgSend(v26, "setAnchor:", v27);

            }
          }
        }
        +[TCProgressContext endStage](TCProgressContext, "endStage");

        v5 = v38;
        objc_msgSend(v40, "EXSpreadsheetMLNamespace");
        v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(a3, v36, (xmlChar *)"oleObject");

        --v10;
      }
      while (Child);
    }

  }
  +[TCProgressContext endStage](TCProgressContext, "endStage");

}

+ (void)readSheetExtensions:(_xmlNode *)a3 state:(id)a4
{
  _xmlNode *i;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(v9, "EXSpreadsheetMLNamespace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsNode:", i);

      if ((v8 & 1) != 0)
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"ext"))
          objc_msgSend(a1, "readSheetExtension:state:", i, v9);
      }
    }
  }

}

+ (void)readSheetExtension:(_xmlNode *)a3 state:(id)a4
{
  _xmlNode *i;
  id v6;

  v6 = a4;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && objc_msgSend((id)EXXL2010Namespace, "containsNode:", i))
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"sparklineGroups"))
      {
        objc_msgSend(v6, "reportWarning:", ECUnsupportedSparklines);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"conditionalFormattings"))
      {
        +[EXConditionalFormatting readConditionalFormattingsFrom:x14:state:](EXConditionalFormatting, "readConditionalFormattingsFrom:x14:state:", i, 1, v6);
      }
    }
  }

}

@end
