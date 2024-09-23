@implementation WDTableCellDescriptor

- (id)shading
{
  return self->mShading;
}

- (void)setShading:(id)a3
{
  objc_storeStrong((id *)&self->mShading, a3);
}

- (BOOL)isShadingOverridden
{
  return *((_BYTE *)self + 108) & 1;
}

- (void)setShadingOverridden:(BOOL)a3
{
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xFE | a3;
}

- (id)topBorder
{
  return self->mTopBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->mTopBorder, a3);
}

- (BOOL)isTopBorderOverridden
{
  return (*((unsigned __int8 *)self + 108) >> 1) & 1;
}

- (void)setTopBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xFD | v3;
}

- (id)leftBorder
{
  return self->mLeftBorder;
}

- (void)setLeftBorder:(id)a3
{
  objc_storeStrong((id *)&self->mLeftBorder, a3);
}

- (BOOL)isLeftBorderOverridden
{
  return (*((unsigned __int8 *)self + 108) >> 2) & 1;
}

- (void)setLeftBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xFB | v3;
}

- (id)bottomBorder
{
  return self->mBottomBorder;
}

- (void)setBottomBorder:(id)a3
{
  objc_storeStrong((id *)&self->mBottomBorder, a3);
}

- (BOOL)isBottomBorderOverridden
{
  return (*((unsigned __int8 *)self + 108) >> 3) & 1;
}

- (void)setBottomBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xF7 | v3;
}

- (id)rightBorder
{
  return self->mRightBorder;
}

- (void)setRightBorder:(id)a3
{
  objc_storeStrong((id *)&self->mRightBorder, a3);
}

- (BOOL)isRightBorderOverridden
{
  return (*((unsigned __int8 *)self + 108) >> 4) & 1;
}

- (void)setRightBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xEF | v3;
}

- (id)diagonalUpBorder
{
  return self->mDiagonalUpBorder;
}

- (void)setDiagonalUpBorder:(id)a3
{
  objc_storeStrong((id *)&self->mDiagonalUpBorder, a3);
}

- (BOOL)isDiagonalUpBorderOverridden
{
  return (*((unsigned __int8 *)self + 108) >> 5) & 1;
}

- (void)setDiagonalUpBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xDF | v3;
}

- (id)diagonalDownBorder
{
  return self->mDiagonalDownBorder;
}

- (void)setDiagonalDownBorder:(id)a3
{
  objc_storeStrong((id *)&self->mDiagonalDownBorder, a3);
}

- (BOOL)isDiagonalDownBorderOverridden
{
  return (*((unsigned __int8 *)self + 108) >> 6) & 1;
}

- (void)setDiagonalDownBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = *((_BYTE *)self + 108) & 0xBF | v3;
}

- (void)setWidth:(signed __int16)a3
{
  self->mWidth = a3;
}

- (int)widthType
{
  return self->mWidthType;
}

- (void)setWidthType:(int)a3
{
  self->mWidthType = a3;
}

- (BOOL)isWidthTypeOverridden
{
  return *((unsigned __int8 *)self + 108) >> 7;
}

- (void)setWidthTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 108) = v3 & 0x80 | *((_BYTE *)self + 108) & 0x7F;
}

- (signed)topMargin
{
  return self->mTopMargin;
}

- (void)setTopMargin:(signed __int16)a3
{
  self->mTopMargin = a3;
}

- (BOOL)isTopMarginOverridden
{
  return *((_BYTE *)self + 109) & 1;
}

- (void)setTopMarginOverridden:(BOOL)a3
{
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xFE | a3;
}

- (int)topMarginType
{
  return self->mTopMarginType;
}

- (void)setTopMarginType:(int)a3
{
  self->mTopMarginType = a3;
}

- (BOOL)isTopMarginTypeOverridden
{
  return (*((unsigned __int8 *)self + 109) >> 1) & 1;
}

- (void)setTopMarginTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xFD | v3;
}

- (signed)bottomMargin
{
  return self->mBottomMargin;
}

- (void)setBottomMargin:(signed __int16)a3
{
  self->mBottomMargin = a3;
}

