@implementation PXSharedLibraryAssetStatusProvider

- (PXSharedLibraryAssetStatusProvider)initWithAsset:(id)a3
{
  id v5;
  PXSharedLibraryAssetStatusProvider *v6;
  PXSharedLibraryAssetStatusProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryAssetStatusProvider;
  v6 = -[PXSharedLibraryAssetStatusProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    -[PXSharedLibraryAssetStatusProvider _updateProperties](v7, "_updateProperties");
  }

  return v7;
}

- (PXSharedLibraryAssetStatusProvider)init
{
  return -[PXSharedLibraryAssetStatusProvider initWithAsset:](self, "initWithAsset:", 0);
}

- (void)setAsset:(id)a3
{
  PHAsset *v4;
  PHAsset *asset;
  PHAsset *v6;
  char v7;
  PHAsset *v8;
  PHAsset *v9;

  v9 = (PHAsset *)a3;
  v4 = self->_asset;
  asset = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[PHAsset isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = v9;
    asset = self->_asset;
    self->_asset = v8;
LABEL_4:

  }
  -[PXSharedLibraryAssetStatusProvider setFetchedParticipants:](self, "setFetchedParticipants:", 0);
  -[PXSharedLibraryAssetStatusProvider _updateProperties](self, "_updateProperties");

}

- (id)fetchParticipants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXSharedLibraryAssetStatusProvider asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssetStatusProvider fetchedParticipants](self, "fetchedParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !v3)
    goto LABEL_5;
  if (-[PXSharedLibraryAssetStatusProvider hasSharedLibraryOrPreview](self, "hasSharedLibraryOrPreview"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD17A8], "fetchContributorsForAsset:options:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssetStatusProvider setFetchedParticipants:](self, "setFetchedParticipants:", v5);

LABEL_5:
  }
  -[PXSharedLibraryAssetStatusProvider fetchedParticipants](self, "fetchedParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHasSharedLibraryOrPreview:(BOOL)a3
{
  if (self->_hasSharedLibraryOrPreview != a3)
  {
    self->_hasSharedLibraryOrPreview = a3;
    -[PXSharedLibraryAssetStatusProvider _updateProperties](self, "_updateProperties");
  }
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[PXSharedLibraryAssetStatusProvider signalChange:](self, "signalChange:", 1);
  }
}

- (void)setLocalizedContributionStatus:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_localizedContributionStatus;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_localizedContributionStatus, a3);
      -[PXSharedLibraryAssetStatusProvider signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)_setPhotoLibrary:(id)a3
{
  PHPhotoLibrary **p_photoLibrary;
  PHPhotoLibrary *v6;
  PHPhotoLibrary *v7;
  char v8;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  PXSharedLibraryStatusProvider *v10;
  PXSharedLibraryStatusProvider *v11;
  PHPhotoLibrary *v12;

  v12 = (PHPhotoLibrary *)a3;
  p_photoLibrary = &self->_photoLibrary;
  v6 = self->_photoLibrary;
  if (v6 == v12)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PHPhotoLibrary isEqual:](v6, "isEqual:");

    if ((v8 & 1) == 0)
    {
      if (*p_photoLibrary)
      {
        -[PHPhotoLibrary px_unregisterChangeObserver:](*p_photoLibrary, "px_unregisterChangeObserver:", self);
        -[PXSharedLibraryStatusProvider unregisterChangeObserver:context:](self->_sharedLibraryStatusProvider, "unregisterChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_142200);
        sharedLibraryStatusProvider = self->_sharedLibraryStatusProvider;
        self->_sharedLibraryStatusProvider = 0;

        self->_hasSharedLibraryOrPreview = 0;
      }
      objc_storeStrong((id *)&self->_photoLibrary, a3);
      if (*p_photoLibrary)
      {
        -[PHPhotoLibrary px_registerChangeObserver:](*p_photoLibrary, "px_registerChangeObserver:", self);
        +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", *p_photoLibrary);
        v10 = (PXSharedLibraryStatusProvider *)objc_claimAutoreleasedReturnValue();
        v11 = self->_sharedLibraryStatusProvider;
        self->_sharedLibraryStatusProvider = v10;

        -[PXSharedLibraryStatusProvider registerChangeObserver:context:](self->_sharedLibraryStatusProvider, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext_142200);
        self->_hasSharedLibraryOrPreview = -[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview](self->_sharedLibraryStatusProvider, "hasSharedLibraryOrPreview");
      }
    }
  }

}

