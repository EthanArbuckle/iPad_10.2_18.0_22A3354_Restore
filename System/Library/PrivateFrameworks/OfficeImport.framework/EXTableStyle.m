@implementation EXTableStyle

+ (id)edTableStyleFromXmlTableStyleElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  void *v12;
  CXNamespace *v13;
  id v15;

  v5 = a4;
  if (a3)
  {
    +[EDTableStyle tableStyle](EDTableStyle, "tableStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v15);
    v8 = v15;
    if (v7)
      objc_msgSend(v6, "setName:", v8);
    objc_msgSend(v6, "tableStyleElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "tableStyleElement");

    while (Child)
    {
      +[EXTableStyleElement edTableStyleElementFromXmlTableStyleElement:state:](EXTableStyleElement, "edTableStyleElementFromXmlTableStyleElement:state:", Child, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"tableStyleElement");

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
