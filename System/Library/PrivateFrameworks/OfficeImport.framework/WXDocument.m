@implementation WXDocument

+ (id)documentFrom:(id)a3 reader:(id)a4 cancel:(id)a5 asThumbnail:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  WDDocument *v13;
  WXReadState *v14;
  OCPPackagePart *v15;
  xmlTextReader *v16;
  const xmlChar *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(WDDocument);
  -[OCDDocument setReader:](v13, "setReader:", v11);
  if (v10 && v13)
  {
    v38 = v10;
    v39 = v12;
    v36 = v11;
    v14 = objc_alloc_init(WXReadState);
    -[WXReadState setDocument:](v14, "setDocument:", v13);
    -[WXReadState setCancelDelegate:](v14, "setCancelDelegate:", v12);
    -[WXReadState setIsThumbnail:](v14, "setIsThumbnail:", v6);
    objc_msgSend(v10, "mainDocumentPart");
    v15 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
    v16 = -[OCPPackagePart xmlReader](v15, "xmlReader");
    if (!v16)
      +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
    if (xmlTextReaderRead(v16) != 1)
    {
      xmlFreeTextReader(v16);
      +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
    }
    if (xmlTextReaderNodeType(v16) != 1
      || (v17 = xmlTextReaderConstLocalName(v16), !xmlStrEqual(v17, (const xmlChar *)"document")))
    {
      xmlFreeTextReader(v16);
      +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
    }
    if (OCXIsStrictXmlFile(v16))
      -[WXReadState setupNSForXMLFormat:](v14, "setupNSForXMLFormat:", 1);
    xmlFreeTextReader(v16);
    -[OCDDocument theme](v13, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v18;
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v15, &v14->super.super, (objc_selector *)sel_OCXThemeRelationshipType);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      -[WXReadState drawingState](v14, "drawingState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v37, v18, v19);

    }
    objc_msgSend(v18, "validateTheme");
    -[WXReadState drawingState](v14, "drawingState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "baseStyles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorScheme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColorScheme:", v22);

    -[OCXState OCXFontTableRelationshipType](v14, "OCXFontTableRelationshipType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCPPackagePart firstPartWithRelationshipOfType:](v15, "firstPartWithRelationshipOfType:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      objc_msgSend(a1, "readFontTable:to:state:", v24, v13, v14);
    -[OCXState OCXStylesRelationshipType](v14, "OCXStylesRelationshipType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCPPackagePart firstPartWithRelationshipOfType:](v15, "firstPartWithRelationshipOfType:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(a1, "readStyles:to:state:", v26, v13, v14);
    }
    else
    {
      -[WDDocument styleSheet](v13, "styleSheet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "createDefaultStyles");

    }
    -[OCXState OCXNumberingRelationshipType](v14, "OCXNumberingRelationshipType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCPPackagePart firstPartWithRelationshipOfType:](v15, "firstPartWithRelationshipOfType:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(a1, "readLists:to:state:", v29, v13, v14);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v15, &v14->super.super, (objc_selector *)sel_OCXCustomXmlRelationshipType);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(a1, "readSources:to:state:", v30, v13, v14);
    -[OCXState OCXSettingsRelationshipType](v14, "OCXSettingsRelationshipType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCPPackagePart firstPartWithRelationshipOfType:](v15, "firstPartWithRelationshipOfType:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      +[WXDocument readDocumentSettings:to:state:](WXDocument, "readDocumentSettings:to:state:", v32, v13, v14);
    -[WXReadState setDocumentPart:](v14, "setDocumentPart:", v15);
    objc_msgSend(a1, "readDocument:to:state:", v15, v13, v14);
    -[OCDDocument summary](v13, "summary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[OCXSummary readSummary:package:](OCXSummary, "readSummary:package:", v33, v38);

    v10 = v38;
    v12 = v39;
    v11 = v36;
  }

  return v13;
}

+ (void)readDocumentSettings:(id)a3 to:(id)a4 state:(id)a5
{
  WXReadState *v7;
  _xmlDoc *v8;
  _xmlNode *v9;
  CXNamespace *v10;
  _BOOL8 v11;
  CXNamespace *v12;
  CXNamespace *v13;
  _BOOL4 v14;
  CXNamespace *v15;
  uint64_t v16;
  CXNamespace *v17;
  CXNamespace *v18;
  _BOOL8 v19;
  CXNamespace *v20;
  _xmlNode *v21;
  CXNamespace *v22;
  CXNamespace *v23;
  uint64_t v24;
  CXNamespace *v25;
  _xmlNode *v26;
  CXNamespace *v27;
  void *v28;
  CXNamespace *v29;
  _xmlNode *v30;
  CXNamespace *v31;
  void *v32;
  CXNamespace *v33;
  _xmlNode *v34;
  CXNamespace *v35;
  uint64_t v36;
  CXNamespace *v37;
  uint64_t v38;
  CXNamespace *v39;
  uint64_t v40;
  CXNamespace *v41;
  uint64_t v42;
  CXNamespace *v43;
  uint64_t v44;
  CXNamespace *v45;
  _xmlNode *v46;
  CXNamespace *v47;
  uint64_t v48;
  CXNamespace *v49;
  _xmlNode *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  int v60;
  uint64_t v61;
  CXNamespace *v62;
  _xmlNode *v63;
  CXNamespace *v64;
  CXNamespace *v65;
  _xmlNode *Child;
  void (**v67)(xmlChar *);
  xmlChar *Prop;
  void *v69;
  CXNamespace *v70;
  CXNamespace *v71;
  _xmlNode *v72;
  void *v73;
  int v74;
  uint64_t v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  int v82;
  uint64_t v83;
  CXNamespace *v84;
  _xmlNode *v85;
  void (**v86)(xmlChar *);
  xmlChar *v87;
  void *v88;
  CXNamespace *v89;
  _xmlNode *v91;
  id v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  BOOL v96;

  v92 = a4;
  v7 = (WXReadState *)a5;
  v8 = (_xmlDoc *)objc_msgSend(a3, "xmlDocument");
  if (v8)
  {
    v9 = OCXGetRootElement(v8);
    if (v9)
    {
      v96 = 0;
      v91 = v9;
      if (wmxmlGetBoolOnlyProperty(v9, "evenAndOddHeaders", (const xmlChar *)"val", &v96, v7))
        objc_msgSend(v92, "setEvenAndOddHeaders:", v96);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v11 = OCXFindChild(v91, v10, "mirrorMargins") != 0;

      objc_msgSend(v92, "setMirrorMargins:", v11);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = CXOptionalBoolAttribute(v91, v12, (xmlChar *)"bordersDoNotSurroundHeader", &v96);

      if (v11)
        objc_msgSend(v92, "setBorderSurroundHeader:", !v96);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v14 = CXOptionalBoolAttribute(v91, v13, (xmlChar *)"bordersDoNotSurroundFooter", &v96);

      if (v14)
        objc_msgSend(v92, "setBorderSurroundFooter:", !v96);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v16 = OCXFindChild(v91, v15, "autoHyphenation");

      if (v16)
        objc_msgSend(v92, "setAutoHyphenate:", 1);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setBookFold:", OCXFindChild(v91, v17, "bookFoldPrinting") != 0);

      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v19 = OCXFindChild(v91, v18, "gutterAtTop") != 0;

      objc_msgSend(v92, "setGutterPosition:", v19);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v21 = (_xmlNode *)OCXFindChild(v91, v20, "defaultTabStop");

      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      LOWORD(v21) = CXDefaultLongAttribute(v21, v22, (xmlChar *)"val", 0, 14);

      objc_msgSend(v92, "setDefaultTabWidth:", (unsigned __int16)v21);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v24 = OCXFindChild(v91, v23, "strictFirstAndLastChars");

      if (v24)
        objc_msgSend(v92, "setKinsokuStrict:", 1);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v26 = (_xmlNode *)OCXFindChild(v91, v25, "noLineBreaksBefore");

      if (v26)
      {
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        CXRequiredStringAttribute(v26, v27, (xmlChar *)"val");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v92, "setKinsokuAltBreakBefore:", v28);
      }
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v30 = (_xmlNode *)OCXFindChild(v91, v29, "noLineBreaksAfter");

      if (v30)
      {
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        CXRequiredStringAttribute(v30, v31, (xmlChar *)"val");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v92, "setKinsokuAltBreakAfter:", v32);
      }
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v34 = (_xmlNode *)OCXFindChild(v91, v33, "revisionView");

      if (v34)
      {
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v36 = CXDefaultBoolAttribute(v34, v35, (xmlChar *)"comments", 1);

        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v38 = CXDefaultBoolAttribute(v34, v37, (xmlChar *)"insDel", 1);

        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v40 = CXDefaultBoolAttribute(v34, v39, (xmlChar *)"formatting", 1);

        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v42 = CXDefaultBoolAttribute(v34, v41, (xmlChar *)"markup", 1);

      }
      else
      {
        v36 = 1;
        v42 = 1;
        v38 = 1;
        v40 = 1;
      }
      objc_msgSend(v92, "setShowComments:", v36);
      objc_msgSend(v92, "setShowMarkup:", v42);
      objc_msgSend(v92, "setShowInsertionsAndDeletions:", v38);
      objc_msgSend(v92, "setShowFormatting:", v40);
      if (wmxmlGetBoolOnlyProperty(v91, "view", (const xmlChar *)"val", &v96, v7))
        objc_msgSend(v92, "setShowOutline:", v96);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v44 = OCXFindChild(v91, v43, "trackRevisions");

      objc_msgSend(v92, "setTrackChanges:", v44 != 0);
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v45 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v46 = (_xmlNode *)OCXFindChild(v91, v45, "compat");

      if (v46)
      {
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v47 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v48 = OCXFindChild(v46, v47, "noTabHangInd");

        if (v48)
          objc_msgSend(v92, "setNoTabForHangingIndents:", 1);
      }
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v49 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v50 = (_xmlNode *)OCXFindChild(v91, v49, "footnotePr");

      if (v50)
      {
        v95 = 0;
        +[WXCommon numberFormatEnumMap](WXCommon, "numberFormatEnumMap");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = readEnumProperty<WDNumberFormat>(v50, "numFmt", (const xmlChar *)"val", v51, &v95, v7);

        if (v52)
          v53 = v95;
        else
          v53 = 0;
        objc_msgSend(v92, "setFootnoteNumberFormat:", v53);
        if (v95 == 62)
        {
          +[WXCommon customNumberFormatEnumMap](WXCommon, "customNumberFormatEnumMap");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = readEnumProperty<WDNumberFormat>(v50, "numFmt", (const xmlChar *)"format", v54, &v95, v7);

          if (v55)
            objc_msgSend(v92, "setFootnoteNumberFormat:", v95);
        }
        v94 = 0;
        objc_msgSend(a1, "noteRestartEnumMap");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = readEnumProperty<WDNoteRestart>(v50, "numRestart", (const xmlChar *)"val", v56, &v94, v7);

        v58 = v57 ? v94 : 0;
        objc_msgSend(v92, "setFootnoteRestart:", v58);
        v93 = 0;
        objc_msgSend(a1, "notePositionEnumMap");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = readEnumProperty<WDNotePosition>(v50, "pos", (const xmlChar *)"val", v59, &v93, v7);

        v61 = v60 ? v93 : 1;
        objc_msgSend(v92, "setFootnotePosition:", v61);
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v63 = (_xmlNode *)OCXFindChild(v91, v62, "numStart");

        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        LOWORD(v63) = CXDefaultLongAttribute(v63, v64, (xmlChar *)"val", 1);

        objc_msgSend(v92, "setFootnoteNumberingStart:", (unsigned __int16)v63);
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v65 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = (_xmlNode *)OCXFindChild(v50, v65, "footnote");

        if (Child)
        {
          v67 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
          do
          {
            Prop = xmlGetProp(Child, (const xmlChar *)"type");
            if (xmlStrEqual(Prop, (const xmlChar *)"separator"))
            {
              objc_msgSend(v92, "footnoteSeparator");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", Child, 0, v69, v7);
            }
            else if (xmlStrEqual(Prop, (const xmlChar *)"continuationSeparator"))
            {
              objc_msgSend(v92, "footnoteContinuationSeparator");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", Child, 0, v69, v7);
            }
            else
            {
              if (!xmlStrEqual(Prop, (const xmlChar *)"continuationNotice") && Prop)
                goto LABEL_48;
              objc_msgSend(v92, "footnoteContinuationNotice");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", Child, 0, v69, v7);
            }

LABEL_48:
            (*v67)(Prop);
            -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
            v70 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
            Child = OCXFindNextChild(Child, v70, (xmlChar *)"footnote");

          }
          while (Child);
        }
      }
      -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
      v71 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v72 = (_xmlNode *)OCXFindChild(v91, v71, "endnotePr");

      if (v72)
      {
        v95 = 0;
        +[WXCommon numberFormatEnumMap](WXCommon, "numberFormatEnumMap");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = readEnumProperty<WDNumberFormat>(v72, "numFmt", (const xmlChar *)"val", v73, &v95, v7);

        if (v74)
          v75 = v95;
        else
          v75 = 0;
        objc_msgSend(v92, "setEndnoteNumberFormat:", v75);
        if (v95 == 62)
        {
          +[WXCommon customNumberFormatEnumMap](WXCommon, "customNumberFormatEnumMap");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = readEnumProperty<WDNumberFormat>(v72, "numFmt", (const xmlChar *)"format", v76, &v95, v7);

          if (v77)
            objc_msgSend(v92, "setFootnoteNumberFormat:", v95);
        }
        v94 = 0;
        objc_msgSend(a1, "noteRestartEnumMap");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = readEnumProperty<WDNoteRestart>(v72, "numRestart", (const xmlChar *)"val", v78, &v94, v7);

        v80 = v79 ? v94 : 0;
        objc_msgSend(v92, "setEndnoteRestart:", v80);
        v93 = 0;
        objc_msgSend(a1, "notePositionEnumMap");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = readEnumProperty<WDNotePosition>(v72, "pos", (const xmlChar *)"val", v81, &v93, v7);

        v83 = v82 ? v93 : 3;
        objc_msgSend(v92, "setEndnotePosition:", v83);
        -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
        v84 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v85 = (_xmlNode *)OCXFindChild(v72, v84, "endnote");

        if (v85)
        {
          v86 = (void (**)(xmlChar *))MEMORY[0x24BEDE758];
          do
          {
            v87 = xmlGetProp(v85, (const xmlChar *)"type");
            if (xmlStrEqual(v87, (const xmlChar *)"separator"))
            {
              objc_msgSend(v92, "endnoteSeparator");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", v85, 0, v88, v7);
            }
            else if (xmlStrEqual(v87, (const xmlChar *)"continuationSeparator"))
            {
              objc_msgSend(v92, "endnoteContinuationSeparator");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", v85, 0, v88, v7);
            }
            else
            {
              if (!xmlStrEqual(v87, (const xmlChar *)"continuationNotice") && v87)
                goto LABEL_72;
              objc_msgSend(v92, "endnoteContinuationNotice");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", v85, 0, v88, v7);
            }

LABEL_72:
            (*v86)(v87);
            -[WXReadState WXMainNamespace](v7, "WXMainNamespace");
            v89 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
            v85 = OCXFindNextChild(v85, v89, (xmlChar *)"endnote");

          }
          while (v85);
        }
      }
    }
  }

}

+ (id)noteRestartEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_32, 0, &dword_22A0CC000);
  }
  if (+[WXDocument noteRestartEnumMap]::onceToken != -1)
    dispatch_once(&+[WXDocument noteRestartEnumMap]::onceToken, &__block_literal_global_83);
  return (id)+[WXDocument noteRestartEnumMap]::sNoteRestartEnumMap;
}

