@implementation WXCharacterProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  WXReadState *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  void *v16;
  void *v17;
  void *v18;
  CXNamespace *v19;
  _xmlNode *v20;
  CXNamespace *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  CXNamespace *v27;
  CXNamespace *v28;
  _xmlNode *v29;
  CXNamespace *v30;
  CXNamespace *v31;
  _xmlNode *v32;
  CXNamespace *v33;
  CXNamespace *v34;
  _xmlNode *v35;
  CXNamespace *v36;
  CXNamespace *v37;
  _xmlNode *v38;
  CXNamespace *v39;
  _xmlNode *v40;
  OADReflectionEffect *v41;
  uint64_t v42;
  CXNamespace *v43;
  _xmlNode *v44;
  CXNamespace *v45;
  const xmlNode *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  CXNamespace *v54;
  _xmlNode *v55;
  void *v56;
  _BOOL4 v57;
  id v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  void *v63;
  CXNamespace *v64;
  _xmlNode *v65;
  void *v66;
  _BOOL4 v67;
  id v68;
  void *v69;
  void *v70;
  double v71;
  _BOOL8 v72;
  CXNamespace *v73;
  _xmlNode *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  id v91;
  void *v92;
  void *v93;
  _BOOL4 v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  CXNamespace *v105;
  _xmlNode *v106;
  void *v107;
  NSString *v108;
  void *v109;
  NSString *v110;
  void *v111;
  NSString *v112;
  void *v113;
  int v114;
  _BOOL4 BoolOnlyProperty;
  CXNamespace *v117;
  uint64_t v118;
  void *v119;
  CXNamespace *v120;
  uint64_t v121;
  void *v122;
  _xmlNode *v123;
  _xmlNode *v124;
  double v125;
  uint64_t v126;
  void *v127;
  _xmlNode *v128;
  uint64_t v129;
  _xmlNode *v130;
  void *v131;
  void *v132;
  double v133;
  float v134;
  float v135;
  double v136;
  CXNamespace *v137;
  _xmlNode *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  id v157;
  uint64_t v158;
  BOOL v159;
  NSString *v160;
  NSString *v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  uint64_t v177;
  _DWORD v178[3];

  v7 = a4;
  v8 = (WXReadState *)a5;
  objc_msgSend(v7, "setResolveMode:", 0);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "ins");

  if (v10)
  {
    objc_msgSend(v7, "setEdited:", 1);
    wmxmlGetDateProperty(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditDate:", v11);

    -[WXReadState document](v8, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetAuthorProperty(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIndexToAuthorIDOfEdit:", (unsigned __int16)objc_msgSend(v12, "revisionAuthorAddLookup:", v13));

  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "del");

  if (v15)
  {
    objc_msgSend(v7, "setDeleted:", 1);
    wmxmlGetDateProperty(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeletionDate:", v16);

    -[WXReadState document](v8, "document");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetAuthorProperty(v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIndexToAuthorIDOfDeletion:", (unsigned __int16)objc_msgSend(v17, "revisionAuthorAddLookup:", v18));

  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "rPrChange");

  if (v20)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(v20, v21, "rPr");

    if (v22)
    {
      +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v22, v7, v8);
      objc_msgSend(v7, "setResolveMode:", 1);
      objc_msgSend(v7, "setFormattingChanged:", 1);
      -[WXReadState document](v8, "document");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      wmxmlGetAuthorProperty(v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v23, "revisionAuthorAddLookup:", v24));

    }
  }
  v178[0] = 0;
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "rtl", "val", v178, v8))
  {
    objc_msgSend(v7, "setRightToLeft:", v178[0]);
  }
  else if (!+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "cs", "val", v178, v8))
  {
    goto LABEL_12;
  }
  objc_msgSend(v7, "setUseCsFont:", v178[0]);
