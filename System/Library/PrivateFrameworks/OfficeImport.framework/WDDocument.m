@implementation WDDocument

- (WDDocument)init
{
  WDDocument *v2;
  WDDocument *v3;
  WDFontTable *v4;
  WDFontTable *mFontTable;
  WDStyleSheet *v6;
  WDStyleSheet *mStyleSheet;
  WDListDefinitionTable *v8;
  WDListDefinitionTable *mListDefinitionTable;
  WDListTable *v10;
  WDListTable *mListTable;
  WDRevisionAuthorTable *v12;
  WDRevisionAuthorTable *mRevisionAuthorTable;
  NSMutableArray *v14;
  NSMutableArray *mSections;
  NSMutableArray *v16;
  NSMutableArray *mChangeTrackingEditDates;
  NSMutableArray *v18;
  NSMutableArray *mChangeTrackingEditAuthors;
  WDCitationTable *v20;
  WDCitationTable *mCitationTable;
  NSMutableSet *v22;
  NSMutableSet *mObjPointers;
  WDText *v24;
  WDText *mFootnoteSeparator;
  WDText *v26;
  WDText *mFootnoteContinuationSeparator;
  WDText *v28;
  WDText *mFootnoteContinuationNotice;
  WDText *v30;
  WDText *mEndnoteSeparator;
  WDText *v32;
  WDText *mEndnoteContinuationSeparator;
  WDText *v34;
  WDText *mEndnoteContinuationNotice;
  NSMutableArray *v36;
  NSMutableArray *mDocumentImages;
  NSMutableArray *v38;
  NSMutableArray *mImageBullets;
  OADBackgroundProperties *v40;
  OADBackground *mDocumentBackground;
  OADBackground *v42;
  void *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)WDDocument;
  v2 = -[OCDDocument init](&v45, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mZoomPercentage = 100;
    v4 = objc_alloc_init(WDFontTable);
    mFontTable = v3->mFontTable;
    v3->mFontTable = v4;

    v6 = -[WDStyleSheet initWithDocument:]([WDStyleSheet alloc], "initWithDocument:", v3);
    mStyleSheet = v3->mStyleSheet;
    v3->mStyleSheet = v6;

    v8 = -[WDListDefinitionTable initWithDocument:]([WDListDefinitionTable alloc], "initWithDocument:", v3);
    mListDefinitionTable = v3->mListDefinitionTable;
    v3->mListDefinitionTable = v8;

    v10 = -[WDListTable initWithDocument:]([WDListTable alloc], "initWithDocument:", v3);
    mListTable = v3->mListTable;
    v3->mListTable = v10;

    v12 = -[WDRevisionAuthorTable initWithDocument:]([WDRevisionAuthorTable alloc], "initWithDocument:", v3);
    mRevisionAuthorTable = v3->mRevisionAuthorTable;
    v3->mRevisionAuthorTable = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mSections = v3->mSections;
    v3->mSections = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChangeTrackingEditDates = v3->mChangeTrackingEditDates;
    v3->mChangeTrackingEditDates = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChangeTrackingEditAuthors = v3->mChangeTrackingEditAuthors;
    v3->mChangeTrackingEditAuthors = v18;

    v20 = -[WDCitationTable initWithDocument:]([WDCitationTable alloc], "initWithDocument:", v3);
    mCitationTable = v3->mCitationTable;
    v3->mCitationTable = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mObjPointers = v3->mObjPointers;
    v3->mObjPointers = v22;

    v24 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v3, 2);
    mFootnoteSeparator = v3->mFootnoteSeparator;
    v3->mFootnoteSeparator = v24;

    v26 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v3, 2);
    mFootnoteContinuationSeparator = v3->mFootnoteContinuationSeparator;
    v3->mFootnoteContinuationSeparator = v26;

    v28 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v3, 2);
    mFootnoteContinuationNotice = v3->mFootnoteContinuationNotice;
    v3->mFootnoteContinuationNotice = v28;

    v30 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v3, 2);
    mEndnoteSeparator = v3->mEndnoteSeparator;
    v3->mEndnoteSeparator = v30;

    v32 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v3, 2);
    mEndnoteContinuationSeparator = v3->mEndnoteContinuationSeparator;
    v3->mEndnoteContinuationSeparator = v32;

    v34 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v3, 2);
    mEndnoteContinuationNotice = v3->mEndnoteContinuationNotice;
    v3->mEndnoteContinuationNotice = v34;

    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mDocumentImages = v3->mDocumentImages;
    v3->mDocumentImages = v36;

    v38 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mImageBullets = v3->mImageBullets;
    v3->mImageBullets = v38;

    v3->mFootnoteNumberingStart = 1;
    v3->mFootnotePosition = 1;
    v3->mFootnoteNumberFormat = 0;
    v3->mEndnotePosition = 3;
    v3->mEndnoteNumberFormat = 2;
    v40 = objc_alloc_init(OADBackgroundProperties);
    mDocumentBackground = v3->mDocumentBackground;
    v3->mDocumentBackground = &v40->super;

    v42 = v3->mDocumentBackground;
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADBackground setFill:](v42, "setFill:", v43);

  }
  return v3;
}

