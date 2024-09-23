@implementation WXParagraphProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 readBaseStyle:(BOOL)a5 state:(id)a6
{
  _BOOL8 v7;
  id v9;
  WXReadState *v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  uint64_t v15;
  id v16;
  CXNamespace *v17;
  _xmlNode *v18;
  CXNamespace *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  CXNamespace *v35;
  _xmlNode *v36;
  CXNamespace *v37;
  _BOOL4 v38;
  CXNamespace *v39;
  _BOOL4 v40;
  CXNamespace *v41;
  _BOOL4 v42;
  CXNamespace *v43;
  _BOOL4 v44;
  CXNamespace *v45;
  _BOOL4 v46;
  void *v47;
  _BOOL4 v48;
  id v49;
  uint64_t v50;
  CXNamespace *v51;
  _BOOL4 v52;
  void *v53;
  _BOOL4 v54;
  id v55;
  uint64_t v56;
  CXNamespace *v57;
  _xmlNode *v58;
  CXNamespace *v59;
  _BOOL4 v60;
  int v61;
  CXNamespace *v62;
  _BOOL4 v63;
  CXNamespace *v64;
  _BOOL4 v65;
  CXNamespace *v66;
  _xmlNode *v67;
  CXNamespace *v68;
  CXNamespace *v69;
  _xmlNode *v70;
  CXNamespace *v71;
  CXNamespace *v72;
  _BOOL4 v73;
  CXNamespace *v74;
  CXNamespace *v75;
  _BOOL4 v76;
  CXNamespace *v77;
  _BOOL4 v78;
  int v79;
  CXNamespace *v80;
  _BOOL4 v81;
  int v82;
  void *v83;
  int v84;
  CXNamespace *v85;
  unsigned __int8 v86;
  CXNamespace *v87;
  _xmlNode *v88;
  CXNamespace *v89;
  uint64_t v90;
  void *v91;
  CXNamespace *v92;
  uint64_t v93;
  void *v94;
  CXNamespace *v95;
  uint64_t v96;
  void *v97;
  CXNamespace *v98;
  uint64_t v99;
  void *v100;
  CXNamespace *v101;
  uint64_t v102;
  void *v103;
  CXNamespace *v104;
  uint64_t v105;
  void *v106;
  CXNamespace *v107;
  uint64_t v108;
  void *v109;
  CXNamespace *v110;
  _xmlNode *v111;
  CXNamespace *v112;
  _xmlNode *Child;
  CXNamespace *v114;
  void *v115;
  char Enum;
  int v117;
  void *v118;
  void *v119;
  char v120;
  int v121;
  CXNamespace *v122;
  CXNamespace *v123;
  _xmlNode *v124;
  CXNamespace *v125;
  _xmlNode *v126;
  CXNamespace *v127;
  _BOOL4 v128;
  CXNamespace *v129;
  _xmlNode *v130;
  CXNamespace *v131;
  _BOOL4 v132;
  CXNamespace *v133;
  uint64_t v134;
  void *v135;
  CXNamespace *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  CXNamespace *v142;
  CXNamespace *v143;
  CXNamespace *v144;
  _BOOL4 v145;
  void *v146;
  void *v147;
  CXNamespace *v148;
  _BOOL4 v149;
  CXNamespace *v150;
  _BOOL4 v151;
  CXNamespace *v152;
  _BOOL4 v153;
  void *v154;
  _xmlNode *v155;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  id v164;
  uint64_t v165;
  BOOL v166;
  unsigned int v167;
  unsigned int v168;
  char v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;

  v7 = a5;
  v9 = a4;
  v10 = (WXReadState *)a6;
  v155 = a3;
  if (!a3)
    goto LABEL_171;
  v157 = v9;
  objc_msgSend(v9, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "styleSheet");
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResolveMode:", 0);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "pPrChange");

  if (v13)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = OCXFindChild(v13, v14, "pPr");

    if (v15)
    {
      +[WXParagraphProperties readFrom:to:readBaseStyle:state:](WXParagraphProperties, "readFrom:to:readBaseStyle:state:", v15, v9, v7, v10);
      if (objc_msgSend(v9, "isBaseStyleOverridden"))
      {
        objc_msgSend(v9, "baseStyle");
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v9, "setResolveMode:", 1);
      objc_msgSend(v9, "setFormattingChanged:", 1);
      if (v16)
        objc_msgSend(v9, "setBaseStyle:", v16);

    }
  }
  if (v7)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v18 = (_xmlNode *)OCXFindChild(v155, v17, "pStyle");

    if (v18)
    {
      -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
      v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      CXDefaultStringAttribute(v18, v19, (xmlChar *)"val", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v154, "styleWithId:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBaseStyle:", v21);

    }
  }
  v172 = 0;
  objc_msgSend(a1, "heightRuleEnumMap");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = readEnumProperty<WDHeightRule>(v155, "framePr", (const xmlChar *)"hRule", v22, &v172, v10);

  if (v23)
    objc_msgSend(v9, "setHeightRule:", v172);
  v171 = 0;
  objc_msgSend(a1, "horizontalAnchorEnumMap");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = readEnumProperty<WDHorizontalAnchor>(v155, "framePr", (const xmlChar *)"hAnchor", v24, &v171, v10);

  if (v25)
    objc_msgSend(v9, "setHorizontalAnchor:", v171);
  v170 = 0;
  objc_msgSend(a1, "verticalAnchorEnumMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = readEnumProperty<WDVerticalAnchor>(v155, "framePr", (const xmlChar *)"vAnchor", v26, &v170, v10);

  if (v27)
    objc_msgSend(v9, "setVerticalAnchor:", v170);
  v169 = 0;
  objc_msgSend(a1, "wrapCodeEnumMap");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = readEnumProperty<char>(v155, "framePr", (const xmlChar *)"wrap", v28, &v169, v10);

  if (v29)
    objc_msgSend(v9, "setWrapCode:", v169);
  v168 = 0;
  objc_msgSend(a1, "lineSpacingEnumMap");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = readEnumProperty<WDLineSpacingRule>(v155, "spacing", (const xmlChar *)"lineRule", v30, &v168, v10);

  if (v31)
    objc_msgSend(v9, "setLineSpacingRule:", v168);
  v167 = 0;
  +[WXCommon justifyEnumMap](WXCommon, "justifyEnumMap");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (readEnumProperty<WDJustification>(v155, "jc", (const xmlChar *)"val", v32, &v167, v10))
  {

  }
  else
  {
    +[WXCommon strictJustifyEnumMap](WXCommon, "strictJustifyEnumMap");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = readEnumProperty<WDJustification>(v155, "jc", (const xmlChar *)"val", v33, &v167, v10);

    if (!v34)
      goto LABEL_27;
  }
  objc_msgSend(v9, "setJustification:", v167);
LABEL_27:
  v166 = 0;
  if (wmxmlGetBoolOnlyProperty(v155, "pageBreakBefore", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setPageBreakBefore:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "wordWrap", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setWrap:", v166);
  if (wmxmlGetBoolProperty(v155, "framePr", (const xmlChar *)"anchorLock", &v166, v10))
    objc_msgSend(v9, "setAnchorLock:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "keepNext", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setKeepNextParagraphTogether:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "keepLines", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setKeepLinesTogether:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "suppressLineNumbers", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setSuppressLineNumbers:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "suppressAutoHyphens", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setSuppressAutoHyphens:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "widowControl", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setWidowControl:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "bidi", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setBiDi:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "kinsoku", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setKinsokuOff:", !v166);
  if (wmxmlGetBoolOnlyProperty(v155, "beforeAutospacing", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setSpaceBeforeAuto:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "afterAutospacing", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setSpaceAfterAuto:", v166);
  if (wmxmlGetBoolOnlyProperty(v155, "contextualSpacing", (const xmlChar *)"val", &v166, v10))
    objc_msgSend(v9, "setContextualSpacing:", v166);
  v165 = 0;
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v36 = (_xmlNode *)OCXFindChild(v155, v35, "framePr");

  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v38 = CXOptionalLongAttribute(v36, v37, (xmlChar *)"w", &v165, 14);

  if (v38)
    objc_msgSend(v9, "setWidth:", v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v40 = CXOptionalLongAttribute(v36, v39, (xmlChar *)"h", &v165, 14);

  if (v40)
    objc_msgSend(v9, "setHeight:", v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v42 = CXOptionalLongAttribute(v36, v41, (xmlChar *)"vSpace", &v165, 14);

  if (v42)
    objc_msgSend(v9, "setVerticalSpace:", v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v44 = CXOptionalLongAttribute(v36, v43, (xmlChar *)"hSpace", &v165, 14);

  if (v44)
    objc_msgSend(v9, "setHorizontalSpace:", v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v45 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v46 = CXOptionalLongAttribute(v36, v45, (xmlChar *)"x", &v165, 14);

  if (v46)
    objc_msgSend(v9, "setHorizontalPosition:", v165);
  if ((objc_msgSend(v9, "isHorizontalPositionOverridden") & 1) == 0)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = 0;
    v48 = CXOptionalStringAttribute(v36, v47, (xmlChar *)"xAlign", &v164);
    v49 = v164;

    if (v48)
    {
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("left")) & 1) != 0)
      {
        v50 = 0;
LABEL_75:
        objc_msgSend(v9, "setHorizontalPosition:", v50);
        goto LABEL_76;
      }
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("center")) & 1) != 0)
      {
        v50 = -4;
        goto LABEL_75;
      }
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("right")) & 1) != 0)
      {
        v50 = -8;
        goto LABEL_75;
      }
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("inside")) & 1) != 0)
      {
        v50 = -12;
        goto LABEL_75;
      }
      if (objc_msgSend(v49, "isEqualToString:", CFSTR("outside")))
      {
        v50 = -16;
        goto LABEL_75;
      }
    }
