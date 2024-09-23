@implementation TPSDataCacheController

- (id)formattedDataForRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 priority:(float)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int64_t dataType;
  void *v36;
  void *v37;
  double v38;
  NSObject *v39;
  uint64_t v40;
  int64_t v41;
  void *v42;
  void *v43;
  double v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD block[5];
  id v53;
  _QWORD v54[5];
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  TPSDataCacheController *v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  _QWORD v76[4];
  id v77;
  _QWORD aBlock[4];
  id v79;
  id v80;
  id location[2];

  v14 = a3;
  v15 = a4;
  v51 = a5;
  v50 = a6;
  v16 = a8;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke;
  aBlock[3] = &unk_1E395CA68;
  v17 = v16;
  v80 = v17;
  v18 = v15;
  v79 = v18;
  v19 = _Block_copy(aBlock);
  objc_msgSend(v14, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isFileURL"))
  {
    objc_msgSend(v20, "path");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("Empty data path"), -1, 0);
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, 0, 0, v24);

      v25 = 0;
LABEL_35:
      v22 = v25;

      v21 = v22;
      goto LABEL_36;
    }
    if (!v18)
    {
      objc_msgSend(v49, "lastPathComponent");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v72 = 0;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 1;
    if (objc_msgSend(v14, "cachePolicy") == 1 || objc_msgSend(v14, "cachePolicy") == 5)
    {
      v23 = 0;
      goto LABEL_21;
    }
    -[TPSDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", v18);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "fileExistsAtPath:", v28);

    if (v29)
    {
      objc_msgSend(v46, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 && -[TPSDataCacheController isURLValid:](self, "isURLValid:", v31))
      {
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4;
        v66[3] = &unk_1E395CAB8;
        v70 = v19;
        v67 = v46;
        v71 = &v72;
        v68 = v49;
        v69 = self;
        -[TPSDataCacheController formattedDataWithFileURL:completionHandler:](self, "formattedDataWithFileURL:completionHandler:", v31, v66);

        v23 = 1;
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
LABEL_15:
      v32 = v46;
      if (!v46)
      {
        v23 = 0;
        v31 = v47;
LABEL_20:

        if (!*((_BYTE *)v73 + 24) && !-[TPSDataCacheController backgroundOriginUpdate](self, "backgroundOriginUpdate"))
          goto LABEL_25;
LABEL_21:
        if (!objc_msgSend(v20, "isFileURL"))
        {
          +[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v23 & 1) != 0)
          {
            v56 = 0;
            v57 = &v56;
            v58 = 0x3032000000;
            v59 = __Block_byref_object_copy__2;
            v60 = __Block_byref_object_dispose__2;
            v61 = 0;
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3_40;
            v54[3] = &unk_1E395CB30;
            objc_copyWeak(&v55, location);
            v54[4] = &v56;
            v33 = objc_msgSend(v48, "newURLSessionItemWithRequest:identifier:attributionIdentifier:requestType:completionHandler:", v14, v18, v51, v50, v54);
            v34 = (void *)v57[5];
            v57[5] = v33;

            dataType = self->_dataType;
            objc_msgSend((id)v57[5], "sessionTask");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setDataType:", dataType);

            objc_msgSend((id)v57[5], "sessionTask");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v38) = *MEMORY[0x1E0CB3348];
            objc_msgSend(v37, "setPriority:", v38);

            if (v57[5])
            {
              -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
              v39 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_5;
              block[3] = &unk_1E395C9C8;
              objc_copyWeak(&v53, location);
              block[4] = &v56;
              dispatch_async(v39, block);

              objc_destroyWeak(&v53);
              v40 = v57[5];
            }
            else
            {
              v40 = 0;
            }
            objc_msgSend(v48, "resumeSessionItem:", v40);
            objc_destroyWeak(&v55);
            _Block_object_dispose(&v56, 8);

            v25 = 0;
          }
          else
          {
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2_39;
            v62[3] = &unk_1E395CAE0;
            v63 = v19;
            v25 = (void *)objc_msgSend(v48, "newURLSessionItemWithRequest:identifier:attributionIdentifier:requestType:completionHandler:", v14, v18, v51, v50, v62);
            v41 = self->_dataType;
            objc_msgSend(v25, "sessionTask");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setDataType:", v41);

            objc_msgSend(v25, "sessionTask");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v44 = a7;
            objc_msgSend(v43, "setPriority:", v44);

            objc_msgSend(v48, "resumeSessionItem:", v25);
          }

          goto LABEL_34;
        }
        if ((v23 & 1) == 0)
        {
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_38;
          v64[3] = &unk_1E395CA90;
          v65 = v19;
          -[TPSDataCacheController formattedDataWithFileURL:completionHandler:](self, "formattedDataWithFileURL:completionHandler:", v20, v64);
          v25 = 0;

        }
        else
        {
LABEL_25:
          v25 = 0;
        }
LABEL_34:
        _Block_object_dispose(&v72, 8);
        goto LABEL_35;
      }
      -[TPSDataCacheController removeDataCache:](self, "removeDataCache:", v46);
      v23 = 0;
      v31 = v47;
    }
    v32 = v46;
    goto LABEL_20;
  }
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3;
  v76[3] = &unk_1E395CA90;
  v77 = v19;
  -[TPSDataCacheController formattedDataWithFileURL:completionHandler:](self, "formattedDataWithFileURL:completionHandler:", v20, v76);
  v21 = 0;
  v22 = v77;
