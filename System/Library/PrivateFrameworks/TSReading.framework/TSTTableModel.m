@implementation TSTTableModel

+ (id)unnamedTableString
{
  if (+[TSTTableModel unnamedTableString]::onceToken != -1)
    dispatch_once(&+[TSTTableModel unnamedTableString]::onceToken, &__block_literal_global_80);
  return (id)+[TSTTableModel unnamedTableString]::sUnnamedTableString;
}

uint64_t __35__TSTTableModel_unnamedTableString__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("Table %@"), &stru_24D82FEB0, CFSTR("TSTables"));
  v1 = objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24D8FB700, 1);
  result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v0, v1);
  +[TSTTableModel unnamedTableString]::sUnnamedTableString = result;
  return result;
}

- (TSTTableModel)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableModel init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 200, CFSTR("don't call -[TSTTableModel init] please"));
  return 0;
}

- (void)p_releaseExistingDefaultStyles
{
  $958D8658F995D5F558D0698922444091 *p_mStyles;

  p_mStyles = &self->mStyles;

  p_mStyles->tableStyle = 0;
  p_mStyles->bodyCellStyle = 0;

  p_mStyles->headerRowCellStyle = 0;
  p_mStyles->headerColumnCellStyle = 0;

  p_mStyles->footerRowCellStyle = 0;
  p_mStyles->bodyTextStyle = 0;

  p_mStyles->headerRowTextStyle = 0;
  p_mStyles->headerColumnTextStyle = 0;

  p_mStyles->footerRowTextStyle = 0;
  p_mStyles->tableNameStyle = 0;

  p_mStyles->tableNameShapeStyle = 0;
}

- (void)resetStyles:(id)a3
{
  -[TSPObject willModify](self, "willModify");
  -[TSTTableModel p_releaseExistingDefaultStyles](self, "p_releaseExistingDefaultStyles");
  if (a3)
  {
    self->mStyles.tableStyle = (TSTTableStyle *)(id)objc_msgSend(a3, "tableStyle");
    self->mStyles.bodyCellStyle = (TSTCellStyle *)(id)objc_msgSend(a3, "bodyCellStyle");
    self->mStyles.headerRowCellStyle = (TSTCellStyle *)(id)objc_msgSend(a3, "headerRowCellStyle");
    self->mStyles.headerColumnCellStyle = (TSTCellStyle *)(id)objc_msgSend(a3, "headerColumnCellStyle");
    self->mStyles.footerRowCellStyle = (TSTCellStyle *)(id)objc_msgSend(a3, "footerRowCellStyle");
    self->mStyles.bodyTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "bodyTextStyle");
    self->mStyles.headerRowTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "headerRowTextStyle");
    self->mStyles.headerColumnTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "headerColumnTextStyle");
    self->mStyles.footerRowTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "footerRowTextStyle");
    self->mStyles.tableNameStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a3, "tableNameStyle");
    self->mStyles.tableNameShapeStyle = (TSWPShapeStyle *)(id)objc_msgSend(a3, "tableNameShapeStyle");
    self->mPresetIndex = objc_msgSend(a3, "presetIndex");
  }
  else
  {
    NSLog((NSString *)CFSTR("no styles to init, this should be a crash but is not yet"));
  }
}

- (void)setupDefaultCells
{
  uint64_t *p_mDefaultCells;
  TSTCell *defaultBodyCell;
  TSTCell *defaultHeaderRowCell;
  TSTCell *defaultHeaderColumnCell;
  TSTCell *defaultFooterRowCell;
  uint64_t v8;
  uint64_t v9;
  TSTCellStyle *v10;
  TSTCellStyle *v11;
  TSTCellStyle *v12;
  uint64_t v13;
  TSWPParagraphStyle *v14;
  TSWPParagraphStyle *v15;
  TSWPParagraphStyle *v16;
  TSTCell *v17;
  TSTCell *v18;
  TSTCellStyle *v19;
  TSTCellStyle *mCellStyle;
  TSTCellStyle *v21;
  TSTCell *v22;
  TSWPParagraphStyle *v23;
  TSWPParagraphStyle *mTextStyle;
  TSWPParagraphStyle *v25;
  TSTCell *v26;
  TSTCell *v27;
  TSTCellStyle *v28;
  TSTCellStyle *v29;
  TSTCellStyle *v30;
  TSTCell *v31;
  TSWPParagraphStyle *v32;
  TSWPParagraphStyle *v33;
  TSWPParagraphStyle *v34;
  TSTCell *v35;
  TSTCell *v36;
  TSTCellStyle *v37;
  TSTCellStyle *v38;
  TSTCellStyle *v39;
  TSTCell *v40;
  TSWPParagraphStyle *v41;
  TSWPParagraphStyle *v42;
  TSWPParagraphStyle *v43;

  -[TSPObject willModify](self, "willModify");
  p_mDefaultCells = (uint64_t *)&self->mDefaultCells;
  defaultBodyCell = self->mDefaultCells.defaultBodyCell;
  if (defaultBodyCell)

  defaultHeaderRowCell = self->mDefaultCells.defaultHeaderRowCell;
  if (defaultHeaderRowCell)

  defaultHeaderColumnCell = self->mDefaultCells.defaultHeaderColumnCell;
  if (defaultHeaderColumnCell)

  defaultFooterRowCell = self->mDefaultCells.defaultFooterRowCell;
  if (defaultFooterRowCell)

  *p_mDefaultCells = (uint64_t)objc_alloc_init(TSTCell);
  self->mDefaultCells.defaultHeaderRowCell = objc_alloc_init(TSTCell);
  self->mDefaultCells.defaultHeaderColumnCell = objc_alloc_init(TSTCell);
  self->mDefaultCells.defaultFooterRowCell = objc_alloc_init(TSTCell);
  v8 = *p_mDefaultCells;
  TSTCellClearValue(*p_mDefaultCells);
  *(_DWORD *)(v8 + 8) &= 0xFFFF00FF;
  v9 = *p_mDefaultCells;
  v10 = -[TSTTableModel bodyCellStyle](self, "bodyCellStyle");
  v11 = *(TSTCellStyle **)(v9 + 40);
  if (v11 != v10)
  {
    v12 = v10;

    *(_QWORD *)(v9 + 40) = v12;
    *(_DWORD *)(v9 + 32) = 0;
  }
  v13 = *p_mDefaultCells;
  v14 = -[TSTTableModel bodyTextStyle](self, "bodyTextStyle");
  v15 = *(TSWPParagraphStyle **)(v13 + 56);
  if (v15 != v14)
  {
    v16 = v14;

    *(_QWORD *)(v13 + 56) = v16;
    *(_DWORD *)(v13 + 48) = 0;
  }
  v17 = self->mDefaultCells.defaultHeaderRowCell;
  TSTCellClearValue((uint64_t)v17);
  *(_DWORD *)&v17->mPrivate &= 0xFFFF00FF;
  v18 = self->mDefaultCells.defaultHeaderRowCell;
  v19 = -[TSTTableModel headerRowCellStyle](self, "headerRowCellStyle");
  mCellStyle = v18->mPrivate.mCellStyle;
  if (mCellStyle != v19)
  {
    v21 = v19;

    v18->mPrivate.mCellStyle = v21;
    v18->mPrivate.mCellStyleID = 0;
  }
  v22 = self->mDefaultCells.defaultHeaderRowCell;
  v23 = -[TSTTableModel headerRowTextStyle](self, "headerRowTextStyle");
  mTextStyle = v22->mPrivate.mTextStyle;
  if (mTextStyle != v23)
  {
    v25 = v23;

    v22->mPrivate.mTextStyle = v25;
    v22->mPrivate.mTextStyleID = 0;
  }
  v26 = self->mDefaultCells.defaultHeaderColumnCell;
  TSTCellClearValue((uint64_t)v26);
  *(_DWORD *)&v26->mPrivate &= 0xFFFF00FF;
  v27 = self->mDefaultCells.defaultHeaderColumnCell;
  v28 = -[TSTTableModel headerColumnCellStyle](self, "headerColumnCellStyle");
  v29 = v27->mPrivate.mCellStyle;
  if (v29 != v28)
  {
    v30 = v28;

    v27->mPrivate.mCellStyle = v30;
    v27->mPrivate.mCellStyleID = 0;
  }
  v31 = self->mDefaultCells.defaultHeaderColumnCell;
  v32 = -[TSTTableModel headerColumnTextStyle](self, "headerColumnTextStyle");
  v33 = v31->mPrivate.mTextStyle;
  if (v33 != v32)
  {
    v34 = v32;

    v31->mPrivate.mTextStyle = v34;
    v31->mPrivate.mTextStyleID = 0;
  }
  v35 = self->mDefaultCells.defaultFooterRowCell;
  TSTCellClearValue((uint64_t)v35);
  *(_DWORD *)&v35->mPrivate &= 0xFFFF00FF;
  v36 = self->mDefaultCells.defaultFooterRowCell;
  v37 = -[TSTTableModel footerRowCellStyle](self, "footerRowCellStyle");
  v38 = v36->mPrivate.mCellStyle;
  if (v38 != v37)
  {
    v39 = v37;

    v36->mPrivate.mCellStyle = v39;
    v36->mPrivate.mCellStyleID = 0;
  }
  v40 = self->mDefaultCells.defaultFooterRowCell;
  v41 = -[TSTTableModel footerRowTextStyle](self, "footerRowTextStyle");
  v42 = v40->mPrivate.mTextStyle;
  if (v42 != v41)
  {
    v43 = v41;

    v40->mPrivate.mTextStyle = v43;
    v40->mPrivate.mTextStyleID = 0;
  }
}

