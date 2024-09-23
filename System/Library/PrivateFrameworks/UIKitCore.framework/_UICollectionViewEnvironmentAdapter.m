@implementation _UICollectionViewEnvironmentAdapter

- (_UICollectionViewEnvironmentAdapter)initWithCollectionView:(id)a3
{
  _UICollectionViewEnvironmentAdapter *v5;
  _UICollectionViewEnvironmentAdapter *v6;
  void *v9;
  objc_super v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListLayoutSection.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionView"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewEnvironmentAdapter;
  v5 = -[_UICollectionViewEnvironmentAdapter init](&v10, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_collectionView, a3);
  return v6;
}

- (CGSize)contentSize
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSDirectionalEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  objc_msgSend(WeakRetained, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_UICollectionViewEnvironmentAdapter _collectionView](self, "_collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "layoutDirection");

  if (v14 == 1)
    v15 = v11;
  else
    v15 = v7;
  if (v14 == 1)
    v16 = v7;
  else
    v16 = v11;
  v17 = v5;
  v18 = v9;
  result.trailing = v16;
  result.bottom = v18;
  result.leading = v15;
  result.top = v17;
  return result;
}

- (id)createEnvironment
{
  _UICollectionLayoutContainer *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  void *v13;
  void *v14;
  _UICollectionLayoutEnvironment *v15;
  void *v16;
  void *v17;
  void *v18;
  _UICollectionLayoutEnvironment *v19;

  v3 = [_UICollectionLayoutContainer alloc];
  -[_UICollectionViewEnvironmentAdapter contentSize](self, "contentSize");
  v5 = v4;
  v7 = v6;
  -[_UICollectionViewEnvironmentAdapter contentInsets](self, "contentInsets");
  v12 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v3, v5, v7, v8, v9, v10, v11);
  -[_UICollectionViewEnvironmentAdapter _collectionView](self, "_collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167C258, "snapshotterForDataSourceBackedView:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [_UICollectionLayoutEnvironment alloc];
  -[_UICollectionViewEnvironmentAdapter _collectionView](self, "_collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "snapshot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_UICollectionLayoutEnvironment initWithContainer:traitCollection:dataSourceSnapshot:](v15, "initWithContainer:traitCollection:dataSourceSnapshot:", v12, v17, v18);

  return v19;
}

- (UICollectionView)_collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
