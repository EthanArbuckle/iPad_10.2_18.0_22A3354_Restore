@implementation WXSymbol

+ (void)readFrom:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  void *v14;
  void *v15;
  void *v16;
  xmlChar *Prop;
  unsigned __int16 v18;
  CXNamespace *v19;
  uint64_t v20;
  void *v21;
  int v22;

  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "paragraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "document");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "WXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(a3, v13, (xmlChar *)"font", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "fontTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fontWithName:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v16);

  Prop = xmlGetProp(a3, (const xmlChar *)"char");
  if (!Prop)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v22 = 0;
  if (sscanf((const char *)Prop, "%04x", &v22) == 1)
  {
    v18 = v22;
  }
  else
  {
    v18 = -3;
    v22 = 65533;
  }
  objc_msgSend(v9, "setCharacter:", v18);
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Prop);
  objc_msgSend(v10, "WXMainNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = OCXFindChild(a4, v19, "rPr");

  if (v20)
  {
    objc_msgSend(v9, "properties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v20, v21, v10);

  }
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  void *v13;
  void *v14;
  void *v15;
  xmlChar *Prop;
  xmlChar *v17;
  unsigned __int16 v18;
  int v19;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "paragraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(a3, v12, (xmlChar *)"font", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fontTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontWithName:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSymbolFont:", v15);

  Prop = xmlGetProp(a3, (const xmlChar *)"char");
  v17 = Prop;
  if (Prop)
  {
    v19 = 0;
    if (sscanf((const char *)Prop, "%04x", &v19) == 1)
    {
      v18 = v19;
    }
    else
    {
      v18 = -3;
      v19 = 65533;
    }
    objc_msgSend(v11, "setSymbolCharacter:", v18);
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v17);
  }

}

@end
