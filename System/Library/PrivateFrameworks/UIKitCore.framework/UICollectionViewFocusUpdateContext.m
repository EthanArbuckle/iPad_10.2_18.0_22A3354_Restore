@implementation UICollectionViewFocusUpdateContext

+ (id)_contextWithContext:(id)a3 collectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContext:collectionView:cachedPreviouslyFocusedIndexPath:", v7, v6, 0);

  return v8;
}

+ (id)_contextWithContext:(id)a3 collectionView:(id)a4 cachedPreviouslyFocusedIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithContext:collectionView:cachedPreviouslyFocusedIndexPath:", v10, v9, v8);

  return v11;
}

- (id)_initWithContext:(id)a3 collectionView:(id)a4 cachedPreviouslyFocusedIndexPath:(id)a5
{
  id v8;
  id v9;
  id *v10;
  id *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewFocusUpdateContext;
  v10 = -[UIFocusUpdateContext _initWithContext:](&v15, sel__initWithContext_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(v10 + 23, v8);
    v12 = objc_msgSend(v9, "copy");
    v13 = v11[21];
    v11[21] = (id)v12;

    *((_BYTE *)v11 + 160) = v9 != 0;
  }

  return v11;
}

- (NSIndexPath)previouslyFocusedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_didSetPreviouslyFocusedIndexPath)
  {
    -[UIFocusUpdateContext previouslyFocusedView](self, "previouslyFocusedView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UICollectionViewFocusUpdateContext collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _UICollectionViewCellForView(v4, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v4, "indexPathForCell:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, v6);
      if (v5)

    }
    self->_didSetPreviouslyFocusedIndexPath = 1;

  }
  return self->_previouslyFocusedIndexPath;
}

- (NSIndexPath)nextFocusedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_didSetNextFocusedIndexPath)
  {
    -[UIFocusUpdateContext nextFocusedView](self, "nextFocusedView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UICollectionViewFocusUpdateContext collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      _UICollectionViewCellForView(v4, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v4, "indexPathForCell:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      objc_storeStrong((id *)&self->_nextFocusedIndexPath, v6);
      if (v5)

    }
    self->_didSetNextFocusedIndexPath = 1;

  }
  return self->_nextFocusedIndexPath;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_nextFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedIndexPath, 0);
}

@end