LABEL_12:
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "b", "val", v178, v8))
  {
    objc_msgSend(v7, "setBold:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "bCs", "val", v178, v8))
  {
    objc_msgSend(v7, "setBoldForBiText:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "i", "val", v178, v8))
  {
    objc_msgSend(v7, "setItalic:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "iCs", "val", v178, v8))
  {
    objc_msgSend(v7, "setItalicForBiText:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "smallCaps", "val", v178, v8))
  {
    objc_msgSend(v7, "setSmallCaps:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "outline", "val", v178, v8))
  {
    objc_msgSend(v7, "setOutline:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "shadow", "val", v178, v8))
  {
    objc_msgSend(v7, "setShadow:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "emboss", "val", v178, v8))
  {
    objc_msgSend(v7, "setEmbossed:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "imprint", "val", v178, v8))
  {
    objc_msgSend(v7, "setImprint:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "strike", "val", v178, v8))
  {
    objc_msgSend(v7, "setStrikeThrough:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "dstrike", "val", v178, v8))
  {
    objc_msgSend(v7, "setDoubleStrikeThrough:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "caps", "val", v178, v8))
  {
    objc_msgSend(v7, "setCaps:", v178[0]);
  }
  if (+[WXCharacterProperties readBooleanCharacterProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterProperty:propertyName:attributeName:outValue:state:", a3, "vanish", "val", v178, v8))
  {
    objc_msgSend(v7, "setHidden:", v178[0]);
  }
  v177 = 0;
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v26 = (_xmlNode *)OCXFindChild(a3, v25, "spacing");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = CXOptionalLongAttribute(v26, v27, (xmlChar *)"val", &v177, 14);

  if ((_DWORD)v26)
    objc_msgSend(v7, "setSpacing:", (__int16)v177);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v29 = (_xmlNode *)OCXFindChild(a3, v28, "sz");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = CXOptionalLongAttribute(v29, v30, (xmlChar *)"val", &v177, 15);

  if ((_DWORD)v29)
    objc_msgSend(v7, "setFontSize:", (unsigned __int16)v177);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v32 = (_xmlNode *)OCXFindChild(a3, v31, "szCs");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = CXOptionalLongAttribute(v32, v33, (xmlChar *)"val", &v177, 15);

  if ((_DWORD)v32)
    objc_msgSend(v7, "setFontSizeForBiText:", (unsigned __int16)v177);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v35 = (_xmlNode *)OCXFindChild(a3, v34, "position");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = CXOptionalLongAttribute(v35, v36, (xmlChar *)"val", &v177, 15);

  if ((_DWORD)v35)
    objc_msgSend(v7, "setPosition:", (__int16)v177);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v38 = (_xmlNode *)OCXFindChild(a3, v37, "kern");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = CXOptionalLongAttribute(v38, v39, (xmlChar *)"val", &v177, 15);

  if ((_DWORD)v38)
    objc_msgSend(v7, "setKerning:", (unsigned __int16)v177);
  v40 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "reflection");
  if (CXOptionalLongAttribute(v40, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dist", &v177))
  {
    v41 = objc_alloc_init(OADReflectionEffect);
    objc_msgSend(a1, "readReflection:fromXmlNode:state:", v41, v40, v8);
    objc_msgSend(v7, "setReflection:", v41);

  }
  v42 = OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "shadow");
  if (v42)
    objc_msgSend(a1, "readShadowForTarget:fromXmlNode:state:", v7, v42, v8);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v44 = (_xmlNode *)OCXFindChild(a3, v43, "w");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v45 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v44) = CXOptionalLongAttribute(v44, v45, (xmlChar *)"val", &v177);

  if ((_DWORD)v44)
    objc_msgSend(v7, "setTextScale:", (unsigned __int16)v177);
  v176 = 0;
  v46 = (const xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "ligatures");
  objc_msgSend(a1, "ligaturesEnumMap");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = readEnumProperty<WDLigatures>(v46, (const xmlChar *)"val", v47, &v176);

  if ((_DWORD)v46)
    objc_msgSend(v7, "setLigature:", v176);
  v175 = 0;
  objc_msgSend(a1, "highlightEnumMap");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = readEnumProperty<WDHighlightColor>(a3, "highlight", (const xmlChar *)"val", v48, &v175, v8);

  if (v49)
  {
    objc_msgSend(v7, "setHighlight:", 1);
    objc_msgSend(v7, "setHighlightColor:", v175);
  }
  v174 = 0;
  objc_msgSend(a1, "verticalAlignEnumMap");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = readEnumProperty<WDCharacterVerticalAlign>(a3, "vertAlign", (const xmlChar *)"val", v50, &v174, v8);

  if (v51)
    objc_msgSend(v7, "setVerticalAlign:", v174);
  v173 = 0;
  objc_msgSend(a1, "emphasisMarkEnumMap");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = readEnumProperty<WDCharacterEmphasisMark>(a3, "em", (const xmlChar *)"val", v52, &v173, v8);

  if (v53)
    objc_msgSend(v7, "setEmphasisMark:", v173);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v54 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v55 = (_xmlNode *)OCXFindChild(a3, v54, "u");

  if (v55)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = 0;
    v57 = CXOptionalStringAttribute(v55, v56, (xmlChar *)"val", &v172);
    v58 = v172;

    if (v57)
    {
      objc_msgSend(a1, "underlineEnumMap");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUnderline:", objc_msgSend(v59, "valueForString:", v58));

      if (objc_msgSend(v7, "underline") == -130883970)
        objc_msgSend(v7, "setUnderline:", 0);
    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = 0;
    v61 = CXOptionalStringAttribute(v55, v60, (xmlChar *)"color", &v171);
    v62 = v171;

    if (v61)
    {
      +[WXShading getColorFromString:](WXShading, "getColorFromString:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUnderlineColor:", v63);

    }
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v65 = (_xmlNode *)OCXFindChild(a3, v64, "color");

  if (v65)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = 0;
    v67 = CXOptionalStringAttribute(v65, v66, (xmlChar *)"val", &v170);
    v68 = v170;

    if (v67)
    {
      +[WXShading getColorFromString:](WXShading, "getColorFromString:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setColor:", v69);

      objc_msgSend(v7, "color");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "alphaComponent");
      v72 = v71 == 0.0;

      objc_msgSend(v7, "setColorAuto:", v72);
    }

  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v73 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v74 = (_xmlNode *)OCXFindChild(a3, v73, "rFonts");

  if (v74)
  {
    objc_msgSend(v7, "document");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "fontTable");
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    -[WXReadState document](v8, "document");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "theme");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "baseStyles");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "fontScheme");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = 0;
    LODWORD(v75) = CXOptionalStringAttribute(v74, v76, (xmlChar *)"asciiTheme", &v169);
    v77 = v169;

    v153 = v77;
    if ((_DWORD)v75)
    {
      if (objc_msgSend(v77, "rangeOfString:", CFSTR("major")) == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v154, "minorFont");
      else
        objc_msgSend(v154, "majorFont");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "latinFont");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v79 = 0;
    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v79;
    CXOptionalStringAttribute(v74, v80, (xmlChar *)"ascii", &v168);
    v81 = v168;

    if (v81 && objc_msgSend(v81, "length"))
    {
      objc_msgSend(v155, "fontWithName:create:", v81, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v82);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = 0;
    v84 = CXOptionalStringAttribute(v74, v83, (xmlChar *)"cs", &v167);
    v152 = v167;

    if (v84)
    {
      objc_msgSend(v155, "fontWithName:create:", v152, 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExtendedFont:", v85);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = 0;
    v87 = CXOptionalStringAttribute(v74, v86, (xmlChar *)"hAnsi", &v166);
    v151 = v166;

    if (v87)
    {
      objc_msgSend(v155, "fontWithName:create:", v151, 1);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSymbolFont:", v88);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = 0;
    v90 = CXOptionalStringAttribute(v74, v89, (xmlChar *)"hint", &v165);
    v91 = v165;

    if (v90)
    {
      objc_msgSend(a1, "fontHintEnumMap");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFontHint:", objc_msgSend(v92, "valueForString:", v91));

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = 0;
    v94 = CXOptionalStringAttribute(v74, v93, (xmlChar *)"eastAsiaTheme", &v164);
    v95 = v164;

    if (!v94)
    {
      v100 = 0;
      goto LABEL_98;
    }
    if (objc_msgSend(v95, "rangeOfString:", CFSTR("major")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v154, "minorFont");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "eastAsianFont");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v97, "length"))
      {
        objc_msgSend(v154, "minorFont");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "latinFont");
        v99 = objc_claimAutoreleasedReturnValue();
LABEL_97:
        v100 = (void *)v99;

LABEL_98:
        -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = v100;
        CXOptionalStringAttribute(v74, v102, (xmlChar *)"eastAsia", &v163);
        v103 = v163;

        if (v103 && objc_msgSend(v103, "length"))
        {
          objc_msgSend(v155, "fontWithName:create:", v103, 1);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setFarEastFont:", v104);

        }
        goto LABEL_102;
      }
    }
    else
    {
      objc_msgSend(v154, "majorFont");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "eastAsianFont");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v97, "length"))
      {
        objc_msgSend(v154, "majorFont");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "latinFont");
        v99 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      }
    }
    v100 = v97;
    goto LABEL_98;
  }
LABEL_102:
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v105 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v106 = (_xmlNode *)OCXFindChild(a3, v105, "lang");

  if (v106)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = 0;
    CXOptionalStringAttribute(v106, v107, (xmlChar *)"val", &v162);
    v108 = (NSString *)v162;

    if (v108 && -[NSString length](v108, "length"))
      objc_msgSend(v7, "setLanguageForDefaultText:", OCDLanguageFromOfficeString(v108));
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v108;
    CXOptionalStringAttribute(v106, v109, (xmlChar *)"eastAsia", &v161);
    v110 = v161;

    if (v110 && -[NSString length](v110, "length"))
      objc_msgSend(v7, "setLanguageForFarEast:", OCDLanguageFromOfficeString(v110));
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v110;
    CXOptionalStringAttribute(v106, v111, (xmlChar *)"bidi", &v160);
    v112 = v160;

    if (v112 && -[NSString length](v112, "length"))
      objc_msgSend(v7, "setLanguageForBiText:", OCDLanguageFromOfficeString(v112));

  }
  if (+[WXCharacterProperties readBooleanCharacterMultipleProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterMultipleProperty:propertyName:attributeName:outValue:state:", a3, "eastAsianLayout", "vert", v178, v8))
  {
    objc_msgSend(v7, "setHorizontalInVertical:", v178[0] != 0);
    if (v178[0])
    {
      LODWORD(v158) = 0;
      if (+[WXCharacterProperties readBooleanCharacterMultipleProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterMultipleProperty:propertyName:attributeName:outValue:state:", a3, "eastAsianLayout", "vertCompress", &v158, v8))
      {
        objc_msgSend(v7, "setCompressHorizontalInVertical:", (_DWORD)v158 != 0);
      }
    }
  }
  if (+[WXCharacterProperties readBooleanCharacterMultipleProperty:propertyName:attributeName:outValue:state:](WXCharacterProperties, "readBooleanCharacterMultipleProperty:propertyName:attributeName:outValue:state:", a3, "eastAsianLayout", "combine", v178, v8))
  {
    objc_msgSend(v7, "setTwoLinesInOne:", v178[0] != 0);
    if (v178[0])
    {
      LODWORD(v158) = 0;
      objc_msgSend(a1, "twoLineBracketsEnumMap");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = readEnumProperty<WDTwoLineBrackets>(a3, "eastAsianLayout", (const xmlChar *)"combineBrackets", v113, &v158, v8);

      if (v114)
        objc_msgSend(v7, "setBracketTwoLinesInOne:", v158);
    }
  }
  v159 = 0;
  BoolOnlyProperty = wmxmlGetBoolOnlyProperty(a3, "noProof", (const xmlChar *)"val", &v159, v8);
  if (v159 && BoolOnlyProperty)
    objc_msgSend(v7, "setLanguageForDefaultText:", 1024);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v117 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v118 = OCXFindChild(a3, v117, "bdr");

  if (v118)
  {
    objc_msgSend(v7, "mutableBorder");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v118, v119, v8);

  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v120 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v121 = OCXFindChild(a3, v120, "shd");

  if (v121)
  {
    objc_msgSend(v7, "mutableShading");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXShading readFrom:to:state:](WXShading, "readFrom:to:state:", v121, v122, v8);

  }
  v123 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "textOutline");
  v124 = v123;
  if (v123)
  {
    v158 = 9525;
    CXOptionalLongAttribute(v123, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"w", &v158);
    v125 = (double)v158 / 12700.0;
    *(float *)&v125 = v125;
    objc_msgSend(v7, "setOutline2010Width:", v125);
    v126 = OCXFindChild(v124, (CXNamespace *)WXWord2010Namespace, "solidFill");
    if (v126)
    {
      objc_msgSend(a1, "readFillColor:forTarget:state:", v126, v7, v8);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      if (v127)
        objc_msgSend(v7, "setOutlineColor:", v127);

    }
  }
  v128 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "textFill");
  v130 = v128;
  if (v128)
  {
    if (!OCXFindChild(v128, (CXNamespace *)WXWord2010Namespace, "noFill"))
    {
      v129 = OCXFindChild(v130, (CXNamespace *)WXWord2010Namespace, "solidFill");
      if (v129)
      {
        objc_msgSend(a1, "readFillColor:forTarget:state:", v129, v7, v8);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = v131;
        if (v131)
        {
          objc_msgSend(v131, "alphaComponent");
          if (v133 > 0.0)
          {
            objc_msgSend(v7, "setColor:", v132);
            if (objc_msgSend(v7, "isOutline2010WidthOverridden"))
            {
              objc_msgSend(v7, "outline2010Width");
              if (v134 > 0.0)
              {
                objc_msgSend(v7, "outline2010Width");
                *(float *)&v136 = -v135;
                objc_msgSend(v7, "setOutline2010Width:", v136);
              }
            }
          }
        }

      }
    }
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace", v129);
  v137 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v138 = (_xmlNode *)OCXFindChild(a3, v137, "rStyle");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0;
  LODWORD(v138) = CXOptionalStringAttribute(v138, v139, (xmlChar *)"val", &v157);
  v140 = v157;

  if ((_DWORD)v138)
  {
    -[WXReadState document](v8, "document");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "styleSheet");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "styleWithId:", v140);
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    if (v143)
      objc_msgSend(v7, "setBaseStyle:", v143);

  }
  -[WXReadState document](v8, "document");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "styleSheet");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "defaultParagraphStyle");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "characterProperties");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "negateFormattingChangesWithDefaults:", v147);

  objc_msgSend(v7, "setResolveMode:", 2);
}

+ (void)applyDeletionInsertionProperties:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  objc_msgSend(v13, "setResolveMode:", 0);
  objc_msgSend(v5, "currentDeleteAuthor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDeleteDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(v13, "setDeleted:", 1);
    objc_msgSend(v13, "setDeletionDate:", v8);
    objc_msgSend(v5, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIndexToAuthorIDOfDeletion:", (unsigned __int16)objc_msgSend(v9, "revisionAuthorAddLookup:", v6));

  }
  objc_msgSend(v5, "currentEditAuthor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentEditDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v11)
  {
    objc_msgSend(v13, "setEdited:", 1);
    objc_msgSend(v13, "setEditDate:", v11);
    objc_msgSend(v5, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIndexToAuthorIDOfEdit:", (unsigned __int16)objc_msgSend(v12, "revisionAuthorAddLookup:", v10));

  }
  objc_msgSend(v13, "setResolveMode:", 2);

}

+ (TCEnumerationMap)underlineEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_30, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties underlineEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties underlineEnumMap]::onceToken, &__block_literal_global_81);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties underlineEnumMap]::sUnderlineEnumMap;
}

void __41__WXCharacterProperties_underlineEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties underlineEnumMap]::sUnderlineEnumStructs, 18, 1);
  v1 = (void *)+[WXCharacterProperties underlineEnumMap]::sUnderlineEnumMap;
  +[WXCharacterProperties underlineEnumMap]::sUnderlineEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)highlightEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_68, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties highlightEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties highlightEnumMap]::onceToken, &__block_literal_global_69);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties highlightEnumMap]::sHighlightEnumMap;
}

void __41__WXCharacterProperties_highlightEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties highlightEnumMap]::sHighlightEnumStructs, 17, 1);
  v1 = (void *)+[WXCharacterProperties highlightEnumMap]::sHighlightEnumMap;
  +[WXCharacterProperties highlightEnumMap]::sHighlightEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)ligaturesEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_76, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties ligaturesEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties ligaturesEnumMap]::onceToken, &__block_literal_global_77_0);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumMap;
}