void __32__WXDocument_noteRestartEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXDocument noteRestartEnumMap]::sNoteRestartEnumStructs, 3, 1);
  v1 = (void *)+[WXDocument noteRestartEnumMap]::sNoteRestartEnumMap;
  +[WXDocument noteRestartEnumMap]::sNoteRestartEnumMap = (uint64_t)v0;

}

+ (id)notePositionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_10, 0, &dword_22A0CC000);
  }
  if (+[WXDocument notePositionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXDocument notePositionEnumMap]::onceToken, &__block_literal_global_11_2);
  return (id)+[WXDocument notePositionEnumMap]::sNotePositionEnumMap;
}

void __33__WXDocument_notePositionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXDocument notePositionEnumMap]::sNotePositionEnumStructs, 2, 1);
  v1 = (void *)+[WXDocument notePositionEnumMap]::sNotePositionEnumMap;
  +[WXDocument notePositionEnumMap]::sNotePositionEnumMap = (uint64_t)v0;

}

+ (void)readFontTable:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  _xmlDoc *v8;
  xmlNodePtr v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = (_xmlDoc *)objc_msgSend(a3, "xmlDocument");
  if (v8)
  {
    v9 = OCXGetRootElement(v8);
    objc_msgSend(v11, "fontTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXFontTable readFrom:to:state:](WXFontTable, "readFrom:to:state:", v9, v10, v7);

  }
}

