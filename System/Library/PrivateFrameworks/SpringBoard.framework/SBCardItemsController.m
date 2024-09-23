@implementation SBCardItemsController

- (SBCardItemsController)init
{
  SBCardItemsController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cardItems;
  uint64_t v5;
  NSXPCListener *listener;
  NSMutableArray *v7;
  NSMutableArray *connections;
  uint64_t v9;
  MCProfileConnection *profileConnection;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBCardItemsController;
  v2 = -[SBCardItemsController init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cardItems = v2->_cardItems;
    v2->_cardItems = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.springboard.carditemscontroller"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    connections = v2->_connections;
    v2->_connections = v7;

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v9;

    -[SBCardItemsController _updateRestrictions](v2, "_updateRestrictions");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__updateRestrictions, *MEMORY[0x1E0D46EC8], v2->_profileConnection);

  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_connections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)SBCardItemsController;
  -[SBCardItemsController dealloc](&v9, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSXPCListener *listener;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id location;

  v6 = (NSXPCListener *)a3;
  v7 = a4;
  listener = self->_listener;
  if (listener == v6)
  {
    SBCardItemsControllerClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v9);

    SBCardItemsControllerServerInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak(&location, v7);
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke;
    v17[3] = &unk_1E8EA7838;
    v17[4] = self;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v17);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_24;
    v15[3] = &unk_1E8EA7838;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v15);
    v12 = MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C80D38];
    objc_msgSend(v7, "_setQueue:", v12);

    objc_msgSend(v7, "resume");
    -[NSMutableArray addObject:](self->_connections, "addObject:", v7);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return listener == v6;
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "removeObject:", WeakRetained);

}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;

  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_24_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "removeObject:", WeakRetained);

}

- (void)setCardItems:(id)a3 forControllerWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBCardItemsController *v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  _QWORD *v22;
  SBCardItemsController *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  id v38;
  id obj;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[6];
  _QWORD v51[6];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  _BYTE v61[10];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = a4;
  -[NSMutableDictionary objectForKey:](self->_cardItems, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v44 = v8;
  v45 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0D6BFB0]);
  SBLogWallet();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v59 = objc_msgSend(v6, "count");
    v60 = 2112;
    *(_QWORD *)v61 = v6;
    *(_WORD *)&v61[8] = 2112;
    v62 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Received set card items [%ld]: %@ from: %@", buf, 0x20u);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v10)
  {
    v11 = v10;
    v41 = *(id *)v53;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(id *)v53 != v41)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = self;
          v18 = objc_msgSend(v15, "isEqual:", v13);
          objc_msgSend(v16, "thumbnail");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            v20 = v18;
          else
            v20 = 0;
          SBLogWallet();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            v59 = (uint64_t)v14;
            v60 = 1024;
            *(_DWORD *)v61 = v18 ^ 1;
            *(_WORD *)&v61[4] = 1024;
            *(_DWORD *)&v61[6] = v19 != 0;
            LOWORD(v62) = 1024;
            *(_DWORD *)((char *)&v62 + 2) = v20 ^ 1;
            _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "Received card item %{public}@ [ didChange: %d existingCardHasThumbnail: %d ] %d", buf, 0x1Eu);
          }

          if ((v20 & 1) != 0)
          {
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v16, v14);
            self = v17;
            goto LABEL_19;
          }
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v13, v14);
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke;
          v51[3] = &unk_1E8E9E820;
          self = v17;
          v51[4] = v17;
          v51[5] = v13;
          v22 = v51;
          v23 = v17;
        }
        else
        {
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v13, v14);
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke_2;
          v50[3] = &unk_1E8E9E820;
          v50[4] = self;
          v50[5] = v13;
          v22 = v50;
          v23 = self;
        }
        -[SBCardItemsController _updateThumbnailForCardItem:withSnapshotter:completion:](v23, "_updateThumbnailForCardItem:withSnapshotter:completion:", v13, v40, v22);