void __41__WXCharacterProperties_ligaturesEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumStructs, 4, 1);
  v1 = (void *)+[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumMap;
  +[WXCharacterProperties ligaturesEnumMap]::sLigaturesEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)verticalAlignEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_84, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties verticalAlignEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties verticalAlignEnumMap]::onceToken, &__block_literal_global_85_0);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumMap;
}

void __45__WXCharacterProperties_verticalAlignEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumStructs, 3, 1);
  v1 = (void *)+[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumMap;
  +[WXCharacterProperties verticalAlignEnumMap]::sVerticalAlignEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)emphasisMarkEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_94, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties emphasisMarkEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties emphasisMarkEnumMap]::onceToken, &__block_literal_global_95);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumMap;
}

void __44__WXCharacterProperties_emphasisMarkEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumStructs, 4, 1);
  v1 = (void *)+[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumMap;
  +[WXCharacterProperties emphasisMarkEnumMap]::sEmphasisMarkEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)twoLineBracketsEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_104_0, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties twoLineBracketsEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties twoLineBracketsEnumMap]::onceToken, &__block_literal_global_105);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumMap;
}

void __47__WXCharacterProperties_twoLineBracketsEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumStructs, 5, 1);
  v1 = (void *)+[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumMap;
  +[WXCharacterProperties twoLineBracketsEnumMap]::sTwoLineBracketsEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)fontHintEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_112, 0, &dword_22A0CC000);
  }
  if (+[WXCharacterProperties fontHintEnumMap]::onceToken != -1)
    dispatch_once(&+[WXCharacterProperties fontHintEnumMap]::onceToken, &__block_literal_global_113);
  return (TCEnumerationMap *)(id)+[WXCharacterProperties fontHintEnumMap]::sFontHintEnumMap;
}

