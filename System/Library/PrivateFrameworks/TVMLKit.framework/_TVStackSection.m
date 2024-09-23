@implementation _TVStackSection

- (id)debugDescription
{
  void *v3;
  double sectionHeight;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  sectionHeight = self->_sectionHeight;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", self->_sectionSpacing.top, self->_sectionSpacing.left, self->_sectionSpacing.bottom, self->_sectionSpacing.right);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("_TVStackSection [%p] sectionHeight [%f] sectionSpacing [%@] firstRowIndex [%ld] rowCount [%ld] firstItemRowIndex [%ld]"), self, *(_QWORD *)&sectionHeight, v5, self->_firstRowIndex, self->_rowCount, self->_firstItemRowIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)sectionHeight
{
  return self->_sectionHeight;
}

- (void)setSectionHeight:(double)a3
{
  self->_sectionHeight = a3;
}

- (UIEdgeInsets)sectionSpacing
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionSpacing.top;
  left = self->_sectionSpacing.left;
  bottom = self->_sectionSpacing.bottom;
  right = self->_sectionSpacing.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSectionSpacing:(UIEdgeInsets)a3
{
  self->_sectionSpacing = a3;
}

- (TVRowMetrics)compoundRowMetrics
{
  $3BE62F1B3D8F3BC4B4EA8287E388A583 v3;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt;

  v3 = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self[2].rowType;
  retstr->rowInset = self[1].rowMargin;
  retstr->rowInsetAlt = v3;
  retstr->rowMargin = self[2].rowPadding;
  rowInsetAlt = self[1].rowInsetAlt;
  *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&retstr->rowType = self[1].rowInset;
  retstr->rowPadding = rowInsetAlt;
  return self;
}

- (void)setCompoundRowMetrics:(TVRowMetrics *)a3
{
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowPadding;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInset;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowMargin;

  *(_OWORD *)&self->_compoundRowMetrics.rowType = *(_OWORD *)&a3->rowType;
  rowPadding = a3->rowPadding;
  rowInset = a3->rowInset;
  rowMargin = a3->rowMargin;
  self->_compoundRowMetrics.rowInsetAlt = a3->rowInsetAlt;
  self->_compoundRowMetrics.rowMargin = rowMargin;
  self->_compoundRowMetrics.rowPadding = rowPadding;
  self->_compoundRowMetrics.rowInset = rowInset;
}

- (double)showcaseSectionHeight
{
  return self->_showcaseSectionHeight;
}

- (void)setShowcaseSectionHeight:(double)a3
{
  self->_showcaseSectionHeight = a3;
}

- (UIEdgeInsets)showcaseSectionSpacing
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_showcaseSectionSpacing.top;
  left = self->_showcaseSectionSpacing.left;
  bottom = self->_showcaseSectionSpacing.bottom;
  right = self->_showcaseSectionSpacing.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setShowcaseSectionSpacing:(UIEdgeInsets)a3
{
  self->_showcaseSectionSpacing = a3;
}

- (int64_t)firstRowIndex
{
  return self->_firstRowIndex;
}

- (void)setFirstRowIndex:(int64_t)a3
{
  self->_firstRowIndex = a3;
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

- (void)setRowCount:(int64_t)a3
{
  self->_rowCount = a3;
}

- (int64_t)firstItemRowIndex
{
  return self->_firstItemRowIndex;
}

- (void)setFirstItemRowIndex:(int64_t)a3
{
  self->_firstItemRowIndex = a3;
}

@end