LABEL_19:
        objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, v14);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v11);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v45, "allValues");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v42);
        v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        SBLogWallet();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v28, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = (uint64_t)v30;
          _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_INFO, "Remove card item %{public}@", buf, 0xCu);

        }
        -[SBCardItemsController _deactivateCardItem:](self, "_deactivateCardItem:", v28);
        v31 = (void *)MEMORY[0x1E0D6BFB0];
        objc_msgSend(v28, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", CFSTR("uniqueIDs"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", CFSTR("seedIndex"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "unsignedIntegerValue");

        if (objc_msgSend(v33, "count"))
        {
          if (v35 >= objc_msgSend(v33, "count"))
            v36 = 0;
          else
            v36 = v35;
          objc_msgSend(v33, "objectAtIndexedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }

        objc_msgSend(v31, "purgeCacheOfPassSnapshotsWithUinqueID:", v37);
      }
      v25 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v25);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cardItems, "setObject:forKeyedSubscript:", v43, v38);
}

uint64_t __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCardItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateCardItem:animated:", *(_QWORD *)(a1 + 40), 0);
}

- (void)getCardItemsForControllerWithIdentifier:(id)a3 withHandler:(id)a4
{
  NSMutableDictionary *cardItems;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    cardItems = self->_cardItems;
    v7 = a4;
    -[NSMutableDictionary objectForKey:](cardItems, "objectForKey:", a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))a4 + 2))(v7, v8, 0);

  }
}

- (void)_updateThumbnailForCardItem:(id)a3 withSnapshotter:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD);
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("uniqueIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("manifestHashes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("seedIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  if (objc_msgSend(v11, "count"))
    v15 = objc_msgSend(v12, "count") != 0;
  else
    v15 = 0;
  SBLogWallet();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    v29 = 1024;
    v30 = v15;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Update thumbnail card item %{public}@ shouldRequestSnapshot: %d", buf, 0x12u);

  }
  if (v15)
  {
    if (v14 >= objc_msgSend(v11, "count"))
      v18 = 0;
    else
      v18 = v14;
    if (v14 >= objc_msgSend(v12, "count"))
      v19 = 0;
    else
      v19 = v14;
    objc_msgSend(v11, "objectAtIndexedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWallet();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "Request snapshot for card item %{public}@", buf, 0xCu);

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke;
    v24[3] = &unk_1E8EB7988;
    v25 = v7;
    v26 = v9;
    objc_msgSend(v8, "snapshotWithUniqueID:manifestHash:size:completion:", v20, v21, v24, 53.0, 66.0);

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

void __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke_2;
  block[3] = &unk_1E8E9F7B8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _BOOL4 v4;
  uint64_t result;
  int v6;
  void *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogWallet();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40) != 0;
    v6 = 138543618;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Received snapshot for card item %{public}@: %d", (uint8_t *)&v6, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setThumbnail:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_activateCardItem:(id)a3 animated:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogWallet();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Activating card item: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[SBCardItemsController walletNotificationSource](self, "walletNotificationSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationRequestForCardItem:", v5);

}

- (void)_updateCardItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWallet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Updating card item: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[SBCardItemsController walletNotificationSource](self, "walletNotificationSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modifyNotificationRequestForCardItem:", v4);

}

- (void)_deactivateCardItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWallet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Deactivating card item: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  -[SBCardItemsController walletNotificationSource](self, "walletNotificationSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "withdrawNotificationRequestForCardItem:", v4);

}

- (void)_updateRestrictions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBCardItemsController__updateRestrictions__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __44__SBCardItemsController__updateRestrictions__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F90]);
  v3 = result == 1;
  if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40) != v3)
  {
    SBLogWallet();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Card while locked restriction changed: %d", buf, 8u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__SBCardItemsController__updateRestrictions__block_invoke_27;
    v7[3] = &unk_1E8EA3160;
    v7[4] = v5;
    return objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  }
  return result;
}

uint64_t __44__SBCardItemsController__updateRestrictions__block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SBCardItemsController__updateRestrictions__block_invoke_2;
  v4[3] = &unk_1E8EA3160;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __44__SBCardItemsController__updateRestrictions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCardItem:");
}

- (SBWalletNotificationSource)walletNotificationSource
{
  return self->_walletNotificationSource;
}

- (void)setWalletNotificationSource:(id)a3
{
  objc_storeStrong((id *)&self->_walletNotificationSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletNotificationSource, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_cardItems, 0);
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SBCardItemsController connection interrupted.", a5, a6, a7, a8, 0);
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_24_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SBCardItemsController connection invalidated.", a5, a6, a7, a8, 0);
}

@end