void __40__WXCharacterProperties_fontHintEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXCharacterProperties fontHintEnumMap]::sFontHintEnumStructs, 3, 1);
  v1 = (void *)+[WXCharacterProperties fontHintEnumMap]::sFontHintEnumMap;
  +[WXCharacterProperties fontHintEnumMap]::sFontHintEnumMap = (uint64_t)v0;

}

+ (void)readShadowForTarget:(id)a3 fromXmlNode:(_xmlNode *)a4 state:(id)a5
{
  id v6;
  uint64_t v7;
  __objc2_class **v8;
  id v9;
  double v10;
  double v11;
  double v12;
  _xmlNode *v13;
  _xmlNode *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  _xmlNode *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  double v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unsigned int v42;
  void *v43;
  id v44;
  BOOL v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v6 = a3;
  v7 = +[OAXBaseTypes readRectAlignmentFromXmlNode:name:](OAXBaseTypes, "readRectAlignmentFromXmlNode:name:", a4, "algn");
  v56 = 0;
  CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sx", &v56);
  v45 = (_DWORD)v7 == 0 && v56 == 0;
  v8 = off_24F399330;
  if (!v45)
    v8 = off_24F399348;
  v9 = objc_alloc_init(*v8);
  v55 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"blurRad", &v55))
  {
    v10 = (double)(uint64_t)(float)v55 / 25400.0;
    *(float *)&v10 = v10;
    objc_msgSend(v9, "setBlurRadius:", v10);
  }
  v54 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dist", &v54))
  {
    v11 = (double)(uint64_t)(float)v54 / 19050.0;
    *(float *)&v11 = v11;
    objc_msgSend(v9, "setDistance:", v11);
  }
  v53 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dir", &v53))
  {
    v12 = (double)v53 / 60000.0;
    *(float *)&v12 = v12;
    objc_msgSend(v9, "setAngle:", v12);
  }
  v13 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)WXWord2010Namespace, "srgbClr");
  v14 = v13;
  if (!v13)
  {
    v14 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)WXWord2010Namespace, "schemeClr");
    v51 = 0;
    v27 = CXOptionalStringAttribute(v14, (void *)WXWord2010Namespace, (xmlChar *)"val", &v51);
    v16 = v51;
    if (v27)
    {
      v44 = v6;
      objc_msgSend(v6, "document");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v7;
      objc_msgSend(v17, "theme");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "baseStyles");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "colorScheme");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "colorMap");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXColorScheme colorForScheme:colorMap:value:](OAXColorScheme, "colorForScheme:colorMap:value:", v29, v30, v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v44;
      v7 = v42;
      goto LABEL_14;
    }
