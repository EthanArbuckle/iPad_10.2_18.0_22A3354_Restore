@implementation PNRResourceManager

- (void)lookupISOCountryCodeFromNANPNumber:(id)a3 logId:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__PNRResourceManager_lookupISOCountryCodeFromNANPNumber_logId_withResult___block_invoke;
  v12[3] = &unk_24F4D25D0;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v10 = v8;
  v11 = v9;
  -[PNRResourceManager openNANPFileUsingLogId:withResult:](self, "openNANPFileUsingLogId:withResult:", a4, v12);

}

void __74__PNRResourceManager_lookupISOCountryCodeFromNANPNumber_logId_withResult___block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  char v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v4 = (_DWORD *)objc_msgSend(objc_retainAutorelease(a2), "bytes");
    if (*v4 == 1347305806)
    {
      v11 = 0;
      v10 = 0;
      if ((objc_msgSend(*(id *)(a1 + 32), "_lookupString:inTrieMemory:value:", *(_QWORD *)(a1 + 40), v4 + 8, &v10) & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", &v10, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v5, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "_PNRNotFoundErrorWithUserInfo:", &unk_24F4D3DE0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v5);
      }
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v4, 4, 1);
      v6 = (void *)MEMORY[0x24BDD1540];
      v12[0] = CFSTR("expected");
      v12[1] = CFSTR("found");
      v13[0] = CFSTR("NANP");
      v13[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_PNRBadMagicErrorWithUserInfo:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __62__PNRResourceManager_lookupCCForPhoneNumber_logId_withResult___block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v4 = (_DWORD *)objc_msgSend(objc_retainAutorelease(a2), "bytes");
    if (*v4 == 1329811267)
    {
      v10 = 0;
      if ((objc_msgSend(*(id *)(a1 + 32), "_lookupString:inTrieMemory:value:", *(_QWORD *)(a1 + 40), v4 + 8, &v10) & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v5, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "_PNRNotFoundErrorWithUserInfo:", &unk_24F4D3DB8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v5);
      }
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v4, 4, 1);
      v6 = (void *)MEMORY[0x24BDD1540];
      v11[0] = CFSTR("expected");
      v11[1] = CFSTR("found");
      v12[0] = CFSTR("COCO");
      v12[1] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_PNRBadMagicErrorWithUserInfo:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (BOOL)_lookupString:(id)a3 inTrieMemory:(void *)a4 value:(unsigned int *)a5
{
  id v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  char v10;

  v6 = a3;
  v7 = CFBurstTrieCreateFromMapBytes();
  if (v7)
  {
    if (CFBurstTrieCreateCursorForBytes())
    {
      v8 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (*v8)
      {
        v9 = v8;
        v10 = 0;
        do
        {
          if (!CFBurstTrieCursorAdvanceForBytes())
            break;
          if (CFBurstTrieCursorGetPayload())
          {
            *a5 = 0;
            v10 = 1;
          }
        }
        while (*++v9);
      }
      else
      {
        v10 = 0;
      }
      CFBurstTrieCursorRelease();
    }
    else
    {
      v10 = 0;
    }
    CFBurstTrieRelease();
    LOBYTE(v7) = v10 & 1;
  }

  return v7;
}

- (void)lookupCCForPhoneNumber:(id)a3 logId:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__PNRResourceManager_lookupCCForPhoneNumber_logId_withResult___block_invoke;
  v12[3] = &unk_24F4D25D0;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v10 = v8;
  v11 = v9;
  -[PNRResourceManager openCountryCodeFileUsingLogId:withResult:](self, "openCountryCodeFileUsingLogId:withResult:", a4, v12);

}

- (void)openCountryCodeFileUsingLogId:(id)a3 withResult:(id)a4
{
  -[PNRResourceManager _openLatestAssetWithBasename:maType:logId:resultBlock:](self, "_openLatestAssetWithBasename:maType:logId:resultBlock:", CFSTR("cc"), CFSTR("CC"), a3, a4);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_manager;
}

- (void)openPNRFilesForPrefix:(id)a3 logId:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PNRResourceManager *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__PNRResourceManager_openPNRFilesForPrefix_logId_withResult___block_invoke;
  v14[3] = &unk_24F4D2620;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[PNRResourceManager _URLForInstalledResourceOfType:logId:resultBlock:](self, "_URLForInstalledResourceOfType:logId:resultBlock:", v12, v11, v14);

}

