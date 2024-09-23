@implementation TSTAnimation

+ (id)newAnimationWithLayout:(id)a3 andDeliveryStyle:(unint64_t)a4
{
  TSTAnimation *v6;
  TSTAnimation *v7;
  int v8;

  v6 = objc_alloc_init(TSTAnimation);
  v7 = v6;
  v6->mLayout = (TSTLayout *)a3;
  if (a4 > 0xC)
    v8 = 1;
  else
    v8 = dword_217C2BF4C[a4];
  TSTAnimationSetKind((uint64_t)v6, v8);
  return v7;
}

+ (id)newAnimationWithLayout:(id)a3 andCellRange:(id)a4
{
  TSTAnimation *v6;

  v6 = objc_alloc_init(TSTAnimation);
  v6->mLayout = (TSTLayout *)a3;
  TSTAnimationSetKind((uint64_t)v6, 14);
  -[TSTAnimation addCellRange:](v6, "addCellRange:", a4);
  return v6;
}

- (void)dealloc
{
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  objc_super v4;

  mCellRanges = self->mCellRanges;
  if (mCellRanges)
    free(mCellRanges);
  v4.receiver = self;
  v4.super_class = (Class)TSTAnimation;
  -[TSTAnimation dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTAnimation *v4;
  $CA3468F20078D5D2DB35E78E73CA60DA *v5;

  v4 = -[TSTAnimation init](+[TSTAnimation allocWithZone:](TSTAnimation, "allocWithZone:", a3), "init");
  v4->mLayout = self->mLayout;
  v4->mKind = self->mKind;
  v5 = ($CA3468F20078D5D2DB35E78E73CA60DA *)malloc_type_malloc(8 * self->mCellRangeCount, 0x100004000313F17uLL);
  v4->mCellRanges = v5;
  memcpy(v5, self->mCellRanges, 8 * self->mCellRangeCount);
  v4->mCellRangeCount = self->mCellRangeCount;
  v4->mStageCount = self->mStageCount;
  v4->mStage = self->mStage;
  v4->mFinal = self->mFinal;
  v4->mByColumn = self->mByColumn;
  v4->mByRow = self->mByRow;
  v4->mByCell = self->mByCell;
  v4->mByContent = self->mByContent;
  v4->mByCellRange = self->mByCellRange;
  v4->mByMissingCellRange = self->mByMissingCellRange;
  v4->mReverse = self->mReverse;
  v4->mShowsTableChrome = self->mShowsTableChrome;
  v4->mShowsOverlayLayers = self->mShowsOverlayLayers;
  v4->mExpandBackgroundFill = self->mExpandBackgroundFill;
  v4->mDrawsBlackAndWhite = self->mDrawsBlackAndWhite;
  return v4;
}

+ (id)textureDeliveryStylesLocalized:(BOOL)a3
{
  _QWORD v4[14];

  v4[13] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return &unk_24D8FAB78;
  v4[0] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("All at Once"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[1] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Row"), &stru_24D82FEB0, CFSTR("TSTables"), v4[0]);
  v4[2] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Column"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[3] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Cell"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[4] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Row Content"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[5] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Column Content"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[6] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Cell Content"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[7] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Row Reverse"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[8] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Row Content Reverse"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[9] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Column Reverse"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[10] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Column Content Reverse"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[11] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Cell Reverse"), &stru_24D82FEB0, CFSTR("TSTables"));
  v4[12] = objc_msgSend((id)TSTBundle(), "localizedStringForKey:value:table:", CFSTR("By Cell Content Reverse"), &stru_24D82FEB0, CFSTR("TSTables"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 13);
}

+ (unint64_t)stageCountForTextureDeliveryStyle:(unint64_t)a3 andTable:(id)a4
{
  int v4;

  if (a3 > 0xC)
    v4 = 1;
  else
    v4 = dword_217C2BF4C[a3];
  return TSTAnimationGetStageCountForChunkStyle((TSTTableModel *)a4, v4);
}

+ (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3
{
  unint64_t result;
  void *v4;
  uint64_t v5;

  result = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "textureDeliveryStylesLocalized:", 0), "indexOfObject:", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSTAnimation textureDeliveryStyleFromDeliveryString:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTAnimation.mm"), 682, CFSTR("bad delivery string to delivery style mapping"));
    return 0;
  }
  return result;
}

