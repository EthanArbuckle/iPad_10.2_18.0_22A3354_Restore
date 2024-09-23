@implementation SBIconListViewEmptyCell

- (SBIconListViewEmptyCell)initWithCellView:(id)a3
{
  id v5;
  SBIconListViewEmptyCell *v6;
  SBIconListViewEmptyCell *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIconListViewEmptyCell;
  v6 = -[SBIconListViewEmptyCell init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cellView, a3);

  return v7;
}

- (UIView)cellView
{
  return self->_cellView;
}

- (void)setCellView:(id)a3
{
  objc_storeStrong((id *)&self->_cellView, a3);
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellView, 0);
}

@end
