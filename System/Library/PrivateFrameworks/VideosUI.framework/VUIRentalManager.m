@implementation VUIRentalManager

void __34__VUIRentalManager_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIRentalManager");
  v1 = (void *)sLogObject_21;
  sLogObject_21 = (uint64_t)v0;

  v2 = -[VUIRentalManager _init]([VUIRentalManager alloc], "_init");
  v3 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v2;

}

- (id)_init
{
  VUIRentalManager *v2;
  NSMutableSet *v3;
  NSMutableSet *deferredRentalCheckinContexts;
  dispatch_queue_t v5;
  OS_dispatch_queue *serialQueue;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VUIRentalManager;
  v2 = -[VUIRentalManager init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deferredRentalCheckinContexts = v2->_deferredRentalCheckinContexts;
    v2->_deferredRentalCheckinContexts = v3;

    v5 = dispatch_queue_create("com.VideosUI.VUIRentalManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    objc_initWeak(&location, v2);
    v7 = v2->_serialQueue;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __25__VUIRentalManager__init__block_invoke;
    v16 = &unk_1E9F99C98;
    objc_copyWeak(&v17, &location);
    dispatch_async(v7, &v13);
    objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager", v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forDownloads:", v2, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__networkReachbilityDidChange_, *MEMORY[0x1E0DC6B70], v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__activeAccountDidChange_, *MEMORY[0x1E0DAF710], 0);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __25__VUIRentalManager__init__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = (void *)MEMORY[0x1E0D511D8];
  objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInteger:", *MEMORY[0x1E0D50EE0], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v6 = (void *)MEMORY[0x1E0D51218];
  v7 = *MEMORY[0x1E0D50FA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:value:comparison:", v7, v8, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  v10 = (void *)MEMORY[0x1E0D51218];
  v11 = *MEMORY[0x1E0D50FA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithProperty:value:comparison:", v11, v12, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingPredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D512C8];
  objc_msgSend(MEMORY[0x1E0D51270], "autoupdatingSharedLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queryWithLibrary:predicate:orderingTerms:", v17, v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setIgnoreSystemFilterPredicates:", 1);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D512A0]), "initWithQuery:", v18);
  objc_msgSend(v19, "updateToLibraryCurrentRevision");
  if (objc_msgSend(v19, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__VUIRentalManager__init__block_invoke_2;
    block[3] = &unk_1E9F99C98;
    objc_copyWeak(&v21, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v21);
  }

}

- (void)downloadManagerDidBecomeInitialized:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[VUIRentalManager _areDownloadManagersInitialized](self, "_areDownloadManagersInitialized", a3))
  {
    v4 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Initial downloads have been retrieved.  Checking in rentals as necessary", v5, 2u);
    }
    -[VUIRentalManager _checkInRentalsNeedingCheckIn](self, "_checkInRentalsNeedingCheckIn");
  }
}

- (void)_didFetchInitialStoreDownloads:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[VUIRentalManager _areDownloadManagersInitialized](self, "_areDownloadManagersInitialized", a3))
  {
    v4 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Initial downloads have been retrieved.  Checking in rentals as necessary", v5, 2u);
    }
    -[VUIRentalManager _checkInRentalsNeedingCheckIn](self, "_checkInRentalsNeedingCheckIn");
  }
}

- (void)initializeRentals
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (!-[VUIRentalManager initialized](self, "initialized"))
  {
    -[VUIRentalManager setInitialized:](self, "setInitialized:", 1);
    -[VUIRentalManager _sendPlaybackStartDatesToServerIfNecessary](self, "_sendPlaybackStartDatesToServerIfNecessary");
    +[VUIRentalExpirationMonitor sharedInstance](VUIRentalExpirationMonitor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startMonitoring");

    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDelegate:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__didFetchInitialStoreDownloads_, *MEMORY[0x1E0CC2270], 0);

    if (-[VUIRentalManager _areDownloadManagersInitialized](self, "_areDownloadManagersInitialized"))
    {
      -[VUIRentalManager _checkInRentalsNeedingCheckIn](self, "_checkInRentalsNeedingCheckIn");
    }
    else
    {
      v6 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for list of downloads to be populated before checking in rentals", v7, 2u);
      }
    }
  }
}