- (id)fontTable
{
  return self->mFontTable;
}

- (void)setTrackChanges:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xFD | v3;
}

- (void)setShowRevisionMarksOnScreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xFB | v3;
}

- (void)setShowInsertionsAndDeletions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xF7 | v3;
}

- (void)setShowFormatting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xEF | v3;
}

- (void)setShowMarkup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = v3 & 0x80 | *((_BYTE *)self + 296) & 0x7F;
}

- (void)setShowComments:(BOOL)a3
{
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xFE | a3;
}

- (void)setMirrorMargins:(BOOL)a3
{
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xFE | a3;
}

- (void)setBorderSurroundHeader:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xFD | v3;
}

- (void)setBorderSurroundFooter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xFB | v3;
}

- (void)setDefaultTabWidth:(unsigned __int16)a3
{
  self->mDefaultTabWidth = a3;
}

- (void)setAutoHyphenate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xEF | v3;
}

- (void)setEvenAndOddHeaders:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xDF | v3;
}

- (void)setFootnotePosition:(int)a3
{
  self->mFootnotePosition = a3;
}

- (void)setEndnotePosition:(int)a3
{
  self->mEndnotePosition = a3;
}

- (void)setFootnoteNumberFormat:(int)a3
{
  self->mFootnoteNumberFormat = a3;
}

- (void)setEndnoteNumberFormat:(int)a3
{
  self->mEndnoteNumberFormat = a3;
}

- (void)setFootnoteRestart:(int)a3
{
  self->mFootnoteRestart = a3;
}

- (void)setEndnoteRestart:(int)a3
{
  self->mEndnoteRestart = a3;
}

- (void)setFootnoteNumberingStart:(unsigned __int16)a3
{
  self->mFootnoteNumberingStart = a3;
}

- (void)setGutterPosition:(int)a3
{
  self->mGutterPosition = a3;
}

- (void)setBookFold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xBF | v3;
}

- (void)setZoomPercentage:(signed __int16)a3
{
  self->mZoomPercentage = a3;
}

- (void)setShowOutline:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xDF | v3;
}

- (void)setKinsokuStrict:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 296) = *((_BYTE *)self + 296) & 0xF7 | v3;
}

- (void)setOleFilename:(id)a3
{
  objc_storeStrong((id *)&self->mOleFilename, a3);
}

- (id)styleSheet
{
  return self->mStyleSheet;
}

- (id)imageBullets
{
  return self->mImageBullets;
}

- (id)listDefinitionTable
{
  return self->mListDefinitionTable;
}

- (id)listTable
{
  return self->mListTable;
}

- (id)revisionAuthorTable
{
  return self->mRevisionAuthorTable;
}

- (id)addSection
{
  WDSection *v3;

  v3 = -[WDSection initWithDocument:]([WDSection alloc], "initWithDocument:", self);
  -[NSMutableArray addObject:](self->mSections, "addObject:", v3);
  return v3;
}

- (id)footnoteSeparator
{
  return self->mFootnoteSeparator;
}

- (id)footnoteContinuationSeparator
{
  return self->mFootnoteContinuationSeparator;
}

