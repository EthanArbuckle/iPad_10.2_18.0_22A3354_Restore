@implementation WLKOfferManager

void __42__WLKOfferManager_fetchOffers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - fetchOffers: end", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v3, 0);

}

void __38__WLKOfferManager_defaultOfferManager__block_invoke()
{
  WLKOfferManager *v0;
  void *v1;

  v0 = objc_alloc_init(WLKOfferManager);
  v1 = (void *)defaultOfferManager___defaultOfferManager;
  defaultOfferManager___defaultOfferManager = (uint64_t)v0;

}

void __31__WLKOfferManager_clearOffers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - clearAllOffers: end", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (WLKOfferManager)init
{
  WLKOfferManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)WLKOfferManager;
  v2 = -[WLKOfferManager init](&v24, sel_init);
  if (v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - + (instancetype)defaultOfferManager - init", buf, 2u);
    }

    v4 = dispatch_queue_create("com.apple.WatchListKit.OfferManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (WLKIsDaemon())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[WLKAccountMonitor sharedInstance](WLKAccountMonitor, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__activeAccountChangedNotification_, CFSTR("WLKAccountMonitorAccountDidChange"), v7);

      v8 = (void *)MEMORY[0x1E0C99D50];
      +[WLKOfferManager _offerFullPath](WLKOfferManager, "_offerFullPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataWithContentsOfFile:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
        v23 = 0;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, &v23);
        v12 = v23;
        os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
        if (v12)
        {
          WLKSystemLogObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl(&dword_1B515A000, v13, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - init read from disk failed secure unarchiver error: %@", buf, 0xCu);
          }
        }
        else
        {
          v14 = (void *)MEMORY[0x1E0C99E60];
          v15 = objc_opt_class();
          v16 = objc_opt_class();
          v17 = objc_opt_class();
          v18 = objc_opt_class();
          objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v13, *MEMORY[0x1E0CB2CD0]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = objc_msgSend(v19, "copy");
            -[WLKOfferManager _setOffers:](v2, "_setOffers:", v21);
          }
          else
          {
            WLKSystemLogObject();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B515A000, v21, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - init read from disk unarchiver failed to decode object", buf, 2u);
            }
          }

        }
      }

    }
  }
  return v2;
}

- (void)fetchOffers:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  BOOL v25;
  id buf;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  v6 = a4;
  WLKSystemLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - fetchOffers: begin", (uint8_t *)&buf, 2u);
  }

  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke;
  v27[3] = &unk_1E68A7F00;
  v9 = v6;
  v28 = v9;
  v10 = (void *)MEMORY[0x1B5E47FF4](v27);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke_44;
    block[3] = &unk_1E68A7F28;
    objc_copyWeak(&v24, &buf);
    v25 = v4;
    v23 = v10;
    v12 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&buf);
  }
  else
  {
    -[WLKOfferManager _connection](self, "_connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke_46;
    v20[3] = &unk_1E68A7E88;
    v14 = v10;
    v21 = v14;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WLKSystemLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B515A000, v16, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for fetching", (uint8_t *)&buf, 2u);
    }

    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke_47;
    v18[3] = &unk_1E68A7F50;
    v18[4] = self;
    v19 = v14;
    v17 = v14;
    objc_msgSend(v15, "fetchOffers:completion:", v4, v18);

  }
}

- (void)clearOffers:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id buf;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - clearAllOffers: begin", (uint8_t *)&buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __31__WLKOfferManager_clearOffers___block_invoke;
  v24[3] = &unk_1E68A7E88;
  v7 = v4;
  v25 = v7;
  v8 = (void *)MEMORY[0x1B5E47FF4](v24);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __31__WLKOfferManager_clearOffers___block_invoke_54;
    block[3] = &unk_1E68A7A28;
    objc_copyWeak(&v22, &buf);
    v21 = v8;
    v10 = v8;
    dispatch_async(queue, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&buf);
  }
  else
  {
    -[WLKOfferManager _connection](self, "_connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __31__WLKOfferManager_clearOffers___block_invoke_2;
    v18[3] = &unk_1E68A7E88;
    v12 = v8;
    v19 = v12;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    WLKSystemLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B515A000, v14, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for clearing all offers", (uint8_t *)&buf, 2u);
    }

    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __31__WLKOfferManager_clearOffers___block_invoke_56;
    v16[3] = &unk_1E68A7E88;
    v17 = v12;
    v15 = v12;
    objc_msgSend(v13, "clearOffers:", v16);

  }
}

