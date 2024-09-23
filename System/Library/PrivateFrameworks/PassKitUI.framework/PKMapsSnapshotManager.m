@implementation PKMapsSnapshotManager

- (PKMapsSnapshotManager)init
{
  PKMapsSnapshotManager *v2;
  uint64_t v3;
  NSURL *cacheURL;
  uint64_t v5;
  NSFileManager *fileManager;
  NSMutableDictionary *v7;
  NSMutableDictionary *snapshotCache;
  NSMutableArray *v9;
  NSMutableArray *snapshotCacheKeys;
  NSMutableArray *v11;
  NSMutableArray *snapshotsKeysToPerform;
  NSMutableDictionary *v13;
  NSMutableDictionary *snapshotOptionsByKey;
  NSMutableDictionary *v15;
  NSMutableDictionary *completionBlockByKey;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *snapshotQueue;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKMapsSnapshotManager;
  v2 = -[PKMapsSnapshotManager init](&v22, sel_init);
  if (v2)
  {
    PKMapsSnapshotsCacheURL();
    v3 = objc_claimAutoreleasedReturnValue();
    cacheURL = v2->_cacheURL;
    v2->_cacheURL = (NSURL *)v3;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = objc_claimAutoreleasedReturnValue();
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    snapshotCache = v2->_snapshotCache;
    v2->_snapshotCache = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    snapshotCacheKeys = v2->_snapshotCacheKeys;
    v2->_snapshotCacheKeys = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    snapshotsKeysToPerform = v2->_snapshotsKeysToPerform;
    v2->_snapshotsKeysToPerform = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    snapshotOptionsByKey = v2->_snapshotOptionsByKey;
    v2->_snapshotOptionsByKey = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionBlockByKey = v2->_completionBlockByKey;
    v2->_completionBlockByKey = v15;

    v2->_fileLock._os_unfair_lock_opaque = 0;
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.passkitui.mapsnapshotter", v18);
    snapshotQueue = v2->_snapshotQueue;
    v2->_snapshotQueue = (OS_dispatch_queue *)v19;

    os_unfair_lock_lock(&v2->_fileLock);
    -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v2->_fileManager, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2->_cacheURL, 1, 0, 0);
    os_unfair_lock_unlock(&v2->_fileLock);

  }
  return v2;
}

