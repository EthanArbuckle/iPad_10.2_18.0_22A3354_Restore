@implementation OAXTextListStyle

+ (void)readNode:(_xmlNode *)a3 textListStyle:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  char __str[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = 0;
  do
  {
    v10 = v9 + 1;
    snprintf(__str, 0x20uLL, "lvl%dpPr", v9 + 1);
    objc_msgSend(v8, "OAXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = OCXFindChild(a3, v11, __str);

    if (v12)
    {
      objc_msgSend(v7, "propertiesForListLevel:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXTextParaPropertyBag readParagraphProperties:paragraphProperties:drawingState:](OAXTextParaPropertyBag, "readParagraphProperties:paragraphProperties:drawingState:", v12, v13, v8);
      objc_msgSend(v13, "setLevel:", v9);

    }
    ++v9;
  }
  while (v10 != 9);
  objc_msgSend(v8, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "defPPr");

  if (v15)
  {
    objc_msgSend(v8, "OAXMainNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = (_xmlNode *)OCXFindChild(v15, v16, "defRPr");

    if (v17)
    {
      v21 = 0;
      v18 = CXOptionalStringAttribute(v17, (void *)CXNoNamespace, (xmlChar *)"lang", &v21);
      v19 = v21;
      if (v18)
        objc_msgSend(v7, "setLanguage:", v19);

    }
    objc_msgSend(v7, "defaultProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextParaPropertyBag readParagraphProperties:paragraphProperties:drawingState:](OAXTextParaPropertyBag, "readParagraphProperties:paragraphProperties:drawingState:", v15, v20, v8);

  }
}

@end