LABEL_36:

  objc_destroyWeak(location);
  return v21;
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), a2, a3, 0, 0, 0);
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("Invalid data"), -1, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, 0, 0, v4);

  }
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2;
  block[3] = &unk_1E395CA40;
  v25 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 32);
  v21 = v11;
  v26 = a4;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, id, _QWORD))a4 + 2))(a4, a3, 0);
}

- (id)dataCacheForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TPSDataCacheController_dataCacheForIdentifier___block_invoke;
  block[3] = &unk_1E395C0B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)cacheFileURLForDataCache:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cacheFileURLForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[NSString stringByAppendingPathComponent:](self->_cacheDirectory, "stringByAppendingPathComponent:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setLanguageCode:(id)a3
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_languageCode, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_languageCode, a3);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__TPSDataCacheController_setLanguageCode___block_invoke;
    block[3] = &unk_1E395C950;
    block[4] = self;
    v8 = v5;
    v9 = &v10;
    dispatch_sync(v6, block);

    if (*((_BYTE *)v11 + 24))
      -[TPSDataCacheController removeAllDataCache](self, "removeAllDataCache");

    _Block_object_dispose(&v10, 8);
  }

}

uint64_t __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

+ (void)removeAllDataCache
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[TPSCommonDefines appGroupIdentifier](TPSCommonDefines, "appGroupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(v8, "containerURLForSecurityApplicationGroupIdentifier:", v2),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Library/Caches"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "path");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  +[TPSDataCacheController removeDataCacheAtPath:](TPSDataCacheController, "removeDataCacheAtPath:", v7);
}

- (TPSDataCacheController)initWithIdentifier:(id)a3 directoryName:(id)a4 maxCacheSize:(unint64_t)a5 URLSessionDataType:(int64_t)a6
{
  id v11;
  id v12;
  TPSDataCacheController *v13;
  TPSDataCacheController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSUserDefaults *userDefaults;
  uint64_t v23;
  NSString *cacheDirectory;
  NSObject *v25;
  NSString *v26;
  TPSDataCacheController *v27;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v29.receiver = self;
  v29.super_class = (Class)TPSDataCacheController;
  v13 = -[TPSDataCacheController init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    -[TPSDataCacheController commonInit](v13, "commonInit");
    objc_storeStrong((id *)&v14->_identifier, a3);
    v14->_dataType = a6;
    v14->_maxDataCacheSize = a5;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSCommonDefines appGroupIdentifier](TPSCommonDefines, "appGroupIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16
      && (objc_msgSend(v15, "containerURLForSecurityApplicationGroupIdentifier:", v16),
          (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = v17;
      objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("Library/Caches"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v16);
    }
    else
    {
      NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    userDefaults = v14->_userDefaults;
    v14->_userDefaults = (NSUserDefaults *)v21;

    if (v20)
    {
      objc_msgSend(v20, "stringByAppendingPathComponent:", v12);
      v23 = objc_claimAutoreleasedReturnValue();
      cacheDirectory = v14->_cacheDirectory;
      v14->_cacheDirectory = (NSString *)v23;

    }
    if (!v14->_cacheDirectory)
    {

      v27 = 0;
      goto LABEL_14;
    }
    +[TPSLogger default](TPSLogger, "default");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = v14->_cacheDirectory;
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_19A906000, v25, OS_LOG_TYPE_INFO, "Cache directory for %@: %@.", buf, 0x16u);
    }

    -[TPSDataCacheController reloadDataCache](v14, "reloadDataCache");
    -[TPSDataCacheController pruneCache](v14, "pruneCache");

  }
  v27 = v14;
LABEL_14:

  return v27;
}

