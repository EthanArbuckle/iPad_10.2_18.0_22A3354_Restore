@implementation PPNotificationManager

- (void)setEKStore:(id)a3
{
  id v5;
  _PASLock *lockedData;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  lockedData = self->_lockedData;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PPNotificationManager_setEKStore___block_invoke;
  v8[3] = &unk_1E226B548;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v7 = v5;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v8);

}

- (PPNotificationManager)initWithQueueName:(const char *)a3 notificationCenter:(id)a4
{
  id v7;
  PPNotificationManager *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _PASLock *lockedData;
  uint64_t v13;
  OS_dispatch_queue *serialQueue;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPNotificationManager;
  v8 = -[PPNotificationManager init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D815F0]);
    v10 = (void *)objc_opt_new();
    v11 = objc_msgSend(v9, "initWithGuardedData:", v10);
    lockedData = v8->_lockedData;
    v8->_lockedData = (_PASLock *)v11;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", a3, 9);
    v13 = objc_claimAutoreleasedReturnValue();
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v8->_notificationCenter, a4);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PPNotificationManager stopListening](self, "stopListening");
  v3.receiver = self;
  v3.super_class = (Class)PPNotificationManager;
  -[PPNotificationManager dealloc](&v3, sel_dealloc);
}

- (void)stopListening
{
  _PASLock *lockedData;
  _QWORD v3[5];

  lockedData = self->_lockedData;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PPNotificationManager_stopListening__block_invoke;
  v3[3] = &unk_1E226B570;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v3);
}

- (void)addContactsChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B628;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v11);

}

- (void)addMeCardChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B628;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v11);

}

- (void)addPortraitChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B628;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v11);

}

- (void)addPortraitInvalidationBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B628;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v11);

}

- (void)fetchObjectChangesFromStore:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)getEKObjectChangeClass_softClass;
  v22 = getEKObjectChangeClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getEKObjectChangeClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getEKObjectChangeClass_block_invoke;
    v18[3] = &unk_1E226B918;
    v18[4] = &v19;
    __getEKObjectChangeClass_block_invoke((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v19, 8);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __64__PPNotificationManager_fetchObjectChangesFromStore_usingBlock___block_invoke;
  v15[3] = &unk_1E226B6B8;
  v11 = v6;
  v17 = v11;
  v12 = v7;
  v16 = v12;
  objc_msgSend(v10, "objectChangesInStore:resultHandler:", v5, v15);
  if (dispatch_semaphore_wait(v12, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPNotificationManager fetchObjectChangesFromStore:usingBlock:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PPNotificationManager.m"), 548, CFSTR("+[EKObjectChange objectChangesInStore:resultHandler:] is expected to be synchronous"));

  }
}

- (void)addEventKitChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B628;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v11);

}

- (void)_registerForEventKitChangeTrackingWithGuardedData:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*((_QWORD *)a3 + 13);
  v7 = 0;
  v4 = objc_msgSend(v3, "registerForDetailedChangeTracking:", &v7);
  v5 = v7;
  if (v4 == -1)
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_ERROR, "PPNotificationManager failed to register for detailed EK change tracking: %@", buf, 0xCu);
    }

  }
}

- (id)addCalendarVisibilityChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5794;
  v21 = __Block_byref_object_dispose__5795;
  v22 = 0;
  lockedData = self->_lockedData;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke;
  v13[3] = &unk_1E226B818;
  v13[4] = self;
  v16 = &v17;
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v14 = v10;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)addSuggestionsChangeBlock:(id)a3 forLifetimeOfObject:(id)a4
{
  id v6;
  id v7;
  _PASLock *lockedData;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockedData = self->_lockedData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke;
  v11[3] = &unk_1E226B628;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lockedData, 0);
}

