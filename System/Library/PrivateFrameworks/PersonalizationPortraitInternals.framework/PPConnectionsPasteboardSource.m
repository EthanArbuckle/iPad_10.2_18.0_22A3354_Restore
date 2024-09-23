@implementation PPConnectionsPasteboardSource

- (id)identifier
{
  return CFSTR("pasteboard");
}

- (PPConnectionsPasteboardSource)init
{
  PPConnectionsPasteboardSource *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *init_sem;
  uint64_t v9;
  NSOperationQueue *pbQueue;
  NSOperationQueue *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSOperationQueue *v15;
  uint64_t v16;
  id pasteboardObserver;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PPConnectionsPasteboardSource;
  v2 = -[PPConnectionsPasteboardSource init](&v24, sel_init);
  if (v2)
  {
    location = 0;
    objc_initWeak(&location, v2);
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    v7 = dispatch_semaphore_create(0);
    init_sem = v2->_init_sem;
    v2->_init_sem = (OS_dispatch_semaphore *)v7;

    v9 = objc_opt_new();
    pbQueue = v2->_pbQueue;
    v2->_pbQueue = (NSOperationQueue *)v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_pbQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setSuspended:](v2->_pbQueue, "setSuspended:", 1);
    v11 = v2->_pbQueue;
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __37__PPConnectionsPasteboardSource_init__block_invoke;
    v21[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v22, &location);
    -[NSOperationQueue addOperationWithBlock:](v11, "addOperationWithBlock:", v21);
    v2->_pasteboardNotificationState = objc_msgSend(MEMORY[0x1E0D6C0E8], "beginListeningToPasteboardChangeNotifications");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D6C160];
    v15 = v2->_pbQueue;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __37__PPConnectionsPasteboardSource_init__block_invoke_11;
    v19[3] = &unk_1E7E1D758;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v14, 0, v15, v19);
    v16 = objc_claimAutoreleasedReturnValue();
    pasteboardObserver = v2->_pasteboardObserver;
    v2->_pasteboardObserver = (id)v16;

    -[NSOperationQueue setSuspended:](v2->_pbQueue, "setSuspended:", 0);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_pasteboardObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_pasteboardObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)PPConnectionsPasteboardSource;
  -[PPConnectionsPasteboardSource dealloc](&v4, sel_dealloc);
}

- (id)_mostRecentPasteboardItem
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
  v9 = __Block_byref_object_copy__16503;
  v10 = __Block_byref_object_dispose__16504;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PPConnectionsPasteboardSource__mostRecentPasteboardItem__block_invoke;
  v5[3] = &unk_1E7E1C4E8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_setMostRecentPasteboardItem:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  _PASLock *lock;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "memoryFootprintEstimate");
  if (v5 >= 0x4000)
  {
    v6 = v5;
    pp_connections_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v6;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: dropping pasteboard item because it uses too much memory (estimated footprint %tu)", buf, 0xCu);
    }

    v4 = 0;
  }
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PPConnectionsPasteboardSource__setMostRecentPasteboardItem___block_invoke;
  v10[3] = &unk_1E7E1C510;
  v11 = v4;
  v9 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);

}

- (void)refreshMostRecentPasteboardItemFromNotification:(BOOL)a3 explanationSet:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = a3;
  v6 = a4;
  -[PPConnectionsPasteboardSource addressPasteboardTextItemFromNotification:](self, "addressPasteboardTextItemFromNotification:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsPasteboardSource _setMostRecentPasteboardItem:](self, "_setMostRecentPasteboardItem:", v7);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_init_sem);
  pp_connections_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: initial pasteboard fetch completed", v16, 2u);
  }

  v9 = (void *)os_transaction_create();
  v10 = (void *)MEMORY[0x1C3BD6630]();
  -[PPConnectionsPasteboardSource _mostRecentPasteboardItem](self, "_mostRecentPasteboardItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPConnectionsPasteboardSource locationItemsWithCriteria:earliest:latest:limit:consumer:explanationSet:](self, "locationItemsWithCriteria:earliest:latest:limit:consumer:explanationSet:", 0, v12, 0, 1, 0, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PPConnectionsSource delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "source:updatedLocation:", self, v14);

  }
  objc_autoreleasePoolPop(v10);

}

