@implementation WXSection

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  CXNamespace *v9;
  _xmlNode *Child;
  CXNamespace *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  CXNamespace *v15;
  uint64_t v16;
  CXNamespace *v17;
  _xmlNode *v18;
  CXNamespace *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  v8 = a5;
  objc_msgSend(v24, "setResolveMode:", 0);
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v9, "headerReference");

  while (Child)
  {
    objc_msgSend(a1, "mapHeader:toSection:state:", Child, v24, v8);
    objc_msgSend(v8, "WXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v11, (xmlChar *)"headerReference");

  }
  objc_msgSend(v8, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "footerReference");

  while (v13)
  {
    objc_msgSend(a1, "mapFooter:toSection:state:", v13, v24, v8);
    objc_msgSend(v8, "WXMainNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = OCXFindNextChild(v13, v14, (xmlChar *)"footerReference");

  }
  objc_msgSend(v8, "WXMainNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "printerSettings");

  if (v16)
    objc_msgSend(a1, "mapPrinterSettings:toSection:state:", v16, v24, v8);
  objc_msgSend(a1, "mapProperties:toSection:state:", a3, v24, v8);
  objc_msgSend(v8, "WXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "sectPrChange");

  if (v18)
  {
    objc_msgSend(v8, "WXMainNamespace");
    v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v20 = OCXFindChild(v18, v19, "sectPr");

    if (v20)
    {
      objc_msgSend(v24, "setResolveMode:", 1);
      objc_msgSend(a1, "mapProperties:toSection:state:", a3, v24, v8);
      objc_msgSend(v24, "setFormattingChanged:", 1);
      wmxmlGetDateProperty(v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFormattingChangeDate:", v21);

      objc_msgSend(v8, "document");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      wmxmlGetAuthorProperty(v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v22, "revisionAuthorAddLookup:", v23));

      objc_msgSend(v24, "setResolveMode:", 0);
      objc_msgSend(a1, "mapProperties:toSection:state:", v20, v24, v8);
    }
  }
  objc_msgSend(v24, "setResolveMode:", 2);

}

+ (void)mapHeader:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  xmlTextReader *v21;
  xmlTextReader *v22;
  xmlChar *Prop;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  void *v29;
  void *v30;
  id v31;
  void *v32;

  v31 = a4;
  v7 = a5;
  context = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v7, "wxoavState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "packagePart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OCXReadRequiredRelationshipForNode:packagePart:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v10;
  objc_msgSend(v10, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "packagePart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "package");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "packagePart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relationshipForIdentifier:", v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "targetLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "partForLocation:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "packagePart");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPackagePart:", v16);
  objc_msgSend(v7, "wxoavState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "packagePart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPackagePart:", v16);
  objc_msgSend(v7, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "packagePart");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPackagePart:", v16);
  v21 = (xmlTextReader *)objc_msgSend(v16, "xmlReader");
  v22 = v21;
  if (v21 && xmlTextReaderRead(v21) == 1 && xmlTextReaderNodeType(v22) == 1)
  {
    Prop = xmlGetProp(a3, (const xmlChar *)"type");
    if (xmlStrcmp(Prop, (const xmlChar *)"even"))
    {
      if (xmlStrcmp(Prop, (const xmlChar *)"default"))
      {
        if (!xmlStrcmp(Prop, (const xmlChar *)"first"))
        {
          objc_msgSend(v31, "firstPageHeader");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", v22, 0, v25, v7);

        }
      }
      else
      {
        objc_msgSend(v31, "oddPageHeader");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", v22, 0, v27, v7);

      }
    }
    else
    {
      objc_msgSend(v31, "evenPageHeader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", v22, 0, v26, v7);

    }
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Prop);
  }
  objc_msgSend(v17, "setPackagePart:", v18);
  objc_msgSend(v19, "setPackagePart:", v20);
  objc_msgSend(v7, "setPackagePart:", v32);
  objc_msgSend(v14, "targetLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetPartForLocation:", v24);

  xmlFreeTextReader(v22);
  objc_autoreleasePoolPop(context);

}

+ (void)mapProperties:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v7;
  WXReadState *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  CXNamespace *v19;
  _xmlNode *v20;
  void *v21;
  void *v22;
  CXNamespace *v23;
  _xmlNode *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  CXNamespace *v31;
  _xmlNode *v32;
  void *v33;
  void *v34;
  CXNamespace *v35;
  _xmlNode *v36;
  CXNamespace *v37;
  _xmlNode *v38;
  CXNamespace *v39;
  _BOOL4 v40;
  CXNamespace *v41;
  _BOOL4 v42;
  void *v43;
  _BOOL4 v44;
  id v45;
  CXNamespace *v46;
  _xmlNode *Child;
  CXNamespace *v48;
  unsigned int v49;
  CXNamespace *v50;
  unsigned int v51;
  CXNamespace *v52;
  CXNamespace *v53;
  _xmlNode *v54;
  CXNamespace *v55;
  uint64_t v56;
  CXNamespace *v57;
  uint64_t v58;
  CXNamespace *v59;
  _xmlNode *v60;
  CXNamespace *v61;
  _xmlAttr *v62;
  uint64_t v63;
  CXNamespace *v64;
  _xmlAttr *v65;
  uint64_t v66;
  CXNamespace *v67;
  _xmlNode *v68;
  CXNamespace *v69;
  CXNamespace *v70;
  CXNamespace *v71;
  CXNamespace *v72;
  CXNamespace *v73;
  uint64_t v74;
  CXNamespace *v75;
  uint64_t v76;
  CXNamespace *v77;
  _xmlAttr *v78;
  CXNamespace *v79;
  _xmlNode *v80;
  CXNamespace *v81;
  _BOOL4 v82;
  CXNamespace *v83;
  _BOOL4 v84;
  CXNamespace *v85;
  _BOOL4 v86;
  CXNamespace *v87;
  xmlNode *v88;
  CXNamespace *v89;
  _BOOL4 v90;
  id v91;
  _BOOL4 NSStringAnyNsProp;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  int v99;
  void *v100;
  int v101;
  void *v102;
  int v103;
  void *v104;
  int v105;
  void *v106;
  int v107;
  void *v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  int v113;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  BOOL v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id v133;
  uint64_t v134;

  v7 = a4;
  v8 = (WXReadState *)a5;
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "pgBorders");

  if (v10)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = (_xmlNode *)OCXFindChild(v10, v11, "top");

    if (v12)
    {
      objc_msgSend(v7, "mutableTopBorder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v12, v13, v8);

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 0;
      CXOptionalStringAttribute(v12, v14, (xmlChar *)"id", &v133);
      v15 = v133;

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = 0;
      CXOptionalStringAttribute(v12, v16, (xmlChar *)"topLeft", &v132);
      v17 = v132;

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = 0;
      CXOptionalStringAttribute(v12, v18, (xmlChar *)"topRight", &v131);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v20 = (_xmlNode *)OCXFindChild(v10, v19, "left");

    if (v20)
    {
      objc_msgSend(v7, "mutableLeftBorder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v20, v21, v8);

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = 0;
      CXOptionalStringAttribute(v20, v22, (xmlChar *)"id", &v130);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = (_xmlNode *)OCXFindChild(v10, v23, "bottom");

    if (v24)
    {
      objc_msgSend(v7, "mutableBottomBorder");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v24, v25, v8);

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = 0;
      CXOptionalStringAttribute(v24, v26, (xmlChar *)"id", &v129);
      v27 = v129;

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = 0;
      CXOptionalStringAttribute(v24, v28, (xmlChar *)"bottomLeft", &v128);
      v29 = v128;

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = 0;
      CXOptionalStringAttribute(v24, v30, (xmlChar *)"bottomRight", &v127);

    }
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v32 = (_xmlNode *)OCXFindChild(v10, v31, "right");

    if (v32)
    {
      objc_msgSend(v7, "mutableRightBorder");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v32, v33, v8);

      -[OCXState OCXRelationshipsNamespace](v8, "OCXRelationshipsNamespace");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = 0;
      CXOptionalStringAttribute(v32, v34, (xmlChar *)"id", &v126);

    }
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v36 = (_xmlNode *)OCXFindChild(a3, v35, "cols");

  if (v36)
  {
    v134 = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v38 = (_xmlNode *)OCXFindChild(a3, v37, "cols");

    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v40 = CXOptionalLongAttribute(v38, v39, (xmlChar *)"num", &v134);

    if (v40)
      objc_msgSend(v7, "setColumnCount:", (unsigned __int16)v134);
    objc_msgSend(v7, "isColumnCountOverridden");
    v125 = 0;
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v42 = CXOptionalLongAttribute(v38, v41, (xmlChar *)"space", &v125, 14);

    if (v42)
      objc_msgSend(v7, "setColumnSpace:", v125);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0;
    v44 = CXOptionalStringAttribute(v36, v43, (xmlChar *)"equalWidth", &v124);
    v45 = v124;

    if (v44)
      objc_msgSend(v7, "setColumnsEqualWidth:", objc_msgSend(v45, "isEqualToString:", CFSTR("0")) ^ 1);
    if (objc_msgSend(v7, "isColumnsEqualWidthOverridden"))
    {
      if ((objc_msgSend(v7, "columnsEqualWidth") & 1) == 0)
      {
        -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
        v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = (_xmlNode *)OCXFindChild(v36, v46, "col");

        while (Child)
        {
          -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
          v48 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v49 = CXDefaultLongAttribute(Child, v48, (xmlChar *)"w", 0, 14);

          objc_msgSend(v7, "appendColumnWidth:", v49);
          -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
          v50 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v51 = CXDefaultLongAttribute(Child, v50, (xmlChar *)"space", 0, 14);

          objc_msgSend(v7, "appendColumnSpace:", v51);
          -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
          v52 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          Child = OCXFindNextChild(Child, v52, (xmlChar *)"col");

        }
      }
    }

  }
  v123 = 0;
  if (wmxmlGetBoolOnlyProperty(a3, "titlePg", (const xmlChar *)"val", &v123, v8))
    objc_msgSend(v7, "setTitlePage:", v123);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v53 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v54 = (_xmlNode *)OCXFindChild(a3, v53, "bidi");

  if (v54)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v55 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v56 = CXDefaultLongAttribute(v54, v55, (xmlChar *)"val", 1);

    objc_msgSend(v7, "setBidi:", v56 == 1);
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v57 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v58 = OCXFindChild(a3, v57, "rtlGutter");

  if (v58)
    objc_msgSend(v7, "setRtlGutter:", 1);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v59 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v60 = (_xmlNode *)OCXFindChild(a3, v59, "pgSz");

  if (v60)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v61 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v62 = CXRequiredLongAttribute(v60, v61, (xmlChar *)"w", 14);

    if ((uint64_t)v62 >= 0)
      v63 = (uint64_t)v62;
    else
      v63 = 12240;
    objc_msgSend(v7, "setPageWidth:", v63);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v65 = CXRequiredLongAttribute(v60, v64, (xmlChar *)"h", 14);

    if ((uint64_t)v65 >= 0)
      v66 = (uint64_t)v65;
    else
      v66 = 15840;
    objc_msgSend(v7, "setPageHeight:", v66);
  }
  v125 = 0;
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v67 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v68 = (_xmlNode *)OCXFindChild(a3, v67, "pgMar");

  if (v68)
  {
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v69 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v125 = (uint64_t)CXRequiredLongAttribute(v68, v69, (xmlChar *)"left", 14);

    objc_msgSend(v7, "setLeftMargin:", v125);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v70 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v125 = (uint64_t)CXRequiredLongAttribute(v68, v70, (xmlChar *)"right", 14);

    objc_msgSend(v7, "setRightMargin:", v125);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v71 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v125 = (uint64_t)CXRequiredLongAttribute(v68, v71, (xmlChar *)"top", 14);

    objc_msgSend(v7, "setTopMargin:", v125);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v72 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v125 = (uint64_t)CXRequiredLongAttribute(v68, v72, (xmlChar *)"bottom", 14);

    objc_msgSend(v7, "setBottomMargin:", v125);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v73 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v74 = CXDefaultLongAttribute(v68, v73, (xmlChar *)"header", 720, 14);

    objc_msgSend(v7, "setHeaderMargin:", v74);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v75 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v76 = CXDefaultLongAttribute(v68, v75, (xmlChar *)"footer", 720, 14);

    objc_msgSend(v7, "setFooterMargin:", v76);
    -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
    v77 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v78 = CXRequiredLongAttribute(v68, v77, (xmlChar *)"gutter", 14);

    objc_msgSend(v7, "setGutterMargin:", v78);
  }
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v79 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v80 = (_xmlNode *)OCXFindChild(a3, v79, "lnNumType");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v81 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v82 = CXOptionalLongAttribute(v80, v81, (xmlChar *)"start", &v125);

  if (v82)
    objc_msgSend(v7, "setLineNumberStart:", (__int16)v125);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v83 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v84 = CXOptionalLongAttribute(v80, v83, (xmlChar *)"countBy", &v125);

  if (v84)
    objc_msgSend(v7, "setLineNumberIncrement:", (unsigned __int16)v125);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v85 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v86 = CXOptionalLongAttribute(v80, v85, (xmlChar *)"distance", &v125, 14);

  if (v86)
    objc_msgSend(v7, "setLineNumberDistance:", (__int16)v125);
  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v87 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v88 = (xmlNode *)OCXFindChild(a3, v87, "pgNumType");

  -[WXReadState WXMainNamespace](v8, "WXMainNamespace");
  v89 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v90 = CXOptionalLongAttribute(v88, v89, (xmlChar *)"start", &v125);

  if (v90)
  {
    objc_msgSend(v7, "setPageNumberStart:", (unsigned __int16)v125);
    objc_msgSend(v7, "setPageNumberRestart:", 1);
  }
  +[WXCommon numberFormatEnumMap](WXCommon, "numberFormatEnumMap");
  v91 = (id)objc_claimAutoreleasedReturnValue();
  v134 = 0;
  NSStringAnyNsProp = sfaxmlGetNSStringAnyNsProp(v88, (const xmlChar *)"fmt", &v134);
  v93 = (id)v134;
  if (NSStringAnyNsProp)
    v94 = (int)objc_msgSend(v91, "valueForString:", v93);
  else
    v94 = -130883970;

  if ((_DWORD)v94 != -130883970)
    objc_msgSend(v7, "setPageNumberFormat:", v94);
  LODWORD(v134) = 0;
  +[WXCommon textDirectionEnumMap](WXCommon, "textDirectionEnumMap");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v95, &v134, v8))
  {

  }
  else
  {
    +[WXCommon strictTextDirectionEnumMap](WXCommon, "strictTextDirectionEnumMap");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v96, &v134, v8);

    if (!v97)
      goto LABEL_55;
  }
  objc_msgSend(v7, "setTextDirection:", v134);