- (void)_openLatestAssetWithBasename:(id)a3 maType:(id)a4 logId:(id)a5 resultBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PNRResourceManager *v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __76__PNRResourceManager__openLatestAssetWithBasename_maType_logId_resultBlock___block_invoke;
  v18[3] = &unk_24F4D25A8;
  v19 = v10;
  v20 = self;
  v22 = v11;
  v23 = v13;
  v21 = v12;
  v14 = v11;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  -[PNRResourceManager _URLForInstalledResourceOfType:logId:resultBlock:](self, "_URLForInstalledResourceOfType:logId:resultBlock:", v14, v16, v18);

}

- (void)_URLForInstalledResourceOfType:(id)a3 logId:(id)a4 resultBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  NSObject *log;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  __CFString *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  void (**v41)(id, _QWORD, void *);
  os_unfair_lock_t lock;
  uint64_t v43;
  id v44;
  _QWORD v45[4];
  id v46;
  __CFString *v47;
  void *v48;
  id v49;
  id location;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  __CFString *v62;
  _BYTE v63[128];
  _QWORD v64[2];
  _QWORD v65[2];
  const __CFString *v66;
  _QWORD v67[4];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v44 = a4;
  v41 = (void (**)(id, _QWORD, void *))a5;
  -[NSCache objectForKey:](self->_maURLCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PNRResourceManager _assetQueryForPNRResource:](self, "_assetQueryForPNRResource:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "queryMetaDataSync"))
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v66 = CFSTR("queryResult");
      MEMORY[0x22E2E4FF0]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_PNRAssetQueryErrorWithUserInfo:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v41[2](v41, 0, v13);
LABEL_5:
      v9 = 0;
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v39, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v64[0] = CFSTR("queryResult");
      MEMORY[0x22E2E4FF0](0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = CFSTR("results");
      v65[0] = v33;
      v65[1] = CFSTR("none");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_PNRAssetQueryErrorWithUserInfo:", v34);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v41[2](v41, 0, v13);
      goto LABEL_5;
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v39, "results");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v15)
    {
      v13 = 0;
      lock = &self->_downloadsInflightLock;
      v43 = *(_QWORD *)v52;
      v16 = CFSTR("Unknown");
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v18, "attributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Build"));
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v22 = CFSTR("Unknown");
          if (v20)
            v22 = (__CFString *)v20;
          v23 = v22;

          v16 = v23;
          if (objc_msgSend(v18, "state") == 1)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543874;
              v58 = v44;
              v59 = 2114;
              v60 = v8;
              v61 = 2114;
              v62 = v23;
              _os_log_impl(&dword_22AC59000, log, OS_LOG_TYPE_INFO, "[%{public}@] asset %{public}@/%{public}@ not present", buf, 0x20u);
            }
            os_unfair_lock_lock(lock);
            if ((-[NSMutableSet containsObject:](self->_downloadsInflight, "containsObject:", v8) & 1) != 0)
            {
              v25 = v13;
              v26 = self->_log;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                v58 = v44;
                v59 = 2114;
                v60 = v8;
                v61 = 2114;
                v62 = v16;
                _os_log_impl(&dword_22AC59000, v26, OS_LOG_TYPE_INFO, "[%{public}@] download of asset %{public}@/%{public}@ is already inflight", buf, 0x20u);
              }
            }
            else
            {
              v28 = objc_alloc_init(MEMORY[0x24BE66C10]);
              objc_msgSend(v28, "setAllowsCellularAccess:", 1);
              objc_msgSend(v28, "setAllowsExpensiveAccess:", 1);
              objc_msgSend(v28, "setDiscretionary:", 0);
              objc_initWeak(&location, self);
              v45[0] = MEMORY[0x24BDAC760];
              v45[1] = 3221225472;
              v45[2] = __71__PNRResourceManager__URLForInstalledResourceOfType_logId_resultBlock___block_invoke;
              v45[3] = &unk_24F4D2648;
              objc_copyWeak(&v49, &location);
              v29 = v8;
              v46 = v29;
              v30 = v16;
              v47 = v30;
              v48 = v18;
              objc_msgSend(v18, "startDownload:then:", v28, v45);
              -[NSMutableSet addObject:](self->_downloadsInflight, "addObject:", v29);
              v31 = self->_log;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                v58 = v44;
                v59 = 2114;
                v60 = v8;
                v61 = 2114;
                v62 = v30;
                _os_log_impl(&dword_22AC59000, v31, OS_LOG_TYPE_INFO, "[%{public}@] download of asset %{public}@/%{public}@ has been requested", buf, 0x20u);
              }

              objc_destroyWeak(&v49);
              objc_destroyWeak(&location);

              v25 = v13;
            }
            os_unfair_lock_unlock(lock);
          }
          else
          {
            if (objc_msgSend(v18, "state") == 2)
            {
              v35 = v18;

              v13 = v35;
              goto LABEL_33;
            }
            if (objc_msgSend(v18, "state") == 3)
            {
              v27 = v18;

              v25 = v27;
            }
            else
            {
              v25 = v13;
            }
          }
          v13 = v25;
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v15)
          continue;
        break;
      }