- (BOOL)_areDownloadManagersInitialized
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CC2510], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasFetchedInitialDownloads"))
  {
    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInitialized");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)_sendPlaybackStartDatesToServerIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];
  id location[2];

  if (-[VUIRentalManager needToSendPlaybackStartDatesToServer](self, "needToSendPlaybackStartDatesToServer")
    && (objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isNetworkReachable"),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_activeiTunesAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_DSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "unsignedLongLongValue"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF608]), "initWithAccountIdentifier:", v7);
      objc_initWeak(location, self);
      v9 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Sending rental playback start dates to server", buf, 2u);
      }
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke;
      v12[3] = &unk_1E9FA3470;
      objc_copyWeak(&v13, location);
      objc_msgSend(v8, "startWithConnectionResponseBlock:", v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);

    }
    else
    {
      v11 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Not sending rental playback start dates to server since no user is signed in", (uint8_t *)location, 2u);
      }
    }

  }
  else
  {
    v10 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Not sending rental playback start dates to server since we have no updates or because network is not available", (uint8_t *)location, 2u);
    }
  }
}

- (BOOL)needToSendPlaybackStartDatesToServer
{
  return self->_needToSendPlaybackStartDatesToServer;
}

- (void)_checkInRentalsNeedingCheckIn
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  _QWORD block[5];
  _QWORD v38[4];
  id v39;
  id v40;
  NSObject *v41;
  __int128 *p_buf;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id location;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  __int128 buf;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = sLogObject_21;
  v6 = os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Looking for rentals that should not be checked out", (uint8_t *)&buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CC2438], "movieRentalsQuery");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithValue:forProperty:comparisonType:", v8, *MEMORY[0x1E0CC1F10], 101);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "addObject:", v32);
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CC1E90], 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v31);
    v9 = (void *)MEMORY[0x1E0CC23B8];
    v10 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v9, "predicateMatchingPredicates:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "addFilterPredicate:", v30);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_msgSend(v12, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Found %lu unexpired rentals", (uint8_t *)&buf, 0xCu);

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v12;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v19, "vui_isDownloadedOrDownloading") & 1) == 0)
            objc_msgSend(v11, "addObject:", v19);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v16);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v55 = 0x2020000000;
    v56 = 0;
    v20 = dispatch_group_create();
    objc_initWeak(&location, self);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = v11;
    v21 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v45;
      v23 = *MEMORY[0x1E0CC1FB8];
      v24 = *MEMORY[0x1E0CC1F68];
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v35);
          v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v26, "valueForProperty:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "valueForProperty:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "unsignedLongLongValue"))
          {
            if (objc_msgSend(v28, "unsignedLongLongValue"))
            {
              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF600]), "initWithAccountIdentifier:rentalKeyIdentifier:", v28, v27);
              dispatch_group_enter(v20);
              v38[0] = MEMORY[0x1E0C809B0];
              v38[1] = 3221225472;
              v38[2] = __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke;
              v38[3] = &unk_1E9FA34C0;
              objc_copyWeak(&v43, &location);
              v39 = v27;
              p_buf = &buf;
              v40 = v28;
              v41 = v20;
              objc_msgSend(v29, "startWithResponseBlock:", v38);

              objc_destroyWeak(&v43);
            }
          }

        }
        v21 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v21);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_76;
    block[3] = &unk_1E9F9F5A0;
    block[4] = &buf;
    dispatch_group_notify(v20, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
  else if (v6)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Not looking for rentals that should not be checked out because no user is signed in", (uint8_t *)&buf, 2u);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_32 != -1)
    dispatch_once(&sharedInstance_onceToken_32, &__block_literal_global_138);
  return (id)sharedInstance_sInstance;
}

void __25__VUIRentalManager__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Found at least one rental still in rental window.  Will send playback start dates to server", v3, 2u);
  }
  objc_msgSend(WeakRetained, "setNeedToSendPlaybackStartDatesToServer:", 1);
  if (objc_msgSend(WeakRetained, "initialized"))
    objc_msgSend(WeakRetained, "_sendPlaybackStartDatesToServerIfNecessary");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIRentalManager;
  -[VUIRentalManager dealloc](&v4, sel_dealloc);
}

