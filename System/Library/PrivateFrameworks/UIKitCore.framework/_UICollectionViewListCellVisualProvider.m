@implementation _UICollectionViewListCellVisualProvider

- (int64_t)defaultFocusStyle
{
  return 0;
}

- (_UICollectionViewListCellVisualProvider)initWithListCell:(id)a3
{
  UICollectionViewListCell *v5;
  _UICollectionViewListCellVisualProvider *v6;
  _UICollectionViewListCellVisualProvider *v7;
  void *v9;
  objc_super v10;

  v5 = (UICollectionViewListCell *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellVisualProvider.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cell"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewListCellVisualProvider;
  v6 = -[_UICollectionViewListCellVisualProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
    v6->_cell = v5;

  return v7;
}

- (UIView)accessoryManagerContainerView
{
  return (UIView *)self->_cell;
}

- (BOOL)canFocusProgrammatically
{
  return 0;
}

@end