LABEL_33:

      if (v13)
      {
        objc_msgSend(v13, "getLocalFileUrl");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[NSCache setObject:forKey:](self->_maURLCache, "setObject:forKey:", v9, v8);
        ((void (**)(id, void *, void *))v41)[2](v41, v9, 0);
        goto LABEL_39;
      }
    }
    else
    {

      v16 = CFSTR("Unknown");
    }
    v36 = (void *)MEMORY[0x24BDD1540];
    v55[0] = CFSTR("type");
    v55[1] = CFSTR("build");
    v56[0] = v8;
    v56[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_PNRAssetUnavailableErrorWithUserInfo:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v41[2](v41, 0, v38);
    v13 = 0;
    v9 = 0;
LABEL_39:

    goto LABEL_40;
  }
  ((void (**)(id, void *, void *))v41)[2](v41, v9, 0);
LABEL_41:

}

- (id)_assetQueryForPNRResource:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE66BB0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithType:", CFSTR("com.apple.MobileAsset.phoneNumberResolver"));
  objc_msgSend(v5, "returnTypes:", 2);
  objc_msgSend(v5, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v5, "addKeyValuePair:with:", CFSTR("PNRResource"), v4);

  objc_msgSend(v5, "addKeyValuePair:with:", CFSTR("FormatVersion"), CFSTR("1"));
  return v5;
}

void __76__PNRResourceManager__openLatestAssetWithBasename_maType_logId_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.pnr"), *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_getDataFrom:zeroCacheCost:logId:", v8, 1, *(_QWORD *)(a1 + 48));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      goto LABEL_6;
    }

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-default"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLForResource:withExtension:", v7, CFSTR("pnr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_getDataFrom:zeroCacheCost:logId:", v8, 1, *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *(_QWORD *)(a1 + 56);
    v16 = CFSTR("type");
    v17[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_PNRAssetUnavailableErrorWithUserInfo:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_8;
  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_8:

}

- (id)_getDataFrom:(id)a3 zeroCacheCost:(BOOL)a4 logId:(id)a5
{
  id v8;
  id v9;
  NSObject *log;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  log = self->_log;
  if (v8)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[PNRResourceManager _getDataFrom:zeroCacheCost:logId:].cold.2();
    -[NSCache objectForKey:](self->_fileDataCache, "objectForKey:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[PNRResourceManager _getDataFrom:zeroCacheCost:logId:].cold.1();
      v13 = v12;
      goto LABEL_21;
    }
    objc_msgSend(v8, "startAccessingSecurityScopedResource");
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v8, 1, &v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    objc_msgSend(v8, "stopAccessingSecurityScopedResource");
    if (v15 && (v16 = self->_log, os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 138543874;
      v25 = v9;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v15;
      _os_log_error_impl(&dword_22AC59000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] failed to read file contents at %{public}@ : %{public}@", buf, 0x20u);
      if (v14)
        goto LABEL_14;
    }
    else if (v14)
    {
LABEL_14:
      if (a4)
        v17 = 0;
      else
        v17 = objc_msgSend(v14, "length");
      v18 = self->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)MEMORY[0x24BDD16E0];
        v20 = v18;
        objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v25 = v9;
        v26 = 2114;
        v27 = v21;
        v28 = 2114;
        v29 = v8;
        v30 = 2050;
        v31 = v17;
        _os_log_impl(&dword_22AC59000, v20, OS_LOG_TYPE_INFO, "[%{public}@] cached data of size %{public}@ with key %{public}@ and cost %{public}lu", buf, 0x2Au);

      }
      -[NSCache setObject:forKey:cost:](self->_fileDataCache, "setObject:forKey:cost:", v14, v8, v17);
    }
    v13 = v14;

LABEL_21:
    goto LABEL_22;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v9;
    _os_log_impl(&dword_22AC59000, log, OS_LOG_TYPE_INFO, "[%{public}@] fileURL is nil; no data for you", buf, 0xCu);
  }
  v13 = 0;
LABEL_22:

  return v13;
}

