@implementation EXFont

+ (int)edUnderlineFromXmlUnderlineElement:(_xmlNode *)a3
{
  _BOOL4 v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v11;

  if (!a3)
    return 0;
  v11 = 0;
  v4 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v11);
  v5 = v11;
  if (v5)
    v6 = v4;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(a1, "underlineEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForString:", v5);

    if (v8 == -130883970)
      v9 = 1;
    else
      v9 = v8;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (int)edScriptFromXmlVertAlignElement:(_xmlNode *)a3
{
  _BOOL4 v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v11;

  if (!a3)
    return 0;
  v11 = 0;
  v4 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v11);
  v5 = v11;
  if (v5)
    v6 = v4;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(a1, "vertAlignEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForString:", v5);

    if (v8 == -130883970)
      v9 = 0;
    else
      v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)underlineEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_24, 0, &dword_22A0CC000);
  }
  if (+[EXFont underlineEnumMap]::once != -1)
    dispatch_once(&+[EXFont underlineEnumMap]::once, &__block_literal_global_75);
  return (id)+[EXFont underlineEnumMap]::sUnderlineEnumMap;
}

void __26__EXFont_underlineEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXFont underlineEnumMap]::sUnderlineStructs, 5, 1);
  v1 = (void *)+[EXFont underlineEnumMap]::sUnderlineEnumMap;
  +[EXFont underlineEnumMap]::sUnderlineEnumMap = (uint64_t)v0;

}

+ (id)vertAlignEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_16_0, 0, &dword_22A0CC000);
  }
  if (+[EXFont vertAlignEnumMap]::once != -1)
    dispatch_once(&+[EXFont vertAlignEnumMap]::once, &__block_literal_global_17_3);
  return (id)+[EXFont vertAlignEnumMap]::sVertAlignEnumMap;
}

void __26__EXFont_vertAlignEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXFont vertAlignEnumMap]::sVertAlignStructs, 3, 1);
  v1 = (void *)+[EXFont vertAlignEnumMap]::sVertAlignEnumMap;
  +[EXFont vertAlignEnumMap]::sVertAlignEnumMap = (uint64_t)v0;

}

