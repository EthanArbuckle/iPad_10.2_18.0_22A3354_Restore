@implementation WXTableProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  WXReadState *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  unsigned __int16 v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  id v17;
  BOOL v18;
  int v19;
  CXNamespace *v20;
  void *v21;
  id v22;
  CXNamespace *v23;
  xmlNode *v24;
  void *v25;
  CXNamespace *v26;
  xmlNode *v27;
  void *v28;
  CXNamespace *v29;
  _xmlNode *v30;
  CXNamespace *v31;
  _xmlNode *v32;
  CXNamespace *v33;
  uint64_t v34;
  void *v35;
  CXNamespace *v36;
  _xmlNode *v37;
  CXNamespace *v38;
  uint64_t v39;
  void *v40;
  CXNamespace *v41;
  _xmlNode *v42;
  CXNamespace *v43;
  CXNamespace *v44;
  void *v45;
  CXNamespace *v46;
  _xmlNode *v47;
  CXNamespace *v48;
  CXNamespace *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  CXNamespace *v54;
  uint64_t v55;
  void *v56;
  CXNamespace *v57;
  _xmlNode *v58;
  CXNamespace *v59;
  uint64_t v60;
  void *v61;
  CXNamespace *v62;
  uint64_t v63;
  CXNamespace *v64;
  void *v65;
  CXNamespace *v66;
  uint64_t v67;
  void *v68;
  CXNamespace *v69;
  uint64_t v70;
  CXNamespace *v71;
  void *v72;
  CXNamespace *v73;
  uint64_t v74;
  void *v75;
  CXNamespace *v76;
  uint64_t v77;
  void *v78;
  CXNamespace *v79;
  _xmlNode *v80;
  void *v81;
  int v82;
  void *v83;
  int v84;
  void *v85;
  int v86;
  uint64_t v87;
  CXNamespace *v88;
  _BOOL4 v89;
  void *v90;
  int v91;
  uint64_t v92;
  CXNamespace *v93;
  _BOOL4 v94;
  CXNamespace *v95;
  _BOOL4 v96;
  CXNamespace *v97;
  _BOOL4 v98;
  CXNamespace *v99;
  _BOOL4 v100;
  CXNamespace *v101;
  _BOOL4 v102;
  CXNamespace *v103;
  _xmlNode *v104;
  void *v105;
  void *v106;
  void *v107;
  CXNamespace *v108;
  uint64_t v109;
  _xmlNode *v110;
  void *v111;
  int v113;
  int v114;
  BOOL v115[8];
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  __int16 v120;

  v7 = a4;
  v8 = (WXReadState *)a5;
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v111 = v7;
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "tblLook");

  if (!v10)
  {
LABEL_12:
    v11 = 37;
    goto LABEL_13;
  }
  v110 = a3;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  do
  {
    objc_msgSend(a1, "tableLookBitEnumMap", v110);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForValue:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v115[0] = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = objc_retainAutorelease(v15);
    v18 = CXOptionalBoolAttribute(v10, v16, (xmlChar *)objc_msgSend(v17, "UTF8String"), v115);

    if (v18)
    {
      v12 = 1;
      if (v115[0])
        v19 = 1 << v13;
      else
        LOWORD(v19) = 0;
    }
    else
    {
      v19 = 1 << v13;
    }
    v11 |= v19;

    v13 = (v13 + 1);
  }
  while ((_DWORD)v13 != 6);
  a3 = v110;
  if ((v12 & 1) == 0)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXDefaultStringAttribute(v10, v20, (xmlChar *)"val", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_retainAutorelease(v21);
      v11 = (unsigned __int16)strtoul((const char *)objc_msgSend(v22, "UTF8String"), 0, 16) >> 5;

      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v111, "setLook:", v11);
  v120 = 0;
  v119 = 0;
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v24 = (xmlNode *)OCXFindChild(a3, v23, "tblW");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = WXOptionalTableWidthAttribute(v24, v25, (xmlChar *)"w", &v120, &v119);

  if ((_DWORD)v24)
  {
    objc_msgSend(v111, "setWidth:", v120);
    objc_msgSend(v111, "setWidthType:", v119);
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v27 = (xmlNode *)OCXFindChild(a3, v26, "tblInd");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = WXOptionalTableWidthAttribute(v27, v28, (xmlChar *)"w", &v120, &v119);

  if ((_DWORD)v27)
  {
    objc_msgSend(v111, "setIndent:", v120);
    objc_msgSend(v111, "setIndentType:", v119);
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v30 = (_xmlNode *)OCXFindChild(a3, v29, "tblCellMar");

  if (v30)
  {
    *(_DWORD *)v115 = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v32 = (_xmlNode *)OCXFindChild(v30, v31, "top");

    if (v32)
    {
      -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
      v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v34 = CXDefaultLongAttribute(v32, v33, (xmlChar *)"w", 0);

      +[WXCommon tableWidthTypeEnumMap](WXCommon, "tableWidthTypeEnumMap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      readEnumProperty<WDTableWidthType>(v30, "top", (const xmlChar *)"type", v35, v115, v8);

    }
    else
    {
      v34 = 0;
    }
    v118 = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v37 = (_xmlNode *)OCXFindChild(v30, v36, "bottom");

    if (v37)
    {
      -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
      v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v39 = CXDefaultLongAttribute(v37, v38, (xmlChar *)"w", 0);

      +[WXCommon tableWidthTypeEnumMap](WXCommon, "tableWidthTypeEnumMap");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      readEnumProperty<WDTableWidthType>(v30, "bottom", (const xmlChar *)"type", v40, &v118, v8);

    }
    else
    {
      v39 = 0;
    }
    v117 = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v42 = (_xmlNode *)OCXFindChild(v30, v41, "left");

    if (v42
      || (-[WXReadState WXMainNamespace](v8, "WXMainNamespace"),
          v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v42 = (_xmlNode *)OCXFindChild(v30, v43, "start"),
          v43,
          v42))
    {
      -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
      v44 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v42 = (_xmlNode *)CXDefaultLongAttribute(v42, v44, (xmlChar *)"w", 0);

      +[WXCommon tableWidthTypeEnumMap](WXCommon, "tableWidthTypeEnumMap");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      readEnumProperty<WDTableWidthType>(v30, "left", (const xmlChar *)"type", v45, &v117, v8);

    }
    v116 = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v47 = (_xmlNode *)OCXFindChild(v30, v46, "right");

    if (v47
      || (-[WXReadState WXMainNamespace](v8, "WXMainNamespace"),
          v48 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v47 = (_xmlNode *)OCXFindChild(v30, v48, "end"),
          v48,
          v47))
    {
      -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
      v49 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v47 = (_xmlNode *)CXDefaultLongAttribute(v47, v49, (xmlChar *)"w", 0);

      +[WXCommon tableWidthTypeEnumMap](WXCommon, "tableWidthTypeEnumMap");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      readEnumProperty<WDTableWidthType>(v30, "right", (const xmlChar *)"type", v50, &v116, v8);

    }
    if (v34 == v39
      && (_xmlNode *)v34 == v42
      && (_xmlNode *)v34 == v47
      && *(_DWORD *)v115 == v118
      && *(_DWORD *)v115 == v117
      && *(_DWORD *)v115 == v116)
    {
      objc_msgSend(v111, "setCellSpacing:", (__int16)v34);
      objc_msgSend(v111, "setCellSpacingType:", *(unsigned int *)v115);
    }
  }
  v118 = 0;
  +[WXCommon justifyEnumMap](WXCommon, "justifyEnumMap");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (readEnumProperty<WDJustification>(a3, "jc", (const xmlChar *)"val", v51, &v118, v8))
  {

  }
  else
  {
    +[WXCommon strictJustifyEnumMap](WXCommon, "strictJustifyEnumMap");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = readEnumProperty<WDJustification>(a3, "jc", (const xmlChar *)"val", v52, &v118, v8);

    if (!v53)
      goto LABEL_41;
  }
  objc_msgSend(v111, "setAlignment:", v118);
LABEL_41:
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v54 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v55 = OCXFindChild(a3, v54, "shd");

  if (v55)
  {
    objc_msgSend(v111, "mutableShading");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXShading readFrom:to:state:](WXShading, "readFrom:to:state:", v55, v56, v8);

  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v57 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v58 = (_xmlNode *)OCXFindChild(a3, v57, "tblBorders");

  if (v58)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v59 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v60 = OCXFindChild(v58, v59, "top");

    if (v60)
    {
      objc_msgSend(v111, "mutableTopBorder");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v60, v61, v8);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v63 = OCXFindChild(v58, v62, "left");

    if (v63
      || (-[WXReadState WXMainNamespace](v8, "WXMainNamespace"),
          v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v63 = OCXFindChild(v58, v64, "start"),
          v64,
          v63))
    {
      objc_msgSend(v111, "mutableLeftBorder");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v63, v65, v8);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v66 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v67 = OCXFindChild(v58, v66, "bottom");

    if (v67)
    {
      objc_msgSend(v111, "mutableBottomBorder");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v67, v68, v8);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v69 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v70 = OCXFindChild(v58, v69, "right");

    if (v70
      || (-[WXReadState WXMainNamespace](v8, "WXMainNamespace"),
          v71 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v70 = OCXFindChild(v58, v71, "end"),
          v71,
          v70))
    {
      objc_msgSend(v111, "mutableRightBorder");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v70, v72, v8);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v73 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v74 = OCXFindChild(v58, v73, "insideV");

    if (v74)
    {
      objc_msgSend(v111, "mutableInsideVerticalBorder");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v74, v75, v8);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v76 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v77 = OCXFindChild(v58, v76, "insideH");

    if (v77)
    {
      objc_msgSend(v111, "mutableInsideHorizontalBorder");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v77, v78, v8);

    }
  }
  -[WXReadState setCurrentTableWraps:](v8, "setCurrentTableWraps:", 0);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v79 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v80 = (_xmlNode *)OCXFindChild(a3, v79, "tblpPr");

  if (v80)
  {
    v117 = 0;
    objc_msgSend(a1, "tableVerticalAnchorEnumMap");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = readEnumProperty<WDVerticalAnchor>(v80, (const xmlChar *)"vertAnchor", v81, &v117);

    if (v82)
      objc_msgSend(v111, "setVerticalAnchor:", v117);
    v116 = 0;
    objc_msgSend(a1, "tableHorizontalAnchorEnumMap");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = readEnumProperty<WDHorizontalAnchor>(v80, (const xmlChar *)"horzAnchor", v83, &v116);

    if (v84)
      objc_msgSend(v111, "setHorizontalAnchor:", v116);
    *(_QWORD *)v115 = 0;
    v114 = -4;
    objc_msgSend(a1, "tableVerticalPositionEnumMap");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = readEnumProperty<WDVerticalPosition>(v80, (const xmlChar *)"tblpYSpec", v85, &v114);

    if (v86)
    {
      v87 = v114;
    }
    else
    {
      -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
      v88 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v89 = CXOptionalLongAttribute(v80, v88, (xmlChar *)"tblpY", (uint64_t *)v115, 14);

      if (!v89)
        goto LABEL_68;
      v87 = *(_QWORD *)v115;
    }
    objc_msgSend(v111, "setVerticalPosition:", v87);
LABEL_68:
    v113 = 0;
    objc_msgSend(a1, "tableHorizontalPositionEnumMap");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = readEnumProperty<WDHorizontalPosition>(v80, (const xmlChar *)"tblpXSpec", v90, &v113);

    if (v91)
    {
      v92 = v113;
    }
    else
    {
      -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
      v93 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v94 = CXOptionalLongAttribute(v80, v93, (xmlChar *)"tblpX", (uint64_t *)v115, 14);

      if (!v94)
      {
LABEL_73:
        -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
        v95 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v96 = CXOptionalLongAttribute(v80, v95, (xmlChar *)"leftFromText", (uint64_t *)v115, 14);

        if (v96)
        {
          objc_msgSend(v111, "setLeftDistanceFromText:", *(_QWORD *)v115);
          -[WXReadState setCurrentTableWraps:](v8, "setCurrentTableWraps:", 1);
        }
        -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
        v97 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v98 = CXOptionalLongAttribute(v80, v97, (xmlChar *)"topFromText", (uint64_t *)v115, 14);

        if (v98)
        {
          objc_msgSend(v111, "setTopDistanceFromText:", *(_QWORD *)v115);
          -[WXReadState setCurrentTableWraps:](v8, "setCurrentTableWraps:", 1);
        }
        -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
        v99 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v100 = CXOptionalLongAttribute(v80, v99, (xmlChar *)"rightFromText", (uint64_t *)v115, 14);

        if (v100)
        {
          objc_msgSend(v111, "setRightDistanceFromText:", *(_QWORD *)v115);
          -[WXReadState setCurrentTableWraps:](v8, "setCurrentTableWraps:", 1);
        }
        -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
        v101 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v102 = CXOptionalLongAttribute(v80, v101, (xmlChar *)"bottomFromText", (uint64_t *)v115, 14);

        if (v102)
        {
          objc_msgSend(v111, "setBottomDistanceFromText:", *(_QWORD *)v115);
          -[WXReadState setCurrentTableWraps:](v8, "setCurrentTableWraps:", 1);
        }
        goto LABEL_81;
      }
      v92 = *(_QWORD *)v115;
    }
    objc_msgSend(v111, "setHorizontalPosition:", v92);
    goto LABEL_73;
  }
LABEL_81:
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v103 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v104 = (_xmlNode *)OCXFindChild(a3, v103, "tblPrChange");

  if (v104)
  {
    if (!objc_msgSend(v111, "resolveMode"))
      objc_msgSend(v111, "moveOrignalToTracked");
    objc_msgSend(v111, "setFormattingChanged:", 1);
    wmxmlGetDateProperty(v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setFormattingChangeDate:", v105);

    -[WXReadState document](v8, "document");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetAuthorProperty(v104);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v106, "revisionAuthorAddLookup:", v107));

    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v108 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v109 = OCXFindChild(v104, v108, "tblPr");

    if (v109)
      objc_msgSend(a1, "readFrom:to:state:", v109, v111, v8);
    objc_msgSend(v111, "setResolveMode:", 1);
  }
  v115[0] = 0;
  if (wmxmlGetBoolOnlyProperty(a3, "bidiVisual", (const xmlChar *)"val", v115, v8))
    objc_msgSend(v111, "setBiDirectional:", v115[0]);

}