void __61__PNRResourceManager_openPNRFilesForPrefix_logId_withResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@.pnr"), *(_QWORD *)(a1 + 32));
    objc_msgSend(v14, "URLByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(*(id *)(a1 + 40), "_getDataFrom:zeroCacheCost:logId:", v8, 0, *(_QWORD *)(a1 + 48)),
          (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (void *)v9;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@.pnrs"), *(_QWORD *)(a1 + 32));
      objc_msgSend(v14, "URLByAppendingPathComponent:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_getDataFrom:zeroCacheCost:logId:", v12, 0, *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v6 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "_PNRAssetUnavailableErrorWithUserInfo:", &unk_24F4D3E80);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "_PNRAssetUnavailableErrorWithUserInfo:", &unk_24F4D3E58);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

uint64_t __91__PNRResourceManager_lookupStringForPhoneNumber_inCC_countryCodeOfDevice_logId_withResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, a3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)openNANPFileUsingLogId:(id)a3 withResult:(id)a4
{
  -[PNRResourceManager _openLatestAssetWithBasename:maType:logId:resultBlock:](self, "_openLatestAssetWithBasename:maType:logId:resultBlock:", CFSTR("nanp"), CFSTR("NANP"), a3, a4);
}

- (void)lookupStringForPhoneNumber:(id)a3 inCC:(id)a4 countryCodeOfDevice:(id)a5 logId:(id)a6 withResult:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __91__PNRResourceManager_lookupStringForPhoneNumber_inCC_countryCodeOfDevice_logId_withResult___block_invoke;
  v22[3] = &unk_24F4D25F8;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v16;
  -[PNRResourceManager openPNRFilesForPrefix:logId:withResult:](self, "openPNRFilesForPrefix:logId:withResult:", v19, v17, v22);

}

void __35__PNRResourceManager_sharedManager__block_invoke()
{
  PNRResourceManager *v0;
  void *v1;

  v0 = objc_alloc_init(PNRResourceManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (PNRResourceManager)init
{
  PNRResourceManager *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSDate *lastCatalogLoadTime;
  NSCache *v7;
  NSCache *fileDataCache;
  NSCache *v9;
  NSCache *maURLCache;
  NSMutableSet *v11;
  NSMutableSet *downloadsInflight;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PNRResourceManager;
  v2 = -[PNRResourceManager init](&v14, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.PhoneNumberResolver", "ResourceManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    -[PNRResourceManager _lastCatalogLoadTime](v2, "_lastCatalogLoadTime");
    v5 = objc_claimAutoreleasedReturnValue();
    lastCatalogLoadTime = v2->_lastCatalogLoadTime;
    v2->_lastCatalogLoadTime = (NSDate *)v5;

    v2->_catalogLoadRetryMultiplier = 0;
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    fileDataCache = v2->_fileDataCache;
    v2->_fileDataCache = v7;

    -[NSCache setTotalCostLimit:](v2->_fileDataCache, "setTotalCostLimit:", 10485760);
    -[NSCache setName:](v2->_fileDataCache, "setName:", CFSTR("PNR data cache"));
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    maURLCache = v2->_maURLCache;
    v2->_maURLCache = v9;

    -[NSCache setName:](v2->_maURLCache, "setName:", CFSTR("MA URL cache"));
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    downloadsInflight = v2->_downloadsInflight;
    v2->_downloadsInflight = v11;

    v2->_downloadsInflightLock._os_unfair_lock_opaque = 0;
    -[PNRResourceManager _updateCatalog](v2, "_updateCatalog");
  }
  return v2;
}

- (void)_updateCatalog
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = objc_alloc_init(MEMORY[0x24BE66C10]);
  objc_msgSend(v3, "setAllowsCellularAccess:", 1);
  objc_msgSend(v3, "setAllowsExpensiveAccess:", 1);
  -[PNRResourceManager _lastCatalogLoadTime](self, "_lastCatalogLoadTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDiscretionary:", v4 != 0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__PNRResourceManager__updateCatalog__block_invoke;
  v5[3] = &unk_24F4D2698;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BE66B90], "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.phoneNumberResolver"), v3, v5);

}

- (id)_lastCatalogLoadTime
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("PNRltc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_catalogLoadRetryMultiplier = 0;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)PNRResourceManager;
  -[PNRResourceManager dealloc](&v3, sel_dealloc);
}