+ (BOOL)deliveryStyleSupportedForExport:(unint64_t)a3
{
  _BOOL4 v3;

  if (a3 > 0xC)
    LOBYTE(v3) = 1;
  else
    return (0x5D77u >> dword_217C2BF4C[a3]) & 1;
  return v3;
}

- (void)setStage:(unint64_t)a3 andFinal:(BOOL)a4
{
  if (self->mStageCount > a3)
    self->mStage = a3;
  self->mFinal = a4;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRangeAtIndex:(unint64_t)a3
{
  if (self->mCellRangeCount <= a3)
    return ($CA3468F20078D5D2DB35E78E73CA60DA)0xFFFFFFLL;
  else
    return self->mCellRanges[a3];
}

- (unint64_t)cellRangeCount
{
  uint64_t PartitionRange;
  int mKind;
  uint64_t v5;
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  unint64_t mStage;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  TSTTableModel *v14;
  uint64_t v15;
  TSTAnimation *v16;

  PartitionRange = TSTLayoutGetPartitionRange(self->mLayout);
  mKind = self->mKind;
  if (mKind != 14)
  {
    v5 = PartitionRange;
    mCellRanges = self->mCellRanges;
    if (mCellRanges)
    {
      free(mCellRanges);
      self->mCellRanges = 0;
      self->mCellRangeCount = 0;
      mKind = self->mKind;
    }
    switch(mKind)
    {
      case 0:
      case 1:
        goto LABEL_20;
      case 2:
      case 3:
        mStage = self->mStage;
        if (self->mReverse)
        {
          v8 = self->mStageCount + ~mStage;
LABEL_23:
          v14 = -[TSTLayout tableModel](self->mLayout, "tableModel");
          v16 = self;
          v15 = v8;
        }
        else
        {
          v14 = -[TSTLayout tableModel](self->mLayout, "tableModel");
          v15 = mStage;
          v16 = self;
        }
        TSTAnimationAddCellRangesForColumnIndex(v16, v14, v15);
        break;
      case 4:
      case 5:
        v9 = self->mStage;
        if (self->mReverse)
          v9 = self->mStageCount + ~v9;
        goto LABEL_26;
      case 6:
      case 7:
        v10 = self->mStage;
        if (self->mReverse)
          v10 = self->mStageCount + ~v10;
        goto LABEL_28;
      case 8:
      case 9:
        v11 = self->mStage;
        if (!v11)
          goto LABEL_20;
        if (self->mReverse)
          v8 = self->mStageCount + ~v11;
        else
          v8 = v11 - 1;
        goto LABEL_23;
      case 10:
      case 11:
        v12 = self->mStage;
        if (!v12)
          goto LABEL_20;
        if (self->mReverse)
          v9 = self->mStageCount + ~v12;
        else
          v9 = v12 - 1;
LABEL_26:
        TSTAnimationAddCellRangesForRowIndex(self, -[TSTLayout tableModel](self->mLayout, "tableModel"), v9);
        return self->mCellRangeCount;
      case 12:
      case 13:
        v13 = self->mStage;
        if (v13)
        {
          if (self->mReverse)
            v10 = self->mStageCount + ~v13;
          else
            v10 = v13 - 1;
LABEL_28:
          TSTAnimationAddCellRangeForCellIndex(self, -[TSTLayout tableModel](self->mLayout, "tableModel"), v10);
        }
        else
        {
LABEL_20:
          -[TSTAnimation addCellRange:](self, "addCellRange:", v5);
        }
        return self->mCellRangeCount;
      default:
        return self->mCellRangeCount;
    }
  }
  return self->mCellRangeCount;
}

- (void)addCellRange:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  $CA3468F20078D5D2DB35E78E73CA60DA **p_mCellRanges;
  unint64_t v7;
  $CA3468F20078D5D2DB35E78E73CA60DA *v8;

  if (a3.var0.var0 != 0xFFFF
    && (*(_QWORD *)&a3 & 0xFF0000) != 0xFF0000
    && a3.var1.var1
    && (*(_QWORD *)&a3 & 0xFFFF00000000) != 0)
  {
    p_mCellRanges = &self->mCellRanges;
    mCellRanges = self->mCellRanges;
    v7 = (unint64_t)p_mCellRanges[1] + 1;
    self->mCellRangeCount = v7;
    v8 = ($CA3468F20078D5D2DB35E78E73CA60DA *)malloc_type_realloc(mCellRanges, 8 * v7, 0x100004000313F17uLL);
    self->mCellRanges = v8;
    v8[self->mCellRangeCount - 1] = a3;
  }
}

