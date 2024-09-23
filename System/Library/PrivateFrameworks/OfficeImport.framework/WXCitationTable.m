@implementation WXCitationTable

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *Child;
  CXNamespace *v10;
  void *v11;
  WDCitation *v12;
  CXNamespace *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXOOBibliographyNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v8, "Source");

  while (Child)
  {
    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXChildDefaultStringContent(Child, v10, (xmlChar *)"Tag", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[WDCitation initWithDocument:]([WDCitation alloc], "initWithDocument:", v14);
      +[WXCitation readFrom:to:state:](WXCitation, "readFrom:to:state:", Child, v12, v7);
      objc_msgSend(v14, "addCitation:forID:", v12, v11);

    }
    objc_msgSend(v7, "WXOOBibliographyNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v13, (xmlChar *)"Source");

  }
}

@end