- (void)_setOffers:(id)a3
{
  NSArray *v4;
  NSArray *offers;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&__offersLock);
  offers = self->_offers;
  self->_offers = v4;

  os_unfair_lock_unlock(&__offersLock);
}

- (id)_offers
{
  void *v3;

  os_unfair_lock_lock(&__offersLock);
  v3 = (void *)-[NSArray copy](self->_offers, "copy");
  os_unfair_lock_unlock(&__offersLock);
  return v3;
}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_60);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __30__WLKOfferManager__connection__block_invoke_61;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

+ (id)defaultOfferManager
{
  if (defaultOfferManager___once != -1)
    dispatch_once(&defaultOfferManager___once, &__block_literal_global_6);
  return (id)defaultOfferManager___defaultOfferManager;
}

+ (id)_offerPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  WLKDefaultSupportPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_DSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v2, "stringByAppendingPathComponent:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v7;
      }

    }
  }
  else
  {
    NSLog(CFSTR("WLKSettingsStore - Error: DefaultSupportPath returned nil"));
  }
  return v2;
}

+ (id)_offerFullPath
{
  void *v2;
  void *v3;
  void *v4;

  +[WLKOfferManager _offerPath](WLKOfferManager, "_offerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("offers.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByExpandingTildeInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)saveOffer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id buf;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - saveOffer: begin", (uint8_t *)&buf, 2u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke;
  v28[3] = &unk_1E68A7E88;
  v10 = v7;
  v29 = v10;
  v11 = (void *)MEMORY[0x1B5E47FF4](v28);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_38;
    block[3] = &unk_1E68A7ED8;
    objc_copyWeak(&v26, &buf);
    v24 = v6;
    v25 = v11;
    v13 = v11;
    dispatch_async(queue, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&buf);
  }
  else
  {
    -[WLKOfferManager _connection](self, "_connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_3;
    v21[3] = &unk_1E68A7E88;
    v15 = v11;
    v22 = v15;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WLKSystemLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for saving offer", (uint8_t *)&buf, 2u);
    }

    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_42;
    v19[3] = &unk_1E68A7E88;
    v20 = v15;
    v18 = v15;
    objc_msgSend(v16, "saveOffer:completionHandler:", v6, v19);

  }
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - saveOffer: end", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_38(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (!a1[4])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKOfferManagerErrorDomain"), -1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[5] + 2))();

    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "_offers");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(v3, "_offers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "_setOffers:", v11);

    objc_msgSend(v3, "_updateOfferFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[5] + 2))();

    goto LABEL_14;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_msgSend(v3, "_offers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_2;
  v20[3] = &unk_1E68A7EB0;
  v21 = a1[4];
  v22 = a1[5];
  v23 = &v24;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);

  v9 = *((unsigned __int8 *)v25 + 24);
  if (*((_BYTE *)v25 + 24))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v3, "_offers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v16 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "_offers");
    if (v15 < 5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v16, "arrayWithArray:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "subarrayWithRange:", 1, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v16, "arrayWithArray:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "addObject:", a1[4]);
  }

  _Block_object_dispose(&v24, 8);
  if (!v9)
    goto LABEL_7;
LABEL_14:

}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  if (objc_msgSend(a2, "isEqualToDictionary:", a1[4]))
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKOfferManagerErrorDomain"), -2, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

  }
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for saving offer", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke_44(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_offers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "_setOffers:", 0);
    os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKOfferManager _offerFullPath](WLKOfferManager, "_offerFullPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v5, &v8);
    v6 = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
    if (v6)
    {
      WLKSystemLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Failed to clear offers after fetching (%@)", buf, 0xCu);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for fetching", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v3 && objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "sendBadgeActionMetricsEvents:", v3);

}

