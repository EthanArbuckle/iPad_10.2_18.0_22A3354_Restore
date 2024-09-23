@implementation SKUIScrollingTabBarContentCollectionView

- (void)layoutSubviews
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollingTabBarContentCollectionView layoutSubviews]";
}

- (void)_reuseCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "removeFromSuperview");
  -[SKUIScrollingTabBarContentCollectionView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "indexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:didEndDisplayingCell:forItemAtIndexPath:", self, v6, v5);

  }
}

- (BOOL)isPerformingLayout
{
  return self->_performingLayout;
}

@end
