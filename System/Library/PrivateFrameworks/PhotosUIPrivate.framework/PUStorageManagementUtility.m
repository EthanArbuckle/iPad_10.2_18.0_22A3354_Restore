@implementation PUStorageManagementUtility

- (PUStorageManagementUtility)initWithPhotoLibrary:(id)a3
{
  id v5;
  PUStorageManagementUtility *v6;
  PUStorageManagementUtility *v7;
  NSNumber *cloudStorageTotalBytes;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUStorageManagementUtility;
  v6 = -[PUStorageManagementUtility init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    cloudStorageTotalBytes = v7->_cloudStorageTotalBytes;
    v7->_cloudStorageTotalBytes = 0;

  }
  return v7;
}

- (void)purgeableSizeAndOriginalsInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D719C0], "sharedAssetsdClientForPhotoLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryInternalClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PUStorageManagementUtility_purgeableSizeAndOriginalsInLibrary___block_invoke;
  v10[3] = &unk_1E58A8398;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "getLibrarySizesFromDB:completionHandler:", 1, v10);

}

- (BOOL)isCPLEnabled
{
  void *v2;
  char v3;

  -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPhotoLibraryEnabled");

  return v3;
}

- (BOOL)isCPLInExitMode
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exitDeleteTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldHideCPL
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  BOOL v8;

  objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPrimaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "provisionedDataclasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0C8F380]) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLRestrictionForFeature:", *MEMORY[0x1E0D46FB8]);

  if (v7 == 2)
    v8 = 1;
  else
    v8 = v5;

  return v8;
}

- (id)_assetsInTrash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CD1570];
  -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchOptionsWithInclusiveDefaultsForPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = *MEMORY[0x1E0CD1A08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFetchPropertySets:", v5);

  objc_msgSend(v4, "setIncludeTrashedAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trashedState = %d"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)sizeForRecentlyDeletedItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PUStorageManagementUtility _assetsInTrash](self, "_assetsInTrash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "originalMetadataProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "originalFilesize");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v9;
}

- (BOOL)isDeletableItemsInTrash
{
  void *v2;
  BOOL v3;

  -[PUStorageManagementUtility _assetsInTrash](self, "_assetsInTrash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isOptimizedModeOn
{
  return -[PHPhotoLibrary isKeepOriginalsEnabled](self->_photoLibrary, "isKeepOriginalsEnabled") ^ 1;
}

- (void)enableOptimizedMode:(BOOL)a3
{
  -[PHPhotoLibrary setKeepOriginalsEnabled:](self->_photoLibrary, "setKeepOriginalsEnabled:", !a3);
}

- (void)enableCPLWithCompletionBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLCanEnableCloudPhotoLibrary();

}

- (void)expungeRecentlyDeletedItemsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[PUStorageManagementUtility _assetsInTrash](self, "_assetsInTrash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x1E0CD1408]);
    objc_msgSend(v8, "setExpungeSource:", 5);
    v9 = (void *)MEMORY[0x1E0CD13B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PUStorageManagementUtility_expungeRecentlyDeletedItemsWithCompletionBlock___block_invoke;
    v10[3] = &unk_1E58AA3D0;
    v11 = v5;
    v12 = v4;
    objc_msgSend(v9, "performBatchExpungeWithAssets:deleteOptions:photoLibrary:completionHandler:", v11, v8, v7, v10);

  }
}

- (id)_defaultVideoAssetFetchOptionsWithSortOrder:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[3];

  v3 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:photoLibrary:](PUStorageManagementUtility, "storageTipAssetFetchOptionsForType:photoLibrary:", 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0CD1A30];
  v12[0] = *MEMORY[0x1E0CD1A08];
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFetchPropertySets:", v7);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("additionalAttributes.originalFilesize"), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v9);

  return v5;
}

- (id)fetchVideoAssetsBySizeWithSortOrder:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUStorageManagementUtility _defaultVideoAssetFetchOptionsWithSortOrder:](self, "_defaultVideoAssetFetchOptionsWithSortOrder:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("localIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v3, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_fetchAssetsInArray:photoLibrary:", MEMORY[0x1E0C9AA60], v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_deleteableVideoAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUStorageManagementUtility fetchVideoAssetsBySizeWithSortOrder:](self, "fetchVideoAssetsBySizeWithSortOrder:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_90533);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)totalReclaimableSizeFromPurgingVideoClips
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PUStorageManagementUtility _deleteableVideoAssets](self, "_deleteableVideoAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "originalMetadataProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "originalFilesize");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)significantItems
{
  void *v2;
  void *v3;
  void *v4;

  -[PUStorageManagementUtility _defaultVideoAssetFetchOptionsWithSortOrder:](self, "_defaultVideoAssetFetchOptionsWithSortOrder:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", 2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldShowCloudStorageTip
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PUStorageManagementUtility isCPLEnabled](self, "isCPLEnabled");
  if (v3)
  {
    if (-[PUStorageManagementUtility isCPLInExitMode](self, "isCPLInExitMode"))
      goto LABEL_5;
    -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cplStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "initialSyncDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
LABEL_5:
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = -[PUStorageManagementUtility cloudStorageTotalBytesSize](self, "cloudStorageTotalBytesSize") != 0;
  }
  return v3;
}