+ (id)edFontFromXmlFontElement:(_xmlNode *)a3 inConditionalFormat:(BOOL)a4 returnDefaultIfEmpty:(BOOL)a5 state:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  EDFont *v11;
  void *v12;
  EDFont *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  CXNamespace *v16;
  CXNamespace *v17;
  _BOOL4 v18;
  id v19;
  int v20;
  EDFont *v21;
  CXNamespace *v22;
  _xmlNode *v23;
  CXNamespace *v24;
  _xmlNode *v25;
  CXNamespace *v26;
  _xmlNode *v27;
  _BOOL4 v28;
  uint64_t v29;
  CXNamespace *v30;
  _xmlNode *v31;
  _BOOL4 v32;
  uint64_t v33;
  CXNamespace *v34;
  _xmlNode *v35;
  _BOOL4 v36;
  uint64_t v37;
  CXNamespace *v38;
  _xmlNode *v39;
  _BOOL4 v40;
  uint64_t v41;
  CXNamespace *v42;
  _xmlNode *v43;
  _BOOL4 v44;
  uint64_t v45;
  CXNamespace *v46;
  uint64_t v47;
  void *v48;
  CXNamespace *v49;
  _xmlNode *v50;
  CXNamespace *v51;
  uint64_t v52;
  uint64_t v53;
  CXNamespace *v54;
  uint64_t v55;
  _BOOL4 v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  id v66;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  if (a3)
  {
    v11 = [EDFont alloc];
    objc_msgSend(v10, "resources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EDFont initWithResources:](v11, "initWithResources:", v12);

    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = (_xmlNode *)OCXFindChild(a3, v14, "name");

    v57 = v6;
    if (v15)
      goto LABEL_5;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = (_xmlNode *)OCXFindChild(a3, v16, "font");

    if (v15
      || (objc_msgSend(v10, "EXSpreadsheetMLNamespace"),
          v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v15 = (_xmlNode *)OCXFindChild(a3, v17, "rFont"),
          v17,
          v15))
    {
LABEL_5:
      v66 = 0;
      v18 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"val", &v66);
      v19 = v66;
      if (v18)
      {
        -[EDFont setName:](v13, "setName:", v19);
        v20 = 1;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
      v19 = 0;
    }
    v65 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v23 = (_xmlNode *)OCXFindChild(a3, v22, "charset");

    if (v23 && CXOptionalLongAttribute(v23, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v65))
    {
      -[EDFont setCharSet:](v13, "setCharSet:", v65);
      v20 = 1;
    }
    v64 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v25 = (_xmlNode *)OCXFindChild(a3, v24, "family");

    if (v25 && CXOptionalLongAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v64))
    {
      -[EDFont setFamily:](v13, "setFamily:", v64);
      v20 = 1;
    }
    v63 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v27 = (_xmlNode *)OCXFindChild(a3, v26, "b");

    if (v27)
    {
      v28 = !CXOptionalBoolAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v63);
      v29 = v63 || v28;
      -[EDFont setBold:](v13, "setBold:", v29);
      v20 = 1;
    }
    if (-[EDFont isBold](v13, "isBold"))
    {
      -[EDFont setWeight:](v13, "setWeight:", 700);
      v20 = 1;
    }
    v62 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v31 = (_xmlNode *)OCXFindChild(a3, v30, "i");

    if (v31)
    {
      v32 = !CXOptionalLongAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v62);
      if (v62)
        v33 = 1;
      else
        v33 = v32;
      -[EDFont setItalic:](v13, "setItalic:", v33);
      v20 = 1;
    }
    v61 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v35 = (_xmlNode *)OCXFindChild(a3, v34, "strike");

    if (v35)
    {
      v36 = !CXOptionalLongAttribute(v35, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v61);
      if (v61)
        v37 = 1;
      else
        v37 = v36;
      -[EDFont setStrike:](v13, "setStrike:", v37);
      v20 = 1;
    }
    v60 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v39 = (_xmlNode *)OCXFindChild(a3, v38, "shadow");

    if (v39)
    {
      v40 = !CXOptionalLongAttribute(v39, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v60);
      if (v60)
        v41 = 1;
      else
        v41 = v40;
      -[EDFont setShadow:](v13, "setShadow:", v41);
      v20 = 1;
    }
    v59 = 0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v42 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v43 = (_xmlNode *)OCXFindChild(a3, v42, "outline");

    if (v43)
    {
      v44 = !CXOptionalLongAttribute(v43, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v59);
      if (v59)
        v45 = 1;
      else
        v45 = v44;
      -[EDFont setOutline:](v13, "setOutline:", v45);
      v20 = 1;
    }
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v47 = OCXFindChild(a3, v46, "color");

    if (!v7 || v47)
    {
      +[EXColorReference edColorReferenceFromXmlColorElement:callerClass:state:](EXColorReference, "edColorReferenceFromXmlColorElement:callerClass:state:", v47, objc_opt_class(), v10);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDFont setColorReference:](v13, "setColorReference:", v48);

      if (v47)
        v20 = 1;
    }
    v58 = 0.0;
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v49 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v50 = (_xmlNode *)OCXFindChild(a3, v49, "sz");

    if (v50 && CXOptionalDoubleAttribute(v50, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v58))
    {
      -[EDFont setHeight:](v13, "setHeight:", (double)(int)(v58 * 20.0));
      v20 = 1;
    }
    objc_msgSend(v10, "EXSpreadsheetMLNamespace");
    v51 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v52 = OCXFindChild(a3, v51, "u");

    v53 = objc_msgSend(a1, "edUnderlineFromXmlUnderlineElement:", v52);
    if ((_DWORD)v53)
    {
      -[EDFont setUnderline:](v13, "setUnderline:", v53);
      v20 = 1;
    }
    objc_msgSend(v10, "EXSpreadsheetMLNamespace", v53);
    v54 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v55 = OCXFindChild(a3, v54, "vertAlign");

    if (v55)
    {
      -[EDFont setScript:](v13, "setScript:", objc_msgSend(a1, "edScriptFromXmlVertAlignElement:", v55));
    }
    else if ((v20 | v57) != 1)
    {
      v21 = 0;
      goto LABEL_55;
    }
    v21 = v13;
LABEL_55:

    goto LABEL_56;
  }
  v21 = 0;
LABEL_56:

  return v21;
}

@end
