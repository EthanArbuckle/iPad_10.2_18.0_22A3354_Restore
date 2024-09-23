@implementation UICollectionViewDiffableDataSourceSectionSnapshotHandlers

- (void)setWillExpandItemHandler:(void *)willExpandItemHandler
{
  objc_setProperty_nonatomic_copy(self, a2, willExpandItemHandler, 16);
}

- (void)setWillCollapseItemHandler:(void *)willCollapseItemHandler
{
  objc_setProperty_nonatomic_copy(self, a2, willCollapseItemHandler, 32);
}

- (void)setShouldExpandItemHandler:(void *)shouldExpandItemHandler
{
  objc_setProperty_nonatomic_copy(self, a2, shouldExpandItemHandler, 8);
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
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[UICollectionViewDiffableDataSourceSectionSnapshotHandlers shouldExpandItemHandler](self, "shouldExpandItemHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v16, "copy");
  -[UICollectionViewDiffableDataSourceSectionSnapshotHandlers willExpandItemHandler](self, "willExpandItemHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[UICollectionViewDiffableDataSourceSectionSnapshotHandlers shouldCollapseItemHandler](self, "shouldCollapseItemHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[UICollectionViewDiffableDataSourceSectionSnapshotHandlers willCollapseItemHandler](self, "willCollapseItemHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[UICollectionViewDiffableDataSourceSectionSnapshotHandlers snapshotForExpandingParentItemHandler](self, "snapshotForExpandingParentItemHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  v14 = (void *)objc_msgSend(v4, "initWithShouldExpandItemHandler:willExpandItemHandler:shouldCollapseItemHandler:willCollapseItemHandler:snapshotForExpandingParentItemHandler:", v5, v7, v9, v11, v13);

  return v14;
}

- (void)willExpandItemHandler
{
  return self->_willExpandItemHandler;
}

- (void)willCollapseItemHandler
{
  return self->_willCollapseItemHandler;
}

- (void)snapshotForExpandingParentItemHandler
{
  return self->_snapshotForExpandingParentItemHandler;
}

- (void)shouldExpandItemHandler
{
  return self->_shouldExpandItemHandler;
}

- (void)shouldCollapseItemHandler
{
  return self->_shouldCollapseItemHandler;
}

- (UICollectionViewDiffableDataSourceSectionSnapshotHandlers)initWithShouldExpandItemHandler:(id)a3 willExpandItemHandler:(id)a4 shouldCollapseItemHandler:(id)a5 willCollapseItemHandler:(id)a6 snapshotForExpandingParentItemHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UICollectionViewDiffableDataSourceSectionSnapshotHandlers *v17;
  void *v18;
  id shouldExpandItemHandler;
  void *v20;
  id willExpandItemHandler;
  void *v22;
  id shouldCollapseItemHandler;
  void *v24;
  id willCollapseItemHandler;
  void *v26;
  id snapshotForExpandingParentItemHandler;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers;
  v17 = -[UICollectionViewDiffableDataSourceSectionSnapshotHandlers init](&v29, sel_init);
  if (v17)
  {
    v18 = _Block_copy(v12);
    shouldExpandItemHandler = v17->_shouldExpandItemHandler;
    v17->_shouldExpandItemHandler = v18;

    v20 = _Block_copy(v13);
    willExpandItemHandler = v17->_willExpandItemHandler;
    v17->_willExpandItemHandler = v20;

    v22 = _Block_copy(v14);
    shouldCollapseItemHandler = v17->_shouldCollapseItemHandler;
    v17->_shouldCollapseItemHandler = v22;

    v24 = _Block_copy(v15);
    willCollapseItemHandler = v17->_willCollapseItemHandler;
    v17->_willCollapseItemHandler = v24;

    v26 = _Block_copy(v16);
    snapshotForExpandingParentItemHandler = v17->_snapshotForExpandingParentItemHandler;
    v17->_snapshotForExpandingParentItemHandler = v26;

  }
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_snapshotForExpandingParentItemHandler, 0);
  objc_storeStrong(&self->_willCollapseItemHandler, 0);
  objc_storeStrong(&self->_shouldCollapseItemHandler, 0);
  objc_storeStrong(&self->_willExpandItemHandler, 0);
  objc_storeStrong(&self->_shouldExpandItemHandler, 0);
}

- (void)setShouldCollapseItemHandler:(void *)shouldCollapseItemHandler
{
  objc_setProperty_nonatomic_copy(self, a2, shouldCollapseItemHandler, 24);
}

- (void)setSnapshotForExpandingParentItemHandler:(void *)snapshotForExpandingParentItemHandler
{
  objc_setProperty_nonatomic_copy(self, a2, snapshotForExpandingParentItemHandler, 40);
}

@end