- (id)fetchedPasteboardItem
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  id v23;
  id v24;
  id v25;
  id obj;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[8];
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__16503;
  v61 = __Block_byref_object_dispose__16504;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__16503;
  v55 = __Block_byref_object_dispose__16504;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__16503;
  v49 = __Block_byref_object_dispose__16504;
  v50 = 0;
  v3 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0D6C0E8], "defaultConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke;
  v41[3] = &unk_1E7E1C540;
  v43 = &v51;
  v44 = &v45;
  v5 = v3;
  v42 = v5;
  objc_msgSend(v4, "localGeneralPasteboardCompletionBlock:", v41);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v5, 5.0) == 1)
  {
    pp_connections_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "PPConnectionsPasteboardSource: local general pasteboard fetch timed out";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_1C392E000, v8, v9, v7, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend((id)v46[5], "isEqualToString:", *MEMORY[0x1E0D70E80]))
  {
    pp_connections_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = "PPConnectionsPasteboardSource: Rejecting item copied in SpringBoard!";
      v8 = v6;
      v9 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_20;
  }
  objc_msgSend((id)v52[5], "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PPConnectionsPasteboardSource validUTTypes](self, "validUTTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v63, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v37;
    obj = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1C3BD6630]();
        if (-[NSObject hasRepresentationConformingToType:](v6, "hasRepresentationConformingToType:", v16)
          && !v58[5])
        {
          -[NSObject representationConformingToType:](v6, "representationConformingToType:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0CEC3F8];
          objc_msgSend(v18, "typeIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "typeWithIdentifier:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = dispatch_semaphore_create(0);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke_25;
          v28[3] = &unk_1E7E1C568;
          v23 = v21;
          v33 = &v57;
          v34 = &v51;
          v35 = &v45;
          v29 = v23;
          v30 = v16;
          v24 = v18;
          v31 = v24;
          v5 = v22;
          v32 = v5;
          v25 = (id)objc_msgSend(v24, "loadDataWithCompletion:", v28);
          objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v5, 5.0);

        }
        objc_autoreleasePoolPop(v17);
      }
      v12 = obj;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v63, 16);
    }
    while (v13);
  }

  v10 = (id)v58[5];
LABEL_20:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v10;
}

- (id)addressPasteboardTextItemFromNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v3 = a3;
  -[PPConnectionsPasteboardSource fetchedPasteboardItem](self, "fetchedPasteboardItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_9:
    v8 = 0;
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[PPDataDetectors addressComponentsFromString:extractedAddress:](PPDataDetectors, "addressComponentsFromString:extractedAddress:", v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;

  if (!v6 || !v8)
  {

    v4 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "setText:", v6);
  objc_msgSend(v4, "setAddressComponents:", v8);
  if (v3)
  {
    +[PPConnectionsMetricsTracker sharedInstance](PPConnectionsMetricsTracker, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackPasteboardItemFromBundleId:hasAddress:isEligible:", v10, 1, 1);

  }
  v11 = v4;
LABEL_12:
  v12 = v11;

  return v12;
}

- (id)validUTTypes
{
  if (validUTTypes_onceToken != -1)
    dispatch_once(&validUTTypes_onceToken, &__block_literal_global_31_16500);
  return (id)validUTTypes__stringPasteboardUTTypes;
}

- (id)supportedSemanticTags
{
  if (supportedSemanticTags_onceToken != -1)
    dispatch_once(&supportedSemanticTags_onceToken, &__block_literal_global_33_16495);
  return (id)supportedSemanticTags_supportedSemanticTags;
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  double v19;
  const char *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a8;
  -[PPConnectionsPasteboardSource _mostRecentPasteboardItem](self, "_mostRecentPasteboardItem");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v19 = 0.04;
    if (a7 != 1)
      v19 = 1.0;
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_init_sem, v19) == 1)
    {
      pp_connections_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v20 = "PPConnectionsPasteboardSource: timed out waiting for pasteboard source initialization.";
    }
    else
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_init_sem);
      -[PPConnectionsPasteboardSource _mostRecentPasteboardItem](self, "_mostRecentPasteboardItem");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_2;
      objc_msgSend(v14, "push:", 26);
      pp_connections_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v20 = "PPConnectionsPasteboardSource: pasteboard is empty";
    }
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_28;
  }
