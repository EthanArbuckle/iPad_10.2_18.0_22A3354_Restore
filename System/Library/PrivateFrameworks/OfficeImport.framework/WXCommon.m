@implementation WXCommon

+ (void)initialize
{
  TCTaggedMessage *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  TCTaggedMessage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  TCTaggedMessage *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  TCTaggedMessage *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CXNamespace *v22;
  void *v23;
  CXNamespace *v24;
  void *v25;
  CXNamespace *v26;
  void *v27;
  CXNamespace *v28;
  void *v29;
  CXNamespace *v30;
  void *v31;
  CXNamespace *v32;
  void *v33;
  CXNamespace *v34;
  void *v35;
  CXNamespace *v36;
  void *v37;
  CXNamespace *v38;
  void *v39;

  if ((id)objc_opt_class() == a1)
  {
    v2 = [TCTaggedMessage alloc];
    TCBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("The XML document isn\\U2019t in Word format."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TCTaggedMessage initWithMessageText:](v2, "initWithMessageText:", v4);
    v6 = (void *)WXBadFormat;
    WXBadFormat = v5;

    v7 = [TCTaggedMessage alloc];
    TCBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Equations authored with Microsoft Office were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TCTaggedMessage initWithMessageText:](v7, "initWithMessageText:", v9);
    v11 = (void *)WXMathMLNotSupported;
    WXMathMLNotSupported = v10;

    v12 = [TCTaggedMessage alloc];
    TCBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Form components aren\\U2019t supported and were removed."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TCTaggedMessage initWithMessageText:](v12, "initWithMessageText:", v14);
    v16 = (void *)WXFormsNotSupported;
    WXFormsNotSupported = v15;

    v17 = [TCTaggedMessage alloc];
    TCBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Some tracked changes had no associated time stamp. The current date/time was used instead."), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[TCTaggedMessage initWithMessageText:](v17, "initWithMessageText:", v19);
    v21 = (void *)WXFoundMissingCTDate;
    WXFoundMissingCTDate = v20;

    v22 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "urn:schemas-microsoft-com:office:word");
    v23 = (void *)WXVmlNamespace;
    WXVmlNamespace = (uint64_t)v22;

    v24 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/word/2006/wordml");
    v25 = (void *)WXWord2006Namespace;
    WXWord2006Namespace = (uint64_t)v24;

    v26 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/word/2010/wordml");
    v27 = (void *)WXWord2010Namespace;
    WXWord2010Namespace = (uint64_t)v26;

    v28 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/word/2012/wordml");
    v29 = (void *)WXWord2012Namespace;
    WXWord2012Namespace = (uint64_t)v28;

    v30 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/word/2012/wordprocessingDrawing");
    v31 = (void *)WXWord2012DrawingNamespace;
    WXWord2012DrawingNamespace = (uint64_t)v30;

    v32 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/bibliography");
    v33 = (void *)WXOOBibliographyNamespace;
    WXOOBibliographyNamespace = (uint64_t)v32;

    v34 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    v35 = (void *)WXRelationshipNamespace;
    WXRelationshipNamespace = (uint64_t)v34;

    v36 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/word/2010/wordprocessingShape");
    v37 = (void *)WXShapeNamespace;
    WXShapeNamespace = (uint64_t)v36;

    v38 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/word/2010/wordprocessingGroup");
    v39 = (void *)WXGroupNamespace;
    WXGroupNamespace = (uint64_t)v38;

  }
}

+ (TCEnumerationMap)textDirectionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_31, 0, &dword_22A0CC000);
  }
  if (+[WXCommon textDirectionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon textDirectionEnumMap]::onceToken, &__block_literal_global_82);
  return (TCEnumerationMap *)(id)+[WXCommon textDirectionEnumMap]::sTextDirectionEnumMap;
}

