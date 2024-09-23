@implementation WBDocument

+ (id)readFrom:(id)a3
{
  id v3;
  WDDocument *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  char v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  WrdBookmarkTable *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  WDDocument *v46;
  id v48;
  _QWORD *v49;
  id v50;
  WDDocument *v52;
  void (**v53)(WrdTextRun *__hidden);
  int v54;
  int v55;
  int v56;
  id v57;
  id v58;
  unsigned int v59;

  v3 = a3;
  v4 = objc_alloc_init(WDDocument);
  if (v4)
  {
    v52 = v4;
    objc_msgSend(v3, "setTargetDocument:", v4);
    -[OCDDocument setReader:](v4, "setReader:", v3);
    -[WDDocument fontTable](v4, "fontTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBFontTable readFrom:fontTable:](WBFontTable, "readFrom:fontTable:", v3, v5);

    +[WBDocument readProperties:document:](WBDocument, "readProperties:document:", v3, v52);
    v49 = (_QWORD *)operator new();
    *v49 = 0x409FFFFFFFFLL;
    v6 = objc_msgSend(v3, "wrdReader");
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 144))(v6, v49);
    +[TCProgressContext setProgress:](TCProgressContext, "setProgress:", 0.05);
    objc_msgSend(v3, "fileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDocument setOleFilename:](v52, "setOleFilename:", v7);

    -[OCDDocument summary](v52, "summary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "wrdReader");
    if (v9)
      v10 = v9 + 8;
    else
      v10 = 0;
    +[OCBSummary readSummary:reader:](OCBSummary, "readSummary:reader:", v8, v10);

    -[WDDocument styleSheet](v52, "styleSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBStyleSheet readFrom:styleSheet:](WBStyleSheet, "readFrom:styleSheet:", v3, v11);

    v59 = 0;
    v58 = 0;
    +[WBEscher readRootContainer:type:reader:](WBEscher, "readRootContainer:type:reader:", &v58, &v59, v3);
    v50 = v58;
    if (v50)
    {
      objc_msgSend(v3, "officeArtState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABDrawingGroup readBlipsFromDrawingGroup:toDocument:state:](OABDrawingGroup, "readBlipsFromDrawingGroup:toDocument:state:", v50, v52, v12);
      -[OCDDocument theme](v52, "theme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v3;
      +[OABDrawingGroup readGraphicalDefaultsFromDrawingGroup:toTheme:state:](OABDrawingGroup, "readGraphicalDefaultsFromDrawingGroup:toTheme:state:", v50, v13, v12);

      v15 = 1;
      do
      {
        v16 = v15;
        v59 = 0;
        v57 = 0;
        +[WBEscher readRootContainer:type:reader:](WBEscher, "readRootContainer:type:reader:", &v57, &v59, v14);
        v17 = v57;
        if (v17)
        {
          objc_msgSend(v12, "setCurrentTextType:", 2 * (v59 != 2));
          +[OABDrawing readDrawablesFromDrawing:state:](OABDrawing, "readDrawablesFromDrawing:state:", v17, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v59;
          if (v59 == 2)
          {
            +[OABDrawing readBackgroundPropertiesFromDrawing:state:](OABDrawing, "readBackgroundPropertiesFromDrawing:state:", v17, v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDDocument setDocumentBackground:](v52, "setDocumentBackground:", v20);

            v19 = v59;
          }
          +[WBDocument setupZIndices:document:escherType:](WBDocument, "setupZIndices:document:escherType:", v18, v52, v19);
          objc_msgSend(v12, "setCurrentTextType:", 0xFFFFFFFFLL);

        }
        v15 = 0;
      }
      while ((v16 & 1) != 0);

      v3 = v14;
    }
    v21 = (WrdBookmarkTable *)objc_msgSend(v3, "bookmarkTable");
    v22 = *((_DWORD *)v21 + 4);
    if ((unsigned __int16)((*((_DWORD *)v21 + 6) - v22) >> 3))
    {
      v23 = (unsigned __int16)((*((_DWORD *)v21 + 6) - v22) >> 3) + 1;
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", WrdBookmarkTable::getBookmark(v21, v23 - 2) + 8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isEqualToString:", CFSTR("_PictureBullets")))
          break;

        if (--v23 <= 1)
          goto LABEL_17;
      }
      v25 = *(_DWORD *)(WrdBookmarkTable::getBookmark(v21, v23 - 2) + 44);
      v26 = *(_DWORD *)(WrdBookmarkTable::getBookmark(v21, v23 - 2) + 48);

    }
    else
    {
LABEL_17:
      v25 = -1;
      v26 = -1;
    }
    -[WDDocument imageBullets](v52, "imageBullets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v25 & 0x80000000) == 0 && (v26 & 0x80000000) == 0)
    {
      v48 = v3;
      v53 = &off_24F3B1BC0;
      v54 = 0;
      v55 = v25;
      v56 = v26 - v25;
      -[WDDocument addImageBulletText](v52, "addImageBulletText");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v48, v28, &v53);
      v29 = objc_msgSend(v28, "blockCount");
      if (v29)
      {
        for (i = 0; i != v29; ++i)
        {
          objc_msgSend(v28, "blockAt:", i);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v31, "blockType"))
          {
            v32 = v31;
            v33 = objc_msgSend(v32, "runCount");
            if (v33)
            {
              for (j = 0; j != v33; ++j)
              {
                objc_msgSend(v32, "runAt:", j);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v27, "addObject:", v35);

              }
            }

          }
        }
      }

      v3 = v48;
    }
    +[TCProgressContext setProgress:](TCProgressContext, "setProgress:", 0.08);
    -[WDDocument listDefinitionTable](v52, "listDefinitionTable");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBListDefinitionTable readFrom:listDefinitionTable:](WBListDefinitionTable, "readFrom:listDefinitionTable:", v3, v36);

    -[WDDocument listTable](v52, "listTable");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBListTable readFrom:listTable:](WBListTable, "readFrom:listTable:", v3, v37);

    -[WDDocument revisionAuthorTable](v52, "revisionAuthorTable");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBRevisionAuthorTable readFrom:revisionAuthorTable:](WBRevisionAuthorTable, "readFrom:revisionAuthorTable:", v3, v38);

    +[TCProgressContext setProgress:](TCProgressContext, "setProgress:", 0.12);
    +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", 1.0, 0.87);
    objc_msgSend(a1, "readSectionsFrom:document:", v3, v52);
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    objc_msgSend(a1, "readTextBoxesFrom:", v3);
    -[WDDocument footnoteSeparator](v52, "footnoteSeparator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readNoteSeparatorFrom:type:separator:", v3, 0, v39);

    -[WDDocument footnoteContinuationSeparator](v52, "footnoteContinuationSeparator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readNoteSeparatorFrom:type:separator:", v3, 1, v40);

    -[WDDocument footnoteContinuationNotice](v52, "footnoteContinuationNotice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readNoteSeparatorFrom:type:separator:", v3, 2, v41);

    -[WDDocument endnoteSeparator](v52, "endnoteSeparator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readNoteSeparatorFrom:type:separator:", v3, 3, v42);

    -[WDDocument endnoteContinuationSeparator](v52, "endnoteContinuationSeparator");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readNoteSeparatorFrom:type:separator:", v3, 4, v43);

    -[WDDocument endnoteContinuationNotice](v52, "endnoteContinuationNotice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readNoteSeparatorFrom:type:separator:", v3, 5, v44);

    -[OCDDocument theme](v52, "theme");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "validateTheme");

    +[TCProgressContext setProgress:](TCProgressContext, "setProgress:", 1.0);
    MEMORY[0x22E2DD408](v49, 0x1000C4000313F17);
    v4 = v52;
    v46 = v52;
  }

  return v4;
}

