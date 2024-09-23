@implementation TSTMasterLayout

- (TSTTableModel)tableModel
{
  return -[TSTTableInfo tableModel](self->mTableInfo, "tableModel");
}

- (void)setChangeNotifier:(id)a3
{
  id v5;

  if (!self->mChangeNotifier)
  {
    self->mChangeNotifier = (TSKChangeNotifier *)a3;
    v5 = a3;
    objc_msgSend(a3, "addObserver:forChangeSource:", self, self->mTableInfo);
  }
}

- (BOOL)emptyFilteredTable
{
  return self->mEmptyFilteredTable && !self->mProcessHiddenRowsForExport;
}

- (void)setProcessHiddenRowsForExport:(BOOL)a3
{
  self->mProcessHiddenRowsForExport = a3;
  TSTMasterLayoutInvalidateStrokeRange(self, -[TSTTableModel range](-[TSTMasterLayout tableModel](self, "tableModel"), "range"));
}

- (TSTMasterLayout)initWithInfo:(id)a3
{
  TSTMasterLayout *v4;
  uint64_t v5;
  $6C2899CC353BE70625C5C4ACBB5C74E2 *p_mDynamicHidingContent;
  dispatch_semaphore_t v7;
  id v8;
  __int128 v9;
  TSTHiddenRowsColumnsCache *v10;
  uint64_t TableNumberOfColumns;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSTMasterLayout;
  v4 = -[TSTMasterLayout init](&v14, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    p_mDynamicHidingContent = &v4->mDynamicHidingContent;
    v4->mTableInfo = (TSTTableInfo *)a3;
    v4->mCellIDToWPColumnCache = -[TSUConcurrentCache initWithName:]([TSTWPColumnCache alloc], "initWithName:", CFSTR("cell id to wp column $"));
    *(_QWORD *)(v5 + 40) = -[TSUConcurrentCache initWithName:]([TSTDupContentCache alloc], "initWithName:", CFSTR("dup $"));
    *(_QWORD *)(v5 + 48) = -[TSUConcurrentCache initWithName:]([TSTWPColumnCache alloc], "initWithName:", CFSTR("temp wp column $"));
    *(_QWORD *)(v5 + 56) = -[TSTWidthHeightCache initWithNumRows:andNumCols:]([TSTWidthHeightCache alloc], "initWithNumRows:andNumCols:", objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfRows"), objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfColumns"));
    *(_QWORD *)(v5 + 64) = objc_msgSend(objc_alloc(MEMORY[0x24BEB3CF8]), "initWithIdentifier:", CFSTR("TSTWHCacheQueue"));
    *(_QWORD *)(v5 + 88) = dispatch_group_create();
    *(_QWORD *)(v5 + 112) = 0xA0000000ALL;
    v7 = dispatch_semaphore_create(10);
    *(_QWORD *)(v5 + 96) = 0;
    *(_QWORD *)(v5 + 104) = v7;
    *(_DWORD *)(v5 + 280) = 0;
    *(_QWORD *)(v5 + 80) = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v8 = +[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration");
    *(_QWORD *)(v5 + 192) = objc_msgSend(v8, "maxNumberOfRows");
    *(_QWORD *)(v5 + 176) = objc_msgSend(v8, "maxNumberOfColumns");
    *(_DWORD *)(v5 + 284) = 0;
    *(_QWORD *)&v9 = 0xFFFFFFLL;
    *((_QWORD *)&v9 + 1) = 0xFFFFFFLL;
    *(_OWORD *)(v5 + 400) = v9;
    *(_OWORD *)&p_mDynamicHidingContent->origin.row = v9;
    *(_QWORD *)(v5 + 452) = 0xFFFFFFLL;
    *(_QWORD *)(v5 + 464) = 0;
    *(_QWORD *)(v5 + 474) = 0xFFFFFFLL;
    *(_QWORD *)(v5 + 488) = 0;
    *(_QWORD *)(v5 + 496) = 0xFFFFFFLL;
    *(_QWORD *)(v5 + 536) = 0;
    *(_QWORD *)(v5 + 160) = 0xBFF0000000000000;
    *(_QWORD *)(v5 + 240) = objc_alloc_init(MEMORY[0x24BDD1788]);
    *(_QWORD *)(v5 + 208) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    *(_QWORD *)(v5 + 216) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    *(_QWORD *)(v5 + 224) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    *(_QWORD *)(v5 + 232) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    *(_QWORD *)(v5 + 248) = objc_alloc_init(MEMORY[0x24BEB3D00]);
    v10 = objc_alloc_init(TSTHiddenRowsColumnsCache);
    *(_QWORD *)(v5 + 72) = v10;
    -[TSTHiddenRowsColumnsCache validate:](v10, "validate:", v5);
    *(_QWORD *)(v5 + 256) = objc_alloc_init(MEMORY[0x24BDD1648]);
    *(_BYTE *)(v5 + 264) = 0;
    *(_BYTE *)(v5 + 265) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "useBandedFill");
    *(_QWORD *)(v5 + 272) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "bandedFillObject");
    *(_QWORD *)(v5 + 592) = objc_alloc_init(TSTMergeRangeSortedSet);
    *(_WORD *)(v5 + 168) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "numberOfHeaderColumns");
    *(_WORD *)(v5 + 184) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "numberOfHeaderRows");
    *(_WORD *)(v5 + 186) = objc_msgSend((id)objc_msgSend((id)v5, "tableModel"), "numberOfFooterRows");
    *(_QWORD *)(v5 + 336) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
    *(_BYTE *)(v5 + 600) = 0;
    *(_DWORD *)(v5 + 576) = 0xFFFFFF;
    TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns(v5);
    v12 = (TableNumberOfColumns << 32) | (TSTMasterLayoutGetTableNumberOfRows(v5) << 48);
    objc_msgSend((id)v5, "addChangeDescriptorWithType:andCellRange:", 26, v12);
    objc_msgSend((id)v5, "addChangeDescriptorWithType:andCellRange:", 5, v12);
    *(_OWORD *)(v5 + 608) = *MEMORY[0x24BDBF148];
  }
  return (TSTMasterLayout *)v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mCellIDToWPColumnCache = 0;
  self->mDupContentCache = 0;

  self->mTempWPColumnCache = 0;
  self->mWidthHeightCache = 0;

  self->mWHCacheQueue = 0;
  self->mHiddenRowsColumnsCache = 0;
  dispatch_release((dispatch_object_t)self->mLayoutInFlight);
  dispatch_release((dispatch_object_t)self->mLayoutSemaphore);

  self->mCurrentLayoutTask = 0;
  self->mChangeDescriptors = 0;
  self->mTableInfo = 0;

  TSTMasterLayoutInvalidateStrokeDefaults((uint64_t)self);
  self->mTopRowStrokes = 0;

  self->mBottomRowStrokes = 0;
  self->mLeftColumnStrokes = 0;

  self->mRightColumnStrokes = 0;
  self->mParaStyleToHeightCache = 0;

  self->mStrokesLock = 0;
  self->mLock = 0;

  self->mDynamicLayouts = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTMasterLayout;
  -[TSTMasterLayout dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  unsigned int TableNumberOfColumns;
  unsigned int TableNumberOfRows;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[TSTTableModel tableName](-[TSTMasterLayout tableModel](self, "tableModel"), "tableName");
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), 0, 0);
  v11 = objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@, %@)"), v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), TableNumberOfColumns, TableNumberOfRows));
  if (self->mInDynamicLayoutMode)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p \"%@\" range:%@ dynamic_mode:%@ >"), v5, self, v6, v11, v12);
}

- (id)newLayoutHint
{
  TSTLayoutHint *v3;
  uint64_t TableNumberOfColumns;

  v3 = objc_alloc_init(TSTLayoutHint);
  if (!-[TSDDrawableInfo isInlineWithText](-[TSTMasterLayout tableInfo](self, "tableInfo"), "isInlineWithText"))
  {
    TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
    -[TSTLayoutHint setCellRange:](v3, "setCellRange:", (TableNumberOfColumns << 32) | (TSTMasterLayoutGetTableNumberOfRows((uint64_t)self) << 48));
    -[TSTLayoutHint setMaximumSize:](v3, "setMaximumSize:", INFINITY, INFINITY);
  }
  -[TSTMasterLayout validateLayoutHint:](self, "validateLayoutHint:", v3);
  return v3;
}

- (BOOL)hintIsValid:(id)a3
{
  double v5;
  double v6;
  unsigned int mCachedNumberOfHeaderRows;
  unsigned __int16 mCachedNumberOfHeaderColumns;
  unsigned __int16 mCachedNumberOfFooterRows;
  __int16 TableNumberOfColumns;
  int TableNumberOfRows;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  _BOOL4 mHeaderRowsRepeat;
  unsigned __int16 v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v28;
  unsigned int v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  double v37;
  double v38;

  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
    mCachedNumberOfHeaderRows = 0;
  else
    mCachedNumberOfHeaderRows = self->mCachedNumberOfHeaderRows;
  if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
    mCachedNumberOfHeaderColumns = 0;
  else
    mCachedNumberOfHeaderColumns = self->mCachedNumberOfHeaderColumns;
  if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
    mCachedNumberOfFooterRows = 0;
  else
    mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  if ((unsigned __int16)(TableNumberOfColumns - mCachedNumberOfHeaderColumns) >= 0xFFu)
    v12 = 255;
  else
    v12 = (unsigned __int16)(TableNumberOfColumns - mCachedNumberOfHeaderColumns);
  v13 = objc_msgSend(a3, "cellRange");
  v14 = 0;
  if (mCachedNumberOfHeaderRows == 0xFFFF)
    goto LABEL_32;
  v15 = 0;
  if (mCachedNumberOfHeaderColumns == 255)
    goto LABEL_33;
  v14 = 0;
  if (TableNumberOfRows == (unsigned __int16)(mCachedNumberOfFooterRows + mCachedNumberOfHeaderRows))
    goto LABEL_32;
  v15 = 0;
  if (!v12)
    goto LABEL_33;
  v14 = 0;
  if ((_WORD)v13 == 0xFFFF)
    goto LABEL_32;
  v15 = 0;
  if ((v13 & 0xFF0000) == 0xFF0000)
    goto LABEL_33;
  v14 = 0;
  if (!HIWORD(v13))
    goto LABEL_32;
  v15 = 0;
  if ((v13 & 0xFFFF00000000) == 0)
    goto LABEL_33;
  v14 = 0;
  v16 = mCachedNumberOfHeaderColumns;
  if (mCachedNumberOfHeaderColumns <= BYTE2(v13))
    v16 = BYTE2(v13);
  v17 = (unsigned __int16)v13;
  if (mCachedNumberOfHeaderRows > (unsigned __int16)v13)
    v17 = mCachedNumberOfHeaderRows;
  v18 = (mCachedNumberOfHeaderColumns + v12 - 1);
  if (v18 >= (BYTE4(v13) + BYTE2(v13) - 1))
    v18 = (BYTE4(v13) + BYTE2(v13) - 1);
  v19 = (unsigned __int16)(mCachedNumberOfHeaderRows
                         + TableNumberOfRows
                         + ~(mCachedNumberOfFooterRows + mCachedNumberOfHeaderRows));
  if (v19 >= (unsigned __int16)(v13 + HIWORD(v13) - 1))
    v19 = (unsigned __int16)(v13 + HIWORD(v13) - 1);
  if (v17 > v19)
  {
LABEL_32:
    v15 = 0;
    goto LABEL_33;
  }
  v15 = 0;
  if (v16 <= v18)
  {
    v15 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
    v14 = (((unint64_t)(v18 - v16) << 32) + 0x100000000) & 0xFFFF00000000;
  }
LABEL_33:
  mHeaderRowsRepeat = self->mHeaderRowsRepeat;
  v21 = objc_msgSend(a3, "cellRange");
  if (mHeaderRowsRepeat && (unsigned __int16)(mCachedNumberOfHeaderRows - 1) < v21)
  {
    v22 = 0;
    do
      v6 = v6 + TSTMasterLayoutHeightOfRow(self, (unsigned __int16)v22++, 0, 0, 1, 1);
    while (mCachedNumberOfHeaderRows > (unsigned __int16)v22);
  }
  v23 = objc_msgSend(a3, "cellRange");
  v24 = objc_msgSend(a3, "cellRange");
  if ((unsigned __int16)(v24 + HIWORD(v24) - 1) >= (unsigned __int16)v23)
  {
    do
    {
      v6 = v6 + TSTMasterLayoutHeightOfRow(self, (unsigned __int16)v23++, 0, 0, 1, 1);
      v25 = objc_msgSend(a3, "cellRange");
    }
    while ((unsigned __int16)v23 <= (unsigned __int16)(v25 + HIWORD(v25) - 1));
  }
  objc_msgSend(a3, "maximumSize");
  v28 = v6 > v26 && HIWORD(v15) == 1;
  if (!-[TSDDrawableInfo isInlineWithText](-[TSTMasterLayout tableInfo](self, "tableInfo"), "isInlineWithText"))
  {
    if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
      v29 = 0;
    else
      v29 = self->mCachedNumberOfHeaderColumns;
    if (v29 <= (objc_msgSend(a3, "cellRange") >> 16) && (_BYTE)v29)
    {
      v30 = 0;
      do
        v5 = v5 + TSTMasterLayoutWidthOfColumn((uint64_t)self, v30++, 0, 0, 1);
      while (v30 < v29);
    }
    v31 = objc_msgSend(a3, "cellRange");
    v32 = objc_msgSend(a3, "cellRange");
    if (BYTE2(v31) <= (BYTE4(v32) + BYTE2(v32) - 1))
    {
      v33 = v31 >> 16;
      do
      {
        v5 = v5 + TSTMasterLayoutWidthOfColumn((uint64_t)self, v33, 0, 0, 1);
        LODWORD(v33) = v33 + 1;
        v34 = objc_msgSend(a3, "cellRange");
      }
      while (v33 <= (BYTE4(v34) + BYTE2(v34) - 1));
    }
    objc_msgSend(a3, "maximumSize");
    if (v5 > v35 && (v15 & 0xFFFF00000000 | v14) == 0x100000000)
      v28 = 1;
    else
      v28 = v28;
  }
  objc_msgSend(a3, "maximumSize");
  if (v6 <= v37)
  {
    objc_msgSend(a3, "maximumSize");
    if (v5 <= v38)
      v28 = 1;
  }
  objc_msgSend(a3, "setIsValid:", v28);
  return objc_msgSend(a3, "isValid");
}

- (void)validateLayoutHint:(id)a3
{
  TSTTableInfo *v5;
  uint64_t v6;
  uint64_t TableNumberOfColumns;
  int TableNumberOfRows;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;

  v5 = -[TSTMasterLayout tableInfo](self, "tableInfo");
  objc_opt_class();
  -[TSTTableInfo partitioner](v5, "partitioner");
  v6 = TSUDynamicCast();
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  v9 = objc_msgSend(a3, "cellRange");
  if (!v6 || (objc_msgSend(a3, "maximumSize"), v11 = v9, v12 == INFINITY) && (v11 = v9, v10 == INFINITY))
  {
    v13 = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
    v11 = (v13 << 32) | (TSTMasterLayoutGetTableNumberOfRows((uint64_t)self) << 48);
    objc_msgSend(a3, "setMaximumSize:", INFINITY, INFINITY);
    objc_msgSend(a3, "setCacheHintID:", 0);
  }
  v14 = -[TSDDrawableInfo isInlineWithText](v5, "isInlineWithText");
  v15 = (TableNumberOfColumns - 1);
  if (v15 <= (BYTE4(v9) + BYTE2(v9) - 1))
    v16 = v11;
  else
    v16 = TableNumberOfColumns << 32;
  if (!v14)
    v16 = v11;
  v17 = v16 & 0xFFFF00000000;
  v18 = (unsigned __int16)v11 == 0;
  if (TableNumberOfRows == (unsigned __int16)(v11 + HIWORD(v11)))
    v18 |= 2u;
  if ((v11 & 0xFF0000) == 0)
    v18 |= 4u;
  if (v15 == (BYTE4(v16) + BYTE2(v11) - 1))
    v19 = v18 | 8;
  else
    v19 = v18;
  if ((_DWORD)v19 == 15)
  {
    *(_WORD *)&self->mHeaderColumnsRepeat = 0;
    self->mHeaderColumnsFrozen = -[TSTTableModel headerColumnsFrozen](-[TSTMasterLayout tableModel](self, "tableModel"), "headerColumnsFrozen");
    v20 = -[TSTTableModel headerRowsFrozen](-[TSTMasterLayout tableModel](self, "tableModel"), "headerRowsFrozen");
  }
  else
  {
    self->mHeaderColumnsRepeat = -[TSTTableModel repeatingHeaderColumnsEnabled](-[TSTMasterLayout tableModel](self, "tableModel"), "repeatingHeaderColumnsEnabled");
    v21 = -[TSTTableModel repeatingHeaderRowsEnabled](-[TSTMasterLayout tableModel](self, "tableModel"), "repeatingHeaderRowsEnabled");
    v20 = 0;
    self->mHeaderRowsRepeat = v21;
    self->mHeaderColumnsFrozen = 0;
  }
  self->mHeaderRowsFrozen = v20;
  objc_msgSend(a3, "setPartitionPosition:", v19);
  objc_msgSend(a3, "setCellRange:", v17 | v11 & 0xFFFF0000FFFFFFFFLL);
  objc_msgSend(a3, "setIsValid:", 1);
}

- (void)resetModelHeightWidthCache
{
  -[TSTWidthHeightCache resetModelCache](-[TSTMasterLayout widthHeightCache](self, "widthHeightCache"), "resetModelCache");
}

- (void)clearModelHeightWidthCacheForCellRange:(id)a3
{
  -[TSTWidthHeightCache resetModelCacheRange:](-[TSTMasterLayout widthHeightCache](self, "widthHeightCache"), "resetModelCacheRange:", a3);
}

- (id)tableNameTextEngine
{
  return +[TSTMasterLayout tableNameTextEngine:](TSTMasterLayout, "tableNameTextEngine:", -[TSTMasterLayout tableModel](self, "tableModel"));
}

- (CGSize)tableNameTextSize
{
  double v2;
  double v3;
  CGSize result;

  if (self->mTableNameEnabled)
  {
    +[TSTMasterLayout tableNameTextSize:](TSTMasterLayout, "tableNameTextSize:", -[TSTMasterLayout tableModel](self, "tableModel"));
  }
  else
  {
    v2 = *MEMORY[0x24BDBF148];
    v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)tableNameTextEngine:(id)a3
{
  id v4;
  id v5;

  v4 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", objc_msgSend(a3, "context"));
  objc_msgSend(v4, "setIntValue:forProperty:", objc_msgSend((id)objc_msgSend(a3, "tableNameShapeStyle"), "intValueForProperty:", 149), 149);
  v5 = (id)objc_msgSend((id)objc_msgSend(a3, "tableNameShapeStyle"), "objectForProperty:", 146);
  if (!v5)
    v5 = +[TSWPPadding padding](TSWPPadding, "padding");
  objc_msgSend(v4, "setValue:forProperty:", v5, 146);
  return -[TSWPText initWithParagraphStyle:columnStyle:]([TSWPText alloc], "initWithParagraphStyle:columnStyle:", objc_msgSend(a3, "tableNameStyle"), v4);
}

+ (CGSize)tableNameTextSize:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v4 = (void *)objc_msgSend(a3, "tableName");
  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v4)
  {
    v7 = v4;
    if (objc_msgSend(v4, "length"))
    {
      v8 = +[TSTMasterLayout tableNameTextEngine:](TSTMasterLayout, "tableNameTextEngine:", a3);
      objc_msgSend(v8, "measureText:", v7);
      v5 = v9;
      v11 = v10;
      objc_msgSend((id)objc_msgSend(v8, "paragraphStyle"), "CGFloatValueForProperty:", 88);
      v13 = v11 + v12;
      v14 = (void *)objc_msgSend(*((id *)a3 + 30), "valueForProperty:", 146);
      objc_msgSend(v14, "topInset");
      v16 = v15;
      objc_msgSend(v14, "bottomInset");
      v6 = v13 + v16 + v17;
    }
  }
  v18 = v5;
  v19 = v6;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (double)effectiveTableNameHeightForModel:(id)a3
{
  double v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a3, "tableNameHeight");
  v5 = v4;
  +[TSTMasterLayout tableNameTextSize:](TSTMasterLayout, "tableNameTextSize:", a3);
  if (v5 >= v6)
    result = v5;
  else
    result = v6;
  if (v5 <= 0.0)
    return v6;
  return result;
}

- (double)tableNameHeight
{
  double result;

  if (!self->mTableNameEnabled)
    return 0.0;
  -[TSTMasterLayout calculatedTableNameHeight](self, "calculatedTableNameHeight");
  return result;
}

- (double)calculatedTableNameHeight
{
  double result;

  -[TSTMasterLayout calculatedTableNameHeightIncludingDynamicResize:](self, "calculatedTableNameHeightIncludingDynamicResize:", 1);
  return result;
}