LABEL_15:
    v26 = 0;
    goto LABEL_16;
  }
  v52 = 0;
  v15 = CXOptionalStringAttribute(v13, (void *)WXWord2010Namespace, (xmlChar *)"val", &v52);
  v16 = v52;
  if (!v15)
    goto LABEL_15;
  +[WXShading getColorFromString:](WXShading, "getColorFromString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "redComponent");
  v19 = v18;
  objc_msgSend(v17, "greenComponent");
  v21 = v20;
  objc_msgSend(v17, "blueComponent");
  v22 = v19;
  *(float *)&v23 = v21;
  *(float *)&v25 = v24;
  *(float *)&v24 = v22;
  +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v24, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_16:
  if (v14 && v26)
  {
    objc_msgSend(v9, "setColor:", v26);
    v31 = (_xmlNode *)OCXFindChild(v14, (CXNamespace *)WXWord2010Namespace, "alpha");
    v50 = 0;
    v32 = CXOptionalStringAttribute(v31, (void *)WXWord2010Namespace, (xmlChar *)"val", &v50);
    v33 = v50;
    v34 = v33;
    LODWORD(v35) = 0.5;
    if (v32)
    {
      v35 = (double)(int)objc_msgSend(v33, "intValue", v35) / -100000.0 + 1.0;
      *(float *)&v35 = v35;
    }
    objc_msgSend(v6, "setShadow2010Opacity:", v35);

  }
  if (!v45)
  {
    v36 = v9;
    v37 = v36;
    if ((_DWORD)v7)
      objc_msgSend(v36, "setAlignment:", v7);
    if (v56)
    {
      v38 = (double)v56 / 100000.0;
      *(float *)&v38 = v38;
      objc_msgSend(v37, "setXScale:", v38);
    }
    v49 = 0;
    if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sy", &v49))
    {
      v39 = (double)v49 / 100000.0;
      *(float *)&v39 = v39;
      objc_msgSend(v37, "setYScale:", v39);
    }
    v48 = 0;
    if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"kx", &v48))
    {
      v40 = (double)v48 / 60000.0;
      *(float *)&v40 = v40;
      objc_msgSend(v37, "setXSkew:", v40);
    }
    v47 = 0;
    if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"ky", &v47))
    {
      v41 = (double)v47 / 60000.0;
      *(float *)&v41 = v41;
      objc_msgSend(v37, "setYSkew:", v41);
    }
    v46 = 0;
    if (CXOptionalBoolAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"rotWithShape", &v46))
      objc_msgSend(v37, "setRotateWithShape:", v46);

  }
  objc_msgSend(v6, "setShadow2010:", v9);

}