- (void)reloadDataCache
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1_1(&dword_19A906000, a3, (uint64_t)a3, "Unable to unarchive %@, error: %@", (uint8_t *)&v4);
}

- (void)removeAllDataCache
{
  NSObject *v3;
  _QWORD block[5];

  +[TPSDataCacheController removeDataCacheAtPath:](TPSDataCacheController, "removeDataCacheAtPath:", self->_cacheDirectory);
  -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__TPSDataCacheController_removeAllDataCache__block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_async(v3, block);

  self->_cacheSize = 0;
  -[TPSDataCacheController updateCacheDelay](self, "updateCacheDelay");
  -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", self->_identifier);
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
}

+ (void)removeDataCacheAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumeratorAtPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    objc_msgSend(v5, "nextObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = 0;
      do
      {
        objc_msgSend(v3, "stringByAppendingPathComponent:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v16 = v9;
            v14[0] = MEMORY[0x1E0C809B0];
            v14[1] = 3221225472;
            v14[2] = __48__TPSDataCacheController_removeDataCacheAtPath___block_invoke;
            v14[3] = &unk_1E395C900;
            v15 = v4;
            objc_msgSend(v6, "coordinateWritingItemAtURL:options:error:byAccessor:", v11, 1, &v16, v14);
            v12 = v16;

            v9 = v12;
          }

        }
        objc_msgSend(v5, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v13;
      }
      while (v13);

    }
  }

}

- (void)updateCacheDelay
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id location;
  _QWORD block[6];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__2;
  v9[4] = __Block_byref_object_dispose__2;
  v10 = 0;
  -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSDataCacheController_updateCacheDelay__block_invoke;
  block[3] = &unk_1E395B128;
  block[4] = self;
  block[5] = v9;
  dispatch_sync(v3, block);

  objc_initWeak(&location, self);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __42__TPSDataCacheController_updateCacheDelay__block_invoke_2;
  v5[3] = &unk_1E395C9C8;
  objc_copyWeak(&v6, &location);
  v5[4] = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(v9, 8);

}

- (OS_dispatch_queue)dataCacheSerialQueue
{
  return self->_dataCacheSerialQueue;
}

- (void)setCacheSize:(unint64_t)a3
{
  self->_cacheSize = a3;
}

- (void)pruneCache
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_19A906000, log, OS_LOG_TYPE_DEBUG, "Prune data cache %@.", buf, 0xCu);

}

- (void)createCacheDirectory
{
  void *v3;
  void *v4;
  id v5;
  id *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t *v11;
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", self->_cacheDirectory) & 1) == 0)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_cacheDirectory);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    v6 = (id *)(v14 + 5);
    obj = (id)v14[5];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__TPSDataCacheController_createCacheDirectory__block_invoke;
    v8[3] = &unk_1E395C928;
    v9 = v3;
    v11 = &v13;
    v7 = v4;
    v10 = v7;
    objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", v7, 8, &obj, v8);
    objc_storeStrong(v6, obj);

    _Block_object_dispose(&v13, 8);
  }

}