void __32__WXCommon_textDirectionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon textDirectionEnumMap]::sTextDirectionEnumStructs, 6, 1);
  v1 = (void *)+[WXCommon textDirectionEnumMap]::sTextDirectionEnumMap;
  +[WXCommon textDirectionEnumMap]::sTextDirectionEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)strictTextDirectionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_76_0, 0, &dword_22A0CC000);
  }
  if (+[WXCommon strictTextDirectionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon strictTextDirectionEnumMap]::onceToken, &__block_literal_global_77_1);
  return (TCEnumerationMap *)(id)+[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumMap;
}

void __38__WXCommon_strictTextDirectionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumStructs, 6, 1);
  v1 = (void *)+[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumMap;
  +[WXCommon strictTextDirectionEnumMap]::sStrictTextDirectionEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)justifyEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_98_0, 0, &dword_22A0CC000);
  }
  if (+[WXCommon justifyEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon justifyEnumMap]::onceToken, &__block_literal_global_99);
  return (TCEnumerationMap *)(id)+[WXCommon justifyEnumMap]::sJustifyEnumMap;
}

void __26__WXCommon_justifyEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon justifyEnumMap]::sJustifyEnumStructs, 10, 1);
  v1 = (void *)+[WXCommon justifyEnumMap]::sJustifyEnumMap;
  +[WXCommon justifyEnumMap]::sJustifyEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)strictJustifyEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_104_1, 0, &dword_22A0CC000);
  }
  if (+[WXCommon strictJustifyEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon strictJustifyEnumMap]::onceToken, &__block_literal_global_105_0);
  return (TCEnumerationMap *)(id)+[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumMap;
}

void __32__WXCommon_strictJustifyEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumStructs, 10, 1);
  v1 = (void *)+[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumMap;
  +[WXCommon strictJustifyEnumMap]::sStrictJustifyEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)tableWidthTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_114_0, 0, &dword_22A0CC000);
  }
  if (+[WXCommon tableWidthTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon tableWidthTypeEnumMap]::onceToken, &__block_literal_global_115);
  return (TCEnumerationMap *)(id)+[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumMap;
}

void __33__WXCommon_tableWidthTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumStructs, 4, 1);
  v1 = (void *)+[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumMap;
  +[WXCommon tableWidthTypeEnumMap]::sTableWidthTypeEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)heightTypeEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_120_0, 0, &dword_22A0CC000);
  }
  if (+[WXCommon heightTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon heightTypeEnumMap]::onceToken, &__block_literal_global_121);
  return (TCEnumerationMap *)(id)+[WXCommon heightTypeEnumMap]::sHeightTypeEnumMap;
}

void __29__WXCommon_heightTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon heightTypeEnumMap]::sHeightTypeEnumStructs, 2, 1);
  v1 = (void *)+[WXCommon heightTypeEnumMap]::sHeightTypeEnumMap;
  +[WXCommon heightTypeEnumMap]::sHeightTypeEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)numberFormatEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_240_0, 0, &dword_22A0CC000);
  }
  if (+[WXCommon numberFormatEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon numberFormatEnumMap]::onceToken, &__block_literal_global_241);
  return (TCEnumerationMap *)(id)+[WXCommon numberFormatEnumMap]::sNumberFormatEnumMap;
}

void __31__WXCommon_numberFormatEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon numberFormatEnumMap]::sNumberFormatEnumStructs, 59, 1);
  v1 = (void *)+[WXCommon numberFormatEnumMap]::sNumberFormatEnumMap;
  +[WXCommon numberFormatEnumMap]::sNumberFormatEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)customNumberFormatEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_366_0, 0, &dword_22A0CC000);
  }
  if (+[WXCommon customNumberFormatEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCommon customNumberFormatEnumMap]::onceToken, &__block_literal_global_367);
  return (TCEnumerationMap *)(id)+[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumMap;
}

void __37__WXCommon_customNumberFormatEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumStructs, 63, 1);
  v1 = (void *)+[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumMap;
  +[WXCommon customNumberFormatEnumMap]::sCustomNumberFormatEnumMap = (uint64_t)v0;

}

@end