- (void)clearCellRanges
{
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  $CA3468F20078D5D2DB35E78E73CA60DA **p_mCellRanges;

  p_mCellRanges = &self->mCellRanges;
  mCellRanges = self->mCellRanges;
  if (mCellRanges)
  {
    free(mCellRanges);
    *p_mCellRanges = 0;
    p_mCellRanges[1] = 0;
  }
}

- (BOOL)enabled
{
  return self->mKind != 0;
}

- (BOOL)drawTableName
{
  _BOOL4 v3;

  v3 = -[TSTAnimation enabled](self, "enabled");
  if (v3)
  {
    if (self->mByCellRange)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = self->mFinal || self->mStage == 0;
  }
  return v3;
}

- (BOOL)drawTableBackground
{
  _BOOL4 v3;

  v3 = -[TSTAnimation enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = !-[TSTAnimation drawsBlackAndWhite](self, "drawsBlackAndWhite")
              && (self->mFinal || self->mByCellRange || !self->mByContent || self->mStage == 0);
  return v3;
}

- (BOOL)drawCellBackground
{
  _BOOL4 v3;

  v3 = -[TSTAnimation enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = !-[TSTAnimation drawsBlackAndWhite](self, "drawsBlackAndWhite")
              && (self->mByCellRange || !self->mByContent || self->mStage != 0);
  return v3;
}

- (BOOL)drawCellContent
{
  _BOOL4 v3;

  v3 = -[TSTAnimation enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = self->mByCellRange || !self->mByContent || self->mStage != 0;
  return v3;
}

- (BOOL)clipStrokes
{
  _BOOL4 v3;

  v3 = -[TSTAnimation enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = self->mByCellRange || !self->mByContent;
  return v3;
}

- (BOOL)drawStrokes
{
  _BOOL4 v3;

  v3 = -[TSTAnimation enabled](self, "enabled");
  if (v3)
    LOBYTE(v3) = self->mFinal || self->mByCellRange || !self->mByContent || self->mStage == 0;
  return v3;
}

- (unint64_t)stageCount
{
  return self->mStageCount;
}

- (unint64_t)stage
{
  return self->mStage;
}

- (BOOL)final
{
  return self->mFinal;
}

- (BOOL)showsTableChrome
{
  return self->mShowsTableChrome;
}

- (void)setShowsTableChrome:(BOOL)a3
{
  self->mShowsTableChrome = a3;
}

- (BOOL)showsOverlayLayers
{
  return self->mShowsOverlayLayers;
}

- (void)setShowsOverlayLayers:(BOOL)a3
{
  self->mShowsOverlayLayers = a3;
}

- (BOOL)expandBackgroundFill
{
  return self->mExpandBackgroundFill;
}

- (void)setExpandBackgroundFill:(BOOL)a3
{
  self->mExpandBackgroundFill = a3;
}

- (BOOL)drawsBlackAndWhite
{
  return self->mDrawsBlackAndWhite;
}

- (void)setDrawsBlackAndWhite:(BOOL)a3
{
  self->mDrawsBlackAndWhite = a3;
}

@end
