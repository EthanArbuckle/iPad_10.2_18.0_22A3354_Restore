@implementation OADTableCell

- (OADTableCell)init
{
  OADTableCell *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableCell;
  result = -[OADTableCell init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->mRowSpan = 0x100000001;
    *(_WORD *)&result->mHorzMerge = 0;
    *(_QWORD *)&result->mTopRow = -1;
  }
  return result;
}

- (void)setRowSpan:(int)a3
{
  self->mRowSpan = a3;
}

- (void)setGridSpan:(int)a3
{
  self->mGridSpan = a3;
}

- (void)setHorzMerge:(BOOL)a3
{
  self->mHorzMerge = a3;
}

- (void)setVertMerge:(BOOL)a3
{
  self->mVertMerge = a3;
}

- (void)setTextBody:(id)a3
{
  objc_storeStrong((id *)&self->mTextBody, a3);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->mProperties, a3);
}

- (id)textBody
{
  return self->mTextBody;
}

- (BOOL)horzMerge
{
  return self->mHorzMerge;
}

- (BOOL)vertMerge
{
  return self->mVertMerge;
}

- (int)gridSpan
{
  return self->mGridSpan;
}

- (int)rowSpan
{
  return self->mRowSpan;
}

- (id)properties
{
  return self->mProperties;
}

- (int)spanAlongDir:(int)a3
{
  if (a3)
    return -[OADTableCell gridSpan](self, "gridSpan");
  else
    return -[OADTableCell rowSpan](self, "rowSpan");
}

- (BOOL)merge:(int)a3
{
  if (a3)
    return -[OADTableCell horzMerge](self, "horzMerge");
  else
    return -[OADTableCell vertMerge](self, "vertMerge");
}

- (int)topRow
{
  return self->mTopRow;
}

- (void)setTopRow:(int)a3
{
  self->mTopRow = a3;
}

- (int)leftColumn
{
  return self->mLeftColumn;
}

- (void)setLeftColumn:(int)a3
{
  self->mLeftColumn = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableCell;
  -[OADTableCell description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProperties, 0);
  objc_storeStrong((id *)&self->mTextBody, 0);
}

@end