LABEL_76:

  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v51 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v52 = CXOptionalLongAttribute(v36, v51, (xmlChar *)"y", &v165, 14);

  if (v52)
    objc_msgSend(v9, "setVerticalPosition:", v165);
  if ((objc_msgSend(v9, "isVerticalPositionOverridden") & 1) == 0)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = 0;
    v54 = CXOptionalStringAttribute(v36, v53, (xmlChar *)"yAlign", &v163);
    v55 = v163;

    if (v54)
    {
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("top")) & 1) != 0)
      {
        v56 = -4;
LABEL_91:
        objc_msgSend(v9, "setVerticalPosition:", v56);
        goto LABEL_92;
      }
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("center")) & 1) != 0)
      {
        v56 = -8;
        goto LABEL_91;
      }
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
      {
        v56 = -12;
        goto LABEL_91;
      }
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("inside")) & 1) != 0)
      {
        v56 = -16;
        goto LABEL_91;
      }
      if (objc_msgSend(v55, "isEqualToString:", CFSTR("outside")))
      {
        v56 = -20;
        goto LABEL_91;
      }
    }
LABEL_92:

  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v57 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v58 = (_xmlNode *)OCXFindChild(v155, v57, "spacing");

  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v59 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v60 = CXOptionalLongAttribute(v58, v59, (xmlChar *)"line", &v165, 14);

  if (v60)
  {
    if (objc_msgSend(v9, "isLineSpacingRuleOverridden")
      && objc_msgSend(v9, "lineSpacingRule") == 1)
    {
      v61 = -(unsigned __int16)v165;
    }
    else
    {
      LOWORD(v61) = v165;
    }
    objc_msgSend(v9, "setLineSpacing:", (__int16)v61);
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v63 = CXOptionalLongAttribute(v58, v62, (xmlChar *)"before", &v165, 14);

  if (v63)
    objc_msgSend(v9, "setSpaceBefore:", (unsigned __int16)v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v65 = CXOptionalLongAttribute(v58, v64, (xmlChar *)"after", &v165, 14);

  if (v65)
    objc_msgSend(v9, "setSpaceAfter:", (unsigned __int16)v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v66 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v67 = (_xmlNode *)OCXFindChild(v155, v66, "outlineLvl");

  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v68 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v67) = CXOptionalLongAttribute(v67, v68, (xmlChar *)"val", &v165);

  if ((_DWORD)v67)
    objc_msgSend(v9, "setOutlineLevel:", (unsigned __int16)v165);
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v69 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v70 = (_xmlNode *)OCXFindChild(v155, v69, "ind");

  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v71 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXOptionalLongAttribute(v70, v71, (xmlChar *)"left", &v165, 14))
  {

LABEL_108:
    objc_msgSend(v9, "setLeadingIndent:", (__int16)v165);
    goto LABEL_109;
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v72 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v73 = CXOptionalLongAttribute(v70, v72, (xmlChar *)"start", &v165, 14);

  if (v73)
    goto LABEL_108;
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v142 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXOptionalLongAttribute(v70, v142, (xmlChar *)"leftChars", &v165))
  {

  }
  else
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v148 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v149 = CXOptionalLongAttribute(v70, v148, (xmlChar *)"startChars", &v165);

    if (!v149)
      goto LABEL_109;
  }
  objc_msgSend(v9, "setLeftIndentChars:", (__int16)v165);
