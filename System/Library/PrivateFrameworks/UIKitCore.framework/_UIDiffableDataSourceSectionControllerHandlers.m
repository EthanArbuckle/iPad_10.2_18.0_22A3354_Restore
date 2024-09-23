@implementation _UIDiffableDataSourceSectionControllerHandlers

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
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

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[_UIDiffableDataSourceSectionControllerHandlers shouldExpandItemHandler](self, "shouldExpandItemHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setShouldExpandItemHandler:", v6);

  -[_UIDiffableDataSourceSectionControllerHandlers willExpandItemHandler](self, "willExpandItemHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setWillExpandItemHandler:", v8);

  -[_UIDiffableDataSourceSectionControllerHandlers shouldCollapseItemHandler](self, "shouldCollapseItemHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setShouldCollapseItemHandler:", v10);

  -[_UIDiffableDataSourceSectionControllerHandlers willCollapseItemHandler](self, "willCollapseItemHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setWillCollapseItemHandler:", v12);

  -[_UIDiffableDataSourceSectionControllerHandlers childSnapshotForExpandingParentHandler](self, "childSnapshotForExpandingParentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setChildSnapshotForExpandingParentHandler:", v14);

  return v4;
}

- (void)setWillExpandItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setWillCollapseItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setShouldExpandItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setShouldCollapseItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)willExpandItemHandler
{
  return self->_willExpandItemHandler;
}

- (id)willCollapseItemHandler
{
  return self->_willCollapseItemHandler;
}

- (id)shouldExpandItemHandler
{
  return self->_shouldExpandItemHandler;
}

- (id)shouldCollapseItemHandler
{
  return self->_shouldCollapseItemHandler;
}

- (void)setChildSnapshotForExpandingParentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)childSnapshotForExpandingParentHandler
{
  return self->_childSnapshotForExpandingParentHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_childSnapshotForExpandingParentHandler, 0);
  objc_storeStrong(&self->_willCollapseItemHandler, 0);
  objc_storeStrong(&self->_shouldCollapseItemHandler, 0);
  objc_storeStrong(&self->_willExpandItemHandler, 0);
  objc_storeStrong(&self->_shouldExpandItemHandler, 0);
}

@end
