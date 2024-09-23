@implementation WKWallpaperBundleDownloadManager

- (WKWallpaperBundleDownloadManager)initWithAssetDownloadIdentifier:(id)a3
{
  id v4;
  WKWallpaperBundleDownloadManager *v5;
  uint64_t v6;
  NSString *assetDownloadIdentifier;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *loadingQueue;
  uint64_t v11;
  NSMutableDictionary *localAssetLookup;
  uint64_t v13;
  NSMutableDictionary *activeDownloads;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WKWallpaperBundleDownloadManager;
  v5 = -[WKWallpaperBundleDownloadManager init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assetDownloadIdentifier = v5->_assetDownloadIdentifier;
    v5->_assetDownloadIdentifier = (NSString *)v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 1), v8);
    loadingQueue = v5->__loadingQueue;
    v5->__loadingQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    localAssetLookup = v5->__localAssetLookup;
    v5->__localAssetLookup = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    activeDownloads = v5->__activeDownloads;
    v5->__activeDownloads = (NSMutableDictionary *)v13;

    objc_initWeak(&location, v5);
    -[WKWallpaperBundleDownloadManager _loadingQueue](v5, "_loadingQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke;
    v17[3] = &unk_1E6EF9C10;
    objc_copyWeak(&v18, &location);
    dispatch_async(v15, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc(MEMORY[0x1E0D4E050]);
  objc_msgSend(WeakRetained, "assetDownloadIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithType:", v2);

  if (!objc_msgSend(v3, "queryMetaDataSync"))
  {
    objc_msgSend(v3, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke_2;
    v6[3] = &unk_1E6EF9BE8;
    v7 = WeakRetained;
    objc_msgSend(v4, "na_each:", v6);

  }
}

void __68__WKWallpaperBundleDownloadManager_initWithAssetDownloadIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WKWallpaperBundle *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") != 1)
  {
    objc_opt_class();
    objc_msgSend(v3, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WallpaperBundleName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("wallpaper"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getLocalUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[WKWallpaperBundle initWithURL:]([WKWallpaperBundle alloc], "initWithURL:", v10);
    -[WKWallpaperBundle identifierString](v11, "identifierString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    -[WKWallpaperBundle name](v11, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_localAssetLookup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, v15);

  }
}

+ (WKWallpaperBundleDownloadManager)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WKWallpaperBundleDownloadManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, block);
  return (WKWallpaperBundleDownloadManager *)(id)defaultManager__defaultManager;
}

void __50__WKWallpaperBundleDownloadManager_defaultManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithAssetDownloadIdentifier:", CFSTR("com.apple.MobileAsset.Wallpaper"));
  v2 = (void *)defaultManager__defaultManager;
  defaultManager__defaultManager = v1;

}

- (void)downloadWallpaperRepresentingIfNeeded:(id)a3 progress:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  id v27;
  id v28;
  id location;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isOffloaded") & 1) != 0)
  {
    objc_msgSend(v8, "identifierString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    objc_msgSend(v8, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0D4E088]);
    objc_msgSend(v15, "setDiscretionary:", 0);
    -[WKWallpaperBundleDownloadManager _startCatalogDownload](self, "_startCatalogDownload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke;
    v30[3] = &unk_1E6EF9C88;
    v30[4] = self;
    v31 = v8;
    objc_msgSend(v16, "flatMap:", v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_4;
    v24[3] = &unk_1E6EF9D28;
    objc_copyWeak(&v28, &location);
    v25 = v9;
    v26 = v14;
    v27 = v15;
    objc_msgSend(v18, "flatMap:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_8;
    v21[3] = &unk_1E6EF9D78;
    objc_copyWeak(&v23, &location);
    v21[4] = v14;
    v22 = v10;
    v20 = (id)objc_msgSend(v19, "addCompletionBlock:", v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  else if (v10)
  {
    (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v8, 0);
  }

}

id __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v2 = objc_alloc(MEMORY[0x1E0D4E050]);
  objc_msgSend(*(id *)(a1 + 32), "assetDownloadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithType:", v3);

  objc_msgSend(*(id *)(a1 + 40), "logicalScreenClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("WallpaperLogicalScreenClass"), v5);

  objc_msgSend(*(id *)(a1 + 40), "identifierString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("WallpaperIdentifier"), v6);

  objc_msgSend(*(id *)(a1 + 40), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("WallpaperName"), v7);

  v8 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_2;
  v12[3] = &unk_1E6EF9C60;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "lazyFutureWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_3;
  v6[3] = &unk_1E6EF9C38;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "queryMetaDataWithError:", v6);

}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "results");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v6, v5);

}

id __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_5;
  v8[3] = &unk_1E6EF9D00;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v5 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v4, "lazyFutureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v6;
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WallpaperBundleName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("wallpaper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v10 = *(void **)(a1 + 40);
    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v12 = *(void **)(a1 + 32);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_6;
      v23[3] = &unk_1E6EF9CB0;
      v24 = v10;
      objc_msgSend(v12, "attachProgressCallBack:", v23);

    }
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_activeDownloads");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 48));

    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 56);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_7;
    v19[3] = &unk_1E6EF9CD8;
    v20 = v3;
    v21 = *(id *)(a1 + 32);
    v22 = v9;
    objc_msgSend(v15, "startDownload:completionWithError:", v16, v19);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v18);

  }
}