LABEL_2:
  -[NSObject createdAt](v15, "createdAt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "compare:", v16);

  if (v17 == 1)
  {
    objc_msgSend(v14, "push:", 6);
    pp_connections_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: pasteboard is too old", buf, 2u);
    }

    goto LABEL_28;
  }
  -[PPConnectionsPasteboardSource supportedSemanticTags](self, "supportedSemanticTags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v12, "locationField"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "containsObject:", v22);

  if (v23)
  {
    -[PPConnectionsPasteboardSource _mostRecentPasteboardItem](self, "_mostRecentPasteboardItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    pp_connections_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");
      objc_msgSend(v24, "bundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v54 = v27;
      v55 = 2112;
      v56 = v28;
      _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: most recent pasteboard item has text length %tu from bundle %@", buf, 0x16u);

    }
    objc_msgSend(v24, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {
      objc_msgSend(v24, "bundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
LABEL_35:

        goto LABEL_29;
      }
      v31 = objc_msgSend(v12, "locationField");
      objc_msgSend(v24, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addressComponents");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPConnectionsDataDetectors addressComponentValueWithLocationField:forDataDetectorsMatch:addressComponents:](PPConnectionsDataDetectors, "addressComponentValueWithLocationField:forDataDetectorsMatch:addressComponents:", v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      PPCollapseWhitespaceAndStrip();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 && objc_msgSend(v29, "length"))
      {
        objc_msgSend(v24, "addressComponents");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3298]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        PPCollapseWhitespaceAndStrip();
        v37 = (id)objc_claimAutoreleasedReturnValue();

        if (!v37)
          v37 = v29;
        v38 = objc_alloc(MEMORY[0x1E0D70AF0]);
        objc_msgSend(v24, "bundleIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v38, "initWithOriginatingBundleID:", v39);

        objc_msgSend(v40, "setName:", v37);
        v51 = v37;
        objc_msgSend(v40, "setLabel:", v37);
        objc_msgSend(v40, "setValue:", v29);
        objc_msgSend(v40, "setShortValue:", v29);
        objc_msgSend(v40, "setShouldAggregate:", 0);
        objc_msgSend(v24, "createdAt");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v41, "copy");
        objc_msgSend(v40, "setCreatedAt:", v42);

        objc_msgSend(v40, "setSource:", CFSTR("pasteboard"));
        objc_msgSend(v40, "setCopiedToPasteboard:", 1);
        v43 = (void *)MEMORY[0x1E0CB37E8];
        +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "pasteboardItemExpirySeconds");
        objc_msgSend(v43, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setLifetime:", v45);

        pp_connections_log_handle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v40, "originatingBundleID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "createdAt");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = (uint64_t)v47;
          v55 = 2112;
          v56 = v48;
          _os_log_impl(&dword_1C392E000, v46, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: returning location item from %@ created at %@", buf, 0x16u);

        }
        if (!v40)
        {
          v30 = 0;
          goto LABEL_35;
        }
        v52 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v40;
        goto LABEL_34;
      }
      pp_connections_log_handle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v50, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: no address value", buf, 2u);
      }

    }
    v30 = 0;
LABEL_34:

    goto LABEL_35;
  }
LABEL_28:
  v30 = 0;
LABEL_29:

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testLocale, 0);
  objc_storeStrong((id *)&self->_pbQueue, 0);
  objc_storeStrong((id *)&self->_init_sem, 0);
  objc_storeStrong(&self->_pasteboardObserver, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __54__PPConnectionsPasteboardSource_supportedSemanticTags__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59A20, &unk_1E7E59A38, &unk_1E7E59A50, &unk_1E7E59A68, &unk_1E7E59A80, &unk_1E7E59A98, &unk_1E7E59AB0, &unk_1E7E59AC8, 0);
  objc_autoreleasePoolPop(v0);
  v2 = (void *)supportedSemanticTags_supportedSemanticTags;
  supportedSemanticTags_supportedSemanticTags = v1;

}

