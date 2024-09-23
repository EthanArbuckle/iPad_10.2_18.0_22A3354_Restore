@implementation WXStyleSheet

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  CXNamespace *v9;
  uint64_t v10;
  CXNamespace *v11;
  _xmlNode *Child;
  CXNamespace *v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  CXNamespace *v20;
  void *v21;
  void *v22;
  CXNamespace *v23;
  _xmlNode *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  CXNamespace *v31;
  uint64_t v32;
  void *v33;
  id v34;
  CXNamespace *v35;
  _xmlNode *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  id v40;
  void *v41;
  _BOOL4 v42;
  uint64_t v43;
  CXNamespace *v44;
  id v45;
  id v46;
  id v47;
  unsigned int v48;

  v45 = a4;
  v8 = a5;
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "docDefaults");

  objc_msgSend(v8, "WXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v11, "style");

  while (Child)
  {
    objc_msgSend(v8, "WXMainNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXDefaultStringAttribute(Child, v13, (xmlChar *)"styleId", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v48 = 1;
      objc_msgSend(a1, "styleTypeEnumMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      readEnumProperty<WDStyleType>(Child, (const xmlChar *)"type", v15, &v48);

      objc_msgSend(v45, "createStyleWithId:type:", v14, v48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXStyle readFrom:to:defaults:state:](WXStyle, "readFrom:to:defaults:state:", Child, v16, v10, v8);

    }
    objc_msgSend(v8, "WXMainNamespace");
    v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v17, (xmlChar *)"style");

  }
  objc_msgSend(v8, "WXMainNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "style");

  if (v19)
  {
    while (1)
    {
      objc_msgSend(v8, "WXMainNamespace");
      v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      CXDefaultStringAttribute(v19, v20, (xmlChar *)"styleId", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        break;
LABEL_28:
      objc_msgSend(v8, "WXMainNamespace");
      v44 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v19 = OCXFindNextChild(v19, v44, (xmlChar *)"style");

      if (!v19)
        goto LABEL_29;
    }
    objc_msgSend(v45, "styleWithId:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "WXMainNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = (_xmlNode *)OCXFindChild(v19, v23, "basedOn");

    if (!v24)
    {
LABEL_17:
      v34 = v22;
      objc_msgSend(v8, "WXMainNamespace");
      v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v36 = (_xmlNode *)OCXFindChild(v19, v35, "next");

      v37 = v34;
      if (!v36)
      {
LABEL_27:
        objc_msgSend(v34, "setNextStyle:", v37);

        goto LABEL_28;
      }
      objc_msgSend(v8, "WXMainNamespace");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v39 = CXOptionalStringAttribute(v36, v38, (xmlChar *)"val", &v46);
      v40 = v46;
      v41 = v40;
      if (v40)
        v42 = v39;
      else
        v42 = 0;
      if (v42)
      {
        v43 = objc_msgSend(v40, "length");

        v37 = v34;
        if (!v43)
        {
LABEL_26:

          goto LABEL_27;
        }
        objc_msgSend(v45, "styleWithId:", v41);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v34;
      }
      else
      {
        v37 = v34;
      }

      goto LABEL_26;
    }
    objc_msgSend(v8, "WXMainNamespace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v26 = CXOptionalStringAttribute(v24, v25, (xmlChar *)"val", &v47);
    v27 = v47;
    v28 = v27;
    if (v27)
      v29 = v26;
    else
      v29 = 0;
    if (v29)
    {
      v30 = objc_msgSend(v27, "length");

      if (!v30)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v45, "styleWithId:", v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBaseStyle:", v25);
      objc_msgSend(v8, "WXMainNamespace");
      v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v32 = OCXFindChild(a3, v31, "tblPr");

      if (v32)
      {
        objc_msgSend(v22, "tableProperties");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setBaseStyle:", v25);

      }
    }

    goto LABEL_16;
  }
LABEL_29:

}

+ (id)styleTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_42, 0, &dword_22A0CC000);
  }
  if (+[WXStyleSheet styleTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXStyleSheet styleTypeEnumMap]::onceToken, &__block_literal_global_93);
  return (id)+[WXStyleSheet styleTypeEnumMap]::sStyleTypeEnumMap;
}

void __32__WXStyleSheet_styleTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXStyleSheet styleTypeEnumMap]::sStyleTypeEnumStructs, 4);
  v1 = (void *)+[WXStyleSheet styleTypeEnumMap]::sStyleTypeEnumMap;
  +[WXStyleSheet styleTypeEnumMap]::sStyleTypeEnumMap = (uint64_t)v0;

}

@end
