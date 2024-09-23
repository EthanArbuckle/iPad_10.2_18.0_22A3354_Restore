@implementation _UIDiffableDataSource

- (_UIDiffableDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDiffableDataSource_OldSPI.m"), 31, CFSTR("This class cannot be constructed directly. Please use the concrete subclasses."));

  return 0;
}

- (_UIDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4;
  _UIDiffableDataSource *v5;
  __UIDiffableDataSource *v6;
  __UIDiffableDataSource *dsImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDiffableDataSource;
  v5 = -[_UIDiffableDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = -[__UIDiffableDataSource initWithViewUpdatesSink:]([__UIDiffableDataSource alloc], "initWithViewUpdatesSink:", v4);
    dsImpl = v5->_dsImpl;
    v5->_dsImpl = v6;

  }
  return v5;
}

- (_UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6;
  id v7;
  _UIDiffableDataSource *v8;
  __UIDiffableDataSource *v9;
  __UIDiffableDataSource *dsImpl;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDiffableDataSource;
  v8 = -[_UIDiffableDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = -[__UIDiffableDataSource initWithCollectionView:cellProvider:]([__UIDiffableDataSource alloc], "initWithCollectionView:cellProvider:", v6, v7);
    dsImpl = v8->_dsImpl;
    v8->_dsImpl = v9;

  }
  return v8;
}

- (_UIDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIDiffableDataSource *v11;
  __UIDiffableDataSource *v12;
  __UIDiffableDataSource *dsImpl;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIDiffableDataSource;
  v11 = -[_UIDiffableDataSource init](&v15, sel_init);
  if (v11)
  {
    v12 = -[__UIDiffableDataSource initWithCollectionView:reuseIdentifierProvider:cellConfigurationHandler:]([__UIDiffableDataSource alloc], "initWithCollectionView:reuseIdentifierProvider:cellConfigurationHandler:", v8, v9, v10);
    dsImpl = v11->_dsImpl;
    v11->_dsImpl = v12;

  }
  return v11;
}

- (_UIDiffableDataSource)initWithDiffableDataSource:(id)a3
{
  id v5;
  _UIDiffableDataSource *v6;
  _UIDiffableDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDiffableDataSource;
  v6 = -[_UIDiffableDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dsImpl, a3);

  return v7;
}

- (id)dsImpl
{
  return self->_dsImpl;
}

- (id)_impl
{
  return self->_dsImpl;
}

- (_UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  id v6;
  id v7;
  _UIDiffableDataSource *v8;
  __UIDiffableDataSource *v9;
  __UIDiffableDataSource *dsImpl;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDiffableDataSource;
  v8 = -[_UIDiffableDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = -[__UIDiffableDataSource initWithTableView:cellProvider:]([__UIDiffableDataSource alloc], "initWithTableView:cellProvider:", v6, v7);
    dsImpl = v8->_dsImpl;
    v8->_dsImpl = v9;

  }
  return v8;
}

- (_UIDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIDiffableDataSource *v11;
  __UIDiffableDataSource *v12;
  __UIDiffableDataSource *dsImpl;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIDiffableDataSource;
  v11 = -[_UIDiffableDataSource init](&v15, sel_init);
  if (v11)
  {
    v12 = -[__UIDiffableDataSource initWithTableView:reuseIdentifierProvider:cellConfigurationHandler:]([__UIDiffableDataSource alloc], "initWithTableView:reuseIdentifierProvider:cellConfigurationHandler:", v8, v9, v10);
    dsImpl = v11->_dsImpl;
    v11->_dsImpl = v12;

  }
  return v11;
}

- (int64_t)defaultRowAnimation
{
  return -[__UIDiffableDataSource tableViewDefaultRowAnimation](self->_dsImpl, "tableViewDefaultRowAnimation");
}

- (void)setDefaultRowAnimation:(int64_t)a3
{
  -[__UIDiffableDataSource setTableViewDefaultRowAnimation:](self->_dsImpl, "setTableViewDefaultRowAnimation:", a3);
}

- (int64_t)numberOfItems
{
  return -[__UIDiffableDataSource numberOfItems](self->_dsImpl, "numberOfItems");
}

- (int64_t)numberOfSections
{
  return -[__UIDiffableDataSource numberOfSections](self->_dsImpl, "numberOfSections");
}

- (NSArray)sectionIdentifiers
{
  return -[__UIDiffableDataSource sectionIdentifiers](self->_dsImpl, "sectionIdentifiers");
}

- (NSArray)itemIdentifiers
{
  return -[__UIDiffableDataSource itemIdentifiers](self->_dsImpl, "itemIdentifiers");
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  return -[__UIDiffableDataSource numberOfItemsInSection:](self->_dsImpl, "numberOfItemsInSection:", a3);
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return -[__UIDiffableDataSource itemIdentifiersInSectionWithIdentifier:](self->_dsImpl, "itemIdentifiersInSectionWithIdentifier:", a3);
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  return -[__UIDiffableDataSource sectionIdentifierForSectionContainingItemIdentifier:](self->_dsImpl, "sectionIdentifierForSectionContainingItemIdentifier:", a3);
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  return -[__UIDiffableDataSource indexOfItemIdentifier:](self->_dsImpl, "indexOfItemIdentifier:", a3);
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return -[__UIDiffableDataSource indexOfSectionIdentifier:](self->_dsImpl, "indexOfSectionIdentifier:", a3);
}

- (void)appendItemsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource appendItemsWithIdentifiers:](self->_dsImpl, "appendItemsWithIdentifiers:", a3);
}

- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource appendItemsWithIdentifiers:intoSectionWithIdentifier:](self->_dsImpl, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", a3, a4);
}

- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource insertItemsWithIdentifiers:beforeItemWithIdentifier:](self->_dsImpl, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", a3, a4);
}

- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource insertItemsWithIdentifiers:afterItemWithIdentifier:](self->_dsImpl, "insertItemsWithIdentifiers:afterItemWithIdentifier:", a3, a4);
}

- (void)deleteItemsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource deleteItemsWithIdentifiers:](self->_dsImpl, "deleteItemsWithIdentifiers:", a3);
}

- (void)deleteAllItems
{
  -[__UIDiffableDataSource deleteAllItems](self->_dsImpl, "deleteAllItems");
}

- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource moveItemWithIdentifier:beforeItemWithIdentifier:](self->_dsImpl, "moveItemWithIdentifier:beforeItemWithIdentifier:", a3, a4);
}

- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource moveItemWithIdentifier:afterItemWithIdentifier:](self->_dsImpl, "moveItemWithIdentifier:afterItemWithIdentifier:", a3, a4);
}

- (void)reloadItemsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource reloadItemsWithIdentifiers:](self->_dsImpl, "reloadItemsWithIdentifiers:", a3);
}

- (void)appendSectionsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource appendSectionsWithIdentifiers:](self->_dsImpl, "appendSectionsWithIdentifiers:", a3);
}

- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource insertSectionsWithIdentifiers:beforeSectionWithIdentifier:](self->_dsImpl, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", a3, a4);
}

- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource insertSectionsWithIdentifiers:afterSectionWithIdentifier:](self->_dsImpl, "insertSectionsWithIdentifiers:afterSectionWithIdentifier:", a3, a4);
}

- (void)deleteSectionsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource deleteSectionsWithIdentifiers:](self->_dsImpl, "deleteSectionsWithIdentifiers:", a3);
}

- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource moveSectionWithIdentifier:beforeSectionWithIdentifier:](self->_dsImpl, "moveSectionWithIdentifier:beforeSectionWithIdentifier:", a3, a4);
}

- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource moveSectionWithIdentifier:afterSectionWithIdentifier:](self->_dsImpl, "moveSectionWithIdentifier:afterSectionWithIdentifier:", a3, a4);
}

- (void)reloadSectionsWithIdentifiers:(id)a3
{
  -[__UIDiffableDataSource reloadSectionsWithIdentifiers:](self->_dsImpl, "reloadSectionsWithIdentifiers:", a3);
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  return -[__UIDiffableDataSource itemIdentifierForIndexPath:](self->_dsImpl, "itemIdentifierForIndexPath:", a3);
}

- (id)indexPathForItemIdentifier:(id)a3
{
  return -[__UIDiffableDataSource indexPathForItemIdentifier:](self->_dsImpl, "indexPathForItemIdentifier:", a3);
}

- (id)snapshot
{
  void *v2;
  _UIDiffableDataSourceSnapshot *v3;

  -[__UIDiffableDataSource snapshot](self->_dsImpl, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_UIDiffableDataSource initWithDiffableDataSource:]([_UIDiffableDataSourceSnapshot alloc], "initWithDiffableDataSource:", v2);

  return v3;
}

- (id)emptySnapshot
{
  void *v2;
  _UIDiffableDataSourceSnapshot *v3;

  -[__UIDiffableDataSource emptySnapshot](self->_dsImpl, "emptySnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_UIDiffableDataSource initWithDiffableDataSource:]([_UIDiffableDataSourceSnapshot alloc], "initWithDiffableDataSource:", v2);

  return v3;
}

- (void)applyDifferencesFromSnapshot:(id)a3
{
  __UIDiffableDataSource *dsImpl;
  id v4;

  dsImpl = self->_dsImpl;
  objc_msgSend(a3, "dsImpl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:](dsImpl, "applyDifferencesFromSnapshot:", v4);

}

- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4
{
  __UIDiffableDataSource *dsImpl;
  id v6;
  id v7;

  dsImpl = self->_dsImpl;
  v6 = a4;
  objc_msgSend(a3, "dsImpl");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:animatingDifferences:completion:](dsImpl, "applyDifferencesFromSnapshot:animatingDifferences:completion:", v7, 1, v6);

}

- (void)reloadFromSnapshot:(id)a3
{
  __UIDiffableDataSource *dsImpl;
  id v4;

  dsImpl = self->_dsImpl;
  objc_msgSend(a3, "dsImpl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource reloadFromSnapshot:](dsImpl, "reloadFromSnapshot:", v4);

}

- (void)reloadFromSnapshot:(id)a3 completion:(id)a4
{
  __UIDiffableDataSource *dsImpl;
  id v6;
  id v7;

  dsImpl = self->_dsImpl;
  v6 = a4;
  objc_msgSend(a3, "dsImpl");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[__UIDiffableDataSource applyDifferencesFromSnapshot:animatingDifferences:completion:](dsImpl, "applyDifferencesFromSnapshot:animatingDifferences:completion:", v7, 0, v6);

}

- (void)appendSectionWithIdentifier:(id)a3
{
  -[__UIDiffableDataSource appendSectionWithIdentifier:](self->_dsImpl, "appendSectionWithIdentifier:", a3);
}

- (void)applySnapshot:(id)a3
{
  -[__UIDiffableDataSource reloadFromSnapshot:](self->_dsImpl, "reloadFromSnapshot:", a3);
}

- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource insertSectionWithIdentifier:beforeSectionWithIdentifier:](self->_dsImpl, "insertSectionWithIdentifier:beforeSectionWithIdentifier:", a3, a4);
}

- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  -[__UIDiffableDataSource insertSectionWithIdentifier:afterSectionWithIdentifier:](self->_dsImpl, "insertSectionWithIdentifier:afterSectionWithIdentifier:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsImpl, 0);
}

@end