void __45__PPConnectionsPasteboardSource_validUTTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC628], "identifier", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)validUTTypes__stringPasteboardUTTypes;
  validUTTypes__stringPasteboardUTTypes = v3;

}

void __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "originatorBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v6)
    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("PB"), objc_msgSend(v6, "code"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __54__PPConnectionsPasteboardSource_fetchedPasteboardItem__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
    goto LABEL_23;
  if (!v5)
    goto LABEL_20;
  if (objc_msgSend(*(id *)(a1 + 32), "conformsToType:", *MEMORY[0x1E0CEC630]))
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text type resolves to UTF-8", (uint8_t *)&v24, 2u);
    }

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = v5;
    v10 = 4;
LABEL_11:
    objc_msgSend(v8, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v9, v10, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "conformsToType:", *MEMORY[0x1E0CEC628]))
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text type resolves to UTF-16", (uint8_t *)&v24, 2u);
    }

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = v5;
    v10 = 10;
    goto LABEL_11;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "conformsToType:", *MEMORY[0x1E0CEC610]))
    goto LABEL_20;
  pp_default_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v24) = 0;
    _os_log_debug_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text type does not resolve to UTF-8 or UTF-16", (uint8_t *)&v24, 2u);
  }

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:usedEncoding:", v5, 0);
LABEL_12:
  v13 = (void *)v12;
  if (v12)
  {
    v14 = objc_opt_new();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setCreatedAt:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setText:", v13);
    pp_private_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v23;
      _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "PPConnectionsPasteboardSource: pasteboard text: %@", (uint8_t *)&v24, 0xCu);

    }
    goto LABEL_23;
  }
LABEL_20:
  pp_connections_log_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "typeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    v28 = 2112;
    v29 = 0;
    _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: Could not load text representation from pasteboard. Type = %@, resolved type = %@, Error: %@", (uint8_t *)&v24, 0x20u);

  }
  +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("PB"), objc_msgSend(0, "code"));
LABEL_23:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __62__PPConnectionsPasteboardSource__setMostRecentPasteboardItem___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
}

void __58__PPConnectionsPasteboardSource__mostRecentPasteboardItem__block_invoke(uint64_t a1, _QWORD *a2)
{
  if (a2)
    a2 = (_QWORD *)a2[1];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __37__PPConnectionsPasteboardSource_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  pp_connections_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: fetching from pasteboard asynchronously after initialization.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshMostRecentPasteboardItemFromNotification:explanationSet:", 0, 0);

}

void __37__PPConnectionsPasteboardSource_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pp_connections_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPConnectionsPasteboardSource: handling PBPasteboardChangedNotification", buf, 2u);
    }

    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D6C168]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    if (WeakRetained[2] != v9)
    {
      WeakRetained[2] = v9;
      v10 = (void *)WeakRetained[6];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __37__PPConnectionsPasteboardSource_init__block_invoke_12;
      v11[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v12, v4);
      objc_msgSend(v10, "addOperationWithBlock:", v11);
      objc_destroyWeak(&v12);
    }
  }

}

void __37__PPConnectionsPasteboardSource_init__block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshMostRecentPasteboardItemFromNotification:explanationSet:", 1, 0);

}

+ (PPConnectionsPasteboardSource)sharedInstance
{
  if (sharedInstance_once_16538 != -1)
    dispatch_once(&sharedInstance_once_16538, &__block_literal_global_16539);
  return (PPConnectionsPasteboardSource *)(id)sharedInstance_shared_16540;
}

void __47__PPConnectionsPasteboardSource_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_16540;
  sharedInstance_shared_16540 = v0;

}

- (void)setTestLocale:(id)a3
{
  objc_storeStrong((id *)&self->_testLocale, a3);
}

@end
