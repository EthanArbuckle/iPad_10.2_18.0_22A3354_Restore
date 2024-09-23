@implementation WXRubyProperties

+ (id)rubyAlignmentEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_47, 0, &dword_22A0CC000);
  }
  if (+[WXRubyProperties rubyAlignmentEnumMap]::onceToken != -1)
    dispatch_once(&+[WXRubyProperties rubyAlignmentEnumMap]::onceToken, &__block_literal_global_97);
  return (id)+[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentEnumMap;
}

void __40__WXRubyProperties_rubyAlignmentEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentStructs, 6, 1);
  v1 = (void *)+[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentEnumMap;
  +[WXRubyProperties rubyAlignmentEnumMap]::sRubyAlignmentEnumMap = (uint64_t)v0;

}

+ (int)rubyAlignmentFromString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  objc_msgSend(a1, "rubyAlignmentEnumMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueForString:", v4);

  if (v6 == -130883970)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  _xmlNode *i;
  void *v10;
  NSString *v11;
  CXNamespace *v12;
  _BOOL4 v13;
  CXNamespace *v14;
  _BOOL4 v15;
  CXNamespace *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;

  v7 = a4;
  v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"rubyAlign"))
    {
      objc_msgSend(v8, "WXMainNamespace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      CXOptionalStringAttribute(i, v10, (xmlChar *)"val", &v21);
      v11 = (NSString *)v21;

      if (v11)
      {
        if (-[NSString length](v11, "length"))
          objc_msgSend(v7, "setAlignment:", +[WXRubyProperties rubyAlignmentFromString:](WXRubyProperties, "rubyAlignmentFromString:", v11));
      }
LABEL_7:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"hps"))
    {
      v20 = 0;
      objc_msgSend(v8, "WXMainNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v13 = CXOptionalLongAttribute(i, v12, (xmlChar *)"val", &v20, 15);

      if (v13)
        objc_msgSend(v7, "setPhoneticGuideFontSize:", (unsigned __int16)v20);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"hpsRaise"))
    {
      v20 = 0;
      objc_msgSend(v8, "WXMainNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v15 = CXOptionalLongAttribute(i, v14, (xmlChar *)"val", &v20, 15);

      if (v15)
        objc_msgSend(v7, "setDistanceBetween:", (unsigned __int16)v20);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"hpsBaseText"))
    {
      v20 = 0;
      objc_msgSend(v8, "WXMainNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v17 = CXOptionalLongAttribute(i, v16, (xmlChar *)"val", &v20, 15);

      if (v17)
        objc_msgSend(v7, "setBaseFontSize:", (unsigned __int16)v20);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"lid"))
    {
      objc_msgSend(v8, "WXMainNamespace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      CXOptionalStringAttribute(i, v18, (xmlChar *)"val", &v19);
      v11 = (NSString *)v19;

      if (v11 && -[NSString length](v11, "length"))
        objc_msgSend(v7, "setPhoneticGuideLanguage:", OCDLanguageFromOfficeString(v11));
      goto LABEL_7;
    }
  }

}

@end
