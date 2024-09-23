@implementation EDOneCellAnchor

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)setRelative:(BOOL)a3
{
  self->mIsRelative = a3;
}

- (void)setFrom:(EDCellAnchorMarker)a3
{
  self->mFrom = a3;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (EDCellAnchorMarker)from
{
  EDCellAnchorMarker *p_mFrom;
  uint64_t v3;
  uint64_t v4;
  EDCellAnchorMarker result;

  p_mFrom = &self->mFrom;
  v3 = *(_QWORD *)&self->mFrom.columnIndex;
  v4 = *(_QWORD *)&p_mFrom->rowIndex;
  result.rowIndex = v4;
  result.rowAdjustment = *((float *)&v4 + 1);
  result.columnIndex = v3;
  result.columnAdjustment = *((float *)&v3 + 1);
  return result;
}

- (BOOL)isRelative
{
  return self->mIsRelative;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