- (void)_updateProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  PHAsset *asset;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  PHAsset *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssetStatusProvider asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssetStatusProvider _setPhotoLibrary:](self, "_setPhotoLibrary:", v4);

  if (self->_asset && self->_hasSharedLibraryOrPreview)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD17A8], "fetchContributorsForAsset:options:", self->_asset, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = 3;
    }
    else
    {
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = *MEMORY[0x1E0CD19D8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchPropertySets:", v9);

      v10 = (void *)MEMORY[0x1E0CD1390];
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchAssetsWithLocalIdentifiers:options:", v12, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "participatesInLibraryScope");
      objc_msgSend(v14, "libraryScopeProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "assetIsInOnboardingPreviewState");

      if (v15)
      {
        PLSharedLibraryGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          asset = self->_asset;
          *(_DWORD *)buf = 138412546;
          v27 = v6;
          v28 = 2112;
          v29 = asset;
          _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "No name for contributors: %@, of asset: %@", buf, 0x16u);
        }

        v7 = 3;
      }
      else if (v17)
      {
        v7 = 2;
      }
      else
      {
        v7 = 1;
      }

    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  objc_msgSend(v6, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryAssetStatusProvider _localizedContributionStatusForContributor:status:assetMediaType:](PXSharedLibraryAssetStatusProvider, "_localizedContributionStatusForContributor:status:assetMediaType:", v20, v7, -[PHAsset mediaType](self->_asset, "mediaType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__PXSharedLibraryAssetStatusProvider__updateProperties__block_invoke;
  v23[3] = &unk_1E5144A98;
  v24 = v21;
  v25 = v7;
  v23[4] = self;
  v22 = v21;
  -[PXSharedLibraryAssetStatusProvider performChanges:](self, "performChanges:", v23);

}

- (id)attributedLocalizedContributionStatusForPreferredWidth:(double)a3 maximumNumberOfLines:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  -[PXSharedLibraryAssetStatusProvider fetchParticipants](self, "fetchParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssetStatusProvider asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mediaType");

  +[PXSharedLibraryAssetStatusProvider localizedContributionStatusStringForParticipants:assetMediaType:showOnlyOneNameToShortenStatus:](PXSharedLibraryAssetStatusProvider, "localizedContributionStatusStringForParticipants:assetMediaType:showOnlyOneNameToShortenStatus:", v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryAssetStatusProvider _applyAttributesToTitle:](PXSharedLibraryAssetStatusProvider, "_applyAttributesToTitle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", (uint64_t)(a4 + 1.0), 1, a3);
  v14 = v13;
  +[PXSharedLibraryAssetStatusProvider _primaryFont](PXSharedLibraryAssetStatusProvider, "_primaryFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v17 = v16;

  if (floor(v14 / v17) > a4)
  {
    +[PXSharedLibraryAssetStatusProvider localizedContributionStatusStringForParticipants:assetMediaType:showOnlyOneNameToShortenStatus:](PXSharedLibraryAssetStatusProvider, "localizedContributionStatusStringForParticipants:assetMediaType:showOnlyOneNameToShortenStatus:", v8, v10, 1);
    v18 = objc_claimAutoreleasedReturnValue();

    +[PXSharedLibraryAssetStatusProvider _applyAttributesToTitle:](PXSharedLibraryAssetStatusProvider, "_applyAttributesToTitle:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v19;
    v11 = (void *)v18;
  }

  return v12;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString **v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__142205;
  v20 = __Block_byref_object_dispose__142206;
  v21 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXSharedLibraryAssetStatusProvider_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if (v17[5])
  {
    objc_msgSend(v4, "changeDetailsForObject:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectAfterChanges");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
      {
        v9 = v17[5];
        v24[0] = CFSTR("current");
        v24[1] = CFSTR("new");
        v25[0] = v9;
        v25[1] = v7;
        v10 = (const __CFString **)v24;
        v11 = v25;
        v12 = 2;
      }
      else
      {
        v22 = CFSTR("current");
        v23 = v17[5];
        v10 = &v22;
        v11 = &v23;
        v12 = 1;
      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("current"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssetStatusProvider asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("new"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibraryAssetStatusProvider setAsset:](self, "setAsset:", v10);

    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 3) != 0 && (void *)PXSharedLibraryStatusProviderObservationContext_142200 == a5)
    -[PXSharedLibraryAssetStatusProvider setHasSharedLibraryOrPreview:](self, "setHasSharedLibraryOrPreview:", -[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview](self->_sharedLibraryStatusProvider, "hasSharedLibraryOrPreview", a3));
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSString)localizedContributionStatus
{
  return self->_localizedContributionStatus;
}

- (BOOL)hasSharedLibraryOrPreview
{
  return self->_hasSharedLibraryOrPreview;
}

- (PHFetchResult)fetchedParticipants
{
  return self->_fetchedParticipants;
}

- (void)setFetchedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedParticipants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedParticipants, 0);
  objc_storeStrong((id *)&self->_localizedContributionStatus, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __67__PXSharedLibraryAssetStatusProvider_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__PXSharedLibraryAssetStatusProvider__updateProperties__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setLocalizedContributionStatus:", *(_QWORD *)(a1 + 40));
}

+ (id)_localizedContributionStatusForContributor:(id)a3 status:(unint64_t)a4 assetMediaType:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v7 = a3;
  v8 = v7;
  if (a4 == 1)
  {
    v12 = CFSTR("PXSharedLibrary_AssetStatus_NotShared");
LABEL_9:
    PXLocalizedSharedLibraryString(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a4 == 2)
  {
    v12 = CFSTR("PXSharedLibrary_AssetStatus_SharedByMe");
    goto LABEL_9;
  }
  if (a4 == 3 && objc_msgSend(v7, "count"))
  {
    +[PXSharedLibraryAssetStatusProvider localizedContributionStatusStringForParticipants:assetMediaType:showOnlyOneNameToShortenStatus:](PXSharedLibraryAssetStatusProvider, "localizedContributionStatusStringForParticipants:assetMediaType:showOnlyOneNameToShortenStatus:", v8, a5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryAssetStatusProvider _applyAttributesToTitle:](PXSharedLibraryAssetStatusProvider, "_applyAttributesToTitle:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
LABEL_10:

  return v11;
}

+ (id)localizedContributionStatusStringForParticipants:(id)a3 assetMediaType:(int64_t)a4 showOnlyOneNameToShortenStatus:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v10)
  {

LABEL_17:
    if (objc_msgSend(v8, "count"))
    {
      if ((unint64_t)objc_msgSend(v8, "count") > 3 || v5 && (unint64_t)objc_msgSend(v8, "count") >= 2)
      {
        +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:mediaType:](PXSharedLibraryAssetStatusProvider, "_appendMediaTypeForStatusStringFormat:mediaType:", CFSTR("PXSharedLibraryInfoPanelTitle_OneAndOtherContributors_"), a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedSharedLibraryString(v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "count");
        v22 = CFSTR("%@ %lu");
LABEL_20:
        PXLocalizedStringWithValidatedFormat(v18, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

        goto LABEL_35;
      }
      if (objc_msgSend(v8, "count") == 3)
      {
        +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:mediaType:](PXSharedLibraryAssetStatusProvider, "_appendMediaTypeForStatusStringFormat:mediaType:", CFSTR("PXSharedLibraryInfoPanelTitle_ThreeContributors_"), a4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedSharedLibraryString(v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectAtIndex:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v18, CFSTR("%@ %@ %@"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
        goto LABEL_34;
      }
      if (objc_msgSend(v8, "count") == 2)
      {
        v29 = CFSTR("PXSharedLibraryInfoPanelTitle_TwoContributors_");
        goto LABEL_32;
      }
      v32 = CFSTR("PXSharedLibraryInfoPanelTitle_OneContributor_");
LABEL_39:
      +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:mediaType:](PXSharedLibraryAssetStatusProvider, "_appendMediaTypeForStatusStringFormat:mediaType:", v32, a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedSharedLibraryString(v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("%@");
      goto LABEL_20;
    }
    v24 = CFSTR("PXSharedLibraryInfoPanelTitle_NoContributors_");
LABEL_22:
    +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:mediaType:](PXSharedLibraryAssetStatusProvider, "_appendMediaTypeForStatusStringFormat:mediaType:", v24, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v26;
    v18 = v19;
    goto LABEL_23;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v36 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      if ((objc_msgSend(v15, "isCurrentUser") & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        PXSharedLibraryShortNameForParticipant(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v11);

  if ((v12 & 1) == 0)
    goto LABEL_17;
  if ((unint64_t)objc_msgSend(v8, "count") <= 2 && (!v5 || !objc_msgSend(v8, "count")))
  {
    if (objc_msgSend(v8, "count") == 2)
    {
      v29 = CFSTR("PXSharedLibraryInfoPanelTitle_YouAndTwoContributors_");
LABEL_32:
      +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:mediaType:](PXSharedLibraryAssetStatusProvider, "_appendMediaTypeForStatusStringFormat:mediaType:", v29, a4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedSharedLibraryString(v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v18, CFSTR("%@ %@"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    if (objc_msgSend(v8, "count") == 1)
    {
      v32 = CFSTR("PXSharedLibraryInfoPanelTitle_YouAndOneContributors_");
      goto LABEL_39;
    }
    v24 = CFSTR("PXSharedLibraryInfoPanelTitle_YouContributor_");
    goto LABEL_22;
  }
  +[PXSharedLibraryAssetStatusProvider _appendMediaTypeForStatusStringFormat:mediaType:](PXSharedLibraryAssetStatusProvider, "_appendMediaTypeForStatusStringFormat:mediaType:", CFSTR("PXSharedLibraryInfoPanelTitle_YouAndOtherContributors_"), a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "count");
  PXLocalizedStringWithValidatedFormat(v18, CFSTR("%lu"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
  v23 = v19;
LABEL_35:

  return v23;
}

+ (id)_appendMediaTypeForStatusStringFormat:(id)a3 mediaType:(int64_t)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  v7 = CFSTR("Item");
  if (a4 == 2)
    v7 = CFSTR("Video");
  if (a4 == 1)
    v8 = CFSTR("Photo");
  else
    v8 = v7;
  objc_msgSend(v5, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_applyAttributesToTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PXSharedLibraryAssetStatusProvider _primaryFont](PXSharedLibraryAssetStatusProvider, "_primaryFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryAssetStatusProvider _displayNameFont](PXSharedLibraryAssetStatusProvider, "_displayNameFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryAssetStatusProvider _libraryNameFont](PXSharedLibraryAssetStatusProvider, "_libraryNameFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1140];
  v21[0] = *MEMORY[0x1E0DC1138];
  v6 = v21[0];
  v21[1] = v7;
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19[1] = v7;
  v20[0] = v4;
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v7;
  v18[0] = v5;
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v3, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_primaryFont
{
  return (id)PXCappedFontWithTextStyle();
}

+ (id)_displayNameFont
{
  return (id)PXCappedFontWithTextStyleAndWeight();
}

+ (id)_libraryNameFont
{
  return (id)PXCappedFontWithTextStyle();
}

@end
