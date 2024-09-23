@implementation UICollectionViewControllerWrapperView

- (id)_viewControllerToNotifyOnLayoutSubviews
{
  return 0;
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  void *v5;
  UICollectionViewControllerWrapperView *v6;
  id v7;

  -[UICollectionViewControllerWrapperView _collectionViewController](self, "_collectionViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView superview](self, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(v3, "superview");
      v6 = (UICollectionViewControllerWrapperView *)objc_claimAutoreleasedReturnValue();

      if (v6 != self)
      {
        -[UIView bounds](self, "bounds");
        objc_msgSend(v3, "setFrame:");
        -[UIView addSubview:](self, "addSubview:", v3);
        if ((objc_msgSend(v7, "useLayoutToLayoutNavigationTransitions") & 1) == 0)
          objc_msgSend(v7, "_updateCollectionViewLayoutAndDelegate:", v3);
      }
    }
  }

}

- (id)preferredFocusedView
{
  void *v2;
  void *v3;

  -[UICollectionViewControllerWrapperView _collectionViewController](self, "_collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_deepestActionResponder
{
  void *v2;
  void *v3;

  -[UICollectionViewControllerWrapperView _collectionViewController](self, "_collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
