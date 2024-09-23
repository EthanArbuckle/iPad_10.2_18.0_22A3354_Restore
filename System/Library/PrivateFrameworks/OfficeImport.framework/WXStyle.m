@implementation WXStyle

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 defaults:(_xmlNode *)a5 state:(id)a6
{
  id v10;
  id v11;
  void *v12;
  CXNamespace *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  CXNamespace *v18;
  _xmlNode *v19;
  CXNamespace *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  CXNamespace *v24;
  _xmlNode *v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  CXNamespace *v33;
  _xmlNode *v34;
  CXNamespace *v35;
  uint64_t v36;
  void *v37;
  CXNamespace *v38;
  _xmlNode *v39;
  CXNamespace *v40;
  uint64_t v41;
  void *v42;
  CXNamespace *v43;
  uint64_t v44;
  void *v45;
  CXNamespace *v46;
  uint64_t v47;
  void *v48;
  CXNamespace *v49;
  uint64_t v50;
  void *v51;
  CXNamespace *v52;
  uint64_t v53;
  void *v54;
  CXNamespace *v55;
  uint64_t v56;
  void *v57;
  CXNamespace *v58;
  _xmlNode *Child;
  void *v60;
  void *v61;
  CXNamespace *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  unsigned int v67;
  BOOL v68;

  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "styleSheet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v11, "WXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = CXOptionalBoolAttribute(a3, v13, (xmlChar *)"default", &v68);
  v15 = v68 && v14;

  if (v15)
  {
    v67 = 1;
    objc_msgSend(a1, "styleTypeEnumMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = readEnumProperty<WDStyleType>(a3, (const xmlChar *)"type", v16, &v67);

    if (v17)
    {
      switch(v67)
      {
        case 1u:
          objc_msgSend(v12, "setDefaultParagraphStyle:", v10);
          break;
        case 2u:
          objc_msgSend(v12, "setDefaultCharacterStyle:", v10);
          break;
        case 3u:
          objc_msgSend(v12, "setDefaultTableStyle:", v10);
          break;
        case 4u:
          objc_msgSend(v12, "setDefaultListStyle:", v10);
          break;
        default:
          break;
      }
    }
  }
  objc_msgSend(v11, "WXMainNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "uiName");

  if (v19
    || (objc_msgSend(v11, "WXMainNamespace"),
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v19 = (_xmlNode *)OCXFindChild(a3, v20, "name"),
        v20,
        v19))
  {
    objc_msgSend(v11, "WXMainNamespace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v22 = CXOptionalStringAttribute(v19, v21, (xmlChar *)"val", &v66);
    v23 = v66;

    if (v22)
      objc_msgSend(v10, "setName:", v23);
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v11, "WXMainNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v25 = (_xmlNode *)OCXFindChild(a3, v24, "aliases");

  if (!v25)
  {
    v63 = v23;
    if (!a5)
      goto LABEL_34;
    goto LABEL_27;
  }
  objc_msgSend(v11, "WXMainNamespace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v23;
  v27 = CXOptionalStringAttribute(v25, v26, (xmlChar *)"val", &v65);
  v28 = v65;

  v63 = v28;
  if (v27)
  {
    objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(","), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    if (v30)
    {
      for (i = 0; i != v30; ++i)
      {
        objc_msgSend(v29, "objectAtIndex:", i);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "length"))
          objc_msgSend(v12, "addStyle:name:", v10, v32);

      }
    }

  }
  if (a5)
  {
LABEL_27:
    if (v68)
    {
      objc_msgSend(v11, "WXMainNamespace");
      v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v34 = (_xmlNode *)OCXFindChild(a5, v33, "rPrDefault");

      if (v34)
      {
        objc_msgSend(v11, "WXMainNamespace");
        v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v36 = OCXFindChild(v34, v35, "rPr");

        if (v36)
        {
          objc_msgSend(v12, "defaultCharacterProperties");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v36, v37, v11);

        }
      }
      objc_msgSend(v11, "WXMainNamespace", v63);
      v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v39 = (_xmlNode *)OCXFindChild(a5, v38, "pPrDefault");

      if (v39)
      {
        objc_msgSend(v11, "WXMainNamespace");
        v40 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v41 = OCXFindChild(v39, v40, "pPr");

        if (v41)
        {
          objc_msgSend(v12, "defaultParagraphProperties");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[WXParagraphProperties readFrom:to:readBaseStyle:state:](WXParagraphProperties, "readFrom:to:readBaseStyle:state:", v41, v42, 0, v11);

        }
      }
    }
  }
LABEL_34:
  objc_msgSend(v11, "WXMainNamespace", v63);
  v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v44 = OCXFindChild(a3, v43, "rPr");

  if (v44)
  {
    objc_msgSend(v10, "characterProperties");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v44, v45, v11);

  }
  objc_msgSend(v11, "WXMainNamespace");
  v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v47 = OCXFindChild(a3, v46, "pPr");

  if (v47)
  {
    objc_msgSend(v10, "paragraphProperties");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXParagraphProperties readFrom:to:readBaseStyle:state:](WXParagraphProperties, "readFrom:to:readBaseStyle:state:", v47, v48, 0, v11);

  }
  if (objc_msgSend(v10, "type") == 3)
  {
    objc_msgSend(v11, "WXMainNamespace");
    v49 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v50 = OCXFindChild(a3, v49, "tblPr");

    if (v50)
    {
      objc_msgSend(v10, "tableProperties");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXTableProperties readFrom:to:state:](WXTableProperties, "readFrom:to:state:", v50, v51, v11);

    }
    objc_msgSend(v11, "WXMainNamespace");
    v52 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v53 = OCXFindChild(a3, v52, "trPr");

    if (v53)
    {
      objc_msgSend(v10, "tableRowProperties");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXTableRowProperties readFrom:to:state:](WXTableRowProperties, "readFrom:to:state:", v53, v54, v11);

    }
    objc_msgSend(v11, "WXMainNamespace");
    v55 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v56 = OCXFindChild(a3, v55, "tcPr");

    if (v56)
    {
      objc_msgSend(v10, "tableCellProperties");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXTableCellProperties readFrom:to:state:](WXTableCellProperties, "readFrom:to:state:", v56, v57, v11);

    }
    objc_msgSend(v11, "WXMainNamespace");
    v58 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v58, "tblStylePr");

    while (Child)
    {
      v67 = 0;
      objc_msgSend(a1, "tableStyleOverrideTypeEnumMap");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      readEnumProperty<WDTableStylePart>(Child, (const xmlChar *)"type", v60, &v67);

      objc_msgSend(v10, "tableStyleOverrideForPart:", v67);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXTableStyleOverride readFrom:to:state:](WXTableStyleOverride, "readFrom:to:state:", Child, v61, v11);
      objc_msgSend(v11, "WXMainNamespace");
      v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v62, (xmlChar *)"tblStylePr");

    }
  }

}

+ (id)styleTypeEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_41, 0, &dword_22A0CC000);
  }
  if (+[WXStyle styleTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXStyle styleTypeEnumMap]::onceToken, &__block_literal_global_92);
  return (id)+[WXStyle styleTypeEnumMap]::sStyleTypeEnumMap;
}

void __27__WXStyle_styleTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXStyle styleTypeEnumMap]::sStyleTypeEnumStructs, 4);
  v1 = (void *)+[WXStyle styleTypeEnumMap]::sStyleTypeEnumMap;
  +[WXStyle styleTypeEnumMap]::sStyleTypeEnumMap = (uint64_t)v0;

}

+ (id)tableStyleOverrideTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_32_0, 0, &dword_22A0CC000);
  }
  if (+[WXStyle tableStyleOverrideTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXStyle tableStyleOverrideTypeEnumMap]::onceToken, &__block_literal_global_33);
  return (id)+[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumMap;
}

void __40__WXStyle_tableStyleOverrideTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumStructs, 12, 1);
  v1 = (void *)+[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumMap;
  +[WXStyle tableStyleOverrideTypeEnumMap]::sTableStyleOverrideTypeEnumMap = (uint64_t)v0;

}

@end