void __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  PPNotificationHandler *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];

  v3 = a2;
  if (!v3[17])
  {
    v4 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("suggestions"), 10.0);
    v5 = (void *)v3[17];
    v3[17] = v4;

  }
  if (!v3[16])
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForContacts");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[16];
    v3[16] = v6;

  }
  v8 = MEMORY[0x1E0C809B0];
  if (!v3[18])
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Found in Apps changes", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v10 = (void *)v3[16];
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_178;
    v19[3] = &unk_1E226B860;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v10, "registerContactsChangeObserver:", v19);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v3[18];
    v3[18] = v11;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  v13 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v14 = (void *)v3[17];
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_4;
  v17[3] = &unk_1E226B600;
  v18 = v13;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v13;
  objc_msgSend(v14, "addObserverBlock:forLifetimeOfObject:", v17, v15);

}

void __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_178(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E226B998;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

uint64_t __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_179);
    WeakRetained = v2;
  }

}

uint64_t __71__PPNotificationManager_addSuggestionsChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 136), "fireWithObjects:", 0);
}

void __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  PPNotificationHandler *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a2;
  if (!v3[14])
  {
    v4 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("calendars"), 10.0);
    v5 = (void *)v3[14];
    v3[14] = v4;

  }
  if (!v3[13])
  {
    PPNewEKEventStore();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[13];
    v3[13] = v6;

  }
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = (void *)v3[15];
  if (!v8)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v9 = (void *)getEKCalendarVisibilityManagerClass_softClass;
    v29 = getEKCalendarVisibilityManagerClass_softClass;
    v10 = MEMORY[0x1E0C809B0];
    if (!getEKCalendarVisibilityManagerClass_softClass)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __getEKCalendarVisibilityManagerClass_block_invoke;
      v25[3] = &unk_1E226B918;
      v25[4] = &v26;
      __getEKCalendarVisibilityManagerClass_block_invoke((uint64_t)v25);
      v9 = (void *)v27[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v26, 8);
    v12 = [v11 alloc];
    v13 = v3[13];
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_2;
    v22[3] = &unk_1E226B998;
    objc_copyWeak(&v23, &location);
    v14 = objc_msgSend(v12, "initWithEventStore:visibilityChangedCallback:queue:", v13, v22, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v15 = (void *)v3[15];
    v3[15] = v14;

    objc_destroyWeak(&v23);
    v8 = (void *)v3[15];
  }
  objc_msgSend(v8, "invisibleCalendars");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_175);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v20 = (void *)v3[14];
  v21 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v20, "addObserverBlock:forLifetimeOfObject:", v21, *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&location);
}

void __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_3;
    block[3] = &unk_1E226C130;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

id __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "calendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

uint64_t __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "runWithLockAcquired:", &__block_literal_global_172);
}

void __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a2 + 112);
  objc_msgSend(*(id *)(a2 + 120), "invisibleCalendars");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_174);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fireWithObjects:", v3);

}

