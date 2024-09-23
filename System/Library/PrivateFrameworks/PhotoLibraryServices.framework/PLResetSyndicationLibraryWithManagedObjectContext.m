@implementation PLResetSyndicationLibraryWithManagedObjectContext

void __PLResetSyndicationLibraryWithManagedObjectContext_block_invoke(uint64_t a1)
{
  PLGlobalValues *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint32_t v52;
  const char *v53;
  int v54;
  void *v55;
  char v56;
  id v57;
  NSObject *v58;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id obj;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", *(_QWORD *)(a1 + 32));
  -[PLGlobalValues setLastAttachmentSyndicationSyncDate:](v2, "setLastAttachmentSyndicationSyncDate:", 0);
  -[PLGlobalValues setLastChatSyndicationSyncDate:](v2, "setLastChatSyndicationSyncDate:", 0);
  -[PLGlobalValues setLastDeleteSyndicationSyncDate:](v2, "setLastDeleteSyndicationSyncDate:", 0);
  -[PLGlobalValues setLastFullIndexSyndicationSyncStartDate:](v2, "setLastFullIndexSyndicationSyncStartDate:", 0);
  -[PLGlobalValues setInProgressFullIndexSyndicationSyncDate:](v2, "setInProgressFullIndexSyndicationSyncDate:", 0);
  -[PLGlobalValues setSyndicationStartDate:](v2, "setSyndicationStartDate:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("PLSyndicationLastUpdateDate"));

  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("bundleScope"), 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v8, "executeFetchRequest:error:", v6, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C97B48];
    +[PLConversation entityName](PLConversation, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v68 = *(id *)(v15 + 40);
    objc_msgSend(v14, "executeFetchRequest:error:", v13, &v68);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), v68);
    if (!v16)
    {
      PLSyndicationGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v71 = v31;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Fetch conversations failed with error %@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v16, "count") + objc_msgSend(v10, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 32);
    v19 = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __PLResetSyndicationLibraryWithManagedObjectContext_block_invoke_190;
    v65[3] = &unk_1E3677A78;
    v66 = v18;
    v20 = v17;
    v67 = v20;
    objc_msgSend(v66, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v10, v65);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    PLSyndicationGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136446466;
        v71 = "BOOL PLResetSyndicationLibraryWithManagedObjectContext(NSManagedObjectContext *__strong _Nonnull, PLPhotoL"
              "ibraryPathManager *__strong _Nonnull, NSError *__autoreleasing * _Nullable)_block_invoke_2";
        v72 = 2112;
        v73 = v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "%{public}s: enumerate assets with incremental save failed: %@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_37;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134217984;
      v71 = (const char *)v32;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Deleted %tu syndication assets", buf, 0xCu);
    }

    v33 = *(void **)(a1 + 32);
    v62[0] = v19;
    v62[1] = 3221225472;
    v62[2] = __PLResetSyndicationLibraryWithManagedObjectContext_block_invoke_192;
    v62[3] = &unk_1E36710B0;
    v63 = v33;
    v64 = v20;
    objc_msgSend(v63, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v16, v62);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    PLSyndicationGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v37)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136446466;
        v71 = "BOOL PLResetSyndicationLibraryWithManagedObjectContext(NSManagedObjectContext *__strong _Nonnull, PLPhotoL"
              "ibraryPathManager *__strong _Nonnull, NSError *__autoreleasing * _Nullable)_block_invoke_2";
        v72 = 2112;
        v73 = v40;
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "%{public}s: enumerate conversations with incremental save failed: %@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_36:

LABEL_37:
LABEL_38:

      goto LABEL_39;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134217984;
      v71 = (const char *)v41;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Deleted %tu conversations", buf, 0xCu);
    }

    PLSyndicationGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "Deleting syndication persistent history", buf, 2u);
    }

    v43 = *(_QWORD *)(a1 + 32);
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v61 = *(id *)(v44 + 40);
    v45 = +[PLPersistentHistoryUtilities deleteHistoryBeforeToken:withContext:error:](PLPersistentHistoryUtilities, "deleteHistoryBeforeToken:withContext:error:", 0, v43, &v61);
    objc_storeStrong((id *)(v44 + 40), v61);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v45;
    v46 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    PLSyndicationGetLog();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v46)
    {
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_WORD *)buf = 0;
      v49 = "Deleted syndication persistent history";
      v50 = v48;
      v51 = OS_LOG_TYPE_DEFAULT;
      v52 = 2;
    }
    else
    {
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v53 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v71 = v53;
      v49 = "Deleting syndication persistent history failed with error: %@";
      v50 = v48;
      v51 = OS_LOG_TYPE_ERROR;
      v52 = 12;
    }
    _os_log_impl(&dword_199541000, v50, v51, v49, buf, v52);
LABEL_29:

    _PLDeleteSyndicationBundleScopeDirectoryAndLogIfFailed(*(void **)(a1 + 40));
    v54 = objc_msgSend(*(id *)(a1 + 32), "hasChanges");
    v55 = *(void **)(a1 + 32);
    if (v54)
    {
      v60 = 0;
      v56 = objc_msgSend(v55, "save:", &v60);
      v57 = v60;
      if ((v56 & 1) == 0)
      {
        PLSyndicationGetLog();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v57, "userInfo");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v71 = "BOOL PLResetSyndicationLibraryWithManagedObjectContext(NSManagedObjectContext *__strong _Nonnull, PLPhot"
                "oLibraryPathManager *__strong _Nonnull, NSError *__autoreleasing * _Nullable)_block_invoke";
          v72 = 2112;
          v73 = v57;
          v74 = 2112;
          v75 = v59;
          _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "%s: failed: %@ %@", buf, 0x20u);

        }
      }

    }
    else
    {
      objc_msgSend(v55, "reset");
    }
    goto LABEL_36;
  }
  PLSyndicationGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v71 = v29;
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Fetch syndication scope assets failed with error %@", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_39:

}

uint64_t __PLResetSyndicationLibraryWithManagedObjectContext_block_invoke_190(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

uint64_t __PLResetSyndicationLibraryWithManagedObjectContext_block_invoke_192(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

@end
