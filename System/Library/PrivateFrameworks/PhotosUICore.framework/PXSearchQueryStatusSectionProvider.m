@implementation PXSearchQueryStatusSectionProvider

- (PXSearchQueryStatusSectionProvider)init
{
  PXSearchQueryStatusSectionProvider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSearchQueryStatusSectionProvider;
  v2 = -[PXSearchQueryStatusSectionProvider init](&v4, sel_init);
  if (v2)
    v2->identifier = sub_1A7ADF414();
  return v2;
}

- (void)setSearchQuery:(id)a3 queryResult:(id)a4
{
  PXSearchQueryResult *v7;
  PXSearchQueryResult **p_searchQueryResult;
  void *v9;
  PXSearchQuery *v10;

  v10 = (PXSearchQuery *)a3;
  v7 = (PXSearchQueryResult *)a4;
  if (self->_searchQuery != v10)
  {
    objc_storeStrong((id *)&self->_searchQuery, a3);
    p_searchQueryResult = &self->_searchQueryResult;
    if (self->_searchQueryResult == v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  p_searchQueryResult = &self->_searchQueryResult;
  if (self->_searchQueryResult != v7)
  {
LABEL_5:
    objc_storeStrong((id *)p_searchQueryResult, a4);
LABEL_6:
    -[PXSearchQueryStatusSectionProvider changeObserver](self, "changeObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 0);

  }
}

- (BOOL)_showsQueryStatusFooter
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PXSearchQueryStatusSectionProvider searchQuery](self, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXSearchQueryStatusSectionProvider searchQuery](self, "searchQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[PXSearchQueryStatusSectionProvider searchQueryResult](self, "searchQueryResult");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "count") == 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)type
{
  return 1;
}

- (NSArray)sectionIdentifiers
{
  if (-[PXSearchQueryStatusSectionProvider _showsQueryStatusFooter](self, "_showsQueryStatusFooter"))
    return (NSArray *)&unk_1E53E9990;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryStatusSectionProvider.m"), 94, CFSTR("Code which should be unreachable has been reached"));

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
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryStatusSectionProvider.m"), 100, CFSTR("Code which should be unreachable has been reached"));

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
  +[PXSearchQueryStatusFooter reuseIdentifier](PXSearchQueryStatusFooter, "reuseIdentifier");
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryStatusSectionProvider.m"), 113, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = v8;
  +[PXSearchQueryStatusFooter reuseIdentifier](PXSearchQueryStatusFooter, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)configureSupplementaryView:(id)a3 kind:(id)a4 indexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19 = v9;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryStatusSectionProvider.m"), 117, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("view"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryStatusSectionProvider.m"), 117, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("view"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:

  -[PXSearchQueryStatusSectionProvider searchQuery](self, "searchQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedQueryString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSearchText:", v13);

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
  -[PXSearchQueryStatusSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryStatusSectionProvider.m"), 125, CFSTR("Failed to find sectionIdentifier: %@, in %@"), v7, self);

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

- (PXSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (PXSearchQueryResult)searchQueryResult
{
  return self->_searchQueryResult;
}

- (void)setSearchQueryResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueryResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryResult, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_destroyWeak((id *)&self->changeObserver);
}

@end