- (void)removeOfferByBadgeId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id buf;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  WLKSystemLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - removeOffer: begin", (uint8_t *)&buf, 2u);
  }

  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke;
  v28[3] = &unk_1E68A7E88;
  v10 = v7;
  v29 = v10;
  v11 = (void *)MEMORY[0x1B5E47FF4](v28);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_49;
    block[3] = &unk_1E68A7ED8;
    objc_copyWeak(&v26, &buf);
    v24 = v6;
    v25 = v11;
    v13 = v11;
    dispatch_async(queue, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&buf);
  }
  else
  {
    -[WLKOfferManager _connection](self, "_connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_52;
    v21[3] = &unk_1E68A7E88;
    v15 = v11;
    v22 = v15;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    WLKSystemLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for removing offer", (uint8_t *)&buf, 2u);
    }

    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_53;
    v19[3] = &unk_1E68A7E88;
    v20 = v15;
    v18 = v15;
    objc_msgSend(v16, "removeOfferByBadgeId:completionHandler:", v6, v19);

  }
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - removeOffer: end", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_49(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_offers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v5 = MEMORY[0x1E0C809B0];
    v24 = -1;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_2;
    v19[3] = &unk_1E68A7F78;
    v20 = a1[4];
    p_buf = &buf;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);
    v6 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v6 == -1
      || (objc_msgSend(WeakRetained, "_offers"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "count") == 1,
          v7,
          v8))
    {
      v9 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(WeakRetained, "_offers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v12, "arrayWithArray:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "removeObjectAtIndex:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
    }

    _Block_object_dispose(&buf, 8);
    if (v6 != -1)
    {
      if (v9)
      {
        v15 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(WeakRetained, "_setOffers:", v15);

        objc_msgSend(WeakRetained, "_updateOfferFile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void))a1[5] + 2))();

      }
      else
      {
        v17[0] = v5;
        v17[1] = 3221225472;
        v17[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_3;
        v17[3] = &unk_1E68A7E88;
        v18 = a1[5];
        objc_msgSend(WeakRetained, "clearOffers:", v17);
        v9 = v18;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
  }
  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (const __CFString *)a1[4];
    if (!v11)
      v11 = &stru_1E68AA228;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Fail to remove offer. Badge ID %@ Not found", (uint8_t *)&buf, 0xCu);
  }

  (*((void (**)(void))a1[5] + 2))();
LABEL_12:

}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  objc_msgSend(a2, "objectForKey:", CFSTR("badgeId"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Failed to remove offer - %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Remove offer successfully", (uint8_t *)&v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for removing offer", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__WLKOfferManager_clearOffers___block_invoke_54(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setOffers:", 0);
  os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKOfferManager _offerFullPath](WLKOfferManager, "_offerFullPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "removeItemAtPath:error:", v4, &v7);
  v5 = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("badgeIdentifiers"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__WLKOfferManager_clearOffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __31__WLKOfferManager_clearOffers___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for clearing all offers", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __30__WLKOfferManager__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Connection interrupted.", v1, 2u);
  }

}

void __30__WLKOfferManager__connection__block_invoke_61(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Connection invalidated.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

  }
}

- (void)_activeAccountChangedNotification:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (WLKIsDaemon())
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (!v8)
    {
      NSLog(CFSTR("WLKOfferManager - Clearing badge and previously badged offers on user signout"));
      +[WLKBadgingUtilities clearSavedBadgeIdentifiers](WLKBadgingUtilities, "clearSavedBadgeIdentifiers");
      +[WLKNotificationCenter defaultCenter](WLKNotificationCenter, "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBadgeNumber:withCompletionHandler:", v6, 0);

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("PreviouslyBadgedTVOffers"));

      v4 = 0;
    }

  }
}