id __78__PPNotificationManager_addCalendarVisibilityChangeBlock_forLifetimeOfObject___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "calendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PPNotificationHandler *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  __int128 buf;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*((_QWORD *)v3 + 11))
  {
    v4 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("events"), 0.0);
    v5 = (void *)*((_QWORD *)v3 + 11);
    *((_QWORD *)v3 + 11) = v4;

  }
  if (!*((_QWORD *)v3 + 13))
  {
    PPNewEKEventStore();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v3 + 13);
    *((_QWORD *)v3 + 13) = v6;

  }
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (!*((_QWORD *)v3 + 12))
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerForEventKitChangeTrackingWithGuardedData:", v3);
    objc_msgSend(*((id *)v3 + 13), "reset");
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *((_QWORD *)v3 + 13);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_INFO, "PPNotificationManager registering for event changes from %@", (uint8_t *)&buf, 0xCu);
    }

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v25 = 0x2020000000;
    v11 = (id *)getEKEventStoreChangedNotificationSymbolLoc_ptr;
    v26 = getEKEventStoreChangedNotificationSymbolLoc_ptr;
    if (!getEKEventStoreChangedNotificationSymbolLoc_ptr)
    {
      v12 = EventKitLibrary();
      v11 = (id *)dlsym(v12, "EKEventStoreChangedNotification");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
      getEKEventStoreChangedNotificationSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&buf, 8);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getEKEventStoreChangedNotification(void)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PPNotificationManager.m"), 38, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v13 = *v11;
    v14 = *((_QWORD *)v3 + 13);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_149;
    v21[3] = &unk_1E226B5D8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v13, v14, 0, v21);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v3 + 12);
    *((_QWORD *)v3 + 12) = v15;

    objc_destroyWeak(&v22);
  }
  v17 = (void *)*((_QWORD *)v3 + 11);
  v18 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v17, "addObserverBlock:forLifetimeOfObject:", v18, *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&location);
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  NSObject **WeakRetained;
  NSObject **v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)os_transaction_create();
  v5 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E226B790;
    objc_copyWeak(&v12, v5);
    v10 = v4;
    v11 = v3;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
  }

}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_2(id *a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v18[8];
  _QWORD v19[4];
  _QWORD *v20;
  uint8_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
LABEL_19:

    return;
  }
  v4 = a1[4];
  *(_QWORD *)buf = 0;
  v36 = buf;
  v37 = 0x2020000000;
  v5 = (id *)getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr;
  v38 = (uint64_t (*)(uint64_t, uint64_t))getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr;
  if (!getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr)
  {
    v6 = EventKitLibrary();
    v5 = (id *)dlsym(v6, "EKEventStoreCalendarDataChangedUserInfoKey");
    *((_QWORD *)v36 + 3) = v5;
    getEKEventStoreCalendarDataChangedUserInfoKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(buf, 8);
  if (v5)
  {
    v7 = *v5;
    if (v7
      && (objc_msgSend(a1[5], "userInfo"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "objectForKeyedSubscript:", v7),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "BOOLValue"),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_INFO, "PPNotificationManager ignoring non-Calendar EK change", buf, 2u);
      }

    }
    else
    {
      *(_QWORD *)buf = 0;
      v36 = buf;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__5794;
      v39 = __Block_byref_object_dispose__5795;
      v40 = 0;
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__5794;
      v33 = __Block_byref_object_dispose__5795;
      v34 = 0;
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v11 = (void *)WeakRetained[1];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_151;
      v19[3] = &unk_1E226B728;
      v21 = buf;
      objc_copyWeak(&v24, v2);
      v22 = &v25;
      v23 = &v29;
      v20 = WeakRetained;
      objc_msgSend(v11, "runWithLockAcquired:", v19);
      if (*((_BYTE *)v26 + 24))
      {
        objc_msgSend(*((id *)v36 + 5), "fireWithObjects:", MEMORY[0x1E0C9AA60]);
      }
      else
      {
        objc_msgSend((id)v30[5], "_pas_filteredArrayWithTest:", &__block_literal_global_169);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v30[5];
        v30[5] = v13;

        if (objc_msgSend((id)v30[5], "count"))
        {
          objc_msgSend(*((id *)v36 + 5), "fireWithObjects:", v30[5]);
        }
        else
        {
          pp_default_log_handle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEFAULT, "PPNotificationManager: received empty arrays from EK change tracking", v18, 2u);
          }

        }
      }

      objc_destroyWeak(&v24);
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);

      _Block_object_dispose(buf, 8);
    }

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getEKEventStoreCalendarDataChangedUserInfoKey(void)");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PPNotificationManager.m"), 39, CFSTR("%s"), dlerror());

  __break(1u);
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_151(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  uint8_t buf[4];
  void *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[11]);
  if (v3[13])
  {
    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = &v17;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__5794;
    v20 = __Block_byref_object_dispose__5795;
    v21 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v5 = v3[13];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_152;
    v14[3] = &unk_1E226B6E0;
    v6 = *(_QWORD *)(a1 + 56);
    v14[4] = *(_QWORD *)(a1 + 48);
    v14[5] = &v17;
    v14[6] = v6;
    v7 = (void *)MEMORY[0x18D780768](v14);
    objc_msgSend(WeakRetained, "fetchObjectChangesFromStore:usingBlock:", v5, v7);

    LODWORD(v5) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v5)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEFAULT, "PPNotificationManager: EK changes truncated.", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_registerForEventKitChangeTrackingWithGuardedData:", v3);
    }
    else
    {
      if (v9)
      {
        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v11, "_pas_leftFoldWithInitialObject:accumulate:", v12, &__block_literal_global_157);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543362;
        v16 = v13;
        _os_log_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEFAULT, "PPNotificationManager received EK changes: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v3[13], "consumeAllChangesUpToToken:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 40));
    }
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v17) = 138412290;
      *(_QWORD *)((char *)&v17 + 4) = v3;
      _os_log_fault_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_FAULT, "PPNotificationManager: EK store is nil when handling EK change: %@", (uint8_t *)&v17, 0xCu);
    }

  }
}