- (id)placeholderWithTraitCollection:(id)a3 completion:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = *MEMORY[0x1E0C9E500];
  v8 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PKMapsSnapshotManager_placeholderWithTraitCollection_completion___block_invoke;
  v12[3] = &unk_1E3E6E9A8;
  v13 = v6;
  v9 = v6;
  -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](self, "snapshotForDisplayRegion:size:traitCollection:completion:", a3, v12, v7, v8, 0.0, 0.0, 100.0, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __67__PKMapsSnapshotManager_placeholderWithTraitCollection_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)snapshotForDisplayRegion:(id *)a3 size:(CGSize)a4 traitCollection:(id)a5 completion:(id)a6
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double height;
  double width;
  $0C74697883D3558DB2D462E3F896A1F2 *v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  os_unfair_lock_s *p_cacheLock;
  void *v34;
  void *v35;
  id v36;
  BOOL v37;
  NSObject *snapshotQueue;
  $0C74697883D3558DB2D462E3F896A1F2 *v39;
  id v40;
  _QWORD block[4];
  $0C74697883D3558DB2D462E3F896A1F2 *v42;
  PKMapsSnapshotManager *v43;
  id v44;
  id v45;
  id v46[7];
  BOOL v47;
  _QWORD v48[6];
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id location[2];
  CLLocationCoordinate2D v54;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a4.height;
  width = a4.width;
  v18 = a3;
  v19 = a5;
  objc_initWeak(location, self);
  v54.latitude = width;
  v54.longitude = height;
  v20 = CLLocationCoordinate2DIsValid(v54);
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = -[$0C74697883D3558DB2D462E3F896A1F2 userInterfaceStyle](v18, "userInterfaceStyle");
  v23 = *MEMORY[0x1E0C9E500];
  v24 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  if (v20)
  {
    v23 = width;
    v24 = height;
  }
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%.7f-%.7f-%.7f-%.7f-%.2f-%.2f-%ld"), *(_QWORD *)&v23, *(_QWORD *)&v24, v14, v13, v12, v11, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dataUsingEncoding:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fileSafeBase64Encoding");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKMapsSnapshotManager _iconForCacheKey:](self, "_iconForCacheKey:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = v28;
LABEL_8:
    v30 = v29;
    goto LABEL_9;
  }
  -[PKMapsSnapshotManager _iconFromDiskForCacheKey:](self, "_iconFromDiskForCacheKey:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    os_unfair_lock_lock(&self->_cacheLock);
    -[NSMutableArray addObject:](self->_snapshotCacheKeys, "addObject:", v27);
    -[NSMutableDictionary setObject:forKey:](self->_snapshotCache, "setObject:forKey:", v30, v27);
    os_unfair_lock_unlock(&self->_cacheLock);
LABEL_7:
    v29 = v30;
    goto LABEL_8;
  }
  if (!v20)
    goto LABEL_12;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke;
  v49[3] = &unk_1E3E6E9D0;
  objc_copyWeak(&v52, location);
  v50 = v27;
  v51 = v19;
  -[PKMapsSnapshotManager placeholderWithTraitCollection:completion:](self, "placeholderWithTraitCollection:completion:", v18, v49);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v52);
  if (!v30)
  {
LABEL_12:
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", *(double *)&v12, *(double *)&v11);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_2;
    v48[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v48[4] = v12;
    v48[5] = v11;
    objc_msgSend(v32, "imageWithActions:", v48);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v19)
    goto LABEL_7;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSMutableDictionary objectForKey:](self->_completionBlockByKey, "objectForKey:", v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = _Block_copy(v19);
    objc_msgSend(v34, "addObject:", v35);

    os_unfair_lock_unlock(p_cacheLock);
    v36 = v30;
  }
  else
  {
    v37 = !v20;
    os_unfair_lock_unlock(&self->_cacheLock);
    snapshotQueue = self->_snapshotQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_3;
    block[3] = &unk_1E3E6EA18;
    objc_copyWeak(v46, location);
    v46[1] = v12;
    v46[2] = v11;
    v39 = v18;
    v47 = v37;
    v46[3] = *(id *)&width;
    v46[4] = *(id *)&height;
    v46[5] = v14;
    v46[6] = v13;
    v42 = v39;
    v43 = self;
    v44 = v27;
    v45 = v19;
    dispatch_async(snapshotQueue, block);
    v40 = v30;

    objc_destroyWeak(v46);
  }

LABEL_9:
  objc_destroyWeak(location);

  return v30;
}

void __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 17);
    objc_msgSend(*(id *)&v4[10]._os_unfair_lock_opaque, "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v4 + 17);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (v6)
        (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v7, 0);
    }
  }

}

