@implementation OAXColor

+ (id)readColorFromParentXmlNode:(_xmlNode *)a3
{
  _xmlNode *v4;
  void *v5;

  v4 = OCXFirstChild(a3);
  v5 = 0;
  while (!v5 && v4)
  {
    if (v4->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(a1, "readColorFromNode:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v4 = OCXNextSibling(v4);
  }
  return v5;
}

+ (id)readColorFromNode:(_xmlNode *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  if (xmlStrEqual(a3->name, (const xmlChar *)"scrgbClr"))
  {
    objc_msgSend(a1, "readScRgbColorFromXmlNode:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"srgbClr"))
  {
    objc_msgSend(a1, "readSRgbColorFromXmlNode:attribute:", a3, "val");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"hslClr"))
  {
    objc_msgSend(a1, "readHslColorFromXmlNode:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!xmlStrEqual(a3->name, (const xmlChar *)"sysClr"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"schemeClr"))
    {
      objc_msgSend(a1, "readSchemeColorFromXmlNode:", a3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!xmlStrEqual(a3->name, (const xmlChar *)"prstClr"))
      {
        v6 = 0;
        return v6;
      }
      objc_msgSend(a1, "readPresetColorFromXmlNode:", a3);
      v5 = objc_claimAutoreleasedReturnValue();
    }
LABEL_7:
    v6 = (void *)v5;
    if (!v5)
      return v6;
    goto LABEL_8;
  }
  objc_msgSend(a1, "readSystemColorFromXmlNode:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastClr", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(a1, "readSRgbColorFromXmlNode:attribute:", a3, "lastClr");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }

  if (v6)
  {
LABEL_8:
    +[OAXColorTransform readColorTransformsFromXmlNode:](OAXColorTransform, "readColorTransformsFromXmlNode:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "count"))
      objc_msgSend(v6, "setTransforms:", v8);

  }
  return v6;
}

+ (id)readSchemeColorFromXmlNode:(_xmlNode *)a3
{
  void *v4;
  void *v5;

  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "readSchemeColorFromAttribute:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)schemeColorEnumMap
{
  if (+[OAXColor(Private) schemeColorEnumMap]::once != -1)
    dispatch_once(&+[OAXColor(Private) schemeColorEnumMap]::once, &__block_literal_global_492);
  return (id)+[OAXColor(Private) schemeColorEnumMap]::schemeColorEnumMap;
}

+ (id)readSRgbColorFromXmlNode:(_xmlNode *)a3 attribute:(const char *)a4
{
  void *v4;
  id v5;
  int v6;
  OADRgbColor *v7;
  double v8;
  double v9;
  double v10;
  OADRgbColor *v11;
  int v13;

  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") != 6)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  v13 = 0;
  v5 = objc_retainAutorelease(v4);
  if (sscanf((const char *)objc_msgSend(v5, "UTF8String"), "%x", &v13) != 1)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  v6 = v13;
  v7 = [OADRgbColor alloc];
  *(float *)&v8 = (float)BYTE2(v6);
  *(float *)&v9 = (float)BYTE1(v6);
  *(float *)&v10 = (float)v6;
  v11 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v7, "initWithRedByte:greenByte:blueByte:", v8, v9, v10);

  return v11;
}

+ (id)readSystemColorFromXmlNode:(_xmlNode *)a3
{
  void *v4;
  void *v5;

  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "readSystemColorFromAttribute:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)readSystemColorFromAttribute:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  OADSystemColor *v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(a1, "systemColorEnumMap"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "valueForString:", v5),
        v6,
        (_DWORD)v7 != -130883970))
  {
    v8 = -[OADSystemColor initWithSystemColorID:]([OADSystemColor alloc], "initWithSystemColorID:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)systemColorEnumMap
{
  if (+[OAXColor(Private) systemColorEnumMap]::once != -1)
    dispatch_once(&+[OAXColor(Private) systemColorEnumMap]::once, &__block_literal_global_430);
  return (id)+[OAXColor(Private) systemColorEnumMap]::systemColorEnumMap;
}

+ (id)readPresetColorFromAttribute:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  OADRgbColor *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  OADRgbColor *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v18;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(a1, "presetColorEnumMap"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "valueForString:", v5),
        v6,
        (_DWORD)v7 != -130883970))
  {
    objc_msgSend(a1, "presetColorRGBEnumMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForValue:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scanHexLongLong:", &v18);

    v12 = v18;
    v13 = [OADRgbColor alloc];
    *(float *)&v14 = (float)BYTE2(v12);
    *(float *)&v15 = (float)BYTE1(v12);
    *(float *)&v16 = (float)v12;
    v8 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v13, "initWithRedByte:greenByte:blueByte:", v14, v15, v16);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)presetColorEnumMap
{
  if (+[OAXColor(Private) presetColorEnumMap]::once != -1)
    dispatch_once(&+[OAXColor(Private) presetColorEnumMap]::once, &__block_literal_global_44);
  return (id)+[OAXColor(Private) presetColorEnumMap]::presetColorEnumMap;
}

+ (id)readPresetColorFromXmlNode:(_xmlNode *)a3
{
  void *v4;
  void *v5;

  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "readPresetColorFromAttribute:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)readScRgbColorFromXmlNode:(_xmlNode *)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  OADRgbColor *v10;
  double v11;
  double v12;
  double v13;

  +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", a3, "r");
  v5 = v4;
  +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", a3, "g");
  v7 = v6;
  +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", a3, "b");
  v9 = v8;
  v10 = [OADRgbColor alloc];
  LODWORD(v11) = v5;
  LODWORD(v12) = v7;
  LODWORD(v13) = v9;
  return -[OADRgbColor initWithRed:green:blue:](v10, "initWithRed:green:blue:", v11, v12, v13);
}

+ (id)readSchemeColorFromAttribute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  OADPlaceholderColor *v7;
  OADSchemeColor *v8;
  OADPlaceholderColor *v9;

  v4 = a3;
  objc_msgSend(a1, "schemeColorEnumMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueForString:", v4);

  if ((_DWORD)v6 == -130883970)
  {
    v8 = [OADSchemeColor alloc];
    v6 = 0;
LABEL_6:
    v7 = -[OADSchemeColor initWithSchemeColorIndex:](v8, "initWithSchemeColorIndex:", v6);
    goto LABEL_7;
  }
  if ((_DWORD)v6 != 17)
  {
    v8 = [OADSchemeColor alloc];
    goto LABEL_6;
  }
  v7 = objc_alloc_init(OADPlaceholderColor);
LABEL_7:
  v9 = v7;

  return v9;
}

+ (void)writePresetColor:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "startOAElement:", CFSTR("prstClr"));
  objc_msgSend(a1, "stringSRgbColor:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presetColorRGBEnumMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "valueForString:", v7);

  objc_msgSend(a1, "presetColorEnumMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringForValue:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("val"), v11);
  objc_msgSend(v13, "transforms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorTransform write:to:](OAXColorTransform, "write:to:", v12, v6);

  objc_msgSend(v6, "endElement");
}

+ (void)writeRgbColor:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "startOAElement:", CFSTR("srgbClr"));
  objc_msgSend(a1, "stringSRgbColor:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("val"), v7);
  objc_msgSend(v9, "transforms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorTransform write:to:](OAXColorTransform, "write:to:", v8, v6);

  objc_msgSend(v6, "endElement");
}

+ (void)writeSchemeColor:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "startOAElement:", CFSTR("schemeClr"));
  objc_msgSend(a1, "schemeColorEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValue:", objc_msgSend(v10, "schemeColorIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("val"), v8);
  objc_msgSend(v10, "transforms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorTransform write:to:](OAXColorTransform, "write:to:", v9, v6);

  objc_msgSend(v6, "endElement");
}

+ (void)writeSystemColor:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "startOAElement:", CFSTR("sysClr"));
  objc_msgSend(a1, "systemColorEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValue:", objc_msgSend(v10, "systemColorID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("val"), v8);
  objc_msgSend(v10, "transforms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorTransform write:to:](OAXColorTransform, "write:to:", v9, v6);

  objc_msgSend(v6, "endElement");
}

+ (void)writePlaceholderColor:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(v5, "startOAElement:", CFSTR("schemeClr"));
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("val"), CFSTR("phClr"));
  objc_msgSend(v7, "transforms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorTransform write:to:](OAXColorTransform, "write:to:", v6, v5);

  objc_msgSend(v5, "endElement");
}

+ (void)writeColor:(id)a3 to:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  TSUDynamicCast(v7, (uint64_t)v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "writeRgbColor:to:", v8, v6);
  }
  else
  {
    v9 = objc_opt_class();
    TSUDynamicCast(v9, (uint64_t)v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(a1, "writeSchemeColor:to:", v10, v6);
    }
    else
    {
      v11 = objc_opt_class();
      TSUDynamicCast(v11, (uint64_t)v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(a1, "writeSystemColor:to:", v12, v6);
      }
      else
      {
        v13 = objc_opt_class();
        TSUDynamicCast(v13, (uint64_t)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(a1, "writePlaceholderColor:to:", v14, v6);
        }
        else
        {
          v15 = objc_opt_class();
          TSUDynamicCast(v15, (uint64_t)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = objc_opt_class();
            TSUDynamicCast(v17, (uint64_t)v18);

          }
        }

      }
    }

  }
}

+ (id)readHslColorFromXmlNode:(_xmlNode *)a3
{
  OADRgbColor *v3;
  double v4;
  double v5;
  double v6;

  v3 = [OADRgbColor alloc];
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  return -[OADRgbColor initWithRed:green:blue:](v3, "initWithRed:green:blue:", v4, v5, v6);
}

void __39__OAXColor_Private__presetColorEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_2, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ39__OAXColor_Private__presetColorEnumMap_EUb_E22presetColorEnumStructs, 191, 1);
  v2 = (void *)+[OAXColor(Private) presetColorEnumMap]::presetColorEnumMap;
  +[OAXColor(Private) presetColorEnumMap]::presetColorEnumMap = (uint64_t)v1;

}