LABEL_55:
  v122 = 0;
  objc_msgSend(a1, "sectionBreakEnumMap");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = readEnumProperty<WDSectionBreakType>(a3, "type", (const xmlChar *)"val", v98, &v122, v8);

  if (v99)
    objc_msgSend(v7, "setBreakType:", v122);
  v121 = 0;
  objc_msgSend(a1, "pageOrientationEnumMap");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = readEnumProperty<WDPageOrientation>(a3, "pgSz", (const xmlChar *)"orient", v100, &v121, v8);

  if (v101)
    objc_msgSend(v7, "setPageOrientation:", v121);
  v120 = 0;
  objc_msgSend(a1, "pageBorderDepthEnumMap");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = readEnumProperty<WDPageBorderDepth>(a3, "pgBorders", (const xmlChar *)"zOrder", v102, &v120, v8);

  if (v103)
    objc_msgSend(v7, "setBorderDepth:", v120);
  v119 = 0;
  objc_msgSend(a1, "pageBorderDisplayEnumMap");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = readEnumProperty<WDPageBorderDisplay>(a3, "pgBorders", (const xmlChar *)"display", v104, &v119, v8);

  if (v105)
    objc_msgSend(v7, "setBorderDisplay:", v119);
  v118 = 0;
  objc_msgSend(a1, "pageBorderOffsetEnumMap");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = readEnumProperty<WDPageBorderOffset>(a3, "pgBorders", (const xmlChar *)"offsetFrom", v106, &v118, v8);

  if (v107)
    objc_msgSend(v7, "setBorderOffset:", v118);
  v117 = 0;
  objc_msgSend(a1, "lineNumberRestartEnumMap");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = readEnumProperty<WDLineNumberRestart>(a3, "lnNumType", (const xmlChar *)"restart", v108, &v117, v8);

  if (v109)
    objc_msgSend(v7, "setLineNumberRestart:", v117);
  v116 = 0;
  objc_msgSend(a1, "verticalJustificationEnumMap");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = readEnumProperty<WDVerticalJustification>(a3, "vAlign", (const xmlChar *)"val", v110, &v116, v8);

  if (v111)
    objc_msgSend(v7, "setVerticalJustification:", v116);
  v115 = 0;
  objc_msgSend(a1, "chapterNumberSeparatorEnumMap");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = readEnumProperty<WDChapterNumberSeparator>(a3, "pgNumType", (const xmlChar *)"chapSep", v112, &v115, v8);

  if (v113)
    objc_msgSend(v7, "setChapterNumberSeparator:", v115);

}

