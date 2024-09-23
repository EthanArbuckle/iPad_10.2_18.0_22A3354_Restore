@implementation EXTableStyleTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *Child;
  void *v11;
  CXNamespace *v12;
  _BOOL4 v13;
  id v14;
  _BOOL4 v15;
  id v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableStyles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "EXSpreadsheetMLNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v9, "tableStyle");

    while (Child)
    {
      +[EXTableStyle edTableStyleFromXmlTableStyleElement:state:](EXTableStyle, "edTableStyleFromXmlTableStyleElement:state:", Child, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      objc_msgSend(v6, "EXSpreadsheetMLNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v12, (xmlChar *)"tableStyle");

    }
    v18 = 0;
    v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"defaultTableStyle", &v18);
    v14 = v18;
    if (v13)
      objc_msgSend(v8, "setDefaultTableStyleName:", v14);
    v17 = 0;
    v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"defaultPivotStyle", &v17);
    v16 = v17;
    if (v15)
      objc_msgSend(v8, "setDefaultPivotStyleName:", v16);

  }
}

+ (void)readPredefinedTableStylesWithState:(id)a3
{
  id v4;
  xmlDoc *v5;
  xmlNodePtr v6;
  xmlNodePtr v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isPredefinedTableStylesRead") & 1) == 0)
  {
    +[TCXmlUtilities bundlePathForXmlResource:](TCXmlUtilities, "bundlePathForXmlResource:", CFSTR("EXPredefinedTableStyleSheet"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (xmlDoc *)sfaxmlParseFile(objc_msgSend(v4, "fileSystemRepresentation"));
    if (!v5)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v6 = OCXGetRootElement(v5);
    v7 = v6;
    if (!v6 || !xmlStrEqual(v6->name, (const xmlChar *)"predefinedTableStyleSheet"))
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(a1, "readPredefinedTableStylesFrom:state:", v7, v8);
    objc_msgSend(v8, "setPredefinedTableStylesRead:", 1);
    xmlFreeDoc(v5);

  }
}

+ (void)readPredefinedTableStylesFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _xmlNode *v8;
  EXReadState *v9;
  EDResources *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  CXNamespace *v17;
  _xmlNode *v18;
  CXNamespace *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a4;
  objc_msgSend(v22, "workbook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableStyles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = OCXFirstChild(a3);
  if (v8)
  {
    do
    {
      v9 = objc_alloc_init(EXReadState);
      v10 = -[EDResources initWithStringOptimization:]([EDResources alloc], "initWithStringOptimization:", 0);
      objc_msgSend(v22, "resources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "colors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDResources setColors:](v10, "setColors:", v12);

      objc_msgSend(v22, "resources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "themes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDResources setThemes:](v10, "setThemes:", v14);

      -[EXReadState setResources:](v9, "setResources:", v10);
      -[EXReadState setPredefinedDxfsBeingRead:](v9, "setPredefinedDxfsBeingRead:", 1);
      -[EXReadState EXSpreadsheetMLNamespace](v9, "EXSpreadsheetMLNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v16 = OCXFindChild(v8, v15, "dxfs");

      +[EXDifferentialStyleTable readFrom:state:](EXDifferentialStyleTable, "readFrom:state:", v16, v9);
      -[EXReadState EXSpreadsheetMLNamespace](v9, "EXSpreadsheetMLNamespace");
      v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v18 = (_xmlNode *)OCXFindChild(v8, v17, "tableStyles");

      if (!v18)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      -[EXReadState EXSpreadsheetMLNamespace](v9, "EXSpreadsheetMLNamespace");
      v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v20 = OCXFindChild(v18, v19, "tableStyle");

      +[EXTableStyle edTableStyleFromXmlTableStyleElement:state:](EXTableStyle, "edTableStyleFromXmlTableStyleElement:state:", v20, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v21);

      objc_msgSend(v5, "addOtherResources:", v10);
      v8 = OCXNextSibling(v8);

    }
    while (v8);
  }
  else
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }

}

@end
