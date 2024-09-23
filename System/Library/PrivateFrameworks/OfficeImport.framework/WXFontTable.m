@implementation WXFontTable

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *Child;
  CXNamespace *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v8, "font");

  while (Child)
  {
    objc_msgSend(v7, "WXMainNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXRequiredStringAttribute(Child, v10, (xmlChar *)"name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && objc_msgSend(v11, "length"))
    {
      objc_msgSend(v14, "fontWithName:create:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXFont readFrom:to:state:](WXFont, "readFrom:to:state:", Child, v12, v7);

    }
    objc_msgSend(v7, "WXMainNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v13, (xmlChar *)"font");

  }
}

@end
