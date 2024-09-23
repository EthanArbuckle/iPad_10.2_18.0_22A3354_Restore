@implementation UICollectionViewPlaceholder

- (UICollectionViewPlaceholder)initWithInsertionIndexPath:(NSIndexPath *)insertionIndexPath reuseIdentifier:(NSString *)reuseIdentifier
{
  NSIndexPath *v7;
  NSString *v8;
  UICollectionViewPlaceholder *v9;
  UICollectionViewPlaceholder *v10;
  uint64_t v11;
  NSString *cellReuseIdentifier;
  objc_super v14;

  v7 = insertionIndexPath;
  v8 = reuseIdentifier;
  v14.receiver = self;
  v14.super_class = (Class)UICollectionViewPlaceholder;
  v9 = -[UICollectionViewPlaceholder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_insertionIndexPath, insertionIndexPath);
    v11 = -[NSString copy](v8, "copy");
    cellReuseIdentifier = v10->_cellReuseIdentifier;
    v10->_cellReuseIdentifier = (NSString *)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UICollectionViewPlaceholder *v4;
  void *v5;
  void *v6;
  UICollectionViewPlaceholder *v7;
  void *v8;

  v4 = [UICollectionViewPlaceholder alloc];
  -[UICollectionViewPlaceholder insertionIndexPath](self, "insertionIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewPlaceholder cellReuseIdentifier](self, "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UICollectionViewPlaceholder initWithInsertionIndexPath:reuseIdentifier:](v4, "initWithInsertionIndexPath:reuseIdentifier:", v5, v6);

  -[UICollectionViewPlaceholder cellUpdateHandler](self, "cellUpdateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewPlaceholder setCellUpdateHandler:](v7, "setCellUpdateHandler:", v8);

  return v7;
}

- (NSIndexPath)insertionIndexPath
{
  return self->_insertionIndexPath;
}

- (void)setInsertionIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_insertionIndexPath, a3);
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (void)setCellReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)cellUpdateHandler
{
  return self->_cellUpdateHandler;
}

- (void)setCellUpdateHandler:(void *)cellUpdateHandler
{
  objc_setProperty_nonatomic_copy(self, a2, cellUpdateHandler, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellUpdateHandler, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_insertionIndexPath, 0);
}

@end
