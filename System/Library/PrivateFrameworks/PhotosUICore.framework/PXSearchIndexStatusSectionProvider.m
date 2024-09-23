@implementation PXSearchIndexStatusSectionProvider

- (PXSearchIndexStatusSectionProvider)init
{
  PXSearchIndexStatusSectionProvider *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchIndexStatusSectionProvider;
  v2 = -[PXSearchIndexStatusSectionProvider init](&v6, sel_init);
  if (v2)
  {
    v2->identifier = sub_1A7ADF414();
    v2->_isAllowedToBeVisible = 1;
    +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addDeferredKeyObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_searchIndexStatusDidChange_, *MEMORY[0x1E0CD1DB8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeKeyObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXSearchIndexStatusSectionProvider;
  -[PXSearchIndexStatusSectionProvider dealloc](&v4, sel_dealloc);
}

- (void)setIsAllowedToBeVisible:(BOOL)a3
{
  id v4;

  if (self->_isAllowedToBeVisible != a3)
  {
    self->_isAllowedToBeVisible = a3;
    -[PXSearchIndexStatusSectionProvider changeObserver](self, "changeObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 0);

  }
}

- (void)searchIndexStatusDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1DB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Expected PHSearchIndexIndexingPausedKey in PHSearchIndexIndexingStatusDidChangeNotification", buf, 2u);
    }

  }
  v7 = objc_msgSend(v5, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1DC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Expected PHSearchIndexItemsRemainingKey in PHSearchIndexIndexingStatusDidChangeNotification", v12, 2u);
    }

  }
  v10 = objc_msgSend(v8, "unsignedIntegerValue");
  if ((_DWORD)v7 != -[PXSearchIndexStatusSectionProvider isIndexingPaused](self, "isIndexingPaused")
    || -[PXSearchIndexStatusSectionProvider itemsRemainingCount](self, "itemsRemainingCount") != v10)
  {
    -[PXSearchIndexStatusSectionProvider setIsIndexingPaused:](self, "setIsIndexingPaused:", v7);
    -[PXSearchIndexStatusSectionProvider setItemsRemainingCount:](self, "setItemsRemainingCount:", v10);
    -[PXSearchIndexStatusSectionProvider changeObserver](self, "changeObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 0);

  }
}

- (BOOL)showsIndexingFooter
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PXSearchIndexStatusSectionProvider isAllowedToBeVisible](self, "isAllowedToBeVisible");
  if (v3)
  {
    if (-[PXSearchIndexStatusSectionProvider isIndexingPaused](self, "isIndexingPaused")
      || -[PXSearchIndexStatusSectionProvider itemsRemainingCount](self, "itemsRemainingCount"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "forceIndexingFooter");

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (unint64_t)type
{
  return 1;
}

- (NSArray)sectionIdentifiers
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[PXSearchIndexStatusSectionProvider showsIndexingFooter](self, "showsIndexingFooter"))
  {
    v4[0] = CFSTR("IndexingStatusSection");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)cellReuseIdentifierForItemIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchIndexStatusSectionProvider.m"), 109, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)configureCell:(id)a3 forItemIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchIndexStatusSectionProvider.m"), 115, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)registerClassesForSupplementaryViewReuseIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = *MEMORY[0x1E0DC48A0];
  +[PXSearchIndexStatusFooter reuseIdentifier](PXSearchIndexStatusFooter, "reuseIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, uint64_t, id))a3 + 2))(v4, v5, v6, v7);

}

- (id)supplementaryViewReuseIdentifierForKind:(id)a3 indexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if ((id)*MEMORY[0x1E0DC48A0] != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchIndexStatusSectionProvider.m"), 128, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = v8;
  +[PXSearchIndexStatusFooter reuseIdentifier](PXSearchIndexStatusFooter, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)layoutForSectionIdentifier:(id)a3 environment:(id)a4 collectionViewLayoutMargins:(UIEdgeInsets)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PXSearchIndexStatusSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchIndexStatusSectionProvider.m"), 139, CFSTR("Failed to find sectionIdentifier: %@, in %@"), v7, self);

  }
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v10, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3350];
  v26[0] = v12;
  v24 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "horizontalGroupWithLayoutSize:subitems:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 44.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v18, *MEMORY[0x1E0DC48A0], 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBoundarySupplementaryItems:", v21);

  return v20;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  +[PXSearchSettings sharedInstance](PXSearchSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v10)
    goto LABEL_4;
  NSStringFromSelector(sel_forceIndexingFooter);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    -[PXSearchIndexStatusSectionProvider changeObserver](self, "changeObserver");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 0);
LABEL_4:

  }
}

- (PXSearchDataSourceSectionProviderChangeObserver)changeObserver
{
  return (PXSearchDataSourceSectionProviderChangeObserver *)objc_loadWeakRetained((id *)&self->changeObserver);
}

- (void)setChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->changeObserver, a3);
}

- (int64_t)identifier
{
  return self->identifier;
}

- (BOOL)isAllowedToBeVisible
{
  return self->_isAllowedToBeVisible;
}

- (BOOL)isIndexingPaused
{
  return self->_isIndexingPaused;
}

- (void)setIsIndexingPaused:(BOOL)a3
{
  self->_isIndexingPaused = a3;
}

- (unint64_t)itemsRemainingCount
{
  return self->_itemsRemainingCount;
}

- (void)setItemsRemainingCount:(unint64_t)a3
{
  self->_itemsRemainingCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->changeObserver);
}

@end
