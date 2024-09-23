@implementation UITableViewDiffableDataSource

- (UITableViewDiffableDataSource)initWithTableView:(UITableView *)tableView cellProvider:(UITableViewDiffableDataSourceCellProvider)cellProvider
{
  UITableView *v6;
  UITableViewDiffableDataSourceCellProvider v7;
  UITableViewDiffableDataSource *v8;
  __UIDiffableDataSource *v9;
  __UIDiffableDataSource *impl;
  objc_super v12;

  v6 = tableView;
  v7 = cellProvider;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewDiffableDataSource;
  v8 = -[UITableViewDiffableDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = -[__UIDiffableDataSource initWithTableView:cellProvider:]([__UIDiffableDataSource alloc], "initWithTableView:cellProvider:", v6, v7);
    impl = v8->_impl;
    v8->_impl = v9;

    -[UITableView setDataSource:](v6, "setDataSource:", v8);
  }

  return v8;
}

- (NSString)description
{
  return -[__UIDiffableDataSource description](self->_impl, "description");
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)off_1E1679A30);
  -[__UIDiffableDataSource snapshot](self->_impl, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithImpl:", v4);

  return (NSDiffableDataSourceSnapshot *)v5;
}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences
{
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](self, "applySnapshot:animatingDifferences:completion:", snapshot, animatingDifferences, 0);
}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion
{
  _BOOL8 v5;
  __UIDiffableDataSource *impl;
  void *v8;
  id v9;

  v5 = animatingDifferences;
  impl = self->_impl;
  v8 = completion;
  -[NSDiffableDataSourceSnapshot impl](snapshot, "impl");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:animatingDifferences:completion:](impl, "applyDifferencesFromSnapshot:animatingDifferences:completion:", v9, v5, v8);

}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot
{
  -[UITableViewDiffableDataSource applySnapshotUsingReloadData:completion:](self, "applySnapshotUsingReloadData:completion:", snapshot, 0);
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot completion:(void *)completion
{
  __UIDiffableDataSource *impl;
  void *v6;
  id v7;

  impl = self->_impl;
  v6 = completion;
  -[NSDiffableDataSourceSnapshot impl](snapshot, "impl");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource reloadFromSnapshot:completion:](impl, "reloadFromSnapshot:completion:", v7, v6);

}

- (UITableViewRowAnimation)defaultRowAnimation
{
  return -[__UIDiffableDataSource tableViewDefaultRowAnimation](self->_impl, "tableViewDefaultRowAnimation");
}

- (void)setDefaultRowAnimation:(UITableViewRowAnimation)defaultRowAnimation
{
  -[__UIDiffableDataSource setTableViewDefaultRowAnimation:](self->_impl, "setTableViewDefaultRowAnimation:", defaultRowAnimation);
}

- (id)sectionIdentifierForIndex:(NSInteger)index
{
  return -[__UIDiffableDataSource sectionIdentifierForIndex:](self->_impl, "sectionIdentifierForIndex:", index);
}

- (NSInteger)indexForSectionIdentifier:(id)identifier
{
  return -[__UIDiffableDataSource indexForSectionIdentifier:](self->_impl, "indexForSectionIdentifier:", identifier);
}

- (id)itemIdentifierForIndexPath:(NSIndexPath *)indexPath
{
  return -[__UIDiffableDataSource itemIdentifierForIndexPath:](self->_impl, "itemIdentifierForIndexPath:", indexPath);
}

- (NSIndexPath)indexPathForItemIdentifier:(id)identifier
{
  return (NSIndexPath *)-[__UIDiffableDataSource indexPathForItemIdentifier:](self->_impl, "indexPathForItemIdentifier:", identifier);
}

- (UITableViewDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4;
  UITableViewDiffableDataSource *v5;
  __UIDiffableDataSource *v6;
  __UIDiffableDataSource *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITableViewDiffableDataSource;
  v5 = -[UITableViewDiffableDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = -[__UIDiffableDataSource initWithViewUpdatesSink:]([__UIDiffableDataSource alloc], "initWithViewUpdatesSink:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[__UIDiffableDataSource numberOfSections](self->_impl, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  __UIDiffableDataSource *impl;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v13;

  if (-[__UIDiffableDataSource numberOfSections](self->_impl, "numberOfSections", a3) <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSource.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < _impl.numberOfSections"));

  }
  impl = self->_impl;
  -[__UIDiffableDataSource state](impl, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[__UIDiffableDataSource numberOfItemsInSection:](impl, "numberOfItemsInSection:", v10);

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSource.m"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[__UIDiffableDataSource _cellForRowAtIndexPath:tableView:](self->_impl, "_cellForRowAtIndexPath:tableView:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_isDiffableDataSource
{
  return 1;
}

- (id)_diffableDataSourceImpl
{
  return self->_impl;
}

- (BOOL)_subclassOverridesMethodWithSelector:(SEL)a3
{
  objc_class *v4;
  objc_class *v5;
  IMP MethodImplementation;
  IMP v7;
  BOOL v8;

  v4 = (objc_class *)objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v4, a3);
  v7 = class_getMethodImplementation(v5, a3);
  if (MethodImplementation)
    v8 = v7 == 0;
  else
    v8 = 1;
  return !v8 && MethodImplementation != v7;
}

- (__UIDiffableDataSource)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)validateIdentifiers
{
  void *v2;
  void *v3;
  id v4;

  -[__UIDiffableDataSource state](self->_impl, "state");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "validateIdentifiers");
  }
  else
  {
    objc_msgSend(v4, "sections");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();

    objc_msgSend(v4, "identifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();

  }
}

@end