LABEL_109:
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v74 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXOptionalLongAttribute(v70, v74, (xmlChar *)"right", &v165, 14))
  {

LABEL_112:
    objc_msgSend(v9, "setFollowingIndent:", (__int16)v165);
    goto LABEL_113;
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v75 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v76 = CXOptionalLongAttribute(v70, v75, (xmlChar *)"end", &v165, 14);

  if (v76)
    goto LABEL_112;
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v143 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXOptionalLongAttribute(v70, v143, (xmlChar *)"rightChars", &v165))
  {

  }
  else
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v150 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v151 = CXOptionalLongAttribute(v70, v150, (xmlChar *)"endChars", &v165);

    if (!v151)
      goto LABEL_113;
  }
  objc_msgSend(v9, "setRightIndentChars:", (__int16)v165);
LABEL_113:
  v161 = 0;
  v162 = 0;
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v77 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v78 = CXOptionalLongAttribute(v70, v77, (xmlChar *)"firstLine", &v162, 14);

  if (!v78)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v80 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v81 = CXOptionalLongAttribute(v70, v80, (xmlChar *)"firstLineChars", &v162);

    if (v81)
    {
      LOWORD(v82) = v162;
    }
    else
    {
      -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
      v144 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v145 = CXOptionalLongAttribute(v70, v144, (xmlChar *)"hanging", &v161, 14);

      if (v145)
      {
        v79 = -(unsigned __int16)v161;
        goto LABEL_115;
      }
      -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
      v152 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v153 = CXOptionalLongAttribute(v70, v152, (xmlChar *)"hangingChars", &v161);

      if (!v153)
        goto LABEL_119;
      v82 = -(unsigned __int16)v161;
    }
    objc_msgSend(v9, "setFirstLineIndentChars:", (__int16)v82);
    goto LABEL_119;
  }
  LOWORD(v79) = v162;
