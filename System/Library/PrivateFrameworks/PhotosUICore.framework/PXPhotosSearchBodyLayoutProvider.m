@implementation PXPhotosSearchBodyLayoutProvider

- (PXPhotosSearchBodyLayoutProvider)initWithCollectionSectionProvider:(id)a3
{
  id v5;
  PXPhotosSearchBodyLayoutProvider *v6;
  PXPhotosSearchBodyLayoutProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosSearchBodyLayoutProvider;
  v6 = -[PXPhotosSearchBodyLayoutProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_collectionSectionProvider, a3);

  return v7;
}

- (PXPhotosSearchBodyLayoutProvider)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPhotosSearchBodyLayoutProvider *v5;
  PXPhotosSearchCollectionSectionProvider *v6;
  id collectionSectionProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosSearchBodyLayoutProvider;
  v5 = -[PXPhotosSearchBodyLayoutProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PXPhotosSearchCollectionSectionProvider initWithPhotoLibrary:]([PXPhotosSearchCollectionSectionProvider alloc], "initWithPhotoLibrary:", v4);
    collectionSectionProvider = v5->_collectionSectionProvider;
    v5->_collectionSectionProvider = v6;

  }
  return v5;
}

- (void)setViewModel:(id)a3
{
  PXPhotosViewModel *v5;
  PXPhotosViewModel *viewModel;
  PXPhotosViewModel *v7;

  v5 = (PXPhotosViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXPhotosViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, PXSelectionManagerObservationContext_82409);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXPhotosViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, PXSelectionManagerObservationContext_82409);
    v5 = v7;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v6 = a4;
  v8 = a3;
  if ((v6 & 2) != 0 && (void *)PXSelectionManagerObservationContext_82409 == a5)
  {
    v13 = v8;
    -[PXPhotosSearchBodyLayoutProvider viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectionSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAnyItemSelected");

    v8 = v13;
    if (v11)
    {
      -[PXPhotosSearchBodyLayoutProvider collectionsSelection](self, "collectionsSelection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clearPhotosSelection");

      v8 = v13;
    }
  }

}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v10;
  __int128 v11;
  void *v12;
  void *v13;
  int v14;
  _PXPhotosSearchBodyCollectionSectionLayout *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  _OWORD v26[2];

  v10 = a4;
  v11 = *(_OWORD *)&a5->item;
  v26[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v26[1] = v11;
  objc_msgSend(v10, "assetCollectionAtSectionIndexPath:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSearchBodyLayoutProvider.m"), 135, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[dataSource assetCollectionAtSectionIndexPath:sectionIndexPath]"), v23, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSearchBodyLayoutProvider.m"), 135, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[dataSource assetCollectionAtSectionIndexPath:sectionIndexPath]"), v23);
  }

