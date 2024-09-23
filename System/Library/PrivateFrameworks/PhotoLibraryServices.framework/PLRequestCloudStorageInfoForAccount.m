@implementation PLRequestCloudStorageInfoForAccount

void __PLRequestCloudStorageInfoForAccount_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t valuePtr;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "responseDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storage_data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("quota_info_in_bytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLPreferencesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = (uint64_t)v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "iCloud quota response received: status: %@", buf, 0xCu);
  }

  objc_msgSend(v3, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PLPreferencesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error requesting iCloud quota information: %@", buf, 0xCu);
    }

    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("total_available"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    valuePtr = 0;
    CFNumberGetValue((CFNumberRef)v11, kCFNumberSInt64Type, &valuePtr);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("total_used"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt64Type, &v41);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("total_quota"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0;
    CFNumberGetValue((CFNumberRef)v13, kCFNumberSInt64Type, &v40);
    PLPreferencesGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Getting CameraRoll backup size...", buf, 2u);
    }

    v15 = objc_alloc_init(MEMORY[0x1E0D4E0A8]);
    objc_msgSend(v15, "domainInfoForName:", CFSTR("CameraRollDomain"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "remoteSize");
    PLPreferencesGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v45 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "CameraRoll backup size: %lld bytes", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("storage_usage_by_media"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v16;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      if (v21)
      {
        v22 = v21;
        v31 = v15;
        v32 = a1;
        v33 = v4;
        v23 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("media_key"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v26, "isEqualToString:", CFSTR("photos")))
            {
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("usage_in_bytes"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = objc_msgSend(v27, "longLongValue");

                goto LABEL_26;
              }

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
          if (v22)
            continue;
          break;
        }
        v28 = 0;
LABEL_26:
        v4 = v33;
        a1 = v32;
        v15 = v31;
      }
      else
      {
        v28 = 0;
      }

      v16 = v34;
      v8 = 0;
    }
    else
    {
      v28 = 0;
    }
    +[PLCloudStorageInfo storageInfoWithTotal:available:used:cameraRollBackupBytes:iCloudPhotosSize:hasMaxQuotaTier:](PLCloudStorageInfo, "storageInfoWithTotal:available:used:cameraRollBackupBytes:iCloudPhotosSize:hasMaxQuotaTier:", v40, valuePtr, v41, v17, v28, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLPreferencesGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v10;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_INFO, "Cloud storage info: %@", buf, 0xCu);
    }

  }
  v30 = *(_QWORD *)(a1 + 32);
  if (v30)
    (*(void (**)(uint64_t, void *, void *))(v30 + 16))(v30, v10, v8);

}

uint64_t __PLRequestCloudStorageInfoForAccount_block_invoke_217()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_WorkQueue;
  _WorkQueue = v0;

  objc_msgSend((id)_WorkQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)_WorkQueue, "setQualityOfService:", 9);
}

@end