+ (BOOL)readBooleanCharacterMultipleProperty:(_xmlNode *)a3 propertyName:(const char *)a4 attributeName:(const char *)a5 outValue:(int *)a6 state:(id)a7
{
  int BoolProperty;
  BOOL v10;

  v10 = 0;
  BoolProperty = wmxmlGetBoolProperty(a3, a4, (const xmlChar *)a5, &v10, (WXReadState *)a7);
  if (BoolProperty)
    *a6 = v10;
  return BoolProperty;
}

+ (void)readReflection:(id)a3 fromXmlNode:(_xmlNode *)a4 state:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v32 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"blurRad", &v32))
  {
    v7 = (double)v32 / 12700.0;
    *(float *)&v7 = v7;
    objc_msgSend(v6, "setBlurRadius:", v7);
  }
  v31 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"stA", &v31))
  {
    v8 = (double)v31 / 100000.0;
    *(float *)&v8 = v8;
    objc_msgSend(v6, "setStartOpacity:", v8);
  }
  v30 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"stPos", &v30))
  {
    v9 = (double)v30 / 100000.0;
    *(float *)&v9 = v9;
    objc_msgSend(v6, "setStartPosition:", v9);
  }
  v29 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"endA", &v29))
  {
    v10 = (double)v29 / 100000.0;
    *(float *)&v10 = v10;
    objc_msgSend(v6, "setEndOpacity:", v10);
  }
  v28 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"endPos", &v28))
  {
    v11 = (double)v28 / 100000.0;
    *(float *)&v11 = v11;
    objc_msgSend(v6, "setEndPosition:", v11);
  }
  v27 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dist", &v27))
  {
    v12 = (double)v27 / 12700.0;
    *(float *)&v12 = v12;
    objc_msgSend(v6, "setDistance:", v12);
  }
  v26 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"dir", &v26))
  {
    v13 = (double)v26 / 60000.0;
    *(float *)&v13 = v13;
    objc_msgSend(v6, "setDirection:", v13);
  }
  v25 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"fadeDir", &v25))
  {
    v14 = (double)v25 / 60000.0;
    *(float *)&v14 = v14;
    objc_msgSend(v6, "setFadeDirection:", v14);
  }
  v24 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sx", &v24))
  {
    v15 = (double)v24 / 100000.0;
    *(float *)&v15 = v15;
    objc_msgSend(v6, "setXScale:", v15);
  }
  v23 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"sy", &v23))
  {
    v16 = (double)v23 / 100000.0;
    *(float *)&v16 = v16;
    objc_msgSend(v6, "setYScale:", v16);
  }
  v22 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"kx", &v22))
  {
    v17 = (double)v22 / 60000.0;
    *(float *)&v17 = v17;
    objc_msgSend(v6, "setXSkew:", v17);
  }
  v21 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"ky", &v21))
  {
    v18 = (double)v21 / 60000.0;
    *(float *)&v18 = v18;
    objc_msgSend(v6, "setYSkew:", v18);
  }
  v19 = +[OAXBaseTypes readRectAlignmentFromXmlNode:name:](OAXBaseTypes, "readRectAlignmentFromXmlNode:name:", a4, "algn");
  if ((_DWORD)v19)
    objc_msgSend(v6, "setAlignment:", v19);
  v20 = 0;
  if (CXOptionalBoolAttribute(a4, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"rotWithShape", &v20))
    objc_msgSend(v6, "setRotateWithShape:", v20);

}