- (void)_bestStringForInCountryPhoneNumber:(id)a3 phoneNumberCC:(id)a4 countryOfDevice:(id)a5 countryTrieData:(id)a6 countryStrings:(id)a7 logId:(id)a8 resultBlock:(id)a9
{
  id v14;
  id v15;
  unsigned int *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _DWORD *v22;
  _DWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _DWORD *v33;
  _DWORD *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  PNRStringsFileReaderResult *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  unsigned int *v62;
  unsigned int *v63;
  unsigned int *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  PNRStringsFileReaderResult *v77;
  PNRStringsFileReaderResult *v78;
  uint64_t v79;
  PNRStringsFileReaderResult *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *log;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  uint64_t v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  _BYTE *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  unsigned int *v121;
  id v122;
  id v123;
  id obj;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  id v130;
  void *v131;
  uint64_t v132;
  PNRStringsFileReaderResult *v133;
  char v134;
  char v135[15];
  char v136;
  char v137[15];
  char v138;
  char v139[15];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  unsigned int v148;
  char v149;
  char v150[15];
  char v151;
  _BYTE v152[7];
  char v153;
  char v154[15];
  char v155;
  char v156[15];
  char v157;
  char v158[15];
  char v159;
  char v160[15];
  _QWORD v161[2];
  _QWORD v162[2];
  uint8_t buf[4];
  id v164;
  __int16 v165;
  uint64_t v166;
  __int16 v167;
  unint64_t v168;
  __int16 v169;
  unsigned int *v170;
  _BYTE v171[128];
  uint64_t v172;
  _BYTE v173[128];
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[5];

  v179[2] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = (unsigned int *)a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = objc_retainAutorelease(v17);
  v22 = (_DWORD *)objc_msgSend(v21, "bytes");
  if (!v22)
  {
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = &unk_24F4D3E08;
LABEL_6:
    objc_msgSend(v31, "_PNRAssetUnavailableErrorWithUserInfo:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    (*((void (**)(id, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, v24);
    goto LABEL_8;
  }
  v23 = v22;
  if (*v22 != 1380864110)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v22, 4, 1);
    v25 = (void *)MEMORY[0x24BDD1540];
    v178[0] = CFSTR("expected");
    v178[1] = CFSTR("found");
    v179[0] = CFSTR("nPNR");
    v179[1] = v24;
    v26 = (void *)MEMORY[0x24BDBCE70];
    v27 = v179;
    v28 = v178;
LABEL_4:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_PNRBadMagicErrorWithUserInfo:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v20 + 2))(v20, 0, 0, v30);
    goto LABEL_8;
  }
  v130 = objc_retainAutorelease(v18);
  v33 = (_DWORD *)objc_msgSend(v130, "bytes");
  if (!v33)
  {
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = &unk_24F4D3E30;
    goto LABEL_6;
  }
  v34 = v33;
  if (*v33 != 1397902928)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v33, 4, 1);
    v25 = (void *)MEMORY[0x24BDD1540];
    v176[0] = CFSTR("expected");
    v176[1] = CFSTR("found");
    v177[0] = CFSTR("PNRS");
    v177[1] = v24;
    v26 = (void *)MEMORY[0x24BDBCE70];
    v27 = v177;
    v28 = v176;
    goto LABEL_4;
  }
  v148 = 0;
  if (!-[PNRResourceManager _lookupString:inTrieMemory:value:](self, "_lookupString:inTrieMemory:value:", v14, (char *)v23 + 34, &v148))
  {
    v108 = (void *)MEMORY[0x24BDD1540];
    v174[0] = CFSTR("type");
    v174[1] = CFSTR("resource");
    v175[0] = CFSTR("trie");
    v175[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v175, v174, 2);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "_PNRNotFoundErrorWithUserInfo:", v109);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v122 = v15;
  v123 = v20;
  v117 = v18;
  v118 = v21;
  v120 = v19;
  v121 = v16;
  v119 = v14;
  v35 = v34[9];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v35)
  {
    v38 = (const char *)(v34 + 10);
    do
    {
      LODWORD(v35) = v35 - 1;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v39);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)&v38[strlen(v38) + 1]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKey:", v40, v39);

      v38 += strlen(v38) + 5;
    }
    while ((_DWORD)v35);
  }
  v116 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v37);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNRUtils _preferredLanguages](PNRUtils, "_preferredLanguages");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v44 = v42;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v144, v173, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v145;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v145 != v47)
          objc_enumerationMutation(v44);
        v49 = (void *)MEMORY[0x24BDBCEA0];
        v172 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v172, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v41, v50, 1, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
          objc_msgSend(v43, "addObject:", v51);

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v144, v173, 16);
    }
    while (v46);
  }

  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = v43;
  v127 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v171, 16);
  if (!v127)
  {
    v125 = 0;
    v52 = 0;
    goto LABEL_112;
  }
  v52 = 0;
  v125 = 0;
  v126 = *(_QWORD *)v141;
  v114 = v152;
  do
  {
    v53 = 0;
    do
    {
      v133 = v52;
      if (*(_QWORD *)v141 != v126)
        objc_enumerationMutation(obj);
      v132 = v53;
      v54 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v53);
      v55 = v148;
      v56 = objc_retainAutorelease(v130);
      v57 = objc_msgSend(v56, "bytes");
      v58 = objc_msgSend(v56, "length");
      v59 = v57 + v58;
      objc_msgSend(v128, "objectForKey:", v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v57 + objc_msgSend(v60, "unsignedIntValue");

      v62 = (unsigned int *)(v61 + 4 * (v55 & 0x1F));
      if ((unint64_t)(v62 + 1) < v57 + v58)
      {
        v131 = v54;
        v63 = (unsigned int *)(v61 + 4 * (v55 >> 5));
        if ((unint64_t)(v63 + 1) >= v59)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.7(&v136, v137);
          log = self->_log;
          v52 = v133;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            v99 = log;
            v100 = objc_msgSend(v56, "length");
            *(_DWORD *)buf = 138543618;
            v164 = v120;
            v165 = 2050;
            v166 = v100;
            _os_log_error_impl(&dword_22AC59000, v99, OS_LOG_TYPE_ERROR, "[%{public}@] truncated pnrs data?; size %{public}lu ",
              buf,
              0x16u);

          }
          v89 = self->_log;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v164 = v120;
            v165 = 2050;
            v166 = v57;
            v167 = 2050;
            v168 = v59;
            v169 = 2050;
            v170 = v63;
            _os_log_error_impl(&dword_22AC59000, v89, OS_LOG_TYPE_ERROR, "[%{public}@] begin: %{public}p, end: %{public}p, offsetPtr: %{public}p", buf, 0x2Au);
          }
          v90 = self->_log;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v101 = v90;
            v102 = objc_msgSend(v118, "length");
            *(_DWORD *)buf = 138543618;
            v164 = v120;
            v165 = 2050;
            v166 = v102;
            _os_log_error_impl(&dword_22AC59000, v101, OS_LOG_TYPE_ERROR, "[%{public}@] pnr data size: %{public}lu", buf, 0x16u);

          }
          v91 = self->_log;
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            goto LABEL_68;
        }
        else
        {
          v64 = (unsigned int *)(v61 + 4 * (v55 >> 13));
          if ((unint64_t)(v64 + 1) < v59)
          {
            v65 = *v62;
            v66 = *v63;
            v67 = *v64;
            v68 = v57 + v65;
            if (v58 < v65)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.1(&v159, v160);
LABEL_40:
              v69 = 0;
            }
            else
            {
              v69 = 0;
              while (*(_BYTE *)(v68 + v69))
              {
                ++v69;
                if (v68 + v69 > v59)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                    -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.1(&v157, v158);
                  goto LABEL_40;
                }
              }
            }
            v70 = v57 + v66;
            if (v58 < v66)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.1(&v155, v156);