- (TSTTableModel)initWithContext:(id)a3 rows:(unsigned __int16)a4 columns:(unsigned __int16)a5 styles:(id)a6 tableInfo:(id)a7
{
  TSTTableModel *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSTTableModel;
  v10 = -[TSPObject initWithContext:](&v13, sel_initWithContext_, a3, a4, a5, a6, a7);
  if (v10)
  {
    v11 = +[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration");
    v10->mNumberOfColumns = a5;
    v10->mNumberOfRows = a4;
    v10->mNumberOfHeaderColumns = 0;
    v10->mNumberOfHeaderRows = 0;
    v10->mNumberOfFooterRows = 0;
    v10->mHeaderRowsFrozen = 0;
    v10->mHeaderColumnsFrozen = 0;
    v10->mDefaultRowHeight = 22.0;
    v10->mDefaultColumnWidth = 98.0;
    v10->mNumberOfHiddenRows = 0;
    v10->mNumberOfHiddenColumns = 0;
    v10->mNumberOfUserHiddenRows = 0;
    v10->mNumberOfUserHiddenColumns = 0;
    v10->mNumberOfFilteredRows = 0;
    v10->mDataStore = -[TSTTableDataStore initWithOwner:]([TSTTableDataStore alloc], "initWithOwner:", v10);
    v10->mTableName = (NSString *)+[TSTTableModel unnamedTableString](TSTTableModel, "unnamedTableString");
    v10->mTableNameEnabled = objc_msgSend(v11, "tableNameEnabledInNewTables");
    v10->mRepeatingHeaderRowsEnabled = 0;
    v10->mRepeatingHeaderColumnsEnabled = 0;
    v10->mTableID = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
    v10->mPresetIndex = objc_msgSend(a6, "presetIndex");
    v10->mCellsPendingWrite = objc_alloc_init(TSTCellDictionary);
    v10->mWasUnarchivedFromAProvidedTable = 0;
    -[TSTTableModel resetStyles:](v10, "resetStyles:", a6);
    -[TSTTableModel setupDefaultCells](v10, "setupDefaultCells");
  }
  return v10;
}

- (TSTTableModel)initWithContext:(id)a3 fromSourceModel:(id)a4 region:(id)a5 tableInfo:(id)a6
{
  unint64_t v7;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _BOOL4 v13;
  TSTTableModel *v14;
  __CFUUID *v15;
  __CFDictionary *Mutable;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int mNumberOfRows;
  int v23;
  int v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  unsigned __int16 *v34;
  TSTCellIterator *v35;
  id v36;
  char v37;
  __int16 v38;
  TSTCell *v39;
  TSTRichTextPayload *v40;
  TSDCommentStorage *v41;
  int v42;
  int mFormatType;
  uint64_t mCustomFormatID;
  __int128 v45;
  int mDisplayFormatType;
  char v47;
  char v48;
  TSUFormatReferenceObject *mMultipleChoiceListFormatRef;
  int v50;
  uint64_t v51;
  __int128 v52;
  TSTCell *v53;
  TSUFormatReferenceObject *v54;
  id v55;
  id v57;
  char v58;
  unint64_t v59;
  int v60;
  __CFDictionary *cf;
  unsigned __int16 *p_mNumberOfHeaderColumns;
  unsigned __int16 *p_mNumberOfHeaderRows;
  _DWORD v65[2];
  uint64_t v66;
  __int128 v67;
  int v68;
  char v69;
  __int16 v70;
  char v71;
  __int16 v72;
  char v73;
  char v74[4];
  __int16 v75;
  char v76;
  TSTCell *v77;
  _DWORD v78[2];
  uint64_t v79;
  __int128 v80;
  int v81;
  char v82;
  __int16 v83;
  char v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v7 = (unint64_t)a5;
  v10 = objc_msgSend(a5, "boundingCellRange");
  v11 = HIWORD(v10);
  v12 = +[TSTTableStyleNetwork networkFromTableModel:](TSTTableStyleNetwork, "networkFromTableModel:", a4);
  if (objc_msgSend((id)v7, "isRectangle"))
    v13 = ((objc_msgSend(a4, "range") ^ v10) & 0xFFFFFFFF00FFFFFFLL) == 0;
  else
    v13 = 0;
  v14 = -[TSTTableModel initWithContext:rows:columns:styles:tableInfo:](self, "initWithContext:rows:columns:styles:tableInfo:", a3, v11, WORD2(v10), v12, a6);
  if (v14)
  {
    if (a4)
    {
      v15 = (__CFUUID *)objc_msgSend(a4, "tableID");
      v14->mFromTableID = v15;
      CFRetain(v15);
    }
    v14->mRepeatingHeaderRowsEnabled = objc_msgSend(a4, "repeatingHeaderRowsEnabled");
    v14->mRepeatingHeaderColumnsEnabled = objc_msgSend(a4, "repeatingHeaderColumnsEnabled");
    v14->mHeaderRowsFrozen = objc_msgSend(a4, "headerRowsFrozen");
    v14->mHeaderColumnsFrozen = objc_msgSend(a4, "headerColumnsFrozen");
    Mutable = CFDictionaryCreateMutable(0, 1, 0, 0);
    CFDictionarySetValue(Mutable, (const void *)objc_msgSend(a4, "tableID"), v14->mTableID);
    if (objc_msgSend(a4, "numberOfHeaderRows") <= (unsigned __int16)v10)
      LOWORD(v17) = 0;
    else
      v17 = objc_msgSend(a4, "numberOfHeaderRows") - v10;
    p_mNumberOfHeaderRows = &v14->mNumberOfHeaderRows;
    v14->mNumberOfHeaderRows = v17;
    if (BYTE2(v10) >= objc_msgSend(a4, "numberOfHeaderColumns"))
      LOWORD(v18) = 0;
    else
      v18 = objc_msgSend(a4, "numberOfHeaderColumns") - BYTE2(v10);
    p_mNumberOfHeaderColumns = &v14->mNumberOfHeaderColumns;
    v14->mNumberOfHeaderColumns = v18;
    v19 = objc_msgSend(a4, "numberOfRows");
    if ((int)(v19 - objc_msgSend(a4, "numberOfFooterRows")) <= (unsigned __int16)(v10 + HIWORD(v10) - 1))
    {
      v21 = objc_msgSend(a4, "numberOfRows");
      v20 = v11 + v10 - v21 + objc_msgSend(a4, "numberOfFooterRows");
    }
    else
    {
      LOWORD(v20) = 0;
    }
    v14->mNumberOfFooterRows = v20;
    mNumberOfRows = v14->mNumberOfRows;
    if (mNumberOfRows == (unsigned __int16)v20)
    {
      LOWORD(v20) = v20 - 1;
      v14->mNumberOfFooterRows = v20;
      mNumberOfRows = v14->mNumberOfRows;
    }
    v23 = *p_mNumberOfHeaderRows;
    if (v23 == mNumberOfRows)
    {
      LOWORD(v23) = mNumberOfRows - 1;
      *p_mNumberOfHeaderRows = mNumberOfRows - 1;
      LOWORD(v20) = v14->mNumberOfFooterRows;
      mNumberOfRows = v14->mNumberOfRows;
    }
    if ((unsigned __int16)v20 + (unsigned __int16)v23 == mNumberOfRows)
      v14->mNumberOfFooterRows = v20 - 1;
    v24 = *p_mNumberOfHeaderColumns;
    if (v24 == v14->mNumberOfColumns)
      *p_mNumberOfHeaderColumns = v24 - 1;
    v14->mTableNameEnabled = objc_msgSend(a4, "tableNameEnabled");
    if (v13)
    {
      -[TSTTableModel setTableName:](v14, "setTableName:", objc_msgSend(a4, "tableName"));
      -[TSTTableModel setTableNameBorderEnabled:](v14, "setTableNameBorderEnabled:", objc_msgSend(a4, "tableNameBorderEnabled"));
      objc_msgSend(a4, "tableNameHeight");
      -[TSTTableModel setTableNameHeight:](v14, "setTableNameHeight:");
      -[TSTTableModel setStyleApplyClearsAll:](v14, "setStyleApplyClearsAll:", objc_msgSend(a4, "styleApplyClearsAll"));
    }
    cf = Mutable;
    if (a4)
    {
      v25 = *((double *)a4 + 12);
      -[TSPObject willModify](v14, "willModify");
      v14->mDefaultRowHeight = v25;
      v26 = *((double *)a4 + 13);
    }
    else
    {
      -[TSPObject willModify](v14, "willModify");
      v14->mDefaultRowHeight = 10.0;
      v26 = 0.0;
    }
    -[TSPObject willModify](v14, "willModify");
    v14->mDefaultColumnWidth = v26;
    v57 = a4;
    v59 = v7;
    v27 = (void *)objc_msgSend(TSTTableMergeRangesForCellRegion((uint64_t)a4, (void *)v7), "iterator");
    if (objc_msgSend(v27, "hasNextMergeRegion"))
    {
      v28 = v10 & 0xFF0000;
      do
      {
        v29 = objc_msgSend(v27, "nextMergeRegion", v57);
        v7 = v29 - v10;
        v30 = (v29 - v28) & 0xFF0000 | (unsigned __int16)(v29 - v10);
        v31 = -[TSTTableModel tableAreaForCellID:](v14, "tableAreaForCellID:", v30);
        if (v31 == 4)
        {
          v32 = 1;
        }
        else
        {
          v32 = v31;
          if (v31 == 5)
            v32 = 3;
        }
        v33 = -[TSTTableModel tableAreaForCellID:](v14, "tableAreaForCellID:", ((_DWORD)v29 - (_DWORD)v28 + ((v29 & 0xFFFFFFFF00000000) >> 16) + 16711680) & 0xFF0000 | (unsigned __int16)(v7 + HIWORD(v29) - 1));
        if (v33 == 4)
        {
          v33 = 1;
        }
        else if (v33 == 5)
        {
          v33 = 3;
        }
        if (v32 == v33)
          goto LABEL_46;
        v34 = &v14->mNumberOfHeaderRows;
        if (v32 != 1)
        {
          if (v32 != 2)
            goto LABEL_44;
          v34 = &v14->mNumberOfHeaderColumns;
        }
        *v34 = 0;
LABEL_44:
        if (v33 == 3)
          v14->mNumberOfFooterRows = 0;
LABEL_46:
        TSTTableDataStoreMerge(&v14->mDataStore->super.super.isa, v30 | v29 & 0xFFFFFFFF00000000);
      }
      while ((objc_msgSend(v27, "hasNextMergeRegion") & 1) != 0);
    }
    v35 = -[TSTCellIterator initWithTableModel:region:flags:]([TSTCellIterator alloc], "initWithTableModel:region:flags:", v57, v59, 32);
    v36 = a3;
    if (TSTCellIteratorGetNextCell(v35, v74))
    {
      while (1)
      {
        v37 = v76;
        v38 = v75;
        v39 = v77;
        if (!v77)
          goto LABEL_74;
        if (*((unsigned __int8 *)&v77->mPrivate + 1) << 8 == 768)
        {
          if (v77->mPrivate.mValue.mString.mID)
          {
            v77->mPrivate.mValue.mString.mID = 0;
            v39 = v77;
            if (!v77)
              goto LABEL_74;
          }
        }
        if (v39->mPrivate.mRichTextPayloadID)
        {
          v39->mPrivate.mRichTextPayloadID = 0;
          v40 = -[TSTRichTextPayload copyWithContext:](v39->mPrivate.mRichTextPayload, "copyWithContext:", v36);
          TSTCellSetRichTextPayloadClearingIDConvertToPlaintext((TSTRichTextPayload *)v77, v40, 1, 1);

          v39 = v77;
          if (!v77)
            goto LABEL_74;
        }
        if (v39->mPrivate.mCommentStorageID)
        {
          v39->mPrivate.mCommentStorageID = 0;
          v41 = (TSDCommentStorage *)-[TSDCommentStorage copyWithContext:](v39->mPrivate.mCommentStorage, "copyWithContext:", v36);
          TSTCellSetCommentStorageClearingID((TSDCommentStorage *)v77, v41, 1);

          v39 = v77;
          if (!v77)
            goto LABEL_74;
        }
        if (!v39->mPrivate.mCellFormats.mCurrentCellFormatID)
          goto LABEL_70;
        v39->mPrivate.mCellFormats.mCurrentCellFormatID = 0;
        v39->mPrivate.mCellFormats.mNumberFormatID = 0;
        v39->mPrivate.mCellFormats.mCurrencyFormatID = 0;
        v39->mPrivate.mCellFormats.mDurationFormatID = 0;
        v39->mPrivate.mCellFormats.mDateFormatID = 0;
        v39->mPrivate.mCellFormats.mControlFormatID = 0;
        v39->mPrivate.mCellFormats.mCustomFormatID = 0;
        v39->mPrivate.mCellFormats.mBaseFormatID = 0;
        v39->mPrivate.mCellFormats.mMultipleChoiceListFormatID = 0;
        v73 = 0;
        v72 = 0;
        mFormatType = v39->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType;
        v42 = *(&v39->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType + 1);
        mCustomFormatID = v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mCustomFormatStruct.mCustomFormatID;
        v45 = *(_OWORD *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct.mData;
        mDisplayFormatType = v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mControlFormatStruct.mDisplayFormatType;
        v47 = *((_BYTE *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 28);
        v48 = *((_BYTE *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 31);
        v72 = *(_WORD *)((char *)&v39->mPrivate.mCellFormats.mCurrentCellFormat.var0.mMultipleChoiceListFormatStruct + 29);
        v73 = v48;
        if (mFormatType == 266)
        {
          v65[0] = 266;
          v65[1] = v42;
          v66 = mCustomFormatID;
          v67 = v45;
          v68 = mDisplayFormatType;
          v69 = v47;
          v70 = v72;
          v71 = v73;
          TSTCellSetFormatClearingID((uint64_t)v39, (uint64_t)v65, 1);
          goto LABEL_69;
        }
        mMultipleChoiceListFormatRef = v39->mPrivate.mCellFormats.mMultipleChoiceListFormatRef;
        if (mMultipleChoiceListFormatRef)
        {
          -[TSUFormatReferenceObject getFormatStruct](mMultipleChoiceListFormatRef, "getFormatStruct", *(double *)&v45);
          v50 = DWORD1(v85);
          v51 = DWORD2(v85);
          v52 = v86;
          v72 = *(_WORD *)((char *)&v87 + 5);
          v73 = HIBYTE(v87);
          if ((_DWORD)v85 == 266)
            break;
        }
LABEL_69:
        v39 = v77;
        if (v77)
        {
LABEL_70:
          if (v39->mPrivate.mCellStyleID)
            v39->mPrivate.mCellStyleID = 0;
          if (v39->mPrivate.mTextStyleID)
            v39->mPrivate.mTextStyleID = 0;
        }
LABEL_74:
        v7 = (unsigned __int16)(v38 - v10) | ((unint64_t)(v37 - BYTE2(v10)) << 16) | v7 & 0xFFFFFFFF00000000;
        TSTTableDataStoreSetCellAtCellID((id *)&v14->mDataStore->super.super.isa, v39, v7);
        if ((TSTCellIteratorGetNextCell(v35, v74) & 1) == 0)
          goto LABEL_75;
      }
      v58 = BYTE4(v87);
      v60 = v87;
      v53 = v77;
      if (v77)
      {
        v54 = v77->mPrivate.mCellFormats.mMultipleChoiceListFormatRef;
        if (v54)
        {
          -[TSUFormatReferenceObject getFormatStruct](v54, "getFormatStruct");
          if ((_DWORD)v85 == 266 && *((_QWORD *)&v85 + 1) == v51)
            goto LABEL_68;
        }
        else
        {
          v87 = 0;
          v85 = 0u;
          v86 = 0u;
        }

        v55 = objc_alloc(MEMORY[0x24BEB3C88]);
        v78[0] = 266;
        v78[1] = v50;
        v79 = v51;
        v80 = v52;
        v81 = v60;
        v82 = v58;
        v83 = v72;
        v84 = v73;
        v53->mPrivate.mCellFormats.mMultipleChoiceListFormatRef = (TSUFormatReferenceObject *)objc_msgSend(v55, "initWithTSUFormatFormatStruct:", v78);
        v53->mPrivate.mCellFormats.mMultipleChoiceListFormatID = 0;
      }
LABEL_68:
      v36 = a3;
      goto LABEL_69;
    }
LABEL_75:

    CFRelease(cf);
  }
  return v14;
}

- (TSKDocumentRoot)documentRoot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableModel;
  return (TSKDocumentRoot *)-[TSPObject documentRoot](&v3, sel_documentRoot);
}

- (void)dealloc
{
  __CFUUID *mFromTableID;
  objc_super v4;

  -[TSTTableModel p_releaseExistingDefaultStyles](self, "p_releaseExistingDefaultStyles");
  CFRelease(self->mTableID);
  mFromTableID = self->mFromTableID;
  if (mFromTableID)
    CFRelease(mFromTableID);

  self->mCellsPendingWrite = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSTTableModel;
  -[TSTTableModel dealloc](&v4, sel_dealloc);
}

- (void)setDrawableIsBeingCopied:(BOOL)a3
{
  objc_msgSend(-[TSTTableModel dataStore](self, "dataStore"), "setDrawableIsBeingCopied:", a3);
}

- (NSString)tableName
{
  return self->mTableName;
}

- (void)setTableName:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mTableName = (NSString *)a3;
}

- (BOOL)tableNameEnabled
{
  return self->mTableNameEnabled;
}

- (void)setTableNameEnabled:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mTableNameEnabled = a3;
}

- (BOOL)tableNameBorderEnabled
{
  return self->mTableNameBorderEnabled;
}

- (void)setTableNameBorderEnabled:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mTableNameBorderEnabled = a3;
}