- (double)calculatedTableNameHeightIncludingDynamicResize:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _BOOL4 v6;
  double mCachedTableNameHeight;
  double v8;

  v3 = a3;
  if (self->mCachedTableNameHeight < 0.0)
  {
    self->mCachedTableNameHeight = 0.0;
    +[TSTMasterLayout effectiveTableNameHeightForModel:](TSTMasterLayout, "effectiveTableNameHeightForModel:", -[TSTMasterLayout tableModel](self, "tableModel"));
    self->mCachedTableNameHeight = v5;
  }
  v6 = -[TSTMasterLayout isDynamicallyResizingTableName](self, "isDynamicallyResizingTableName");
  mCachedTableNameHeight = self->mCachedTableNameHeight;
  if (v6 && v3)
  {
    -[TSTMasterLayout dynamicTableNameResize](self, "dynamicTableNameResize");
    return mCachedTableNameHeight + v8;
  }
  return mCachedTableNameHeight;
}

- (void)invalidateTableNameHeight
{
  self->mCachedTableNameHeight = -1.0;
}

- (unsigned)tableAreaForCellID:(id)a3
{
  unint64_t EntireFooterRowsCellRange;
  unint64_t EntireHeaderRowsCellRange;
  unint64_t EntireHeaderColumnsCellRange;
  unsigned int v8;

  EntireFooterRowsCellRange = TSTMasterLayoutGetEntireFooterRowsCellRange((unsigned __int16 *)self);
  if (HIWORD(EntireFooterRowsCellRange)
    && (EntireFooterRowsCellRange & 0xFFFF00000000) != 0
    && (unsigned __int16)EntireFooterRowsCellRange <= a3.var0
    && (unsigned __int16)(EntireFooterRowsCellRange + HIWORD(EntireFooterRowsCellRange) - 1) >= a3.var0
    && a3.var1 >= BYTE2(EntireFooterRowsCellRange)
    && a3.var1 <= (BYTE4(EntireFooterRowsCellRange) + BYTE2(EntireFooterRowsCellRange) - 1))
  {
    return 3;
  }
  EntireHeaderRowsCellRange = TSTMasterLayoutGetEntireHeaderRowsCellRange((unsigned __int16 *)self);
  if (HIWORD(EntireHeaderRowsCellRange)
    && (EntireHeaderRowsCellRange & 0xFFFF00000000) != 0
    && (unsigned __int16)EntireHeaderRowsCellRange <= a3.var0
    && (unsigned __int16)(EntireHeaderRowsCellRange + HIWORD(EntireHeaderRowsCellRange) - 1) >= a3.var0
    && a3.var1 >= BYTE2(EntireHeaderRowsCellRange)
    && a3.var1 <= (BYTE4(EntireHeaderRowsCellRange) + BYTE2(EntireHeaderRowsCellRange) - 1))
  {
    return 1;
  }
  EntireHeaderColumnsCellRange = TSTMasterLayoutGetEntireHeaderColumnsCellRange((unsigned __int16 *)self);
  v8 = 0;
  if (HIWORD(EntireHeaderColumnsCellRange) && (EntireHeaderColumnsCellRange & 0xFFFF00000000) != 0)
  {
    if ((unsigned __int16)EntireHeaderColumnsCellRange <= a3.var0
      && (unsigned __int16)(EntireHeaderColumnsCellRange + HIWORD(EntireHeaderColumnsCellRange) - 1) >= a3.var0
      && a3.var1 >= BYTE2(EntireHeaderColumnsCellRange))
    {
      if (a3.var1 > (BYTE4(EntireHeaderColumnsCellRange)
                                                   + BYTE2(EntireHeaderColumnsCellRange)
                                                   - 1))
        return 0;
      else
        return 2;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (id)regionForStrokeValidationFromChangeDescriptors:(id)a3
{
  TSTMasterLayout *v4;
  unsigned int TableNumberOfColumns;
  uint64_t TableNumberOfRows;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = self;
  v32 = *MEMORY[0x24BDAC8D0];
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)v4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a3;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v7)
  {
    v10 = 0;
    v18 = TableNumberOfColumns;
    goto LABEL_23;
  }
  v8 = v7;
  v22 = TableNumberOfRows;
  v23 = (uint64_t)v4;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v28;
  v21 = TableNumberOfColumns;
  v24 = ((TableNumberOfColumns << 16) + 16711680) & 0xFF0000 | (unsigned __int16)(TableNumberOfRows - 1) | 0x1000100000000;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "changeDescriptor", v21, v22);
      v15 = objc_msgSend(v13, "cellID");
      v16 = (void *)objc_msgSend(v13, "strokeRegion");
      v17 = (uint64_t)v16;
      if (v14 > 0x28)
        goto LABEL_11;
      if (((1 << v14) & 0x10010004700) == 0)
      {
        if (((1 << v14) & 0x600006) == 0)
        {
          if (((1 << v14) & 0x8000C8) != 0)
            v17 = objc_msgSend(v16, "regionByUnioningEveryRangeInRegionWithRange:", v15 | 0x1000100000000);
LABEL_11:
          if (v10)
            goto LABEL_12;
          goto LABEL_15;
        }
        v17 = objc_msgSend(v16, "regionByUnioningEveryRangeInRegionWithRange:", v24);
      }
      v9 = 1;
      if (v10)
      {
LABEL_12:
        v10 = (void *)objc_msgSend(v10, "regionByAddingRegion:", v17);
        continue;
      }
LABEL_15:
      v10 = (void *)v17;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v8);
  if ((v9 & 1) != 0)
  {
    v4 = (TSTMasterLayout *)v23;
    TSTMasterLayoutInvalidateStrokeDefaults(v23);
  }
  else
  {
    v4 = (TSTMasterLayout *)v23;
  }
  v18 = v21;
  TableNumberOfRows = v22;
LABEL_23:
  v19 = (void *)objc_msgSend(v10, "regionByIntersectingRange:", (v18 << 32) | (TableNumberOfRows << 48));
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __66__TSTMasterLayout_regionForStrokeValidationFromChangeDescriptors___block_invoke;
  v26[3] = &unk_24D82F160;
  v26[4] = v4;
  objc_msgSend(v19, "enumerateCellRangesUsingBlock:", v26);
  return v19;
}

uint64_t __66__TSTMasterLayout_regionForStrokeValidationFromChangeDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return TSTMasterLayoutInvalidateStrokeRange(*(TSTMasterLayout **)(a1 + 32), a2);
}

- (void)validateStrokesForRegion:(id)a3 regionAlreadyValidated:(id)a4
{
  void *v5;
  _QWORD v6[5];

  v5 = (void *)objc_msgSend(a3, "regionBySubtractingRegion:", a4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__TSTMasterLayout_validateStrokesForRegion_regionAlreadyValidated___block_invoke;
  v6[3] = &unk_24D82F160;
  v6[4] = self;
  objc_msgSend(v5, "enumerateCellRangesUsingBlock:", v6);
}

void __67__TSTMasterLayout_validateStrokesForRegion_regionAlreadyValidated___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  TSTLayoutCellIterator *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 NextCell;
  TSTMasterLayout *v11;
  unsigned __int16 v12;
  _QWORD v13[5];

  v6 = -[TSTLayoutCellIterator initWithMasterLayout:range:flags:]([TSTLayoutCellIterator alloc], "initWithMasterLayout:range:flags:", *(_QWORD *)(a1 + 32), a2, 2);
  v7 = 0xFFFFLL;
  v8 = 0xFFFFLL;
LABEL_2:
  v9 = v7;
  v7 = v8;
LABEL_3:
  v8 = v7;
  while (1)
  {
    NextCell = TSTLayoutCellIteratorGetNextCell((uint64_t)v6, v13);
    v11 = *(TSTMasterLayout **)(a1 + 32);
    if (!NextCell)
      break;
    v2 = v2 & 0xFFFFFFFF00000000 | HIDWORD(v13[0]);
    v12 = (unsigned __int16)-[TSTMasterLayout modelCellIDForStrokesOfLayoutCellID:](v11, "modelCellIDForStrokesOfLayoutCellID:", v2);
    if ((_DWORD)v7 != v12)
    {
      v7 = v12;
      if ((_DWORD)v9 == v12)
      {
        v7 = v9;
      }
      else if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "hiddenRowsColumnsCache"), "isRowHidden:", WORD2(v13[0])) & 1) != 0)
      {
        goto LABEL_3;
      }
      if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "hiddenRowsColumnsCache"), "isColumnHidden:", BYTE6(v13[0])) & 1) == 0)
      {
        v3 = v3 & 0xFFFFFFFF00000000 | HIDWORD(v13[0]);
        TSTMasterLayoutUpdateStrokesForCell(*(TSTMasterLayout **)(a1 + 32), v13[1], v3);
      }
      goto LABEL_2;
    }
  }
  TSTMasterLayoutSetStrokesValidForRange(v11, a2);

}

- (BOOL)useBandedFill
{
  if (-[TSTMasterLayout isDynamicallySettingBandedFill](self, "isDynamicallySettingBandedFill"))
    return -[TSTMasterLayout dynamicBandedFill](self, "dynamicBandedFill");
  else
    return self->mUseBandedFill;
}

- (BOOL)shouldRowUseBandedFill:(unsigned __int16)a3
{
  uint64_t v3;

  v3 = a3;
  if (-[TSTMasterLayout isDynamicallySettingBandedFill](self, "isDynamicallySettingBandedFill"))
    return -[TSTMasterLayout dynamicBandedFillSetting](self, "dynamicBandedFillSetting");
  if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable")
    || self->mCachedNumberOfHeaderRows <= v3)
  {
    return (-[TSTHiddenRowsColumnsCache numberOfVisibleRowsFromHeader:](self->mHiddenRowsColumnsCache, "numberOfVisibleRowsFromHeader:", v3) & 1) == 0;
  }
  return 0;
}

- (void)invalidateBandedFill
{
  self->mBandedFillIsValid = 0;
}

- (void)validateBandedFill
{
  if (!self->mBandedFillIsValid)
  {
    self->mBandedFillIsValid = 1;
    self->mUseBandedFill = -[TSTTableModel useBandedFill](-[TSTMasterLayout tableModel](self, "tableModel"), "useBandedFill");
    self->mBandedFillObject = (TSDFill *)-[TSTTableModel bandedFillObject](-[TSTMasterLayout tableModel](self, "tableModel"), "bandedFillObject");
  }
}

- (void)validateTableRowsBehavior
{
  id v3;
  int v4;

  v3 = +[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration");
  if (self->mTableEnvironment == 1)
    goto LABEL_2;
  if (!objc_msgSend(v3, "supportsAutoResizedTables"))
  {
    v4 = 3;
    goto LABEL_7;
  }
  if (!-[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTMasterLayout tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 768))LABEL_2:v4 = 2;
  else
    v4 = 1;
LABEL_7:
  self->mTableRowsBehavior = v4;
}

- (void)invalidateDefaultFontHeights
{
  self->mTableDefaultFontHeightsAreValid = 0;
}

- (void)validateDefaultFontHeights
{
  TSTTableModel *v3;
  uint64_t i;
  TSTCell *v5;
  TSTCellStateForLayout *v6;
  TSWPColumn *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (!self->mTableDefaultFontHeightsAreValid)
  {
    v3 = -[TSTMasterLayout tableModel](self, "tableModel");
    for (i = 0; i != 4; ++i)
    {
      v5 = objc_alloc_init(TSTCell);
      -[TSTTableModel defaultCell:forTableArea:](v3, "defaultCell:forTableArea:", v5, i);
      v6 = objc_alloc_init(TSTCellStateForLayout);
      -[TSTCellStateForLayout setModelCellID:](v6, "setModelCellID:", 0xFFFFFFLL);
      -[TSTCellStateForLayout setCell:](v6, "setCell:", v5);
      -[TSTCellStateForLayout setCellPropsRowHeight:](v6, "setCellPropsRowHeight:", 0);
      -[TSTCellStateForLayout setCellWraps:](v6, "setCellWraps:", 0);
      -[TSTCellStateForLayout setPaddingInsets:](v6, "setPaddingInsets:", 0.0, 0.0, 0.0, 0.0);
      -[TSTCellStateForLayout setMinSize:](v6, "setMinSize:", 4294967300.0, 8.0);
      -[TSTCellStateForLayout setMaxSize:](v6, "setMaxSize:", 4294967300.0, 4294967300.0);
      -[TSTCellStateForLayout setForDrawing:](v6, "setForDrawing:", 0);
      -[TSTCellStateForLayout setMergedRange:](v6, "setMergedRange:", 0xFFFFFFLL);
      -[TSTCellStateForLayout setInDynamicLayout:](v6, "setInDynamicLayout:", 0);
      -[TSTCellStateForLayout setCellContents:](v6, "setCellContents:", CFSTR("Q"));
      -[TSTCellStateForLayout setLayoutCacheFlags:](v6, "setLayoutCacheFlags:", 0);
      -[TSTCellStateForLayout setPageNumber:](v6, "setPageNumber:", 0);
      -[TSTCellStateForLayout setPageCount:](v6, "setPageCount:", 0);
      -[TSTMasterLayout measureTextForLayoutState:](self, "measureTextForLayoutState:", v6);
      v7 = -[TSTCellStateForLayout wpColumn](v6, "wpColumn");
      -[TSWPColumn typographicBoundsForCell](v7, "typographicBoundsForCell");
      -[TSWPColumn frameBounds](v7, "frameBounds");
      v9 = v8;
      v10 = (void *)objc_msgSend(-[TSTTableModel defaultCellStyleForTableArea:](v3, "defaultCellStyleForTableArea:", i), "valueForProperty:", 904);
      objc_msgSend(v10, "topInset");
      v12 = v11;
      objc_msgSend(v10, "leftInset");
      objc_msgSend(v10, "bottomInset");
      v14 = v13;
      objc_msgSend(v10, "rightInset");
      self->mTableDefaultFontHeightForArea[i] = v9 + v12 + v14;
    }
    self->mTableDefaultFontHeightsAreValid = 1;
  }
}

- (void)calculateRawTableSize:(CGSize *)a3 andStrokeDelta:(CGSize *)a4
{
  CGSize *v6;
  $CA3468F20078D5D2DB35E78E73CA60DA v7;
  $CA3468F20078D5D2DB35E78E73CA60DA v8;
  unint64_t v9;
  unint64_t v10;
  double height;
  double width;
  unsigned int var0;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize *v20;
  double v21;
  double v22;
  _BOOL4 v23;

  v6 = (CGSize *)MEMORY[0x24BDBF148];
  *a4 = *(CGSize *)MEMORY[0x24BDBF148];
  *a3 = *v6;
  v23 = -[TSTMasterLayout dynamicRepResize](self, "dynamicRepResize");
  -[TSTMasterLayout setDynamicRepResize:](self, "setDynamicRepResize:", 0);
  v7 = -[TSTTableModel range](-[TSTMasterLayout tableModel](self, "tableModel"), "range");
  v8 = v7;
  v9 = *(unint64_t *)&v7 >> 16;
  v10 = HIWORD(*(unint64_t *)&v7);
  width = v6->width;
  height = v6->height;
  var0 = v7.var0.var0;
  if (v7.var0.var0 < *(unsigned int *)&v7.var1.var1)
  {
    v14 = v7.var0.var0;
    do
      height = height + TSTMasterLayoutHeightOfRow(self, (unsigned __int16)v14++, 0, 0, 1, 1);
    while ((_DWORD)v10 != v14);
  }
  if (v8.var1.var0 > v8.var0.var1)
  {
    v15 = v9;
    do
      width = width + TSTMasterLayoutWidthOfColumn((uint64_t)self, v15++, 1, 0, 1);
    while (v8.var1.var0 > v15);
  }
  v16 = TSTMasterLayoutStrokeHeightOfGridRow(self, var0, 0, 0xFFFFFFFF);
  v17 = height
      + (v16
       + TSTMasterLayoutStrokeHeightOfGridRow(self, (unsigned __int16)(v8.var0.var0 + v10 - 1) + 1, 0, 0xFFFFFFFF))* 0.5;
  v18 = TSTMasterLayoutStrokeWidthOfGridColumn(self, v8.var0.var1, 0, 0xFFFFFFFF);
  v19 = TSTMasterLayoutStrokeWidthOfGridColumn(self, (LOBYTE(v8.var1.var0) + v8.var0.var1 - 1) + 1, 0, 0xFFFFFFFF);
  if (var0 >= v10)
  {
    v21 = a3->height;
    v20 = a4;
  }
  else
  {
    v20 = a4;
    do
    {
      v21 = TSTMasterLayoutHeightOfRow(self, (unsigned __int16)var0, 0, 0, 0, 1) + a3->height;
      a3->height = v21;
      ++var0;
    }
    while ((_DWORD)v10 != var0);
  }
  v20->height = v17 - v21;
  if (v8.var1.var0 <= v8.var0.var1)
  {
    v22 = a3->width;
  }
  else
  {
    do
    {
      v22 = TSTMasterLayoutWidthOfColumn((uint64_t)self, v9, 0, 0, 1) + a3->width;
      a3->width = v22;
      LODWORD(v9) = v9 + 1;
    }
    while (v8.var1.var0 > v9);
  }
  v20->width = width + (v18 + v19) * 0.5 - v22;
  -[TSTMasterLayout setDynamicRepResize:](self, "setDynamicRepResize:", v23);
}

- (void)beginDynamicMode:(id)a3
{
  if (a3)
  {
    -[NSMutableSet addObject:](-[TSTMasterLayout dynamicLayouts](self, "dynamicLayouts"), "addObject:", a3);
    -[TSTMasterLayout setDynamicSavedLayoutGeometry:](self, "setDynamicSavedLayoutGeometry:", objc_msgSend(a3, "geometry"));
  }
  self->mInDynamicLayoutMode = 1;
}

- (void)p_cancelDynamicRowColCountChanges
{
  int mDynamicColumnAdjustment;
  int mDynamicRowAdjustment;

  mDynamicColumnAdjustment = self->mDynamicColumnAdjustment;
  if (mDynamicColumnAdjustment)
    -[TSTMasterLayout updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:](self, "updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:", 1, -mDynamicColumnAdjustment, self->mDynamicAddOrRemoveColumnElementSize);
  mDynamicRowAdjustment = self->mDynamicRowAdjustment;
  if (mDynamicRowAdjustment)
    -[TSTMasterLayout updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:](self, "updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:", 0, -mDynamicRowAdjustment, self->mDynamicAddOrRemoveRowElementSize);
}

- (void)cancelDynamicModeChanges
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 *p_mDynamicHidingContent;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  __int128 v9;

  p_mDynamicHidingContent = &self->mDynamicHidingContent;
  -[TSTMasterLayout p_cancelDynamicRowColCountChanges](self, "p_cancelDynamicRowColCountChanges");
  self->mDynamicColumnAdjustment = 0;
  self->mDynamicColumnTabSize = 0.0;
  self->mDynamicAddOrRemoveColumnElementSize = 0.0;
  self->mDynamicAddOrRemoveRowElementSize = 0.0;
  *(_WORD *)&self->mDynamicBandedFill = 0;
  self->mDynamicFontColorCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (self->mDynamicHidingRowsCols.origin.row != 0xFFFF)
  {
    v7 = (*(_QWORD *)&mDynamicHidingRowsCols & 0xFF0000) == 16711680;
    v5 = *(_QWORD *)&mDynamicHidingRowsCols & 0xFFFF00000000;
    v6 = HIWORD(*(unint64_t *)&mDynamicHidingRowsCols);
    v7 = v7 || v6 == 0;
    if (!v7 && v5 != 0)
    {
      -[TSTMasterLayout updateDynamicHidingRowsCols:hidingCellRange:](self, "updateDynamicHidingRowsCols:hidingCellRange:", self->mDynamicHidingRowsColsDirection, 0xFFFFFFLL);
      self->mDynamicHidingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
    }
  }
  *(_QWORD *)&v9 = 0xFFFFFFLL;
  *((_QWORD *)&v9 + 1) = 0xFFFFFFLL;
  *(_OWORD *)&p_mDynamicHidingContent->origin.row = v9;
  *(_WORD *)&self->mDynamicRepResize = 0;
  self->mDynamicResizingColumns = 0;
  self->mDynamicResizingColumnAdjustment = 0.0;
  p_mDynamicHidingContent[4] = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  self->mDynamicResizingRows = 0;
  *(_QWORD *)&p_mDynamicHidingContent[6].size.numberOfRows = 0xFFFFFFLL;
  self->mDynamicResizingRowAdjustment = 0.0;
  self->mDynamicRevealingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
  self->mDynamicRowAdjustment = 0;
  self->mDynamicRowTabSize = 0.0;
  self->mDynamicTableNameResize = 0.0;
}

- (void)endDynamicMode
{

  self->mDynamicColumnSwapDelegate = 0;
  self->mDynamicRowSwapDelegate = 0;

  self->mDynamicContentDelegate = 0;
  self->mDynamicFontColor = 0;

  self->mDynamicSelectionRegion = 0;
  self->mDynamicInfoGeometry = 0;
  -[TSTMasterLayout cancelDynamicModeChanges](self, "cancelDynamicModeChanges");
  self->mCachedNumberOfHeaderColumns = -[TSTTableModel numberOfHeaderColumns](-[TSTMasterLayout tableModel](self, "tableModel"), "numberOfHeaderColumns");
  self->mCachedNumberOfHeaderRows = -[TSTTableModel numberOfHeaderRows](-[TSTMasterLayout tableModel](self, "tableModel"), "numberOfHeaderRows");
  self->mCachedNumberOfFooterRows = -[TSTTableModel numberOfFooterRows](-[TSTMasterLayout tableModel](self, "tableModel"), "numberOfFooterRows");
  self->mInDynamicLayoutMode = 0;
  -[NSMutableSet removeAllObjects](-[TSTMasterLayout dynamicLayouts](self, "dynamicLayouts"), "removeAllObjects");
  -[TSTMasterLayout setDynamicSavedLayoutGeometry:](self, "setDynamicSavedLayoutGeometry:", 0);
  self->mDynamicTableNameResize = 0.0;
  self->mDynamicSuppressingConditionalStylesCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)0xFFFFFF;
}