+ (void)mapFooter:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  xmlTextReader *v21;
  xmlTextReader *v22;
  xmlChar *Prop;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  void *v29;
  void *v30;
  id v31;
  void *v32;

  v31 = a4;
  v7 = a5;
  context = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v7, "wxoavState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "packagePart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OCXReadRequiredRelationshipForNode:packagePart:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v10;
  objc_msgSend(v10, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "packagePart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "package");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "packagePart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relationshipForIdentifier:", v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "targetLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "partForLocation:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "packagePart");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPackagePart:", v16);
  objc_msgSend(v7, "wxoavState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "packagePart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPackagePart:", v16);
  objc_msgSend(v7, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "packagePart");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPackagePart:", v16);
  v21 = (xmlTextReader *)objc_msgSend(v16, "xmlReader");
  v22 = v21;
  if (v21 && xmlTextReaderRead(v21) == 1 && xmlTextReaderNodeType(v22) == 1)
  {
    Prop = xmlGetProp(a3, (const xmlChar *)"type");
    if (xmlStrcmp(Prop, (const xmlChar *)"even"))
    {
      if (xmlStrcmp(Prop, (const xmlChar *)"default"))
      {
        if (!xmlStrcmp(Prop, (const xmlChar *)"first"))
        {
          objc_msgSend(v31, "firstPageFooter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", v22, 0, v25, v7);

        }
      }
      else
      {
        objc_msgSend(v31, "oddPageFooter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", v22, 0, v27, v7);

      }
    }
    else
    {
      objc_msgSend(v31, "evenPageFooter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", v22, 0, v26, v7);

    }
    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Prop);
  }
  objc_msgSend(v17, "setPackagePart:", v18);
  objc_msgSend(v19, "setPackagePart:", v20);
  objc_msgSend(v7, "setPackagePart:", v32);
  objc_msgSend(v14, "targetLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resetPartForLocation:", v24);

  xmlFreeTextReader(v22);
  objc_autoreleasePoolPop(context);

}