- (double)tableNameHeight
{
  return self->mTableNameHeight;
}

- (void)setTableNameHeight:(double)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mTableNameHeight = a3;
}

- (BOOL)repeatingHeaderRowsEnabled
{
  return self->mRepeatingHeaderRowsEnabled;
}

- (void)setRepeatingHeaderRowsEnabled:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mRepeatingHeaderRowsEnabled = a3;
}

- (BOOL)repeatingHeaderColumnsEnabled
{
  return self->mRepeatingHeaderColumnsEnabled;
}

- (void)setRepeatingHeaderColumnsEnabled:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mRepeatingHeaderColumnsEnabled = a3;
}

- (BOOL)styleApplyClearsAll
{
  return self->mStyleApplyClearsAll;
}

- (void)setStyleApplyClearsAll:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mStyleApplyClearsAll = a3;
}

- (unsigned)numberOfRows
{
  return self->mNumberOfRows;
}

- (void)setNumberOfRows:(unsigned __int16)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mNumberOfRows = a3;
}

- (unsigned)numberOfColumns
{
  return self->mNumberOfColumns;
}

- (void)setNumberOfColumns:(unsigned __int16)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mNumberOfColumns = a3;
}

- (unsigned)numberOfHeaderRows
{
  return self->mNumberOfHeaderRows;
}

- (void)setNumberOfHeaderRows:(unsigned __int16)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mNumberOfHeaderRows = a3;
}

- (unsigned)numberOfFooterRows
{
  return self->mNumberOfFooterRows;
}

- (void)setNumberOfFooterRows:(unsigned __int16)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mNumberOfFooterRows = a3;
}

- (unsigned)numberOfHeaderColumns
{
  return self->mNumberOfHeaderColumns;
}

- (void)setNumberOfHeaderColumns:(unsigned __int16)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mNumberOfHeaderColumns = a3;
}

- (unint64_t)presetIndex
{
  return self->mPresetIndex;
}

- (void)setPresetIndex:(unint64_t)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mPresetIndex = a3;
}

- (BOOL)headerRowsFrozen
{
  return self->mHeaderRowsFrozen;
}

- (void)setHeaderRowsFrozen:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mHeaderRowsFrozen = a3;
}

- (BOOL)headerColumnsFrozen
{
  return self->mHeaderColumnsFrozen;
}

- (void)setHeaderColumnsFrozen:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mHeaderColumnsFrozen = a3;
}

- (TSTTableStyle)tableStyle
{
  return self->mStyles.tableStyle;
}

- (void)setTableStyle:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mStyles.tableStyle = (TSTTableStyle *)a3;
}

- (TSTCellStyle)bodyCellStyle
{
  return self->mStyles.bodyCellStyle;
}

- (void)setBodyCellStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._identifier = (int64_t)a3;
}

- (TSTCellStyle)headerRowCellStyle
{
  return self->mStyles.headerRowCellStyle;
}

- (void)setHeaderRowCellStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._modifyObjectToken = (int64_t)a3;
}

- (TSTCellStyle)headerColumnCellStyle
{
  return self->mStyles.headerColumnCellStyle;
}

- (void)setHeaderColumnCellStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._unarchiverIdentifier = (int64_t)a3;
}

- (TSTCellStyle)footerRowCellStyle
{
  return self->mStyles.footerRowCellStyle;
}

- (void)setFooterRowCellStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._unknownContent = (TSPUnknownContent *)a3;
}

- (TSWPParagraphStyle)bodyTextStyle
{
  return self->mStyles.bodyTextStyle;
}

- (void)setBodyTextStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->super._delegate = (TSPObjectDelegate *)a3;
}

- (TSWPParagraphStyle)headerRowTextStyle
{
  return self->mStyles.headerRowTextStyle;
}

- (void)setHeaderRowTextStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->mDataStore = (TSTTableDataStore *)a3;
}

- (TSWPParagraphStyle)headerColumnTextStyle
{
  return self->mStyles.headerColumnTextStyle;
}

- (void)setHeaderColumnTextStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->mTableID = (__CFUUID *)a3;
}

- (TSWPParagraphStyle)footerRowTextStyle
{
  return self->mStyles.footerRowTextStyle;
}

- (void)setFooterRowTextStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  v4->mFromTableID = (__CFUUID *)a3;
}

- (TSWPParagraphStyle)tableNameStyle
{
  return self->mStyles.tableNameStyle;
}

- (void)setTableNameStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  *(_QWORD *)&v4->mNumberOfRows = a3;
}

- (TSWPShapeStyle)tableNameShapeStyle
{
  return self->mStyles.tableNameShapeStyle;
}

- (void)setTableNameShapeStyle:(id)a3
{
  TSTTableModel *v4;
  id v5;

  v4 = self;
  -[TSPObject willModify](self, "willModify");
  v5 = a3;
  v4 = (TSTTableModel *)((char *)v4 + 160);

  *(_QWORD *)&v4->mNumberOfFooterRows = a3;
}

- (BOOL)hasTableBorder
{
  return -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796) != 0;
}

- (BOOL)hasAlternatingRows
{
  return -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 769) != 0;
}

- (TSDStroke)tableNameBorderStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 782);
}

- (id)dataStore
{
  return self->mDataStore;
}

- (__CFUUID)tableID
{
  return self->mTableID;
}

- (void)setTableID:(__CFUUID *)a3
{
  -[TSPObject willModify](self, "willModify");
  CFRetain(a3);
  CFRelease(self->mTableID);
  self->mTableID = a3;
}

- (__CFUUID)fromTableID
{
  return self->mFromTableID;
}

- (TSTCell)defaultBodyCell
{
  return self->mDefaultCells.defaultBodyCell;
}

- (TSTCell)defaultFooterRowCell
{
  return self->mDefaultCells.defaultFooterRowCell;
}

- (TSTCell)defaultHeaderRowCell
{
  return self->mDefaultCells.defaultHeaderRowCell;
}

- (TSTCell)defaultHeaderColumnCell
{
  return self->mDefaultCells.defaultHeaderColumnCell;
}

- (BOOL)useBandedFill
{
  return -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 769) != 0;
}

- (id)bandedFillObject
{
  return -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 770);
}

- (void)setStorageParentToInfo:(id)a3
{
  -[TSTTableDataStore setStorageParentToInfo:](self->mDataStore, "setStorageParentToInfo:", a3);
}

