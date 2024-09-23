@implementation PXContentSyndicationGadgetProvider

- (PXContentSyndicationGadgetProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadgetProvider.m"), 41, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationGadgetProvider init]");

  abort();
}

- (PXContentSyndicationGadgetProvider)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadgetProvider.m"), 45, CFSTR("%s is not available as initializer"), "-[PXContentSyndicationGadgetProvider initWithIdentifier:]");

  abort();
}

- (PXContentSyndicationGadgetProvider)initWithDataSourceManager:(id)a3
{
  id v5;
  PXContentSyndicationGadgetProvider *v6;
  PXContentSyndicationGadgetProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationGadgetProvider;
  v6 = -[PXGadgetProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    -[PXCollectionsDataSourceManager registerChangeObserver:context:](v7->_dataSourceManager, "registerChangeObserver:context:", v7, PXDataSourceManagerObservationContext_267907);
  }

  return v7;
}

- (unint64_t)estimatedNumberOfGadgets
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PXContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", 0);

  return v4;
}

- (void)generateGadgets
{
  void *v3;
  id v4;

  self->_didGenerateGadgets = 1;
  -[PXContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationGadgetProvider _setDataSource:changeDetails:](self, "_setDataSource:changeDetails:", v3, 0);

}

- (id)_gadgetForAssetReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint8_t buf[16];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGadgetProvider gadgets](self, "gadgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    -[PXAssetsDataSourceManager dataSource](self->_oneUpDataSourceManager, "dataSource");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    *(_OWORD *)buf = 0u;
    v28 = 0u;
    if (v8)
    {
      -[NSObject indexPathForAssetReference:](v8, "indexPathForAssetReference:", v4);
      v10 = *(_QWORD *)buf;
    }
    else
    {
      v10 = 0;
    }
    if (v10 == *(_QWORD *)off_1E50B7E98)
    {
      PLSyndicationUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "asset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v16;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to look up gadget for asset: %{public}@ - Not found in 1up data source.", (uint8_t *)&v21, 0xCu);

      }
    }
    else
    {
      v17 = *(_QWORD *)&buf[8];
      if (*(_QWORD *)&buf[8] < v7)
      {
LABEL_15:
        objc_msgSend(v5, "objectAtIndexedSubscript:", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      PLSyndicationUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "asset");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v19;
        v23 = 2048;
        v24 = v17;
        v25 = 2048;
        v26 = v7;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to look up gadget for asset: %{public}@ - Index path section: %tu is out of bounds: %tu", (uint8_t *)&v21, 0x20u);

      }
    }

    v17 = 0;
    goto LABEL_15;
  }
  PLSyndicationUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Failed to look up gadget for asset: %{public}@ - No gadgets.", buf, 0xCu);

  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return self->_oneUpDataSourceManager;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return -[PXContentSyndicationDataSourceManager imageProvider](self->_dataSourceManager, "imageProvider", a3);
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 16;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  return self->_oneUpInitialAssetReference;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  void *v4;
  void *v5;

  -[PXContentSyndicationGadgetProvider _gadgetForAssetReference:](self, "_gadgetForAssetReference:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionOfInterestForOneUpTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  CGRect v8;

  -[PXContentSyndicationGadgetProvider _gadgetForAssetReference:](self, "_gadgetForAssetReference:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v7, "visibleContentRect"), CGRectIsEmpty(v8)))
  {
    -[PXGadgetProvider nextGadgetResponder](self, "nextGadgetResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootNavigationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "navigateToGadgetInHorizontalGadget:animated:", v7, 0);
  }

}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        -[PXContentSyndicationGadgetProvider _gadgetForAssetReference:](self, "_gadgetForAssetReference:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PXGadgetProvider gadgets](self, "gadgets", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17), "setContentViewHiddenForOneUpTransition:", objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17)));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3
{
  return 1;
}

- (void)contentSyndicationGadget:(id)a3 presentOneUpAnimated:(BOOL)a4 asset:(id)a5
{
  id v9;
  id v10;
  PXAssetsDataSourceManager *v11;
  PXAssetsDataSourceManager *oneUpDataSourceManager;
  void *v13;
  PXAssetReference *oneUpInitialAssetReference;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  PXAssetReference *v19;
  PXAssetReference *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  BOOL v33;
  _QWORD v34[2];
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadgetProvider.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PXContentSyndicationDataSourceManager createAssetsDataSourceManager](self->_dataSourceManager, "createAssetsDataSourceManager");
  v11 = (PXAssetsDataSourceManager *)objc_claimAutoreleasedReturnValue();
  oneUpDataSourceManager = self->_oneUpDataSourceManager;
  self->_oneUpDataSourceManager = v11;

  -[PXAssetsDataSourceManager dataSource](self->_oneUpDataSourceManager, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  oneUpInitialAssetReference = self->_oneUpInitialAssetReference;
  self->_oneUpInitialAssetReference = 0;

  -[PXGadgetProvider gadgets](self, "gadgets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "indexOfObject:", v9);

  v17 = objc_alloc((Class)off_1E50B1688);
  v34[0] = *(_QWORD *)off_1E50B7E98;
  v34[1] = v16;
  v35 = xmmword_1A7C0C1F0;
  v18 = (void *)objc_msgSend(v17, "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v10, 0, v34);
  objc_msgSend(v13, "assetReferenceForAssetReference:", v18);
  v19 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
  v20 = self->_oneUpInitialAssetReference;
  self->_oneUpInitialAssetReference = v19;

  if (self->_oneUpInitialAssetReference)
  {
    -[PXGadgetProvider gadgetTransition](self, "gadgetTransition");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:

        -[NSObject oneUpPresentation](v21, "oneUpPresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDelegate:", self);
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __90__PXContentSyndicationGadgetProvider_contentSyndicationGadget_presentOneUpAnimated_asset___block_invoke;
        v32[3] = &__block_descriptor_33_e44_v16__0___PXOneUpPresentationConfiguration__8l;
        v33 = a4;
        objc_msgSend(v22, "startWithConfigurationHandler:", v32);

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject px_descriptionForAssertionMessage](v21, "px_descriptionForAssertionMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v31;
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v28, v30);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v28);
    }

    goto LABEL_6;
  }
  PLSyndicationUIGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v23;
    _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Syndication Gadget Cell: Couldn't find the asset %{public}@ in new data source, after searching for it. Unable to navigate to 1up.", buf, 0xCu);

  }
LABEL_9:

}

- (id)countsControllerForContentSyndicationGadget:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "createCountsController");
}