+ (float)scaleFromPrinterSettings:(id)a3
{
  void *v3;
  id v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  float v14;
  id v16;

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  v5 = 1.0;
  if (v3)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("com.apple.print.PageFormat.PMScaling"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "valueForKey:", CFSTR("com.apple.print.ticket.itemArray"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8
        && objc_msgSend(v8, "count") == 1
        && (objc_msgSend(v9, "objectAtIndex:", 0),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v10,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v9, "objectAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "valueForKey:", CFSTR("com.apple.print.PageFormat.PMScaling"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v5 = v14;

      }
      else
      {
        v12 = v7;
      }

    }
  }

  return v5;
}

+ (TCEnumerationMap)sectionBreakEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_39, 0, &dword_22A0CC000);
  }
  if (+[WXSection sectionBreakEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection sectionBreakEnumMap]::onceToken, &__block_literal_global_90);
  return (TCEnumerationMap *)(id)+[WXSection sectionBreakEnumMap]::sSectionBreakEnumMap;
}

void __32__WXSection_sectionBreakEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection sectionBreakEnumMap]::sSectionBreakEnumStructs, 5, 1);
  v1 = (void *)+[WXSection sectionBreakEnumMap]::sSectionBreakEnumMap;
  +[WXSection sectionBreakEnumMap]::sSectionBreakEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)pageOrientationEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_14_1, 0, &dword_22A0CC000);
  }
  if (+[WXSection pageOrientationEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection pageOrientationEnumMap]::onceToken, &__block_literal_global_15_3);
  return (TCEnumerationMap *)(id)+[WXSection pageOrientationEnumMap]::sPageOrientationEnumMap;
}