- (void)commonInit
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dataCacheSerialQueue;
  NSMutableArray *v6;
  NSMutableArray *dataCacheArray;
  NSMutableDictionary *v8;
  NSMutableDictionary *dataCacheMap;
  NSMutableArray *v10;
  NSMutableArray *originFetchItems;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.IPDataCacheControllerSerialQueue", v3);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  self->_dataCacheSerialQueue = v4;

  self->_cacheSize = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  dataCacheArray = self->_dataCacheArray;
  self->_dataCacheArray = v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  dataCacheMap = self->_dataCacheMap;
  self->_dataCacheMap = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  originFetchItems = self->_originFetchItems;
  self->_originFetchItems = v10;

}

void __42__TPSDataCacheController_setLanguageCode___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "languageCode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if ((v8 & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __49__TPSDataCacheController_dataCacheForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__TPSDataCacheController_reloadDataCache__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

void __44__TPSDataCacheController_removeAllDataCache__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (NSMutableDictionary)dataCacheMap
{
  return self->_dataCacheMap;
}

void __42__TPSDataCacheController_updateCacheDelay__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableArray)dataCacheArray
{
  return self->_dataCacheArray;
}

void __41__TPSDataCacheController_reloadDataCache__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "cacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSString)cacheDirectory
{
  return self->_cacheDirectory;
}

void __48__TPSDataCacheController_removeDataCacheAtPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

}

- (void)setBackgroundOriginUpdate:(BOOL)a3
{
  self->_backgroundOriginUpdate = a3;
}

void __42__TPSDataCacheController_updateCacheDelay__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "dataCacheDirty"))
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", WeakRetained, sel_updateCacheDelay, 0);
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v5)
    {
      +[TPSLogger data](TPSLogger, "data");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __42__TPSDataCacheController_updateCacheDelay__block_invoke_2_cold_1(WeakRetained, (uint64_t)v5, v6);
    }
    else
    {
      objc_msgSend(WeakRetained, "userDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v4, v8);

      objc_msgSend(WeakRetained, "userDefaults");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject synchronize](v6, "synchronize");
    }

    objc_msgSend(WeakRetained, "setDataCacheDirty:", 0);
  }

}

- (BOOL)dataCacheDirty
{
  return self->_dataCacheDirty;
}

void __46__TPSDataCacheController_createCacheDirectory__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id obj;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    +[TPSLogger data](TPSLogger, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[5];
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl(&dword_19A906000, v6, OS_LOG_TYPE_DEFAULT, "Unable to create path %@", buf, 0xCu);
    }

  }
}

- (id)formattedDataForPath:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 priority:(float)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12
    && (v16 = (void *)MEMORY[0x1E0CB39E0],
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "requestWithURL:", v17),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v18))
  {
    *(float *)&v19 = a6;
    -[TPSDataCacheController formattedDataForRequest:identifier:attributionIdentifier:requestType:priority:completionHandler:](self, "formattedDataForRequest:identifier:attributionIdentifier:requestType:priority:completionHandler:", v18, v13, v14, CFSTR("asset"), v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __107__TPSDataCacheController_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler___block_invoke;
    v22[3] = &unk_1E395CB58;
    v24 = v15;
    v23 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

    v20 = 0;
    v18 = v24;
  }

  return v20;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_3 != -1)
    dispatch_once(&sharedInstance_predicate_3, &__block_literal_global_11);
  return (id)sharedInstance_gTPSDataCacheController;
}

void __40__TPSDataCacheController_sharedInstance__block_invoke()
{
  TPSDataCacheController *v0;
  void *v1;

  v0 = -[TPSDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([TPSDataCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("TPSDataCacheIdentifier"), CFSTR("Data"), 5242880, 0);
  v1 = (void *)sharedInstance_gTPSDataCacheController;
  sharedInstance_gTPSDataCacheController = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[TPSDataCacheController cancelAllOriginSessionItems](self, "cancelAllOriginSessionItems");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateCacheDelay, 0);
  v3.receiver = self;
  v3.super_class = (Class)TPSDataCacheController;
  -[TPSDataCacheController dealloc](&v3, sel_dealloc);
}

- (TPSDataCacheController)init
{
  TPSDataCacheController *v2;
  TPSDataCacheController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSDataCacheController;
  v2 = -[TPSDataCacheController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSDataCacheController commonInit](v2, "commonInit");
  return v3;
}

- (void)syncCacheImmediately
{
  -[TPSDataCacheController updateCacheDelay](self, "updateCacheDelay");
  -[TPSDataCacheController cancelAllOriginSessionItems](self, "cancelAllOriginSessionItems");
}

- (BOOL)isDataCacheValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  -[TPSDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "fileExistsAtPath:", v8))
      v9 = objc_msgSend(v4, "expired") ^ 1;
    else
      LOBYTE(v9) = 0;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)cacheValidForIdentifier:(id)a3
{
  void *v4;
  BOOL v5;

  -[TPSDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[TPSDataCacheController isDataCacheValid:](self, "isDataCacheValid:", v4);
  else
    v5 = 0;

  return v5;
}

void __41__TPSDataCacheController_reloadDataCache__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 48));

}

