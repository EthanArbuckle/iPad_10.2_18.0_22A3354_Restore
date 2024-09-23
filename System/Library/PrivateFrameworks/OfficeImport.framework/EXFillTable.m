@implementation EXFillTable

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
    objc_msgSend(v6, "fills");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v8, "fill");

    while (Child)
    {
      +[EXFill edFillFromXmlFillElement:state:](EXFill, "edFillFromXmlFillElement:state:", Child, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

      objc_msgSend(v12, "EXSpreadsheetMLNamespace");
      v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v11, (xmlChar *)"fill");

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
  id v9;

  v9 = a3;
  objc_msgSend(v9, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPatternFill patternFillWithType:foreColorReference:backColorReference:resources:](EDPatternFill, "patternFillWithType:foreColorReference:backColorReference:resources:", 0, 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fills");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v4);
  objc_msgSend(v9, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDPatternFill patternFillWithType:foreColorReference:backColorReference:resources:](EDPatternFill, "patternFillWithType:foreColorReference:backColorReference:resources:", 17, 0, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v8);
}

@end
