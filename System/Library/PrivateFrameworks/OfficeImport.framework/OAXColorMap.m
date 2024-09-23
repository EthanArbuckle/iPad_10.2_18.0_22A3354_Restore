@implementation OAXColorMap

+ (void)readFromXmlNode:(_xmlNode *)a3 toColorMap:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _xmlNode *v11;

  v6 = a4;
  objc_msgSend(v6, "addDefaultMappings:", 1);
  objc_msgSend(a1, "mapColorEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__OAXColorMap_readFromXmlNode_toColorMap___block_invoke;
  v9[3] = &unk_24F39D060;
  v11 = a3;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "enumerateValuesAndStringsUsingBlock:", v9);

}

void __42__OAXColorMap_readFromXmlNode_toColorMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  xmlChar *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (xmlChar *)objc_msgSend(a3, "tc_xmlString");
  CXRequiredStringAttribute(*(_xmlNode **)(a1 + 40), (CXNamespace *)CXNoNamespace, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    +[OAXColorScheme schemeColorEnumMap](OAXColorScheme, "schemeColorEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addMapping:index:", objc_msgSend(v7, "valueForString:", v8), a2);

    v6 = v8;
  }

}

+ (void)writeColorMap:(id)a3 elementName:(id)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "startElement:", v9);
  v11 = 0;
  do
  {
    v12 = objc_msgSend(v17, "mappingForIndex:", v11);
    objc_msgSend(a1, "mapColorEnumMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringForValue:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[OAXColorScheme schemeColorEnumMap](OAXColorScheme, "schemeColorEnumMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringForValue:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "writeAttribute:content:", v14, v16);
    v11 = (v11 + 1);
  }
  while ((_DWORD)v11 != 12);
  objc_msgSend(v10, "endElement");

}

+ (id)mapColorEnumMap
{
  unsigned __int8 v2;
  void *v3;
  TCEnumerationMap *v4;
  void *v5;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_3, 0, &dword_22A0CC000);
  }
  v3 = (void *)+[OAXColorMap mapColorEnumMap]::mapColorEnumMap;
  if (!+[OAXColorMap mapColorEnumMap]::mapColorEnumMap)
  {
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXColorMap mapColorEnumMap]::mapColorEnumStructs, 12, 1);
    v5 = (void *)+[OAXColorMap mapColorEnumMap]::mapColorEnumMap;
    +[OAXColorMap mapColorEnumMap]::mapColorEnumMap = (uint64_t)v4;

    v3 = (void *)+[OAXColorMap mapColorEnumMap]::mapColorEnumMap;
  }
  return v3;
}

@end
