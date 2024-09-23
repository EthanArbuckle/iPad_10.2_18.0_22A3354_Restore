@implementation PXContentSyndicationPhotoKitCountsController

- (void)didSetAssetCollection:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXAssetsDataSourceCountsController *v11;
  PXAssetsDataSourceCountsController *assetsCountsController;
  void *v13;
  void *v14;
  void *v15;
  PXFetchResultCountObserver *v16;
  id v17;
  id v18;
  PXFetchResultCountObserver *v19;
  PXFetchResultCountObserver *fetchResultCountObserver;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitCountsController.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  v6 = objc_alloc(MEMORY[0x1E0CD1620]);
  v25[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, v8, *MEMORY[0x1E0CD1B98], 0, 0, 1);

  PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (PXAssetsDataSourceCountsController *)objc_msgSend(objc_alloc((Class)off_1E50B16E8), "initWithAssetsDataSourceManager:", v10);
  assetsCountsController = self->_assetsCountsController;
  self->_assetsCountsController = v11;

  -[PXAssetsDataSourceCountsController registerChangeObserver:context:](self->_assetsCountsController, "registerChangeObserver:context:", self, PXAssetsDataSourceCountsControllerObserverContext_22651);
  -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](self->_assetsCountsController, "prepareCountsIfNeeded");
  -[PXContentSyndicationPhotoKitCountsController _updateDetailedCounts](self, "_updateDetailedCounts");
  objc_msgSend(v5, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "filterPredicateForSavedSyndicationAssetsOnly");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInternalPredicate:", v15);

  v16 = [PXFetchResultCountObserver alloc];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__PXContentSyndicationPhotoKitCountsController_didSetAssetCollection___block_invoke;
  v22[3] = &unk_1E51323C0;
  v23 = v5;
  v24 = v14;
  v17 = v14;
  v18 = v5;
  v19 = -[PXFetchResultCountObserver initWithQOSClass:photoLibrary:fetchResultBlock:](v16, "initWithQOSClass:photoLibrary:fetchResultBlock:", 17, v13, v22);
  fetchResultCountObserver = self->_fetchResultCountObserver;
  self->_fetchResultCountObserver = v19;

  -[PXFetchResultCountObserver setDelegate:](self->_fetchResultCountObserver, "setDelegate:", self);
  -[PXContentSyndicationPhotoKitCountsController _updateSavedCount](self, "_updateSavedCount");

}

- (void)_updateDetailedCounts
{
  PXAssetsDataSourceCountsController *assetsCountsController;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = 0uLL;
  v8 = 0;
  assetsCountsController = self->_assetsCountsController;
  if (assetsCountsController)
    -[PXAssetsDataSourceCountsController counts](assetsCountsController, "counts");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PXContentSyndicationPhotoKitCountsController__updateDetailedCounts__block_invoke;
  v4[3] = &__block_descriptor_56_e55_v16__0___PXContentSyndicationMutableCountsController__8l;
  v5 = v7;
  v6 = v8;
  -[PXContentSyndicationCountsController performChanges:](self, "performChanges:", v4);
}

- (void)_updateSavedCount
{
  PXFetchResultCountObserver *fetchResultCountObserver;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  fetchResultCountObserver = self->_fetchResultCountObserver;
  if (fetchResultCountObserver)
    v4 = -[PXFetchResultCountObserver fetchResultCount](fetchResultCountObserver, "fetchResultCount");
  else
    v4 = -1;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  -[PXContentSyndicationCountsController actualDetailedCounts](self, "actualDetailedCounts");
  v5 = -1;
  if (v4 != -1)
  {
    if (v10 + v9 + v11 && v10 + v9 + v11 >= v4)
    {
      v5 = v4;
    }
    else
    {
      PLUIGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v13 = v7;
        v14 = 2048;
        v15 = v10 + v9 + v11;
        v16 = 2048;
        v17 = v4;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "<%@: _updateSavedCount failed to update with totalCount:%lu, unsavedFetchResultCount:%li>", buf, 0x20u);
      }

      v5 = -1;
    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PXContentSyndicationPhotoKitCountsController__updateSavedCount__block_invoke;
  v8[3] = &__block_descriptor_40_e55_v16__0___PXContentSyndicationMutableCountsController__8l;
  v8[4] = v5;
  -[PXContentSyndicationCountsController performChanges:](self, "performChanges:", v8);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext_22651 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitCountsController.m"), 98, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXContentSyndicationPhotoKitCountsController _updateDetailedCounts](self, "_updateDetailedCounts");
    -[PXContentSyndicationPhotoKitCountsController _updateSavedCount](self, "_updateSavedCount");
    v9 = v11;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultCountObserver, 0);
  objc_storeStrong((id *)&self->_assetsCountsController, 0);
}

uint64_t __65__PXContentSyndicationPhotoKitCountsController__updateSavedCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSavedCount:", *(_QWORD *)(a1 + 32));
}

uint64_t __69__PXContentSyndicationPhotoKitCountsController__updateDetailedCounts__block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "setDetailedCounts:", &v3);
}

uint64_t __70__PXContentSyndicationPhotoKitCountsController_didSetAssetCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