LABEL_3:
  objc_msgSend(v12, "transientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SearchCollectionsSection"));

  if (v14)
  {
    v15 = objc_alloc_init(_PXPhotosSearchBodyCollectionSectionLayout);
    -[PXPhotosSearchBodyLayoutProvider collectionSectionProvider](self, "collectionSectionProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSearchBodyLayoutProvider hostViewController](self, "hostViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXPhotosSearchBodyCollectionSectionLayout containerInfo](v15, "containerInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPhotosSearchResultsCollectionsViewFactory createViewWithCollectionSectionProvider:hostViewController:containerInfo:viewDelegate:selectionDelegate:](PXPhotosSearchResultsCollectionsViewFactory, "createViewWithCollectionSectionProvider:hostViewController:containerInfo:viewDelegate:selectionDelegate:", v16, v17, v18, v15, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXGSingleViewLayout setContentView:](v15, "setContentView:", v19);
    -[PXPhotosSearchBodyLayoutProvider setCollectionsSelection:](self, "setCollectionsSelection:", v19);

  }
  else
  {
    v15 = objc_alloc_init(PXGGridLayout);
    -[_PXPhotosSearchBodyCollectionSectionLayout setMediaKind:](v15, "setMediaKind:", 2);
    -[_PXPhotosSearchBodyCollectionSectionLayout setPresentationType:](v15, "setPresentationType:", 0);
    -[_PXPhotosSearchBodyCollectionSectionLayout setLazy:](v15, "setLazy:", 1);
    -[_PXPhotosSearchBodyCollectionSectionLayout setNumberOfItems:](v15, "setNumberOfItems:", objc_msgSend(v10, "numberOfItemsInSection:", a5->section));
  }

  return v15;
}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  _OWORD v49[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v10, "sectionIndexPath");
  else
    memset(v49, 0, sizeof(v49));
  objc_msgSend(v12, "assetCollectionAtSectionIndexPath:", v49);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSearchBodyLayoutProvider.m"), 158, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[assetsSectionLayout.dataSource assetCollectionAtSectionIndexPath:assetsSectionLayout.sectionIndexPath]"), v46, v48);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSearchBodyLayoutProvider.m"), 158, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[assetsSectionLayout.dataSource assetCollectionAtSectionIndexPath:assetsSectionLayout.sectionIndexPath]"), v46);
  }

LABEL_6:
  objc_msgSend(v10, "setRemovesContentLayoutWhenEmpty:", 1);
  objc_msgSend(v10, "setRemovesHeaderLayoutWhenEmpty:", 1);
  objc_msgSend(v13, "transientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("SearchCollectionsSection"));

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v9, "setContentSource:", v10);
    objc_msgSend(v11, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "aspectFitContent");

    v18 = v9;
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "showSearchDebugBadges");

    if (v20)
    {
      objc_msgSend(v18, "decoratingLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addActiveDecorations:", &unk_1E53E93C0);

    }
    objc_msgSend(v18, "setDelegate:", v10);
    objc_msgSend(v10, "spec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "sizeClass");

    objc_msgSend(v10, "spec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "layoutOrientation");

    v26 = 9;
    v27 = 13;
    if (v25 != 2)
    {
      v27 = 9;
      v26 = 5;
    }
    if (v23 == 2)
      v28 = v27;
    else
      v28 = v26;
    objc_msgSend(v18, "setNumberOfColumns:", v28);
    objc_msgSend(v10, "spec");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "extendedTraitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceStyle");

    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31 == 2)
    {
      objc_msgSend(v32, "darkModeInteritemSpacing");
      v35 = v34;

      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "darkModeCornerRadius");
    }
    else
    {
      objc_msgSend(v32, "interitemSpacing");
      v35 = v38;

      +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "cornerRadius");
    }
    v39 = v37;

    objc_msgSend(v18, "setInterItemSpacing:", v35, v35);
    *(float *)&v40 = v39;
    LODWORD(v41) = LODWORD(v40);
    LODWORD(v42) = LODWORD(v40);
    LODWORD(v43) = LODWORD(v40);
    objc_msgSend(v18, "setItemCornerRadius:", v40, v41, v42, v43);
    objc_msgSend(v18, "setContentMode:", v17);

  }
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (void)clearAssetSelections
{
  void *v2;
  id v3;

  -[PXPhotosSearchBodyLayoutProvider viewModel](self, "viewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_82385);

}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->invalidationDelegate, a3);
}

- (id)collectionSectionProvider
{
  return self->_collectionSectionProvider;
}

- (UIViewController)hostViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosSelectionContainer)collectionsSelection
{
  return (PXPhotosSelectionContainer *)objc_loadWeakRetained((id *)&self->_collectionsSelection);
}

- (void)setCollectionsSelection:(id)a3
{
  objc_storeWeak((id *)&self->_collectionsSelection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionsSelection);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong(&self->_collectionSectionProvider, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
}

uint64_t __56__PXPhotosSearchBodyLayoutProvider_clearAssetSelections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

@end