- (void)addDynamicLayoutBeginIfNecessary:(id)a3
{
  if (self->mInDynamicLayoutMode)
    -[NSMutableSet addObject:](-[TSTMasterLayout dynamicLayouts](self, "dynamicLayouts"), "addObject:", a3);
  else
    -[TSTMasterLayout beginDynamicMode:](self, "beginDynamicMode:", a3);
}

- (void)removeDynamicLayoutEndIfNecessary:(id)a3
{
  if ((unint64_t)-[NSMutableSet count](-[TSTMasterLayout dynamicLayouts](self, "dynamicLayouts"), "count") < 2)
    -[TSTMasterLayout endDynamicMode](self, "endDynamicMode");
  else
    -[NSMutableSet removeObject:](-[TSTMasterLayout dynamicLayouts](self, "dynamicLayouts"), "removeObject:", a3);
}

- (BOOL)cell:(id *)a3 forCellID:(id)a4
{
  TSTLayoutDynamicContentProtocol *mDynamicContentDelegate;
  TSTCell *v8;
  BOOL v9;

  mDynamicContentDelegate = self->mDynamicContentDelegate;
  if (mDynamicContentDelegate)
  {
    if (!-[TSTLayoutDynamicContentProtocol dynamicContentMustDrawOnMainThread](mDynamicContentDelegate, "dynamicContentMustDrawOnMainThread")|| (LODWORD(mDynamicContentDelegate) = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"), (_DWORD)mDynamicContentDelegate))
    {
      if ((-[TSTLayoutDynamicContentProtocol cell:forCellID:](self->mDynamicContentDelegate, "cell:forCellID:", a3, *(unsigned int *)&a4) & 1) == 0)
      {
        v8 = objc_alloc_init(TSTCell);
        if (TSTCellAtCellID((uint64_t)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&a4, v8))v9 = 1;
        else
          v9 = v8 == 0;
        if (v9 || !*((_BYTE *)&v8->mPrivate + 1))
        {
          LOBYTE(mDynamicContentDelegate) = 0;
          return (char)mDynamicContentDelegate;
        }
        *a3 = v8;
      }
      LOBYTE(mDynamicContentDelegate) = 1;
    }
  }
  return (char)mDynamicContentDelegate;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellIDForLayoutCellID:(id)a3
{
  unint64_t v3;
  uint64_t v5;
  unsigned __int16 v6;
  unint64_t v7;
  int TableNumberOfRows;
  int mCachedNumberOfFooterRows;
  int v10;
  int mDynamicRowAdjustment;
  __int16 v12;
  char v13;
  int v14;
  unsigned __int16 v15;

  v3 = *(_QWORD *)&a3.var0;
  v5 = *(_QWORD *)&a3.var0 >> 16;
  if (-[TSTMasterLayout isDynamicallySwappingRows](self, "isDynamicallySwappingRows"))
    v6 = -[TSTLayoutDynamicRowSwapProtocol modelRowForLayoutRow:](-[TSTMasterLayout dynamicRowSwapDelegate](self, "dynamicRowSwapDelegate"), "modelRowForLayoutRow:", (unsigned __int16)v3);
  else
    v6 = v3;
  v7 = v3 >> 24;
  if (-[TSTMasterLayout isDynamicallySwappingColumns](self, "isDynamicallySwappingColumns"))
    LOBYTE(v5) = -[TSTLayoutDynamicColumnSwapProtocol modelColForLayoutCol:](-[TSTMasterLayout dynamicColumnSwapDelegate](self, "dynamicColumnSwapDelegate"), "modelColForLayoutCol:", v5);
  if (-[TSTMasterLayout isDynamicallyChangingRowCount](self, "isDynamicallyChangingRowCount"))
  {
    TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
    if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
      mCachedNumberOfFooterRows = 0;
    else
      mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
    v10 = TableNumberOfRows - mCachedNumberOfFooterRows;
    mDynamicRowAdjustment = self->mDynamicRowAdjustment;
    if ((unsigned __int16)v3 >= v10 - mDynamicRowAdjustment)
      v12 = -1;
    else
      v12 = v6;
    if ((unsigned __int16)v3 >= v10 - mDynamicRowAdjustment)
      v13 = -1;
    else
      v13 = v5;
    if ((unsigned __int16)v3 >= v10 - mDynamicRowAdjustment)
      v14 = 0;
    else
      v14 = v3 >> 24;
    v15 = v6 - mDynamicRowAdjustment;
    if ((unsigned __int16)v3 >= v10)
      v6 = v15;
    else
      v6 = v12;
    if ((unsigned __int16)v3 < v10)
    {
      LOBYTE(v5) = v13;
      LODWORD(v7) = v14;
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v5 << 16) | ((_DWORD)v7 << 24) | v6);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellIDForStrokesOfLayoutCellID:(id)a3
{
  uint64_t v5;
  unsigned __int16 var0;
  int TableNumberOfRows;
  int mCachedNumberOfFooterRows;
  int v9;
  int mDynamicRowAdjustment;
  int v11;
  int v12;

  v5 = *(_QWORD *)&a3.var0 >> 16;
  if (-[TSTMasterLayout isDynamicallySwappingRows](self, "isDynamicallySwappingRows"))
    var0 = -[TSTLayoutDynamicRowSwapProtocol modelRowForLayoutRow:](-[TSTMasterLayout dynamicRowSwapDelegate](self, "dynamicRowSwapDelegate"), "modelRowForLayoutRow:", a3.var0);
  else
    var0 = a3.var0;
  if (-[TSTMasterLayout isDynamicallySwappingColumns](self, "isDynamicallySwappingColumns"))
    LOBYTE(v5) = -[TSTLayoutDynamicColumnSwapProtocol modelColForLayoutCol:](-[TSTMasterLayout dynamicColumnSwapDelegate](self, "dynamicColumnSwapDelegate"), "modelColForLayoutCol:", v5);
  if (-[TSTMasterLayout isDynamicallyChangingRowCount](self, "isDynamicallyChangingRowCount"))
  {
    TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
    if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
      mCachedNumberOfFooterRows = 0;
    else
      mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
    v9 = TableNumberOfRows - mCachedNumberOfFooterRows;
    mDynamicRowAdjustment = self->mDynamicRowAdjustment;
    if (a3.var0 >= v9)
    {
      var0 -= mDynamicRowAdjustment;
    }
    else
    {
      v11 = v9 - mDynamicRowAdjustment;
      if (a3.var0 >= v11)
        var0 = -[TSTHiddenRowsColumnsCache previousVisibleRow:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "previousVisibleRow:", (unsigned __int16)(v11 - 1));
    }
  }
  if (-[TSTMasterLayout isDynamicallyChangingColumnCount](self, "isDynamicallyChangingColumnCount"))
  {
    v12 = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self) - self->mDynamicColumnAdjustment;
    if (v12 <= a3.var1)
      LOBYTE(v5) = -[TSTHiddenRowsColumnsCache previousVisibleColumn:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "previousVisibleColumn:", (v12 - 1));
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(*(_DWORD *)&a3 & 0xFF000000 | (v5 << 16) | var0);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)layoutCellIDForModelCellID:(id)a3
{
  uint64_t var1;
  unsigned __int16 var0;
  int v7;
  $CA3468F20078D5D2DB35E78E73CA60DA v8;

  var1 = a3.var1;
  var0 = a3.var0;
  if (-[TSTMasterLayout isDynamicallySwappingRows](self, "isDynamicallySwappingRows"))
    var0 = -[TSTLayoutDynamicRowSwapProtocol layoutRowForModelRow:](-[TSTMasterLayout dynamicRowSwapDelegate](self, "dynamicRowSwapDelegate"), "layoutRowForModelRow:", a3.var0);
  if (-[TSTMasterLayout isDynamicallySwappingColumns](self, "isDynamicallySwappingColumns"))
    v7 = -[TSTLayoutDynamicColumnSwapProtocol layoutColForModelCol:](-[TSTMasterLayout dynamicColumnSwapDelegate](self, "dynamicColumnSwapDelegate"), "layoutColForModelCol:", var1);
  else
    v7 = var1;
  if (-[TSTMasterLayout isDynamicallyChangingRowCount](self, "isDynamicallyChangingRowCount"))
  {
    v8 = -[TSTTableModel footerRowRange](-[TSTMasterLayout tableModel](self, "tableModel"), "footerRowRange");
    if (HIWORD(*(unint64_t *)&v8))
    {
      if ((*(_QWORD *)&v8 & 0xFFFF00000000) != 0
        && v8.var0.var0 <= a3.var0
        && (unsigned __int16)(v8.var0.var0 + v8.var1.var1 - 1) >= a3.var0
        && v8.var0.var1 <= var1
        && var1 <= (LOBYTE(v8.var1.var0) + v8.var0.var1 - 1))
      {
        var0 += LOWORD(self->mDynamicRowAdjustment);
      }
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(*(_DWORD *)&a3 & 0xFF000000 | (v7 << 16) | var0);
}

- (BOOL)isDynamicallyResizing:(int)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;

  if (a3)
  {
    if (a3 != 1 || !self->mDynamicResizingColumns)
      return 0;
    mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
  }
  else
  {
    if (!self->mDynamicResizingRows)
      return 0;
    mDynamicResizingColumnRange = self->mDynamicResizingRowRange;
  }
  if (mDynamicResizingColumnRange.origin.row != 0xFFFF)
  {
    v6 = (*(_QWORD *)&mDynamicResizingColumnRange & 0xFF0000) == 16711680;
    v4 = *(_QWORD *)&mDynamicResizingColumnRange & 0xFFFF00000000;
    v5 = HIWORD(*(unint64_t *)&mDynamicResizingColumnRange);
    v6 = v6 || v5 == 0;
    if (!v6 && v4 != 0)
      return 1;
  }
  return 0;
}

- (BOOL)isDynamicallyResizing:(int)a3 rowColIndex:(unsigned __int16)a4
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange;
  BOOL v5;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingRowRange;
  BOOL v7;
  BOOL v8;

  if (!a3)
  {
    if (self->mDynamicResizingRows)
    {
      mDynamicResizingRowRange = self->mDynamicResizingRowRange;
      v7 = !HIWORD(*(unint64_t *)&mDynamicResizingRowRange)
        || (*(_QWORD *)&mDynamicResizingRowRange & 0xFFFF00000000) == 0;
      v8 = v7 || mDynamicResizingRowRange.origin.column > a4;
      if (!v8
        && a4 <= (LOBYTE(mDynamicResizingRowRange.size.numberOfColumns)
                                                                + mDynamicResizingRowRange.origin.column
                                                                - 1))
      {
        return 1;
      }
    }
    return 0;
  }
  if (a3 != 1 || !self->mDynamicResizingColumns)
    return 0;
  mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
  v5 = !HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)
    || (*(_QWORD *)&mDynamicResizingColumnRange & 0xFFFF00000000) == 0;
  return !v5
      && a4 >= mDynamicResizingColumnRange.origin.row
      && a4 <= (unsigned __int16)(mDynamicResizingColumnRange.origin.row
                                              + mDynamicResizingColumnRange.size.numberOfRows
                                              - 1);
}

- (BOOL)isDynamicallyResizingCellID:(id)a3
{
  BOOL mDynamicResizingRows;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingRowRange;
  BOOL v5;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange;
  BOOL v7;
  BOOL v8;

  mDynamicResizingRows = self->mDynamicResizingRows;
  if (mDynamicResizingRows)
  {
    if (self->mDynamicResizingRowAdjustment == 0.0
      || ((mDynamicResizingRowRange = self->mDynamicResizingRowRange,
           HIWORD(*(unint64_t *)&mDynamicResizingRowRange))
        ? (v5 = (*(_QWORD *)&mDynamicResizingRowRange & 0xFFFF00000000) == 0)
        : (v5 = 1),
          v5))
    {
      mDynamicResizingRows = 0;
    }
    else
    {
      mDynamicResizingRows = (unsigned __int16)(mDynamicResizingRowRange.origin.row
                                              + mDynamicResizingRowRange.size.numberOfRows
                                              - 1) >= a3.var0;
      if ((unsigned __int16)*(_QWORD *)&self->mDynamicResizingRowRange > a3.var0)
        mDynamicResizingRows = 0;
    }
  }
  if (self->mDynamicResizingColumns && self->mDynamicResizingColumnAdjustment != 0.0)
  {
    mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
    if (HIWORD(*(unint64_t *)&mDynamicResizingColumnRange))
      v7 = (*(_QWORD *)&mDynamicResizingColumnRange & 0xFFFF00000000) == 0;
    else
      v7 = 1;
    v8 = v7 || mDynamicResizingColumnRange.origin.column > a3.var1;
    if (!v8
      && a3.var1 <= (LOBYTE(mDynamicResizingColumnRange.size.numberOfColumns)
                                                  + mDynamicResizingColumnRange.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return mDynamicResizingRows;
}

- (NSIndexSet)visibleRowIndices
{
  return -[TSTHiddenRowsColumnsCache visibleRowIndices](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "visibleRowIndices");
}

- (NSIndexSet)visibleColumnIndices
{
  return -[TSTHiddenRowsColumnsCache visibleColumnIndices](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "visibleColumnIndices");
}

- (TSTLayout)dynamicLayout
{
  return (TSTLayout *)-[NSMutableSet anyObject](-[TSTMasterLayout dynamicLayouts](self, "dynamicLayouts"), "anyObject");
}

- (BOOL)isDynamicallyHidingRowsCols
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;

  mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (self->mDynamicHidingRowsCols.origin.row == 0xFFFF)
    return 0;
  v3 = *(_QWORD *)&mDynamicHidingRowsCols & 0xFF0000;
  v5 = (*(_QWORD *)&mDynamicHidingRowsCols & 0xFFFF00000000) == 0;
  v4 = HIWORD(*(unint64_t *)&mDynamicHidingRowsCols);
  v5 = v5 || v4 == 0;
  v6 = !v5;
  return v3 != 16711680 && v6;
}

- (BOOL)isDynamicallyHidingRowsCols:(int)a3 rowColIndex:(unsigned __int16)a4
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols;
  BOOL v5;
  BOOL v6;

  mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (self->mDynamicHidingRowsCols.origin.row == 0xFFFF)
    return 0;
  v5 = (*(_QWORD *)&mDynamicHidingRowsCols & 0xFF0000) == 0xFF0000
    || HIWORD(*(unint64_t *)&mDynamicHidingRowsCols) == 0;
  v6 = v5 || (*(_QWORD *)&mDynamicHidingRowsCols & 0xFFFF00000000) == 0;
  if (v6 || self->mDynamicHidingRowsColsDirection != a3)
    return 0;
  if (a3 == 1)
    return a4 >= mDynamicHidingRowsCols.origin.column
        && a4 <= (LOBYTE(mDynamicHidingRowsCols.size.numberOfColumns)
                                                                + mDynamicHidingRowsCols.origin.column
                                                                - 1);
  return !a3
      && a4 >= mDynamicHidingRowsCols.origin.row
      && a4 <= (unsigned __int16)(mDynamicHidingRowsCols.origin.row
                                              + mDynamicHidingRowsCols.size.numberOfRows
                                              - 1);
}

- (BOOL)isDynamicallyHidingRowsColsCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols;
  BOOL v4;
  BOOL v5;
  BOOL result;

  mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  result = 0;
  if (self->mDynamicHidingRowsCols.origin.row != 0xFFFF)
  {
    v4 = (*(_QWORD *)&mDynamicHidingRowsCols & 0xFF0000) == 0xFF0000
      || HIWORD(*(unint64_t *)&mDynamicHidingRowsCols) == 0;
    v5 = v4 || (*(_QWORD *)&mDynamicHidingRowsCols & 0xFFFF00000000) == 0;
    if (!v5
      && (unsigned __int16)*(_QWORD *)&self->mDynamicHidingRowsCols <= a3.var0
      && (unsigned __int16)(mDynamicHidingRowsCols.origin.row + mDynamicHidingRowsCols.size.numberOfRows - 1) >= a3.var0
      && a3.var1 >= mDynamicHidingRowsCols.origin.column
      && a3.var1 <= (LOBYTE(mDynamicHidingRowsCols.size.numberOfColumns)
                                                  + mDynamicHidingRowsCols.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDynamicallyHidingContentOfCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingContent;
  BOOL v4;
  BOOL v5;
  BOOL result;

  mDynamicHidingContent = self->mDynamicHidingContent;
  result = 0;
  if (self->mDynamicHidingContent.origin.row != 0xFFFF)
  {
    v4 = (*(_QWORD *)&mDynamicHidingContent & 0xFF0000) == 0xFF0000
      || HIWORD(*(unint64_t *)&mDynamicHidingContent) == 0;
    v5 = v4 || (*(_QWORD *)&mDynamicHidingContent & 0xFFFF00000000) == 0;
    if (!v5
      && (unsigned __int16)*(_QWORD *)&self->mDynamicHidingContent <= a3.var0
      && (unsigned __int16)(mDynamicHidingContent.origin.row + mDynamicHidingContent.size.numberOfRows - 1) >= a3.var0
      && a3.var1 >= mDynamicHidingContent.origin.column
      && a3.var1 <= (LOBYTE(mDynamicHidingContent.size.numberOfColumns)
                                                  + mDynamicHidingContent.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDynamicallyHidingTextOfCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingText;
  BOOL v4;
  BOOL v5;
  BOOL result;

  mDynamicHidingText = self->mDynamicHidingText;
  result = 0;
  if (self->mDynamicHidingText.origin.row != 0xFFFF)
  {
    v4 = (*(_QWORD *)&mDynamicHidingText & 0xFF0000) == 0xFF0000
      || HIWORD(*(unint64_t *)&mDynamicHidingText) == 0;
    v5 = v4 || (*(_QWORD *)&mDynamicHidingText & 0xFFFF00000000) == 0;
    if (!v5
      && (unsigned __int16)*(_QWORD *)&self->mDynamicHidingText <= a3.var0
      && (unsigned __int16)(mDynamicHidingText.origin.row + mDynamicHidingText.size.numberOfRows - 1) >= a3.var0
      && a3.var1 >= mDynamicHidingText.origin.column
      && a3.var1 <= (LOBYTE(mDynamicHidingText.size.numberOfColumns)
                                                  + mDynamicHidingText.origin.column
                                                  - 1))
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isDynamicallyChangingInfoGeometry
{
  return self->mDynamicInfoGeometry != 0;
}

- (void)updateDynamicResize:(int)a3 resizingRange:(id)a4 resizeAdjustment:(double)a5
{
  double *p_mDynamicResizingColumnAdjustment;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingColumnRange;
  uint64_t v10;
  uint64_t v11;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicResizingRowRange;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  if (a3 == 1)
  {
    p_mDynamicResizingColumnAdjustment = &self->mDynamicResizingColumnAdjustment;
    mDynamicResizingColumnRange = self->mDynamicResizingColumnRange;
    v10 = 452;
    v11 = 450;
    if (self->mDynamicResizingColumnAdjustment == 0.0)
    {
      if (mDynamicResizingColumnRange.origin.row == 0xFFFFLL)
        goto LABEL_27;
      if ((*(_QWORD *)&mDynamicResizingColumnRange & 0xFF0000) == 0xFF0000)
        goto LABEL_27;
      v10 = 452;
      v11 = 450;
      if (!HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)
        || (*(_QWORD *)&mDynamicResizingColumnRange & 0xFFFF00000000) == 0)
      {
        goto LABEL_27;
      }
    }
    else
    {
      v13 = 3448;
      if (mDynamicResizingColumnRange.origin.row == 0xFFFFLL
        || (*(_QWORD *)&mDynamicResizingColumnRange & 0xFF0000) == 0xFF0000)
      {
        goto LABEL_26;
      }
    }
    v10 = 452;
    v11 = 450;
    v13 = 3448;
    if (HIWORD(*(unint64_t *)&mDynamicResizingColumnRange)
      && (*(_QWORD *)&mDynamicResizingColumnRange & 0xFFFF00000000) != 0)
    {
      v10 = 452;
      v11 = 450;
      if (self->mDynamicResizingColumns)
        goto LABEL_27;
      v13 = 3448;
    }
LABEL_26:
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMasterLayout updateDynamicResize:resizingRange:resizeAdjustment:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), v13, CFSTR("Dynamic resize invariants violated."));
    goto LABEL_27;
  }
  p_mDynamicResizingColumnAdjustment = &self->mDynamicResizingRowAdjustment;
  mDynamicResizingRowRange = self->mDynamicResizingRowRange;
  v10 = 474;
  v11 = 472;
  if (self->mDynamicResizingRowAdjustment != 0.0)
  {
    v13 = 3457;
    if (mDynamicResizingRowRange.origin.row == 0xFFFFLL
      || (*(_QWORD *)&mDynamicResizingRowRange & 0xFF0000) == 0xFF0000)
    {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  if (mDynamicResizingRowRange.origin.row != 0xFFFFLL && (*(_QWORD *)&mDynamicResizingRowRange & 0xFF0000) != 0xFF0000)
  {
    v10 = 474;
    v11 = 472;
    if (HIWORD(*(unint64_t *)&mDynamicResizingRowRange))
    {
      if ((*(_QWORD *)&mDynamicResizingRowRange & 0xFFFF00000000) != 0)
      {
LABEL_22:
        v10 = 474;
        v11 = 472;
        v13 = 3457;
        if (HIWORD(*(unint64_t *)&mDynamicResizingRowRange)
          && (*(_QWORD *)&mDynamicResizingRowRange & 0xFFFF00000000) != 0)
        {
          v10 = 474;
          v11 = 472;
          if (self->mDynamicResizingRows)
            goto LABEL_27;
          v13 = 3457;
        }
        goto LABEL_26;
      }
    }
  }
LABEL_27:
  *((_BYTE *)&self->super.isa + v11) = 1;
  *($CA3468F20078D5D2DB35E78E73CA60DA *)((char *)&self->super.isa + v10) = a4;
  *p_mDynamicResizingColumnAdjustment = a5;
}

- (BOOL)isDynamicallyRevealingRowsCols
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;

  mDynamicRevealingRowsCols = self->mDynamicRevealingRowsCols;
  if (self->mDynamicRevealingRowsCols.origin.row == 0xFFFF)
    return 0;
  v3 = *(_QWORD *)&mDynamicRevealingRowsCols & 0xFF0000;
  v5 = (*(_QWORD *)&mDynamicRevealingRowsCols & 0xFFFF00000000) == 0;
  v4 = HIWORD(*(unint64_t *)&mDynamicRevealingRowsCols);
  v5 = v5 || v4 == 0;
  v6 = !v5;
  return v3 != 16711680 && v6;
}

- (BOOL)isDynamicallyRevealingRowsCols:(int)a3 rowColIndex:(unsigned __int16)a4
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols;
  BOOL v5;
  BOOL v6;

  mDynamicRevealingRowsCols = self->mDynamicRevealingRowsCols;
  if (self->mDynamicRevealingRowsCols.origin.row == 0xFFFF)
    return 0;
  v5 = (*(_QWORD *)&mDynamicRevealingRowsCols & 0xFF0000) == 0xFF0000
    || HIWORD(*(unint64_t *)&mDynamicRevealingRowsCols) == 0;
  v6 = v5 || (*(_QWORD *)&mDynamicRevealingRowsCols & 0xFFFF00000000) == 0;
  if (v6 || self->mDynamicRevealingRowsColsDirection != a3)
    return 0;
  if (a3 == 1)
    return a4 >= mDynamicRevealingRowsCols.origin.column
        && a4 <= (LOBYTE(mDynamicRevealingRowsCols.size.numberOfColumns)
                                                                + mDynamicRevealingRowsCols.origin.column
                                                                - 1);
  return !a3
      && a4 >= mDynamicRevealingRowsCols.origin.row
      && a4 <= (unsigned __int16)(mDynamicRevealingRowsCols.origin.row
                                              + mDynamicRevealingRowsCols.size.numberOfRows
                                              - 1);
}

- (void)updateDynamicTableNameSize:(double)a3
{
  self->mDynamicTableNameResize = a3;
}

- (BOOL)isDynamicallyResizingTableName
{
  return self->mDynamicTableNameResize != 0.0;
}

- (BOOL)isDynamicallyChangingRowCount
{
  return self->mDynamicAddOrRemoveRowElementSize != 0.0 && self->mDynamicRowAdjustment != 0;
}

- (BOOL)isDynamicallyChangingColumnCount
{
  return self->mDynamicAddOrRemoveColumnElementSize != 0.0 && self->mDynamicColumnAdjustment != 0;
}

- (BOOL)isDynamicallyChangingRowOrColumnCount
{
  return -[TSTMasterLayout isDynamicallyChangingRowCount](self, "isDynamicallyChangingRowCount")
      || -[TSTMasterLayout isDynamicallyChangingColumnCount](self, "isDynamicallyChangingColumnCount");
}

- (void)updateDynamicSelectionRegion:(id)a3
{
  TSTCellRegion *mDynamicSelectionRegion;
  id v6;

  mDynamicSelectionRegion = self->mDynamicSelectionRegion;
  if (mDynamicSelectionRegion)
  {

    self->mDynamicSelectionRegion = 0;
  }
  if (a3)
  {
    v6 = a3;
    self->mDynamicSelectionRegion = (TSTCellRegion *)a3;
  }
}

- (BOOL)isDynamicallyChangingSelection
{
  return self->mDynamicSelectionRegion != 0;
}

- (BOOL)isDynamicallyColumnTabResizing
{
  return self->mDynamicColumnTabSize != 0.0;
}

- (BOOL)isDynamicallyRowTabResizing
{
  return self->mDynamicRowTabSize != 0.0;
}

- (BOOL)isDynamicallySettingBandedFill
{
  return self->mDynamicBandedFill;
}

- (BOOL)isDynamicallyRepressingFrozenHeaders
{
  return self->mDynamicRepressFrozenHeader;
}

- (BOOL)updateDynamicChangeRowOrColumnCount:(int)a3 count:(int)a4 newlyAddedElementSize:(double)a5
{
  uint64_t v6;
  unsigned int TableNumberOfColumns;
  uint64_t TableNumberOfRows;
  TSTTableModel *v11;
  int v12;
  int v13;
  int v15;
  int v16;
  int *p_mDynamicRowAdjustment;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  TSTMasterLayout *v21;
  uint64_t v22;
  int v23;
  int mCachedNumberOfFooterRows;
  unint64_t v25;
  uint64_t v26;

  if (!a4)
    return 1;
  v6 = *(_QWORD *)&a4;
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  v11 = -[TSTMasterLayout tableModel](self, "tableModel");
  if (!a3)
  {
    v15 = -[TSTTableModel numberOfRows](v11, "numberOfRows") + v6 + self->mDynamicRowAdjustment;
    self->mDynamicResizingRows = 1;
    self->mDynamicAddOrRemoveRowElementSize = a5;
    if (v15 <= SLODWORD(self->mCachedMaxNumberOfRows))
    {
      v16 = -[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable") ? 0 : self->mCachedNumberOfHeaderRows;
      v23 = -[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable") ? 0 : self->mCachedNumberOfFooterRows;
      if (v15 > v23 + v16)
      {
        p_mDynamicRowAdjustment = &self->mDynamicRowAdjustment;
        TSTLayoutInvalidateLayoutSpaceTableOffsets(-[TSTMasterLayout dynamicLayout](self, "dynamicLayout"));
        TSTLayoutInvalidateLayoutSpaceCoordinates(-[TSTMasterLayout dynamicLayout](self, "dynamicLayout"));
        if (-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
          mCachedNumberOfFooterRows = 0;
        else
          mCachedNumberOfFooterRows = self->mCachedNumberOfFooterRows;
        v25 = (unint64_t)TableNumberOfColumns << 32;
        if ((int)v6 < 1)
        {
          v26 = (unsigned __int16)(TableNumberOfRows + v6 - mCachedNumberOfFooterRows);
          v19 = v26 | ((unint64_t)-(int)v6 << 48) | v25;
          v20 = v26 | ((unint64_t)(mCachedNumberOfFooterRows - v6 + 1) << 48) | v25;
          v21 = self;
          v22 = 21;
        }
        else
        {
          v19 = (unsigned __int16)(TableNumberOfRows - mCachedNumberOfFooterRows) | (unint64_t)(v6 << 48) | v25;
          v20 = (unsigned __int16)(TableNumberOfRows + ~(_WORD)mCachedNumberOfFooterRows) | ((unint64_t)(v6 + mCachedNumberOfFooterRows + 1) << 48) | v25;
          v21 = self;
          v22 = 22;
        }
        goto LABEL_27;
      }
    }
    return 0;
  }
  v12 = -[TSTTableModel numberOfColumns](v11, "numberOfColumns") + v6 + self->mDynamicColumnAdjustment;
  self->mDynamicResizingColumns = 1;
  self->mDynamicAddOrRemoveColumnElementSize = a5;
  if (v12 > SLODWORD(self->mCachedMaxNumberOfColumns))
    return 0;
  v13 = -[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable") ? 0 : self->mCachedNumberOfHeaderColumns;
  if (v12 <= v13)
    return 0;
  p_mDynamicRowAdjustment = &self->mDynamicColumnAdjustment;
  v18 = TableNumberOfRows << 48;
  TSTLayoutInvalidateLayoutSpaceTableOffsets(-[TSTMasterLayout dynamicLayout](self, "dynamicLayout"));
  TSTLayoutInvalidateLayoutSpaceCoordinates(-[TSTMasterLayout dynamicLayout](self, "dynamicLayout"));
  if ((int)v6 < 1)
  {
    v19 = v18 | ((unint64_t)((((v18 | ((unint64_t)TableNumberOfColumns << 32)) >> 32)
                                                                  + v6)
                                  - ((_DWORD)v6 << 16)) << 16);
    v20 = (((((v18 | ((unint64_t)TableNumberOfColumns << 32)) >> 32) + (_DWORD)v6) << 16) + 16711680) & 0xFF0000 | ((unint64_t)(unsigned __int16)(1 - v6) << 32) | v18;
    v21 = self;
    v22 = 1;
  }
  else
  {
    v19 = v18 | ((unint64_t)(TableNumberOfColumns | ((_DWORD)v6 << 16)) << 16);
    v20 = ((TableNumberOfColumns << 16) + 16711680) & 0xFF0000 | ((unint64_t)(unsigned __int16)(v6 + 1) << 32) | v18;
    v21 = self;
    v22 = 2;
  }
LABEL_27:
  -[TSTMasterLayout addChangeDescriptorWithType:andCellRange:andStrokeRange:](v21, "addChangeDescriptorWithType:andCellRange:andStrokeRange:", v22, v19, v20);
  *p_mDynamicRowAdjustment += v6;
  -[TSTLayout invalidateSize](-[TSTMasterLayout dynamicLayout](self, "dynamicLayout"), "invalidateSize");
  -[TSTLayout validate](-[TSTMasterLayout dynamicLayout](self, "dynamicLayout"), "validate");
  return 1;
}

- (void)updateDynamicColumnTabSize:(double)a3
{
  self->mDynamicColumnTabSize = a3;
}

- (void)updateDynamicRowTabSize:(double)a3
{
  self->mDynamicRowTabSize = a3;
}

- (void)updateDynamicBandedFill:(BOOL)a3 setting:(BOOL)a4
{
  self->mDynamicBandedFill = a3;
  self->mDynamicBandedFillSetting = a4;
}

- (void)updateDynamicRepressFrozenHeader:(BOOL)a3
{
  self->mDynamicRepressFrozenHeader = a3;
}

- (void)updateDynamicHidingRowsCols:(int)a3 hidingCellRange:(id)a4
{
  int mDynamicHidingRowsColsDirection;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicHidingRowsCols;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;

  mDynamicHidingRowsColsDirection = self->mDynamicHidingRowsColsDirection;
  mDynamicHidingRowsCols = self->mDynamicHidingRowsCols;
  if (mDynamicHidingRowsColsDirection != a3
    || ((*(_QWORD *)&mDynamicHidingRowsCols ^ *(_QWORD *)&a4) & 0xFFFFFFFF00FFFFFFLL) != 0)
  {
    if (mDynamicHidingRowsCols.origin.row != 0xFFFF)
    {
      v10 = (*(_QWORD *)&mDynamicHidingRowsCols & 0xFF0000) == 0xFF0000
         || mDynamicHidingRowsCols.size.numberOfRows == 0;
      if (!v10 && (*(_QWORD *)&mDynamicHidingRowsCols & 0xFFFF00000000) != 0)
      {
        if (mDynamicHidingRowsColsDirection == 1)
          v12 = 5;
        else
          v12 = 26;
        -[TSTMasterLayout addChangeDescriptorWithType:andCellRange:andStrokeRange:](self, "addChangeDescriptorWithType:andCellRange:andStrokeRange:", v12, mDynamicHidingRowsCols, *(_QWORD *)&self->mDynamicHidingRowsCols);
      }
    }
    if (a4.var0.var0 != 0xFFFF
      && (*(_QWORD *)&a4 & 0xFF0000) != 0xFF0000
      && HIWORD(*(unint64_t *)&a4)
      && (*(_QWORD *)&a4 & 0xFFFF00000000) != 0)
    {
      if (a3 == 1)
        v13 = 5;
      else
        v13 = 26;
      -[TSTMasterLayout addChangeDescriptorWithType:andCellRange:andStrokeRange:](self, "addChangeDescriptorWithType:andCellRange:andStrokeRange:", v13, a4, a4);
    }
    self->mDynamicHidingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)a4;
    self->mDynamicHidingRowsColsDirection = a3;
  }
}

- (void)updateDynamicHidingContent:(id)a3
{
  self->mDynamicHidingContent = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- (void)updateDynamicHidingText:(id)a3
{
  self->mDynamicHidingText = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- (void)updateDynamicInfoGeometry:(id)a3
{

  self->mDynamicInfoGeometry = (TSDInfoGeometry *)objc_msgSend(a3, "copy");
}

- (void)updateDynamicRevealingRowsCols:(int)a3 revealingCellRange:(id)a4
{
  int mDynamicRevealingRowsColsDirection;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicRevealingRowsCols;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;

  mDynamicRevealingRowsColsDirection = self->mDynamicRevealingRowsColsDirection;
  mDynamicRevealingRowsCols = self->mDynamicRevealingRowsCols;
  if (mDynamicRevealingRowsColsDirection != a3
    || ((*(_QWORD *)&mDynamicRevealingRowsCols ^ *(_QWORD *)&a4) & 0xFFFFFFFF00FFFFFFLL) != 0)
  {
    if (mDynamicRevealingRowsCols.origin.row != 0xFFFF)
    {
      v10 = (*(_QWORD *)&mDynamicRevealingRowsCols & 0xFF0000) == 0xFF0000
         || mDynamicRevealingRowsCols.size.numberOfRows == 0;
      if (!v10 && (*(_QWORD *)&mDynamicRevealingRowsCols & 0xFFFF00000000) != 0)
      {
        if (mDynamicRevealingRowsColsDirection == 1)
          v12 = 5;
        else
          v12 = 26;
        -[TSTMasterLayout addChangeDescriptorWithType:andCellRange:andStrokeRange:](self, "addChangeDescriptorWithType:andCellRange:andStrokeRange:", v12, mDynamicRevealingRowsCols, *(_QWORD *)&self->mDynamicRevealingRowsCols);
      }
    }
    if (a4.var0.var0 != 0xFFFF
      && (*(_QWORD *)&a4 & 0xFF0000) != 0xFF0000
      && HIWORD(*(unint64_t *)&a4)
      && (*(_QWORD *)&a4 & 0xFFFF00000000) != 0)
    {
      if (a3 == 1)
        v13 = 5;
      else
        v13 = 26;
      -[TSTMasterLayout addChangeDescriptorWithType:andCellRange:andStrokeRange:](self, "addChangeDescriptorWithType:andCellRange:andStrokeRange:", v13, a4, a4);
    }
    self->mDynamicRevealingRowsCols = ($6C2899CC353BE70625C5C4ACBB5C74E2)a4;
    self->mDynamicRevealingRowsColsDirection = a3;
  }
}

- (void)updateDynamicContentDelegate:(id)a3
{
  TSTLayoutDynamicContentProtocol *mDynamicContentDelegate;
  id v6;

  mDynamicContentDelegate = self->mDynamicContentDelegate;
  if (mDynamicContentDelegate != a3)
  {
    if (mDynamicContentDelegate)
    {

      self->mDynamicContentDelegate = 0;
    }
    if (a3)
    {
      v6 = a3;
      self->mDynamicContentDelegate = (TSTLayoutDynamicContentProtocol *)a3;
    }
  }
}

- (void)updateDynamicFontColor:(id)a3 andRange:(id)a4
{
  TSUColor *mDynamicFontColor;
  id v8;

  mDynamicFontColor = self->mDynamicFontColor;
  if (mDynamicFontColor)
  {

    self->mDynamicFontColor = 0;
  }
  if (a3)
  {
    v8 = a3;
    self->mDynamicFontColor = (TSUColor *)a3;
  }
  self->mDynamicFontColorCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a4;
}

- (void)updateDynamicRowSwapDelegate:(id)a3
{
  TSTLayoutDynamicRowSwapProtocol *mDynamicRowSwapDelegate;
  id v6;

  mDynamicRowSwapDelegate = self->mDynamicRowSwapDelegate;
  if (mDynamicRowSwapDelegate)
  {

    self->mDynamicRowSwapDelegate = 0;
  }
  if (a3)
  {
    v6 = a3;
    self->mDynamicRowSwapDelegate = (TSTLayoutDynamicRowSwapProtocol *)a3;
  }
}

- (void)updateDynamicColumnSwapDelegate:(id)a3
{
  TSTLayoutDynamicColumnSwapProtocol *mDynamicColumnSwapDelegate;
  id v6;

  mDynamicColumnSwapDelegate = self->mDynamicColumnSwapDelegate;
  if (mDynamicColumnSwapDelegate)
  {

    self->mDynamicColumnSwapDelegate = 0;
  }
  if (a3)
  {
    v6 = a3;
    self->mDynamicColumnSwapDelegate = (TSTLayoutDynamicColumnSwapProtocol *)a3;
  }
}

- (void)updateDynamicSuppressingConditionalStylesCellID:(id)a3
{
  self->mDynamicSuppressingConditionalStylesCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (TSTLayoutDynamicContentProtocol)dynamicContentDelegate
{
  return self->mDynamicContentDelegate;
}

- (BOOL)isDynamicallyChangingContent
{
  TSTLayoutDynamicContentProtocol *mDynamicContentDelegate;

  mDynamicContentDelegate = self->mDynamicContentDelegate;
  if (mDynamicContentDelegate)
  {
    if (!-[TSTLayoutDynamicContentProtocol dynamicContentMustDrawOnMainThread](mDynamicContentDelegate, "dynamicContentMustDrawOnMainThread")|| (LODWORD(mDynamicContentDelegate) = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"), (_DWORD)mDynamicContentDelegate))
    {
      LOBYTE(mDynamicContentDelegate) = 1;
    }
  }
  return (char)mDynamicContentDelegate;
}

- (BOOL)isDynamicallyChangingFontColorOfCellID:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mDynamicFontColorCellRange;
  BOOL v4;
  BOOL result;

  result = self->mDynamicFontColor
        && ((mDynamicFontColorCellRange = self->mDynamicFontColorCellRange,
             HIWORD(*(unint64_t *)&mDynamicFontColorCellRange))
          ? (v4 = (*(_QWORD *)&mDynamicFontColorCellRange & 0xFFFF00000000) == 0)
          : (v4 = 1),
            !v4
         && (unsigned __int16)*(_QWORD *)&self->mDynamicFontColorCellRange <= a3.var0
         && (unsigned __int16)(mDynamicFontColorCellRange.origin.row + mDynamicFontColorCellRange.size.numberOfRows - 1) >= a3.var0
         && a3.var1 >= mDynamicFontColorCellRange.origin.column)
        && a3.var1 <= (LOBYTE(mDynamicFontColorCellRange.size.numberOfColumns)
                                                    + mDynamicFontColorCellRange.origin.column
                                                    - 1);
  return result;
}

- (TSTLayoutDynamicRowSwapProtocol)dynamicRowSwapDelegate
{
  return self->mDynamicRowSwapDelegate;
}

- (BOOL)isDynamicallySwappingRows
{
  return self->mDynamicRowSwapDelegate != 0;
}

- (TSTLayoutDynamicColumnSwapProtocol)dynamicColumnSwapDelegate
{
  return self->mDynamicColumnSwapDelegate;
}

- (BOOL)isDynamicallySwappingColumns
{
  return self->mDynamicColumnSwapDelegate != 0;
}

- (void)updateDynamicResizeInfo:(id)a3
{

  self->mDynamicResizeInfo = 0;
  self->mDynamicResizeInfo = (TSTLayoutDynamicResizeInfo *)a3;
}

- (void)invalidateDynamicResizeInfo
{
  -[TSTLayoutDynamicResizeInfo invalidate](self->mDynamicResizeInfo, "invalidate");
}

- (BOOL)isGrouped
{
  -[TSDDrawableInfo parentInfo](-[TSTMasterLayout tableInfo](self, "tableInfo"), "parentInfo");
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (void)p_processChange:(id)a3 forChangeSource:(id)a4
{
  TSTChangeDescriptor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v12;
  uint64_t v13;
  unint64_t v14;

  if (objc_msgSend(a4, "isEqual:", -[TSTMasterLayout tableInfo](self, "tableInfo")))
  {
    objc_opt_class();
    objc_msgSend(a3, "details");
    v6 = (TSTChangeDescriptor *)TSUDynamicCast();
    if (v6)
    {
LABEL_19:
      -[TSTMasterLayout addChangeDescriptor:](self, "addChangeDescriptor:", v6);
      return;
    }
    objc_opt_class();
    objc_msgSend(a3, "details");
    v7 = (void *)TSUDynamicCast();
    if (v7)
    {
      v8 = (void *)objc_msgSend(v7, "changedProperties");
      v9 = (void *)objc_msgSend(v8, "propertySetByIntersectingWithPropertySet:", +[TSWPParagraphStyle properties](TSWPParagraphStyle, "properties"));
      v10 = (void *)objc_msgSend(v8, "propertySetByIntersectingWithPropertySet:", +[TSTCellStyle properties](TSTCellStyle, "properties"));
      if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
      {
        v6 = +[TSTChangeDescriptor changeDescriptorWithType:cellRange:strokeRange:](TSTChangeDescriptor, "changeDescriptorWithType:cellRange:strokeRange:", 40, -[TSTTableModel range](-[TSTMasterLayout tableModel](self, "tableModel"), "range"), -[TSTTableModel range](-[TSTMasterLayout tableModel](self, "tableModel"), "range"));
        goto LABEL_19;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v11 = (void *)TSUDynamicCast();
      if (objc_msgSend(v11, "wpKind") == 5)
      {
        v12 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTEditingState editingCellID](-[TSTTableInfo editingState](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingState"), "editingCellID");
        v13 = objc_msgSend(v11, "hyperlinkCellID");
        if ((_WORD)v13 != 0xFFFF && (v13 & 0xFF0000) != 0xFF0000)
          v12 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)objc_msgSend(v11, "hyperlinkCellID");
        v14 = *(unsigned int *)&v12 | 0x1000100000000;
        if (!-[TSTMasterLayout emptyFilteredTable](self, "emptyFilteredTable"))
          v14 = TSTTableExpandCellRangeToCoverMergedCells((uint64_t)-[TSTMasterLayout tableModel](self, "tableModel"), *(unsigned int *)&v12 | 0x1000100000000);
        if ((_WORD)v14 != 0xFFFF && (v14 & 0xFF0000) != 0xFF0000 && HIWORD(v14) && (v14 & 0xFFFF00000000) != 0)
        {
          v6 = +[TSTChangeDescriptor changeDescriptorWithType:cellRange:](TSTChangeDescriptor, "changeDescriptorWithType:cellRange:", 33, v14);
          goto LABEL_19;
        }
      }
    }
  }
}

- (void)syncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 && objc_msgSend(a3, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(a3);
          -[TSTMasterLayout p_processChange:forChangeSource:](self, "p_processChange:forChangeSource:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
    if (-[TSTMasterLayout tableInfo](self, "tableInfo") == a4)
      -[TSTLayout processChanges:](-[TSTTablePartitioner scaledLayout](-[TSTTableInfo partitioner](-[TSTMasterLayout tableInfo](self, "tableInfo"), "partitioner"), "scaledLayout"), "processChanges:", a3);
  }
}

- (void)addChangeDescriptorWithType:(int)a3 andCellRange:(id)a4
{
  -[TSTMasterLayout addChangeDescriptorWithType:andCellRange:andStrokeRange:](self, "addChangeDescriptorWithType:andCellRange:andStrokeRange:", *(_QWORD *)&a3, a4, 0xFFFFFFLL);
}

- (void)addChangeDescriptorWithType:(int)a3 andCellRange:(id)a4 andStrokeRange:(id)a5
{
  -[TSTMasterLayout addChangeDescriptor:](self, "addChangeDescriptor:", +[TSTChangeDescriptor changeDescriptorWithType:cellRange:strokeRange:](TSTChangeDescriptor, "changeDescriptorWithType:cellRange:strokeRange:", *(_QWORD *)&a3, a4, a5));
}

- (void)addChangeDescriptor:(id)a3
{
  NSMutableArray *mChangeDescriptors;

  if (a3)
  {
    mChangeDescriptors = self->mChangeDescriptors;
    objc_sync_enter(mChangeDescriptors);
    if (objc_msgSend(a3, "changeDescriptor") != 33
      && objc_msgSend(a3, "changeDescriptor") != 29
      || (objc_msgSend((id)-[NSMutableArray lastObject](-[TSTMasterLayout changeDescriptors](self, "changeDescriptors"), "lastObject"), "isEqual:", a3) & 1) == 0)
    {
      -[NSMutableArray addObject:](-[TSTMasterLayout changeDescriptors](self, "changeDescriptors"), "addObject:", a3);
    }
    objc_sync_exit(mChangeDescriptors);
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3
{
  -[TSTMasterLayout setChangeNotifier:](self, "setChangeNotifier:", objc_msgSend(a3, "changeNotifier"));
}

- (void)wasRemovedFromDocumentRoot
{
  TSKChangeNotifier *mChangeNotifier;

  mChangeNotifier = self->mChangeNotifier;
  if (mChangeNotifier)
  {
    if (self->mTableInfo)
    {
      -[TSKChangeNotifier removeObserver:forChangeSource:](mChangeNotifier, "removeObserver:forChangeSource:", self);

      self->mChangeNotifier = 0;
    }
  }
}

- (void)validate
{
  _BOOL4 v3;

  -[NSLock lock](self->mLock, "lock");
  self->mCachedNumberOfHeaderColumns = -[TSTTableModel numberOfHeaderColumns](-[TSTMasterLayout tableModel](self, "tableModel"), "numberOfHeaderColumns");
  self->mCachedNumberOfHeaderRows = -[TSTTableModel numberOfHeaderRows](-[TSTMasterLayout tableModel](self, "tableModel"), "numberOfHeaderRows");
  self->mCachedNumberOfFooterRows = -[TSTTableModel numberOfFooterRows](-[TSTMasterLayout tableModel](self, "tableModel"), "numberOfFooterRows");
  v3 = -[TSTTableModel tableNameEnabled](-[TSTMasterLayout tableModel](self, "tableModel"), "tableNameEnabled");
  if (self->mTableNameEnabled != v3)
    self->mTableNameEnabled = v3;
  TSTMasterLayoutStrokesArrayRangeUpdate(self);
  -[TSTMasterLayout validateBandedFill](self, "validateBandedFill");
  -[TSTMasterLayout validateTableRowsBehavior](self, "validateTableRowsBehavior");
  -[TSTMasterLayout validateDynamicResizeInfo](self, "validateDynamicResizeInfo");
  -[TSTMasterLayout validateChangeDescriptorQueue](self, "validateChangeDescriptorQueue");
  -[NSLock unlock](self->mLock, "unlock");
}

- (void)validateMasterLayoutForChangeDescriptors:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 |= objc_msgSend(v11, "changeDescriptor") == 31;
        v8 |= objc_msgSend(v11, "changeDescriptor") == 29;
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      -[TSTMasterLayout invalidateTableNameHeight](self, "invalidateTableNameHeight");
    if ((v8 & 1) != 0)
      -[TSTMasterLayout invalidateDefaultFontHeights](self, "invalidateDefaultFontHeights");
  }
}

- (void)validateChangeDescriptorQueue
{
  NSMutableArray *mChangeDescriptors;
  void *v4;
  id v5;

  TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  mChangeDescriptors = self->mChangeDescriptors;
  objc_sync_enter(mChangeDescriptors);
  if (-[NSMutableArray count](self->mChangeDescriptors, "count"))
  {
    v4 = (void *)-[NSMutableArray mutableCopy](-[TSTMasterLayout changeDescriptors](self, "changeDescriptors"), "mutableCopy");
    -[NSMutableArray removeAllObjects](-[TSTMasterLayout changeDescriptors](self, "changeDescriptors"), "removeAllObjects");
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(mChangeDescriptors);
  -[TSTMasterLayout validateRowVisibility:](self, "validateRowVisibility:", v4);
  if (v4)
  {
    -[TSUConcurrentCache removeAllObjects](-[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache"), "removeAllObjects");
    -[TSUReadWriteQueue waitOnInFlightWriters](-[TSUConcurrentCache readWriteQueue](-[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache"), "readWriteQueue"), "waitOnInFlightWriters");
    self->mCurrentLayoutTask = -[TSTLayoutTask initWithMasterLayout:]([TSTLayoutTask alloc], "initWithMasterLayout:", self);
    v5 = -[TSTWidthHeightCache validateChangeDescriptors:tableModel:](-[TSTMasterLayout widthHeightCache](self, "widthHeightCache"), "validateChangeDescriptors:tableModel:", v4, -[TSTMasterLayout tableModel](self, "tableModel"));
    -[TSTHiddenRowsColumnsCache validateChangeDescriptors:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "validateChangeDescriptors:", v4);
    -[TSTMasterLayout validateMasterLayoutForChangeDescriptors:](self, "validateMasterLayoutForChangeDescriptors:", v4);
    -[TSTHiddenRowsColumnsCache validate:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "validate:", self);
    -[TSTMasterLayout validateDefaultFontHeights](self, "validateDefaultFontHeights");
    -[TSTMasterLayout validateStrokesForRegion:regionAlreadyValidated:](self, "validateStrokesForRegion:regionAlreadyValidated:", -[TSTMasterLayout regionForStrokeValidationFromChangeDescriptors:](self, "regionForStrokeValidationFromChangeDescriptors:", v4), -[TSTMasterLayout validateFittingInfoForChangeDescriptors:rowsNeedingFittingInfo:](self, "validateFittingInfoForChangeDescriptors:rowsNeedingFittingInfo:", v4, v5));

    -[TSTMasterLayout processLayoutTask:](self, "processLayoutTask:", self->mCurrentLayoutTask);
    self->mCurrentLayoutTask = 0;
    -[TSTMasterLayout waitForLayoutToComplete](self, "waitForLayoutToComplete");
    -[TSTMasterLayout updateWHCForMergeRanges](self, "updateWHCForMergeRanges");
    -[TSURetainedPointerKeyDictionary removeAllObjects](self->mParaStyleToHeightCache, "removeAllObjects");
  }
}

- (void)updateWHCForMergeRanges
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  $CA3468F20078D5D2DB35E78E73CA60DA v6;
  double v7;
  double v8;
  unsigned __int16 v9;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  TSTWidthHeightCache *v15;
  double v16;
  unint64_t v17;
  unsigned int v18;

  v6 = -[TSTMergeRangeSortedSet begin](self->mMergeRanges, "begin");
  if (v6.var0.var0 != 0xFFFF && (*(_QWORD *)&v6 & 0xFF0000) != 0xFF0000)
  {
    do
    {
      if (!HIWORD(*(unint64_t *)&v6) || (*(_QWORD *)&v6 & 0xFFFF00000000) == 0)
        break;
      -[TSTMergeRangeSortedSet getSize](self->mMergeRanges, "getSize");
      v8 = v7;
      v9 = v6.var0.var0 + v6.var1.var1 - 1;
      var0 = v6.var0;
      if (v9 > v6.var0.var0)
      {
        do
        {
          v8 = v8 - TSTMasterLayoutHeightOfRow(self, var0.var0, 0, 0, 1, 1);
          ++*(_DWORD *)&var0;
        }
        while (var0.var0 < v9);
      }
      v11 = *(_DWORD *)&v6.var0 & 0xFF0000 | v9;
      -[TSTMergeRangeSortedSet isCheckbox](self->mMergeRanges, "isCheckbox");
      -[TSTMergeRangeSortedSet getPaddingInsets](self->mMergeRanges, "getPaddingInsets");
      if (v8 <= 8.0)
      {
        v3 = v3 & 0xFFFFFFFF00000000 | v11;
        v18 = -[TSTMasterLayout tableAreaForCellID:](self, "tableAreaForCellID:", v3);
        v15 = -[TSTMasterLayout widthHeightCache](self, "widthHeightCache");
        v16 = self->mTableDefaultFontHeightForArea[v18];
        v2 = v2 & 0xFFFFFFFF00000000 | v11;
        v17 = v2;
      }
      else
      {
        v14 = v13 + v8 + v12;
        v15 = -[TSTMasterLayout widthHeightCache](self, "widthHeightCache");
        v4 = v4 & 0xFFFFFFFF00000000 | v11;
        v16 = v14;
        v17 = v4;
      }
      -[TSTWidthHeightCache setFitHeight:forCellID:](v15, "setFitHeight:forCellID:", v17, v16);
      v6 = -[TSTMergeRangeSortedSet iter](self->mMergeRanges, "iter");
      if (v6.var0.var0 == 0xFFFF)
        break;
    }
    while ((*(_QWORD *)&v6 & 0xFF0000) != 0xFF0000);
  }
  -[TSTMergeRangeSortedSet reset](self->mMergeRanges, "reset");
}

- (void)validateFittingInfoForCell:(id)a3 cellID:(id)a4 mergeRange:(id)a5 setFitting:(BOOL)a6
{
  uint64_t var1;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v11;
  unint64_t v12;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v13;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v22;
  unsigned int v23;
  int v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int v43;
  int v44;
  char v45;
  double v46;
  double v47;
  TSTWidthHeightCache *mWidthHeightCache;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  unint64_t v58;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v59;
  __int16 v60;
  unint64_t v61;
  int v62;
  void *v63;
  _BOOL4 v64;
  _BOOL4 v65;
  uint64_t v66;

  var1 = a5.var1.var1;
  v11 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTMasterLayout modelCellIDForLayoutCellID:](self, "modelCellIDForLayoutCellID:", *(_DWORD *)&a5.var0);
  v12 = a4;
  v13 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTMasterLayout modelCellIDForLayoutCellID:](self, "modelCellIDForLayoutCellID:", *(unsigned int *)&a4);
  v14 = v13;
  if (v11.var0 == 0xFFFF
    || (*(_QWORD *)&v11.var0 & 0xFF0000) == 0xFF0000
    || !var1
    || (*(_QWORD *)&a5 & 0xFFFF00000000) == 0)
  {
    v57 = 1;
    v58 = 0x100000000;
  }
  else
  {
    if (((*(_DWORD *)&v13 ^ *(_DWORD *)&v11) & 0xFFFFFF) != 0)
      return;
    v57 = var1;
    v58 = *(_QWORD *)&a5 & 0xFFFFFFFF00000000;
    a4 = v11;
  }
  v59 = a4;
  v61 = v12;
  if (a3)
  {
    v15 = *((unsigned __int8 *)a3 + 9);
    v16 = (void *)*((_QWORD *)a3 + 5);
    if (v16)
    {
      v17 = v13;
LABEL_13:
      v18 = (void *)*((_QWORD *)a3 + 7);
      goto LABEL_15;
    }
  }
  else
  {
    v15 = 0;
  }
  v17 = v13;
  v16 = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&v13, 0);
  if (a3)
    goto LABEL_13;
  v18 = 0;
LABEL_15:
  v66 = v17;
  v19 = TSTTableTextStyleForCellWithEmptyStyleAtCellID((uint64_t *)-[TSTMasterLayout tableModel](self, "tableModel"), v17, 0);
  v65 = 0;
  v63 = (void *)v19;
  if (v18)
    v20 = v18;
  else
    v20 = (void *)v19;
  if (a5.var0.var0 != 0xFFFF && (*(_QWORD *)&a5 & 0xFF0000) != 0xFF0000)
  {
    v22 = (*(_QWORD *)&a5 & 0xFFFF00000000) != 0 && var1 != 0;
    v65 = v22;
  }
  v55 = *(_QWORD *)&a5 & 0xFF0000;
  v56 = v15;
  if (v15 == 3 || v15 == 9)
  {
    if (!a3)
      goto LABEL_31;
  }
  else if (!*((_DWORD *)a3 + 25) || *((_DWORD *)a3 + 26) != 266)
  {
    v25 = 0;
    v64 = 0;
    v62 = 0;
    goto LABEL_42;
  }
  v23 = *((_DWORD *)a3 + 2);
  if ((v23 & 0x10000) != 0)
  {
    v24 = HIWORD(v23) & 1;
    goto LABEL_36;
  }
LABEL_31:
  v24 = objc_msgSend((id)TSTTableStringForCellAtCellID((uint64_t)-[TSTMasterLayout tableModel](self, "tableModel"), (uint64_t)a3, v66), "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet")) != 0x7FFFFFFFFFFFFFFFLL;
LABEL_36:
  v62 = v24;
  if (v16)
    v64 = (objc_msgSend(v16, "intValueForProperty:", 896) & 0x7FFFFFFF) != 0;
  else
    v64 = 0;
  if (self->mContainedTextEditor)
    v25 = ((-[TSTTableInfo editingCellID](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingCellID") ^ *(_DWORD *)&v14) & 0xFFFFFF) == 0;
  else
    v25 = 0;
LABEL_42:
  v60 = var1;
  if (v20 && objc_msgSend(v20, "isVariation"))
  {
    objc_msgSend(v20, "overrideCGFloatValueForProperty:", 17);
    v27 = v26;
    if (((*(_QWORD *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
      && (*(_QWORD *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000001
      && *(_QWORD *)&v26 != 0xFFF0000000000000
      && (*(_QWORD *)&v26 & 0x7FFFFFFFFFFFFFFFuLL) - 1 > 0xFFFFFFFFFFFFELL)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v20, "parent"), "CGFloatValueForProperty:", 17);
      v32 = v27 != v31;
    }
    v33 = objc_msgSend(v20, "overrideValueForProperty:", 16) != 0;
    if ((objc_msgSend(v20, "overridesProperty:", 85) & 1) != 0)
      v34 = 1;
    else
      v34 = objc_msgSend(v20, "overridesProperty:", 33);
  }
  else
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
  }
  v35 = objc_msgSend(v16, "valueForProperty:", 904);
  -[TSTMasterLayout edgeInsetsFromPadding:](self, "edgeInsetsFromPadding:", v35);
  v37 = v36;
  v39 = v38;
  -[TSTMasterLayout defaultPaddingForCellID:](self, "defaultPaddingForCellID:", v66);
  v42 = v40 + v41;
  if (((v64 | v62 | v25) & 1) != 0)
  {
    v43 = 1;
  }
  else if (v56 == 9)
  {
    v43 = 1;
  }
  else
  {
    v43 = v34;
  }
  v44 = v32 || v33;
  if (v37 + v39 != v42)
    v44 = 1;
  if (v20 != v63)
    v44 = 1;
  v45 = v44 & v65;
  if (!(*(unint64_t *)&a5 >> 49))
    v45 = 0;
  if ((v45 & 1) != 0 || v43)
  {
    v50 = objc_msgSend(v16, "intValueForProperty:", 903);
    if (v65)
      v51 = v58 & 0xFFFF00000000 | (v57 << 48) | *(unsigned int *)&v59;
    else
      v51 = 0xFFFFFFLL;
    if (TSTCellFormatUsesAccountingStyle(a3))
      v52 = 0;
    else
      v52 = 15;
    HIDWORD(v54) = v52;
    LOBYTE(v54) = 1;
    -[TSTMasterLayout queueCellForValidation:cell:mergeRange:wrap:verticalAlignment:padding:prop:layoutCacheFlags:](self, "queueCellForValidation:cell:mergeRange:wrap:verticalAlignment:padding:prop:layoutCacheFlags:", v58 & 0xFFFF00000000 | (v57 << 48) | *(unsigned int *)&v59, a3, v51, v64, v50, v35, v54);
  }
  else
  {
    if (v44)
    {
      -[TSTMasterLayout fontHeightOfParagraphStyle:](self, "fontHeightOfParagraphStyle:", v20);
      v47 = v39 + v37 + v46;
      mWidthHeightCache = self->mWidthHeightCache;
      if (v65)
        v49 = (unsigned __int16)(a5.var0.var0 + v60 - 1) | v55;
      else
        v49 = v61;
    }
    else
    {
      if (v65)
        v53 = (unsigned __int16)(a5.var0.var0 + v60 - 1) | v55;
      else
        v53 = v61;
      v47 = self->mTableDefaultFontHeightForArea[-[TSTMasterLayout tableAreaForCellID:](self, "tableAreaForCellID:")];
      mWidthHeightCache = self->mWidthHeightCache;
      v49 = v53;
    }
    -[TSTWidthHeightCache setFitHeight:forCellID:](mWidthHeightCache, "setFitHeight:forCellID:", v49, v47);
  }
}

- (void)validateFittingInfoWithCellRange:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  _BOOL4 v6;
  TSTCell *v7;
  _BOOL4 v8;
  uint64_t v9;
  BOOL v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24;
  char v25;
  uint64_t v26;
  _BOOL4 v27;
  unint64_t v28;
  TSTCell *v29;
  unint64_t v30;
  unint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  TSTLayoutCellIterator *v34;
  BOOL v35;
  TSTCell *v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;

  v6 = -[TSTMasterLayout tableRowsBehavior](self, "tableRowsBehavior") == 3
    || -[TSTMasterLayout tableRowsBehavior](self, "tableRowsBehavior") == 1;
  v32 = v6;
  v34 = -[TSTLayoutCellIterator initWithMasterLayout:range:]([TSTLayoutCellIterator alloc], "initWithMasterLayout:range:", self, a3);
  v36 = objc_alloc_init(TSTCell);
  v7 = objc_alloc_init(TSTCell);
  v8 = 0;
  LODWORD(v9) = 0;
  v11 = (*(_QWORD *)&a3 & 0xFFFF00000000) == 0 || HIWORD(*(unint64_t *)&a3) == 0;
  v38 = v11;
  v12 = 255;
  LOWORD(v13) = -1;
  v14 = 0xFFFFFF;
  v15 = 0xFFFFFFLL;
LABEL_11:
  v29 = v7;
  v27 = v8;
  v35 = v8;
  v26 = 0xFFFFFFLL;
  LOWORD(v16) = v13;
  LODWORD(v17) = v12;
  do
  {
    if ((_WORD)v16 == 0xFFFF || (_DWORD)v17 == 255)
    {
      TSTLayoutCellIteratorGetNextCell((uint64_t)v34, &v41);
      v16 = WORD2(v41);
      if (WORD2(v41) == 0xFFFFLL)
        break;
      v17 = BYTE6(v41);
      if (BYTE6(v41) == 255)
        break;
      v9 = HIBYTE(v41);
      TSTLayoutCellIteratorExpandCell((uint64_t)v34, (uint64_t)&v41);
      v35 = v42 != 0;
      if (v42)
        TSTCellCopy(v42, (uint64_t)v36);
      v15 = v43;
      v31 = v16 | (v17 << 16) | (v9 << 24) | v31 & 0xFFFFFFFF00000000;
      TSTMasterLayoutUpdateStrokesForCell(self, (uint64_t)v36, v16 | ((_DWORD)v17 << 16) | ((_DWORD)v9 << 24));
    }
    v19 = (unsigned __int16)v16;
    v20 = v38;
    if ((unsigned __int16)v16 < a3.var0.var0)
      v20 = 1;
    LODWORD(v13) = 0xFFFF;
    if ((v20 & 1) != 0 || (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1) < (unsigned __int16)v16)
    {
      LODWORD(v39) = 255;
      LODWORD(v33) = 0;
    }
    else
    {
      LODWORD(v13) = 0xFFFF;
      if ((int)v17 + 1 < a3.var0.var1
        || v17 >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
      {
        LODWORD(v39) = 255;
        LODWORD(v33) = 0;
      }
      else
      {
        TSTLayoutCellIteratorGetNextCell((uint64_t)v34, &v41);
        v13 = WORD2(v41);
        v33 = HIBYTE(v41);
        v39 = BYTE6(v41);
        if (WORD2(v41) != 0xFFFFLL && BYTE6(v41) != 255)
        {
          TSTLayoutCellIteratorExpandCell((uint64_t)v34, (uint64_t)&v41);
          v27 = v42 != 0;
          if (v42)
            TSTCellCopy(v42, (uint64_t)v29);
          v26 = v43;
          v28 = v13 | (v39 << 16) | (v33 << 24) | v28 & 0xFFFFFFFF00000000;
          TSTMasterLayoutUpdateStrokesForCell(self, (uint64_t)v29, v13 | ((_DWORD)v39 << 16) | ((_DWORD)v33 << 24));
        }
      }
    }
    v21 = (uint64_t)-[TSTEditingState editingCellID](-[TSTTableInfo editingState](-[TSTMasterLayout tableInfo](self, "tableInfo", v26), "editingState"), "editingCellID");
    if ((_WORD)v21 != 0xFFFF
      && (v21 & 0xFF0000) != 0xFF0000
      && !-[TSTMasterLayout dynamicContentDelegate](self, "dynamicContentDelegate")
      && objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "supportsContainedTextEditing")&& -[TSDDrawableInfo isInlineWithText](-[TSTMasterLayout tableInfo](self, "tableInfo"), "isInlineWithText")&& (-[TSTEditingState editingCellID](-[TSTTableInfo editingState](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingState"), "editingCellID") & 0xFFFFFF) == ((unsigned __int16)v16 | ((_DWORD)v17 << 16)))
    {
      TSTCellCopy((uint64_t)-[TSTEditingState editingCell](-[TSTTableInfo editingState](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingState"), "editingCell"), (uint64_t)v36);
    }
    v22 = ((_DWORD)v9 << 24) | ((_DWORD)v17 << 16);
    if ((_WORD)v15 == 0xFFFF)
    {
      v23 = v37;
    }
    else
    {
      v23 = v37;
      if ((v15 & 0xFF0000) != 0xFF0000 && HIWORD(v15) && (v15 & 0xFFFF00000000) != 0)
      {
        v30 = v30 & 0xFFFFFFFF00000000 | v22 | (unsigned __int16)v16;
        -[TSTMasterLayout p_validateFittingInfoForCellID:inMergeRange:](self, "p_validateFittingInfoForCellID:inMergeRange:");
      }
    }
    v9 = v22 | (unsigned __int16)v16;
    v37 = v23 & 0xFFFFFFFF00000000 | v14;
    v24 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTMasterLayout p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:](self, "p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:");
    v3 = v3 & 0xFFFFFFFF00000000 | v9;
    -[TSTMasterLayout validateFittingInfoForCell:cellID:mergeRange:setFitting:](self, "validateFittingInfoForCell:cellID:mergeRange:setFitting:", v36, v3, v15, v32);
    if (v35)
      v18 = TSTCellClear((uint64_t)v36);
    v12 = v39;
    if ((_DWORD)v13 != 0xFFFF && (_DWORD)v39 != 255)
    {
      v4 = v4 & 0xFFFFFFFF00000000 | v9;
      v14 = v24;
      v7 = v36;
      v36 = v29;
      v8 = v27;
      v15 = v26;
      LODWORD(v9) = v33;
      goto LABEL_11;
    }
    v4 = v4 & 0xFFFFFFFF00000000 | v9;
    v14 = v24;
    if ((unsigned __int16)(v16 + 1) < a3.var0.var0)
      v25 = 1;
    else
      v25 = v38;
    if ((v25 & 1) != 0)
      break;
    LODWORD(v9) = 0;
    LODWORD(v17) = 255;
    LOWORD(v16) = -1;
    v15 = 0xFFFFFFLL;
  }
  while (v19 < (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1));
  -[TSTMasterLayout p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:](self, "p_validateFittingInfoForEmptyCellsBetween:andCellID:inRange:", v14, 0xFFFFFFLL, a3, v18, v26);

  TSTMasterLayoutSetStrokesValidForRange(self, *(_QWORD *)&a3);
}

- (void)p_validateFittingInfoForEmptyCellsOnSingleRowBetween:(id)a3 andEndCellID:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;

  if (!-[TSTHiddenRowsColumnsCache isRowHidden:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "isRowHidden:", a3.var0))
  {
    v7 = -[TSTHiddenRowsColumnsCache nextVisibleColumn:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "nextVisibleColumn:", a3.var1);
    if (a4.var1 >= v7)
    {
      v8 = v7;
      v9 = *(_DWORD *)&a3 & 0xFF00FFFF | (v7 << 16);
      v10 = -[TSTMasterLayout tableAreaForCellID:](self, "tableAreaForCellID:", v9);
      -[TSTWidthHeightCache setFitHeight:forCellID:](self->mWidthHeightCache, "setFitHeight:forCellID:", v9, self->mTableDefaultFontHeightForArea[v10]);
      if ((a4.var0 | (a4.var1 << 16)) != (v9 & 0xFFFFFF))
      {
        v11 = -[TSTHiddenRowsColumnsCache previousVisibleColumn:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "previousVisibleColumn:", a4.var1);
        if (v8 <= v11)
        {
          v12 = *(_DWORD *)&a4 & 0xFF000000 | (v11 << 16) | a4.var0;
          v13 = -[TSTMasterLayout tableAreaForCellID:](self, "tableAreaForCellID:", v12);
          if (v10 != v13)
            -[TSTWidthHeightCache setFitHeight:forCellID:](self->mWidthHeightCache, "setFitHeight:forCellID:", v12, self->mTableDefaultFontHeightForArea[v13]);
        }
      }
    }
  }
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)p_validateFittingInfoForEmptyCellsBetween:(id)var0 andCellID:(id)a4 inRange:(id)a5
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned __int16 v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;

  v5 = (unint64_t)a5;
  v6 = *(_QWORD *)&a4.var0;
  if (var0.var0 == 0xFFFF || (*(_QWORD *)&var0.var0 & 0xFF0000) == 0xFF0000)
  {
    v8 = *(unint64_t *)&a5 >> 16;
    var0 = a5.var0;
    v9 = (unint64_t)a5;
  }
  else if (var0.var1 >= (LOBYTE(a5.var1.var0) + a5.var0.var1 - 1))
  {
    if (var0.var0 >= (unsigned __int16)(a5.var0.var0 + a5.var1.var1 - 1))
    {
      LODWORD(v11) = 0;
      LOBYTE(v10) = -1;
      LOWORD(v6) = -1;
      return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v10 << 16) | ((_DWORD)v11 << 24) | (unsigned __int16)v6);
    }
    v8 = *(unint64_t *)&a5 >> 16;
    v9 = (*(_DWORD *)&var0 + 1);
  }
  else
  {
    LOBYTE(v8) = var0.var1 + 1;
    v9 = *(_QWORD *)&var0.var0;
  }
  v10 = *(_QWORD *)&a4.var0 >> 16;
  v11 = *(_QWORD *)&a4.var0 >> 24;
  if (a4.var0 == 0xFFFF || (*(_QWORD *)&a4.var0 & 0xFF0000) == 0xFF0000)
  {
    LODWORD(v14) = 0;
    v13 = a5.var0.var0 + a5.var1.var1 - 1;
    v12 = (*(_DWORD *)&a5.var0 + (*(_DWORD *)&a5.var0.var1 & 0xFF0000u) + 16711680) >> 16;
  }
  else
  {
    if (a4.var1 <= a5.var0.var1)
    {
      if (a4.var0 <= a5.var0.var0)
        return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v10 << 16) | ((_DWORD)v11 << 24) | (unsigned __int16)v6);
      LOBYTE(v12) = LOBYTE(a5.var1.var0) + a5.var0.var1 - 1;
      v13 = a4.var0 - 1;
    }
    else
    {
      LOBYTE(v12) = a4.var1 - 1;
      v13 = a4.var0;
    }
    v14 = *(_QWORD *)&a4.var0 >> 24;
  }
  v15 = v13;
  if (v13 > (unsigned __int16)v9
    || v13 == (unsigned __int16)v9 && v12 >= v8)
  {
    v16 = *(_DWORD *)&var0 & 0xFF000000;
    v17 = *(_DWORD *)&var0 & 0xFF000000 | (v8 << 16) | (unsigned __int16)v9;
    if (v15 == (unsigned __int16)v9)
    {
      -[TSTMasterLayout p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:](self, "p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:", v17, (v12 << 16) | ((_DWORD)v14 << 24) | v15);
    }
    else
    {
      v18 = (*(_DWORD *)&a5.var0 + (*(_DWORD *)&a5.var0.var1 & 0xFF0000) + 16711680) & 0xFF0000;
      -[TSTMasterLayout p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:](self, "p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:", v17, v18 | (unsigned __int16)v9 | v16);
      v19 = v5 & 0xFF0000;
      -[TSTMasterLayout p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:](self, "p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:", v5 & 0xFF0000 | v15 & 0xFFFFFF | (v14 << 24), ((_DWORD)v14 << 24) | (v12 << 16) | v15);
      if (v15 > (unsigned __int16)(v9 + 1))
      {
        v20 = (unsigned __int16)(v9 + 1);
        do
        {
          v9 = v9 & 0xFFFFFFFF00000000 | v19 | v20;
          v5 = v5 & 0xFFFFFFFF00000000 | v18 | v20;
          -[TSTMasterLayout p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:](self, "p_validateFittingInfoForEmptyCellsOnSingleRowBetween:andEndCellID:", v9, v5);
          ++v20;
        }
        while (v15 != (unsigned __int16)v20);
      }
      v10 = v6 >> 16;
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((v10 << 16) | ((_DWORD)v11 << 24) | (unsigned __int16)v6);
}

- (void)p_validateFittingInfoForCellID:(id)a3 inMergeRange:(id)a4
{
  if (a3.var1 == a4.var0.var1)
    -[TSTWidthHeightCache setFitHeight:forCellID:](self->mWidthHeightCache, "setFitHeight:forCellID:", *(_DWORD *)&a3 & 0xFF00FFFF | (a3.var1 << 16), self->mTableDefaultFontHeightForArea[-[TSTMasterLayout tableAreaForCellID:](self, "tableAreaForCellID:", *(_DWORD *)&a4.var0 & 0xFF00FFFF | (a3.var1 << 16))]);
}

- (id)validateFittingInfoForChangeDescriptors:(id)a3 rowsNeedingFittingInfo:(id)a4
{
  TSTTableModel *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t TableNumberOfColumns;
  uint64_t TableNumberOfRows;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  _QWORD v22[5];
  unsigned __int8 v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  int v27;
  _QWORD v28[7];
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSTMasterLayout tableModel](self, "tableModel");
  v34 = 0;
  v35 = &v34;
  v36 = 0x3052000000;
  v37 = __Block_byref_object_copy__29;
  v38 = __Block_byref_object_dispose__29;
  v39 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "changeDescriptor");
        v11 = (void *)objc_msgSend(v9, "cellRegion");
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke;
        v28[3] = &unk_24D82F570;
        v29 = v10;
        v28[4] = self;
        v28[5] = v5;
        v28[6] = &v34;
        objc_msgSend(v11, "enumerateCellRangesUsingBlock:", v28);
        v12 = (void *)objc_msgSend(v9, "expandedRegion");
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_2;
        v26[3] = &unk_24D82F598;
        v27 = v10;
        v26[4] = &v34;
        objc_msgSend(v12, "enumerateCellRangesUsingBlock:", v26);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v6);
  }
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  v15 = (void *)objc_msgSend((id)v35[5], "regionByIntersectingRange:", (TableNumberOfColumns << 32) | (TableNumberOfRows << 48));
  v35[5] = (uint64_t)v15;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_3;
  v25[3] = &unk_24D82F138;
  v25[4] = self;
  objc_msgSend(v15, "enumerateColumnRangesUsingBlock:", v25);
  v16 = (void *)v35[5];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_4;
  v24[3] = &unk_24D82F160;
  v24[4] = self;
  objc_msgSend(v16, "enumerateCellRangesUsingBlock:", v24);
  if (a4)
  {
    objc_msgSend(a4, "tsu_intersectionWithIndexSet:", -[TSTHiddenRowsColumnsCache visibleRowIndices](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "visibleRowIndices"));
    if (objc_msgSend(a4, "firstIndex") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = -[TSTHiddenRowsColumnsCache nextVisibleColumn:](-[TSTMasterLayout hiddenRowsColumnsCache](self, "hiddenRowsColumnsCache"), "nextVisibleColumn:", 0);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_5;
      v22[3] = &unk_24D82F5C0;
      v22[4] = self;
      v23 = v17;
      objc_msgSend(a4, "enumerateIndexesUsingBlock:", v22);
    }
  }
  v18 = (void *)v35[5];
  _Block_object_dispose(&v34, 8);
  return v18;
}

id __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke(id result, unint64_t a2)
{
  unint64_t v2;
  id v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;
  void *v10;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 14);
  if (v4 > 18)
  {
    if (v4 <= 23)
    {
      if ((v4 - 19) >= 2)
      {
        if (v4 != 22)
        {
          if (v4 == 23)
            return result;
          goto LABEL_27;
        }
        goto LABEL_18;
      }
LABEL_22:
      v6 = objc_msgSend(*((id *)result + 5), "numberOfColumns");
      if (v6 >= 0xFF)
        v7 = 255;
      else
        v7 = v6;
      a2 = v2 & 0xFFFF00000000FFFFLL | (v7 << 32);
      v5 = *((_QWORD *)v3 + 5);
      goto LABEL_26;
    }
    if (v4 > 32)
    {
      if (v4 != 33)
      {
        if (v4 == 40)
        {
          objc_msgSend((id)objc_msgSend(*((id *)result + 4), "dupContentCache"), "removeAllObjects");
          result = (id)objc_msgSend((id)objc_msgSend(*((id *)v3 + 4), "cellIDToWPColumnCache"), "removeAllObjects");
        }
        goto LABEL_27;
      }
      goto LABEL_22;
    }
    if (v4 != 24)
    {
      if (v4 != 29)
        goto LABEL_27;
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (v4 > 5)
  {
    if ((v4 - 6) < 2)
      return result;
    if ((v4 - 13) >= 2)
      goto LABEL_27;
    goto LABEL_22;
  }
  switch(v4)
  {
    case 2:
      goto LABEL_18;
    case 3:
      return result;
    case 4:
LABEL_18:
      v5 = *((_QWORD *)result + 5);
LABEL_26:
      result = (id)TSTTableExpandCellRangeToCoverMergedCells(v5, a2);
      v2 = (unint64_t)result;
      break;
  }
LABEL_27:
  if ((_WORD)v2 != 0xFFFF)
  {
    v8 = (v2 & 0xFF0000) == 0xFF0000 || HIWORD(v2) == 0;
    if (!v8 && (v2 & 0xFFFF00000000) != 0)
    {
      v10 = *(void **)(*(_QWORD *)(*((_QWORD *)v3 + 6) + 8) + 40);
      if (v10)
        result = (id)objc_msgSend(v10, "regionByAddingRange:", v2);
      else
        result = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", v2);
      *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 6) + 8) + 40) = result;
    }
  }
  return result;
}

_DWORD *__82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_2(_DWORD *result, unint64_t a2)
{
  int v2;
  BOOL v4;
  _DWORD *v5;
  void *v6;

  v2 = result[10];
  v4 = v2 != 21 && v2 != 1 || (unsigned __int16)~(_WORD)a2 == 0;
  if (!v4 && (a2 & 0xFF0000) != 0xFF0000 && HIWORD(a2) && (a2 & 0xFFFF00000000) != 0)
  {
    v5 = result;
    v6 = *(void **)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 40);
    if (v6)
      result = (_DWORD *)objc_msgSend(v6, "regionByAddingRange:", a2);
    else
      result = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a2);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v5 + 4) + 8) + 40) = result;
  }
  return result;
}

uint64_t __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_3(uint64_t a1, unsigned __int8 a2, char a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "widthHeightCache"), "resetColWidthsStartingWith:andEndingWith:", a2, (a2 + a3 - 1));
}

uint64_t __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateFittingInfoWithCellRange:", a2);
}

uint64_t __82__TSTMasterLayout_validateFittingInfoForChangeDescriptors_rowsNeedingFittingInfo___block_invoke_5(uint64_t a1, unsigned __int16 a2)
{
  uint64_t result;
  double v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "getFitHeightForRow:", a2);
  if (v5 <= 0.0)
    return objc_msgSend(*(id *)(a1 + 32), "validateFittingInfoWithCellRange:", a2 | ((unint64_t)*(unsigned __int8 *)(a1 + 40) << 16) | 0x1000100000000);
  return result;
}

- (void)validateFittingWidthsForRegion:(id)a3
{
  TSTTableModel *v5;
  unsigned int TableNumberOfRows;
  _QWORD v7[6];
  __int16 v8;

  v5 = -[TSTMasterLayout tableModel](self, "tableModel");
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  if (!-[TSTMasterLayout inDynamicLayoutMode](self, "inDynamicLayoutMode")
    && TableNumberOfRows <= 0x200
    && (objc_msgSend(a3, "isEmpty") & 1) == 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__TSTMasterLayout_validateFittingWidthsForRegion___block_invoke;
    v7[3] = &unk_24D82F5E8;
    v8 = TableNumberOfRows;
    v7[4] = self;
    v7[5] = v5;
    objc_msgSend(a3, "enumerateColumnsUsingBlock:", v7);
  }
}

void __50__TSTMasterLayout_validateFittingWidthsForRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  double v6;
  TSTLayoutCellIterator *v7;
  double *v8;
  int v9;
  int v10;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  double v28;
  uint64_t v29;
  void *v30;
  TSTTextEngineDelegate *v31;
  TSTTextEngineDelegate *v32;
  void *v33;
  uint64_t v34;
  double v35;
  unint64_t v36;
  double v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  unint64_t v44;
  TSTCellStateForLayout *v45;
  unint64_t v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  TSWPColumn *v52;
  double v53;
  uint64_t v54;
  double v55;
  double v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unsigned int v61;
  BOOL v62;
  uint64_t v63;
  _QWORD *v64;
  unint64_t v65;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "widthHeightCache"), "getFitWidthForCol:", a2);
  if (v6 <= 0.0)
  {
    v62 = 0;
    v7 = -[TSTLayoutCellIterator initWithMasterLayout:range:]([TSTLayoutCellIterator alloc], "initWithMasterLayout:range:", *(_QWORD *)(a1 + 32), ((unint64_t)a2 << 16) | ((unint64_t)*(unsigned __int16 *)(a1 + 48) << 48) | 0x100000000);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "widthHeightCache"), "resetColWidthsStartingWith:andEndingWith:", a2, a2);
    if (TSTLayoutCellIteratorGetNextCell((uint64_t)v7, &v63))
    {
      v8 = (double *)MEMORY[0x24BDBF148];
      do
      {
        v9 = TSTLayoutCellIteratorValueTypeOfCell((uint64_t)&v63);
        if (v64)
        {
          if (!v9 || *((_DWORD *)v64 + 26) == 267)
            continue;
          v10 = *((unsigned __int8 *)v64 + 9) << 8;
          v12 = v10 == 768 || v10 == 2304;
        }
        else
        {
          if (!v9)
            continue;
          v12 = 0;
        }
        v61 = 1;
        v60 = 0;
        v3 = v3 & 0xFFFFFFFF00000000 | HIDWORD(v63);
        TSTCellTextProperties((uint64_t)v64, *(void **)(a1 + 40), v3, &v62, 0, &v61, &v60);
        objc_msgSend(*(id *)(a1 + 32), "edgeInsetsFromPadding:", v60);
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v21 = *(_QWORD **)(a1 + 32);
        if (v21[73])
        {
          v22 = objc_msgSend((id)objc_msgSend(v21, "tableInfo"), "editingCellID");
          if (((HIDWORD(v63) ^ v22) & 0xFFFFFF) == 0)
            v62 = 1;
        }
        v23 = v62 && v12;
        v62 = v23;
        if (!v64)
          goto LABEL_30;
        v24 = *((unsigned __int8 *)v64 + 9);
        if (v24 == 6)
        {
          if (*((_DWORD *)v64 + 26) == 263)
          {
            v26 = 0;
            v27 = 1;
LABEL_32:
            v28 = *v8;
            if (TSTCellFormatUsesAccountingStyle(v64) && v26 && objc_msgSend(v26, "length"))
            {
              v29 = objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), &stru_24D82FEB0);
              v58 = v58 & 0xFFFFFFFF00000000 | HIDWORD(v63);
              v30 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextEngineForCell:atCellID:", v64);
              v31 = [TSTTextEngineDelegate alloc];
              v32 = -[TSTTextEngineDelegate initWithPadding:verticalAlignment:](v31, "initWithPadding:verticalAlignment:", v61, v14, v16, v18, v20);
              objc_msgSend(v30, "setDelegate:", v32);
              v33 = (void *)objc_msgSend(v30, "layoutText:kind:minSize:maxSize:anchor:flags:", v29, 5, 15, 8.0, 8.0, 4294967300.0, 4294967300.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
              objc_msgSend(v30, "setDelegate:", 0);

              objc_msgSend(v33, "range");
              if (v34)
              {
                objc_msgSend(v33, "typographicBoundsForCell");
                v28 = v35;
                objc_msgSend(v33, "frameBounds");
              }
              goto LABEL_62;
            }
            v36 = v65;
            if ((_WORD)v65 == 0xFFFF || (v65 & 0xFF0000) == 0xFF0000 || !HIWORD(v65) || (v65 & 0xFFFF00000000) == 0)
              v36 = HIDWORD(v63) | 0x1000100000000;
            v37 = TSTMasterLayoutContentWidthForCellRange(*(TSTMasterLayout **)(a1 + 32), v36, 0);
            v38 = (void *)objc_msgSend(*(id *)(a1 + 32), "cellIDToWPColumnCache");
            HIDWORD(v39) = HIDWORD(v63);
            LODWORD(v39) = HIDWORD(v63);
            v40 = (void *)objc_msgSend(v38, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v39 >> 16) & 0xFFFF00FF));
            if (v40)
            {
              v41 = v40;
              objc_msgSend(v40, "typographicBoundsForCell");
              v28 = v42;
              objc_msgSend(v41, "frameBounds");
              if (v28 == v37)
              {
LABEL_62:
                if (v27)
                  v55 = 30.0;
                else
                  v55 = v28;
                v56 = v16 + v20 + v55;
                v57 = (void *)objc_msgSend(*(id *)(a1 + 32), "widthHeightCache");
                v2 = v2 & 0xFFFFFFFF00000000 | HIDWORD(v63);
                objc_msgSend(v57, "setFitWidth:forCellID:", v2, v56);
                continue;
              }
              v43 = (void *)objc_msgSend(*(id *)(a1 + 32), "cellIDToWPColumnCache");
              HIDWORD(v44) = HIDWORD(v63);
              LODWORD(v44) = HIDWORD(v63);
              objc_msgSend(v43, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v44 >> 16) & 0xFFFF00FF));
            }
            v45 = objc_alloc_init(TSTCellStateForLayout);
            v46 = v59 & 0xFFFFFFFF00000000 | HIDWORD(v63);
            -[TSTCellStateForLayout setModelCellID:](v45, "setModelCellID:", v46);
            -[TSTCellStateForLayout setCell:](v45, "setCell:", v64);
            -[TSTCellStateForLayout setCellPropsRowHeight:](v45, "setCellPropsRowHeight:", 0);
            -[TSTCellStateForLayout setCellWraps:](v45, "setCellWraps:", v62);
            -[TSTCellStateForLayout setPaddingInsets:](v45, "setPaddingInsets:", v14, v16, v18, v20);
            -[TSTCellStateForLayout setVerticalAlignment:](v45, "setVerticalAlignment:", v61);
            v47 = 8.0;
            if (!v62)
              v47 = v37;
            -[TSTCellStateForLayout setMinSize:](v45, "setMinSize:", v47, 8.0);
            if (v62)
              v48 = v37;
            else
              v48 = 4294967300.0;
            -[TSTCellStateForLayout setMaxSize:](v45, "setMaxSize:", v48, 4294967300.0);
            -[TSTCellStateForLayout setForDrawing:](v45, "setForDrawing:", 1);
            -[TSTCellStateForLayout setMergedRange:](v45, "setMergedRange:", v65);
            -[TSTCellStateForLayout setInDynamicLayout:](v45, "setInDynamicLayout:", objc_msgSend(*(id *)(a1 + 32), "inDynamicLayoutMode"));
            -[TSTCellStateForLayout setCellContents:](v45, "setCellContents:", v26);
            objc_opt_class();
            v49 = (void *)TSUDynamicCast();
            if (v49)
            {
              if (objc_msgSend(v49, "hasAttachmentsThatChangeWithPageNumberOrPageCount"))
                v50 = 0;
              else
                v50 = 15;
            }
            else
            {
              v50 = 15;
            }
            v59 = v46;
            -[TSTCellStateForLayout setLayoutCacheFlags:](v45, "setLayoutCacheFlags:", v50);
            objc_msgSend(*(id *)(a1 + 32), "measureTextForLayoutState:", v45);
            -[TSWPColumn range](-[TSTCellStateForLayout wpColumn](v45, "wpColumn"), "range");
            if (v51)
            {
              v52 = -[TSTCellStateForLayout wpColumn](v45, "wpColumn");
              -[TSWPColumn typographicBoundsForCell](v52, "typographicBoundsForCell");
              v28 = v53;
              -[TSWPColumn frameBounds](v52, "frameBounds");
            }
            else
            {
              v28 = *v8;
            }
            v54 = -[TSTCellStateForLayout keyVal](v45, "keyVal");
            if ((v50 & 2) != 0 && v54)
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dupContentCache"), "setObject:forKey:", -[TSTCellStateForLayout wpColumn](v45, "wpColumn"), -[TSTCellStateForLayout keyVal](v45, "keyVal"));

            goto LABEL_62;
          }
LABEL_30:
          v25 = NSStringFromNativeTSTCell((uint64_t)v64);
LABEL_31:
          v26 = (void *)v25;
          v27 = 0;
          goto LABEL_32;
        }
        if (v24 != 8)
        {
          if (v24 != 9)
            goto LABEL_30;
          v25 = objc_msgSend((id)v64[9], "storage");
          goto LABEL_31;
        }
      }
      while (TSTLayoutCellIteratorGetNextCell((uint64_t)v7, &v63));
    }

  }
}