- (unint64_t)cloudStorageTotalBytesSize
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PUStorageManagementUtility cloudStorageTotalBytes](self, "cloudStorageTotalBytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUStorageManagementUtility photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = 0;
    v5 = objc_msgSend(v4, "cloudQuotaResourceBytesUsed:error:", &v14, &v13);
    v6 = v14;
    v7 = v13;

    if ((v5 & 1) == 0)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to get iCloud storage used with error %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", +[PUStorageManagementUtility cloudStorageTotalBytesSizeFromCloudQuotaDictionary:](PUStorageManagementUtility, "cloudStorageTotalBytesSizeFromCloudQuotaDictionary:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUStorageManagementUtility setCloudStorageTotalBytes:](self, "setCloudStorageTotalBytes:", v9);

  }
  -[PUStorageManagementUtility cloudStorageTotalBytes](self, "cloudStorageTotalBytes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongValue");

  return v11;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (NSNumber)cloudStorageTotalBytes
{
  return self->_cloudStorageTotalBytes;
}

- (void)setCloudStorageTotalBytes:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStorageTotalBytes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStorageTotalBytes, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __52__PUStorageManagementUtility__deleteableVideoAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canPerformEditOperation:", 1);
}

void __77__PUStorageManagementUtility_expungeRecentlyDeletedItemsWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Unable to expunge assets:%@ error:%@", (uint8_t *)&v7, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_2;
  block[3] = &unk_1E58A8FD8;
  v11 = a2;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  if (*(_BYTE *)(a1 + 48))
  {
    v1 = (void *)MEMORY[0x1E0D71620];
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_3;
    v3[3] = &unk_1E58AA6A8;
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v1, "enableCPL:", v3);

  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
  }
}

uint64_t __59__PUStorageManagementUtility_enableCPLWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__PUStorageManagementUtility_purgeableSizeAndOriginalsInLibrary___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(&unk_1E59BC180, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134217984;
        v14 = -[NSObject unsignedLongLongValue](v11, "unsignedLongLongValue");
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "purgeableSizeAndOriginalsInLibrary potential purgeable originals in optimize mode = %llu bytes", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "purgeableSizeAndOriginalsInLibrary did not find key in sizes dictionary", (uint8_t *)&v13, 2u);
      }
      v11 = &unk_1E59BC168;
    }

  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = (uint64_t)v8;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "Error getting library sizes from assetsd: %@", (uint8_t *)&v13, 0xCu);
    }
    v11 = &unk_1E59BC168;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)storageTipAssetCollectionForType:(unint64_t)a3 photoLibrary:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      v9 = 1000000212;
      break;
    case 1uLL:
      v9 = 211;
      break;
    case 2uLL:
      v9 = 202;
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUStorageManagementUtility.m"), 240, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v9 = 0;
      break;
  }
  objc_msgSend(v7, "px_assetCollectionForSmartAlbumWithSubtype:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)storageTipAssetFetchOptionsForType:(unint64_t)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCloudPhotoLibraryEnabled"))
  {
    +[PUStorageManagementUtility predicateForUploadedAssetFetch](PUStorageManagementUtility, "predicateForUploadedAssetFetch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalPredicate:", v7);

  }
  if (a3 == 2)
  {
    objc_msgSend(v6, "internalPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(v6, "internalPredicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      +[PUStorageManagementUtility predicateForMinimumVideoSize](PUStorageManagementUtility, "predicateForMinimumVideoSize");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalPredicate:", v13);

    }
    else
    {
      +[PUStorageManagementUtility predicateForMinimumVideoSize](PUStorageManagementUtility, "predicateForMinimumVideoSize");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalPredicate:", v14);

    }
  }
  objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sharedLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isOwned");

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v6, "internalPredicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(v6, "internalPredicate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v20;
      +[PUStorageManagementUtility _predicateForPersonalLibraryAssets](PUStorageManagementUtility, "_predicateForPersonalLibraryAssets");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "andPredicateWithSubpredicates:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalPredicate:", v23);

    }
    else
    {
      +[PUStorageManagementUtility _predicateForPersonalLibraryAssets](PUStorageManagementUtility, "_predicateForPersonalLibraryAssets");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalPredicate:", v20);
    }

  }
  return v6;
}

+ (unint64_t)cloudStorageTotalBytesSizeFromCloudQuotaDictionary:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PUStorageManagementUtility_cloudStorageTotalBytesSizeFromCloudQuotaDictionary___block_invoke;
  v6[3] = &unk_1E58A83E0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)predicateForMinimumVideoSize
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("additionalAttributes.originalFilesize"), 31457279);
}

+ (id)predicateForUploadedAssetFetch
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil && %K == %d"), CFSTR("master"), CFSTR("master.cloudLocalState"), 3);
}

+ (id)_predicateForPersonalLibraryAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), 0);
}

void __81__PUStorageManagementUtility_cloudStorageTotalBytesSizeFromCloudQuotaDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v6, "unsignedLongValue");
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v6, "unsignedLongValue"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "Cloud Storage Recoverable for %@: %@", (uint8_t *)&v9, 0x16u);

  }
}

@end
