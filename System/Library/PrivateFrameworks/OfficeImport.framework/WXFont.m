@implementation WXFont

+ (id)fontFamilyEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_34, 0, &dword_22A0CC000);
  }
  if (+[WXFont fontFamilyEnumMap]::onceToken != -1)
    dispatch_once(&+[WXFont fontFamilyEnumMap]::onceToken, &__block_literal_global_85);
  return (id)+[WXFont fontFamilyEnumMap]::sFontFamilyEnumMap;
}

void __27__WXFont_fontFamilyEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXFont fontFamilyEnumMap]::sFontFamilyEnumStructs, 6);
  v1 = (void *)+[WXFont fontFamilyEnumMap]::sFontFamilyEnumMap;
  +[WXFont fontFamilyEnumMap]::sFontFamilyEnumMap = (uint64_t)v0;

}

+ (id)characterSetEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_56, 0, &dword_22A0CC000);
  }
  if (+[WXFont characterSetEnumMap]::onceToken != -1)
    dispatch_once(&+[WXFont characterSetEnumMap]::onceToken, &__block_literal_global_57);
  return (id)+[WXFont characterSetEnumMap]::sCharacterSetEnumMap;
}

void __29__WXFont_characterSetEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXFont characterSetEnumMap]::sCharacterSetEnumStructs, 22);
  v1 = (void *)+[WXFont characterSetEnumMap]::sCharacterSetEnumMap;
  +[WXFont characterSetEnumMap]::sCharacterSetEnumMap = (uint64_t)v0;

}

+ (id)isoCharacterSetEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_92_0, 0, &dword_22A0CC000);
  }
  if (+[WXFont isoCharacterSetEnumMap]::onceToken != -1)
    dispatch_once(&+[WXFont isoCharacterSetEnumMap]::onceToken, &__block_literal_global_93);
  return (id)+[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumMap;
}

void __32__WXFont_isoCharacterSetEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumStructs, 18);
  v1 = (void *)+[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumMap;
  +[WXFont isoCharacterSetEnumMap]::sISOCharacterSetEnumMap = (uint64_t)v0;

}

+ (id)fontPitchEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_100, 0, &dword_22A0CC000);
  }
  if (+[WXFont fontPitchEnumMap]::onceToken != -1)
    dispatch_once(&+[WXFont fontPitchEnumMap]::onceToken, &__block_literal_global_101);
  return (id)+[WXFont fontPitchEnumMap]::sFontPitchEnumMap;
}

void __26__WXFont_fontPitchEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXFont fontPitchEnumMap]::sFontPitchEnumStructs, 3);
  v1 = (void *)+[WXFont fontPitchEnumMap]::sFontPitchEnumMap;
  +[WXFont fontPitchEnumMap]::sFontPitchEnumMap = (uint64_t)v0;

}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "altName");

  if (v10)
  {
    objc_msgSend(v8, "WXMainNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v12 = CXOptionalStringAttribute(v10, v11, (xmlChar *)"val", &v35);
    v26 = v35;

    if (v12)
    {
      objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(","));
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v32;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet", v26);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v19, "length"))
              objc_msgSend(v7, "addAlternateName:", v19);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v14);
      }

    }
  }
  v30 = 0;
  objc_msgSend(a1, "fontFamilyEnumMap", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  readEnumProperty<WDFontFamily>(a3, "family", (const xmlChar *)"val", v20, &v30, v8);

  objc_msgSend(v7, "setFontFamily:", v30);
  v29 = 0;
  objc_msgSend(a1, "characterSetEnumMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = readEnumProperty<WDCharacterSet>(a3, "charset", (const xmlChar *)"val", v21, &v29, v8);

  if ((v22 & 1) != 0
    || (objc_msgSend(a1, "isoCharacterSetEnumMap"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = readEnumProperty<WDCharacterSet>(a3, "charset", (const xmlChar *)"characterSet", v23, &v29, v8),
        v23,
        v24))
  {
    objc_msgSend(v7, "setCharacterSet:", v29);
  }
  v28 = 0;
  objc_msgSend(a1, "fontPitchEnumMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  readEnumProperty<WDFontPitch>(a3, "pitch", (const xmlChar *)"val", v25, &v28, v8);

  objc_msgSend(v7, "setPitch:", v28);
}

@end
