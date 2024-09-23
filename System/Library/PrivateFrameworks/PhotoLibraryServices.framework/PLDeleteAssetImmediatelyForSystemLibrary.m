@implementation PLDeleteAssetImmediatelyForSystemLibrary

void __PLDeleteAssetImmediatelyForSystemLibrary_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntityName:", v4);

  +[PLManagedAsset predicateForSyndicatedAssetIdentifiers:includeRejected:](PLManagedAsset, "predicateForSyndicatedAssetIdentifiers:includeRejected:", *(_QWORD *)(a1 + 40), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  v23[0] = v6;
  v23[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v5);
  objc_msgSend(v11, "setResultType:", 2);
  v20 = 0;
  objc_msgSend(v2, "executeRequest:error:", v11, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  objc_msgSend(v12, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyndicationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      v17 = "[sync.spotlightReceiver] : Chat was updated, unable to delete SPL assets: %@";
      v18 = v16;
      v19 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_199541000, v18, v19, v17, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v14;
    v17 = "[sync.spotlightReceiver] : Chat was updated, deleted %{public}@ SPL assets";
    v18 = v16;
    v19 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

}

@end