- (id)validateCellForDrawing:(id)a3 cell:(id)a4 contents:(id)a5 wrap:(BOOL)a6 verticalAlignment:(unsigned int)a7 padding:(id)a8 layoutCacheFlags:(int)a9 pageNumber:(unint64_t)a10 pageCount:(unint64_t)a11
{
  BOOL v17;
  int v18;
  TSTTableInfo *v19;
  uint64_t v20;
  uint64_t v21;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  unsigned __int16 v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v36;
  uint64_t v37;
  int TableNumberOfColumns;
  int TableNumberOfRows;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  unsigned int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  TSTWPColumnCache *v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  double v56;
  double v57;
  TSTWPColumnCache *v58;
  int v59;
  unint64_t v60;
  unsigned int v61;
  TSTCellStateForLayout *v62;
  void *v63;
  uint64_t v64;
  TSTWPColumnCache *v65;
  uint64_t v66;
  unint64_t v67;
  TSTCellStateForLayout *v68;
  TSTTableInfo *v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  unsigned int v77;
  _BOOL4 v78;
  char v79;

  v78 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = objc_msgSend(a5, "length") == 0;
  else
    v17 = a5 == 0;
  v18 = !v17;
  v19 = -[TSTMasterLayout tableInfo](self, "tableInfo");
  v20 = -[TSTTableInfo tableModel](v19, "tableModel");
  if (!v18)
    return 0;
  v21 = v20;
  v73 = a4;
  v74 = a8;
  v75 = a5;
  v22 = a3;
  v23 = TSTTableMergeRangeAtCellID(v20, *(_DWORD *)&a3);
  v24 = v23;
  v25 = HIWORD(v23);
  v76 = v23;
  v26 = (~(_DWORD)v23 & 0xFF0000) != 0 && (_WORD)v23 != 0xFFFF;
  v77 = a7;
  v70 = v19;
  v72 = a3;
  v27 = 1;
  if (v26 && v25)
  {
    v28 = a3;
    LOWORD(v29) = 1;
    if ((v23 & 0xFFFF00000000) != 0)
    {
      v29 = HIDWORD(v23);
      if (((v23 ^ *(_DWORD *)&a3) & 0xFFFFFFLL) != 0)
      {
        v30 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", *(unsigned int *)&a3);
        v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMasterLayout validateCellForDrawing:cell:contents:wrap:verticalAlignment:padding:layoutCacheFlags:pageNumber:pageCount:]");
        objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), 5372, CFSTR("Trying to draw merged cell other than origin."));
      }
      if ((_DWORD)v25)
      {
        v32 = v24;
        do
        {
          v79 = 0;
          TSTTableHeightOfRow(v21, (unsigned __int16)v32++, &v79);
        }
        while ((unsigned __int16)v24 + v25 > (unsigned __int16)v32);
        v28 = v76;
        v27 = v25;
      }
      else
      {
        v27 = 0;
        v28 = v76;
      }
    }
  }
  else
  {
    v28 = a3;
    LOWORD(v29) = 1;
  }
  v34 = (unsigned __int16)v29 | (v27 << 16);
  LODWORD(v35) = -[TSTMasterLayout layoutCellIDForModelCellID:](self, "layoutCellIDForModelCellID:", v28, v70);
  if (!v26 || !v25)
  {
    v36 = v22;
    v37 = a9;
    goto LABEL_43;
  }
  v36 = v22;
  v37 = a9;
  if ((v24 & 0xFFFF00000000) == 0)
    goto LABEL_43;
  TableNumberOfColumns = TSTMasterLayoutGetTableNumberOfColumns((uint64_t)self);
  TableNumberOfRows = TSTMasterLayoutGetTableNumberOfRows((uint64_t)self);
  v40 = 0;
  v41 = 16711680;
  v42 = 0xFFFFLL;
  if (!TableNumberOfColumns)
    goto LABEL_41;
  v43 = 0;
  if (!TableNumberOfRows)
    goto LABEL_42;
  v40 = 0;
  v41 = 16711680;
  v42 = 0xFFFFLL;
  if ((_WORD)v35 == 0xFFFF)
  {
LABEL_41:
    v43 = 0;
    goto LABEL_42;
  }
  v43 = 0;
  if ((v35 & 0xFF0000) != 0xFF0000)
  {
    v40 = 0;
    v41 = 16711680;
    v42 = 0xFFFFLL;
    if ((_WORD)v29)
    {
      v43 = 0;
      if (v34 >= 0x10000)
      {
        v42 = 0;
        if ((TableNumberOfColumns - 1) >= (v29 + BYTE2(v35) - 1))
          v44 = (v29 + BYTE2(v35) - 1);
        else
          v44 = (TableNumberOfColumns - 1);
        if ((unsigned __int16)(TableNumberOfRows - 1) >= (unsigned __int16)(v27 + v35 - 1))
          v45 = (unsigned __int16)(v27 + v35 - 1);
        else
          v45 = (unsigned __int16)(TableNumberOfRows - 1);
        if (v45 < (unsigned __int16)v35)
        {
          v41 = 0;
          v40 = 0;
          v43 = 0;
        }
        else
        {
          v41 = 0;
          v40 = 0;
          v43 = 0;
          if (v44 >= BYTE2(v35))
          {
            v42 = (unsigned __int16)v35;
            v43 = ((unint64_t)(v45 - v35) << 48) + 0x1000000000000;
            v40 = (unint64_t)(unsigned __int16)(v44 - BYTE2(v35) + 1) << 32;
            v41 = BYTE2(v35) << 16;
          }
        }
      }
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_42:
  v35 = v41 | v43 | v42 | v40;
  v34 = HIDWORD(v35);
LABEL_43:
  v46 = TSTMasterLayoutContentWidthForCellRange(self, v35 | (v34 << 32), 0);
  v47 = TSTMasterLayoutContentHeightForCellRange(self, v35 | (v34 << 32), 0);
  if (v78)
    v48 = 8.0;
  else
    v48 = v46;
  if (v78)
    v49 = v46;
  else
    v49 = 4294967300.0;
  if (v77)
    v50 = v47;
  else
    v50 = 4294967300.0;
  if (v77)
    v51 = v47;
  else
    v51 = 8.0;
  if ((v37 & 4) == 0)
  {
    v33 = 0;
LABEL_60:
    v59 = 1;
    goto LABEL_61;
  }
  v52 = -[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache", v47);
  HIDWORD(v53) = v36;
  LODWORD(v53) = v36;
  v54 = (v53 >> 16) & 0xFFFF00FF;
  v55 = -[TSUConcurrentCache objectForKey:](v52, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v54));
  v33 = v55;
  if (!v55)
    goto LABEL_60;
  objc_msgSend(v55, "typographicBoundsForCell");
  v57 = v56;
  objc_msgSend(v33, "frameBounds");
  if (v57 != v46)
  {
    v58 = -[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache");
    -[TSUConcurrentCache removeObjectForKey:](v58, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v54));
    goto LABEL_60;
  }
  v59 = 0;
  if (!-[TSTMasterLayout dynamicRepResize](self, "dynamicRepResize", v47))
    goto LABEL_72;
LABEL_61:
  if (TSTTableNumberOfPopulatedCells(v21) > 0x19)
    return v33;
  if (v48 < 0.0)
    v48 = 0.0;
  if (v51 < 0.0)
    v51 = 0.0;
  if (v49 < 0.0)
    v49 = 0.0;
  if (v50 < 0.0)
  {
    v50 = 0.0;
    if ((v59 & 1) == 0)
      return v33;
  }
  else
  {
LABEL_72:
    if (!v59)
      return v33;
  }
  v60 = v24 & 0xFFFFFFFF00000000;
  v61 = objc_msgSend((id)objc_msgSend(v71, "masterLayout"), "layoutCellIDForModelCellID:", v76);
  v62 = objc_alloc_init(TSTCellStateForLayout);
  -[TSTCellStateForLayout setModelCellID:](v62, "setModelCellID:", v72);
  -[TSTCellStateForLayout setCell:](v62, "setCell:", v73);
  -[TSTCellStateForLayout setCellPropsRowHeight:](v62, "setCellPropsRowHeight:", 0);
  -[TSTCellStateForLayout setCellWraps:](v62, "setCellWraps:", v78);
  -[TSTMasterLayout edgeInsetsFromPadding:](self, "edgeInsetsFromPadding:", v74);
  -[TSTCellStateForLayout setPaddingInsets:](v62, "setPaddingInsets:");
  -[TSTCellStateForLayout setVerticalAlignment:](v62, "setVerticalAlignment:", v77);
  -[TSTCellStateForLayout setMinSize:](v62, "setMinSize:", v48, v51);
  -[TSTCellStateForLayout setMaxSize:](v62, "setMaxSize:", v49, v50);
  -[TSTCellStateForLayout setForDrawing:](v62, "setForDrawing:", 1);
  -[TSTCellStateForLayout setMergedRange:](v62, "setMergedRange:", v60 | v61);
  -[TSTCellStateForLayout setInDynamicLayout:](v62, "setInDynamicLayout:", -[TSTMasterLayout inDynamicLayoutMode](self, "inDynamicLayoutMode"));
  -[TSTCellStateForLayout setCellContents:](v62, "setCellContents:", v75);
  objc_opt_class();
  v63 = (void *)TSUDynamicCast();
  if (v63)
  {
    if (objc_msgSend(v63, "hasAttachmentsThatChangeWithPageNumberOrPageCount"))
      v37 = 0;
    else
      v37 = v37;
  }
  -[TSTCellStateForLayout setLayoutCacheFlags:](v62, "setLayoutCacheFlags:", v37);
  -[TSTCellStateForLayout setPageNumber:](v62, "setPageNumber:", a10);
  -[TSTCellStateForLayout setPageCount:](v62, "setPageCount:", a11);
  -[TSTMasterLayout measureTextForLayoutState:](self, "measureTextForLayoutState:", v62);
  v64 = -[TSTCellStateForLayout keyVal](v62, "keyVal");
  if ((v37 & 2) != 0 && v64)
    -[TSUConcurrentCache setObject:forKey:](-[TSTMasterLayout dupContentCache](self, "dupContentCache"), "setObject:forKey:", -[TSTCellStateForLayout wpColumn](v62, "wpColumn"), -[TSTCellStateForLayout keyVal](v62, "keyVal"));
  if ((-[TSTCellStateForLayout layoutCacheFlags](v62, "layoutCacheFlags") & 1) != 0)
  {
    v65 = -[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache");
    v66 = -[TSTCellStateForLayout wpColumn](v62, "wpColumn");
    HIDWORD(v67) = v36;
    LODWORD(v67) = v36;
    -[TSUConcurrentCache setObject:forKey:](v65, "setObject:forKey:", v66, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (v67 >> 16) & 0xFFFF00FF));
  }
  v68 = v62;
  return -[TSTCellStateForLayout wpColumn](v62, "wpColumn");
}

- (void)queueCellForValidation:(id)a3 cell:(id)a4 mergeRange:(id)a5 wrap:(BOOL)a6 verticalAlignment:(unsigned int)a7 padding:(id)a8 prop:(BOOL)a9 layoutCacheFlags:(int)a10
{
  _BOOL8 v11;
  uint64_t v15;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v16;
  uint64_t v17;
  TSTTableModel *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  double v24;
  double v25;
  TSTWPColumnCache *v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;
  TSTWPColumnCache *v32;
  unint64_t v33;
  TSTCellStateForLayout *v36;

  v11 = a6;
  v15 = a10;
  v36 = objc_alloc_init(TSTCellStateForLayout);
  v16 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)-[TSTMasterLayout modelCellIDForLayoutCellID:](self, "modelCellIDForLayoutCellID:", *(_DWORD *)&a3.var0);
  -[TSTCellStateForLayout setModelCellID:](v36, "setModelCellID:", *(unsigned int *)&v16);
  -[TSTCellStateForLayout setCell:](v36, "setCell:", a4);
  v17 = objc_msgSend(-[TSTCellStateForLayout cellContents](v36, "cellContents"), "length");
  v18 = -[TSTTableInfo tableModel](-[TSTMasterLayout tableInfo](self, "tableInfo"), "tableModel");
  if (v17)
  {
    objc_opt_class();
    -[TSTCellStateForLayout cellContents](v36, "cellContents");
    v19 = (void *)TSUDynamicCast();
    if (v19)
    {
      if (objc_msgSend(v19, "hasAttachmentsThatChangeWithPageNumberOrPageCount"))
        v15 = 0;
      else
        v15 = a10;
    }
  }
  else
  {
    v15 = 10;
  }
  v20 = TSTMasterLayoutContentWidthForCellRange(self, *(_QWORD *)&a3, 0);
  if (v11)
    v21 = 8.0;
  else
    v21 = v20;
  if (v11)
    v22 = v20;
  else
    v22 = 4294967300.0;
  if (-[TSTMasterLayout dynamicRepResize](self, "dynamicRepResize"))
  {
    v23 = TSTTableNumberOfPopulatedCells((uint64_t)v18);
    v24 = 0.0;
    if (v21 >= 0.0)
      v25 = v21;
    else
      v25 = 0.0;
    if (v22 >= 0.0)
      v24 = v22;
    if (v23 <= 0x19)
    {
      v22 = v24;
      v21 = v25;
    }
  }
  v26 = -[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache");
  HIDWORD(v27) = v16;
  LODWORD(v27) = v16;
  v28 = (v27 >> 16) & 0xFFFF00FF;
  v29 = -[TSUConcurrentCache objectForKey:](v26, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28));
  if ((!-[TSTMasterLayout containedTextEditor](self, "containedTextEditor")
     || ((-[TSTTableInfo editingCellID](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingCellID") ^ *(_DWORD *)&a3.var0) & 0xFFFFFFLL) != 0)
    && v29)
  {
    objc_msgSend(v29, "typographicBoundsForCell");
    v31 = v30;
    objc_msgSend(v29, "frameBounds");
    if (v31 == v20)
      goto LABEL_28;
    v32 = -[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache");
    -[TSUConcurrentCache removeObjectForKey:](v32, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v28));
  }
  -[TSTCellStateForLayout setCellPropsRowHeight:](v36, "setCellPropsRowHeight:", a9);
  -[TSTCellStateForLayout setCellWraps:](v36, "setCellWraps:", v11);
  -[TSTMasterLayout edgeInsetsFromPadding:](self, "edgeInsetsFromPadding:", a8);
  -[TSTCellStateForLayout setPaddingInsets:](v36, "setPaddingInsets:");
  -[TSTCellStateForLayout setVerticalAlignment:](v36, "setVerticalAlignment:", a7);
  -[TSTCellStateForLayout setMinSize:](v36, "setMinSize:", v21, 8.0);
  -[TSTCellStateForLayout setMaxSize:](v36, "setMaxSize:", v22, 4294967300.0);
  -[TSTCellStateForLayout setMergedRange:](v36, "setMergedRange:", a5);
  -[TSTCellStateForLayout setLayoutCacheFlags:](v36, "setLayoutCacheFlags:", v15);
  -[NSMutableArray addObject:](-[TSTLayoutTask cellStatesToLayout](self->mCurrentLayoutTask, "cellStatesToLayout"), "addObject:", v36);
  v33 = -[NSMutableArray count](-[TSTLayoutTask cellStatesToLayout](self->mCurrentLayoutTask, "cellStatesToLayout"), "count");
  if (v33 >= -[TSTMasterLayout numCellsPerTask](self, "numCellsPerTask"))
  {
    -[TSTMasterLayout processLayoutTask:](self, "processLayoutTask:", self->mCurrentLayoutTask);

    self->mCurrentLayoutTask = 0;
    self->mCurrentLayoutTask = -[TSTLayoutTask initWithMasterLayout:]([TSTLayoutTask alloc], "initWithMasterLayout:", self);
  }
LABEL_28:

}

- (void)measureTextForLayoutState:(id)a3
{
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  TSTLayoutContentCachedKey *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  TSTLayoutContentCachedKey *v27;
  id v28;
  id v29;
  TSTTextEngineDelegate *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  TSTTextEngineDelegate *v35;
  uint64_t v36;
  int v37;
  _QWORD *v38;
  TSWPStorage *v39;
  TSWPStorage *v40;
  unsigned int v41;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;

  v4 = a3;
  v5 = objc_msgSend(a3, "modelCellID");
  objc_msgSend(a3, "minSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a3, "maxSize");
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(a3, "cellWraps");
  objc_opt_class();
  objc_msgSend(a3, "cellContents");
  v15 = (const __CFString *)TSUDynamicCast();
  if ((objc_msgSend(a3, "hasContent") & 1) == 0)
  {
    objc_msgSend(a3, "setLayoutCacheFlags:", objc_msgSend(a3, "layoutCacheFlags") & 0xFFFFFFFCLL);
    v15 = CFSTR("Z");
  }
  v16 = -[TSTMasterLayout newTextEngineForCell:atCellID:](self, "newTextEngineForCell:atCellID:", objc_msgSend(a3, "cell"), objc_msgSend(a3, "modelCellID"));
  if ((objc_msgSend(a3, "layoutCacheFlags") & 8) != 0)
  {
    v17 = objc_msgSend(a3, "cell");
    if (!v17 || *(unsigned __int8 *)(v17 + 9) << 8 != 2304)
    {
      v18 = [TSTLayoutContentCachedKey alloc];
      v19 = (_DWORD)v14 ? v11 : v7;
      v20 = objc_msgSend(v16, "paragraphStyle");
      v21 = objc_msgSend(a3, "cell");
      v22 = v21 ? *(unsigned __int8 *)(v21 + 9) : 0;
      objc_msgSend(a3, "paddingInsets");
      v27 = -[TSTLayoutContentCachedKey initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:](v18, "initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:", v15, v20, v14, v22, objc_msgSend(a3, "verticalAlignment"), -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTMasterLayout tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 798), v19, v9, v23, v24, v25, v26);
      objc_msgSend(a3, "setKeyVal:", v27);
      v28 = -[TSUConcurrentCache objectForKey:](-[TSTMasterLayout dupContentCache](self, "dupContentCache"), "objectForKey:", v27);
      if (v28)
      {
        v29 = v28;

LABEL_44:
        v45 = a3;
        goto LABEL_45;
      }
    }
  }
  v30 = [TSTTextEngineDelegate alloc];
  objc_msgSend(a3, "paddingInsets");
  v35 = -[TSTTextEngineDelegate initWithPadding:verticalAlignment:](v30, "initWithPadding:verticalAlignment:", objc_msgSend(a3, "verticalAlignment"), v31, v32, v33, v34);
  objc_msgSend(v16, "setDelegate:", v35);
  if (-[TSTMasterLayout containedTextEditor](self, "containedTextEditor")
    && ((-[TSTTableInfo editingCellID](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingCellID") ^ v5) & 0xFFFFFF) == 0)
  {
    v39 = -[TSTEditingState editingStorage](-[TSTTableInfo editingState](-[TSTMasterLayout tableInfo](self, "tableInfo"), "editingState"), "editingStorage");
  }
  else
  {
    v36 = objc_msgSend(a3, "cell");
    if (!v36 || *(unsigned __int8 *)(v36 + 9) << 8 != 2304)
    {
      v40 = 0;
      goto LABEL_28;
    }
    v37 = (*(_DWORD *)&self->mDynamicSuppressingConditionalStylesCellID ^ v5) & 0xFFFFFF;
    v38 = (_QWORD *)objc_msgSend(a3, "cell");
    if (v37)
    {
      v39 = (TSWPStorage *)TSTCellRichTextStorageForLayout((uint64_t)v38);
    }
    else
    {
      if (v38)
        v38 = (_QWORD *)v38[9];
      v39 = (TSWPStorage *)objc_msgSend(v38, "storage");
    }
  }
  v40 = v39;
  if (v39 && !objc_msgSend(-[TSWPStorage string](v39, "string"), "length"))
  {
    v40 = 0;
    v15 = CFSTR("Z");
  }
LABEL_28:
  if ((_DWORD)v14)
    v41 = 3;
  else
    v41 = 15;
  if (v9 == v13 && v9 < 4294967300.0)
    v43 = v41 & 0xFFFFFFFD;
  else
    v43 = v41;
  if (v40)
    v44 = objc_msgSend(v16, "layoutTextStorage:minSize:maxSize:anchor:pageNumber:pageCount:flags:", v40, objc_msgSend(a3, "pageNumber"), objc_msgSend(a3, "pageCount"), v43, v7, v9, v11, v13, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  else
    v44 = objc_msgSend(v16, "layoutText:kind:minSize:maxSize:anchor:flags:", v15, 5, v43, v7, v9, v11, v13, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v29 = (id)v44;
  objc_msgSend(v16, "setDelegate:", 0);

  v45 = a3;
  if (!v29)
  {
    if (objc_msgSend(a3, "hasContent"))
    {
      v46 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v47 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMasterLayout measureTextForLayoutState:]");
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), 5719, CFSTR("No layout found for cell in col %d, row %d\n"), BYTE2(v5), (unsigned __int16)v5);
    }
    v29 = 0;
    goto LABEL_44;
  }
LABEL_45:
  objc_msgSend(v45, "setWpColumn:", v29);

}

- (void)processLayoutTask:(id)a3
{
  id v5;
  NSObject *mLayoutInFlight;
  NSObject *global_queue;
  _QWORD v8[6];

  v5 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mLayoutSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  mLayoutInFlight = self->mLayoutInFlight;
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__TSTMasterLayout_processLayoutTask___block_invoke;
  v8[3] = &unk_24D82A5C8;
  v8[4] = a3;
  v8[5] = self;
  dispatch_group_async(mLayoutInFlight, global_queue, v8);
}

uint64_t __37__TSTMasterLayout_processLayoutTask___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "cellStatesToLayout");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__TSTMasterLayout_processLayoutTask___block_invoke_2;
  v5[3] = &unk_24D82AA10;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 32), "flushToGlobalCaches");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 104));

  return objc_msgSend(v2, "drain");
}

uint64_t __37__TSTMasterLayout_processLayoutTask___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  return objc_msgSend(*(id *)(a1 + 32), "measureTextForLayoutState:", TSUDynamicCast());
}

