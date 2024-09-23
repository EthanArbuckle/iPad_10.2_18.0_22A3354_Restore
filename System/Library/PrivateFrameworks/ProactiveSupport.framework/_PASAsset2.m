@implementation _PASAsset2

- (id)filesystemPathForAssetDataRelativePath:(id)a3
{
  return -[_PASAsset2 filesystemPathForAssetDataRelativePath:assetVersion:](self, "filesystemPathForAssetDataRelativePath:assetVersion:", a3, 0);
}

- (id)_maFilesystemPathsForAssetDataRelativePaths:(id)a3 guardedData:(id)a4 isMissingData:(BOOL *)a5 assetVersion:(unint64_t *)a6
{
  id v10;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *logHandle;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t *v36;
  id v37;
  BOOL *v38;
  id v39;
  id obj;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (unint64_t *)a4;
  v12 = v11;
  v38 = a5;
  *a5 = 0;
  if (a6)
    *a6 = v11[3];
  v13 = (void *)v11[5];
  if (v13)
  {
    objc_msgSend(v13, "getLocalUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = objc_claimAutoreleasedReturnValue();

    logHandle = self->_logHandle;
    v42 = (void *)v15;
    if (v15)
    {
      v36 = v12;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        v32 = logHandle;
        -[_PASAsset2 _assetDescription](self, "_assetDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v33;
        v51 = 2112;
        v52 = v42;
        _os_log_debug_impl(&dword_1A0957000, v32, OS_LOG_TYPE_DEBUG, "Attempting to use installed MAAsset for \"%@\" at path: %@", buf, 0x16u);

      }
      v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v37 = v10;
      obj = v10;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v17)
      {
        v18 = v17;
        v41 = *(_QWORD *)v46;
        v19 = *MEMORY[0x1E0C99A10];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v46 != v41)
              objc_enumerationMutation(obj);
            v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v42, "stringByAppendingPathComponent:", v21, v36);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = self->_logHandle;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v22;
              _os_log_debug_impl(&dword_1A0957000, v23, OS_LOG_TYPE_DEBUG, "Checking for readable MAAsset file at path: %@", buf, 0xCu);
            }
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v22);
            v43 = 0;
            v44 = 0;
            objc_msgSend(v24, "getResourceValue:forKey:error:", &v44, v19, &v43);
            v25 = v44;
            v26 = v43;
            v27 = objc_msgSend(v25, "BOOLValue");
            v28 = self->_logHandle;
            if (v27)
            {
              if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v22;
                _os_log_debug_impl(&dword_1A0957000, v28, OS_LOG_TYPE_DEBUG, "Verified that MAAsset path was readable: %@", buf, 0xCu);
              }
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v22, v21);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEFAULT))
              {
                v29 = v28;
                -[_PASAsset2 _assetDescription](self, "_assetDescription");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v50 = v30;
                v51 = 2112;
                v52 = v22;
                v53 = 2112;
                v54 = v26;
                _os_log_impl(&dword_1A0957000, v29, OS_LOG_TYPE_DEFAULT, "MAAsset for \"%@\" has missing or unreadable file at path: %@. Error: %@", buf, 0x20u);

              }
              *v38 = 1;
            }

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v18);
      }

      v12 = v36;
      v10 = v37;
    }
    else
    {
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        v34 = logHandle;
        -[_PASAsset2 _assetDescription](self, "_assetDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v35;
        _os_log_error_impl(&dword_1A0957000, v34, OS_LOG_TYPE_ERROR, "MobileAsset reports asset available for \"%@\" but local URL is nil.", buf, 0xCu);

      }
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)_defaultBundleFilesystemPathsForAssetDataRelativePaths:(id)a3 guardedData:(id)a4 assetVersion:(unint64_t *)a5
{
  id v8;
  unint64_t *v9;
  unint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *logHandle;
  void *v19;
  id v20;
  id v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  unint64_t *v27;
  id v28;
  id v29;
  id obj;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unint64_t *)a4;
  v10 = v9;
  if (a5)
    *a5 = v9[2];
  v11 = (void *)v9[1];
  if (v11)
  {
    v27 = v10;
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("AssetData"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v12)
    {
      v13 = v12;
      v31 = *(_QWORD *)v36;
      v14 = *MEMORY[0x1E0C99A10];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v31)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v32, "stringByAppendingPathComponent:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v17;
            _os_log_debug_impl(&dword_1A0957000, logHandle, OS_LOG_TYPE_DEBUG, "Checking for readable default bundle asset file at path: %@", buf, 0xCu);
          }
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v17);
          v33 = 0;
          v34 = 0;
          objc_msgSend(v19, "getResourceValue:forKey:error:", &v34, v14, &v33);
          v20 = v34;
          v21 = v33;
          v22 = objc_msgSend(v20, "BOOLValue");
          v23 = self->_logHandle;
          if (v22)
          {
            if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v17;
              _os_log_debug_impl(&dword_1A0957000, v23, OS_LOG_TYPE_DEBUG, "Verified that default bundle asset path was readable: %@", buf, 0xCu);
            }
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, v16);
          }
          else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            -[_PASAsset2 _assetDescription](self, "_assetDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v40 = v25;
            v41 = 2112;
            v42 = v17;
            v43 = 2112;
            v44 = v21;
            _os_log_impl(&dword_1A0957000, v24, OS_LOG_TYPE_DEFAULT, "Default bundle asset for \"%@\" has missing or unreadable file at path: %@. Error: %@", buf, 0x20u);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v13);
    }

    v10 = v27;
    v8 = v28;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)filesystemPathForAssetDataRelativePath:(id)a3 assetVersion:(unint64_t *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativePath"));

  }
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASAsset2 filesystemPathsForAssetDataRelativePaths:assetVersion:](self, "filesystemPathsForAssetDataRelativePaths:assetVersion:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)filesystemPathsForAssetDataRelativePaths:(id)a3 assetVersion:(unint64_t *)a4
{
  id v7;
  _PASLock *lock;
  id v9;
  uint64_t v10;
  id v11;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativePaths"));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3867;
  v22 = __Block_byref_object_dispose__3868;
  v23 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68___PASAsset2_filesystemPathsForAssetDataRelativePaths_assetVersion___block_invoke;
  v14[3] = &unk_1E4430FC0;
  v16 = &v18;
  v14[4] = self;
  v9 = v7;
  v15 = v9;
  v17 = a4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend((id)v19[5], "count");
    if (a4)
    {
      if (!v10)
        *a4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)registerUpdateHandler:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  -[_PASNotificationTracker registerWithQueue:handler:](self->_updateNotificationTracker, "registerWithQueue:handler:", self->_notificationQueue, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7
{
  return -[_PASAsset2 initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:](self, "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:", a3, a4, a5, a6, a7, 1);
}

- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7 enableAssetUpdates:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[_PASAsset2 initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:](self, "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:", a3, a4, a5, a6, a7, a8, v9);
}

- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7 enableAssetUpdates:(BOOL)a8 purgeObsoleteInstalledAssets:(BOOL)a9
{
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  _PASAsset2 *v25;
  id v26;
  id v27;
  NSObject *v28;
  void (**v29)(_QWORD);
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _PASAsset2 *v37;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  BOOL v44;
  id v45;
  _PASAsset2 *v46;
  id v47;
  _QWORD v48[4];
  _PASAsset2 *v49;
  id v50;
  id v51;
  id v52;
  NSObject *v53;
  BOOL v54;
  id v55;
  uint8_t buf[4];
  const __CFString *v57;
  __int16 v58;
  __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v16 = (__CFString *)a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (v16)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetTypeDescriptorPath"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationQueue"));

LABEL_3:
  v21 = (void *)MEMORY[0x1E0C81028];
  if (v20)
    v21 = v20;
  v22 = v21;

  v55 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v16, 0, &v55);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (__CFString *)v55;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __162___PASAsset2_initWithAssetTypeDescriptorPath_defaultBundlePath_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke;
  v48[3] = &unk_1E4430ED0;
  v25 = self;
  v49 = v25;
  v45 = v17;
  v50 = v45;
  v26 = v18;
  v51 = v26;
  v27 = v19;
  v52 = v27;
  v28 = v22;
  v53 = v28;
  v54 = a9;
  v29 = (void (**)(_QWORD))MEMORY[0x1A1AFDE78](v48);
  v46 = v25;
  if (!v23)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v16;
      v58 = 2112;
      v59 = v24;
      _os_log_fault_impl(&dword_1A0957000, v28, OS_LOG_TYPE_FAULT, "Could not read asset type descriptor \"%@\": %@", buf, 0x16u);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v29[2](v29);
      v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
      v31 = v24;
      goto LABEL_28;
    }
    goto LABEL_40;
  }
  v44 = a8;
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v23, 0, 0, &v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (__CFString *)v47;

  if (!v31)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Asset Type"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v32, "length"))
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Supported Compatibility Version"));
            v33 = objc_claimAutoreleasedReturnValue();
            v43 = (void *)v33;
            if (v33
              && (v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (objc_msgSend(v34, "integerValue") & 0x8000000000000000) == 0)
            {
              v42 = v30;
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Uniquely Identifying Keys"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "count");

              if (objc_msgSend(v26, "count") && !v36 && os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v57 = v16;
                _os_log_impl(&dword_1A0957000, v28, OS_LOG_TYPE_DEFAULT, "Warning: asset type descriptor %@ has no Uniquely Identifying Keys, but usage suggests that it should.", buf, 0xCu);
              }
              BYTE1(v41) = a9;
              LOBYTE(v41) = v44;
              v37 = (_PASAsset2 *)-[_PASAsset2 _initWithAssetTypeIdentifier:defaultBundlePath:compatibilityVersion:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:](v46, "_initWithAssetTypeIdentifier:defaultBundlePath:compatibilityVersion:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:", v32, v45, objc_msgSend(v43, "unsignedIntegerValue"), v26, v27, v28, v41);
              v46 = v37;
              v30 = v42;
            }
            else
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v57 = CFSTR("Supported Compatibility Version");
                v58 = 2112;
                v59 = v16;
                _os_log_error_impl(&dword_1A0957000, v28, OS_LOG_TYPE_ERROR, "Missing or ill-formatted property \"%@\" in asset type descriptor %@", buf, 0x16u);
              }
              v29[2](v29);
              v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_33;
          }
        }
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v57 = CFSTR("Asset Type");
        v58 = 2112;
        v59 = v16;
        _os_log_fault_impl(&dword_1A0957000, v28, OS_LOG_TYPE_FAULT, "Missing or ill-formatted property \"%@\" in asset type descriptor %@", buf, 0x16u);
      }
      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v29[2](v29);
        v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