- (id)footnoteContinuationNotice
{
  return self->mFootnoteContinuationNotice;
}

- (id)endnoteSeparator
{
  return self->mEndnoteSeparator;
}

- (id)endnoteContinuationSeparator
{
  return self->mEndnoteContinuationSeparator;
}

- (id)endnoteContinuationNotice
{
  return self->mEndnoteContinuationNotice;
}

- (unint64_t)sectionCount
{
  return -[NSMutableArray count](self->mSections, "count");
}

- (id)sections
{
  return self->mSections;
}

- (id)sectionAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mSections, "objectAtIndex:", a3);
}

- (unsigned)defaultTabWidth
{
  return self->mDefaultTabWidth;
}

- (void)addObjPointer:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableSet addObject:](self->mObjPointers, "addObject:", v4);

}

- (void)setDocumentBackground:(id)a3
{
  objc_storeStrong((id *)&self->mDocumentBackground, a3);
}

- (id)addImageBulletText
{
  WDText *mImageBulletText;
  WDText *v4;
  WDText *v5;

  mImageBulletText = self->mImageBulletText;
  if (!mImageBulletText)
  {
    v4 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", self, 0);
    v5 = self->mImageBulletText;
    self->mImageBulletText = v4;

    mImageBulletText = self->mImageBulletText;
  }
  return mImageBulletText;
}

- (id)imageBulletWithCharacterOffset:(int)a3
{
  void *v5;

  if ((int)-[NSMutableArray count](self->mImageBullets, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mImageBullets, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)lastSection
{
  return (id)-[NSMutableArray lastObject](self->mSections, "lastObject");
}

- (id)oleFilename
{
  return self->mOleFilename;
}

- (void)addChangeTrackingEditAtDate:(id)a3 authorIndex:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  -[NSMutableArray addObject:](self->mChangeTrackingEditDates, "addObject:", a3);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v4);
  -[NSMutableArray addObject:](self->mChangeTrackingEditAuthors, "addObject:");

}

- (void)setKinsokuAltBreakAfter:(id)a3
{
  objc_storeStrong((id *)&self->mKinsokuAltBreakAfter, a3);
}

- (void)setKinsokuAltBreakBefore:(id)a3
{
  objc_storeStrong((id *)&self->mKinsokuAltBreakBefore, a3);
}

- (id)imageBulletParagraph
{
  WDText *mImageBulletText;
  WDText *v4;
  WDText *v5;
  void *v6;
  id v7;

  mImageBulletText = self->mImageBulletText;
  if (!mImageBulletText)
  {
    v4 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", self, 0);
    v5 = self->mImageBulletText;
    self->mImageBulletText = v4;

    mImageBulletText = self->mImageBulletText;
  }
  if (!-[WDText blockCount](mImageBulletText, "blockCount"))
  {
    -[WDText addParagraph](self->mImageBulletText, "addParagraph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addBookmark:type:", CFSTR("_PictureBullets"), 0);

  }
  return -[WDText blockAt:](self->mImageBulletText, "blockAt:", 0);
}

- (void)removeObjPointer:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableSet removeObject:](self->mObjPointers, "removeObject:", v4);

}

- (BOOL)mirrorMargins
{
  return *((_BYTE *)self + 296) & 1;
}

- (BOOL)borderSurroundHeader
{
  return (*((unsigned __int8 *)self + 296) >> 1) & 1;
}

- (BOOL)borderSurroundFooter
{
  return (*((unsigned __int8 *)self + 296) >> 2) & 1;
}

- (id)kinsokuAltBreakBefore
{
  return self->mKinsokuAltBreakBefore;
}

- (id)kinsokuAltBreakAfter
{
  return self->mKinsokuAltBreakAfter;
}

- (BOOL)kinsokuStrict
{
  return (*((unsigned __int8 *)self + 296) >> 3) & 1;
}

- (BOOL)autoHyphenate
{
  return (*((unsigned __int8 *)self + 296) >> 4) & 1;
}

- (BOOL)evenAndOddHeaders
{
  return (*((unsigned __int8 *)self + 296) >> 5) & 1;
}