void __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v5 = a2;
  objc_msgSend(v3, "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v5, "fillRect:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CC1860]);
    objc_msgSend(v3, "setShowsBuildings:", 1);
    objc_msgSend(v3, "_setShowsVenues:", 0);
    objc_msgSend(v3, "_setShowsPointLabels:", 0);
    objc_msgSend(MEMORY[0x1E0CC1910], "filterExcludingAllCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPointOfInterestFilter:", v4);

    objc_msgSend(v3, "setSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_msgSend(v3, "setTraitCollection:", *(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 120))
    {
      objc_msgSend(v3, "setMapType:", 105);
    }
    else
    {
      v5 = *(double *)(a1 + 104);
      v6 = *(double *)(a1 + 112);
      objc_msgSend(v3, "setMapType:", 0);
      objc_msgSend(v3, "setRegion:", *(double *)(a1 + 88), *(double *)(a1 + 96), v5, v6);
    }
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 17);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = _Block_copy(*(const void **)(a1 + 56));
      objc_msgSend(v7, "addObject:", v8);

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
    }
    else
    {
      v9 = objc_msgSend(*((id *)WeakRetained + 3), "count");
      objc_msgSend(*((id *)WeakRetained + 3), "addObject:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*((id *)WeakRetained + 4), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = _Block_copy(*(const void **)(a1 + 56));
      objc_msgSend(v10, "addObject:", v11);

      objc_msgSend(*((id *)WeakRetained + 5), "setObject:forKey:", v10, *(_QWORD *)(a1 + 48));
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
      if (!v9)
      {
        objc_msgSend(WeakRetained, "_processNextRequest");
LABEL_11:

        goto LABEL_12;
      }
    }
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Queued snapshot for %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)_processNextRequest
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  OS_dispatch_queue *snapshotQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSMutableArray firstObject](self->_snapshotsKeysToPerform, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_snapshotOptionsByKey, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_cacheLock);
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Getting snapshot for %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", v5);
    snapshotQueue = self->_snapshotQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__PKMapsSnapshotManager__processNextRequest__block_invoke;
    v10[3] = &unk_1E3E6EA40;
    v10[4] = self;
    objc_copyWeak(&v14, (id *)buf);
    v11 = v5;
    v12 = v4;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v9, "startWithQueue:completionHandler:", snapshotQueue, v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __44__PKMapsSnapshotManager__processNextRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__PKMapsSnapshotManager__processNextRequest__block_invoke_2;
  v10[3] = &unk_1E3E68788;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = *(id *)(a1 + 56);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void __44__PKMapsSnapshotManager__processNextRequest__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  UIImage *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  UIImage *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
    goto LABEL_15;
  objc_msgSend(*(id *)(a1 + 32), "image");
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Snapshot completed for %@", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 18);
    objc_msgSend(*((id *)WeakRetained + 1), "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("png"));
    v7 = objc_claimAutoreleasedReturnValue();

    UIImagePNGRepresentation(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeToURL:atomically:", v7, 1);

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 18);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 17);
    objc_msgSend(*((id *)WeakRetained + 6), "addObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*((id *)WeakRetained + 7), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_7;
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Could not get snapshot for %@", buf, 0xCu);
    }
  }

LABEL_7:
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 17);
  objc_msgSend(*((id *)WeakRetained + 5), "objectForKey:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)WeakRetained + 3), "removeObjectAtIndex:", 0);
  objc_msgSend(*((id *)WeakRetained + 4), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*((id *)WeakRetained + 5), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = MEMORY[0x1E0C809B0];
    v15 = MEMORY[0x1E0C80D38];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v19[0] = v14;
        v19[1] = 3221225472;
        v19[2] = __44__PKMapsSnapshotManager__processNextRequest__block_invoke_28;
        v19[3] = &unk_1E3E618A0;
        v21 = v17;
        v20 = v3;
        dispatch_async(v15, v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  objc_msgSend(WeakRetained, "_processNextRequest");
LABEL_15:

}

uint64_t __44__PKMapsSnapshotManager__processNextRequest__block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_iconForCacheKey:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    p_cacheLock = &self->_cacheLock;
    v5 = a3;
    os_unfair_lock_lock(p_cacheLock);
    -[NSMutableDictionary objectForKey:](self->_snapshotCache, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_snapshotCacheKeys, "removeObject:", v5);
    -[NSMutableArray addObject:](self->_snapshotCacheKeys, "addObject:", v5);

    if ((unint64_t)-[NSMutableArray count](self->_snapshotCacheKeys, "count") >= 0x33)
    {
      -[NSMutableArray firstObject](self->_snapshotCacheKeys, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](self->_snapshotCacheKeys, "removeObject:", v7);
      -[NSMutableDictionary removeObjectForKey:](self->_snapshotCache, "removeObjectForKey:", v7);

    }
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_iconFromDiskForCacheKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_fileLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NSURL URLByAppendingPathComponent:](self->_cacheURL, "URLByAppendingPathComponent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("png"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_fileLock = &self->_fileLock;
  os_unfair_lock_lock(&self->_fileLock);
  if (-[NSFileManager fileExistsAtPath:](self->_fileManager, "fileExistsAtPath:", v6))
  {
    -[NSFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2A38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && objc_msgSend(v9, "compare:", v10) == -1)
    {
      -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v5, 0);
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithContentsOfFile:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_unlock(p_fileLock);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_snapshotCacheKeys, 0);
  objc_storeStrong((id *)&self->_completionBlockByKey, 0);
  objc_storeStrong((id *)&self->_snapshotOptionsByKey, 0);
  objc_storeStrong((id *)&self->_snapshotsKeysToPerform, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

@end