+ (void)readProperties:(id)a3 document:(id)a4
{
  id v5;
  id v6;
  WrdObject *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  xmlNodePtr v19;
  xmlNodePtr v20;
  OADColorMap *v21;
  void (**v22)(WrdDOPTypography *__hidden);
  int v23;
  CsString v24;
  CsString v25;
  unsigned __int8 v26;

  v5 = a3;
  v6 = a4;
  v7 = +[WBObjectFactory create:](WBObjectFactory, "create:", 15);
  if (v7)
  else
    v8 = 0;
  v9 = objc_msgSend(v5, "wrdReader");
  (*(void (**)(uint64_t, char *))(*(_QWORD *)v9 + 240))(v9, v8);
  objc_msgSend(v6, "setTrackChanges:", (*(_QWORD *)(v8 + 148) >> 8) & 1);
  objc_msgSend(v6, "setShowRevisionMarksOnScreen:", (*(_QWORD *)(v8 + 148) >> 19) & 1);
  objc_msgSend(v6, "setShowInsertionsAndDeletions:", (*(_QWORD *)(v8 + 156) >> 39) & 1);
  objc_msgSend(v6, "setShowFormatting:", (*(_QWORD *)(v8 + 156) >> 40) & 1);
  objc_msgSend(v6, "setShowMarkup:", (*(_QWORD *)(v8 + 156) >> 37) & 1);
  objc_msgSend(v6, "setShowComments:", (*(_QWORD *)(v8 + 156) >> 38) & 1);
  objc_msgSend(v6, "setMirrorMargins:", (*(_QWORD *)(v8 + 148) >> 14) & 1);
  objc_msgSend(v6, "setBorderSurroundHeader:", (*(_QWORD *)(v8 + 156) >> 23) & 1);
  objc_msgSend(v6, "setBorderSurroundFooter:", (*(_QWORD *)(v8 + 156) >> 24) & 1);
  objc_msgSend(v6, "setDefaultTabWidth:", *((unsigned __int16 *)v8 + 70));
  objc_msgSend(v6, "setAutoHyphenate:", (*(_QWORD *)(v8 + 148) >> 5) & 1);
  objc_msgSend(v6, "setEvenAndOddHeaders:", *((_DWORD *)v8 + 37) & 1);
  objc_msgSend(v6, "setFootnotePosition:", *((unsigned int *)v8 + 16));
  objc_msgSend(v6, "setEndnotePosition:", *((unsigned int *)v8 + 19));
  objc_msgSend(v6, "setFootnoteNumberFormat:", *((unsigned int *)v8 + 20));
  objc_msgSend(v6, "setEndnoteNumberFormat:", *((unsigned int *)v8 + 21));
  objc_msgSend(v6, "setFootnoteRestart:", *((unsigned int *)v8 + 17));
  objc_msgSend(v6, "setEndnoteRestart:", *((unsigned int *)v8 + 18));
  objc_msgSend(v6, "setFootnoteNumberingStart:", *((unsigned __int16 *)v8 + 73));
  objc_msgSend(v6, "setGutterPosition:", *((unsigned int *)v8 + 25));
  objc_msgSend(v6, "setBookFold:", (*(_QWORD *)(v8 + 156) >> 52) & 1);
  objc_msgSend(v6, "setNoTabForHangingIndents:", (*(_QWORD *)(v8 + 148) >> 41) & 1);
  objc_msgSend(v6, "setZoomPercentage:", *((__int16 *)v8 + 66));
  objc_msgSend(v6, "setShowOutline:", *((_DWORD *)v8 + 22) == 2);
  WrdDOPTypography::WrdDOPTypography((WrdDOPTypography *)&v22, *((const WrdDOPTypography **)v8 + 2));
  objc_msgSend(v6, "setKinsokuStrict:", (v26 >> 3) & 1);
  if (v23 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v25.var1, v25.var2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKinsokuAltBreakAfter:", v10);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v24.var1, v24.var2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKinsokuAltBreakBefore:", v11);

  }
  objc_msgSend(v5, "officeArtState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "useXmlBlobs");

  if (v13)
  {
    v14 = *((_QWORD *)v8 + 29);
    v15 = *((unsigned int *)v8 + 60);
    objc_msgSend(v6, "theme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "officeArtState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "xmlDrawingState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTheme readFromThemeData:themeDataSize:toTheme:xmlDrawingState:](OAXTheme, "readFromThemeData:themeDataSize:toTheme:xmlDrawingState:", v14, v15, v16, v18);

    v19 = CXGetRootElement(*((const unsigned __int8 **)v8 + 31), *((_DWORD *)v8 + 64));
    v20 = v19;
    if (v19)
    {
      if (xmlStrEqual(v19->name, (const xmlChar *)"clrMap"))
      {
        v21 = objc_alloc_init(OADColorMap);
        +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v20, v21);
        objc_msgSend(v6, "setColorMap:", v21);

      }
      xmlFreeDoc(v20->doc);
    }
  }
  (*(void (**)(char *))(*(_QWORD *)v8 + 8))(v8);
  v22 = &off_24F3B1C00;
  CsString::~CsString(&v25);
  CsString::~CsString(&v24);

}