- (void)waitForLayoutToComplete
{
  dispatch_group_wait((dispatch_group_t)self->mLayoutInFlight, 0xFFFFFFFFFFFFFFFFLL);
  -[TSUReadWriteQueue waitOnInFlightWriters](-[TSUConcurrentCache readWriteQueue](-[TSTMasterLayout cellIDToWPColumnCache](self, "cellIDToWPColumnCache"), "readWriteQueue"), "waitOnInFlightWriters");
  -[TSUReadWriteQueue waitOnInFlightWriters](-[TSTMasterLayout whCacheQueue](self, "whCacheQueue"), "waitOnInFlightWriters");
}

- (void)setMaxConcurrentTasks:(unsigned int)a3
{
  dispatch_release((dispatch_object_t)self->mLayoutSemaphore);
  self->mMaxConcurrentTasks = a3;
  self->mLayoutSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
}

- (id)newTextEngineForCell:(id)a3 atCellID:(id)a4
{
  TSWPParagraphStyle *v7;
  int v8;
  int v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  BOOL v15;
  int v16;
  id v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  TSWPText *v24;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  if (!a3 || (v7 = (TSWPParagraphStyle *)*((_QWORD *)a3 + 7)) == 0)
  {
    LOBYTE(v26) = 0;
    v7 = (TSWPParagraphStyle *)TSTTableTextStyleForCellWithEmptyStyleAtCellID((uint64_t *)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&a4, (char *)&v26);
    if (!a3)
      goto LABEL_25;
  }
  v8 = *((_DWORD *)a3 + 2);
  if ((v8 & 0xFF00) != 0x200)
    goto LABEL_19;
  if ((v8 & 0xFB00) == 0x200 || BYTE1(v8) == 7)
  {
    if (*((double *)a3 + 2) < 0.0)
    {
      v10 = *((_DWORD *)a3 + 26);
      v28 = 0;
      v26 = 0u;
      v27 = 0u;
      LODWORD(v26) = -1;
      if ((v10 - 256) > 2)
      {
        if ((v10 & 0xFFFFFFFE) != 0x108)
          goto LABEL_19;
        TSTCellGetFormatOfType(a3, *((_DWORD *)a3 + 34), (uint64_t)&v26);
        if ((v26 & 0xFFFFFFFC) != 0x100)
          goto LABEL_19;
      }
      else
      {
        v11 = *(_OWORD *)((char *)a3 + 120);
        v26 = *(_OWORD *)((char *)a3 + 104);
        v27 = v11;
        v28 = *((_QWORD *)a3 + 17);
      }
      if ((v27 & 0x1500) == 0x100)
      {
        v7 = -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPParagraphStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](v7, "context"), CFSTR("temporaryParagraphStyleForTables"), -[TSSStyle propertyMap](v7, "propertyMap"), 0);
        -[TSSStyle setValue:forProperty:](v7, "setValue:forProperty:", objc_msgSend(MEMORY[0x24BEB3C40], "redColor"), 18);
      }
    }
  }
  else if (BYTE1(v8))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCell.h"), 897, CFSTR("can't get value from non-value cell: %p"), a3);
  }
