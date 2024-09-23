@implementation WXList

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *Child;
  CXNamespace *v10;
  unsigned __int8 v11;
  void *v12;
  CXNamespace *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v8, "lvlOverride");

  while (Child)
  {
    objc_msgSend(v7, "WXMainNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = CXRequiredLongAttribute(Child, v10, (xmlChar *)"ilvl");

    objc_msgSend(v14, "addLevelOverrideWithLevel:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXListLevelOverride readFrom:to:state:](WXListLevelOverride, "readFrom:to:state:", Child, v12, v7);
    objc_msgSend(v7, "WXMainNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v13, (xmlChar *)"lvlOverride");

  }
}

@end
