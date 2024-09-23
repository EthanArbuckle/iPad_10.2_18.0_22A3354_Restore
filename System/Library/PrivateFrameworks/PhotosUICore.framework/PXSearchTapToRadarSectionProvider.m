@implementation PXSearchTapToRadarSectionProvider

- (PXSearchTapToRadarSectionProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTapToRadarSectionProvider.m"), 32, CFSTR("%s is not available as initializer"), "-[PXSearchTapToRadarSectionProvider init]");

  abort();
}

- (PXSearchTapToRadarSectionProvider)initWithDelegate:(id)a3
{
  id v4;
  PXSearchTapToRadarSectionProvider *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXSearchTapToRadarSectionProvider;
  v5 = -[PXSearchTapToRadarSectionProvider init](&v7, sel_init);
  if (v5)
  {
    v5->identifier = sub_1A7ADF414();
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (unint64_t)type
{
  return 1;
}

- (NSArray)sectionIdentifiers
{
  void *v2;
  int v3;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowInternalUI");

  if (v3)
    return (NSArray *)&unk_1E53EA230;
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTapToRadarSectionProvider.m"), 78, CFSTR("Code which should be unreachable has been reached"));

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
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTapToRadarSectionProvider.m"), 84, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)setShouldDisplayRadarDescriptionLabel:(BOOL)a3
{
  id v4;

  if (self->_shouldDisplayRadarDescriptionLabel != a3)
  {
    self->_shouldDisplayRadarDescriptionLabel = a3;
    -[PXSearchTapToRadarSectionProvider changeObserver](self, "changeObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchDataSourceSectionProviderDidChange:animateChanges:", self, 0);

  }
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
  +[PXSearchTapToRadarFooter reuseIdentifier](PXSearchTapToRadarFooter, "reuseIdentifier");
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
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTapToRadarSectionProvider.m"), 105, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = v8;
  +[PXSearchTapToRadarFooter reuseIdentifier](PXSearchTapToRadarFooter, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)configureSupplementaryView:(id)a3 kind:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(v8, "shouldDisplayRadarDescriptionLabel:", -[PXSearchTapToRadarSectionProvider shouldDisplayRadarDescriptionLabel](self, "shouldDisplayRadarDescriptionLabel"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PXSearchTapToRadarSectionProvider_configureSupplementaryView_kind_indexPath___block_invoke;
  v11[3] = &unk_1E5148D30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "setTapToRadarHandler:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

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
  -[PXSearchTapToRadarSectionProvider sectionIdentifiers](self, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTapToRadarSectionProvider.m"), 121, CFSTR("Failed to find sectionIdentifier: %@, in %@"), v7, self);

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

- (PXSearchTapToRadarSectionProviderDelegate)delegate
{
  return (PXSearchTapToRadarSectionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDisplayRadarDescriptionLabel
{
  return self->_shouldDisplayRadarDescriptionLabel;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->changeObserver);
}

void __79__PXSearchTapToRadarSectionProvider_configureSupplementaryView_kind_indexPath___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didSelectTapToRadar");

}

@end
