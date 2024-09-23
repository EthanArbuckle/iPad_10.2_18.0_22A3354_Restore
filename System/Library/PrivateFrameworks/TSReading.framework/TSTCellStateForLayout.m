@implementation TSTCellStateForLayout

- (TSTCellStateForLayout)init
{
  TSTCellStateForLayout *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTCellStateForLayout;
  result = -[TSTCellStateForLayout init](&v4, sel_init);
  if (result)
  {
    v3 = (CGSize)*MEMORY[0x24BDBF148];
    result->mMaxSize = (CGSize)*MEMORY[0x24BDBF148];
    *(_OWORD *)&result->mPaddingInsets.top = *(_OWORD *)TSDEdgeInsetsZero;
    result->mCell = 0;
    result->mMergedRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)0xFFFFFFLL;
    *(_OWORD *)&result->mPaddingInsets.bottom = *(_OWORD *)&TSDEdgeInsetsZero[16];
    *(_QWORD *)&result->mCellPropsRowHeight = 0xFFFFFF00000000;
    result->mCellContents = 0;
    result->mKeyVal = 0;
    result->mWPColumn = 0;
    *(_QWORD *)&result->mVerticalAlignment = 0xF00000000;
    *(int64x2_t *)&result->mPageNumber = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    result->mMinSize = v3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->mCell = 0;
  self->mWPColumn = 0;

  self->mCellContents = 0;
  self->mKeyVal = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTCellStateForLayout;
  -[TSTCellStateForLayout dealloc](&v3, sel_dealloc);
}

- (BOOL)hasContent
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_opt_class();
  -[TSTCellStateForLayout cellContents](self, "cellContents");
  if (TSUDynamicCast())
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellStateForLayout hasContent]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStateForLayout.m"), 79, CFSTR("expected nil value for '%s'"), "TSUCastAsClass(TSWPColumn, [self cellContents])");
  }
  v5 = -[TSTCellStateForLayout cellContents](self, "cellContents");
  if (v5)
    LOBYTE(v5) = objc_msgSend(-[TSTCellStateForLayout cellContents](self, "cellContents"), "length") != 0;
  return (char)v5;
}

- (id)cellContents
{
  TSTCell *mCell;
  int v5;
  id v6;
  TSWPStorage *v7;
  void *v8;

  if (self->mCellContents)
    return self->mCellContents;
  mCell = self->mCell;
  if (!mCell)
    return self->mCellContents;
  v5 = *((unsigned __int8 *)&mCell->mPrivate + 1);
  if (v5 != 6)
  {
    if (v5 == 9)
    {
      v7 = -[TSTRichTextPayload storage](mCell->mPrivate.mRichTextPayload, "storage");
      self->mCellContents = v7;
      v6 = -[TSWPStorage string](v7, "string");
      goto LABEL_11;
    }
    if (v5 == 8)
      goto LABEL_7;
LABEL_9:
    v6 = (id)NSStringFromNativeTSTCell((uint64_t)mCell);
    self->mCellContents = v6;
    goto LABEL_11;
  }
  if (mCell->mPrivate.mCellFormats.mCurrentCellFormat.mFormatType != 263)
    goto LABEL_9;
LABEL_7:
  v6 = 0;
  self->mCellContents = 0;
LABEL_11:
  if (TSTCellFormatUsesAccountingStyle(&self->mCell->super.isa)
    && v6
    && objc_msgSend(v6, "length")
    && !self->mForDrawing)
  {
    v8 = (void *)objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), &stru_24D82FEB0);

    self->mCellContents = 0;
    self->mCellContents = v8;
  }
  return self->mCellContents;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)modelCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mModelCellID;
}

- (void)setModelCellID:(id)a3
{
  self->mModelCellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (TSTCell)cell
{
  return self->mCell;
}

- (void)setCell:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)mergedRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mMergedRange;
}

- (void)setMergedRange:(id)a3
{
  self->mMergedRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- (BOOL)cellPropsRowHeight
{
  return self->mCellPropsRowHeight;
}

- (void)setCellPropsRowHeight:(BOOL)a3
{
  self->mCellPropsRowHeight = a3;
}

- (BOOL)cellWraps
{
  return self->mCellWraps;
}

- (void)setCellWraps:(BOOL)a3
{
  self->mCellWraps = a3;
}

- (BOOL)forDrawing
{
  return self->mForDrawing;
}

- (void)setForDrawing:(BOOL)a3
{
  self->mForDrawing = a3;
}

- (BOOL)inDynamicLayout
{
  return self->mInDynamicLayout;
}

- (void)setInDynamicLayout:(BOOL)a3
{
  self->mInDynamicLayout = a3;
}

- (TSWPColumn)wpColumn
{
  return self->mWPColumn;
}

- (void)setWpColumn:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CGSize)minSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMinSize.width;
  height = self->mMinSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->mMinSize = a3;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMaxSize.width;
  height = self->mMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->mMaxSize = a3;
}

- (UIEdgeInsets)paddingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mPaddingInsets.top;
  left = self->mPaddingInsets.left;
  bottom = self->mPaddingInsets.bottom;
  right = self->mPaddingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPaddingInsets:(UIEdgeInsets)a3
{
  self->mPaddingInsets = a3;
}

- (unsigned)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (void)setVerticalAlignment:(unsigned int)a3
{
  self->mVerticalAlignment = a3;
}

- (void)setCellContents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TSTLayoutContentCachedKey)keyVal
{
  return self->mKeyVal;
}

- (void)setKeyVal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)layoutCacheFlags
{
  return self->mLayoutCacheFlags;
}

- (void)setLayoutCacheFlags:(int)a3
{
  self->mLayoutCacheFlags = a3;
}

- (unint64_t)pageNumber
{
  return self->mPageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->mPageNumber = a3;
}

- (unint64_t)pageCount
{
  return self->mPageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->mPageCount = a3;
}

@end