- (void)checkOutRentalWithID:(id)a3 dsid:(id)a4 checkoutType:(unint64_t)a5 startPlaybackClock:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD, void *);
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v8 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD, void *))a7;
  if (!v13 || !objc_msgSend(v13, "unsignedLongLongValue"))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
    {
      -[VUIRentalManager checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:].cold.1();
      if (!v14)
        goto LABEL_19;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (!v12 || !objc_msgSend(v12, "unsignedLongLongValue"))
  {
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
    {
      -[VUIRentalManager checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:].cold.2();
      if (!v14)
        goto LABEL_19;
      goto LABEL_18;
    }
LABEL_17:
    if (!v14)
      goto LABEL_19;
LABEL_18:
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123008, 0);
    v14[2](v14, 0, v22);

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isNetworkReachable");

  if (v16)
  {
    v17 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("Download");
      if (a5 == 2)
        v18 = CFSTR("Streaming");
      v19 = CFSTR("YES");
      if (!v8)
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Checking out rental with type %@; using play param: %@",
        buf,
        0x16u);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5F8]), "initWithAccountIdentifier:rentalKeyIdentifier:", v13, v12);
    objc_msgSend(v20, "setCheckoutType:", a5);
    objc_msgSend(v20, "setCheckoutWithPlay:", v8);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke;
    v25[3] = &unk_1E9FA3420;
    v26 = v14;
    objc_msgSend(v20, "startWithConnectionResponseBlock:", v25);

  }
  else
  {
    if (v8)
    {
      v23 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "Network is not reachable.  Will send playback start date to server when network becomes reachable.", buf, 2u);
      }
      -[VUIRentalManager setNeedToSendPlaybackStartDatesToServer:](self, "setNeedToSendPlaybackStartDatesToServer:", 1);
    }
    v24 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "Not checking out rental because network is not available.  Return YES for success anyway so playback can proceed", buf, 2u);
    }
    if (v14)
      v14[2](v14, 1, 0);
  }
LABEL_19:

}

void __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Rental checkout complete", buf, 2u);
  }
  if (v6)
  {
    v8 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Rental checkout failed with error: %@", buf, 0xCu);
    }
    v9 = v6;
    objc_msgSend(v5, "bodyData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("failureType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v12, "integerValue") == 5102)
      {
        v21 = *MEMORY[0x1E0CB3388];
        v22 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 812, v13);

        v9 = (id)v14;
      }

    }
  }
  else
  {
    v9 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke_62;
  block[3] = &unk_1E9F9DB98;
  v15 = *(id *)(a1 + 32);
  v20 = v6 == 0;
  v18 = v9;
  v19 = v15;
  v16 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__VUIRentalManager_checkOutRentalWithID_dsid_checkoutType_startPlaybackClock_completion___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)checkInRentalWithID:(id)a3 dsid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  VUIRentalCheckInContext *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  VUIRentalManager *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "unsignedLongLongValue"))
  {
    if (v8 && objc_msgSend(v8, "unsignedLongLongValue"))
    {
      objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isNetworkReachable");

      v13 = sLogObject_21;
      v14 = os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          v24 = v8;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Checking in rental with ID %@", buf, 0xCu);
        }
        v15 = (VUIRentalCheckInContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5F0]), "initWithAccountIdentifier:rentalKeyIdentifier:", v9, v8);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke;
        v18[3] = &unk_1E9FA3448;
        v19 = v8;
        v20 = v9;
        v21 = self;
        v22 = v10;
        -[VUIRentalCheckInContext startWithConnectionResponseBlock:](v15, "startWithConnectionResponseBlock:", v18);

      }
      else
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Network is not reachable.  Will check in rental when network becomes available.", buf, 2u);
        }
        v15 = -[VUIRentalCheckInContext initWithRentalID:dsid:]([VUIRentalCheckInContext alloc], "initWithRentalID:dsid:", v8, v9);
        -[VUIRentalManager deferredRentalCheckinContexts](self, "deferredRentalCheckinContexts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v15);

      }
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
    {
      -[VUIRentalManager checkInRentalWithID:dsid:completion:].cold.2();
      if (!v10)
        goto LABEL_16;
      goto LABEL_14;
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
  {
    -[VUIRentalManager checkInRentalWithID:dsid:completion:].cold.1();
    if (!v10)
      goto LABEL_16;
    goto LABEL_14;
  }
  if (v10)
  {
LABEL_14:
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = (VUIRentalCheckInContext *)objc_msgSend(v16, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123008, 0);
    (*((void (**)(id, _QWORD, VUIRentalCheckInContext *))v10 + 2))(v10, 0, v15);
LABEL_15:

  }
LABEL_16:

}

