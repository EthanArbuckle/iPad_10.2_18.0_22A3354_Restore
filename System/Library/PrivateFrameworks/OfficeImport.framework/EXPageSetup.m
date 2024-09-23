@implementation EXPageSetup

+ (id)edPageMarginsFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;

  objc_msgSend(a4, "currentSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageSetup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!a3)
      return v6;
  }
  else
  {
    +[EDPageSetup pageSetup](EDPageSetup, "pageSetup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      return v6;
  }
  v14 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"left", &v14))
  {
    HIDWORD(v7) = HIDWORD(v14);
    *(float *)&v7 = v14;
    objc_msgSend(v6, "setLeftMargin:", v7);
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"right", &v14))
  {
    HIDWORD(v8) = HIDWORD(v14);
    *(float *)&v8 = v14;
    objc_msgSend(v6, "setRightMargin:", v8);
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"top", &v14))
  {
    HIDWORD(v9) = HIDWORD(v14);
    *(float *)&v9 = v14;
    objc_msgSend(v6, "setTopMargin:", v9);
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bottom", &v14))
  {
    HIDWORD(v10) = HIDWORD(v14);
    *(float *)&v10 = v14;
    objc_msgSend(v6, "setBottomMargin:", v10);
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"header", &v14))
  {
    HIDWORD(v11) = HIDWORD(v14);
    *(float *)&v11 = v14;
    objc_msgSend(v6, "setHeaderMargin:", v11);
  }
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"footer", &v14))
  {
    HIDWORD(v12) = HIDWORD(v14);
    *(float *)&v12 = v14;
    objc_msgSend(v6, "setFooterMargin:", v12);
  }
  return v6;
}

+ (id)edPageSetupFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(a4, "currentSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageSetup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!a3)
      return v7;
  }
  else
  {
    +[EDPageSetup pageSetup](EDPageSetup, "pageSetup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      return v7;
  }
  v19 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstPageNumber", &v19))
    objc_msgSend(v7, "setFirstPageNumber:", v19);
  v18 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fitToHeight", &v18))
    objc_msgSend(v7, "setFitToHeight:", v18);
  v17 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fitToWidth", &v17))
    objc_msgSend(v7, "setFitToWidth:", v17);
  v16 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"scale", &v16))
    objc_msgSend(v7, "setScale:", v16);
  v15 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"useFirstPageNumber", &v15))
    objc_msgSend(v7, "setCustomFirstPageNumber:", v15);
  v14 = 0;
  v8 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"orientation", &v14);
  v9 = v14;
  if (v8)
    objc_msgSend(v7, "setOrientation:", objc_msgSend(a1, "edPageOrientationFromPageOrientationString:", v9));
  v13 = 0;
  v10 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"pageOrder", &v13);
  v11 = v13;
  if (v10)
    objc_msgSend(v7, "setOrder:", objc_msgSend(a1, "edPageOrderFromPageOrderString:", v11));

  return v7;
}

+ (int)edPageOrientationFromPageOrientationString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("portrait"));
}

+ (id)pageOrderEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_25, 0, &dword_22A0CC000);
  }
  if (+[EXPageSetup pageOrderEnumMap]::onceToken != -1)
    dispatch_once(&+[EXPageSetup pageOrderEnumMap]::onceToken, &__block_literal_global_76);
  return (id)+[EXPageSetup pageOrderEnumMap]::sPageOrderEnumMap;
}

void __31__EXPageSetup_pageOrderEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXPageSetup pageOrderEnumMap]::sPageOrderStructs, 2, 1);
  v1 = (void *)+[EXPageSetup pageOrderEnumMap]::sPageOrderEnumMap;
  +[EXPageSetup pageOrderEnumMap]::sPageOrderEnumMap = (uint64_t)v0;

}

+ (id)pageOrientationEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_8, 0, &dword_22A0CC000);
  }
  if (+[EXPageSetup pageOrientationEnumMap]::onceToken != -1)
    dispatch_once(&+[EXPageSetup pageOrientationEnumMap]::onceToken, &__block_literal_global_9_0);
  return (id)+[EXPageSetup pageOrientationEnumMap]::sPageOrientationEnumMap;
}

void __37__EXPageSetup_pageOrientationEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXPageSetup pageOrientationEnumMap]::sPageOrientationStructs, 2, 1);
  v1 = (void *)+[EXPageSetup pageOrientationEnumMap]::sPageOrientationEnumMap;
  +[EXPageSetup pageOrientationEnumMap]::sPageOrientationEnumMap = (uint64_t)v0;

}

+ (int)edPageOrderFromPageOrderString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("overThenDown"));
}

@end