+ (void)readSectionsFrom:(id)a3 document:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  WrdObject *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  uint64_t *i;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  v7 = 0;
  v8 = 0;
  v27 = &v27;
  v28 = (uint64_t *)&v27;
  while (1)
  {
    v29 = v7;
    v9 = +[WBObjectFactory create:](WBObjectFactory, "create:", 48);
    v10 = v9
    v10[2] = 0;
    v10[3] = v8;
    v11 = objc_msgSend(v5, "wrdReader");
    (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v11 + 200))(v11, v10);
    v12 = v10[4];
    if (!(_DWORD)v12)
      break;
    v13 = v12 + v8;
    if (HIDWORD(v13))
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    else
      v8 = v13;
    v14 = operator new(0x18uLL);
    v14[1] = &v27;
    v14[2] = v10;
    v15 = v27;
    *v14 = v27;
    v15[1] = v14;
    v27 = v14;
    v7 = v29 + 1;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 8))(v10);
  +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", (double)v8, 1.0);
  v16 = v28;
  if (v28 != (uint64_t *)&v27)
  {
    v17 = 0;
    v18 = 0;
    while ((v17 & 1) != 0)
    {
      v21 = v16[2];
      if (v21)
        goto LABEL_17;
LABEL_18:
      v22 = *v16;
      v23 = (uint64_t *)v16[1];
      *(_QWORD *)(v22 + 8) = v23;
      *(_QWORD *)v16[1] = v22;
      --v29;
      operator delete(v16);
      v18 = (v18 + 1);
      v16 = v23;
      if (v23 == (uint64_t *)&v27)
        goto LABEL_23;
    }
    objc_msgSend(v5, "cancelDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isCancelled");

    v21 = v16[2];
    if ((v20 & 1) != 0)
    {
      v17 = 1;
      if (!v21)
        goto LABEL_18;
    }
    else
    {
      objc_msgSend(v6, "addSection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSection readFrom:textRun:document:index:section:](WBSection, "readFrom:textRun:document:index:section:", v5, v21, v6, v18, v24);

      if (!v21)
        goto LABEL_18;
    }
LABEL_17:
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    goto LABEL_18;
  }
  v17 = 0;
LABEL_23:
  for (i = v28; i != (uint64_t *)&v27; i = (uint64_t *)i[1])
  {
    v26 = i[2];
    if (v26)
      (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
  }
  if ((v17 & 1) != 0)
    +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  std::__list_imp<WrdSectionTextRun *>::clear(&v27);

}

+ (void)readTextBoxesFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned __int16 v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "textBoxCount");
  if (v3)
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(v7, "textBoxInfoAtIndex:", v4);
      +[WBTextBox readTextFrom:to:chain:](WBTextBox, "readTextFrom:to:chain:", v7, v5, v6);

      ++v4;
    }
    while (v3 != v4);
  }

}