- (unsigned)tableAreaForCellID:(id)a3
{
  return +[TSTTableModel tableAreaForCellID:inTableWithHeaderColumns:headerRows:footerRows:totalRows:](TSTTableModel, "tableAreaForCellID:inTableWithHeaderColumns:headerRows:footerRows:totalRows:", *(unsigned int *)&a3, self->mNumberOfHeaderColumns, self->mNumberOfHeaderRows, self->mNumberOfFooterRows, self->mNumberOfRows);
}

+ (unsigned)tableAreaForCellID:(id)a3 inTableWithHeaderColumns:(unsigned __int16)a4 headerRows:(unsigned __int16)a5 footerRows:(unsigned __int16)a6 totalRows:(unsigned __int16)a7
{
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (a3.var0 >= a7 - a6)
    v7 = 3;
  else
    v7 = 0;
  if (!a6)
    v7 = 0;
  if (a3.var0 >= a5)
    v8 = v7;
  else
    v8 = 1;
  if (a3.var0 >= a7 - a6)
    v9 = 5;
  else
    v9 = 2;
  if (a3.var0 >= a5)
    v10 = v9;
  else
    v10 = 4;
  if (a4 > a3.var1)
    return v10;
  else
    return v8;
}

+ ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeForTableArea:(unsigned int)a3 givenTableSize:(id)a4 numberOfHeaderRows:(unsigned __int16)a5 numberOfFooterRows:(unsigned __int16)a6 numberOfHeaderColumns:(unsigned __int16)a7
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  switch(a3)
  {
    case 0u:
      if ((unsigned __int16)(a4.var0 - a7) >= 0xFFu)
        v7 = 255;
      else
        v7 = (unsigned __int16)(a4.var0 - a7);
      v8 = ((unint64_t)(a4.var1 - (a6 + a5)) << 48) | (v7 << 32) | a5 & 0xFF00FFFF | ((unint64_t)a7 << 16);
      break;
    case 1u:
      if ((unsigned __int16)(a4.var0 - a7) >= 0xFFu)
        v9 = 255;
      else
        v9 = (unsigned __int16)(a4.var0 - a7);
      v8 = (a5 << 48) | (unint64_t)(v9 << 32) | ((unint64_t)a7 << 16);
      break;
    case 2u:
      if (a7 >= 0xFFu)
        v10 = 255;
      else
        v10 = a7;
      v8 = (v10 << 32) | ((unint64_t)(a4.var1 - (a6 + a5)) << 48) | a5;
      break;
    case 3u:
      if ((unsigned __int16)(a4.var0 - a7) >= 0xFFu)
        v11 = 255;
      else
        v11 = (unsigned __int16)(a4.var0 - a7);
      v8 = (a6 << 48) | (unint64_t)(v11 << 32) | (unsigned __int16)(a4.var1 - a6) | ((unint64_t)a7 << 16);
      break;
    case 4u:
      if (a7 >= 0xFFu)
        v12 = 255;
      else
        v12 = a7;
      v8 = (a5 << 48) | (unint64_t)(v12 << 32);
      break;
    case 5u:
      if (a7 >= 0xFFu)
        v13 = 255;
      else
        v13 = a7;
      v8 = (a5 << 48) | (unint64_t)(v13 << 32) | (unsigned __int16)(a4.var1 - a6);
      break;
    default:
      v8 = 0xFFFFFFLL;
      break;
  }
  return ($CA3468F20078D5D2DB35E78E73CA60DA)v8;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeForTableArea:(unsigned int)a3
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)objc_msgSend((id)objc_opt_class(), "cellRangeForTableArea:givenTableSize:numberOfHeaderRows:numberOfFooterRows:numberOfHeaderColumns:", *(_QWORD *)&a3, (unint64_t)-[TSTTableModel range](self, "range") >> 32, -[TSTTableModel numberOfHeaderRows](self, "numberOfHeaderRows"), -[TSTTableModel numberOfFooterRows](self, "numberOfFooterRows"), -[TSTTableModel numberOfHeaderColumns](self, "numberOfHeaderColumns"));
}

- (id)defaultCellForTableArea:(unsigned int)a3
{
  id result;
  void *v4;
  uint64_t v5;

  switch(a3)
  {
    case 0u:
      result = self->mDefaultCells.defaultBodyCell;
      break;
    case 1u:
    case 4u:
      result = self->mDefaultCells.defaultHeaderRowCell;
      break;
    case 2u:
      result = self->mDefaultCells.defaultHeaderColumnCell;
      break;
    case 3u:
    case 5u:
      result = self->mDefaultCells.defaultFooterRowCell;
      break;
    default:
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableModel defaultCellForTableArea:]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 1670, CFSTR("illegal table region"));
      result = 0;
      break;
  }
  return result;
}

- (int)defaultCell:(id)a3 forTableArea:(unsigned int)a4
{
  TSTCellCopy((uint64_t)-[TSTTableModel defaultCellForTableArea:](self, "defaultCellForTableArea:", *(_QWORD *)&a4), (uint64_t)a3);
  return 0;
}

- (void)p_fetchCellHoldingReadLock:(void *)a3 returnCode:(void *)a4
{
  *(_DWORD *)a4 = TSTCellAtCellIDSuppressingFormula(*(_QWORD *)a3, *((_DWORD *)a3 + 2), *((void **)a3 + 2), 0);
}

- (id)defaultCellStyleForTableArea:(unsigned int)a3
{
  id *v3;
  void *v5;
  uint64_t v6;

  v3 = -[TSTTableModel defaultCellForTableArea:](self, "defaultCellForTableArea:", *(_QWORD *)&a3);
  if (v3)
    return v3[5];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableModel defaultCellStyleForTableArea:]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 2260, CFSTR("null default cell"));
  return 0;
}

- (id)defaultTextStyleForTableArea:(unsigned int)a3
{
  id *v3;
  void *v5;
  uint64_t v6;

  v3 = -[TSTTableModel defaultCellForTableArea:](self, "defaultCellForTableArea:", *(_QWORD *)&a3);
  if (v3)
    return v3[7];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableModel defaultTextStyleForTableArea:]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 2327, CFSTR("null default cell"));
  return 0;
}

- (void)setHeight:(double)a3 ofRow:(unsigned __int16)a4
{
  TSTTableSetHeightOfRow((uint64_t)self, a4, a3);
}

- (void)setWidth:(double)a3 ofColumn:(unsigned __int8)a4
{
  TSTTableSetWidthOfColumn((uint64_t)self, a4, a3);
}

- (NSArray)rowHeights
{
  NSArray *v3;
  int v4;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->mNumberOfRows);
  if (self->mNumberOfRows)
  {
    v4 = 0;
    do
      -[NSArray addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", TSTTableHeightOfRow((uint64_t)self, (unsigned __int16)v4++, 0)));
    while (self->mNumberOfRows > (unsigned __int16)v4);
  }
  return v3;
}

- (NSArray)columnWidths
{
  NSArray *v3;
  int v4;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->mNumberOfColumns);
  if (self->mNumberOfColumns)
  {
    v4 = 0;
    do
      -[NSArray addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", TSTTableWidthOfColumn((uint64_t)self, v4++, 0)));
    while (self->mNumberOfColumns > v4);
  }
  return v3;
}

- (void)setColumnWidths:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__TSTTableModel_setColumnWidths___block_invoke;
  v3[3] = &unk_24D82F320;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __33__TSTTableModel_setColumnWidths___block_invoke(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v4;
  double v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "tsu_CGFloatValue");
  return TSTTableSetWidthOfColumn(v4, a3, v5);
}