LABEL_33:

        goto LABEL_23;
      }
LABEL_40:
      abort();
    }
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v16;
    v58 = 2112;
    v59 = v31;
    _os_log_fault_impl(&dword_1A0957000, v28, OS_LOG_TYPE_FAULT, "Could not decode asset type descriptor at %@: %@", buf, 0x16u);
  }
  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_40;
  v29[2](v29);
  v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_28:
  return v37;
}

- (id)_initWithAssetTypeIdentifier:(id)a3 defaultBundlePath:(id)a4 compatibilityVersion:(unint64_t)a5 matchingKeysAndValues:(id)a6 notificationQueue:(id)a7 logHandle:(id)a8 enableAssetUpdates:(BOOL)a9 purgeObsoleteInstalledAssets:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  _PASAsset2 *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *assetTypeIdentifier;
  uint64_t v26;
  NSDictionary *requiredMobileAssetProperties;
  NSObject **p_notificationQueue;
  os_log_t *p_logHandle;
  uint64_t v30;
  _PASNotificationTracker *updateNotificationTracker;
  _PASLock *v32;
  _PASLock *lock;
  _PASLock *v34;
  uint64_t v35;
  int *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  NSObject *v41;
  id v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  NSObject *v46;
  os_log_t v47;
  NSObject *v48;
  void *v49;
  id v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD handler[4];
  id v65;
  id location;
  _QWORD v67[4];
  int *v68;
  objc_super v69;
  uint8_t buf[4];
  unint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v60 = a4;
  v61 = a6;
  v18 = a7;
  v19 = a8;
  if (!v17)
  {
    v51 = v19;
    v52 = v18;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetTypeIdentifier"));

    v18 = v52;
    v19 = v51;
  }
  v58 = v18;
  if (!v18)
  {
    v54 = v19;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notificationQueue"));

    v19 = v54;
  }
  v59 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("logHandle"));

  }
  v69.receiver = self;
  v69.super_class = (Class)_PASAsset2;
  v20 = -[_PASAsset2 init](&v69, sel_init);
  if (v20)
  {
    v21 = objc_opt_new();
    v22 = objc_msgSend(v60, "copy");
    v23 = *(void **)(v21 + 8);
    *(_QWORD *)(v21 + 8) = v22;

    *(_BYTE *)(v21 + 48) = a10;
    objc_storeStrong((id *)&v20->_defaultBundlePathBackup, *(id *)(v21 + 8));
    v24 = objc_msgSend(v17, "copy");
    assetTypeIdentifier = v20->_assetTypeIdentifier;
    v20->_assetTypeIdentifier = (NSString *)v24;

    v20->_compatibilityVersion = a5;
    if (v61)
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v61, 1);
      requiredMobileAssetProperties = v20->_requiredMobileAssetProperties;
      v20->_requiredMobileAssetProperties = (NSDictionary *)v26;
    }
    else
    {
      requiredMobileAssetProperties = v20->_requiredMobileAssetProperties;
      v20->_requiredMobileAssetProperties = 0;
    }

    p_notificationQueue = (NSObject **)&v20->_notificationQueue;
    objc_storeStrong((id *)&v20->_notificationQueue, a7);
    p_logHandle = (os_log_t *)&v20->_logHandle;
    objc_storeStrong((id *)&v20->_logHandle, a8);
    v30 = objc_opt_new();
    updateNotificationTracker = v20->_updateNotificationTracker;
    v20->_updateNotificationTracker = (_PASNotificationTracker *)v30;

    v32 = -[_PASLock initWithGuardedData:]([_PASLock alloc], "initWithGuardedData:", v21);
    lock = v20->_lock;
    v20->_lock = v32;

    v34 = v20->_lock;
    v35 = MEMORY[0x1E0C809B0];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke;
    v67[3] = &unk_1E4430EF8;
    v36 = v20;
    v68 = v36;
    -[_PASLock runWithLockAcquired:](v34, "runWithLockAcquired:", v67);
    if (a9)
    {
      -[NSString stringByAppendingString:](v20->_assetTypeIdentifier, "stringByAppendingString:", CFSTR(".ma.new-asset-installed"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v36);
      v57 = objc_retainAutorelease(v37);
      v38 = (const char *)objc_msgSend(v57, "UTF8String");
      v39 = *p_notificationQueue;
      handler[0] = v35;
      handler[1] = 3221225472;
      handler[2] = __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_2;
      handler[3] = &unk_1E4430F20;
      objc_copyWeak(&v65, &location);
      v40 = notify_register_dispatch(v38, v36 + 12, v39, handler);
      if (v40)
      {
        v36[12] = -1;
        v41 = *p_logHandle;
        if (os_log_type_enabled(*p_logHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v71 = v40;
          _os_log_error_impl(&dword_1A0957000, v41, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
        }
      }
      -[NSString stringByAppendingString:](v20->_assetTypeIdentifier, "stringByAppendingString:", CFSTR(".ma.cached-metadata-updated"));
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = (const char *)objc_msgSend(v42, "UTF8String");
      v44 = *p_notificationQueue;
      v62[0] = v35;
      v62[1] = 3221225472;
      v62[2] = __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_232;
      v62[3] = &unk_1E4430F20;
      objc_copyWeak(&v63, &location);
      v45 = notify_register_dispatch(v43, v36 + 13, v44, v62);
      if (v45)
      {
        v36[13] = -1;
        v46 = *p_logHandle;
        if (os_log_type_enabled(*p_logHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v71 = v45;
          _os_log_error_impl(&dword_1A0957000, v46, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
        }
      }
      objc_msgSend(v36, "_updateAssetMetadata");
      objc_destroyWeak(&v63);

      objc_destroyWeak(&v65);
      objc_destroyWeak(&location);

    }
    else
    {
      v47 = *p_logHandle;
      if (os_log_type_enabled(*p_logHandle, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        objc_msgSend(v36, "_assetDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v71 = (unint64_t)v49;
        _os_log_impl(&dword_1A0957000, v48, OS_LOG_TYPE_DEFAULT, "Via unit testing override, MobileAsset asset loading has been disabled: %@", buf, 0xCu);

      }
    }

  }
  return v20;
}

- (void)dealloc
{
  int metadataNotificationToken;
  int installNotificationToken;
  objc_super v5;

  metadataNotificationToken = self->_metadataNotificationToken;
  if ((metadataNotificationToken & 0x80000000) == 0)
    notify_cancel(metadataNotificationToken);
  installNotificationToken = self->_installNotificationToken;
  if ((installNotificationToken & 0x80000000) == 0)
    notify_cancel(installNotificationToken);
  v5.receiver = self;
  v5.super_class = (Class)_PASAsset2;
  -[_PASAsset2 dealloc](&v5, sel_dealloc);
}

- (void)downloadMetadataWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  NSObject *logHandle;
  __int16 v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[_PASAsset2 assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      v9 = 0;
      _os_log_error_impl(&dword_1A0957000, logHandle, OS_LOG_TYPE_ERROR, "Unable to download catalog because asset type descriptor is unknown.", (uint8_t *)&v9, 2u);
      if (!v4)
        goto LABEL_6;
    }
    else if (!v4)
    {
      goto LABEL_6;
    }
    v4[2](v4, 0);
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1E0D4E038];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45___PASAsset2_downloadMetadataWithCompletion___block_invoke;
  v10[3] = &unk_1E4430F48;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  objc_msgSend(v7, "startCatalogDownload:then:", v11, v10);

LABEL_6:
}

- (unint64_t)assetVersion
{
  _PASLock *lock;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26___PASAsset2_assetVersion__block_invoke;
  v5[3] = &unk_1E4430F70;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)assetType
{
  NSString *assetTypeIdentifier;

  if (-[NSString isEqualToString:](self->_assetTypeIdentifier, "isEqualToString:", CFSTR("com.apple.MobileAsset.ProactiveSupport.BrokenAssetTypeDescriptor")))
  {
    assetTypeIdentifier = 0;
  }
  else
  {
    assetTypeIdentifier = self->_assetTypeIdentifier;
  }
  return assetTypeIdentifier;
}

- (id)_assetDescription
{
  void *v3;
  void *v4;
  NSDictionary *requiredMobileAssetProperties;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  if (!self->_requiredMobileAssetProperties)
    return self->_assetTypeIdentifier;
  v3 = (void *)MEMORY[0x1A1AFDC98]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](self->_requiredMobileAssetProperties, "count"));
  requiredMobileAssetProperties = self->_requiredMobileAssetProperties;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31___PASAsset2__assetDescription__block_invoke;
  v10[3] = &unk_1E4430F98;
  v11 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](requiredMobileAssetProperties, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(v6, "_pas_componentsJoinedByString:", CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%@]"), self->_assetTypeIdentifier, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (unint64_t)bestAssetVersionObserved
{
  _PASLock *lock;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___PASAsset2_bestAssetVersionObserved__block_invoke;
  v5[3] = &unk_1E4430F70;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_loadDefaultBundleVersionWithGuardedData:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  __CFString *v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  BOOL v22;
  NSObject *logHandle;
  NSObject *v25;
  const __CFString *v26;
  NSString *assetTypeIdentifier;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const __CFString *v31;
  const __CFString *v32;
  const char *v33;
  const __CFString *v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  uint64_t v38;
  unint64_t compatibilityVersion;
  NSObject *v40;
  const __CFString *v41;
  const __CFString *v42;
  int v43;
  void *v44;
  unsigned __int8 v45;
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v4[2] = 0x7FFFFFFFFFFFFFFFLL;
  v5 = (void *)v4[1];
  if (!v5)
    goto LABEL_23;
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
    {
      v28 = v4[1];
      *(_DWORD *)buf = 138412546;
      v47 = CFSTR("Info.plist");
      v48 = 2112;
      v49 = v28;
      _os_log_fault_impl(&dword_1A0957000, logHandle, OS_LOG_TYPE_FAULT, "Unable to load %@ for default bundle at \"%@\".", buf, 0x16u);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {

      goto LABEL_28;
    }
    goto LABEL_55;
  }
  v8 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !-[NSString isEqualToString:](self->_assetTypeIdentifier, "isEqualToString:", v9))
  {
    v21 = self->_logHandle;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v26 = (const __CFString *)v4[1];
      assetTypeIdentifier = self->_assetTypeIdentifier;
      *(_DWORD *)buf = 138412802;
      v47 = v26;
      v48 = 2112;
      v49 = (uint64_t)assetTypeIdentifier;
      v50 = 2112;
      v51 = (unint64_t)v9;
      _os_log_fault_impl(&dword_1A0957000, v21, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" has incorrect bundle identifier (expected %@, actual %@)", buf, 0x20u);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v16 = 1;
      goto LABEL_22;
    }
    goto LABEL_55;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MobileAssetProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if ((objc_msgSend(v11, "intValue") & 0x80000000) == 0)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (objc_msgSend(v12, "unsignedIntegerValue") == self->_compatibilityVersion)
            {
              objc_msgSend((id)v4[1], "stringByAppendingPathComponent:", CFSTR("AssetData"));
              v13 = objc_claimAutoreleasedReturnValue();
              v45 = 0;
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = (void *)v13;
              LODWORD(v13) = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v13, &v45);
              v43 = v45;

              if ((_DWORD)v13 && v43)
              {
                v4[2] = objc_msgSend(v11, "unsignedIntegerValue");
                v15 = self->_logHandle;
                v16 = 0;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  v17 = v15;
                  -[_PASAsset2 _assetDescription](self, "_assetDescription");
                  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v20 = v4[1];
                  v19 = v4[2];
                  *(_DWORD *)buf = 138412802;
                  v47 = v18;
                  v48 = 2048;
                  v49 = v19;
                  v50 = 2112;
                  v51 = v20;
                  _os_log_impl(&dword_1A0957000, v17, OS_LOG_TYPE_DEFAULT, "Loaded default bundle for \"%@\" with version %tu from path: %@", buf, 0x20u);

                  v16 = 0;
                }
                goto LABEL_54;
              }
              v40 = self->_logHandle;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
              {
                v42 = (const __CFString *)v4[1];
                *(_DWORD *)buf = 138412290;
                v47 = v42;
                _os_log_fault_impl(&dword_1A0957000, v40, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" is missing the AssetData subdirectory.", buf, 0xCu);
              }
              if (!_PASEvaluateLogFaultAndProbCrashCriteria())
              {
                v16 = 1;
LABEL_54:

                goto LABEL_43;
              }
LABEL_55:
              abort();
            }
            v35 = self->_logHandle;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              v36 = (const __CFString *)v4[1];
              v37 = v35;
              v38 = objc_msgSend(v12, "unsignedIntegerValue");
              compatibilityVersion = self->_compatibilityVersion;
              *(_DWORD *)buf = 138412802;
              v47 = v36;
              v48 = 2048;
              v49 = v38;
              v50 = 2048;
              v51 = compatibilityVersion;
              _os_log_fault_impl(&dword_1A0957000, v37, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" declares unexpected compatibility version %lu (expected %lu)", buf, 0x20u);

            }
          }
          else
          {
            v30 = self->_logHandle;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              v41 = (const __CFString *)v4[1];
              *(_DWORD *)buf = 138412290;
              v47 = v41;
              _os_log_fault_impl(&dword_1A0957000, v30, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" has missing or ill-formatted _CompatibilityVersion property.", buf, 0xCu);
            }
          }
          if (!_PASEvaluateLogFaultAndProbCrashCriteria())
          {
            v16 = 1;
LABEL_43:

            goto LABEL_37;
          }
          goto LABEL_55;
        }
        v29 = self->_logHandle;
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
LABEL_35:
          if (!_PASEvaluateLogFaultAndProbCrashCriteria())
          {
            v16 = 1;
LABEL_37:

            goto LABEL_38;
          }
          goto LABEL_55;
        }
        v32 = (const __CFString *)v4[1];
        *(_DWORD *)buf = 138412290;
        v47 = v32;
        v33 = "Default bundle at \"%@\" has invalid _ContentVersion property.";
      }
      else
      {
        v29 = self->_logHandle;
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          goto LABEL_35;
        v34 = (const __CFString *)v4[1];
        *(_DWORD *)buf = 138412290;
        v47 = v34;
        v33 = "Default bundle at \"%@\" has missing or ill-formatted _ContentVersion property.";
      }
      _os_log_fault_impl(&dword_1A0957000, v29, OS_LOG_TYPE_FAULT, v33, buf, 0xCu);
      goto LABEL_35;
    }
  }
  v25 = self->_logHandle;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    v31 = (const __CFString *)v4[1];
    *(_DWORD *)buf = 138412290;
    v47 = v31;
    _os_log_fault_impl(&dword_1A0957000, v25, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" has missing or ill-formatted MobileAssetProperties property.", buf, 0xCu);
  }
  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_55;
  v16 = 1;
