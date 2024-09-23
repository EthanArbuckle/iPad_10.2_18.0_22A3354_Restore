@implementation PLCanEnableCloudPhotoLibraryForAccount

void __PLCanEnableCloudPhotoLibraryForAccount_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "librarySizesFromDB");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E375F390, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "longLongValue");

}

void __PLCanEnableCloudPhotoLibraryForAccount_block_invoke_251(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLPreferencesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v33 = 138412290;
      v34 = (uint64_t)v6;
      v8 = "Unable to check storage status due to quota check error: %@";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 12;
LABEL_19:
      _os_log_impl(&dword_199541000, v9, v10, v8, (uint8_t *)&v33, v11);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v12 = objc_msgSend(v5, "totalBytes");
  v13 = objc_msgSend(v5, "availableBytes");
  v14 = objc_msgSend(v5, "cameraRollBackupBytes");
  v15 = objc_msgSend(v5, "iCloudPhotosBytes");
  PLPreferencesGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v33 = 134217984;
    v34 = v17;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Calculated size of local photo library: %lld bytes", (uint8_t *)&v33, 0xCu);
  }

  PLPreferencesGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v33 = 134217984;
    v34 = v12;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "Total Tier Storage:                     %lld bytes", (uint8_t *)&v33, 0xCu);
  }

  PLPreferencesGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v33 = 134217984;
    v34 = v13;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "Available iCloud Storage:               %lld bytes", (uint8_t *)&v33, 0xCu);
  }

  PLPreferencesGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v33 = 134217984;
    v34 = v14;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "Camera Roll Backup Size:                %lld bytes", (uint8_t *)&v33, 0xCu);
  }
  v21 = v14 + v13;

  PLPreferencesGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v33 = 134217984;
    v34 = v15;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "iCloud Photos Size:                     %lld bytes", (uint8_t *)&v33, 0xCu);
  }
  v23 = v21 + v15;

  PLPreferencesGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v33 = 134217984;
    v34 = v23;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "Total Available Space for Photos:       %lld bytes", (uint8_t *)&v33, 0xCu);
  }

  v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v23 > v25)
  {
    PLPreferencesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v33) = 0;
      v8 = "Can enable CPL: Sufficient cloud storage for local library.";
      v9 = v7;
      v10 = OS_LOG_TYPE_INFO;
      v11 = 2;
      goto LABEL_19;
    }
LABEL_20:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
  PLPreferencesGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
  if (v12 <= v25)
  {
    if (v27)
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Cannot enable CPL: Insufficient cloud storage tier for local library.", (uint8_t *)&v33, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _insufficientStorageError(v5, v31, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v27)
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Cannot enable CPL: Insufficient cloud storage for local library.", (uint8_t *)&v33, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "iCloudPhotosBytes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _insufficientStorageError(v5, v29, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
LABEL_21:

}

@end