- (void)setRowHeights:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__TSTTableModel_setRowHeights___block_invoke;
  v3[3] = &unk_24D82F320;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __31__TSTTableModel_setRowHeights___block_invoke(uint64_t a1, void *a2, unsigned __int16 a3)
{
  uint64_t v4;
  double v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "tsu_CGFloatValue");
  return TSTTableSetHeightOfRow(v4, a3, v5);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)range
{
  uint64_t mNumberOfColumns;

  if (self->mNumberOfColumns >= 0xFFu)
    mNumberOfColumns = 255;
  else
    mNumberOfColumns = self->mNumberOfColumns;
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((mNumberOfColumns << 32) | ((unint64_t)self->mNumberOfRows << 48));
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyRange
{
  uint64_t mNumberOfHeaderRows;
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  mNumberOfHeaderRows = self->mNumberOfHeaderRows;
  v3 = mNumberOfHeaderRows + self->mNumberOfFooterRows;
  v4 = mNumberOfHeaderRows & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)self->mNumberOfHeaderColumns << 16);
  v5 = self->mNumberOfRows - v3;
  if ((unsigned __int16)(self->mNumberOfColumns - self->mNumberOfHeaderColumns) >= 0xFFu)
    v6 = 255;
  else
    v6 = (unsigned __int16)(self->mNumberOfColumns - self->mNumberOfHeaderColumns);
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((v6 << 32) | (v5 << 48) | v4);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyColumnRange
{
  unsigned __int16 mNumberOfHeaderColumns;
  uint64_t v3;

  mNumberOfHeaderColumns = self->mNumberOfHeaderColumns;
  if ((unsigned __int16)(self->mNumberOfColumns - mNumberOfHeaderColumns) >= 0xFFu)
    v3 = 255;
  else
    v3 = (unsigned __int16)(self->mNumberOfColumns - mNumberOfHeaderColumns);
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((v3 << 32) | ((unint64_t)self->mNumberOfRows << 48) | ((unint64_t)self->mNumberOfHeaderColumns << 16));
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)bodyRowRange
{
  uint64_t mNumberOfColumns;

  if (self->mNumberOfColumns >= 0xFFu)
    mNumberOfColumns = 255;
  else
    mNumberOfColumns = self->mNumberOfColumns;
  return ($CA3468F20078D5D2DB35E78E73CA60DA)((mNumberOfColumns << 32) | ((unint64_t)(self->mNumberOfRows
                                                                                          - (self->mNumberOfHeaderRows
                                                                                           + self->mNumberOfFooterRows)) << 48) | self->mNumberOfHeaderRows);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)headerRowRange
{
  uint64_t mNumberOfColumns;

  if (self->mNumberOfHeaderRows)
  {
    if (self->mNumberOfColumns >= 0xFFu)
      mNumberOfColumns = 255;
    else
      mNumberOfColumns = self->mNumberOfColumns;
    return ($CA3468F20078D5D2DB35E78E73CA60DA)(((unint64_t)self->mNumberOfHeaderRows << 48) | (mNumberOfColumns << 32));
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)headerColumnRange
{
  uint64_t mNumberOfHeaderColumns;

  if (self->mNumberOfHeaderColumns)
  {
    if (self->mNumberOfHeaderColumns >= 0xFFu)
      mNumberOfHeaderColumns = 255;
    else
      mNumberOfHeaderColumns = self->mNumberOfHeaderColumns;
    return ($CA3468F20078D5D2DB35E78E73CA60DA)((mNumberOfHeaderColumns << 32) | ((unint64_t)self->mNumberOfRows << 48));
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)footerRowRange
{
  int mNumberOfFooterRows;
  int mNumberOfHeaderRows;
  unsigned int mNumberOfColumns;

  mNumberOfFooterRows = self->mNumberOfFooterRows;
  if (self->mNumberOfFooterRows)
  {
    mNumberOfHeaderRows = self->mNumberOfHeaderRows;
    if (self->mNumberOfRows - mNumberOfFooterRows >= mNumberOfHeaderRows)
      LOWORD(mNumberOfHeaderRows) = self->mNumberOfRows - mNumberOfFooterRows;
    mNumberOfColumns = self->mNumberOfColumns;
    if (mNumberOfColumns >= 0xFF)
      mNumberOfColumns = 255;
    return ($CA3468F20078D5D2DB35E78E73CA60DA)((unsigned __int16)mNumberOfHeaderRows | ((unint64_t)(mNumberOfColumns | (mNumberOfFooterRows << 16)) << 32));
  }
  else
  {
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  }
}

- (BOOL)isRowHidden:(unsigned __int16)a3 forAction:(int)a4
{
  return (TSTHidingActionForRow((uint64_t)self, a3) & a4) != 0;
}

- (BOOL)isColumnHidden:(unsigned __int8)a3 forAction:(int)a4
{
  return (TSTHidingActionForColumn((uint64_t)self, a3) & a4) != 0;
}

- (int)hidingStateForRow:(unsigned __int16)a3
{
  return TSTHidingActionForRow((uint64_t)self, a3);
}

- (int)hidingStateForColumn:(unsigned __int8)a3
{
  return TSTHidingActionForColumn((uint64_t)self, a3);
}

- (unsigned)numberOfVisibleBodyRows
{
  unsigned __int16 mNumberOfHiddenRows;
  $CA3468F20078D5D2DB35E78E73CA60DA v4;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  int v6;
  $CA3468F20078D5D2DB35E78E73CA60DA v7;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v8;
  int v9;

  mNumberOfHiddenRows = self->mNumberOfHiddenRows;
  if (mNumberOfHiddenRows)
  {
    if (self->mNumberOfHeaderRows)
    {
      v4 = -[TSTTableModel headerRowRange](self, "headerRowRange");
      var0 = v4.var0;
      v6 = *(_DWORD *)&v4.var0 + *(_DWORD *)&v4.var1.var1 - 1;
      if ((unsigned __int16)(v4.var0.var0 + v4.var1.var1 - 1) >= v4.var0.var0)
      {
        do
        {
          mNumberOfHiddenRows -= TSTHidingActionForRow((uint64_t)self, var0.var0) != 0;
          ++*(_DWORD *)&var0;
        }
        while (var0.var0 <= (unsigned __int16)v6);
      }
    }
    if (self->mNumberOfFooterRows)
    {
      v7 = -[TSTTableModel footerRowRange](self, "footerRowRange");
      v8 = v7.var0;
      v9 = *(_DWORD *)&v7.var0 + *(_DWORD *)&v7.var1.var1 - 1;
      if ((unsigned __int16)(v7.var0.var0 + v7.var1.var1 - 1) >= v7.var0.var0)
      {
        do
        {
          mNumberOfHiddenRows -= TSTHidingActionForRow((uint64_t)self, v8.var0) != 0;
          ++*(_DWORD *)&v8;
        }
        while (v8.var0 <= (unsigned __int16)v9);
      }
    }
  }
  return ((unint64_t)-[TSTTableModel bodyRowRange](self, "bodyRowRange") >> 48) - mNumberOfHiddenRows;
}

- (unsigned)numberOfVisibleBodyColumns
{
  unsigned __int16 mNumberOfHiddenColumns;
  $CA3468F20078D5D2DB35E78E73CA60DA v4;
  unsigned int v5;
  unint64_t v6;

  mNumberOfHiddenColumns = self->mNumberOfHiddenColumns;
  if (mNumberOfHiddenColumns)
  {
    if (self->mNumberOfHeaderColumns)
    {
      v4 = -[TSTTableModel headerColumnRange](self, "headerColumnRange");
      v5 = *(_DWORD *)&v4.var1 + HIWORD(*(_DWORD *)&v4.var0) + 255;
      if (v4.var0.var1 <= (LOBYTE(v4.var1.var0) + v4.var0.var1 - 1))
      {
        v6 = *(unint64_t *)&v4 >> 16;
        do
        {
          mNumberOfHiddenColumns -= TSTHidingActionForColumn((uint64_t)self, v6) != 0;
          LODWORD(v6) = v6 + 1;
        }
        while (v6 <= v5);
      }
    }
  }
  return ((unint64_t)-[TSTTableModel bodyColumnRange](self, "bodyColumnRange") >> 32) - mNumberOfHiddenColumns;
}

- (BOOL)hasMergeRanges
{
  return TSTTableDataStoreHasMergeRanges((uint64_t)self->mDataStore);
}

- (id)mergedGridIndicesForDirection:(int)a3
{
  return (id)TSTTableDataStoreMergedGridIndicesForDirection((uint64_t)self->mDataStore, *(uint64_t *)&a3);
}

- (TSDFill)backgroundFill
{
  return 0;
}

- (TSDFill)bodyFill
{
  return (TSDFill *)-[TSSStyle valueForProperty:](-[TSTTableModel bodyCellStyle](self, "bodyCellStyle"), "valueForProperty:", 898);
}

- (TSDFill)headerColumnsFill
{
  return (TSDFill *)-[TSSStyle valueForProperty:](-[TSTTableModel headerColumnCellStyle](self, "headerColumnCellStyle"), "valueForProperty:", 898);
}

- (TSDFill)headerRowsFill
{
  return (TSDFill *)-[TSSStyle valueForProperty:](-[TSTTableModel headerRowCellStyle](self, "headerRowCellStyle"), "valueForProperty:", 898);
}

- (TSDFill)footerRowsFill
{
  return (TSDFill *)-[TSSStyle valueForProperty:](-[TSTTableModel footerRowCellStyle](self, "footerRowCellStyle"), "valueForProperty:", 898);
}

- (TSDStroke)borderStrokeEvenIfNotVisible
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 771);
}

- (TSDStroke)parentBorderStroke
{
  TSTTableStyle *v3;

  v3 = -[TSSStyle parent](-[TSTTableModel tableStyle](self, "tableStyle"), "parent");
  if (!v3)
    v3 = -[TSTTableModel tableStyle](self, "tableStyle");
  return (TSDStroke *)-[TSSStyle valueForProperty:](v3, "valueForProperty:", 771);
}

- (TSDStroke)bodyColumnStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 788))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 774);
  else
    return 0;
}

- (TSDStroke)bodyRowStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 789))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 773);
  else
    return 0;
}

- (TSDStroke)headerColumnBorderStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 778);
  else
    return 0;
}

- (TSDStroke)headerColumnBodyColumnStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 777);
}

- (TSDStroke)headerColumnBodyRowStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 793))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 776);
  else
    return 0;
}

- (TSDStroke)headerColumnSeparatorStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 775);
}

- (TSDStroke)headerRowBorderStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 782);
  else
    return 0;
}

- (TSDStroke)headerRowBodyColumnStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 791))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 780);
  else
    return 0;
}

- (TSDStroke)headerRowBodyRowStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 781);
}

- (TSDStroke)headerRowSeparatorStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 779);
}

- (TSDStroke)footerRowBorderStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 786);
  else
    return 0;
}

- (TSDStroke)footerRowBodyColumnStroke
{
  if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 795))
    return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 784);
  else
    return 0;
}

- (TSDStroke)footerRowBodyRowStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 785);
}

- (TSDStroke)footerRowSeparatorStroke
{
  return (TSDStroke *)-[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 783);
}

- (void)defaultStrokesForCellID:(id)a3 outTopStroke:(id *)a4 outLeftStroke:(id *)a5 outBottomStroke:(id *)a6 outRightStroke:(id *)a7
{
  uint64_t v11;
  uint64_t v12;

  v11 = a3;
  LODWORD(v12) = -[TSTTableModel tableAreaForCellID:](self, "tableAreaForCellID:", *(unsigned int *)&a3);
  -[TSTTableModel defaultStrokesForCellID:inTableWithHeaderColumns:headerRows:footerRows:totalColumns:totalRows:tableArea:outTopStroke:outLeftStroke:outBottomStroke:outRightStroke:](self, "defaultStrokesForCellID:inTableWithHeaderColumns:headerRows:footerRows:totalColumns:totalRows:tableArea:outTopStroke:outLeftStroke:outBottomStroke:outRightStroke:", v11, -[TSTTableModel numberOfHeaderColumns](self, "numberOfHeaderColumns"), -[TSTTableModel numberOfHeaderRows](self, "numberOfHeaderRows"), -[TSTTableModel numberOfFooterRows](self, "numberOfFooterRows"), -[TSTTableModel numberOfColumns](self, "numberOfColumns"), -[TSTTableModel numberOfRows](self, "numberOfRows"), v12, a4, a5, a6, a7);
}

- (void)defaultStrokesForCellID:(id)a3 inTableWithHeaderColumns:(unsigned __int16)a4 headerRows:(unsigned __int16)a5 footerRows:(unsigned __int16)a6 totalColumns:(unsigned __int16)a7 totalRows:(unsigned __int16)a8 tableArea:(unsigned int)a9 outTopStroke:(id *)a10 outLeftStroke:(id *)a11 outBottomStroke:(id *)a12 outRightStroke:(id *)a13
{
  int v13;
  unsigned __int16 var0;
  uint64_t v16;
  int v17;
  int v18;
  TSTTableStyle *v19;
  uint64_t v20;
  id v21;
  int v22;
  TSTTableStyle *v23;
  uint64_t v24;
  id v25;
  TSTTableStyle *v26;
  uint64_t v27;
  id v28;
  TSTTableStyle *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  TSTTableStyle *v34;
  uint64_t v35;
  id v36;
  id v37;
  BOOL v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int v43;

  v13 = a8;
  v43 = a7;
  var0 = a3.var0;
  v16 = *(_QWORD *)&a3.var0 >> 16;
  v17 = a5;
  v18 = a4;
  switch(a9)
  {
    case 0u:
      if (!a10)
        goto LABEL_57;
      v26 = -[TSTTableModel tableStyle](self, "tableStyle");
      if (v17 == var0 && v17)
      {
        v27 = 779;
LABEL_41:
        v31 = -[TSSStyle valueForProperty:](v26, "valueForProperty:", v27);
        goto LABEL_56;
      }
      if (-[TSSStyle intValueForProperty:](v26, "intValueForProperty:", 789))
      {
        v26 = -[TSTTableModel tableStyle](self, "tableStyle");
        v27 = 773;
        goto LABEL_41;
      }
      v31 = 0;
LABEL_56:
      *a10 = v31;
LABEL_57:
      if (a12)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 789))
        {
          v33 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 773);
        }
        else
        {
          v33 = 0;
        }
        *a12 = v33;
      }
      if (!a11)
        goto LABEL_71;
      v34 = -[TSTTableModel tableStyle](self, "tableStyle");
      if (v18 && v16 == v18)
      {
        v35 = 775;
LABEL_68:
        v36 = -[TSSStyle valueForProperty:](v34, "valueForProperty:", v35);
        goto LABEL_70;
      }
      if (-[TSSStyle intValueForProperty:](v34, "intValueForProperty:", 788))
      {
        v34 = -[TSTTableModel tableStyle](self, "tableStyle");
        v35 = 774;
        goto LABEL_68;
      }
      v36 = 0;
LABEL_70:
      *a11 = v36;
LABEL_71:
      if (a13)
      {
        if (!-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 788))goto LABEL_75;
        v29 = -[TSTTableModel tableStyle](self, "tableStyle");
        v30 = 774;
        goto LABEL_74;
      }