BOOL __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_167(uint64_t a1, uint64_t a2)
{
  return +[PPNotificationManager _changePotentiallyAffectsCache:](PPNotificationManager, "_changePotentiallyAffectsCache:", a2);
}

void __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_152(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

id __68__PPNotificationManager_addEventKitChangeBlock_forLifetimeOfObject___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "changeType");
  if (v6 >= 3)
    v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EKChangeType[%u]"), objc_msgSend(v5, "changeType"));
  else
    v7 = off_1E226B950[v6];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &unk_1E2284DA8;
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v7);

  return v4;
}

intptr_t __64__PPNotificationManager_fetchObjectChangesFromStore_usingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PPNotificationHandler *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t v16[8];
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];

  v3 = a2;
  if (!*((_QWORD *)v3 + 9))
  {
    v4 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("portraitInvalidation"), 10.0);
    v5 = (void *)*((_QWORD *)v3 + 9);
    *((_QWORD *)v3 + 9) = v4;

  }
  v6 = MEMORY[0x1E0C809B0];
  if (!*((_DWORD *)v3 + 20))
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Portrait invalidations", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    handler[0] = v6;
    handler[1] = 3221225472;
    handler[2] = __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_141;
    handler[3] = &unk_1E226B690;
    objc_copyWeak(&v18, (id *)buf);
    if (notify_register_dispatch("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated", (int *)v3 + 20, v8, handler))
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "PP failed to register for Portrait entity invalidation notifications", v16, 2u);
      }

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  v10 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v11 = (void *)*((_QWORD *)v3 + 9);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_143;
  v14[3] = &unk_1E226B600;
  v15 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v10;
  objc_msgSend(v11, "addObserverBlock:forLifetimeOfObject:", v14, v12);

}

void __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_141(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_142);
    WeakRetained = v2;
  }

}

uint64_t __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PPNotificationManager_addPortraitInvalidationBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 72), "fireWithObjects:", 0);
}

void __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PPNotificationHandler *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t v16[8];
  _QWORD handler[4];
  id v18;
  uint8_t buf[8];

  v3 = a2;
  if (!*((_QWORD *)v3 + 7))
  {
    v4 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("portraitChange"), 3.0);
    v5 = (void *)*((_QWORD *)v3 + 7);
    *((_QWORD *)v3 + 7) = v4;

  }
  v6 = MEMORY[0x1E0C809B0];
  if (!*((_DWORD *)v3 + 16))
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Portrait changes", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    handler[0] = v6;
    handler[1] = 3221225472;
    handler[2] = __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_134;
    handler[3] = &unk_1E226B690;
    objc_copyWeak(&v18, (id *)buf);
    if (notify_register_dispatch("com.apple.proactive.PersonalizationPortrait.namedEntitiesDidChangeMeaningfully", (int *)v3 + 16, v8, handler))
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "PP failed to register for Portrait entity change notifications", v16, 2u);
      }

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  v10 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v11 = (void *)*((_QWORD *)v3 + 7);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_137;
  v14[3] = &unk_1E226B600;
  v15 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v10;
  objc_msgSend(v11, "addObserverBlock:forLifetimeOfObject:", v14, v12);

}