void __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  VUIRentalCheckInContext *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Rental checkin complete for ID %@", buf, 0xCu);
  }
  if (v6)
  {
    v9 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Rental checkin failed with error.  Will try to check in later. %@", buf, 0xCu);
    }
    v10 = -[VUIRentalCheckInContext initWithRentalID:dsid:]([VUIRentalCheckInContext alloc], "initWithRentalID:dsid:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "deferredRentalCheckinContexts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke_65;
  v14[3] = &unk_1E9F99420;
  v12 = *(id *)(a1 + 56);
  v15 = v6;
  v16 = v12;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

uint64_t __56__VUIRentalManager_checkInRentalWithID_dsid_completion___block_invoke_65(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[16];

  v5 = a4;
  objc_msgSend(v5, "phaseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CC2278]) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CC2288]))
  {
    v7 = objc_msgSend(v5, "storeItemIdentifier");
    v8 = (void *)MEMORY[0x1E0CC2430];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithValue:forProperty:", v9, *MEMORY[0x1E0CC1FA0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", &unk_1EA0BA120, *MEMORY[0x1E0CC1EC0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0CC2438]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFilterPredicates:", v13);

    objc_msgSend(v14, "setEntityLimit:", 1);
    objc_msgSend(v14, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isRental"))
    {
      objc_msgSend(v16, "valueForProperty:", *MEMORY[0x1E0CC1FB8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForProperty:", *MEMORY[0x1E0CC1F68]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = sLogObject_21;
      if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Checking in rental for download that was cancelled or failed", buf, 2u);
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__VUIRentalManager_downloadManager_downloadDidFinish___block_invoke;
      block[3] = &unk_1E9F99840;
      block[4] = self;
      v23 = v17;
      v24 = v18;
      v20 = v18;
      v21 = v17;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __54__VUIRentalManager_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkInRentalWithID:dsid:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)_networkReachbilityDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0DC6A38];
    v7 = v5;
    objc_msgSend(v6, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isNetworkReachable");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v22 = 138412290;
    v23 = (uint64_t)v10;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Network reachability did change.  Is reachable: %@", (uint8_t *)&v22, 0xCu);

  }
  -[VUIRentalManager _sendPlaybackStartDatesToServerIfNecessary](self, "_sendPlaybackStartDatesToServerIfNecessary");
  v11 = (void *)sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[VUIRentalManager deferredRentalCheckinContexts](self, "deferredRentalCheckinContexts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    v22 = 134217984;
    v23 = v14;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "%lu rental checkins have been deferred", (uint8_t *)&v22, 0xCu);

  }
  -[VUIRentalManager deferredRentalCheckinContexts](self, "deferredRentalCheckinContexts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isNetworkReachable");

    v19 = sLogObject_21;
    v20 = os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Validating that deferred checkins are still okay to check in", (uint8_t *)&v22, 2u);
      }
      -[VUIRentalManager deferredRentalCheckinContexts](self, "deferredRentalCheckinContexts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeAllObjects");

      -[VUIRentalManager _checkInRentalsNeedingCheckIn](self, "_checkInRentalsNeedingCheckIn");
    }
    else if (v20)
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Network is not available, not checking in rentals that have been deferred", (uint8_t *)&v22, 2u);
    }
  }

}

- (void)_activeAccountDidChange:(id)a3
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  v3 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Active account did change", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VUIRentalManager__activeAccountDidChange___block_invoke;
  block[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__VUIRentalManager__activeAccountDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendPlaybackStartDatesToServerIfNecessary");
  objc_msgSend(WeakRetained, "_checkInRentalsNeedingCheckIn");

}

void __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Finished sending rental playback start dates to server", v10, 2u);
  }
  if (v6)
  {
    v8 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_ERROR))
      __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke_cold_1((uint64_t)v6, v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setNeedToSendPlaybackStartDatesToServer:", 0);

  }
}

void __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_2;
  v5[3] = &unk_1E9FA3498;
  v11 = a2;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v9 = v4;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v10);
}

void __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v3 = sLogObject_21;
    if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Found rental with id %@ that needs to be checked in", (uint8_t *)&v5, 0xCu);
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(WeakRetained, "checkInRentalWithID:dsid:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __49__VUIRentalManager__checkInRentalsNeedingCheckIn__block_invoke_76(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = sLogObject_21;
  if (os_log_type_enabled((os_log_t)sLogObject_21, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Found %lu rentals needing to be checked in", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setNeedToSendPlaybackStartDatesToServer:(BOOL)a3
{
  self->_needToSendPlaybackStartDatesToServer = a3;
}

- (NSMutableSet)deferredRentalCheckinContexts
{
  return self->_deferredRentalCheckinContexts;
}

- (void)setDeferredRentalCheckinContexts:(id)a3
{
  objc_storeStrong((id *)&self->_deferredRentalCheckinContexts, a3);
}

- (BOOL)initialRentalsFetched
{
  return self->_initialRentalsFetched;
}

- (void)setInitialRentalsFetched:(BOOL)a3
{
  self->_initialRentalsFetched = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deferredRentalCheckinContexts, 0);
}

- (void)checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to check out rental since dsid is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)checkOutRentalWithID:dsid:checkoutType:startPlaybackClock:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to check out rental since rental ID is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)checkInRentalWithID:dsid:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to check in rental since dsid is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)checkInRentalWithID:dsid:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to check in rental since rental ID is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __62__VUIRentalManager__sendPlaybackStartDatesToServerIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Error sending rental playback start dates to server: %@", (uint8_t *)&v2, 0xCu);
}

@end