LABEL_77:
      if (a10)
        v38 = var0 == 0;
      else
        v38 = 0;
      if (v38)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
        {
          v39 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 771);
        }
        else
        {
          v39 = 0;
        }
        *a10 = v39;
      }
      if (a12 && var0 == v13 - 1)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
        {
          v40 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 771);
        }
        else
        {
          v40 = 0;
        }
        *a12 = v40;
      }
      if (a11 && !(_BYTE)v16)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
        {
          v41 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 771);
        }
        else
        {
          v41 = 0;
        }
        *a11 = v41;
      }
      if (a13 && v16 == v43 - 1)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 796))
        {
          v42 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 771);
        }
        else
        {
          v42 = 0;
        }
        *a13 = v42;
      }
      return;
    case 1u:
    case 4u:
      if (a10)
        *a10 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 781);
      if (a12)
      {
        v19 = -[TSTTableModel tableStyle](self, "tableStyle");
        if (v17 - 1 == var0)
          v20 = 779;
        else
          v20 = 781;
        *a12 = -[TSSStyle valueForProperty:](v19, "valueForProperty:", v20);
      }
      if (a11)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 791))
        {
          v21 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 780);
        }
        else
        {
          v21 = 0;
        }
        *a11 = v21;
      }
      if (a13)
      {
        if (!-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 791))goto LABEL_75;
        v29 = -[TSTTableModel tableStyle](self, "tableStyle");
        v30 = 780;
        goto LABEL_74;
      }
      goto LABEL_77;
    case 2u:
      if (a10)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 793))
        {
          v28 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 776);
        }
        else
        {
          v28 = 0;
        }
        *a10 = v28;
      }
      if (a12)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 793))
        {
          v32 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 776);
        }
        else
        {
          v32 = 0;
        }
        *a12 = v32;
      }
      if (a11)
        *a11 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 777);
      if (a13)
      {
        v29 = -[TSTTableModel tableStyle](self, "tableStyle");
        if (v18 - 1 == v16)
          v30 = 775;
        else
          v30 = 777;
        goto LABEL_74;
      }
      goto LABEL_77;
    case 3u:
    case 5u:
      if (a10)
      {
        v22 = a8 - a6;
        v23 = -[TSTTableModel tableStyle](self, "tableStyle");
        if (v22 == var0)
          v24 = 783;
        else
          v24 = 785;
        *a10 = -[TSSStyle valueForProperty:](v23, "valueForProperty:", v24);
      }
      if (a12)
        *a12 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 785);
      if (a11)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 795))
        {
          v25 = -[TSSStyle valueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "valueForProperty:", 784);
        }
        else
        {
          v25 = 0;
        }
        *a11 = v25;
      }
      if (a13)
      {
        if (-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](self, "tableStyle"), "intValueForProperty:", 795))
        {
          v29 = -[TSTTableModel tableStyle](self, "tableStyle");
          v30 = 784;
LABEL_74:
          v37 = -[TSSStyle valueForProperty:](v29, "valueForProperty:", v30);
        }
        else
        {
LABEL_75:
          v37 = 0;
        }
        *a13 = v37;
      }
      goto LABEL_77;
    default:
      goto LABEL_77;
  }
}

- (id)cellRegionWithConditionalStyleMatchingCell:(id)a3
{
  unint64_t v3;
  UInt8 *v5;
  uint64_t v6;
  unsigned int *Element;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  TSTEphemeralCellMap *v12;
  TSTCellIterator *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int *v17;
  void *v18;
  uint64_t v19;
  id v21;
  unint64_t v23;
  unint64_t v24;
  char v25[4];
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;

  v5 = TSTTableDataStoreCellStorageRefAtCellID((uint64_t)-[TSTTableModel dataStore](self, "dataStore"), *(_DWORD *)&a3);
  if (!v5)
    return 0;
  if ((v5[5] & 4) != 0)
  {
    Element = (unsigned int *)TSTCellStorageGetElement((uint64_t)v5, 1024);
    if (!Element)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSTTableDataListKey TSTCellStorageConditionalStyleSetID(TSTCellStorage *)");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStorage.h"), 212, CFSTR("Can't get conditional style ID storage element!"));
    }
    v6 = *Element;
  }
  else
  {
    v6 = 0;
  }
  v10 = TSTTableDataStoreConditionalStyleRefCountForKey((uint64_t)-[TSTTableModel dataStore](self, "dataStore"), v6);
  if (!(_DWORD)v6)
    return 0;
  v11 = v10;
  v12 = -[TSTEphemeralCellMap initWithCapacity:]([TSTEphemeralCellMap alloc], "initWithCapacity:", -[TSTTableModel numberOfRows](self, "numberOfRows")* (unint64_t)-[TSTTableModel numberOfColumns](self, "numberOfColumns"));
  v13 = -[TSTCellIterator initWithTableModel:region:flags:]([TSTCellIterator alloc], "initWithTableModel:region:flags:", self, +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", -[TSTTableModel range](self, "range")), 34);
  if (TSTCellIteratorGetNextCell(v13, v25))
  {
    v14 = v11;
    if (v11)
    {
      v15 = 0;
      do
      {
        if (!v27)
          goto LABEL_20;
        if ((*(_BYTE *)(v27 + 5) & 4) != 0)
        {
          v17 = (int *)TSTCellStorageGetElement(v27, 1024);
          if (!v17)
          {
            v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSTTableDataListKey TSTCellStorageConditionalStyleSetID(TSTCellStorage *)");
            objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStorage.h"), 212, CFSTR("Can't get conditional style ID storage element!"));
          }
          v16 = *v17;
        }
        else
        {
          v16 = 0;
        }
        if (v16 == (_DWORD)v6)
        {
          v3 = v3 & 0xFFFFFFFF00000000 | v26;
          -[TSTEphemeralCellMap addCell:andCellID:](v12, "addCell:andCellID:", 0, v3);
          ++v15;
        }
        else
        {
LABEL_20:
          if ((_WORD)v28 != 0xFFFF
            && (v28 & 0xFF0000) != 0xFF0000
            && v29 >= 0x10000
            && (unsigned __int16)v29 != 0
            && ((v26 ^ v28) & 0xFFFFFF) != 0)
          {
            v24 = v24 & 0xFFFFFFFF00000000 | v28;
            if (-[TSTEphemeralCellMap containsCellID:](v12, "containsCellID:"))
            {
              v23 = v23 & 0xFFFFFFFF00000000 | v26;
              -[TSTEphemeralCellMap addCell:andCellID:](v12, "addCell:andCellID:", 0);
            }
          }
        }
      }
      while (TSTCellIteratorGetNextCell(v13, v25) && v15 < v14);
    }
  }

  v21 = +[TSTCellRegion regionFromCellMap:](TSTCellRegion, "regionFromCellMap:", v12);
  return v21;
}

- (void)mapTableStylesToStylesheet:(id)a3 withMapper:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  TSTTableStyleNetwork *v12;

  v6 = +[TSTTableStyleNetwork networkFromTableModel:](TSTTableStyleNetwork, "networkFromTableModel:", self);
  v12 = -[TSTTableStyleNetwork initWithContext:]([TSTTableStyleNetwork alloc], "initWithContext:", -[TSPObject context](self, "context"));
  -[TSTTableStyleNetwork setPresetIndex:](v12, "setPresetIndex:", objc_msgSend(v6, "presetIndex"));
  -[TSTTableStyleNetwork setTableStyle:](v12, "setTableStyle:", objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "tableStyle")));
  objc_opt_class();
  objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "tableNameStyle"));
  -[TSTTableStyleNetwork setTableNameStyle:](v12, "setTableNameStyle:", TSUDynamicCast());
  -[TSTTableStyleNetwork setTableNameShapeStyle:](v12, "setTableNameShapeStyle:", objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "tableNameShapeStyle")));
  v7 = 0;
  do
  {
    -[TSTTableStyleNetwork setCellStyle:forTableArea:](v12, "setCellStyle:forTableArea:", objc_msgSend(a4, "mappedStyleForStyle:", objc_msgSend(v6, "cellStyleForTableArea:", v7)), v7);
    v8 = objc_msgSend(v6, "textStyleForTableArea:", v7);
    objc_opt_class();
    objc_msgSend(a4, "mappedStyleForStyle:", v8);
    v9 = TSUDynamicCast();
    if (!v9)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTTableModel mapTableStylesToStylesheet:withMapper:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableModel.mm"), 5402, CFSTR("invalid nil value for '%s'"), "targetStyle");
    }
    -[TSTTableStyleNetwork setTextStyle:forTableArea:](v12, "setTextStyle:forTableArea:", v9, v7);
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 4);
  -[TSTTableModel resetStyles:](self, "resetStyles:", v12);

}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  unint64_t v4;
  TSTCellIterator *v7;
  TSTEphemeralCellMap *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29[4];
  unsigned int v30;
  uint64_t v31;

  -[TSTTableModel mapTableStylesToStylesheet:withMapper:](self, "mapTableStylesToStylesheet:withMapper:");
  -[TSTTableModel setupDefaultCells](self, "setupDefaultCells");
  v7 = -[TSTCellIterator initWithTableModel:flags:]([TSTCellIterator alloc], "initWithTableModel:flags:", self, 48);
  v8 = -[TSTEphemeralCellMap initWithCapacity:]([TSTEphemeralCellMap alloc], "initWithCapacity:", self->mNumberOfColumns * (unint64_t)self->mNumberOfRows);
  if (TSTCellIteratorGetNextCell(v7, v29))
  {
    do
    {
      v9 = v31;
      if (v31)
      {
        v10 = *(_QWORD *)(v31 + 40);
        v11 = v10 != 0;
        if (v10)
        {
          v12 = objc_msgSend(a4, "mappedStyleForStyle:");
          v13 = *(void **)(v9 + 40);
          if (v13 != (void *)v12)
          {
            v14 = (void *)v12;

            *(_QWORD *)(v9 + 40) = v14;
            *(_DWORD *)(v9 + 32) = 0;
          }
        }
        v15 = *(_QWORD *)(v9 + 56);
        if (v15)
        {
          objc_opt_class();
          objc_msgSend(a4, "mappedStyleForStyle:", v15);
          v16 = TSUDynamicCast();
          v17 = *(void **)(v9 + 56);
          if (v17 != (void *)v16)
          {
            v18 = (void *)v16;

            *(_QWORD *)(v9 + 56) = v18;
            *(_DWORD *)(v9 + 48) = 0;
          }
        }
        v19 = *(void **)(v9 + 72);
        if (v19 || *(_DWORD *)(v9 + 64))
          objc_msgSend((id)objc_msgSend(v19, "storage"), "adoptStylesheet:withMapper:", a3, a4);
        if (v11)
        {
LABEL_16:
          v4 = v4 & 0xFFFFFFFF00000000 | v30;
          -[TSTEphemeralCellMap addCell:andCellID:](v8, "addCell:andCellID:", v9, v4);
          continue;
        }
      }
      else
      {
        v15 = 0;
      }
      if (v15)
        goto LABEL_16;
    }
    while ((TSTCellIteratorGetNextCell(v7, v29) & 1) != 0);
  }
  TSTTableSetCellsWithCellMapIgnoringFormulas((uint64_t)self, v8);

  if (-[TSTTableModel numberOfRows](self, "numberOfRows"))
  {
    v20 = 0;
    do
    {
      v21 = TSTTableDataStoreHeaderInfoForRow((uint64_t)self->mDataStore, v20, 0, 0);
      if (v21)
      {
        v22 = v21;
        if (*(_QWORD *)(v21 + 8))
        {
          v23 = *(_QWORD *)(v21 + 16);
          *(_QWORD *)(v21 + 8) = (id)objc_msgSend(a4, "mappedStyleForStyle:");
          *(_QWORD *)(v22 + 16) = (id)objc_msgSend(a4, "mappedStyleForStyle:", v23);
        }
      }
      ++v20;
    }
    while (-[TSTTableModel numberOfRows](self, "numberOfRows") > v20);
  }
  if (-[TSTTableModel numberOfColumns](self, "numberOfColumns"))
  {
    v24 = 0;
    do
    {
      v25 = TSTTableDataStoreHeaderInfoForColumn((uint64_t)self->mDataStore, v24, 0, 0);
      if (v25)
      {
        v26 = v25;
        if (*(_QWORD *)(v25 + 8))
        {
          v27 = *(_QWORD *)(v25 + 16);
          *(_QWORD *)(v25 + 8) = (id)objc_msgSend(a4, "mappedStyleForStyle:");
          *(_QWORD *)(v26 + 16) = (id)objc_msgSend(a4, "mappedStyleForStyle:", v27);
        }
      }
      ++v24;
    }
    while (-[TSTTableModel numberOfColumns](self, "numberOfColumns") > v24);
  }
}