uint64_t __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", objc_msgSend(v3, "totalExpected"));
  v4 = objc_msgSend(v3, "totalWritten");

  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", v4);
}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_7(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v6 = a3;
  objc_msgSend(v5, "getLocalUrl");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:error:", v7, v6);

}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  WKWallpaperBundle *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[7];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_activeDownloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  if (!v6)
  {
    if (+[WKWallpaperBundle shouldLoadWallpaperBundleAtURL:](WKWallpaperBundle, "shouldLoadWallpaperBundleAtURL:", v5))
    {
      v10 = -[WKWallpaperBundle initWithURL:]([WKWallpaperBundle alloc], "initWithURL:", v5);
      objc_msgSend(WeakRetained, "_loadingQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_9;
      block[3] = &unk_1E6EF9D50;
      v12 = *(_QWORD *)(a1 + 32);
      block[4] = WeakRetained;
      block[5] = v12;
      block[6] = v10;
      dispatch_async(v11, block);

      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, WKWallpaperBundle *, _QWORD))(v13 + 16))(v13, v10, 0);
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      if (!v14)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", WKWallpaperKitErrorDomain, -10028, 0);
      v10 = (WKWallpaperBundle *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, WKWallpaperBundle *))(v14 + 16))(v14, 0, v10);
    }

    goto LABEL_10;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
LABEL_10:

}

void __98__WKWallpaperBundleDownloadManager_downloadWallpaperRepresentingIfNeeded_progress_withCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_localAssetLookup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)cancelDownloadForWallpaperRepresenting:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifierString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WKWallpaperBundleDownloadManager _activeDownloads](self, "_activeDownloads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WKWallpaperBundleDownloadManager _activeDownloads](self, "_activeDownloads");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v11);

  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke;
  v21[3] = &unk_1E6EF9C60;
  v21[4] = v13;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_2;
  v19[3] = &unk_1E6EF9DC8;
  v20 = v6;
  v17 = v6;
  v18 = (id)objc_msgSend(v16, "addCompletionBlock:", v19);

}

void __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_205;
    v6[3] = &unk_1E6EF9DA0;
    v7 = v3;
    objc_msgSend(v5, "cancelDownload:", v6);

  }
  else
  {
    objc_msgSend(v3, "finishWithResult:", &unk_1E6F0DBD8);
  }

}

void __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_205(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = WKWallpaperKitErrorDomain;
    v9 = CFSTR("CancelDownloadResult");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -10029, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithResult:");

  }
}

