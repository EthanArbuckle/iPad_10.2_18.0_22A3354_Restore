@implementation ODXFillColorList

+ (void)readNode:(_xmlNode *)a3 list:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  _xmlNode *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(a1, "hueDirectionMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHueDirection:", objc_msgSend(v6, "readFromNode:ns:name:def:", a3, 0, "hueDir", 1));

  objc_msgSend(a1, "colorApplicationMethodMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMethod:", objc_msgSend(v7, "readFromNode:ns:name:def:", a3, 0, "meth", 2));

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = OCXFirstChild(a3);
  while (v9)
  {
    +[OAXColor readColorFromNode:](OAXColor, "readColorFromNode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Could not read diagram color transform"));
    objc_msgSend(v8, "addObject:", v10);
    v9 = OCXNextSibling(v9);

  }
  objc_msgSend(v11, "setColors:", v8);

}

+ (id)hueDirectionMap
{
  void *v2;
  unsigned __int8 v3;
  TCXmlEnumMap *v4;
  void *v5;

  v2 = (void *)+[ODXFillColorList hueDirectionMap]::hueDirectionMap;
  if (!+[ODXFillColorList hueDirectionMap]::hueDirectionMap)
  {
    if ((v3 & 1) == 0
    {
      +[ODXFillColorList hueDirectionMap]::hueDirectionDescriptions = 0;
      qword_255AD3090 = (uint64_t)"ccw";
      dword_255AD3098 = 1;
      qword_255AD30A0 = (uint64_t)"cw";
      xmmword_255AD30A8 = TCXmlEnumSentinel;
    }
    v4 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &+[ODXFillColorList hueDirectionMap]::hueDirectionDescriptions);
    v5 = (void *)+[ODXFillColorList hueDirectionMap]::hueDirectionMap;
    +[ODXFillColorList hueDirectionMap]::hueDirectionMap = (uint64_t)v4;

    v2 = (void *)+[ODXFillColorList hueDirectionMap]::hueDirectionMap;
  }
  return v2;
}

+ (id)colorApplicationMethodMap
{
  void *v2;
  unsigned __int8 v3;
  TCXmlEnumMap *v4;
  void *v5;

  v2 = (void *)+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap;
  if (!+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap)
  {
    if ((v3 & 1) == 0
    {
      qword_255AD30D0 = (uint64_t)"cycle";
      dword_255AD30D8 = 1;
      qword_255AD30E0 = (uint64_t)"repeat";
      dword_255AD30E8 = 2;
      +[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodDescriptions = 0;
      qword_255AD30F0 = (uint64_t)"span";
      xmmword_255AD30F8 = TCXmlEnumSentinel;
    }
    v4 = -[TCXmlEnumMap initWithDescriptions:]([TCXmlEnumMap alloc], "initWithDescriptions:", &+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodDescriptions);
    v5 = (void *)+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap;
    +[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap = (uint64_t)v4;

    v2 = (void *)+[ODXFillColorList colorApplicationMethodMap]::colorApplicationMethodMap;
  }
  return v2;
}

@end