LABEL_115:
  objc_msgSend(v9, "setFirstLineIndent:", (__int16)v79);
LABEL_119:
  v160 = 0;
  objc_msgSend(a1, "dropCapEnumMap");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = readEnumProperty<WDDropCapStyle>(v155, "framePr", (const xmlChar *)"dropCap", v83, &v160, v10);

  if (v84)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v85 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v86 = CXDefaultLongAttribute(v36, v85, (xmlChar *)"lines", 0);

    objc_msgSend(v9, "setDropCap:", v160 | ((unint64_t)v86 << 8));
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v87 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v88 = (_xmlNode *)OCXFindChild(v155, v87, "pBdr");

  if (v88)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v89 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v90 = OCXFindChild(v88, v89, "top");

    if (v90)
    {
      objc_msgSend(v9, "mutableTopBorder");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v90, v91, v10);

    }
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v92 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v93 = OCXFindChild(v88, v92, "left");

    if (v93)
    {
      objc_msgSend(v9, "mutableLeftBorder");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v93, v94, v10);

    }
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v95 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v96 = OCXFindChild(v88, v95, "bottom");

    if (v96)
    {
      objc_msgSend(v9, "mutableBottomBorder");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v96, v97, v10);

    }
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v98 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v99 = OCXFindChild(v88, v98, "right");

    if (v99)
    {
      objc_msgSend(v9, "mutableRightBorder");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v99, v100, v10);

    }
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v101 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v102 = OCXFindChild(v88, v101, "between");

    if (v102)
    {
      objc_msgSend(v9, "mutableBetweenBorder");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v102, v103, v10);

    }
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v104 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v105 = OCXFindChild(v88, v104, "bar");

    if (v105)
    {
      objc_msgSend(v9, "mutableBarBorder");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v105, v106, v10);

    }
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v107 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v108 = OCXFindChild(v155, v107, "shd");

  if (v108)
  {
    objc_msgSend(v9, "mutableShading");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXShading readFrom:to:state:](WXShading, "readFrom:to:state:", v108, v109, v10);

  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v110 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v111 = (_xmlNode *)OCXFindChild(v155, v110, "tabs");

  if (v111)
  {
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v112 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(v111, v112, "tab");

    while (Child)
    {
      -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
      v114 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v165 = (uint64_t)CXRequiredLongAttribute(Child, v114, (xmlChar *)"pos", 14);

      LOWORD(v159) = v165;
      objc_msgSend(a1, "tabTypeEnumMap");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      Enum = readEnumProperty<unsigned char>(Child, (const xmlChar *)"val", v115, (_BYTE *)&v159 + 2);

      if ((Enum & 1) != 0)
      {
        v117 = 1;
      }
      else
      {
        objc_msgSend(a1, "strictTabTypeEnumMap");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = readEnumProperty<unsigned char>(Child, (const xmlChar *)"val", v118, (_BYTE *)&v159 + 2);

      }
      objc_msgSend(a1, "tabLeaderEnumMap");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = readEnumProperty<unsigned char>(Child, (const xmlChar *)"leader", v119, (_BYTE *)&v159 + 3);

      if ((v120 & 1) == 0)
        BYTE3(v159) = 0;
      if (BYTE2(v159) == 100)
        v121 = v117;
      else
        v121 = 0;
      if (v121 == 1)
        objc_msgSend(v157, "addTabStopDeletedPosition:", (__int16)v159);
      else
        objc_msgSend(v157, "addTabStopAdded:", &v159);
      -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
      v122 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v122, (xmlChar *)"tab");

    }
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v123 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v124 = (_xmlNode *)OCXFindChild(v155, v123, "numPr");

  if (v124)
  {
    v159 = 0;
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v125 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v126 = (_xmlNode *)OCXFindChild(v124, v125, "ilvl");

    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v127 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v128 = CXOptionalLongAttribute(v126, v127, (xmlChar *)"val", &v159);

    if (v128)
      objc_msgSend(v157, "setListLevel:", v159);
    v158 = 0;
    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v129 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v130 = (_xmlNode *)OCXFindChild(v124, v129, "numId");

    -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
    v131 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v132 = CXOptionalLongAttribute(v130, v131, (xmlChar *)"val", &v158);

    if (v132)
      objc_msgSend(v157, "setListIndex:", v158);
  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v133 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v134 = OCXFindChild(v155, v133, "rPr");

  if (v134)
  {
    objc_msgSend(v157, "mutableCharacterProperties");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v134, v135, v10);

  }
  -[WXReadState WXMainNamespace](v10, "WXMainNamespace");
  v136 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v137 = OCXFindChild(v155, v136, "sectPr");

  if (v137)
  {
    -[WXReadState document](v10, "document");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "lastSection");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXSection readFrom:to:state:](WXSection, "readFrom:to:state:", v137, v139, v10);

    -[WXReadState setNewSectionRequested:](v10, "setNewSectionRequested:", 1);
  }
  if (objc_msgSend(v157, "resolveMode") == 1)
  {
    objc_msgSend(v157, "setResolveMode:", 2);
    if (objc_msgSend(v157, "isBaseStyleOverridden"))
    {
      objc_msgSend(v157, "baseStyle");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "paragraphProperties");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WXReadState document](v10, "document");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "styleSheet");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "defaultParagraphStyle");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "paragraphProperties");
      v141 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v157, "negateFormattingChangesWithDefaults:", v141);

  }
  v9 = v157;