uint64_t __90__WKWallpaperBundleDownloadManager_cancelDownloadForWallpaperRepresenting_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (id)localWallpaperRepresentingWithIdentifier:(id)a3 wallpaperName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[6];
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v22[0] = v6;
  v22[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[WKWallpaperBundleDownloadManager _loadingQueue](self, "_loadingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__WKWallpaperBundleDownloadManager_localWallpaperRepresentingWithIdentifier_wallpaperName___block_invoke;
  block[3] = &unk_1E6EF9DF0;
  objc_copyWeak(&v14, &location);
  block[4] = v9;
  block[5] = &v16;
  dispatch_sync(v10, block);

  v11 = (id)v17[5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __91__WKWallpaperBundleDownloadManager_localWallpaperRepresentingWithIdentifier_wallpaperName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_localAssetLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_startCatalogDownload
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  -[WKWallpaperBundleDownloadManager _catalogDownloadResult](self, "_catalogDownloadResult");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[WKWallpaperBundleDownloadManager _catalogDownloadError](self, "_catalogDownloadError"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    -[WKWallpaperBundleDownloadManager _catalogDownloadResult](self, "_catalogDownloadResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke;
    v12[3] = &unk_1E6EF9E40;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "lazyFutureWithBlock:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    return v7;
  }
}

void __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  objc_msgSend(v4, "setDiscretionary:", 0);
  objc_msgSend(v4, "setTimeoutIntervalForResource:", 10);
  WKLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[WKWallpaperBundleDownloadManager _startCatalogDownload]_block_invoke";
    _os_log_impl(&dword_1B8C64000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: started download for catalog", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D4E038];
  objc_msgSend(*(id *)(a1 + 32), "assetDownloadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_213;
  v9[3] = &unk_1E6EF9E18;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v8 = v3;
  v10 = v8;
  objc_msgSend(v6, "startCatalogDownload:options:completionWithError:", v7, v4, v9);

  objc_destroyWeak(&v11);
}

void __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_213(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  WKLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[WKWallpaperBundleDownloadManager _startCatalogDownload]_block_invoke";
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1B8C64000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: completed for catalog, error: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "set_catalogDownloadResult:", v8);

  objc_msgSend(WeakRetained, "set_catalogDownloadError:", v5);
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("checkTimeoutConditions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    WKLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "-[WKWallpaperBundleDownloadManager _startCatalogDownload]_block_invoke";
      _os_log_impl(&dword_1B8C64000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: received error with MAIsErrorKeySuggestingCheckTimeoutConditions for catalog", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_218;
      block[3] = &unk_1E6EF9B68;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "finishWithResult:error:", v15, v5);

}

void __57__WKWallpaperBundleDownloadManager__startCatalogDownload__block_invoke_218(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "downloadManagerDidEncounterNetworkConnectionError");

}

- (NSString)assetDownloadIdentifier
{
  return self->_assetDownloadIdentifier;
}

- (WKWallpaperBundleDownloadManagerDelegate)delegate
{
  return (WKWallpaperBundleDownloadManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)_loadingQueue
{
  return self->__loadingQueue;
}

- (void)set_loadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->__loadingQueue, a3);
}

- (NSNumber)_catalogDownloadResult
{
  return self->__catalogDownloadResult;
}

- (void)set_catalogDownloadResult:(id)a3
{
  objc_storeStrong((id *)&self->__catalogDownloadResult, a3);
}

- (NSError)_catalogDownloadError
{
  return self->__catalogDownloadError;
}

- (void)set_catalogDownloadError:(id)a3
{
  objc_storeStrong((id *)&self->__catalogDownloadError, a3);
}

- (NSMutableDictionary)_localAssetLookup
{
  return self->__localAssetLookup;
}

- (void)set_localAssetLookup:(id)a3
{
  objc_storeStrong((id *)&self->__localAssetLookup, a3);
}

- (NSMutableDictionary)_activeDownloads
{
  return self->__activeDownloads;
}

- (void)set_activeDownloads:(id)a3
{
  objc_storeStrong((id *)&self->__activeDownloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeDownloads, 0);
  objc_storeStrong((id *)&self->__localAssetLookup, 0);
  objc_storeStrong((id *)&self->__catalogDownloadError, 0);
  objc_storeStrong((id *)&self->__catalogDownloadResult, 0);
  objc_storeStrong((id *)&self->__loadingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetDownloadIdentifier, 0);
}

@end