+ (void)readStyles:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  _xmlDoc *v8;
  xmlNodePtr v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = (_xmlDoc *)objc_msgSend(a3, "xmlDocument");
  if (v8)
  {
    v9 = OCXGetRootElement(v8);
    objc_msgSend(v11, "styleSheet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXStyleSheet readFrom:to:state:](WXStyleSheet, "readFrom:to:state:", v9, v10, v7);

  }
}

+ (void)readLists:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _xmlDoc *v11;
  CXNamespace *v12;
  _xmlNode *Child;
  void *v14;
  void *v15;
  CXNamespace *v16;
  CXNamespace *v17;
  int v18;
  void *v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  CXNamespace *v23;
  WDOfficeArt *v24;
  void *v25;
  WDOfficeArt *v26;
  CXNamespace *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  xmlNodePtr v36;
  id v37;

  v37 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "wxoavState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPackagePart:", v37);

  objc_msgSend(v8, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPackagePart:", v37);

  v11 = (_xmlDoc *)objc_msgSend(v37, "xmlDocument");
  if (v11)
  {
    v36 = OCXGetRootElement(v11);
    if (v36)
    {
      objc_msgSend(v8, "WXMainNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = (_xmlNode *)OCXFindChild(v36, v12, "numPicBullet");

      if (Child)
      {
        objc_msgSend(v7, "imageBullets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageBulletParagraph");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        do
        {
          objc_msgSend(v8, "WXMainNamespace", v36);
          v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          if (CXCountChildren(Child, v16, (xmlChar *)"pict") == 1)
          {

          }
          else
          {
            objc_msgSend(v8, "WXMainNamespace");
            v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
            v18 = CXCountChildren(Child, v17, (xmlChar *)"drawing");

            if (v18 != 1)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[WXDocument(Private) readLists:to:state:]");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Word/Xml/Mapper/WXDocument.mm");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 396, 0, "Unexpect number of office art image bullet elements.");

              +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            }
          }
          objc_msgSend(v8, "WXMainNamespace");
          v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v22 = OCXFindChild(Child, v21, "pict");

          if (v22
            || (objc_msgSend(v8, "WXMainNamespace"),
                v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
                v22 = OCXFindChild(Child, v23, "drawing"),
                v23,
                v22))
          {
            v24 = [WDOfficeArt alloc];
            objc_msgSend(v7, "imageBulletParagraph");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[WDOfficeArt initWithParagraph:](v24, "initWithParagraph:", v25);

            +[WXOfficeArt readFrom:parentRElement:parentParagraph:state:to:](WXOfficeArt, "readFrom:parentRElement:parentParagraph:state:to:", v22, Child, v15, v8, v26);
            objc_msgSend(v15, "addRun:", v26);
            objc_msgSend(v14, "addObject:", v26);

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[WXDocument(Private) readLists:to:state:]");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Word/Xml/Mapper/WXDocument.mm");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 403, 0, "WXDocument readLists: unable to find image bullet node");

            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
          }
          objc_msgSend(v8, "WXMainNamespace");
          v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          Child = OCXFindNextChild(Child, v27, (xmlChar *)"numPicBullet");

        }
        while (Child);

      }
      objc_msgSend(v7, "listDefinitionTable", v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXListDefinitionTable readFrom:to:state:](WXListDefinitionTable, "readFrom:to:state:", v36, v30, v8);

      objc_msgSend(v7, "listTable");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXListTable readFrom:to:state:](WXListTable, "readFrom:to:state:", v36, v31, v8);

    }
  }
  objc_msgSend(v8, "wxoavState", v36);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPackagePart:", 0);

  objc_msgSend(v8, "drawingState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPackagePart:", 0);

  objc_msgSend(v8, "wxoavState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "resetForNewDrawing");

  objc_msgSend(v8, "drawingState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "resetForNewDrawing");

}

+ (void)readSources:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  _xmlDoc *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  v8 = (_xmlDoc *)objc_msgSend(a3, "xmlDocument");
  if (v8)
    +[WXCitationTable readFrom:to:state:](WXCitationTable, "readFrom:to:state:", OCXGetRootElement(v8), v9, v7);

}