- (void)validateStyles
{
  TSTCellIterator *v3;
  void *v4;
  char v5[8];
  uint64_t v6;

  -[TSTTableStyle validate](-[TSTTableModel tableStyle](self, "tableStyle"), "validate");
  -[TSTCellStyle validate](-[TSTTableModel bodyCellStyle](self, "bodyCellStyle"), "validate");
  -[TSTCellStyle validate](-[TSTTableModel headerRowCellStyle](self, "headerRowCellStyle"), "validate");
  -[TSTCellStyle validate](-[TSTTableModel headerColumnCellStyle](self, "headerColumnCellStyle"), "validate");
  -[TSTCellStyle validate](-[TSTTableModel footerRowCellStyle](self, "footerRowCellStyle"), "validate");
  v3 = -[TSTCellIterator initWithTableModel:]([TSTCellIterator alloc], "initWithTableModel:", self);
  if (TSTCellIteratorGetNextCell(v3, v5))
  {
    do
    {
      if (v6)
        v4 = *(void **)(v6 + 40);
      else
        v4 = 0;
      objc_msgSend(v4, "validate");
    }
    while ((TSTCellIteratorGetNextCell(v3, v5) & 1) != 0);
  }

}

- ($CA3468F20078D5D2DB35E78E73CA60DA)minPopulatedCellRange
{
  uint64_t v2;
  unsigned __int16 v3;
  unsigned int mNumberOfColumns;
  int mNumberOfRows;
  int mNumberOfFooterRows;
  TSTCellIterator *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int v18;
  unint64_t v19;
  BOOL v20;
  void *v23;
  uint64_t v24;
  char v26[4];
  unsigned __int16 v27;
  unsigned __int8 v28;
  uint64_t v29;
  unint64_t v30;

  v2 = self->mNumberOfHeaderRows + 1;
  if ((unsigned __int16)(self->mNumberOfHeaderColumns + 1) >= 0xFFu)
    v3 = 255;
  else
    v3 = self->mNumberOfHeaderColumns + 1;
  mNumberOfColumns = self->mNumberOfColumns;
  mNumberOfRows = self->mNumberOfRows;
  if (mNumberOfColumns >= 0xFF)
    mNumberOfColumns = 255;
  mNumberOfFooterRows = self->mNumberOfFooterRows;
  v7 = -[TSTCellIterator initWithTableModel:range:flags:]([TSTCellIterator alloc], "initWithTableModel:range:flags:", self, (unint64_t)(mNumberOfColumns | (mNumberOfRows << 16)) << 32, 33);
  if (TSTCellIteratorGetNextCell(v7, v26))
  {
    while (1)
    {
      v8 = v29;
      if (!v29)
        goto LABEL_24;
      v9 = *(_DWORD *)(v29 + 8);
      v10 = *(_DWORD *)(v29 + 104);
      if (v10 == 267 && BYTE1(v9) == 2)
        break;
      if (v10 == 263 && BYTE1(v9) == 6)
      {
        if (!BYTE1(v9))
          goto LABEL_46;
        if (BYTE1(v9) != 6)
        {
          v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSTCellBoolValue(TSTCell *)");
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 925, CFSTR("can't get BOOL value from non-BOOL cell: %p"), v8);
          goto LABEL_46;
        }
        goto LABEL_22;
      }
      if (BYTE1(v9) != 3)
        goto LABEL_23;
      v13 = v29;
LABEL_26:
      v16 = (void *)NSStringFromNativeTSTCell(v13);
      if (v16 && objc_msgSend(v16, "length"))
      {
LABEL_28:
        v17 = v27;
        v18 = v28;
        if ((_WORD)v30 != 0xFFFF)
        {
          v19 = HIWORD(v30);
          v20 = (v30 & 0xFF0000) == 0xFF0000 || v19 == 0;
          if (!v20 && (v30 & 0xFFFF00000000) != 0)
          {
            v18 = ((v30 + ((v30 >> 16) & 0xFF0000) + 16711680) >> 16);
            v17 = v30 + 0xFFFF + v19;
          }
        }
        if ((unsigned __int16)v17 >= (unsigned __int16)v2
          && ~mNumberOfFooterRows + mNumberOfRows >= (unsigned __int16)v17)
        {
          v2 = (v17 + 1);
        }
        else
        {
          v2 = v2;
        }
        if (v18 >= v3)
          v3 = v18 + 1;
      }
LABEL_46:
      if ((TSTCellIteratorGetNextCell(v7, v26) & 1) == 0)
        goto LABEL_47;
    }
    if ((*(_DWORD *)(v29 + 8) & 0xFB00) != 0x200)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, CFSTR("can't get value from non-value cell: %p"), v8);
      goto LABEL_46;
    }
LABEL_22:
    if (*(double *)(v29 + 16) == 0.0)
      goto LABEL_46;
LABEL_23:
    if (*(_BYTE *)(v29 + 9))
      goto LABEL_28;
LABEL_24:
    if ((TSTCellIteratorCellHasCommentStorage((uint64_t)v26) & 1) != 0)
      goto LABEL_28;
    v13 = v29;
    goto LABEL_26;
  }
LABEL_47:

  return ($CA3468F20078D5D2DB35E78E73CA60DA)((v2 << 48) | ((unint64_t)v3 << 32));
}

- (void)p_scaleStrokeFromProperty:(int)a3 style:(id)a4 pmap:(id)a5 scale:(double)a6
{
  uint64_t v8;
  void *v9;
  double v10;
  id v11;

  v8 = *(_QWORD *)&a3;
  v9 = (void *)objc_msgSend((id)objc_msgSend(a4, "valueForProperty:"), "mutableCopy");
  if (v9)
  {
    v11 = v9;
    objc_msgSend(v9, "width");
    objc_msgSend(v11, "setWidth:", v10 * a6);
    objc_msgSend(a5, "setObject:forProperty:", v11, v8);

  }
}

- (void)p_scaleStrokesOnCell:(id)a3 atCellID:(id)a4 transformedObjects:(id)a5 scale:(double)a6
{
  uint64_t v11;
  void *v12;
  TSSPropertyMap *v13;
  id v14;
  id v15;
  void *v16;

  if (a3)
  {
    v11 = *((_QWORD *)a3 + 5);
    v12 = (void *)objc_msgSend(a5, "objectForKey:", v11);
    if (!v12)
    {
      if (!v11)
        return;
      v13 = objc_alloc_init(TSSPropertyMap);
      -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 899, v11, v13, a6);
      -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 900, v11, v13, a6);
      -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 901, v11, v13, a6);
      -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 902, v11, v13, a6);
      v14 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSKDocumentRoot stylesheet](-[TSTTableModel documentRoot](self, "documentRoot"), "stylesheet"), "variationOfStyle:propertyMap:", v11, v13);

      v15 = (id)*((_QWORD *)a3 + 5);
      if (v15 != v14)
      {

        *((_QWORD *)a3 + 5) = v14;
        *((_DWORD *)a3 + 8) = 0;
      }
      if (v14)
        objc_msgSend(a5, "setObject:forKey:", v14, v11);
      goto LABEL_11;
    }
  }
  else
  {
    v12 = (void *)objc_msgSend(a5, "objectForKey:", a6);
    if (!v12)
      return;
  }
  v16 = (void *)*((_QWORD *)a3 + 5);
  if (v16 != v12)
  {

    *((_QWORD *)a3 + 5) = v12;
    *((_DWORD *)a3 + 8) = 0;
  }
LABEL_11:
  TSTTableSetCellAtCellIDIgnoringFormula((uint64_t)self, a3, *(_DWORD *)&a4);
}

- (void)transformStrokes:(CGAffineTransform *)a3 transformedObjects:(id)a4 inBounds:(CGRect)a5
{
  TSTTableStyle *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  TSTCellIterator *v12;
  char v13[4];
  unsigned int v14;
  uint64_t v15;

  if (!objc_msgSend(a4, "objectForKey:", self, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))
  {
    objc_msgSend(a4, "setObject:forUncopiedKey:", self, self);
    v8 = -[TSTTableModel tableStyle](self, "tableStyle");
    v9 = objc_msgSend(a4, "objectForKey:", v8);
    v10 = fmin(a3->a, a3->d);
    if (v8 != (TSTTableStyle *)v9)
    {
      v11 = v9;
      if (!v9)
      {
        a3 = objc_alloc_init(TSSPropertyMap);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 773, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 774, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 771, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 772, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 781, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 780, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 782, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 779, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 776, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 777, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 778, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 775, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 785, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 784, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 786, v8, a3, v10);
        -[TSTTableModel p_scaleStrokeFromProperty:style:pmap:scale:](self, "p_scaleStrokeFromProperty:style:pmap:scale:", 783, v8, a3, v10);
        v11 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSSStyle stylesheet](v8, "stylesheet"), "variationOfStyle:propertyMap:", v8, a3);

        if (v8)
        {
          if (v11)
            objc_msgSend(a4, "setObject:forKey:", v11, v8);
        }
      }
      -[TSTTableModel setTableStyle:](self, "setTableStyle:", v11);
    }
    v12 = -[TSTCellIterator initWithTableModel:range:]([TSTCellIterator alloc], "initWithTableModel:range:", self, -[TSTTableModel range](self, "range"));
    if (TSTCellIteratorGetNextCell(v12, v13))
    {
      do
      {
        a3 = (CGAffineTransform *)((unint64_t)a3 & 0xFFFFFFFF00000000 | v14);
        -[TSTTableModel p_scaleStrokesOnCell:atCellID:transformedObjects:scale:](self, "p_scaleStrokesOnCell:atCellID:transformedObjects:scale:", v15, a3, a4, v10);
      }
      while ((TSTCellIteratorGetNextCell(v12, v13) & 1) != 0);
    }

  }
}