LABEL_38:

LABEL_22:
  if (v16)
  {
LABEL_28:
    v22 = 0;
    goto LABEL_29;
  }
LABEL_23:
  v22 = 1;
LABEL_29:

  return v22;
}

- (BOOL)deregisterUpdateHandlerWithToken:(id)a3
{
  return a3
      && -[_PASNotificationTracker deregisterHandlerWithToken:](self->_updateNotificationTracker, "deregisterHandlerWithToken:");
}

- (BOOL)deregisterUpdateHandlerAsyncWithToken:(id)a3
{
  return a3
      && -[_PASNotificationTracker deregisterHandlerAsyncWithToken:](self->_updateNotificationTracker, "deregisterHandlerAsyncWithToken:");
}

- (id)filesystemPathsForAssetDataRelativePaths:(id)a3
{
  return -[_PASAsset2 filesystemPathsForAssetDataRelativePaths:assetVersion:](self, "filesystemPathsForAssetDataRelativePaths:assetVersion:", a3, 0);
}

- (void)_updateAssetMetadata
{
  NSObject *logHandle;
  NSObject *v4;
  void *v5;
  void *v6;
  NSDictionary *requiredMobileAssetProperties;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    v4 = logHandle;
    -[_PASAsset2 _assetDescription](self, "_assetDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = (uint64_t)v5;
    _os_log_impl(&dword_1A0957000, v4, OS_LOG_TYPE_INFO, "Updating MobileAsset version information for \"%@\", buf, 0xCu);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", self->_assetTypeIdentifier);
  objc_msgSend(v6, "returnTypes:", 2);
  objc_msgSend(v6, "setDoNotBlockOnNetworkStatus:", 1);
  requiredMobileAssetProperties = self->_requiredMobileAssetProperties;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34___PASAsset2__updateAssetMetadata__block_invoke;
  v17[3] = &unk_1E4430FE8;
  v8 = v6;
  v18 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](requiredMobileAssetProperties, "enumerateKeysAndObjectsUsingBlock:", v17);
  v9 = objc_msgSend(v8, "queryMetaDataSync");
  objc_msgSend(v8, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_logHandle;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = v11;
    v16 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134218240;
    v20 = v9;
    v21 = 2048;
    v22 = v16;
    _os_log_debug_impl(&dword_1A0957000, v15, OS_LOG_TYPE_DEBUG, "MobileAsset query completed with status code %ld; number of results: %lu",
      buf,
      0x16u);

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "results");
    v12 = objc_claimAutoreleasedReturnValue();
    -[_PASAsset2 updateAssetMetadataUsingQueryResults:](self, "updateAssetMetadataUsingQueryResults:", v12);
LABEL_7:

    goto LABEL_11;
  }
  if (!v9)
  {
    v13 = self->_logHandle;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v13;
      -[_PASAsset2 _assetDescription](self, "_assetDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v14;
      _os_log_impl(&dword_1A0957000, v12, OS_LOG_TYPE_DEFAULT, "Warning: MobileAsset metadata query for %@ completed successfully, but nil or empty results returned.", buf, 0xCu);

      goto LABEL_7;
    }
  }
