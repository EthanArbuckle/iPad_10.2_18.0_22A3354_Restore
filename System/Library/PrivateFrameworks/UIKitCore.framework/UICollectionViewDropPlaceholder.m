@implementation UICollectionViewDropPlaceholder

- (id)copyWithZone:(_NSZone *)a3
{
  UICollectionViewDropPlaceholder *v4;
  void *v5;
  void *v6;
  UICollectionViewDropPlaceholder *v7;
  void *v8;
  void *v9;

  v4 = [UICollectionViewDropPlaceholder alloc];
  -[UICollectionViewPlaceholder insertionIndexPath](self, "insertionIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewPlaceholder cellReuseIdentifier](self, "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UICollectionViewPlaceholder initWithInsertionIndexPath:reuseIdentifier:](v4, "initWithInsertionIndexPath:reuseIdentifier:", v5, v6);

  -[UICollectionViewPlaceholder cellUpdateHandler](self, "cellUpdateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewPlaceholder setCellUpdateHandler:](v7, "setCellUpdateHandler:", v8);

  -[UICollectionViewDropPlaceholder previewParametersProvider](self, "previewParametersProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDropPlaceholder setPreviewParametersProvider:](v7, "setPreviewParametersProvider:", v9);

  return v7;
}

- (void)previewParametersProvider
{
  return self->_previewParametersProvider;
}

- (void)setPreviewParametersProvider:(void *)previewParametersProvider
{
  objc_setProperty_nonatomic_copy(self, a2, previewParametersProvider, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewParametersProvider, 0);
}

@end
