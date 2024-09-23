@implementation PXAssetsDataSourceManager

- (void)ensureLastSectionHasContent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  v5 = v4 - 1;
  if (v4 >= 1)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfItemsInSection:", v5);

    if (!v7)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __56__PXAssetsDataSourceManager_ensureLastSectionHasContent__block_invoke;
      v8[3] = &__block_descriptor_40_e44_v16__0___PXMutableAssetsDataSourceManager__8l;
      v8[4] = v5;
      -[PXObservable performChanges:](self, "performChanges:", v8);
    }
  }
}

uint64_t __56__PXAssetsDataSourceManager_ensureLastSectionHasContent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceAccurateSection:andSectionsBeforeAndAfter:", *(_QWORD *)(a1 + 32), 0);
}

- (void)registerChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAssetsDataSourceManager;
  -[PXSectionedDataSourceManager registerChangeObserver:context:](&v4, sel_registerChangeObserver_context_, a3, a4);
}

- (void)unregisterChangeObserver:(id)a3 context:(void *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXAssetsDataSourceManager;
  -[PXSectionedDataSourceManager unregisterChangeObserver:context:](&v4, sel_unregisterChangeObserver_context_, a3, a4);
}

- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5
{
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSourceManager.m"), 32, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetsDataSourceManager setCurationEnabledForAllCollections:curationLength:collectionsToDiff:]", v10);

  abort();
}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSourceManager.m"), 36, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetsDataSourceManager setCurationEnabled:forAssetCollection:]", v9);

  abort();
}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  PXAssetsDataSourceManager *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = (void *)MEMORY[0x24BDD15E0];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "numberOfSections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = -[PXAssetsDataSourceManager forceAccurateSectionsIfNeeded:](v2, "forceAccurateSectionsIfNeeded:", v5);
  return (char)v2;
}

- (BOOL)supportsCurationToggling
{
  return 0;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  return 0;
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  return 0;
}

- (BOOL)isLoadingInitialDataSource
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__PXAssetsDataSourceManager_isLoadingInitialDataSource__block_invoke;
  v4[3] = &unk_2514D0840;
  v4[4] = &v5;
  -[PXAssetsDataSourceManager _performIfStartingSectionIsEmpty:](self, "_performIfStartingSectionIsEmpty:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)ensureStartingSectionHasContent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke;
  v2[3] = &unk_2514D0868;
  v2[4] = self;
  -[PXAssetsDataSourceManager _performIfStartingSectionIsEmpty:](self, "_performIfStartingSectionIsEmpty:", v2);
}

- (void)_performIfStartingSectionIsEmpty:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, void *, _QWORD);

  v7 = (void (**)(id, void *, _QWORD))a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "startingSection");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    if (!objc_msgSend(v4, "numberOfItemsInSection:", v5))
      v7[2](v7, v4, v6);
  }

}

- (int64_t)backgroundFetchOriginSection
{
  return 0;
}

- (void)waitForAvailabilityOfAsset:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  PXAssetReference *v10;
  uint64_t v11;
  PXAssetReference *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 *v16;
  _QWORD v17[4];
  PXAssetReference *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a5;
  v20 = *(_OWORD *)PXSimpleIndexPathNull;
  v21 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v10 = -[PXSectionedObjectReference initWithSectionObject:itemObject:subitemObject:indexPath:]([PXAssetReference alloc], "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v8, 0, &v20);
  *(_QWORD *)&v20 = 0;
  *((_QWORD *)&v20 + 1) = &v20;
  *(_QWORD *)&v21 = 0x3032000000;
  *((_QWORD *)&v21 + 1) = __Block_byref_object_copy__6480;
  v22 = __Block_byref_object_dispose__6481;
  v11 = MEMORY[0x24BDAC760];
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke;
  v17[3] = &unk_2514D0890;
  v19 = &v20;
  v12 = v10;
  v18 = v12;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke_2;
  v14[3] = &unk_2514D08B8;
  v13 = v9;
  v15 = v13;
  v16 = &v20;
  -[PXSectionedDataSourceManager waitForCondition:timeout:completionHandler:](self, "waitForCondition:timeout:completionHandler:", v17, v14, a4);

  _Block_object_dispose(&v20, 8);
}

- (void)waitForAvailabilityOfAsset:(id)a3 completionHandler:(id)a4
{
  -[PXAssetsDataSourceManager waitForAvailabilityOfAsset:timeout:completionHandler:](self, "waitForAvailabilityOfAsset:timeout:completionHandler:", a3, a4, 2.0);
}

- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  return 0;
}

- (id)createDataSourceManagerForAsset:(id)a3
{
  return 0;
}

- (void)setFilterPredicate:(id)a3
{
  NSPredicate *v4;
  NSPredicate *filterPredicate;
  NSPredicate *v6;
  char v7;
  NSPredicate *v8;
  NSPredicate *v9;

  v9 = (NSPredicate *)a3;
  v4 = self->_filterPredicate;
  filterPredicate = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSPredicate isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v8;
LABEL_4:

  }
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  if (self->_includeOthersInSocialGroupAssets != a3)
    self->_includeOthersInSocialGroupAssets = a3;
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXAssetsDataSourceManager;
  -[PXSectionedDataSourceManager pauseChangeDeliveryWithTimeout:identifier:](&v5, sel_pauseChangeDeliveryWithTimeout_identifier_, a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetsDataSourceManager;
  -[PXSectionedDataSourceManager resumeChangeDeliveryAndBackgroundLoading:](&v3, sel_resumeChangeDeliveryAndBackgroundLoading_, a3);
}

- (NSString)localizedEmptyPlaceholderTitle
{
  return self->_localizedEmptyPlaceholderTitle;
}

- (NSAttributedString)localizedEmptyPlaceholderAttributedMessage
{
  return self->_localizedEmptyPlaceholderAttributedMessage;
}

- (NSString)localizedLoadingInitialDataSourceMessage
{
  return self->_localizedLoadingInitialDataSourceMessage;
}

- (BOOL)isBackgroundFetching
{
  return self->_isBackgroundFetching;
}

- (BOOL)supportsFiltering
{
  return self->_supportsFiltering;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_localizedLoadingInitialDataSourceMessage, 0);
  objc_storeStrong((id *)&self->_localizedEmptyPlaceholderAttributedMessage, 0);
  objc_storeStrong((id *)&self->_localizedEmptyPlaceholderTitle, 0);
}

BOOL __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "assetReferenceForAssetReference:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

uint64_t __82__PXAssetsDataSourceManager_waitForAvailabilityOfAsset_timeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[5];

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke_2;
  v5[3] = &__block_descriptor_40_e44_v16__0___PXMutableAssetsDataSourceManager__8l;
  v5[4] = a3;
  return objc_msgSend(v3, "performChanges:", v5);
}

uint64_t __60__PXAssetsDataSourceManager_ensureStartingSectionHasContent__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceAccurateSection:andSectionsBeforeAndAfter:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __55__PXAssetsDataSourceManager_isLoadingInitialDataSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isSectionConsideredAccurate:");
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

@end