LABEL_19:
  v14 = *((unsigned __int8 *)a3 + 9);
  v15 = v14 > 7;
  v16 = (1 << v14) & 0xA4;
  if (v15 || v16 == 0)
  {
LABEL_25:
    v20 = 0;
    goto LABEL_27;
  }
  v18 = -[TSTMasterLayout accountingParagraphStylePropertyMapForCell:atCellID:](self, "accountingParagraphStylePropertyMapForCell:atCellID:", a3, *(unsigned int *)&a4);
  if (v18)
  {
    v19 = v18;
    v20 = 1;
    v7 = -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPParagraphStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](v7, "context"), -[TSSStyle name](v7, "name"), -[TSSStyle propertyMap](v7, "propertyMap"), 1);
    -[TSSStyle setValuesForProperties:](v7, "setValuesForProperties:", v19);
  }
  else
  {
    v20 = 1;
  }
LABEL_27:
  v21 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", -[TSPObject context](v7, "context"));
  v22 = -[TSSStyle intValueForProperty:](v7, "intValueForProperty:", 44);
  if ((_DWORD)v22 == -1)
  {
    v22 = -[TSSStyle intValueForProperty:](-[TSTTableModel tableStyle](-[TSTMasterLayout tableModel](self, "tableModel"), "tableStyle"), "intValueForProperty:", 798) == 1;
    if ((v20 & 1) != 0)
      goto LABEL_29;
LABEL_31:
    if (a3 && *((unsigned __int8 *)a3 + 9) << 8 == 2304)
      v23 = 4;
    else
      v23 = (_DWORD)v22 == 1;
    goto LABEL_35;
  }
  if ((v20 & 1) == 0)
    goto LABEL_31;