void __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_134(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_135);
    WeakRetained = v2;
  }

}

uint64_t __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__PPNotificationManager_addPortraitChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 56), "fireWithObjects:", 0);
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  PPNotificationHandler *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[8];
  id location;

  v3 = a2;
  if (!v3[4])
  {
    v4 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("meCard"), 10.0);
    v5 = (void *)v3[4];
    v3[4] = v4;

  }
  if (!v3[3])
  {
    PPSharedCNContactStore();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v3[3];
    v3[3] = v6;

  }
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = MEMORY[0x1E0C809B0];
  if (!v3[5])
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Me card changes", buf, 2u);
    }

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v11 = *MEMORY[0x1E0C96878];
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_124;
    v26[3] = &unk_1E226B5D8;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v26);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v3[5];
    v3[5] = v12;

    objc_destroyWeak(&v27);
  }
  if (!v3[6])
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v14, OS_LOG_TYPE_INFO, "PPNotificationManager registering for Me card donations", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D136D0];
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_127;
    v24[3] = &unk_1E226B5D8;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", v16, 0, 0, v24);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v3[6];
    v3[6] = v17;

    objc_destroyWeak(&v25);
  }
  v19 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v20 = (void *)v3[4];
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_4;
  v22[3] = &unk_1E226B600;
  v21 = v19;
  v23 = v21;
  objc_msgSend(v20, "addObserverBlock:forLifetimeOfObject:", v22, *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&location);
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_124(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E226B998;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_127(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2_128;
    block[3] = &unk_1E226B998;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

uint64_t __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2_128(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_130_5844);
    WeakRetained = v2;
  }

}

uint64_t __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_3_129(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 32), "fireWithObjects:", 0);
}

void __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_125);
    WeakRetained = v2;
  }

}

uint64_t __66__PPNotificationManager_addMeCardChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 32), "fireWithObjects:", 0);
}

void __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  PPNotificationHandler *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[8];

  v3 = a2;
  if (!v3[3])
  {
    PPSharedCNContactStore();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[3];
    v3[3] = v4;

  }
  if (!v3[1])
  {
    v6 = -[PPNotificationHandler initWithName:waitSeconds:]([PPNotificationHandler alloc], "initWithName:waitSeconds:", CFSTR("contacts"), 10.0);
    v7 = (void *)v3[1];
    v3[1] = v6;

  }
  v8 = MEMORY[0x1E0C809B0];
  if (!v3[2])
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_INFO, "PPNotificationManager registering for contacts changes", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v11 = *MEMORY[0x1E0C96870];
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_118;
    v20[3] = &unk_1E226B5D8;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v20);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v3[2];
    v3[2] = v12;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  v14 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v15 = (void *)v3[1];
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_4;
  v18[3] = &unk_1E226B600;
  v19 = v14;
  v16 = *(_QWORD *)(a1 + 40);
  v17 = v14;
  objc_msgSend(v15, "addObserverBlock:forLifetimeOfObject:", v18, v16);

}

void __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_118(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_2;
    block[3] = &unk_1E226B998;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

uint64_t __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "runWithLockAcquired:", &__block_literal_global_119);
    WeakRetained = v2;
  }

}

uint64_t __68__PPNotificationManager_addContactsChangeBlock_forLifetimeOfObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 8), "fireWithObjects:", 0);
}