LABEL_11:

}

- (BOOL)updateAssetMetadataUsingQueryResults:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _PASLock *lock;
  id v12;
  BOOL v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  _PASAsset2 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 602, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("results"));

  }
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  v7 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke;
  v24[3] = &unk_1E4431038;
  v24[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_3872);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  lock = self->_lock;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_2;
  v16[3] = &unk_1E44310C8;
  v12 = v10;
  v17 = v12;
  v18 = self;
  v19 = &v20;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);
  if (*((_BYTE *)v21 + 24))
  {
    -[_PASAsset2 _issueUpdateNotificationsWithCallback:](self, "_issueUpdateNotificationsWithCallback:", 0);
    v13 = *((_BYTE *)v21 + 24) != 0;
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)_purgeObsoleteInstalledAssetsFromCandidates:(id)a3 guardedData:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _PASAsset2 *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *logHandle;
  NSObject *v19;
  _QWORD *v20;
  _PASAsset2 *v21;
  void *v22;
  id v23;
  unsigned int (**v24)(_QWORD, _QWORD);
  id obj;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke;
    v32[3] = &unk_1E44310F0;
    v32[4] = self;
    v24 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1A1AFDE78](v32);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = self;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1A1AFDC98]();
          objc_msgSend(v14, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17
            && (unint64_t)objc_msgSend(v17, "unsignedIntegerValue") < v7[3]
            && ((unsigned int (**)(_QWORD, void *))v24)[2](v24, v14))
          {
            logHandle = v11->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              v19 = logHandle;
              -[_PASAsset2 _assetDescription](v11, "_assetDescription");
              v20 = v7;
              v21 = v11;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v34 = v22;
              v35 = 2112;
              v36 = v17;
              _os_log_impl(&dword_1A0957000, v19, OS_LOG_TYPE_DEFAULT, "Requesting purge of installed MAAsset \"%@\" with obsolete version %@.", buf, 0x16u);

              v11 = v21;
              v7 = v20;
              v8 = MEMORY[0x1E0C809B0];

            }
            v26[0] = v8;
            v26[1] = 3221225472;
            v26[2] = __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke_266;
            v26[3] = &unk_1E4431118;
            v26[4] = v11;
            v27 = v17;
            objc_msgSend(v14, "purge:", v26);

          }
          objc_autoreleasePoolPop(v15);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v10);
    }

    v6 = v23;
  }

}