LABEL_47:
              v71 = 0;
            }
            else
            {
              v71 = 0;
              while (*(_BYTE *)(v70 + v71))
              {
                ++v71;
                if (v70 + v71 > v59)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                    -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.1(&v153, v154);
                  goto LABEL_47;
                }
              }
            }
            v72 = v57 + v67;
            if (v58 < v67)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.1(&v151, v114);
LABEL_54:
              v73 = 0;
            }
            else
            {
              v73 = 0;
              while (*(_BYTE *)(v72 + v73))
              {
                ++v73;
                if (v72 + v73 > v59)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
                    -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.1(&v149, v150);
                  goto LABEL_54;
                }
              }
            }
            if (v69)
            {
              v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v68, v69, 4);
              if (v71)
                goto LABEL_57;
LABEL_59:
              v75 = 0;
            }
            else
            {
              v74 = 0;
              if (!v71)
                goto LABEL_59;
LABEL_57:
              v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v70, v71, 4);
            }
            v52 = v133;
            if (v73)
              v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v72, v73, 4);
            else
              v76 = 0;
            v77 = -[PNRStringsFileReaderResult initWithCountry:region:city:]([PNRStringsFileReaderResult alloc], "initWithCountry:region:city:", v74, v75, v76);
            v78 = v77;
            if (v77)
            {
              v79 = -[PNRStringsFileReaderResult score](v77, "score");
              if (v79 > -[PNRStringsFileReaderResult score](v133, "score"))
              {
                v80 = v78;

                v81 = v131;
                v125 = v81;
                v52 = v80;
              }
              v82 = -[PNRStringsFileReaderResult score](v52, "score", v114);
              if (v82 == +[PNRStringsFileReaderResult maxPossibleScore](PNRStringsFileReaderResult, "maxPossibleScore"))
              {

                goto LABEL_112;
              }
            }