void __38__PPNotificationManager_stopListening__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint8_t v12[16];

  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_18BE3A000, v4, OS_LOG_TYPE_INFO, "PPNotificationManager stopping listening", v12, 2u);
  }

  if (*((_QWORD *)v3 + 2))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    v5 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = 0;

  }
  if (*((_QWORD *)v3 + 5))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    v6 = (void *)*((_QWORD *)v3 + 5);
    *((_QWORD *)v3 + 5) = 0;

  }
  if (*((_QWORD *)v3 + 6))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    v7 = (void *)*((_QWORD *)v3 + 6);
    *((_QWORD *)v3 + 6) = 0;

  }
  if (*((_QWORD *)v3 + 12))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    v8 = (void *)*((_QWORD *)v3 + 12);
    *((_QWORD *)v3 + 12) = 0;

  }
  if (*((_QWORD *)v3 + 18))
  {
    objc_msgSend(*((id *)v3 + 16), "deregisterContactsChangeObserverWithToken:");
    v9 = (void *)*((_QWORD *)v3 + 18);
    *((_QWORD *)v3 + 18) = 0;

  }
  v10 = *((_DWORD *)v3 + 16);
  if (v10)
  {
    notify_cancel(v10);
    *((_DWORD *)v3 + 16) = 0;
  }
  v11 = *((_DWORD *)v3 + 20);
  if (v11)
  {
    notify_cancel(v11);
    *((_DWORD *)v3 + 20) = 0;
  }

}

void __36__PPNotificationManager_setEKStore___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  id *v5;

  v5 = a2;
  v3 = v5 + 13;
  if (v5[13])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PPNotificationManager.m"), 270, CFSTR("EKStore already exists: %@"), *v3, v5);

  }
  objc_storeStrong(v3, *(id *)(a1 + 40));

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken12_5867 != -1)
    dispatch_once(&sharedInstance__pasOnceToken12_5867, &__block_literal_global_5868);
  return (id)sharedInstance__pasExprOnceResult_5869;
}

+ (void)addContactsObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addContactsChangeBlock:forLifetimeOfObject:", v5, v6);

}

+ (void)addMeCardObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addMeCardChangeBlock:forLifetimeOfObject:", v5, v6);

}

+ (void)addPortraitChangeObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPortraitChangeBlock:forLifetimeOfObject:", v5, v6);

}

+ (void)addPortraitInvalidationObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPortraitInvalidationBlock:forLifetimeOfObject:", v5, v6);

}