- (void)_issueUpdateNotificationsWithCallback:(id)a3
{
  id v4;
  _PASLock *lock;
  OS_os_log *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52___PASAsset2__issueUpdateNotificationsWithCallback___block_invoke;
  v9[3] = &unk_1E4430F70;
  v9[4] = &v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v6 = self->_logHandle;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v11[3];
    -[_PASAsset2 _assetDescription](self, "_assetDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1A0957000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "MAAsset version %lu for \"%@\" is now installed. Issuing notification.", buf, 0x16u);

  }
  -[_PASNotificationTracker issueNotificationAsyncWithContext:callback:](self->_updateNotificationTracker, "issueNotificationAsyncWithContext:callback:", self, v4);
  _Block_object_dispose(&v10, 8);

}

- (BOOL)overrideDefaultBundleWithBundleAtPath:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  _PASAsset2 *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52___PASAsset2_overrideDefaultBundleWithBundleAtPath___block_invoke;
  v8[3] = &unk_1E44310C8;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  -[_PASAsset2 _issueUpdateNotificationsWithCallback:](self, "_issueUpdateNotificationsWithCallback:", 0);
  LOBYTE(self) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (NSString)bundlePath
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3867;
  v10 = __Block_byref_object_dispose__3868;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24___PASAsset2_bundlePath__block_invoke;
  v5[3] = &unk_1E4430F70;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)invokeWithBundleOverride:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[_PASAsset2 bundlePath](self, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASAsset2 overrideDefaultBundleWithBundleAtPath:](self, "overrideDefaultBundleWithBundleAtPath:", v8);
  dispatch_sync((dispatch_queue_t)self->_notificationQueue, &__block_literal_global_268);
  v6[2](v6);
  -[_PASAsset2 overrideDefaultBundleWithBundleAtPath:](self, "overrideDefaultBundleWithBundleAtPath:", v7);
  dispatch_sync((dispatch_queue_t)self->_notificationQueue, &__block_literal_global_269);

}

- (void)addOverridePath:(id)a3 forResourceWithRelativePath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _PASLock *lock;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASAsset2.m"), 838, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relativePath"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58___PASAsset2_addOverridePath_forResourceWithRelativePath___block_invoke;
  v15[3] = &unk_1E4431180;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v14 = v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);

}

- (void)clearOverrides
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_272);
}

- (void)callAssetUpdateHandlers
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___PASAsset2_callAssetUpdateHandlers__block_invoke;
  v5[3] = &unk_1E44311E8;
  v6 = v3;
  v4 = v3;
  -[_PASAsset2 _issueUpdateNotificationsWithCallback:](self, "_issueUpdateNotificationsWithCallback:", v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_updateNotificationTracker, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_requiredMobileAssetProperties, 0);
  objc_storeStrong((id *)&self->_defaultBundlePathBackup, 0);
  objc_storeStrong((id *)&self->_assetTypeIdentifier, 0);
}

@end