- (BOOL)isBottomMarginOverridden
{
  return (*((unsigned __int8 *)self + 109) >> 2) & 1;
}

- (void)setBottomMarginOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xFB | v3;
}

- (int)bottomMarginType
{
  return self->mBottomMarginType;
}

- (void)setBottomMarginType:(int)a3
{
  self->mBottomMarginType = a3;
}

- (BOOL)isBottomMarginTypeOverridden
{
  return (*((unsigned __int8 *)self + 109) >> 3) & 1;
}

- (void)setBottomMarginTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xF7 | v3;
}

- (signed)leftMargin
{
  return self->mLeftMargin;
}

- (void)setLeftMargin:(signed __int16)a3
{
  self->mLeftMargin = a3;
}

- (BOOL)isLeftMarginOverridden
{
  return (*((unsigned __int8 *)self + 109) >> 4) & 1;
}

- (void)setLeftMarginOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xEF | v3;
}

- (int)leftMarginType
{
  return self->mLeftMarginType;
}

- (void)setLeftMarginType:(int)a3
{
  self->mLeftMarginType = a3;
}

- (BOOL)isLeftMarginTypeOverridden
{
  return (*((unsigned __int8 *)self + 109) >> 5) & 1;
}

- (void)setLeftMarginTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xDF | v3;
}

- (signed)rightMargin
{
  return self->mRightMargin;
}

- (void)setRightMargin:(signed __int16)a3
{
  self->mRightMargin = a3;
}

- (BOOL)isRightMarginOverridden
{
  return (*((unsigned __int8 *)self + 109) >> 6) & 1;
}

- (void)setRightMarginOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = *((_BYTE *)self + 109) & 0xBF | v3;
}

- (int)rightMarginType
{
  return self->mRightMarginType;
}

- (void)setRightMarginType:(int)a3
{
  self->mRightMarginType = a3;
}

- (BOOL)isRightMarginTypeOverridden
{
  return *((unsigned __int8 *)self + 109) >> 7;
}

- (void)setRightMarginTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 109) = v3 & 0x80 | *((_BYTE *)self + 109) & 0x7F;
}

- (int)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (void)setVerticalAlignment:(int)a3
{
  self->mVerticalAlignment = a3;
}

- (BOOL)isVerticalAlignmentOverridden
{
  return *((_BYTE *)self + 110) & 1;
}

- (void)setVerticalAlignmentOverridden:(BOOL)a3
{
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xFE | a3;
}

- (BOOL)verticallyMergedCell
{
  return (*((unsigned __int8 *)self + 110) >> 1) & 1;
}

- (void)setVerticallyMergedCell:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xFD | v3;
}

- (BOOL)isVerticallyMergedCellOverridden
{
  return (*((unsigned __int8 *)self + 110) >> 2) & 1;
}

- (void)setVerticallyMergedCellOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xFB | v3;
}

- (BOOL)firstInSetOfVerticallyMergedCells
{
  return (*((unsigned __int8 *)self + 110) >> 3) & 1;
}

- (void)setFirstInSetOfVerticallyMergedCells:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xF7 | v3;
}

- (BOOL)isFirstInSetOfVerticallyMergedCellsOverridden
{
  return (*((unsigned __int8 *)self + 110) >> 4) & 1;
}

- (void)setFirstInSetOfVerticallyMergedCellsOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xEF | v3;
}

- (BOOL)noWrap
{
  return (*((unsigned __int8 *)self + 110) >> 5) & 1;
}

- (void)setNoWrap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xDF | v3;
}

- (BOOL)isNoWrapOverridden
{
  return (*((unsigned __int8 *)self + 110) >> 6) & 1;
}

- (void)setNoWrapOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 110) = *((_BYTE *)self + 110) & 0xBF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDiagonalDownBorder, 0);
  objc_storeStrong((id *)&self->mDiagonalUpBorder, 0);
  objc_storeStrong((id *)&self->mRightBorder, 0);
  objc_storeStrong((id *)&self->mBottomBorder, 0);
  objc_storeStrong((id *)&self->mLeftBorder, 0);
  objc_storeStrong((id *)&self->mTopBorder, 0);
  objc_storeStrong((id *)&self->mShading, 0);
}

@end