void __41__TPSDataCacheController_reloadDataCache__block_invoke_27(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

}

void __36__TPSDataCacheController_pruneCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)updateCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__TPSDataCacheController_updateCache__block_invoke;
  block[3] = &unk_1E395B100;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __37__TPSDataCacheController_updateCache__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDataCacheDirty:", 1);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_updateCacheDelay, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel_updateCacheDelay, 0, 2.0);
}

- (void)addDataCache:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__TPSDataCacheController_addDataCache___block_invoke;
    block[3] = &unk_1E395C9A0;
    block[4] = self;
    v10 = v4;
    v7 = v8;
    v11 = v7;
    dispatch_sync(v6, block);

    self->_cacheSize += objc_msgSend(v7, "fileSize");
  }
  -[TPSDataCacheController updateCache](self, "updateCache");

}

void __39__TPSDataCacheController_addDataCache___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 48));

}

- (void)cancelAllOriginSessionItems
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_originFetchItems, "count"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = 0;
    -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__TPSDataCacheController_cancelAllOriginSessionItems__block_invoke;
    block[3] = &unk_1E395B128;
    block[4] = self;
    block[5] = &v15;
    dispatch_sync(v3, block);

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (id)v16[5];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          +[TPSURLSessionManager defaultManager](TPSURLSessionManager, "defaultManager", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cancelSessionItem:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
      }
      while (v5);
    }

    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __53__TPSDataCacheController_cancelAllOriginSessionItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
}

- (void)removeCacheForIdentifier:(id)a3
{
  id v4;

  -[TPSDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSDataCacheController removeDataCache:](self, "removeDataCache:", v4);

}

- (void)removeDataCache:(id)a3
{
  -[TPSDataCacheController removeDataCache:updateCache:](self, "removeDataCache:updateCache:", a3, 1);
}

- (void)removeDataCache:(id)a3 updateCache:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  TPSDataCacheController *v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD block[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2;
    v39 = __Block_byref_object_dispose__2;
    v40 = 0;
    -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke;
    block[3] = &unk_1E395C0B8;
    v34 = &v35;
    block[4] = self;
    v11 = v8;
    v33 = v11;
    dispatch_sync(v9, block);

    if (v36[5])
    {
      -[TPSDataCacheController cacheFileURLForDataCache:](self, "cacheFileURLForDataCache:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "fileExistsAtPath:", v15);

        if (v16)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0CB3600]);
          v31 = 0;
          v29[0] = v10;
          v29[1] = 3221225472;
          v29[2] = __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_2;
          v29[3] = &unk_1E395C900;
          v30 = v13;
          objc_msgSend(v17, "coordinateWritingItemAtURL:options:error:byAccessor:", v12, 1, &v31, v29);
          v18 = v31;

        }
      }

    }
    self->_cacheSize -= objc_msgSend(v7, "fileSize");
    -[TPSDataCacheController dataCacheSerialQueue](self, "dataCacheSerialQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v22 = 3221225472;
    v23 = __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_3;
    v24 = &unk_1E395C9F0;
    v25 = self;
    v26 = v7;
    v28 = &v35;
    v20 = v11;
    v27 = v20;
    dispatch_async(v19, &v21);

    if (v4)
      -[TPSDataCacheController updateCache](self, "updateCache", v21, v22, v23, v24, v25, v26);

    _Block_object_dispose(&v35, 8);
  }

}

void __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "path");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

}