- (id)_newGadgetForContentSyndicationItem:(id)a3
{
  id v4;
  PXContentSyndicationGadget *v5;
  void *v6;
  void *v7;
  void *v8;
  PXContentSyndicationGadget *v9;

  v4 = a3;
  v5 = [PXContentSyndicationGadget alloc];
  -[PXContentSyndicationDataSourceManager assetFetchResultProvider](self->_dataSourceManager, "assetFetchResultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationDataSourceManager imageProvider](self->_dataSourceManager, "imageProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationDataSourceManager socialLayerHighlightProvider](self->_dataSourceManager, "socialLayerHighlightProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXContentSyndicationGadget initWithAssetFetchResultProvider:imageProvider:socialLayerHighlightProvider:](v5, "initWithAssetFetchResultProvider:imageProvider:socialLayerHighlightProvider:", v6, v7, v8);

  -[PXContentSyndicationGadget setContentSyndicationItem:](v9, "setContentSyndicationItem:", v4);
  return v9;
}

- (void)_setDataSource:(id)a3 changeDetails:(id)a4
{
  id v7;
  PXContentSyndicationDataSource **p_dataSource;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  PXContentSyndicationDataSource *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _OWORD v31[2];
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  PXContentSyndicationGadgetProvider *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;

  v7 = a3;
  if (self->_didGenerateGadgets)
  {
    p_dataSource = &self->_dataSource;
    objc_storeStrong((id *)&self->_dataSource, a3);
    v9 = a4;
    -[PXGadgetProvider gadgets](self, "gadgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemChangesInSection:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "hasIncrementalChanges");
    v13 = MEMORY[0x1E0C809B0];
    v14 = "uttonFactory";
    if (v12)
    {
      v27 = v7;
      v15 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v11, "removedIndexes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectsAtIndexes:", v16);
      objc_msgSend(v11, "insertedIndexes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v13;
      v42[1] = 3221225472;
      v42[2] = __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke;
      v42[3] = &unk_1E51460E8;
      v42[4] = self;
      v18 = v15;
      v43 = v18;
      objc_msgSend(v17, "enumerateIndexesUsingBlock:", v42);
      v19 = v13;
      v39[0] = v13;
      v39[1] = 3221225472;
      v39[2] = __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_2;
      v39[3] = &unk_1E5142428;
      v40 = (id)objc_msgSend(v18, "copy");
      v20 = v18;
      v41 = v20;
      v21 = v40;
      objc_msgSend(v11, "enumerateMovedIndexesUsingBlock:", v39);
      objc_msgSend(v11, "changedIndexes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v19;
      v36[1] = 3221225472;
      v36[2] = __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_3;
      v36[3] = &unk_1E51460E8;
      v23 = v20;
      v37 = v23;
      v38 = self;
      objc_msgSend(v22, "enumerateIndexesUsingBlock:", v36);
      if (objc_msgSend(v16, "count") || objc_msgSend(v17, "count"))
        v24 = 0;
      else
        v24 = objc_msgSend(v11, "hasMoves") ^ 1;
      v7 = v27;

      v13 = MEMORY[0x1E0C809B0];
      v14 = "LemonadeProfileButtonFactory" + 16;
      if ((v24 & 1) != 0)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      if (*p_dataSource)
      {
        -[PXContentSyndicationDataSource firstItemIndexPath](*p_dataSource, "firstItemIndexPath");
        v26 = *p_dataSource;
      }
      else
      {
        v26 = 0;
      }
      v32[0] = v13;
      v32[1] = 3221225472;
      v32[2] = __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_4;
      v32[3] = &unk_1E5142450;
      v32[4] = self;
      v23 = v25;
      v33 = v23;
      v31[0] = v34;
      v31[1] = v35;
      -[PXContentSyndicationDataSource enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](v26, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v31, 0, v32);

    }
    v28[0] = v13;
    v28[1] = *((_QWORD *)v14 + 7);
    v28[2] = __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_5;
    v28[3] = &unk_1E5142478;
    v29 = v10;
    v23 = v23;
    v30 = v23;
    -[PXGadgetProvider performChanges:](self, "performChanges:", v28);

LABEL_13:
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;

  if ((void *)PXDataSourceManagerObservationContext_267907 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationGadgetProvider.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context == PXDataSourceManagerObservationContext"));

  }
  -[PXContentSyndicationGadgetProvider dataSource](self, "dataSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContentSyndicationGadgetProvider dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coalescedChangeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v13, "identifier"), objc_msgSend(v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXContentSyndicationGadgetProvider _setDataSource:changeDetails:](self, "_setDataSource:changeDetails:", v7, v10);
}

- (PXContentSyndicationDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXContentSyndicationDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)didGenerateGadgets
{
  return self->_didGenerateGadgets;
}

- (void)setDidGenerateGadgets:(BOOL)a3
{
  self->_didGenerateGadgets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_oneUpInitialAssetReference, 0);
}

void __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "identifier");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 0;
  v8[2] = a2;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "contentSyndicationItemAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newGadgetForContentSyndicationItem:", v6);
  objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v7, a2);

}

void __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, v5);

}

void __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "identifier");
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 0;
  v8[2] = a2;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "contentSyndicationItemAtItemIndexPath:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setContentSyndicationItem:", v7);
}

void __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v8[2];

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a2[1];
  v8[0] = *a2;
  v8[1] = v5;
  objc_msgSend(v4, "contentSyndicationItemAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newGadgetForContentSyndicationItem:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __67__PXContentSyndicationGadgetProvider__setDataSource_changeDetails___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(v3, "removeAllGadgets");
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(v3, "addGadgets:", *(_QWORD *)(a1 + 40));

}

uint64_t __90__PXContentSyndicationGadgetProvider_contentSyndicationGadget_presentOneUpAnimated_asset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnimated:", *(unsigned __int8 *)(a1 + 32));
}

@end