LABEL_171:

}

+ (id)heightRuleEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_38, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties heightRuleEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties heightRuleEnumMap]::onceToken, &__block_literal_global_89);
  return (id)+[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumMap;
}

void __42__WXParagraphProperties_heightRuleEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumStructs, 2, 1);
  v1 = (void *)+[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumMap;
  +[WXParagraphProperties heightRuleEnumMap]::sHeightRuleEnumMap = (uint64_t)v0;

}

+ (id)verticalAnchorEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_10_0, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties verticalAnchorEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties verticalAnchorEnumMap]::onceToken, &__block_literal_global_11_3);
  return (id)+[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumMap;
}

void __46__WXParagraphProperties_verticalAnchorEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumStructs, 3, 1);
  v1 = (void *)+[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumMap;
  +[WXParagraphProperties verticalAnchorEnumMap]::sVerticalAnchorEnumMap = (uint64_t)v0;

}

+ (id)horizontalAnchorEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_14_0, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties horizontalAnchorEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties horizontalAnchorEnumMap]::onceToken, &__block_literal_global_15_2);
  return (id)+[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumMap;
}

void __48__WXParagraphProperties_horizontalAnchorEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumStructs, 3, 1);
  v1 = (void *)+[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumMap;
  +[WXParagraphProperties horizontalAnchorEnumMap]::sHorizontalAnchorEnumMap = (uint64_t)v0;

}