+ (id)tableVerticalAnchorEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_44, 0, &dword_22A0CC000);
  }
  if (+[WXTableProperties tableVerticalAnchorEnumMap]::onceToken != -1)
    dispatch_once(&+[WXTableProperties tableVerticalAnchorEnumMap]::onceToken, &__block_literal_global_95);
  return (id)+[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumMap;
}

void __47__WXTableProperties_tableVerticalAnchorEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumStructs, 3, 1);
  v1 = (void *)+[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumMap;
  +[WXTableProperties tableVerticalAnchorEnumMap]::sTableVerticalAnchorEnumMap = (uint64_t)v0;

}

+ (id)tableHorizontalAnchorEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_6_0, 0, &dword_22A0CC000);
  }
  if (+[WXTableProperties tableHorizontalAnchorEnumMap]::onceToken != -1)
    dispatch_once(&+[WXTableProperties tableHorizontalAnchorEnumMap]::onceToken, &__block_literal_global_7_0);
  return (id)+[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumMap;
}

void __49__WXTableProperties_tableHorizontalAnchorEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumStructs, 3, 1);
  v1 = (void *)+[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumMap;
  +[WXTableProperties tableHorizontalAnchorEnumMap]::sTableHorizontalAnchorEnumMap = (uint64_t)v0;

}