LABEL_29:
  v23 = 1;
LABEL_35:
  v24 = -[TSWPText initWithParagraphStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:]([TSWPText alloc], "initWithParagraphStyle:columnStyle:alignmentForNaturalAlignment:naturalDirection:", v7, v21, v23, v22);
  if (-[TSTMasterLayout isDynamicallyChangingFontColorOfCellID:](self, "isDynamicallyChangingFontColorOfCellID:", *(unsigned int *)&a4))
  {
    -[TSWPText setTextColorOverride:](v24, "setTextColorOverride:", -[TSTMasterLayout dynamicFontColor](self, "dynamicFontColor"));
  }
  return v24;
}

- (id)accountingParagraphStylePropertyMapForCell:(id)a3 atCellID:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  id v13;
  double v14;
  id v15;

  if (!TSTCellFormatUsesAccountingStyle(a3))
    return 0;
  v6 = a4;
  v7 = TSTTableMergeRangeAtCellID((uint64_t)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&a4);
  v8 = v7;
  if ((_WORD)v7 == 0xFFFF || (v7 & 0xFF0000) == 0xFF0000 || !HIWORD(v7) || (v7 & 0xFFFF00000000) == 0)
  {
    v8 = *(unsigned int *)&a4 | 0x1000100000000;
  }
  else if (((v7 ^ *(_DWORD *)&a4) & 0xFFFFFF) != 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTMasterLayout accountingParagraphStylePropertyMapForCell:atCellID:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTMasterLayout.mm"), 5894, CFSTR("Trying create a text engine for a merged cell other than origin."));
  }
  v12 = TSTMasterLayoutContentWidthForCellRange(self, v8, 0);
  v13 = +[TSWPTab tab](TSWPTab, "tab");
  -[TSTMasterLayout paddingForCellID:](self, "paddingForCellID:", v6);
  objc_msgSend(v13, "setPosition:", v12 + -4.0 - v14);
  objc_msgSend(v13, "setAlignment:", 2);
  v15 = +[TSWPTabs tabs](TSWPTabs, "tabs");
  objc_msgSend(v15, "insertTab:", v13);
  v11 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  objc_msgSend(v11, "setIntValue:forProperty:", 0, 86);
  objc_msgSend(v11, "setObject:forProperty:", v15, 84);
  return v11;
}

