@implementation EXBordersTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *Child;
  void *v10;
  CXNamespace *v11;
  id v12;

  v5 = a4;
  if (a3)
  {
    v12 = v5;
    objc_msgSend(v5, "resources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "borders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v8, "border");

    while (Child)
    {
      +[EXBorders edBordersFromXmlBordersElement:state:](EXBorders, "edBordersFromXmlBordersElement:state:", Child, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

      objc_msgSend(v12, "EXSpreadsheetMLNamespace");
      v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v11, (xmlChar *)"border");

    }
    v5 = v12;
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
  void *v9;
  id v10;

  objc_msgSend(a3, "resources");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[EDBorder borderWithType:resources:](EDBorder, "borderWithType:resources:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBorder borderWithType:resources:](EDBorder, "borderWithType:resources:", 0, v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBorder borderWithType:resources:](EDBorder, "borderWithType:resources:", 0, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBorder borderWithType:resources:](EDBorder, "borderWithType:resources:", 0, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBorder borderWithType:resources:](EDBorder, "borderWithType:resources:", 0, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDBorders bordersWithLeft:right:top:bottom:diagonal:resources:](EDBorders, "bordersWithLeft:right:top:bottom:diagonal:resources:", v3, v4, v5, v6, v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "borders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

}

+ (unint64_t)xlBordersIndexFromEDBordersIndex:(unint64_t)a3
{
  return a3 + 1;
}

@end