+ (id)tableHorizontalPositionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_18_1, 0, &dword_22A0CC000);
  }
  if (+[WXTableProperties tableHorizontalPositionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXTableProperties tableHorizontalPositionEnumMap]::onceToken, &__block_literal_global_19_1);
  return (id)+[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumMap;
}

void __51__WXTableProperties_tableHorizontalPositionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumStructs, 5, 1);
  v1 = (void *)+[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumMap;
  +[WXTableProperties tableHorizontalPositionEnumMap]::sTableHorizontalPositionEnumMap = (uint64_t)v0;

}

+ (id)tableVerticalPositionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_24_0, 0, &dword_22A0CC000);
  }
  if (+[WXTableProperties tableVerticalPositionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXTableProperties tableVerticalPositionEnumMap]::onceToken, &__block_literal_global_25_1);
  return (id)+[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumMap;
}

void __49__WXTableProperties_tableVerticalPositionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumStructs, 5, 1);
  v1 = (void *)+[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumMap;
  +[WXTableProperties tableVerticalPositionEnumMap]::sTableVerticalPositionEnumMap = (uint64_t)v0;

}

+ (id)tableLookBitEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_38_0, 0, &dword_22A0CC000);
  }
  if (+[WXTableProperties tableLookBitEnumMap]::onceToken != -1)
    dispatch_once(&+[WXTableProperties tableLookBitEnumMap]::onceToken, &__block_literal_global_39);
  return (id)+[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumMap;
}

void __40__WXTableProperties_tableLookBitEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumStructs, 6, 1);
  v1 = (void *)+[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumMap;
  +[WXTableProperties tableLookBitEnumMap]::sTableLookBitEnumMap = (uint64_t)v0;

}

@end