+ (BOOL)_changePotentiallyAffectsCache:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char isKindOfClass;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v4 = (void *)getEKCalendarItemChangeClass_softClass;
  v26 = getEKCalendarItemChangeClass_softClass;
  if (!getEKCalendarItemChangeClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getEKCalendarItemChangeClass_block_invoke;
    v21 = &unk_1E226B918;
    v22 = &v23;
    __getEKCalendarItemChangeClass_block_invoke((uint64_t)&v18);
    v4 = (void *)v24[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v6 = (void *)getEKExceptionDateChangeClass_softClass;
  v26 = getEKExceptionDateChangeClass_softClass;
  if (!getEKExceptionDateChangeClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getEKExceptionDateChangeClass_block_invoke;
    v21 = &unk_1E226B918;
    v22 = &v23;
    __getEKExceptionDateChangeClass_block_invoke((uint64_t)&v18);
    v6 = (void *)v24[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)getEKRecurrenceChangeClass_softClass;
  v26 = getEKRecurrenceChangeClass_softClass;
  if (!getEKRecurrenceChangeClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getEKRecurrenceChangeClass_block_invoke;
    v21 = &unk_1E226B918;
    v22 = &v23;
    __getEKRecurrenceChangeClass_block_invoke((uint64_t)&v18);
    v8 = (void *)v24[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v10 = (void *)getEKEventChangeClass_softClass;
  v26 = getEKEventChangeClass_softClass;
  if (!getEKEventChangeClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getEKEventChangeClass_block_invoke;
    v21 = &unk_1E226B918;
    v22 = &v23;
    __getEKEventChangeClass_block_invoke((uint64_t)&v18);
    v10 = (void *)v24[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v12 = (void *)getEKAttendeeChangeClass_softClass;
  v26 = getEKAttendeeChangeClass_softClass;
  if (!getEKAttendeeChangeClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getEKAttendeeChangeClass_block_invoke;
    v21 = &unk_1E226B918;
    v22 = &v23;
    __getEKAttendeeChangeClass_block_invoke((uint64_t)&v18);
    v12 = (void *)v24[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_16:
    isKindOfClass = 1;
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v16 = (void *)getEKOrganizerChangeClass_softClass;
    v26 = getEKOrganizerChangeClass_softClass;
    if (!getEKOrganizerChangeClass_softClass)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __getEKOrganizerChangeClass_block_invoke;
      v21 = &unk_1E226B918;
      v22 = &v23;
      __getEKOrganizerChangeClass_block_invoke((uint64_t)&v18);
      v16 = (void *)v24[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v23, 8);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (void)addEventKitObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEventKitChangeBlock:forLifetimeOfObject:", v5, v6);

}

+ (id)addCalendarVisibilityObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCalendarVisibilityChangeBlock:forLifetimeOfObject:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)addSuggestionsObserverForLifetimeOfObject:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSuggestionsChangeBlock:forLifetimeOfObject:", v5, v6);

}

void __39__PPNotificationManager_sharedInstance__block_invoke()
{
  void *v0;
  PPNotificationManager *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = [PPNotificationManager alloc];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PPNotificationManager initWithQueueName:notificationCenter:](v1, "initWithQueueName:notificationCenter:", "com.apple.proactive.PersonalizationPortrait.PPNotificationManager.serialQueue", v2);
  v4 = (void *)sharedInstance__pasExprOnceResult_5869;
  sharedInstance__pasExprOnceResult_5869 = v3;

  objc_autoreleasePoolPop(v0);
}

- (void)waitOnQueueToDrain
{
  dispatch_semaphore_t v3;
  NSObject *serialQueue;
  NSObject *v5;
  _QWORD block[4];
  dispatch_semaphore_t v7;

  v3 = dispatch_semaphore_create(0);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke;
  block[3] = &unk_1E226C130;
  v7 = v3;
  v5 = v3;
  dispatch_async(serialQueue, block);
  -[_PASLock runWithLockAcquired:](self->_lockedData, "runWithLockAcquired:", &__block_literal_global_221);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v5, &__block_literal_global_222, &__block_literal_global_223, 5.0);

}

- (void)simulatePortraitChange
{
  _PASLock *lockedData;
  id v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5794;
  v9 = __Block_byref_object_dispose__5795;
  v10 = 0;
  lockedData = self->_lockedData;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PPNotificationManager_TestHelpers__simulatePortraitChange__block_invoke;
  v4[3] = &unk_1E226B8F0;
  v4[4] = &v5;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v4);
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  objc_msgSend(v3, "fireWithObjects:", 0);
}

- (void)simulatePortraitInvalidation
{
  _PASLock *lockedData;
  id v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5794;
  v9 = __Block_byref_object_dispose__5795;
  v10 = 0;
  lockedData = self->_lockedData;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PPNotificationManager_TestHelpers__simulatePortraitInvalidation__block_invoke;
  v4[3] = &unk_1E226B8F0;
  v4[4] = &v5;
  -[_PASLock runWithLockAcquired:](lockedData, "runWithLockAcquired:", v4);
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  objc_msgSend(v3, "fireWithObjects:", 0);
}

void __66__PPNotificationManager_TestHelpers__simulatePortraitInvalidation__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 72));
}

void __60__PPNotificationManager_TestHelpers__simulatePortraitChange__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 56));
}

intptr_t __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PPNotificationManagerWaitOnQueueToDrainTimeout"), CFSTR("PPNotificationManager waitOnQueueToDrain timeout"), 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v0);
}

uint64_t __56__PPNotificationManager_TestHelpers__waitOnQueueToDrain__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  v2 = (void *)a2[1];
  v3 = a2;
  objc_msgSend(v2, "waitOnQueueToDrain");
  objc_msgSend((id)v3[4], "waitOnQueueToDrain");
  objc_msgSend((id)v3[11], "waitOnQueueToDrain");
  objc_msgSend((id)v3[7], "waitOnQueueToDrain");
  objc_msgSend((id)v3[9], "waitOnQueueToDrain");
  v4 = (void *)v3[17];

  return objc_msgSend(v4, "waitOnQueueToDrain");
}

@end
