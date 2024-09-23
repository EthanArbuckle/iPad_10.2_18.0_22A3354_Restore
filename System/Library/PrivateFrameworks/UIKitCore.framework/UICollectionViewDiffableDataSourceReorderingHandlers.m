@implementation UICollectionViewDiffableDataSourceReorderingHandlers

- (void)canReorderItemHandler
{
  return self->_canReorderItemHandler;
}

- (void)setDidReorderHandler:(void *)didReorderHandler
{
  objc_setProperty_nonatomic_copy(self, a2, didReorderHandler, 24);
}

- (void)setCanReorderItemHandler:(void *)canReorderItemHandler
{
  objc_setProperty_nonatomic_copy(self, a2, canReorderItemHandler, 8);
}

- (void)setWillReorderHandler:(void *)willReorderHandler
{
  objc_setProperty_nonatomic_copy(self, a2, willReorderHandler, 16);
}

- (void)willReorderHandler
{
  return self->_willReorderHandler;
}

- (UICollectionViewDiffableDataSourceReorderingHandlers)initWithCanReorderItemHandler:(id)a3 willReorderItemHandler:(id)a4 didReorderItemHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  UICollectionViewDiffableDataSourceReorderingHandlers *v11;
  void *v12;
  id canReorderItemHandler;
  void *v14;
  id willReorderHandler;
  void *v16;
  id didReorderHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UICollectionViewDiffableDataSourceReorderingHandlers;
  v11 = -[UICollectionViewDiffableDataSourceReorderingHandlers init](&v19, sel_init);
  if (v11)
  {
    v12 = _Block_copy(v8);
    canReorderItemHandler = v11->_canReorderItemHandler;
    v11->_canReorderItemHandler = v12;

    v14 = _Block_copy(v9);
    willReorderHandler = v11->_willReorderHandler;
    v11->_willReorderHandler = v14;

    v16 = _Block_copy(v10);
    didReorderHandler = v11->_didReorderHandler;
    v11->_didReorderHandler = v16;

  }
  return v11;
}

- (void)didReorderHandler
{
  return self->_didReorderHandler;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[UICollectionViewDiffableDataSourceReorderingHandlers canReorderItemHandler](self, "canReorderItemHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[UICollectionViewDiffableDataSourceReorderingHandlers willReorderHandler](self, "willReorderHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[UICollectionViewDiffableDataSourceReorderingHandlers didReorderHandler](self, "didReorderHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = (void *)objc_msgSend(v4, "initWithCanReorderItemHandler:willReorderItemHandler:didReorderItemHandler:", v6, v8, v10);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didReorderHandler, 0);
  objc_storeStrong(&self->_willReorderHandler, 0);
  objc_storeStrong(&self->_canReorderItemHandler, 0);
}

@end
