@implementation EXHeaderFooter

+ (id)edHeaderFooterFromXmlHeaderFooterElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  EDHeaderFooter *v6;
  CXNamespace *v7;
  uint64_t v8;
  CXNamespace *v9;
  uint64_t v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v16;

  v5 = a4;
  v6 = objc_alloc_init(EDHeaderFooter);
  if (a3)
  {
    v16 = 0;
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"differentFirst", &v16);
    if (v16)
    {
      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v8 = OCXFindChild(a3, v7, "firstHeader");

      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v10 = OCXFindChild(a3, v9, "firstFooter");
    }
    else
    {
      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v8 = OCXFindChild(a3, v11, "oddHeader");

      objc_msgSend(v5, "EXSpreadsheetMLNamespace");
      v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v10 = OCXFindChild(a3, v9, "oddFooter");
    }
    v12 = v10;

    if (v8)
    {
      +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[EDHeaderFooter setHeaderString:](v6, "setHeaderString:", v13);

    }
    if (v12)
    {
      +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        -[EDHeaderFooter setFooterString:](v6, "setFooterString:", v14);

    }
  }

  return v6;
}

@end