- (id)_updateOfferFile
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKOfferManager _offerPath](WLKOfferManager, "_offerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v21);
  v5 = v21;

  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0CB36F8];
    -[WLKOfferManager offers](self, "offers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;

    if (!v10)
    {
LABEL_13:
      v7 = v11;

      goto LABEL_14;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
    +[WLKOfferManager _offerFullPath](WLKOfferManager, "_offerFullPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "writeToFile:atomically:", v12, 1);

    os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
    WLKSystemLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        v16 = "WLKOfferManager - _updateOfferFile: wrote offers to disk successfully";
        v17 = v14;
        v18 = 2;
LABEL_11:
        _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      v16 = "WLKOfferManager - _updateOfferFile: failed to write offers to disk - %@";
      v17 = v14;
      v18 = 12;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - _updateOfferFile: failed to create directory at path - %@", buf, 0xCu);
  }

  v7 = v5;
LABEL_14:

  return v7;
}

- (void)sendBadgeActionMetricsEvents:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CFDB60]);
  WLKTVAppBundleID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v4, "initWithContainerID:bag:", v5, v6);

  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = v3;
  objc_msgSend(v3, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metrics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v35 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (!v35)
  {
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v9 = 0;
    goto LABEL_33;
  }
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v9 = 0;
  v34 = *(_QWORD *)v46;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v46 != v34)
        objc_enumerationMutation(obj);
      v36 = v10;
      v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v42;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v16);
            objc_msgSend(v12, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v17, "isEqualToString:", CFSTR("details"))
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_24;
              v19 = v18;
              if ((objc_msgSend(v17, "isEqualToString:", CFSTR("notificationId")) & 1) != 0)
              {
                v20 = v39;
                v21 = v9;
                v39 = v19;
              }
              else
              {
                if ((objc_msgSend(v17, "isEqualToString:", CFSTR("marketingCampaignGroup")) & 1) != 0)
                {
                  v20 = v38;
                  v38 = v19;
                }
                else
                {
                  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("marketingCampaignToken")) & 1) == 0)
                  {
                    v22 = objc_msgSend(v17, "isEqualToString:", CFSTR("notificationType"));
                    v20 = v9;
                    v21 = v19;
                    if (!v22)
                      goto LABEL_23;
                    goto LABEL_22;
                  }
                  v20 = v37;
                  v37 = v19;
                }
                v21 = v9;
              }
LABEL_22:
              v19 = v19;

              v9 = v21;
              goto LABEL_23;
            }
            v19 = v40;
            v40 = v18;
LABEL_23:

LABEL_24:
            ++v16;
          }
          while (v14 != v16);
          v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
          v14 = v23;
        }
        while (v23);
      }

      v10 = v36 + 1;
    }
    while (v36 + 1 != v35);
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  }
  while (v35);
LABEL_33:

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB68]), "initWithTopic:", CFSTR("xp_amp_notifications"));
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v25, "setObject:forKey:", CFSTR("badgeAction"), CFSTR("eventType"));
  if (v40)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v40);
    objc_msgSend(v26, "removeObjectForKey:", CFSTR("brandId"));
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("details"));

  }
  if (v9)
    objc_msgSend(v25, "setObject:forKey:", v9, CFSTR("notificationType"));
  if (v39)
    objc_msgSend(v25, "setObject:forKey:", v39, CFSTR("notificationId"));
  if (v38)
    objc_msgSend(v25, "setObject:forKey:", v38, CFSTR("marketingCampaignGroup"));
  if (v37)
    objc_msgSend(v25, "setObject:forKey:", v37, CFSTR("marketingCampaignToken"));
  objc_msgSend(v24, "addPropertiesWithDictionary:", v25);
  objc_msgSend(v30, "addObject:", v24);
  WLKSystemLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v30;
    _os_log_impl(&dword_1B515A000, v28, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Will send BadgeAction events: %@", buf, 0xCu);
  }

  objc_msgSend(v31, "enqueueEvents:", v30);
  objc_msgSend(v31, "flush");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addFinishBlock:", &__block_literal_global_85);

}

void __48__WLKOfferManager_sendBadgeActionMetricsEvents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138412290;
      v10 = v3;
      v6 = "WLKOfferManager - Error flushing BadgeAction events: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    v6 = "WLKOfferManager - BadgeAction Events flushed.";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_storeStrong((id *)&self->_offers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