void __35__WXSection_pageOrientationEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection pageOrientationEnumMap]::sPageOrientationEnumStructs, 2, 1);
  v1 = (void *)+[WXSection pageOrientationEnumMap]::sPageOrientationEnumMap;
  +[WXSection pageOrientationEnumMap]::sPageOrientationEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)pageBorderDepthEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_20, 0, &dword_22A0CC000);
  }
  if (+[WXSection pageBorderDepthEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection pageBorderDepthEnumMap]::onceToken, &__block_literal_global_21);
  return (TCEnumerationMap *)(id)+[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumMap;
}

void __35__WXSection_pageBorderDepthEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumStructs, 2, 1);
  v1 = (void *)+[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumMap;
  +[WXSection pageBorderDepthEnumMap]::sPageBorderDepthEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)pageBorderDisplayEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_28, 0, &dword_22A0CC000);
  }
  if (+[WXSection pageBorderDisplayEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection pageBorderDisplayEnumMap]::onceToken, &__block_literal_global_29_0);
  return (TCEnumerationMap *)(id)+[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumMap;
}

void __37__WXSection_pageBorderDisplayEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumStructs, 3, 1);
  v1 = (void *)+[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumMap;
  +[WXSection pageBorderDisplayEnumMap]::sPageBorderDisplayEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)pageBorderOffsetEnumMap
{
  unsigned __int8 v3;

  if ((v3 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_34_0, 0, &dword_22A0CC000);
  }
  if (+[WXSection pageBorderOffsetEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection pageBorderOffsetEnumMap]::onceToken, &__block_literal_global_35_1);
  return (TCEnumerationMap *)objc_msgSend(a1, "pageBorderDisplayEnumMap");
}