- (UIEdgeInsets)edgeInsetsFromPadding:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  objc_msgSend(a3, "topInset");
  v5 = v4;
  objc_msgSend(a3, "leftInset");
  v7 = v6;
  objc_msgSend(a3, "bottomInset");
  v9 = v8;
  objc_msgSend(a3, "rightInset");
  v10 = fmax(v7, 2.0);
  v12 = fmax(v11, 2.0);
  v13 = v5;
  v14 = v9;
  result.right = v12;
  result.bottom = v14;
  result.left = v10;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)paddingForCellID:(id)a3
{
  void *CellStyleAtCellID;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  if ((a3.var0 == 0xFFFF
     || (*(_QWORD *)&a3.var0 & 0xFF0000) == 0xFF0000
     || (CellStyleAtCellID = (void *)TSTTableGetCellStyleAtCellID((uint64_t *)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&a3, 0)) == 0)&& (CellStyleAtCellID = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&a3, 0)) == 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(CellStyleAtCellID, "valueForProperty:", 904);
  }
  -[TSTMasterLayout edgeInsetsFromPadding:](self, "edgeInsetsFromPadding:", v6);
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (UIEdgeInsets)defaultPaddingForCellID:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  v4 = (void *)TSTTableCellStyleForCellWithEmptyStyleAtCellID((uint64_t *)-[TSTMasterLayout tableModel](self, "tableModel"), *(_DWORD *)&a3, 0);
  if (v4)
    v5 = objc_msgSend(v4, "valueForProperty:", 904);
  else
    v5 = 0;
  -[TSTMasterLayout edgeInsetsFromPadding:](self, "edgeInsetsFromPadding:", v5);
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (double)fontHeightOfParagraphStyle:(id)a3
{
  id v5;
  void *v6;
  double result;
  const __CTFont *FontForStyle;
  double v9;

  v5 = a3;
  if (!a3)
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)-[TSURetainedPointerKeyDictionary objectForKey:](self->mParaStyleToHeightCache, "objectForKey:", v5);
  if (v6)
  {
    objc_msgSend(v6, "tsu_CGFloatValue");
  }
  else
  {
    FontForStyle = TSWPFastCreateFontForStyle(0, a3, 0x64uLL);
    v9 = ceil(TSWPDefaultLineHeightForFont(FontForStyle));
    CFRelease(FontForStyle);
    -[TSURetainedPointerKeyDictionary setObject:forKey:](self->mParaStyleToHeightCache, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "tsu_numberWithCGFloat:", v9), v5);
    return v9;
  }
  return result;
}

- (TSTTableInfo)tableInfo
{
  return self->mTableInfo;
}

- (void)setTableInfo:(id)a3
{
  self->mTableInfo = (TSTTableInfo *)a3;
}

- (TSTWPColumnCache)cellIDToWPColumnCache
{
  return self->mCellIDToWPColumnCache;
}

- (TSTDupContentCache)dupContentCache
{
  return self->mDupContentCache;
}

- (TSTWPColumnCache)tempWPColumnCache
{
  return self->mTempWPColumnCache;
}

- (TSTWidthHeightCache)widthHeightCache
{
  return self->mWidthHeightCache;
}

- (TSTHiddenRowsColumnsCache)hiddenRowsColumnsCache
{
  return self->mHiddenRowsColumnsCache;
}

- (TSDFill)bandedFillObject
{
  return self->mBandedFillObject;
}

- (int)tableEnvironment
{
  return self->mTableEnvironment;
}

- (void)setTableEnvironment:(int)a3
{
  self->mTableEnvironment = a3;
}

- (int)tableRowsBehavior
{
  return self->mTableRowsBehavior;
}

- (TSUReadWriteQueue)whCacheQueue
{
  return self->mWHCacheQueue;
}

- (unsigned)maxConcurrentTasks
{
  return self->mMaxConcurrentTasks;
}

- (unsigned)numCellsPerTask
{
  return self->mNumCellsPerTask;
}

- (void)setNumCellsPerTask:(unsigned int)a3
{
  self->mNumCellsPerTask = a3;
}

- (BOOL)inDynamicLayoutMode
{
  return self->mInDynamicLayoutMode;
}

- (NSMutableSet)dynamicLayouts
{
  return self->mDynamicLayouts;
}

- (double)dynamicAddOrRemoveColumnElementSize
{
  return self->mDynamicAddOrRemoveColumnElementSize;
}

- (double)dynamicAddOrRemoveRowElementSize
{
  return self->mDynamicAddOrRemoveRowElementSize;
}

- (BOOL)dynamicBandedFill
{
  return self->mDynamicBandedFill;
}

- (BOOL)dynamicBandedFillSetting
{
  return self->mDynamicBandedFillSetting;
}

- (int)dynamicColumnAdjustment
{
  return self->mDynamicColumnAdjustment;
}

- (double)dynamicColumnTabSize
{
  return self->mDynamicColumnTabSize;
}

- (TSUColor)dynamicFontColor
{
  return self->mDynamicFontColor;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicFontColorCellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mDynamicFontColorCellRange;
}

- (BOOL)dynamicRepResize
{
  return self->mDynamicRepResize;
}

- (void)setDynamicRepResize:(BOOL)a3
{
  self->mDynamicRepResize = a3;
}

- (TSDInfoGeometry)dynamicInfoGeometry
{
  return self->mDynamicInfoGeometry;
}

- (double)dynamicHeightResize
{
  return self->mDynamicHeightResize;
}

- (void)setDynamicHeightResize:(double)a3
{
  self->mDynamicHeightResize = a3;
}

- (double)dynamicWidthResize
{
  return self->mDynamicWidthResize;
}

- (void)setDynamicWidthResize:(double)a3
{
  self->mDynamicWidthResize = a3;
}

- (BOOL)dynamicResizingColumns
{
  return self->mDynamicResizingColumns;
}

- (double)dynamicResizingColumnAdjustment
{
  return self->mDynamicResizingColumnAdjustment;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicResizingColumnRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mDynamicResizingColumnRange;
}

- (BOOL)dynamicResizingRows
{
  return self->mDynamicResizingRows;
}

- (double)dynamicResizingRowAdjustment
{
  return self->mDynamicResizingRowAdjustment;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dynamicResizingRowRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mDynamicResizingRowRange;
}

- (int)dynamicRowAdjustment
{
  return self->mDynamicRowAdjustment;
}

- (double)dynamicRowTabSize
{
  return self->mDynamicRowTabSize;
}

- (TSDLayoutGeometry)dynamicSavedLayoutGeometry
{
  return self->mDynamicSavedLayoutGeometry;
}

- (void)setDynamicSavedLayoutGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (TSTCellRegion)dynamicSelectionRegion
{
  return self->mDynamicSelectionRegion;
}

- (double)dynamicTableNameResize
{
  return self->mDynamicTableNameResize;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)dynamicSuppressingConditionalStylesCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mDynamicSuppressingConditionalStylesCellID;
}

- (TSWPEditingController)containedTextEditor
{
  return self->mContainedTextEditor;
}

- (void)setContainedTextEditor:(id)a3
{
  self->mContainedTextEditor = (TSWPEditingController *)a3;
}

- (NSMutableArray)changeDescriptors
{
  return self->mChangeDescriptors;
}

- (TSTMergeRangeSortedSet)mergeRanges
{
  return self->mMergeRanges;
}

- (void)setMergeRanges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 592);
}

- (BOOL)processHiddenRowsForExport
{
  return self->mProcessHiddenRowsForExport;
}

- (CGSize)maximumPartitionSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMaximumPartitionSize.width;
  height = self->mMaximumPartitionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumPartitionSize:(CGSize)a3
{
  self->mMaximumPartitionSize = a3;
}

- (TSKChangeNotifier)changeNotifier
{
  return self->mChangeNotifier;
}

@end