- (int)footnoteNumberFormat
{
  return self->mFootnoteNumberFormat;
}

- (int)endnoteNumberFormat
{
  return self->mEndnoteNumberFormat;
}

- (int)footnotePosition
{
  return self->mFootnotePosition;
}

- (int)endnotePosition
{
  return self->mEndnotePosition;
}

- (int)footnoteRestart
{
  return self->mFootnoteRestart;
}

- (int)endnoteRestart
{
  return self->mEndnoteRestart;
}

- (unsigned)footnoteNumberingStart
{
  return self->mFootnoteNumberingStart;
}

- (unint64_t)citationCount
{
  return -[WDCitationTable count](self->mCitationTable, "count");
}

- (id)citationFor:(id)a3
{
  -[WDCitationTable citationFor:](self->mCitationTable, "citationFor:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addCitation:(id)a3 forID:(id)a4
{
  -[WDCitationTable addCitation:forID:](self->mCitationTable, "addCitation:forID:", a3, a4);
}

- (id)citationTable
{
  return self->mCitationTable;
}

- (id)listDefinitionWithListDefinitionId:(int)a3
{
  return -[WDListDefinitionTable resolvedDefinitionWithDefinitionId:](self->mListDefinitionTable, "resolvedDefinitionWithDefinitionId:", *(_QWORD *)&a3);
}

- (id)listDefinitionWithListId:(int)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[WDDocument listWithListId:](self, "listWithListId:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    -[WDDocument listDefinitionWithListDefinitionId:](self, "listDefinitionWithListDefinitionId:", objc_msgSend(v4, "listDefinitionId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)listWithListId:(int)a3
{
  return -[WDListTable listWithListId:](self->mListTable, "listWithListId:", *(_QWORD *)&a3);
}

- (id)listLevelWithListId:(int)a3 levelIndex:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[WDDocument listWithListId:](self, "listWithListId:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "levelOverrideForLevel:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isListLevelOverridden"))
  {
    objc_msgSend(v8, "listLevel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WDDocument listDefinitionWithListId:](self, "listDefinitionWithListId:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "levelAt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (int)gutterPosition
{
  return self->mGutterPosition;
}

- (BOOL)bookFold
{
  return (*((unsigned __int8 *)self + 296) >> 6) & 1;
}

- (signed)zoomPercentage
{
  return self->mZoomPercentage;
}

- (id)applicationName
{
  return CFSTR("Word");
}

- (void)addImageBullets
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (self->mImageBulletText)
  {
    -[WDDocument imageBulletParagraph](self, "imageBulletParagraph");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v13, "addBookmark:type:", CFSTR("_PictureBullets"), 1);
    -[NSMutableArray lastObject](self->mSections, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "blockCount");
    if (v6)
    {
      objc_msgSend(v5, "blockAt:", v6 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && !objc_msgSend(v7, "blockType"))
      {
        v9 = v8;
        v10 = objc_msgSend(v13, "runCount");
        if (v10)
        {
          v11 = 0;
          do
          {
            objc_msgSend(v13, "runAt:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addRun:", v12);

            ++v11;
          }
          while (v10 != v11);
        }

        goto LABEL_12;
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    objc_msgSend(v5, "addBlock:", v13);
LABEL_12:

  }
}

- (id)version
{
  return self->mVersion;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->mVersion, a3);
}

- (id)language
{
  return self->mLanguage;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->mLanguage, a3);
}

- (unint64_t)revisionAuthorCount
{
  return -[WDRevisionAuthorTable authorCount](self->mRevisionAuthorTable, "authorCount");
}

- (id)revisionAuthorAt:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (a3 == -1)
  {
    TCBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_24F3BFFF8, CFSTR("TCCompatibility"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WDRevisionAuthorTable authorAt:](self->mRevisionAuthorTable, "authorAt:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)revisionAuthorAddLookup:(id)a3
{
  return -[WDRevisionAuthorTable authorAddLookup:](self->mRevisionAuthorTable, "authorAddLookup:", a3);
}

- (void)addRevisionAuthor:(id)a3
{
  -[WDRevisionAuthorTable addAuthor:](self->mRevisionAuthorTable, "addAuthor:", a3);
}

- (BOOL)showMarkup
{
  return *((unsigned __int8 *)self + 296) >> 7;
}

- (BOOL)showComments
{
  return *((_BYTE *)self + 297) & 1;
}

- (BOOL)trackChanges
{
  return (*((unsigned __int8 *)self + 297) >> 1) & 1;
}

- (BOOL)showRevisionMarksOnScreen
{
  return (*((unsigned __int8 *)self + 297) >> 2) & 1;
}

- (BOOL)showInsertionsAndDeletions
{
  return (*((unsigned __int8 *)self + 297) >> 3) & 1;
}

- (BOOL)showFormatting
{
  return (*((unsigned __int8 *)self + 297) >> 4) & 1;
}

- (BOOL)showOutline
{
  return (*((unsigned __int8 *)self + 297) >> 5) & 1;
}

- (BOOL)noTabForHangingIndents
{
  return (*((unsigned __int8 *)self + 297) >> 6) & 1;
}

- (void)setNoTabForHangingIndents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 297) = *((_BYTE *)self + 297) & 0xBF | v3;
}

- (id)changeTrackingEditDates
{
  return self->mChangeTrackingEditDates;
}

- (id)changeTrackingEditAuthors
{
  return self->mChangeTrackingEditAuthors;
}

- (id)creationDate
{
  return self->mCreationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->mCreationDate, a3);
}

- (id)lastModDate
{
  return self->mModificationDate;
}

- (void)setLastModDate:(id)a3
{
  objc_storeStrong((id *)&self->mModificationDate, a3);
}

- (id)imageBulletText
{
  return self->mImageBulletText;
}

- (id)documentBackground
{
  return self->mDocumentBackground;
}

- (void)removeEmptySections
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[NSMutableArray count](self->mSections, "count");
  if (v3)
  {
    v4 = v3 - 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->mSections, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "blockCount");

      if (!v7)
        -[NSMutableArray removeObjectAtIndex:](self->mSections, "removeObjectAtIndex:", v4);

      --v4;
    }
    while (v4 != -1);
  }
}

