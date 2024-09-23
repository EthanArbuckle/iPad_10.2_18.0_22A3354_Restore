@implementation OAXFontScheme

+ (void)readFontSchemeEntries:(_xmlNode *)a3 font:(id)a4
{
  _xmlNode *i;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      CXRequiredStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"typeface");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (xmlStrEqual(i->name, (const xmlChar *)"latin"))
      {
        objc_msgSend(v8, "setLatinFont:", v6);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"ea"))
      {
        objc_msgSend(v8, "setEastAsianFont:", v6);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"cs"))
      {
        objc_msgSend(v8, "setComplexScriptFont:", v6);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"font"))
      {
        CXRequiredStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"script");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFont:forScript:", v6, v7);

      }
    }
  }

}

+ (void)readFontScheme:(_xmlNode *)a3 toFontScheme:(id)a4 drawingState:(id)a5
{
  id v8;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setName:", v9);

  objc_msgSend(v8, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(a3, v10, "majorFont");

  if (v11)
  {
    objc_msgSend(v16, "majorFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFontSchemeEntries:font:", v11, v12);

  }
  objc_msgSend(v8, "OAXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "minorFont");

  if (v14)
  {
    objc_msgSend(v16, "minorFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readFontSchemeEntries:font:", v14, v15);

  }
}

+ (void)writeTypeface:(id)a3 elementName:(id)a4 to:(id)a5 state:(id)a6
{
  const __CFString *v8;
  id v9;
  id v10;
  const __CFString *v11;
  __CFString *v12;

  v8 = (const __CFString *)a3;
  v9 = a4;
  v10 = a5;
  if (v8)
    v11 = v8;
  else
    v11 = &stru_24F3BFFF8;
  v12 = (__CFString *)v11;
  objc_msgSend(v10, "startElement:", v9);
  objc_msgSend(v10, "writeAttribute:content:", CFSTR("typeface"), v12);
  objc_msgSend(v10, "endElement");

}

+ (void)writeFont:(id)a3 elementName:(id)a4 to:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "startElement:", v10);
  objc_msgSend(v16, "latinFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeTypeface:elementName:to:state:", v13, CFSTR("latin"), v11, v12);

  objc_msgSend(v16, "eastAsianFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeTypeface:elementName:to:state:", v14, CFSTR("ea"), v11, v12);

  objc_msgSend(v16, "complexScriptFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeTypeface:elementName:to:state:", v15, CFSTR("cs"), v11, v12);

  objc_msgSend(v11, "endElement");
}

+ (void)writeFontScheme:(id)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "startElement:", CFSTR("fontScheme"));
  objc_msgSend(v13, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeAttribute:content:", CFSTR("name"), v10);

  objc_msgSend(v13, "majorFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeFont:elementName:to:state:", v11, CFSTR("majorFont"), v8, v9);

  objc_msgSend(v13, "minorFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeFont:elementName:to:state:", v12, CFSTR("minorFont"), v8, v9);

  objc_msgSend(v8, "endElement");
}

@end