+ (id)lineSpacingEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_18_0, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties lineSpacingEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties lineSpacingEnumMap]::onceToken, &__block_literal_global_19_0);
  return (id)+[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumMap;
}

void __43__WXParagraphProperties_lineSpacingEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumStructs, 3, 1);
  v1 = (void *)+[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumMap;
  +[WXParagraphProperties lineSpacingEnumMap]::sLineSpacingEnumMap = (uint64_t)v0;

}

+ (id)dropCapEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_24, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties dropCapEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties dropCapEnumMap]::onceToken, &__block_literal_global_25_0);
  return (id)+[WXParagraphProperties dropCapEnumMap]::sDropCapEnumMap;
}

void __39__WXParagraphProperties_dropCapEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties dropCapEnumMap]::sDropCapEnumStructs, 3, 1);
  v1 = (void *)+[WXParagraphProperties dropCapEnumMap]::sDropCapEnumMap;
  +[WXParagraphProperties dropCapEnumMap]::sDropCapEnumMap = (uint64_t)v0;

}

+ (id)tabTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_40_0, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties tabTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties tabTypeEnumMap]::onceToken, &__block_literal_global_41_0);
  return (id)+[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumMap;
}

void __39__WXParagraphProperties_tabTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumStructs, 7, 1);
  v1 = (void *)+[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumMap;
  +[WXParagraphProperties tabTypeEnumMap]::sTabTypeEnumMap = (uint64_t)v0;

}

+ (id)strictTabTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_46_1, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties strictTabTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties strictTabTypeEnumMap]::onceToken, &__block_literal_global_47_0);
  return (id)+[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumMap;
}

void __45__WXParagraphProperties_strictTabTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumStructs, 7, 1);
  v1 = (void *)+[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumMap;
  +[WXParagraphProperties strictTabTypeEnumMap]::sStrictTabTypeEnumMap = (uint64_t)v0;

}

+ (id)tabLeaderEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_62_1, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties tabLeaderEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties tabLeaderEnumMap]::onceToken, &__block_literal_global_63_0);
  return (id)+[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumMap;
}

void __41__WXParagraphProperties_tabLeaderEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumStructs, 8, 1);
  v1 = (void *)+[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumMap;
  +[WXParagraphProperties tabLeaderEnumMap]::sTabLeaderEnumMap = (uint64_t)v0;

}

+ (id)wrapCodeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_68_0, 0, &dword_22A0CC000);
  }
  if (+[WXParagraphProperties wrapCodeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXParagraphProperties wrapCodeEnumMap]::onceToken, &__block_literal_global_69_0);
  return (id)+[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumMap;
}

void __40__WXParagraphProperties_wrapCodeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumStructs, 2, 1);
  v1 = (void *)+[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumMap;
  +[WXParagraphProperties wrapCodeEnumMap]::sWrapCodeEnumMap = (uint64_t)v0;

}

@end