- (id)sectionIterator
{
  return -[WDDocument newSectionIterator](self, "newSectionIterator");
}

- (id)newSectionIterator
{
  return -[WDArrayIterator initWithArray:]([WDArrayIterator alloc], "initWithArray:", self->mSections);
}

- (id)mainBlocksIterator
{
  return -[WDDocument newMainBlocksIterator](self, "newMainBlocksIterator");
}

- (id)newMainBlocksIterator
{
  id v2;
  WDSectionBlockIterator *v3;

  v2 = -[WDDocument newSectionIterator](self, "newSectionIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDSectionBlockIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (id)mainRunsIterator
{
  return -[WDDocument newMainRunsIterator](self, "newMainRunsIterator");
}

- (id)newMainRunsIterator
{
  id v2;
  WDBlockRunIterator *v3;

  v2 = -[WDDocument newMainBlocksIterator](self, "newMainBlocksIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDBlockRunIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (id)footnoteIterator
{
  return -[WDDocument newFootnoteIterator](self, "newFootnoteIterator");
}

- (id)newFootnoteIterator
{
  id v2;
  WDFootnoteIterator *v3;

  v2 = -[WDDocument newMainRunsIterator](self, "newMainRunsIterator");
  v3 = -[WDTestIterator initWithIterator:]([WDFootnoteIterator alloc], "initWithIterator:", v2);

  return v3;
}

- (id)endnoteIterator
{
  return -[WDDocument newEndnoteIterator](self, "newEndnoteIterator");
}

- (id)newEndnoteIterator
{
  id v2;
  WDEndnoteIterator *v3;

  v2 = -[WDDocument newMainRunsIterator](self, "newMainRunsIterator");
  v3 = -[WDTestIterator initWithIterator:]([WDEndnoteIterator alloc], "initWithIterator:", v2);

  return v3;
}

- (id)annotationIterator
{
  return -[WDDocument newAnnotationIterator](self, "newAnnotationIterator");
}

- (id)newAnnotationIterator
{
  id v2;
  WDAnnotationIterator *v3;

  v2 = -[WDDocument newMainRunsIterator](self, "newMainRunsIterator");
  v3 = -[WDTestIterator initWithIterator:]([WDAnnotationIterator alloc], "initWithIterator:", v2);

  return v3;
}

- (id)footnoteBlockIterator
{
  return -[WDDocument newFootnoteBlockIterator](self, "newFootnoteBlockIterator");
}

- (id)newFootnoteBlockIterator
{
  id v2;
  WDNoteBlockIterator *v3;

  v2 = -[WDDocument newFootnoteIterator](self, "newFootnoteIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDNoteBlockIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (id)endnoteBlockIterator
{
  return -[WDDocument newEndnoteBlockIterator](self, "newEndnoteBlockIterator");
}

- (id)newEndnoteBlockIterator
{
  id v2;
  WDNoteBlockIterator *v3;

  v2 = -[WDDocument newEndnoteIterator](self, "newEndnoteIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDNoteBlockIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (id)annotationBlockIterator
{
  return -[WDDocument newAnnotationBlockIterator](self, "newAnnotationBlockIterator");
}

- (id)newAnnotationBlockIterator
{
  id v2;
  WDNoteBlockIterator *v3;

  v2 = -[WDDocument newAnnotationIterator](self, "newAnnotationIterator");
  v3 = -[WDCombinedIterator initWithParentIterator:]([WDNoteBlockIterator alloc], "initWithParentIterator:", v2);

  return v3;
}

- (BOOL)isFromBinary
{
  return self->mOleFilename != 0;
}

- (id)colorMap
{
  OADColorMap *mColorMap;
  OADColorMap *v4;
  OADColorMap *v5;

  mColorMap = self->mColorMap;
  if (!mColorMap)
  {
    v4 = objc_alloc_init(OADColorMap);
    v5 = self->mColorMap;
    self->mColorMap = v4;

    -[OADColorMap addDefaultMappings:](self->mColorMap, "addDefaultMappings:", 1);
    mColorMap = self->mColorMap;
  }
  return mColorMap;
}

- (void)setColorMap:(id)a3
{
  objc_storeStrong((id *)&self->mColorMap, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDDocument;
  -[WDDocument description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mObjPointers, 0);
  objc_storeStrong((id *)&self->mDocumentBackground, 0);
  objc_storeStrong((id *)&self->mImageBullets, 0);
  objc_storeStrong((id *)&self->mModificationDate, 0);
  objc_storeStrong((id *)&self->mCreationDate, 0);
  objc_storeStrong((id *)&self->mChangeTrackingEditAuthors, 0);
  objc_storeStrong((id *)&self->mChangeTrackingEditDates, 0);
  objc_storeStrong((id *)&self->mDocumentImages, 0);
  objc_storeStrong((id *)&self->mLanguage, 0);
  objc_storeStrong((id *)&self->mVersion, 0);
  objc_storeStrong((id *)&self->mKinsokuAltBreakAfter, 0);
  objc_storeStrong((id *)&self->mKinsokuAltBreakBefore, 0);
  objc_storeStrong((id *)&self->mOleFilename, 0);
  objc_storeStrong((id *)&self->mEndnoteContinuationNotice, 0);
  objc_storeStrong((id *)&self->mEndnoteContinuationSeparator, 0);
  objc_storeStrong((id *)&self->mEndnoteSeparator, 0);
  objc_storeStrong((id *)&self->mFootnoteContinuationNotice, 0);
  objc_storeStrong((id *)&self->mFootnoteContinuationSeparator, 0);
  objc_storeStrong((id *)&self->mFootnoteSeparator, 0);
  objc_storeStrong((id *)&self->mImageBulletText, 0);
  objc_storeStrong((id *)&self->mSections, 0);
  objc_storeStrong((id *)&self->mListTable, 0);
  objc_storeStrong((id *)&self->mCitationTable, 0);
  objc_storeStrong((id *)&self->mRevisionAuthorTable, 0);
  objc_storeStrong((id *)&self->mListDefinitionTable, 0);
  objc_storeStrong((id *)&self->mFontTable, 0);
  objc_storeStrong((id *)&self->mStyleSheet, 0);
}

@end
