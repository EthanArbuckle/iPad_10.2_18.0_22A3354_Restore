@implementation WXListTable

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *Child;
  CXNamespace *v10;
  _xmlAttr *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  _xmlAttr *v15;
  void *v16;
  CXNamespace *v17;
  id v18;

  v18 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v8, "num");

  while (Child)
  {
    objc_msgSend(v7, "WXMainNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = CXRequiredLongAttribute(Child, v10, (xmlChar *)"numId");

    objc_msgSend(v7, "WXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (_xmlNode *)OCXFindChild(Child, v12, "abstractNumId");

    objc_msgSend(v7, "WXMainNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = CXRequiredLongAttribute(v13, v14, (xmlChar *)"val");

    objc_msgSend(v18, "addListWithListId:listDefinitionId:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXList readFrom:to:state:](WXList, "readFrom:to:state:", Child, v16, v7);
    objc_msgSend(v7, "WXMainNamespace");
    v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v17, (xmlChar *)"num");

  }
}

@end
