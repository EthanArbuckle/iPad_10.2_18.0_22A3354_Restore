@implementation _UICollectionViewDiffableDataSource

- (_UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewDiffableDataSource;
  return -[_UIDiffableDataSource initWithCollectionView:cellProvider:](&v5, sel_initWithCollectionView_cellProvider_, a3, a4);
}

- (void)setSupplementaryViewProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupplementaryViewProvider:", v4);

}

- (id)supplementaryViewProvider
{
  void *v2;
  void *v3;

  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supplementaryViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UICollectionView)collectionView
{
  void *v2;
  void *v3;

  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICollectionView *)v3;
}

- (_UICollectionViewDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewDiffableDataSource;
  return -[_UIDiffableDataSource initWithCollectionView:reuseIdentifierProvider:cellConfigurationHandler:](&v6, sel_initWithCollectionView_reuseIdentifierProvider_cellConfigurationHandler_, a3, a4, a5);
}

- (id)supplementaryConfigurationHandler
{
  void *v2;
  void *v3;

  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supplementaryViewConfigurationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSupplementaryConfigurationHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupplementaryViewConfigurationHandler:", v4);

}

- (id)supplementaryReuseIdentifierProvider
{
  void *v2;
  void *v3;

  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supplementaryReuseIdentifierProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSupplementaryReuseIdentifierProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDiffableDataSource dsImpl](self, "dsImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupplementaryReuseIdentifierProvider:", v4);

}

@end
