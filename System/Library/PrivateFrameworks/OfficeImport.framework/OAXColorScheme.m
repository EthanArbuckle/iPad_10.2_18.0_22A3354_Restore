@implementation OAXColorScheme

+ (void)readFromXmlNode:(_xmlNode *)a3 toColorScheme:(id)a4
{
  void *v6;
  _xmlNode *i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v6);

  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && i->name)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "schemeColorEnumMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "valueForString:", v8);

      if ((_DWORD)v10 == -130883970)
        +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
      +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addColor:index:", v11, v10);

    }
  }

}

+ (id)schemeColorEnumMap
{
  if (+[OAXColorScheme schemeColorEnumMap]::once != -1)
    dispatch_once(&+[OAXColorScheme schemeColorEnumMap]::once, &__block_literal_global_45);
  return (id)+[OAXColorScheme schemeColorEnumMap]::schemeColorEnumMap;
}

void __36__OAXColorScheme_schemeColorEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&_ZGVZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_4, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ36__OAXColorScheme_schemeColorEnumMap_EUb_E22schemeColorEnumStructs, 12, 1);
  v2 = (void *)+[OAXColorScheme schemeColorEnumMap]::schemeColorEnumMap;
  +[OAXColorScheme schemeColorEnumMap]::schemeColorEnumMap = (uint64_t)v1;

}

+ (id)colorForScheme:(id)a3 value:(id)a4
{
  objc_msgSend(a1, "colorForScheme:colorMap:value:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorForScheme:(id)a3 colorMap:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(a1, "schemeColorEnumMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "valueForString:", v10);

  if ((_DWORD)v12 == -130883970)
  {
    if (!v9
      || (+[OAXColorMap mapColorEnumMap](OAXColorMap, "mapColorEnumMap"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "valueForString:", v10),
          v13,
          v12 = objc_msgSend(v9, "mappingForIndex:", v14),
          (_DWORD)v12 == -130883970))
    {
      +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
      v12 = 4164083326;
    }
  }
  objc_msgSend(v8, "colorForIndex:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)writeColorScheme:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  objc_msgSend(v7, "startElement:", CFSTR("clrScheme"));
  objc_msgSend(v15, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeAttribute:content:", CFSTR("name"), v8);

  v9 = objc_msgSend(v15, "colorCount");
  if (v9)
  {
    v10 = 0;
    do
    {
      objc_msgSend(a1, "schemeColorEnumMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringForValue:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "colorForIndex:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v12 && v13)
      {
        objc_msgSend(v7, "startElement:", v12);
        +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v14, v7);
        objc_msgSend(v7, "endElement");
      }

      ++v10;
    }
    while (v9 != v10);
  }
  objc_msgSend(v7, "endElement");

}

@end