LABEL_68:
            v83 = v132;
            goto LABEL_69;
          }
          v52 = v133;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
            -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.7(&v134, v135);
          v92 = self->_log;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            v103 = v92;
            v104 = objc_msgSend(v56, "length");
            *(_DWORD *)buf = 138543618;
            v164 = v120;
            v165 = 2050;
            v166 = v104;
            _os_log_error_impl(&dword_22AC59000, v103, OS_LOG_TYPE_ERROR, "[%{public}@] truncated pnrs data?; size %{public}lu ",
              buf,
              0x16u);

          }
          v93 = self->_log;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            v164 = v120;
            v165 = 2050;
            v166 = v57;
            v167 = 2050;
            v168 = v59;
            v169 = 2050;
            v170 = v64;
            _os_log_error_impl(&dword_22AC59000, v93, OS_LOG_TYPE_ERROR, "[%{public}@] begin: %{public}p, end: %{public}p, offsetPtr: %{public}p", buf, 0x2Au);
          }
          v94 = self->_log;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            v105 = v94;
            v106 = objc_msgSend(v118, "length");
            *(_DWORD *)buf = 138543618;
            v164 = v120;
            v165 = 2050;
            v166 = v106;
            _os_log_error_impl(&dword_22AC59000, v105, OS_LOG_TYPE_ERROR, "[%{public}@] pnr data size: %{public}lu", buf, 0x16u);

          }
          v91 = self->_log;
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            goto LABEL_68;
        }
        *(_DWORD *)buf = 138544130;
        v164 = v120;
        v165 = 2114;
        v166 = (uint64_t)v122;
        v167 = 2114;
        v168 = (unint64_t)v119;
        v169 = 2114;
        v170 = v121;
        _os_log_error_impl(&dword_22AC59000, v91, OS_LOG_TYPE_ERROR, "[%{public}@] prefix: '%{public}@', number: '%{public}@', country: %{public}@", buf, 0x2Au);
        goto LABEL_68;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.7(&v138, v139);
      v84 = self->_log;
      v52 = v133;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v95 = v84;
        v96 = objc_msgSend(v56, "length");
        *(_DWORD *)buf = 138543618;
        v164 = v120;
        v165 = 2050;
        v166 = v96;
        _os_log_error_impl(&dword_22AC59000, v95, OS_LOG_TYPE_ERROR, "[%{public}@] truncated pnrs data?; size %{public}lu ",
          buf,
          0x16u);

      }
      v85 = self->_log;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v164 = v120;
        v165 = 2050;
        v166 = v57;
        v167 = 2050;
        v168 = v59;
        v169 = 2050;
        v170 = v62;
        _os_log_error_impl(&dword_22AC59000, v85, OS_LOG_TYPE_ERROR, "[%{public}@] begin: %{public}p, end: %{public}p, offsetPtr: %{public}p", buf, 0x2Au);
      }
      v86 = self->_log;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v97 = v86;
        v98 = objc_msgSend(v118, "length");
        *(_DWORD *)buf = 138543618;
        v164 = v120;
        v165 = 2050;
        v166 = v98;
        _os_log_error_impl(&dword_22AC59000, v97, OS_LOG_TYPE_ERROR, "[%{public}@] pnr data size: %{public}lu", buf, 0x16u);

      }
      v87 = self->_log;
      v83 = v132;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v164 = v120;
        v165 = 2114;
        v166 = (uint64_t)v122;
        v167 = 2114;
        v168 = (unint64_t)v119;
        v169 = 2114;
        v170 = v121;
        _os_log_error_impl(&dword_22AC59000, v87, OS_LOG_TYPE_ERROR, "[%{public}@] prefix: '%{public}@', number: '%{public}@', country: %{public}@", buf, 0x2Au);
      }
LABEL_69:
      v53 = v83 + 1;
    }
    while (v53 != v127);
    v107 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v171, 16);
    v127 = v107;
  }
  while (v107);
LABEL_112:

  v14 = v119;
  if (-[PNRStringsFileReaderResult isPlaceHolderForEmpty](v52, "isPlaceHolderForEmpty"))
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v123 + 2))(v123, 0, 0, 0);
  }
  else
  {
    -[PNRStringsFileReaderResult aggregateStringWhileInCountry:forLanguage:ccOfNumber:](v52, "aggregateStringWhileInCountry:forLanguage:ccOfNumber:", v121, v125, v122);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v110)
    {
      (*((void (**)(id, void *, uint64_t, _QWORD))v123 + 2))(v123, v110, 1, 0);
    }
    else
    {
      v111 = (void *)MEMORY[0x24BDD1540];
      v161[0] = CFSTR("type");
      v161[1] = CFSTR("resource");
      v162[0] = CFSTR("strings");
      v162[1] = v122;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v162, v161, 2);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "_PNRNotFoundErrorWithUserInfo:", v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, void *))v123 + 2))(v123, 0, 0, v113);
    }

  }
  v16 = v121;
  v15 = v122;
  v18 = v117;
  v21 = v118;
  v19 = v120;
  v20 = v123;
  v24 = v116;
