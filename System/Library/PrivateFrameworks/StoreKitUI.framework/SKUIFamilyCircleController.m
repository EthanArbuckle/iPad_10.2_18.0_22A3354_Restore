@implementation SKUIFamilyCircleController

+ (id)sharedController
{
  if (sharedController_sOnce_0 != -1)
    dispatch_once(&sharedController_sOnce_0, &__block_literal_global_45);
  return (id)sharedController_sInstance;
}

void __46__SKUIFamilyCircleController_sharedController__block_invoke()
{
  SKUIFamilyCircleController *v0;
  void *v1;

  v0 = objc_alloc_init(SKUIFamilyCircleController);
  v1 = (void *)sharedController_sInstance;
  sharedController_sInstance = (uint64_t)v0;

}

- (SKUIFamilyCircleController)init
{
  SKUIFamilyCircleController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSCache *v7;
  NSCache *imageCache;
  objc_super v10;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIFamilyCircleController init].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIFamilyCircleController;
  v3 = -[SKUIFamilyCircleController init](&v10, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DAF718];
    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__accountStoreDidChange_, v5, v6);

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v3->_imageCache;
    v3->_imageCache = v7;

    v3->_reloadPromptStyle = -1;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DAF718];
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SKUIFamilyCircleController;
  -[SKUIFamilyCircleController dealloc](&v6, sel_dealloc);
}

- (void)reloadData
{
  if (-[SKUIFamilyCircleController reloadPromptStyle](self, "reloadPromptStyle"))
    -[SKUIFamilyCircleController _reloadDataWithPromptStyle:](self, "_reloadDataWithPromptStyle:", 0);
}

- (id)profilePictureForFamilyMember:(id)a3
{
  NSCache *imageCache;
  void *v4;
  void *v5;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "iCloudIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](imageCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accountStoreDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SKUIFamilyCircleController__accountStoreDidChange___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(v4, block);

}

void __53__SKUIFamilyCircleController__accountStoreDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "lastAccountID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_reloadDataWithPromptStyle:", 1000);

}

- (void)_reloadDataWithPromptStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10[2];
  id location;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIFamilyCircleController setLastAccountID:](self, "setLastAccountID:", v7);

  -[SKUIFamilyCircleController setReloadPromptStyle:](self, "setReloadPromptStyle:", a3);
  objc_initWeak(&location, self);
  -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke;
  v9[3] = &unk_1E73A76E0;
  v10[1] = (id)a3;
  v9[4] = self;
  objc_copyWeak(v10, &location);
  objc_msgSend(v8, "loadValueForKey:completionBlock:", CFSTR("shared-purchases-enabled"), v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  id *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[5];
  id v9[2];

  if (objc_msgSend(a2, "BOOLValue"))
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2;
    block[3] = &unk_1E73A13D8;
    v4 = *(_QWORD *)(a1 + 32);
    v9[1] = *(id *)(a1 + 48);
    block[4] = v4;
    v5 = v9;
    objc_copyWeak(v9, (id *)(a1 + 40));
    dispatch_async(v3, block);

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_4;
    v6[3] = &unk_1E739FE78;
    v6[4] = *(_QWORD *)(a1 + 32);
    v5 = &v7;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
  objc_destroyWeak(v5);
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2;
  dispatch_semaphore_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v10[9];
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__75;
  v26[4] = __Block_byref_object_dispose__75;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__75;
  v24[4] = __Block_byref_object_dispose__75;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__75;
  v22[4] = __Block_byref_object_dispose__75;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__75;
  v20[4] = __Block_byref_object_dispose__75;
  v21 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = dispatch_semaphore_create(0);
  v4 = objc_alloc_init(MEMORY[0x1E0DAF528]);
  objc_msgSend(v4, "setAuthenticationPromptStyle:", *(_QWORD *)(a1 + 48));
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_35;
  v16[3] = &unk_1E73A7668;
  v18 = v26;
  v19 = v24;
  v6 = v2;
  v17 = v6;
  objc_msgSend(v4, "startWithResponseBlock:", v16);
  v7 = SKUIFamilyCircleFramework();
  v8 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("FAFetchFamilyCircleRequest"), v7));
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2_39;
  v12[3] = &unk_1E73A7690;
  v14 = v22;
  v15 = v20;
  v9 = v3;
  v13 = v9;
  objc_msgSend(v8, "startRequestWithCompletionHandler:", v12);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_3;
  v10[3] = &unk_1E73A76B8;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10[5] = v26;
  v10[6] = v24;
  v10[7] = v22;
  v10[8] = v20;
  dispatch_async(MEMORY[0x1E0C80D38], v10);
  objc_destroyWeak(&v11);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "familyCircle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_2_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setReloadPromptStyle:", -1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_setITunesFamily:error:iCloudFamily:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

void __57__SKUIFamilyCircleController__reloadDataWithPromptStyle___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setReloadPromptStyle:", -1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setITunesFamily:error:iCloudFamily:error:", 0, 0, 0, 0);

}

- (void)_setITunesFamily:(id)a3 error:(id)a4 iCloudFamily:(id)a5 error:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSCache *imageCache;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = a5;
  self->_hasLoaded = 1;
  objc_storeStrong((id *)&self->_iTunesFamily, a3);
  objc_storeStrong((id *)&self->_iCloudFamily, a5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("SKUIFamilyCircleDidChangeNotification"), self);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SSFamilyCircle familyMembers](self->_iTunesFamily, "familyMembers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        imageCache = self->_imageCache;
        objc_msgSend(v15, "iCloudIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](imageCache, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          objc_initWeak(&location, self);
          dispatch_get_global_queue(0, 0);
          v19 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke;
          block[3] = &unk_1E739FE78;
          block[4] = v15;
          objc_copyWeak(&v23, &location);
          dispatch_async(v19, block);

          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

}

void __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "firstName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iCloudAccountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iCloudIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIGetFamilyMemberImage(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __72__SKUIFamilyCircleController__setITunesFamily_error_iCloudFamily_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setProfilePicture:forMember:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setProfilePicture:(id)a3 forMember:(id)a4
{
  NSCache *imageCache;
  id v7;
  void *v8;
  id v9;

  imageCache = self->_imageCache;
  v7 = a3;
  objc_msgSend(a4, "iCloudIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](imageCache, "setObject:forKey:", v7, v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("SKUIFamilyCircleProfilePictureDidChangeNotification"), self);

}

- (SSFamilyCircle)familyCircle
{
  return self->_iTunesFamily;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (FAFamilyCircle)iCloudFamily
{
  return self->_iCloudFamily;
}

- (NSNumber)lastAccountID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)reloadPromptStyle
{
  return self->_reloadPromptStyle;
}

- (void)setReloadPromptStyle:(int64_t)a3
{
  self->_reloadPromptStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccountID, 0);
  objc_storeStrong((id *)&self->_iCloudFamily, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_iTunesFamily, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFamilyCircleController init]";
}

@end
