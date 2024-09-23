@implementation EXCellFormatTable

+ (void)readFromCellXfsElement:(_xmlNode *)a3 state:(id)a4
{
  CXNamespace *v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  if (a3)
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v7 = (int)CXCountChildren(a3, v6, (xmlChar *)"xf");

    objc_msgSend(v8, "setCellStyleXfsOffset:", v7);
    objc_msgSend(a1, "readCellFormatsFrom:isStyle:state:", a3, 0, v8);
  }

}

+ (void)readCellFormatsFrom:(_xmlNode *)a3 isStyle:(BOOL)a4 state:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  void *v12;
  CXNamespace *v13;
  id v14;

  v5 = a4;
  v7 = a5;
  if (a3)
  {
    v14 = v7;
    objc_msgSend(v7, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "styles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setDefaultWorkbookStyleIndex:", 0);
    objc_msgSend(v14, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "xf");

    while (Child)
    {
      +[EXCellFormat edCellFormatFromXmlCellFormatElement:isStyle:state:](EXCellFormat, "edCellFormatFromXmlCellFormatElement:isStyle:state:", Child, v5, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      objc_msgSend(v14, "EXSpreadsheetMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"xf");

    }
    v7 = v14;
  }

}

+ (void)readFromCellStyleXfsElement:(_xmlNode *)a3 state:(id)a4
{
  objc_msgSend(a1, "readCellFormatsFrom:isStyle:state:", a3, 1, a4);
}

+ (void)readFromCellStylesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  id v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  id v16;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7 = objc_msgSend(v5, "cellStyleXfsOffset");
    objc_msgSend(v6, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "styles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "cellStyle");

    while (Child)
    {
      v16 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"name", &v16);
      v12 = v16;
      if (v12)
      {
        v15 = 0;
        CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfId", &v15);
        objc_msgSend(v9, "objectAtIndex:", v15 + v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setName:", v12);

      }
      objc_msgSend(v6, "EXSpreadsheetMLNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v14, (xmlChar *)"cellStyle");

    }
  }

}

+ (void)setDefaultWithState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDefaultWorkbookStyleIndex:", 0);
  objc_msgSend(v9, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDStyle styleWithResources:](EDStyle, "styleWithResources:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContentFormatId:", 0);
  objc_msgSend(v6, "setFontIndex:", 0);
  objc_msgSend(v6, "setFillIndex:", 0);
  objc_msgSend(v6, "setBordersIndex:", 0);
  objc_msgSend(v6, "setParentIndex:", 0);
  objc_msgSend(v4, "addObject:", v6);
  objc_msgSend(v9, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDStyle styleWithResources:](EDNamedStyle, "styleWithResources:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContentFormatId:", 0);
  objc_msgSend(v8, "setFontIndex:", 0);
  objc_msgSend(v8, "setFillIndex:", 0);
  objc_msgSend(v8, "setBordersIndex:", 0);
  objc_msgSend(v8, "setName:", CFSTR("Normal"));
  objc_msgSend(v4, "addObject:", v8);

}

@end