- (void)upgradeFromPreUFF
{
  unint64_t v2;
  $958D8658F995D5F558D0698922444091 *p_mStyles;
  unint64_t v5;
  TSTEphemeralCellMap *v6;
  TSTCellIterator *v7;
  TSTCell *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSString *v15;
  int mPrivate;
  NSString *mString;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  TSTRichTextPayload *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  TSWPParagraphStyle *v27;
  TSWPParagraphStyle *mTextStyle;
  TSWPParagraphStyle *v29;
  TSSStylesheet *v30;
  id v31;
  TSTCellIterator *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  TSTEphemeralCellMap *v38;
  TSTEphemeralCellMap *v39;
  int v40[10];
  _QWORD v41[8];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _OWORD v45[2];
  uint64_t v46;

  p_mStyles = &self->mStyles;
  if (!self->mStyles.tableNameStyle)
  {
    -[TSPObject willModifyForUpgrade](self, "willModifyForUpgrade");
    p_mStyles->tableNameStyle = (TSWPParagraphStyle *)(id)objc_msgSend(+[TSTTableStyleNetwork networkFromTheme:presetIndex:](TSTTableStyleNetwork, "networkFromTheme:presetIndex:", -[TSKDocumentRoot theme](-[TSTTableModel documentRoot](self, "documentRoot"), "theme"), self->mPresetIndex), "tableNameStyle");
  }
  if (!p_mStyles->tableNameShapeStyle)
  {
    -[TSPObject willModifyForUpgrade](self, "willModifyForUpgrade");
    p_mStyles->tableNameShapeStyle = (TSWPShapeStyle *)(id)objc_msgSend(+[TSTTableStyleNetwork networkFromTheme:presetIndex:](TSTTableStyleNetwork, "networkFromTheme:presetIndex:", -[TSKDocumentRoot theme](-[TSTTableModel documentRoot](self, "documentRoot"), "theme"), self->mPresetIndex), "tableNameShapeStyle");
  }
  if (self->mDeprecatedProvider)
  {
    v5 = [TSTEphemeralCellMap alloc];
    v6 = (TSTEphemeralCellMap *)objc_msgSend((id)v5, "initWithCapacity:", -[TSTTableModel numberOfColumns](self, "numberOfColumns")* (unint64_t)-[TSTTableModel numberOfRows](self, "numberOfRows"));
    v7 = -[TSTCellIterator initWithTableModel:flags:]([TSTCellIterator alloc], "initWithTableModel:flags:", self, 289);
    v8 = objc_alloc_init(TSTCell);
    TSTCellClear((uint64_t)v8);
    if (TSTCellIteratorGetNextCell(v7, (const char *)v45))
    {
      v38 = v6;
      do
      {
        v9 = (void *)MEMORY[0x219A15874]();
        if (*((_QWORD *)&v45[0] + 1) && *(unsigned __int8 *)(*((_QWORD *)&v45[0] + 1) + 9) << 8 == 1024)
        {
          TSTCellCopy(*((uint64_t *)&v45[0] + 1), (uint64_t)v8);
          v2 = v2 & 0xFFFFFFFF00000000 | DWORD1(v45[0]);
          v10 = -[TSWPStorage rangeForCellID:includingBreak:](self->mDeprecatedProvider, "rangeForCellID:includingBreak:");
          if (v11)
          {
            v12 = v10;
            v13 = v11;
            v14 = -[TSWPStorage newSubstorageWithRange:context:flags:kind:](self->mDeprecatedProvider, "newSubstorageWithRange:context:flags:kind:", v10, v11, -[TSPObject context](self, "context"), 0, 5);
            v39 = (TSTEphemeralCellMap *)v5;
            if (objc_msgSend(v14, "canBeStoredInAStringValueCell"))
            {
              TSTCellClearValue((uint64_t)v8);
              *((_BYTE *)&v8->mPrivate + 1) = 3;
              v15 = (NSString *)objc_msgSend(v14, "stringValue");
              mPrivate = (int)v8->mPrivate;
              if ((mPrivate & 0xFF00) == 0)
              {
                TSTCellClearValue((uint64_t)v8);
                *((_BYTE *)&v8->mPrivate + 1) = 3;
                mPrivate = (int)v8->mPrivate;
              }
              if ((mPrivate & 0xFF00) == 0x300)
              {
                mString = v8->mPrivate.mValue.mString.mString;
                if (mString != v15)
                {

                  v8->mPrivate.mValue.mString.mString = v15;
                  v18 = HIWORD(*(_DWORD *)&v8->mPrivate);
                  v19 = -[NSString rangeOfCharacterFromSet:](v15, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet"));
                  v20 = v18 | 1;
                  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
                    v20 = v18 & 0xFFFE;
                  *((_WORD *)&v8->mPrivate + 1) = v20;
                  v8->mPrivate.mValue.mString.mID = 0;
                }
              }
              else
              {
                v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void TSTCellSetStringValueClearingID(TSTCell *, NSString *, BOOL)");
                objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 1003, CFSTR("can't set string on non-string cell: %p"), v8);
              }
              v25 = (void *)objc_msgSend(v14, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0);
              v5 = (unint64_t)v39;
              if (v25)
              {
                v26 = objc_msgSend(v25, "propertyMap");
                v27 = -[TSSStylesheet variationOfStyle:propertyMap:](-[TSKDocumentRoot stylesheet](-[TSTTableModel documentRoot](self, "documentRoot"), "stylesheet"), "variationOfStyle:propertyMap:", -[TSTTableModel defaultTextStyleForTableArea:](self, "defaultTextStyleForTableArea:", -[TSTTableModel tableAreaForCellID:](self, "tableAreaForCellID:", DWORD1(v45[0]))), v26);
                mTextStyle = v8->mPrivate.mTextStyle;
                if (mTextStyle != v27)
                {
                  v29 = v27;

                  v8->mPrivate.mTextStyle = v29;
                  v8->mPrivate.mTextStyleID = 0;
                }
              }
            }
            else
            {
              v21 = -[TSWPStorage newSubstorageWithRange:context:flags:kind:](self->mDeprecatedProvider, "newSubstorageWithRange:context:flags:kind:", v12, v13, -[TSPObject context](self, "context"), 0, 5);
              objc_msgSend(v21, "willBeAddedToDocumentRoot:dolcContext:", -[TSTTableModel documentRoot](self, "documentRoot"), 0);
              objc_msgSend(v21, "wasAddedToDocumentRoot:dolcContext:", -[TSTTableModel documentRoot](self, "documentRoot"), 0);
              v22 = -[TSTRichTextPayload initWithStorage:]([TSTRichTextPayload alloc], "initWithStorage:", v21);
              TSTCellClearValue((uint64_t)v8);
              *((_BYTE *)&v8->mPrivate + 1) = 9;
              TSTCellSetRichTextPayloadClearingIDConvertToPlaintext((TSTRichTextPayload *)v8, v22, 1, 1);

              v5 = (unint64_t)v39;
            }

            v40[0] = 260;
            TSTCellSetExplicitFormat((uint64_t)v8, (uint64_t)v40);
            v6 = v38;
          }
          else
          {
            TSTCellClearValue((uint64_t)v8);
            TSTCellClearValue((uint64_t)v8);
            *(_DWORD *)&v8->mPrivate &= 0xFFFF00FF;
          }
          v5 = v5 & 0xFFFFFFFF00000000 | DWORD1(v45[0]);
          -[TSTEphemeralCellMap addCell:andCellID:](v6, "addCell:andCellID:", v8, v5);
        }
        objc_autoreleasePoolPop(v9);
      }
      while ((TSTCellIteratorGetNextCell(v7, (const char *)v45) & 1) != 0);
    }

    TSTTableSetCellsWithCellMapIgnoringFormulas((uint64_t)self, v6);
    self->mDeprecatedProvider = 0;
  }
  else
  {
    v30 = -[TSKDocumentRoot stylesheet](-[TSTTableModel documentRoot](self, "documentRoot"), "stylesheet");
    v31 = +[TSTTableStyleNetwork networkFromTableModel:](TSTTableStyleNetwork, "networkFromTableModel:", self);
    v32 = -[TSTCellIterator initWithTableModel:flags:]([TSTCellIterator alloc], "initWithTableModel:flags:", self, 48);
    if (-[TSTCellIterator getNext:](v32, "getNext:", v45))
    {
      v33 = MEMORY[0x24BDAC760];
      do
      {
        if (*((_QWORD *)&v45[0] + 1))
        {
          v34 = *(void **)(*((_QWORD *)&v45[0] + 1) + 72);
          if (v34)
          {
            v35 = (void *)objc_msgSend(v34, "storage");
            v36 = objc_msgSend(v35, "range");
            v41[0] = v33;
            v41[1] = 3221225472;
            v41[2] = __34__TSTTableModel_upgradeFromPreUFF__block_invoke;
            v41[3] = &unk_24D82F348;
            v41[4] = v30;
            v41[5] = v31;
            v42 = v45[0];
            v43 = v45[1];
            v44 = v46;
            v41[6] = self;
            v41[7] = v35;
            objc_msgSend(v35, "enumerateWithAttributeKind:inRange:usingBlock:", 0, v36, v37, v41);
          }
        }
      }
      while (-[TSTCellIterator getNext:](v32, "getNext:", v45));
    }

  }
}

uint64_t __34__TSTTableModel_upgradeFromPreUFF__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (!objc_msgSend(a2, "stylesheet"))
    return objc_msgSend(*(id *)(a1 + 56), "setParagraphStyle:forCharRange:undoTransaction:", objc_msgSend(*(id *)(a1 + 32), "variationOfStyle:propertyMap:", objc_msgSend(*(id *)(a1 + 40), "textStyleForTableArea:", objc_msgSend(*(id *)(a1 + 48), "tableAreaForCellID:", *(unsigned int *)(a1 + 68))), objc_msgSend(a2, "propertyMap")), a3, a4, 0);
  result = objc_msgSend(a2, "stylesheet");
  if (result == *(_QWORD *)(a1 + 32))
  {
    result = objc_msgSend(a2, "parent");
    if (!result)
      return objc_msgSend(*(id *)(a1 + 56), "setParagraphStyle:forCharRange:undoTransaction:", objc_msgSend(*(id *)(a1 + 32), "variationOfStyle:propertyMap:", objc_msgSend(*(id *)(a1 + 40), "textStyleForTableArea:", objc_msgSend(*(id *)(a1 + 48), "tableAreaForCellID:", *(unsigned int *)(a1 + 68))), objc_msgSend(a2, "propertyMap")), a3, a4, 0);
  }
  return result;
}

- (id)allRichTextPayloadStorages
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(-[TSTTableModel dataStore](self, "dataStore") + 96), "object"), "allRichTextPayloadStorages");
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2);
}

- (unsigned)numberOfHiddenRows
{
  return self->mNumberOfHiddenRows;
}

- (unsigned)numberOfHiddenColumns
{
  return self->mNumberOfHiddenColumns;
}

- (unsigned)numberOfUserHiddenRows
{
  return self->mNumberOfUserHiddenRows;
}

- (unsigned)numberOfUserHiddenColumns
{
  return self->mNumberOfUserHiddenColumns;
}

- (BOOL)wasUnarchivedFromAProvidedTable
{
  return self->mWasUnarchivedFromAProvidedTable;
}

- (void)setWasUnarchivedFromAProvidedTable:(BOOL)a3
{
  self->mWasUnarchivedFromAProvidedTable = a3;
}

- (TSTCellDictionary)cellsPendingWrite
{
  return self->mCellsPendingWrite;
}

@end