void __54__TPSDataCacheController_removeDataCache_updateCache___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dataCacheArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataCacheMap");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  }
}

- (id)newDataCache
{
  TPSDataCache *v2;

  v2 = objc_alloc_init(TPSDataCache);
  -[TPSDataCache setCacheType:](v2, "setCacheType:", 0);
  -[TPSDataCache setMaxAge:](v2, "setMaxAge:", 21600);
  return v2;
}

- (id)saveFileURL:(id)a3 identifier:(id)a4 fileSize:(unint64_t)a5 lastModified:(id)a6 dataCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  unint64_t v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  char v48;
  id obj;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v17 = 0;
  if (v12 && v13)
  {
    v39 = a5;
    v40 = v15;
    v18 = v15;
    objc_msgSend(v18, "lastModified");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v14);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDataCacheController cacheFileURLForIdentifier:](self, "cacheFileURLForIdentifier:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v22 = objc_claimAutoreleasedReturnValue();
    v41 = v21;
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v17, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v21, "fileExistsAtPath:", v24);

      if ((v20 & v25 & 1) != 0)
      {
        v26 = v17;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUpdatedDate:", v27);

        -[TPSDataCacheController updateCache](self, "updateCache");
LABEL_19:
        v16 = v40;

        goto LABEL_20;
      }
    }
    else
    {
      LOBYTE(v25) = 0;
    }
    v28 = v17;
    -[TPSDataCacheController createCacheDirectory](self, "createCacheDirectory");
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__2;
    v54 = __Block_byref_object_dispose__2;
    v55 = 0;
    v29 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    if (!v28)
    {
LABEL_18:

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);
      goto LABEL_19;
    }
    v30 = (id *)(v51 + 5);
    obj = (id)v51[5];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __81__TPSDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke;
    v42[3] = &unk_1E395CA18;
    v48 = v25;
    v43 = v41;
    v46 = &v50;
    v31 = v28;
    v32 = v29;
    v33 = v31;
    v44 = v31;
    v45 = v12;
    v47 = &v56;
    v34 = v33;
    v35 = v33;
    v29 = v32;
    objc_msgSend(v32, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v34, 1, v35, 2, &obj, v42);
    objc_storeStrong(v30, obj);
    if (v18)
    {
      if (*((_BYTE *)v57 + 24))
      {
        -[TPSDataCacheController setCacheSize:](self, "setCacheSize:", -[TPSDataCacheController cacheSize](self, "cacheSize") - objc_msgSend(v18, "fileSize"));
        -[TPSDataCacheController setCacheSize:](self, "setCacheSize:", -[TPSDataCacheController cacheSize](self, "cacheSize") + v39);
LABEL_15:
        objc_msgSend(v18, "setLastModified:", v14);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setUpdatedDate:", v37);

        objc_msgSend(v18, "setFileSize:", v39);
        if (v18)
          -[TPSDataCacheController addDataCache:](self, "addDataCache:", v18);

        goto LABEL_18;
      }
      -[TPSDataCacheController removeDataCache:](self, "removeDataCache:", v18);

    }
    else if (*((_BYTE *)v57 + 24))
    {
      v18 = -[TPSDataCacheController newDataCache](self, "newDataCache");
      -[TPSDataCacheController languageCode](self, "languageCode");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLanguageCode:", v36);

      objc_msgSend(v18, "setIdentifier:", v13);
      goto LABEL_15;
    }
    v18 = 0;
    goto LABEL_15;
  }
LABEL_20:

  return v17;
}

void __81__TPSDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  id v24;
  id obj;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 72))
  {
    if (v5)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v8 + 40);
      objc_msgSend(v7, "removeItemAtURL:error:", v5, &obj);
      objc_storeStrong((id *)(v8 + 40), obj);
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      +[TPSLogger default](TPSLogger, "default");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v27 = v10;
        v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_19A906000, v9, OS_LOG_TYPE_DEFAULT, "Unable to delete %@. Error: %@", buf, 0x16u);
      }

    }
  }
  if (!v6)
    goto LABEL_13;
  objc_msgSend(v6, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v24 = *(id *)(v15 + 40);
  objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v24);
  objc_storeStrong((id *)(v15 + 40), v24);

  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
  {
    v17 = *(void **)(a1 + 32);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(id *)(v18 + 40);
    objc_msgSend(v17, "moveItemAtURL:toURL:error:", v16, v6, &v23);
    objc_storeStrong((id *)(v18 + 40), v23);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      goto LABEL_17;
    }
    +[TPSLogger default](TPSLogger, "default");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      v21 = "Unable to move cache data %@";
