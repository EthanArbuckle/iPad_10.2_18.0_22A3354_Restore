@implementation PXAssetMetadataDonator

- (PXAssetMetadataDonator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetMetadataDonator.m"), 48, CFSTR("%s is not available as initializer"), "-[PXAssetMetadataDonator init]");

  abort();
}

- (id)_init
{
  PXAssetMetadataDonator *v2;
  id v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXAssetMetadataDonator;
  v2 = -[PXAssetMetadataDonator init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    -[PXAssetMetadataDonator setLocationDescriptions:](v2, "setLocationDescriptions:", v3);

    v4 = dispatch_queue_create("PXAssetMetadataDonator Background Queue", 0);
    -[PXAssetMetadataDonator setBackgroundQueue:](v2, "setBackgroundQueue:", v4);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetMetadataDonator setLocationDescriptionsByAssetLocalIdentifiers:](v2, "setLocationDescriptionsByAssetLocalIdentifiers:", v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_donate_, *MEMORY[0x1E0DC4868], v7);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], v7);

  }
  return v2;
}

- (void)donateMetadataForAsset:(id)a3
{
  id v4;
  NSObject *backgroundQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  backgroundQueue = self->_backgroundQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PXAssetMetadataDonator_donateMetadataForAsset___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(backgroundQueue, v7);

}

- (void)donate:(id)a3
{
  NSObject *backgroundQueue;
  _QWORD block[5];

  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXAssetMetadataDonator_donate___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(backgroundQueue, block);
}

- (void)_notifyWhenDonationIsComplete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD aBlock[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXAssetMetadataDonator__notifyWhenDonationIsComplete___block_invoke;
    aBlock[3] = &unk_1E5140330;
    aBlock[4] = self;
    v10 = v11;
    v9 = v4;
    v6 = _Block_copy(aBlock);
    v7 = dispatch_time(0, 5000000000);
    dispatch_after(v7, MEMORY[0x1E0C80D38], v6);
    dispatch_async((dispatch_queue_t)self->_backgroundQueue, v6);

    _Block_object_dispose(v11, 8);
  }

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke;
  v13[3] = &unk_1E5148AA8;
  v7 = v5;
  v14 = v7;
  v15 = &v16;
  v8 = objc_msgSend(v7, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Asset Metadata Donation"), v13);
  v17[3] = v8;
  -[PXAssetMetadataDonator donate:](self, "donate:", 0);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke_2;
  v10[3] = &unk_1E5148AA8;
  v9 = v7;
  v11 = v9;
  v12 = &v16;
  -[PXAssetMetadataDonator _notifyWhenDonationIsComplete:](self, "_notifyWhenDonationIsComplete:", v10);

  _Block_object_dispose(&v16, 8);
}

- (NSCountedSet)locationDescriptions
{
  return self->_locationDescriptions;
}

- (void)setLocationDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_locationDescriptions, a3);
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)setBackgroundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundQueue, a3);
}

- (NSMutableDictionary)locationDescriptionsByAssetLocalIdentifiers
{
  return self->_locationDescriptionsByAssetLocalIdentifiers;
}

- (void)setLocationDescriptionsByAssetLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_locationDescriptionsByAssetLocalIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDescriptionsByAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_locationDescriptions, 0);
}

uint64_t __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

}

uint64_t __56__PXAssetMetadataDonator_applicationDidEnterBackground___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __56__PXAssetMetadataDonator__notifyWhenDonationIsComplete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_sync_exit(obj);

}

void __33__PXAssetMetadataDonator_donate___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[128];
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "locationDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v2 = v17;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v20;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v20 != v4)
            objc_enumerationMutation(v2);
          v6 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v5);
          v23 = 0;
          v24 = &v23;
          v25 = 0x2050000000;
          v7 = (void *)getPPLocationNamedEntitiesClass_softClass;
          v26 = getPPLocationNamedEntitiesClass_softClass;
          if (!getPPLocationNamedEntitiesClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getPPLocationNamedEntitiesClass_block_invoke;
            v29 = &unk_1E51482E0;
            v30 = &v23;
            __getPPLocationNamedEntitiesClass_block_invoke((uint64_t)buf);
            v7 = (void *)v24[3];
          }
          v8 = objc_retainAutorelease(v7);
          _Block_object_dispose(&v23, 8);
          v9 = objc_alloc_init(v8);
          objc_msgSend(v9, "setUnstructuredLocationString:", v6);
          objc_msgSend(v1, "addObject:", v9);

          ++v5;
        }
        while (v3 != v5);
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v3);
    }

    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v10 = (void *)getPPCustomDonationClass_softClass;
    v26 = getPPCustomDonationClass_softClass;
    if (!getPPCustomDonationClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPPCustomDonationClass_block_invoke;
      v29 = &unk_1E51482E0;
      v30 = &v23;
      __getPPCustomDonationClass_block_invoke((uint64_t)buf);
      v10 = (void *)v24[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v23, 8);
    v18 = 0;
    v12 = objc_msgSend(v11, "donatePhotosOneUpLocationNamedEntities:bundleId:error:", v1, CFSTR("com.apple.mobileslideshow"), &v18);
    v13 = v18;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "locationDescriptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");

      objc_msgSend(*(id *)(a1 + 32), "locationDescriptionsByAssetLocalIdentifiers");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeAllObjects](v15, "removeAllObjects");
    }
    else
    {
      PLUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PXAssetMetadataDonator donate:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
      }
    }

  }
}

void __49__PXAssetMetadataDonator_donateMetadataForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "locationDescriptionsByAssetLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v10 = 0;
    objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsIfNeeded");
    objc_msgSend(*(id *)(a1 + 40), "photosOneUpProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedGeoDescriptionIsHome:", &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "locationDescriptionsByAssetLocalIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "locationDescriptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v6);

      }
    }

  }
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetMetadataDonator.m"), 44, CFSTR("%s is not available as initializer"), "+[PXAssetMetadataDonator new]");

  abort();
}

+ (PXAssetMetadataDonator)sharedDonator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PXAssetMetadataDonator_sharedDonator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDonator_onceToken != -1)
    dispatch_once(&sharedDonator_onceToken, block);
  return (PXAssetMetadataDonator *)(id)sharedDonator_sharedDonator;
}

void __39__PXAssetMetadataDonator_sharedDonator__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedDonator_sharedDonator;
  sharedDonator_sharedDonator = v1;

}

@end
