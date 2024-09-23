@implementation EXContentFormatTable

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
    objc_msgSend(v6, "contentFormats");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v8, "numFmt");

    while (Child)
    {
      +[EXContentFormat edContentFormatFromXmlContentFormatElement:](EXContentFormat, "edContentFormatFromXmlContentFormatElement:", Child);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addOrEquivalentObject:", v10);

      objc_msgSend(v12, "EXSpreadsheetMLNamespace");
      v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v11, (xmlChar *)"numFmt");

    }
    v5 = v12;
  }

}

@end