void __36__WXSection_pageBorderOffsetEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection pageBorderOffsetEnumMap]::sPageBorderOffsetEnumStructs, 2, 1);
  v1 = (void *)+[WXSection pageBorderOffsetEnumMap]::sPageBorderOffsetEnumMap;
  +[WXSection pageBorderOffsetEnumMap]::sPageBorderOffsetEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)lineNumberRestartEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_40_1, 0, &dword_22A0CC000);
  }
  if (+[WXSection lineNumberRestartEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection lineNumberRestartEnumMap]::onceToken, &__block_literal_global_41_1);
  return (TCEnumerationMap *)(id)+[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumMap;
}

void __37__WXSection_lineNumberRestartEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumStructs, 3, 1);
  v1 = (void *)+[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumMap;
  +[WXSection lineNumberRestartEnumMap]::sLineNumberRestartEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)verticalJustificationEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_50_0, 0, &dword_22A0CC000);
  }
  if (+[WXSection verticalJustificationEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection verticalJustificationEnumMap]::onceToken, &__block_literal_global_51);
  return (TCEnumerationMap *)(id)+[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumMap;
}

void __41__WXSection_verticalJustificationEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumStructs, 4, 1);
  v1 = (void *)+[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumMap;
  +[WXSection verticalJustificationEnumMap]::sVerticalJustificationEnumMap = (uint64_t)v0;

}

+ (TCEnumerationMap)chapterNumberSeparatorEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_62_2, 0, &dword_22A0CC000);
  }
  if (+[WXSection chapterNumberSeparatorEnumMap]::onceToken != -1)
    dispatch_once(&+[WXSection chapterNumberSeparatorEnumMap]::onceToken, &__block_literal_global_63_1);
  return (TCEnumerationMap *)(id)+[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumMap;
}

void __42__WXSection_chapterNumberSeparatorEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumStructs, 5, 1);
  v1 = (void *)+[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumMap;
  +[WXSection chapterNumberSeparatorEnumMap]::sChapterNumberSeparatorEnumMap = (uint64_t)v0;

}

+ (void)mapPrinterSettings:(_xmlNode *)a3 toSection:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  id v23;

  v23 = a4;
  v8 = a5;
  objc_msgSend(v8, "wxoavState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "packagePart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OCXReadRequiredRelationshipForNode:packagePart:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "packagePart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "package");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "packagePart");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "relationshipForIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "targetLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "partForLocation:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scaleFromPrinterSettings:", v19);
    v21 = v20;

    if (v21 != 1.0)
      objc_msgSend(v23, "setPageScale:", (float)(v21 * 100.0));
  }
  objc_msgSend(v16, "targetLocation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetPartForLocation:", v22);

}

@end