+ (void)readNoteSeparatorFrom:(id)a3 type:(int)a4 separator:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[3];

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "tableHeaders");
  if (((*(_DWORD *)(v9 + 16) - *(_DWORD *)(v9 + 8)) & 0x3FFFC) != 0)
  {
    v10[0] = &off_24F3B1BC0;
    WrdCPTableHeaders::getTextRun(v9, v10, a4, 0);
    +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v7, v8, v10);
    objc_msgSend(v8, "removeLastCharacter:", 13);
  }

}

+ (void)setupZIndices:(id)a3 document:(id)a4 escherType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(v10, "count");
  if (v5)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v9, "setZIndex:", v6 + objc_msgSend(v9, "zIndex"));

      ++v6;
    }
    while (v5 != v6);
  }

}

- (WBDocument)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBDocument;
  return -[WBDocument init](&v3, sel_init);
}

- (id)applicationName
{
  return CFSTR("Word");
}

+ (void)setTimeStamp:(WrdDocumentProperties *)a3
{
  void *v4;
  void *v5;
  WrdDateTime *var6;
  WrdDateTime *var5;
  __int16 v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 638, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  var5 = a3->var5;
  var6 = a3->var6;
  v8 = objc_msgSend(v9, "era");
  var5->var6 = v8 - 1900;
  var6->var6 = v8 - 1900;
  var5->var5 = objc_msgSend(v9, "month");
  var6->var5 = objc_msgSend(v9, "month");
  var5->var1 = objc_msgSend(v9, "weekday") - 1;
  var6->var1 = objc_msgSend(v9, "weekday") - 1;
  var5->var4 = objc_msgSend(v9, "day");
  var6->var4 = objc_msgSend(v9, "day");
  var5->var3 = objc_msgSend(v9, "hour");
  var6->var3 = objc_msgSend(v9, "hour");
  var5->var2 = objc_msgSend(v9, "minute");
  var6->var2 = objc_msgSend(v9, "minute");

}

@end