+ (void)readDocument:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  xmlTextReader *v8;
  const xmlChar *v9;
  int v10;
  int v11;
  const xmlChar *v12;
  xmlNodePtr v13;
  void *v14;
  void *v15;
  OADBackgroundProperties *v16;
  char v17;
  id v18;
  id v19;

  v19 = a3;
  v18 = a4;
  v7 = a5;
  v8 = (xmlTextReader *)objc_msgSend(v19, "xmlReader");
  if (!v8)
    +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
  if (xmlTextReaderRead(v8) != 1)
  {
    xmlFreeTextReader(v8);
    +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
  }
  if (xmlTextReaderNodeType(v8) != 1
    || (v9 = xmlTextReaderConstLocalName(v8), !xmlStrEqual(v9, (const xmlChar *)"document")))
  {
    xmlFreeTextReader(v8);
    +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
  }
  v17 = 0;
  v10 = xmlTextReaderDepth(v8) + 1;
  while (xmlTextReaderRead(v8) == 1)
  {
    v11 = xmlTextReaderNodeType(v8);
    if (xmlTextReaderDepth(v8) == v10 && v11 == 1)
    {
      v12 = xmlTextReaderConstLocalName(v8);
      if (xmlStrEqual(v12, (const xmlChar *)"body"))
      {
        v17 = 1;
        +[WXText readFromStream:state:](WXText, "readFromStream:state:", v8, v7);
      }
      else if (xmlStrEqual(v12, (const xmlChar *)"background"))
      {
        v13 = xmlTextReaderExpand(v8);
        if (!v13)
          +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);
        objc_msgSend(v7, "drawingState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", v13, v19, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc_init(OADBackgroundProperties);
        -[OADBackgroundProperties setFill:](v16, "setFill:", v15);
        objc_msgSend(v18, "setDocumentBackground:", v16);

      }
    }
  }
  xmlFreeTextReader(v8);
  if ((v17 & 1) == 0)
    +[TCMessageException raise:](TCMessageException, "raise:", WXBadFormat);

}

@end
