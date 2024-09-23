@implementation EDTwoCellAnchor

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (EDTwoCellAnchor)init
{
  EDTwoCellAnchor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTwoCellAnchor;
  result = -[EDTwoCellAnchor init](&v3, sel_init);
  if (result)
    result->mEditAs = 0;
  return result;
}

- (void)setRelative:(BOOL)a3
{
  self->mIsRelative = a3;
}

- (void)setEditAs:(int)a3
{
  self->mEditAs = a3;
}

- (void)setFrom:(EDCellAnchorMarker)a3
{
  self->mFrom = a3;
}

- (void)setTo:(EDCellAnchorMarker)a3
{
  self->mTo = a3;
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

- (EDCellAnchorMarker)to
{
  EDCellAnchorMarker *p_mTo;
  uint64_t v3;
  uint64_t v4;
  EDCellAnchorMarker result;

  p_mTo = &self->mTo;
  v3 = *(_QWORD *)&self->mTo.columnIndex;
  v4 = *(_QWORD *)&p_mTo->rowIndex;
  result.rowIndex = v4;
  result.rowAdjustment = *((float *)&v4 + 1);
  result.columnIndex = v3;
  result.columnAdjustment = *((float *)&v3 + 1);
  return result;
}

- (int)editAs
{
  return self->mEditAs;
}

@end