+ (id)readFillColor:(_xmlNode *)a3 forTarget:(id)a4 state:(id)a5
{
  id v6;
  _xmlNode *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  _xmlNode *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;

  v6 = a5;
  v7 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "srgbClr");
  if (v7)
  {
    v19 = 0;
    v8 = CXOptionalStringAttribute(v7, (void *)WXWord2010Namespace, (xmlChar *)"val", &v19);
    v9 = v19;
    if (v8)
    {
      +[WXShading getColorFromString:](WXShading, "getColorFromString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  v11 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)WXWord2010Namespace, "schemeClr");
  if (v11)
  {
    objc_msgSend(v6, "drawingState");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v12 = CXOptionalStringAttribute(v11, (void *)WXWord2010Namespace, (xmlChar *)"val", &v18);
    v13 = v18;
    if (v12)
    {
      +[OAXColor readPresetColorFromAttribute:](OAXColor, "readPresetColorFromAttribute:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14
        || (+[OAXColor readSchemeColorFromAttribute:](OAXColor, "readSchemeColorFromAttribute:", v13),
            (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v9, "colorMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "colorScheme");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[OADColor tsuColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "tsuColorWithColor:colorMap:colorScheme:colorPalette:", v14, v15, v16, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[OITSUColor blackColor](OITSUColor, "blackColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

+ (BOOL)readBooleanCharacterProperty:(_xmlNode *)a3 propertyName:(const char *)a4 attributeName:(const char *)a5 outValue:(int *)a6 state:(id)a7
{
  _BOOL4 BoolOnlyProperty;
  BOOL v10;

  v10 = 0;
  BoolOnlyProperty = wmxmlGetBoolOnlyProperty(a3, a4, (const xmlChar *)a5, &v10, (WXReadState *)a7);
  if (BoolOnlyProperty)
    *a6 = v10;
  return BoolOnlyProperty;
}

+ (BOOL)isBooleanCharacterPropertyTrue:(int)a3
{
  return a3 == 1;
}

@end