LABEL_8:

}

void __71__PNRResourceManager__URLForInstalledResourceOfType_logId_resultBlock___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 16);
    objc_msgSend(*(id *)&v3[14]._os_unfair_lock_opaque, "removeObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(v3 + 16);
    v4 = *(NSObject **)&v3[12]._os_unfair_lock_opaque;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(a1 + 48);
      v8 = v4;
      objc_msgSend(v7, "getLocalUrl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = CFSTR("asset");
      v12 = 2114;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_22AC59000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Got the download asset reply: %{public}@/%{public}@, and %{public}@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (void)_setLastCatalogLoadTime:(id)a3
{
  NSDate *v4;
  void *v5;
  NSDate *lastCatalogLoadTime;

  v4 = (NSDate *)a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("PNRltc"));

  lastCatalogLoadTime = self->_lastCatalogLoadTime;
  self->_lastCatalogLoadTime = v4;

}

- (void)_updateCatalogAfterDelay:(double)a3
{
  NSObject *log;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v10 = CFSTR("catalog");
    v11 = 2050;
    v12 = (uint64_t)a3;
    _os_log_impl(&dword_22AC59000, log, OS_LOG_TYPE_INFO, "[%{public}@] phone number db catalog downloads in %{public}ld seconds", buf, 0x16u);
  }
  dispatch_get_global_queue(9, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PNRResourceManager__updateCatalogAfterDelay___block_invoke;
  block[3] = &unk_24F4D2670;
  block[4] = self;
  dispatch_after(v7, v6, block);

}

uint64_t __47__PNRResourceManager__updateCatalogAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCatalog");
}

uint64_t __36__PNRResourceManager__updateCatalog__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_catalogDownloadFinishedWithResult:", a2);
}

- (void)_catalogDownloadFinishedWithResult:(int64_t)a3
{
  NSObject *log;
  unsigned int catalogLoadRetryMultiplier;
  double v7;
  id v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = CFSTR("catalog");
    v11 = 2050;
    v12 = a3;
    _os_log_impl(&dword_22AC59000, log, OS_LOG_TYPE_INFO, "[%{public}@] catalog download results : %{public}ld", (uint8_t *)&v9, 0x16u);
  }
  if (a3)
  {
    catalogLoadRetryMultiplier = self->_catalogLoadRetryMultiplier;
    if (catalogLoadRetryMultiplier <= 0xB)
      self->_catalogLoadRetryMultiplier = ++catalogLoadRetryMultiplier;
    v7 = (double)(600 * catalogLoadRetryMultiplier);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[PNRResourceManager _setLastCatalogLoadTime:](self, "_setLastCatalogLoadTime:", v8);

    v7 = 90000.0;
  }
  -[PNRResourceManager _updateCatalogAfterDelay:](self, "_updateCatalogAfterDelay:", v7);
}

- (void)catalogLoadThen:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE66C10]);
  objc_msgSend(v4, "setAllowsCellularAccess:", 1);
  objc_msgSend(v4, "setDiscretionary:", 0);
  v5 = (void *)MEMORY[0x24BE66B90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__PNRResourceManager_catalogLoadThen___block_invoke;
  v7[3] = &unk_24F4D26C0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.phoneNumberResolver"), v4, v7);

}

uint64_t __38__PNRResourceManager_catalogLoadThen___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsInflight, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_maURLCache, 0);
  objc_storeStrong((id *)&self->_fileDataCache, 0);
  objc_storeStrong((id *)&self->_lastCatalogLoadTime, 0);
}

- (void)_bestStringForInCountryPhoneNumber:(_BYTE *)a1 phoneNumberCC:(_BYTE *)a2 countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:.cold.1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_22AC59000, MEMORY[0x24BDACB70], v2, "Assertion failed: r <= end", v3);
}

- (void)_bestStringForInCountryPhoneNumber:(_BYTE *)a1 phoneNumberCC:(_BYTE *)a2 countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:.cold.7(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_22AC59000, MEMORY[0x24BDACB70], v2, "Assertion failed: (void*)offsetPtr + sizeof(*offsetPtr) < (void*)end", v3);
}

- (void)_getDataFrom:zeroCacheCost:logId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22AC59000, v0, v1, "[%{public}@] found cached data for key %{public}@");
}

- (void)_getDataFrom:zeroCacheCost:logId:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22AC59000, v0, v1, "[%{public}@] lookup cached data with key %{public}@");
}

@end