void __39__OAXColor_Private__systemColorEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_491, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ39__OAXColor_Private__systemColorEnumMap_EUb0_E22systemColorEnumStructs, 30, 1);
  v2 = (void *)+[OAXColor(Private) systemColorEnumMap]::systemColorEnumMap;
  +[OAXColor(Private) systemColorEnumMap]::systemColorEnumMap = (uint64_t)v1;

}

void __39__OAXColor_Private__schemeColorEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_525, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ39__OAXColor_Private__schemeColorEnumMap_EUb1_E22schemeColorEnumStructs, 17, 1);
  v2 = (void *)+[OAXColor(Private) schemeColorEnumMap]::schemeColorEnumMap;
  +[OAXColor(Private) schemeColorEnumMap]::schemeColorEnumMap = (uint64_t)v1;

}

+ (id)presetColorRGBEnumMap
{
  if (+[OAXColor(Private) presetColorRGBEnumMap]::once != -1)
    dispatch_once(&+[OAXColor(Private) presetColorRGBEnumMap]::once, &__block_literal_global_526);
  return (id)+[OAXColor(Private) presetColorRGBEnumMap]::presetColorRGBEnumMap;
}

void __42__OAXColor_Private__presetColorRGBEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMultiMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_807, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs);
  }
  v1 = -[TCEnumerationMultiMap initWithStructs:count:caseSensitive:]([TCEnumerationMultiMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ42__OAXColor_Private__presetColorRGBEnumMap_EUb2_E25presetColorRGBEnumStructs, 191, 1);
  v2 = (void *)+[OAXColor(Private) presetColorRGBEnumMap]::presetColorRGBEnumMap;
  +[OAXColor(Private) presetColorRGBEnumMap]::presetColorRGBEnumMap = (uint64_t)v1;

}

+ (id)stringSRgbColor:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(v4, "redByte");
    v6 = objc_msgSend(v4, "greenByte");
    v7 = objc_msgSend(v4, "blueByte");

  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X%02X%02X"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