LABEL_15:
      _os_log_impl(&dword_19A906000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    }
  }
  else
  {
LABEL_13:
    +[TPSLogger default](TPSLogger, "default");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      v21 = "Unable to save cache data %@ due to missing URL";
      goto LABEL_15;
    }
  }

LABEL_17:
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "lastModified");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id, uint64_t, void *, _QWORD))(v7 + 16))(v7, v5, v6, 1, v8, 0);

    +[TPSLogger data](TPSLogger, "data");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_19A906000, v9, OS_LOG_TYPE_DEFAULT, "Data cache exists for %@", (uint8_t *)&v15, 0xCu);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "expired") & 1) != 0)
    {
      +[TPSLogger default](TPSLogger, "default");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_cold_1(a1, (id *)(a1 + 32), v11);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setUpdatedDate:", v14);

      objc_msgSend(*(id *)(a1 + 48), "updateCache");
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 48), "removeDataCache:", *(_QWORD *)(a1 + 32));
    v12 = *(_QWORD *)(a1 + 56);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("Invalid data cache"), -1, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, 0, 0, v13);

  }
}

uint64_t __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_2_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_3_40(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataCacheSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_41;
  v5[3] = &unk_1E395CB08;
  v4 = *(_QWORD *)(a1 + 32);
  v5[4] = WeakRetained;
  v5[5] = v4;
  dispatch_async(v3, v5);

}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_41(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "originFetchItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "originFetchItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __107__TPSDataCacheController_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("Invalid request"), -1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v1 + 16))(v1, v2, 0, 0, 0, 0, v3);

}

- (BOOL)isURLValid:(id)a3
{
  return a3 != 0;
}

- (id)formattedDataWithData:(id)a3
{
  return a3;
}

- (id)formattedDataWithFileURL:(id)a3
{
  return a3;
}

- (void)excludeURLFromBackup:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C999D8];
  v8 = 0;
  v5 = objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v4, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    +[TPSLogger data](TPSLogger, "data");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19A906000, v7, OS_LOG_TYPE_DEFAULT, "Unable to exclude %@ from backup due to error %@", buf, 0x16u);
    }

  }
}

- (BOOL)backgroundOriginUpdate
{
  return self->_backgroundOriginUpdate;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setDataCacheArray:(id)a3
{
  objc_storeStrong((id *)&self->_dataCacheArray, a3);
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (unint64_t)maxDataCacheSize
{
  return self->_maxDataCacheSize;
}

- (void)setMaxDataCacheSize:(unint64_t)a3
{
  self->_maxDataCacheSize = a3;
}

- (void)setDataCacheDirty:(BOOL)a3
{
  self->_dataCacheDirty = a3;
}

- (void)setDataCacheSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataCacheSerialQueue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void)setDataCacheMap:(id)a3
{
  objc_storeStrong((id *)&self->_dataCacheMap, a3);
}

- (void)setCacheDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirectory, a3);
}

- (NSMutableArray)originFetchItems
{
  return self->_originFetchItems;
}

- (void)setOriginFetchItems:(id)a3
{
  objc_storeStrong((id *)&self->_originFetchItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originFetchItems, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_dataCacheMap, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dataCacheSerialQueue, 0);
  objc_storeStrong((id *)&self->_dataCacheArray, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

void __42__TPSDataCacheController_updateCacheDelay__block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataCacheArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_1_1(&dword_19A906000, a3, v6, "Unable to archive %@, error: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0_1();
}

void __122__TPSDataCacheController_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler___block_invoke_4_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*a2, "updatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_19A906000, a3, OS_LOG_TYPE_DEBUG, "Data cache expired for %@.  Last update on %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

@end
