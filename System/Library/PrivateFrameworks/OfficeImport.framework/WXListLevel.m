@implementation WXListLevel

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  CXNamespace *v10;
  _xmlNode *v11;
  CXNamespace *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  CXNamespace *v15;
  _xmlAttr *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CXNamespace *v22;
  _xmlNode *v23;
  CXNamespace *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  CXNamespace *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  uint64_t v35;
  CXNamespace *v36;
  _xmlNode *v37;
  CXNamespace *v38;
  _BOOL4 v39;
  CXNamespace *v40;
  _BOOL4 v41;
  CXNamespace *v42;
  _BOOL4 v43;
  void *v44;
  int v45;
  CXNamespace *v46;
  _xmlNode *v47;
  CXNamespace *v48;
  _BOOL4 v49;
  _BOOL4 v50;
  id v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  CXNamespace *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  CXNamespace *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  BOOL v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  BOOL v72;

  v8 = a4;
  v9 = a5;
  v72 = 0;
  objc_msgSend(v9, "WXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "isLgl");

  objc_msgSend(v9, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = CXOptionalBoolAttribute(v11, v12, (xmlChar *)"val", &v72);

  if ((_DWORD)v11)
    objc_msgSend(v8, "setLegal:", v72);
  objc_msgSend(v9, "WXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "lvlPicBulletId");

  if (v14)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v16 = CXRequiredLongAttribute(v14, v15, (xmlChar *)"val");

    objc_msgSend(v8, "paragraphProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "document");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "imageBullets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setImage:", v20);
    objc_msgSend(v8, "characterProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setListCharacterPictureBullet:", 1);

  }
  v71 = 0;
  objc_msgSend(v9, "WXMainNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v23 = (_xmlNode *)OCXFindChild(a3, v22, "lvlRestart");

  objc_msgSend(v9, "WXMainNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = CXOptionalLongAttribute(v23, v24, (xmlChar *)"val", &v71);

  if ((_DWORD)v23)
    objc_msgSend(v8, "setRestartLevel:", v71);
  objc_msgSend(v9, "WXMainNamespace");
  v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v26 = (_xmlNode *)OCXFindChild(a3, v25, "start");

  objc_msgSend(v9, "WXMainNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = CXOptionalLongAttribute(v26, v27, (xmlChar *)"val", &v71);

  if ((_DWORD)v26)
    v28 = (int)v71;
  else
    v28 = 1;
  objc_msgSend(v8, "setStartNumber:", v28);
  v70 = 0;
  +[WXCommon numberFormatEnumMap](WXCommon, "numberFormatEnumMap");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = readEnumProperty<WDNumberFormat>(a3, "numFmt", (const xmlChar *)"val", v29, &v70, v9);

  if (v30)
    objc_msgSend(v8, "setNumberFormat:", v70);
  if (v70 == 62)
  {
    +[WXCommon customNumberFormatEnumMap](WXCommon, "customNumberFormatEnumMap");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = readEnumProperty<WDNumberFormat>(a3, "numFmt", (const xmlChar *)"format", v31, &v70, v9);

    if (v32)
      objc_msgSend(v8, "setNumberFormat:", v70);
  }
  v69 = 0;
  objc_msgSend(a1, "listLevelSuffixEnumMap");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = readEnumProperty<WDListLevelSuffix>(a3, "suff", (const xmlChar *)"val", v33, &v69, v9);

  if (v34)
    v35 = v69;
  else
    v35 = 0;
  objc_msgSend(v8, "setSuffix:", v35);
  objc_msgSend(v9, "WXMainNamespace");
  v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v37 = (_xmlNode *)OCXFindChild(a3, v36, "legacy");

  if (v37)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v39 = CXOptionalBoolAttribute(v37, v38, (xmlChar *)"legacy", &v72);

    if (v39)
      objc_msgSend(v8, "setLegacy:", v72);
    if (objc_msgSend(v8, "legacy"))
    {
      objc_msgSend(v9, "WXMainNamespace");
      v40 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v41 = CXOptionalLongAttribute(v37, v40, (xmlChar *)"legacySpace", &v71, 14);

      if (v41)
        objc_msgSend(v8, "setLegacySpace:", v71);
      objc_msgSend(v9, "WXMainNamespace");
      v42 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v43 = CXOptionalLongAttribute(v37, v42, (xmlChar *)"legacyIndent", &v71, 14);

      if (v43)
        objc_msgSend(v8, "setLegacyIndent:", v71);
    }
  }
  v68 = 0;
  +[WXCommon justifyEnumMap](WXCommon, "justifyEnumMap");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = readEnumProperty<WDJustification>(a3, "lvlJc", (const xmlChar *)"val", v44, &v68, v9);

  if (v45)
    objc_msgSend(v8, "setJustification:", v68);
  objc_msgSend(v9, "WXMainNamespace");
  v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v47 = (_xmlNode *)OCXFindChild(a3, v46, "lvlText");

  if (v47)
  {
    v67 = 0;
    objc_msgSend(v9, "WXMainNamespace");
    v48 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v49 = CXOptionalBoolAttribute(v47, v48, (xmlChar *)"null", &v67);
    v50 = v67 && v49;

    if (v50)
    {
      v51 = 0;
      objc_msgSend(v8, "setText:", &stru_24F3BFFF8);
    }
    else
    {
      objc_msgSend(v9, "WXMainNamespace");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v53 = CXOptionalStringAttribute(v47, v52, (xmlChar *)"val", &v66);
      v51 = v66;

      if (v53)
        objc_msgSend(v8, "setText:", v51);
    }

  }
  objc_msgSend(v8, "paragraphProperties");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "document");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "styleSheet");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "defaultListStyle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "WXMainNamespace");
  v58 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v59 = OCXFindChild(a3, v58, "pPr");

  if (v59)
  {
    if (v57)
    {
      objc_msgSend(v8, "paragraphProperties");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setBaseStyle:", v57);

    }
    objc_msgSend(v8, "paragraphProperties");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXParagraphProperties readFrom:to:readBaseStyle:state:](WXParagraphProperties, "readFrom:to:readBaseStyle:state:", v59, v61, 0, v9);

  }
  objc_msgSend(v9, "WXMainNamespace");
  v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v63 = OCXFindChild(a3, v62, "rPr");

  if (v63)
  {
    if (v57)
    {
      objc_msgSend(v8, "characterProperties");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setBaseStyle:", v57);

    }
    objc_msgSend(v8, "characterProperties");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v63, v65, v9);

  }
}

+ (id)listLevelSuffixEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_36, 0, &dword_22A0CC000);
  }
  if (+[WXListLevel listLevelSuffixEnumMap]::once != -1)
    dispatch_once(&+[WXListLevel listLevelSuffixEnumMap]::once, &__block_literal_global_87);
  return (id)+[WXListLevel listLevelSuffixEnumMap]::sListLevelSuffixEnumMap;
}

void __37__WXListLevel_listLevelSuffixEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXListLevel listLevelSuffixEnumMap]::sListLevelSuffixEnumStructs, 3);
  v1 = (void *)+[WXListLevel listLevelSuffixEnumMap]::sListLevelSuffixEnumMap;
  +[WXListLevel listLevelSuffixEnumMap]::sListLevelSuffixEnumMap = (uint64_t)v0;

}

@end
