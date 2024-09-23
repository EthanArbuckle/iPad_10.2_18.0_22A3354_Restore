@implementation WXTableCellProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  CXNamespace *v10;
  _xmlNode *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  xmlNode *v18;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  CXNamespace *v22;
  xmlNode *v23;
  void *v24;
  CXNamespace *v25;
  xmlNode *v26;
  void *v27;
  CXNamespace *v28;
  xmlNode *v29;
  CXNamespace *v30;
  void *v31;
  int v32;
  CXNamespace *v33;
  xmlNode *v34;
  CXNamespace *v35;
  void *v36;
  int v37;
  CXNamespace *v38;
  _xmlNode *v39;
  CXNamespace *v40;
  CXNamespace *v41;
  const xmlNode *v42;
  xmlChar *Prop;
  xmlChar *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  CXNamespace *v50;
  uint64_t v51;
  void *v52;
  CXNamespace *v53;
  _xmlNode *v54;
  CXNamespace *v55;
  uint64_t v56;
  void *v57;
  CXNamespace *v58;
  uint64_t v59;
  CXNamespace *v60;
  void *v61;
  CXNamespace *v62;
  uint64_t v63;
  void *v64;
  CXNamespace *v65;
  uint64_t v66;
  CXNamespace *v67;
  void *v68;
  CXNamespace *v69;
  uint64_t v70;
  void *v71;
  CXNamespace *v72;
  uint64_t v73;
  void *v74;
  CXNamespace *v75;
  uint64_t v76;
  void *v77;
  CXNamespace *v78;
  uint64_t v79;
  void *v80;
  unsigned int v81;
  unsigned int v82;
  BOOL v83;
  unsigned int v84;
  __int16 v85;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "WXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "tcPrChange");

  if (v11)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = OCXFindChild(v11, v12, "tcPr");

    if (v13)
      objc_msgSend(a1, "readFrom:to:state:", v13, v8, v9);
    objc_msgSend(v8, "setResolveMode:", 1);
    objc_msgSend(v8, "setFormattingChanged:", 1);
    wmxmlGetDateProperty(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFormattingChangeDate:", v14);

    objc_msgSend(v9, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetAuthorProperty(v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIndexToAuthorIDOfFormattingChange:", (unsigned __int16)objc_msgSend(v15, "revisionAuthorAddLookup:", v16));

  }
  v85 = 0;
  v84 = 0;
  objc_msgSend(v9, "WXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (xmlNode *)OCXFindChild(a3, v17, "tcW");

  objc_msgSend(v9, "WXMainNamespace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = WXOptionalTableWidthAttribute(v18, v19, (xmlChar *)"w", &v85, &v84);

  if ((_DWORD)v18)
  {
    objc_msgSend(v8, "setWidth:", v85);
    objc_msgSend(v8, "setWidthType:", v84);
  }
  objc_msgSend(v9, "WXMainNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "tcMar");

  if (v21)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v23 = (xmlNode *)OCXFindChild(v21, v22, "top");

    objc_msgSend(v9, "WXMainNamespace");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = WXOptionalTableWidthAttribute(v23, v24, (xmlChar *)"w", &v85, &v84);

    if ((_DWORD)v23)
    {
      objc_msgSend(v8, "setTopMargin:", v85);
      objc_msgSend(v8, "setTopMarginType:", v84);
    }
    objc_msgSend(v9, "WXMainNamespace");
    v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v26 = (xmlNode *)OCXFindChild(v21, v25, "bottom");

    objc_msgSend(v9, "WXMainNamespace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = WXOptionalTableWidthAttribute(v26, v27, (xmlChar *)"w", &v85, &v84);

    if ((_DWORD)v26)
    {
      objc_msgSend(v8, "setBottomMargin:", v85);
      objc_msgSend(v8, "setBottomMarginType:", v84);
    }
    objc_msgSend(v9, "WXMainNamespace");
    v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v29 = (xmlNode *)OCXFindChild(v21, v28, "left");

    if (!v29)
    {
      objc_msgSend(v9, "WXMainNamespace");
      v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v29 = (xmlNode *)OCXFindChild(v21, v30, "start");

    }
    objc_msgSend(v9, "WXMainNamespace");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = WXOptionalTableWidthAttribute(v29, v31, (xmlChar *)"w", &v85, &v84);

    if (v32)
    {
      objc_msgSend(v8, "setLeftMargin:", v85);
      objc_msgSend(v8, "setLeftMarginType:", v84);
    }
    objc_msgSend(v9, "WXMainNamespace");
    v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v34 = (xmlNode *)OCXFindChild(v21, v33, "right");

    if (!v34)
    {
      objc_msgSend(v9, "WXMainNamespace");
      v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v34 = (xmlNode *)OCXFindChild(0, v35, "end");

    }
    objc_msgSend(v9, "WXMainNamespace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = WXOptionalTableWidthAttribute(v34, v36, (xmlChar *)"w", &v85, &v84);

    if (v37)
    {
      objc_msgSend(v8, "setRightMargin:", v85);
      objc_msgSend(v8, "setRightMarginType:", v84);
    }
  }
  v83 = 0;
  objc_msgSend(v9, "WXMainNamespace");
  v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v39 = (_xmlNode *)OCXFindChild(a3, v38, "noWrap");

  objc_msgSend(v9, "WXMainNamespace");
  v40 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = CXOptionalBoolAttribute(v39, v40, (xmlChar *)"val", &v83);

  if ((_DWORD)v39)
    objc_msgSend(v8, "setNoWrap:", v83);
  objc_msgSend(v9, "WXMainNamespace");
  v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v42 = (const xmlNode *)OCXFindChild(a3, v41, "vMerge");

  if (v42)
  {
    objc_msgSend(v8, "setVerticallyMergedCell:", 1);
    Prop = xmlGetProp(v42, (const xmlChar *)"val");
    v44 = Prop;
    if (Prop)
    {
      objc_msgSend(v8, "setFirstInSetOfVerticallyMergedCells:", xmlStrcmp(Prop, (const xmlChar *)"restart") == 0);
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(v44);
    }
    else
    {
      objc_msgSend(v8, "setFirstInSetOfVerticallyMergedCells:", 0);
    }
  }
  v82 = 0;
  objc_msgSend(a1, "verticalAlignmentEnumMap");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = readEnumProperty<WDVerticalAlignment>(a3, "vAlign", (const xmlChar *)"val", v45, &v82, v9);

  if (v46)
    objc_msgSend(v8, "setVerticalAlignment:", v82);
  v81 = 0;
  +[WXCommon textDirectionEnumMap](WXCommon, "textDirectionEnumMap");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v47, &v81, v9))
  {

  }
  else
  {
    +[WXCommon strictTextDirectionEnumMap](WXCommon, "strictTextDirectionEnumMap");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = readEnumProperty<WDTextDirection>(a3, "textDirection", (const xmlChar *)"val", v48, &v81, v9);

    if (!v49)
      goto LABEL_32;
  }
  objc_msgSend(v8, "setTextDirection:", v81);
LABEL_32:
  objc_msgSend(v9, "WXMainNamespace");
  v50 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v51 = OCXFindChild(a3, v50, "shd");

  if (v51)
  {
    objc_msgSend(v8, "mutableShading");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXShading readFrom:to:state:](WXShading, "readFrom:to:state:", v51, v52, v9);

  }
  objc_msgSend(v9, "WXMainNamespace");
  v53 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v54 = (_xmlNode *)OCXFindChild(a3, v53, "tcBorders");

  if (v54)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v55 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v56 = OCXFindChild(v54, v55, "top");

    if (v56)
    {
      objc_msgSend(v8, "mutableTopBorder");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v56, v57, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v58 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v59 = OCXFindChild(v54, v58, "left");

    if (v59
      || (objc_msgSend(v9, "WXMainNamespace"),
          v60 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v59 = OCXFindChild(v54, v60, "start"),
          v60,
          v59))
    {
      objc_msgSend(v8, "mutableLeftBorder");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v59, v61, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v63 = OCXFindChild(v54, v62, "bottom");

    if (v63)
    {
      objc_msgSend(v8, "mutableBottomBorder");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v63, v64, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v65 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v66 = OCXFindChild(v54, v65, "right");

    if (v66
      || (objc_msgSend(v9, "WXMainNamespace"),
          v67 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v66 = OCXFindChild(v54, v67, "end"),
          v67,
          v66))
    {
      objc_msgSend(v8, "mutableRightBorder");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v66, v68, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v69 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v70 = OCXFindChild(v54, v69, "insideH");

    if (v70)
    {
      objc_msgSend(v8, "mutableInsideHorizontalBorder");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v70, v71, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v72 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v73 = OCXFindChild(v54, v72, "insideV");

    if (v73)
    {
      objc_msgSend(v8, "mutableInsideVerticalBorder");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v73, v74, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v75 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v76 = OCXFindChild(v54, v75, "tl2br");

    if (v76)
    {
      objc_msgSend(v8, "mutableDiagonalDownBorder");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v76, v77, v9);

    }
    objc_msgSend(v9, "WXMainNamespace");
    v78 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v79 = OCXFindChild(v54, v78, "tr2bl");

    if (v79)
    {
      objc_msgSend(v8, "mutableDiagonalUpBorder");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBorder readFrom:to:state:](WXBorder, "readFrom:to:state:", v79, v80, v9);

    }
  }
  objc_msgSend(v9, "setCurrentCellCNFStyle:", objc_msgSend(a1, "bitfieldForCnfStyleFrom:state:", a3, v9));

}

+ (id)verticalAlignmentEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_43, 0, &dword_22A0CC000);
  }
  if (+[WXTableCellProperties verticalAlignmentEnumMap]::onceToken != -1)
    dispatch_once(&+[WXTableCellProperties verticalAlignmentEnumMap]::onceToken, &__block_literal_global_94);
  return (id)+[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
}

void __49__WXTableCellProperties_verticalAlignmentEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:]([TCEnumerationMap alloc], "initWithStructs:count:", &+[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentStructs, 3);
  v1 = (void *)+[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap;
  +[WXTableCellProperties verticalAlignmentEnumMap]::sVerticalAlignmentEnumMap = (uint64_t)v0;

}

+ (unint64_t)bitfieldForCnfStyleFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CXNamespace *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  uint64_t i;
  CXNamespace *v12;
  _BOOL4 v13;
  uint64_t v14;
  CXNamespace *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  CXNamespace *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  CXNamespace *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  CXNamespace *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  CXNamespace *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  CXNamespace *v30;
  _BOOL4 v31;
  _BOOL4 v32;
  CXNamespace *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  CXNamespace *v36;
  _BOOL4 v37;
  _BOOL4 v38;
  CXNamespace *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  CXNamespace *v42;
  _BOOL4 v43;
  _BOOL4 v44;
  uint64_t v45;
  CXNamespace *v46;
  _BOOL4 v47;
  _BOOL4 v48;
  BOOL v50;
  id v51;

  v5 = a4;
  objc_msgSend(v5, "WXMainNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = OCXFindChild(a3, v6, "cnfStyle");

  if (v7)
  {
    objc_msgSend(v5, "WXMainNamespace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v9 = CXOptionalStringAttribute((_xmlNode *)v7, v8, (xmlChar *)"val", &v51);
    v10 = v51;

    if (v9)
    {
      if (objc_msgSend(v10, "length") == 12)
      {
        v7 = 0;
        for (i = 11; i != -1; --i)
          v7 = (objc_msgSend(v10, "characterAtIndex:", i) == 49) | (unint64_t)(2 * v7);
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v50 = 0;
      objc_msgSend(v5, "WXMainNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v13 = CXOptionalBoolAttribute((_xmlNode *)v7, v12, (xmlChar *)"firstRow", &v50);
      v14 = v50 && v13;

      objc_msgSend(v5, "WXMainNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v16 = CXOptionalBoolAttribute((_xmlNode *)v7, v15, (xmlChar *)"lastRow", &v50);
      v17 = v50;

      if (v16 && v17)
        v14 |= 2uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v19 = CXOptionalBoolAttribute((_xmlNode *)v7, v18, (xmlChar *)"firstColumn", &v50);
      v20 = v50;

      if (v19 && v20)
        v14 |= 4uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v22 = CXOptionalBoolAttribute((_xmlNode *)v7, v21, (xmlChar *)"lastColumn", &v50);
      v23 = v50;

      if (v22 && v23)
        v14 |= 8uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v25 = CXOptionalBoolAttribute((_xmlNode *)v7, v24, (xmlChar *)"oddVBand", &v50);
      v26 = v50;

      if (v25 && v26)
        v14 |= 0x10uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v28 = CXOptionalBoolAttribute((_xmlNode *)v7, v27, (xmlChar *)"evenVBand", &v50);
      v29 = v50;

      if (v28 && v29)
        v14 |= 0x20uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v31 = CXOptionalBoolAttribute((_xmlNode *)v7, v30, (xmlChar *)"oddHBand", &v50);
      v32 = v50;

      if (v31 && v32)
        v14 |= 0x40uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v34 = CXOptionalBoolAttribute((_xmlNode *)v7, v33, (xmlChar *)"evenHBand", &v50);
      v35 = v50;

      if (v34 && v35)
        v14 |= 0x80uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v37 = CXOptionalBoolAttribute((_xmlNode *)v7, v36, (xmlChar *)"firstRowFirstColumn", &v50);
      v38 = v50;

      if (v37 && v38)
        v14 |= 0x200uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v40 = CXOptionalBoolAttribute((_xmlNode *)v7, v39, (xmlChar *)"firstRowLastColumn", &v50);
      v41 = v50;

      if (v40 && v41)
        v14 |= 0x100uLL;
      objc_msgSend(v5, "WXMainNamespace");
      v42 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v43 = CXOptionalBoolAttribute((_xmlNode *)v7, v42, (xmlChar *)"lastRowFirstColumn", &v50);
      v44 = v50;

      if (v43 && v44)
        v45 = v14 | 0x800;
      else
        v45 = v14;
      objc_msgSend(v5, "WXMainNamespace");
      v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v47 = CXOptionalBoolAttribute((_xmlNode *)v7, v46, (xmlChar *)"lastRowLastColumn", &v50);
      v48 = v50;

      if (v47 && v48)
        v7 = v45 | 0x400;
      else
        v7 = v45;
    }

  }
  return v7;
}

+ (void)writeForDocument:(id)a3 state:(id)a4
{
  objc_msgSend(a1, "write:state:isForDocument:isTcPrChange:", a3, a4, 1, 0);
}

+ (void)writeForStyle:(id)a3 state:(id)a4
{
  objc_msgSend(a1, "write:state:isForDocument:isTcPrChange:", a3, a4, 0, 0);
}

@end
