@implementation PLDeleteGuestAssetsInLibraryWithManagedObjectContext

void __PLDeleteGuestAssetsInLibraryWithManagedObjectContext_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  char v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __PLDeleteGuestAssetsInLibraryWithManagedObjectContext_block_invoke_2;
  v20[3] = &unk_1E3667070;
  v6 = *(void **)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v22 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v6, "enumerateObjectsFromFetchRequest:usingDefaultBatchSizeWithBlock:", v4, v20);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    goto LABEL_5;
  PLSyndicationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Delete all guest assets in SPL failed with fetch error %@", buf, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
LABEL_5:
    PLSyndicationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Resetting last guest asset sync status in %@", buf, 0xCu);
    }

    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", 0, CFSTR("GuestAssetSyncStatus"), *(_QWORD *)(a1 + 32));
    _PLDeleteSyndicationBundleScopeDirectoryAndLogIfFailed(*(void **)(a1 + 48));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v14 = *(void **)(a1 + 32);
    v19 = 0;
    v15 = objc_msgSend(v14, "save:", &v19);
    v16 = v19;
    if ((v15 & 1) == 0)
    {
      PLSyndicationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "BOOL PLDeleteGuestAssetsInLibraryWithManagedObjectContext(NSManagedObjectContext *__strong _Nonnull, PLPho"
              "toLibraryPathManager *__strong _Nonnull, NSString *__strong _Nonnull, BOOL, NSError *__autoreleasing * _Nu"
              "llable)_block_invoke";
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v18;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "%s: failed: %@ %@", buf, 0x20u);

      }
    }

  }
}

void __PLDeleteGuestAssetsInLibraryWithManagedObjectContext_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "additionalAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syndicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "Deleting guest asset %{public}@ / %{public}@", (uint8_t *)&v9, 0x16u);

  }
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteWithReason:", v8);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "fixupMemoriesWithMissingKeyAsset");
    objc_msgSend(v3, "removeAssetFromRelatedSuggestionsAndFixupSuggestions");
  }

}

@end
