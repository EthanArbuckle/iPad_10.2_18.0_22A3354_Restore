@implementation SUCoreSpace

+ (id)sharedSpaceManager
{
  if (sharedSpaceManager_spaceManagerOnce != -1)
    dispatch_once(&sharedSpaceManager_spaceManagerOnce, &__block_literal_global_12);
  return (id)sharedSpaceManager_spaceManager;
}

uint64_t __33__SUCoreSpace_sharedSpaceManager__block_invoke()
{
  SUCoreSpace *v0;
  void *v1;

  v0 = objc_alloc_init(SUCoreSpace);
  v1 = (void *)sharedSpaceManager_spaceManager;
  sharedSpaceManager_spaceManager = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:", 151, CFSTR("CacheDeleteErrorDomain"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfSUCoreErrorCode:indicating:", 8600, 4);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 1, CFSTR("CacheDeleteErrorConnectionInterrupted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 2, CFSTR("CacheDeleteErrorConnectionInvalidated"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 3, CFSTR("CacheDeleteErrorConnectionCancelled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 4, CFSTR("CacheDeleteErrorMissingEntitlement"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 5, CFSTR("CacheDeleteErrorInsufficientPermissions"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 6, CFSTR("CacheDeleteErrorFailedToConnect"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 7, CFSTR("CacheDeleteErrorDuplicateService"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 8, CFSTR("CacheDeleteErrorUnresponsiveService"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 9, CFSTR("CacheDeleteErrorTimeout"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 10, CFSTR("CacheDeleteErrorInvalidVolume"));
  return objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("CacheDeleteErrorDomain"), 11, CFSTR("CacheDeleteErrorInvalidParams"));
}

- (SUCoreSpace)init
{
  SUCoreSpace *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *spaceQueue;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SUCoreSpace;
  v2 = -[SUCoreSpace init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%@"), v5, CFSTR("core.space.operation"));

    v7 = objc_retainAutorelease(v6);
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    spaceQueue = v2->_spaceQueue;
    v2->_spaceQueue = (OS_dispatch_queue *)v10;

    if (v2->_spaceQueue)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v7;
        _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[SPACE] DISPATCH: created dispatch queue domain(%{public}@)", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to create dispatch queue domain(%@)"), v7);
      -[NSObject trackError:forReason:withResult:withError:](v13, "trackError:forReason:withResult:withError:", CFSTR("[SPACE]"), v14, 8100, 0);

    }
  }
  return v2;
}

+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 completion:(id)a7
{
  objc_msgSend(a1, "checkAvailableSpace:allowPurgeWithUrgency:purgingFromBase:minimalRequiredFreeSpace:withCompletionQueue:completion:", a3, *(_QWORD *)&a4, a5, a6, 0, a7);
}

+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 withCompletionQueue:(id)a7 completion:(id)a8
{
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  _BOOL8 v19;
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  __CFString *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  int v32;
  BOOL v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a5;
  v13 = a7;
  v14 = a8;
  +[SUCoreSpace _trackSpaceBegin:withIdentifier:](SUCoreSpace, "_trackSpaceBegin:withIdentifier:", CFSTR("checkAvailableSpace"), CFSTR("total"));
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.CheckAvailableSpace"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = CFSTR("NIL");
    if (v12)
      v18 = v12;
    *(_DWORD *)buf = 138412546;
    v35 = v18;
    v36 = 2048;
    v37 = a3;
    _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "[SPACE] Checking available space from base path %@.  Required free space: %lld", buf, 0x16u);
  }
  v19 = a4 == 4;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke;
  v25[3] = &unk_1EA87A150;
  v26 = v13;
  v27 = v15;
  v32 = a4;
  v30 = a3;
  v31 = a6;
  v28 = v12;
  v29 = v14;
  v33 = a4 == 4;
  v20 = v12;
  v21 = v15;
  v22 = v13;
  v23 = v14;
  +[SUCoreSpace checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:](SUCoreSpace, "checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:", a3, v20, CFSTR("total"), v19, v25);

}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;

  v7 = a4;
  +[SUCoreSpace sharedSpaceManager](SUCoreSpace, "sharedSpaceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spaceQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_2;
  block[3] = &unk_1EA87A128;
  v15 = v7;
  v19 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v24 = a2;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v17 = v10;
  v20 = v11;
  v21 = a3;
  v23 = *(_DWORD *)(a1 + 80);
  v22 = v12;
  v18 = *(id *)(a1 + 48);
  v25 = *(_BYTE *)(a1 + 84);
  v13 = v7;
  dispatch_async(v9, block);

}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("total"), objc_msgSend(v2, "code"), *(_QWORD *)(a1 + 32));
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    return;
  }
  if (*(_BYTE *)(a1 + 100))
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("total"), 0, 0);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 72);
      v6 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134218240;
      v43 = v5;
      v44 = 2048;
      v45 = v6;
      _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "[SPACE] total disk space available: need %llu and %llu is available (have enough space)", buf, 0x16u);
    }

    v7 = *(_QWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 80);
    v9 = *(_QWORD *)(a1 + 40);
    v33 = *(_QWORD *)(a1 + 48);
    v10 = 1;
LABEL_7:
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", v7, v9, 1, v10, v8, 0, v33);
    return;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 80);
    *(_DWORD *)buf = 134218240;
    v43 = v13;
    v44 = 2048;
    v45 = v14;
    _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[SPACE] not enough free space for total required: need %llu and %llu is available", buf, 0x16u);
  }

  if (*(_DWORD *)(a1 + 96) == -1)
  {
    v20 = *(_QWORD *)(a1 + 88);
    if (v20)
    {
      if (*(_QWORD *)(a1 + 80) >= v20)
      {
        +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("total"), 0, 0);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "oslog");
        v30 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 80);
          v31 = *(void **)(a1 + 88);
          *(_DWORD *)buf = 134218240;
          v43 = v31;
          v44 = 2048;
          v45 = v32;
          _os_log_impl(&dword_1DDFDD000, v30, OS_LOG_TYPE_DEFAULT, "[SPACE] not enough total but have minimal (did not try cache delete): need %llu and %llu is available", buf, 0x16u);
        }

        v7 = *(_QWORD *)(a1 + 64);
        v8 = *(_QWORD *)(a1 + 80);
        v9 = *(_QWORD *)(a1 + 40);
        v33 = *(_QWORD *)(a1 + 48);
        v10 = 0;
        goto LABEL_7;
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("not enough minimal space (did not try cache delete): need %llu and %llu is available"), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 80));
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "buildError:underlying:description:", 8600, 0, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("total"), objc_msgSend(v23, "code"), v23);
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oslog");
      v25 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_1DDFDD000, v25, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
      }

    }
    else
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("not enough total space (did not try cache delete): need %llu and %llu is available"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "buildError:underlying:description:", 8600, 0, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "oslog");
      v28 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v21;
        _os_log_impl(&dword_1DDFDD000, v28, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
      }

      +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("total"), objc_msgSend(v23, "code"), v23);
    }
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 80), v23, *(_QWORD *)(a1 + 48));

    return;
  }
  +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("total"), 0, 0);
  +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 1, CFSTR("space.CheckAvailableSpace"));
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_54;
  v34[3] = &unk_1EA87A100;
  v39 = *(_OWORD *)(a1 + 72);
  v38 = *(id *)(a1 + 64);
  v35 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 88);
  v36 = v15;
  v40 = v16;
  v37 = *(id *)(a1 + 56);
  v41 = *(_BYTE *)(a1 + 101);
  v17 = (void *)MEMORY[0x1DF0E6BC4](v34);
  v18 = *(_QWORD *)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 80);
  if (v18)
    +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:completion:](SUCoreSpace, "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:completion:", v19, v18, *(unsigned int *)(a1 + 96), v17);
  else
    +[SUCoreSpace cacheDeletePurge:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "cacheDeletePurge:cacheDeleteUrgency:withCompletionQueue:completion:", v19, *(unsigned int *)(a1 + 96), 0, v17);

}

uint64_t __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_54(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[SUCorePower setPowerAssertion:forIdentifierDomain:](SUCorePower, "setPowerAssertion:forIdentifierDomain:", 0, CFSTR("space.CheckAvailableSpace"));
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 || !a2)
  {
    if (v10)
    {
      v14 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 134218496;
      v17 = v14;
      v18 = 2048;
      v19 = v15;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] After cache delete: need %llu total: had %llu free space, was able to free up %llu after cache delete.  Not enough space to install update.", buf, 0x20u);
    }

    return +[SUCoreSpace _checkMinimumRequiredSpace:purgingFromBase:userInitiated:totalRequiredFreeSpace:freeSpaceAvailable:checkAvailableSpaceTransaction:withCompletionQueue:completion:](SUCoreSpace, "_checkMinimumRequiredSpace:purgingFromBase:userInitiated:totalRequiredFreeSpace:freeSpaceAvailable:checkAvailableSpaceTransaction:withCompletionQueue:completion:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 134218496;
      v17 = v11;
      v18 = 2048;
      v19 = v12;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] After cache delete: need %llu total: had %llu free space, was able to free up %llu after cache delete (enough space to install update)", buf, 0x20u);
    }

    return +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 1, 1, *(_QWORD *)(a1 + 72) + a3, 0, *(_QWORD *)(a1 + 40));
  }
}

+ (void)checkAvailableFreeSpace:(unint64_t)a3 checkingFromBase:(id)a4 withIdentifier:(id)a5 userInitiated:(BOOL)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  BOOL v24;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  +[SUCoreSpace sharedSpaceManager](SUCoreSpace, "sharedSpaceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spaceQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke;
  block[3] = &unk_1EA87A1A0;
  v20 = v11;
  v21 = v12;
  v24 = a6;
  v22 = v13;
  v23 = a3;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(v15, block);

}

void __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  const __CFString *v37;
  statfs v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)*(id *)(a1 + 32);
  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("/var/mobile/");
  bzero(&v38, 0x878uLL);
  v4 = objc_retainAutorelease(v3);
  if (statfs((const char *)-[__CFString fileSystemRepresentation](v4, "fileSystemRepresentation"), &v38))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check for available space failed (unable to statfs basePath=%@)"), v4);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildError:underlying:description:", 8602, 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _spaceCheckPhaseError:checkingFromBase:withIdentier:completion:](SUCoreSpace, "_spaceCheckPhaseError:checkingFromBase:withIdentier:completion:", v7, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v38.f_mntonname, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v27 = 0;
      v9 = (void *)CacheDeleteCopyAvailableSpaceForVolume();
      v10 = v9;
      if (v9)
      {
        v12 = objc_msgSend(v9, "unsignedLongLongValue");
        v13 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "oslog");
        v15 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1 + 40);
          v17 = *(_QWORD *)(a1 + 56);
          v18 = CFSTR("NO");
          if (v12 >= v13)
            v18 = CFSTR("YES");
          *(_DWORD *)buf = 138544386;
          v29 = v8;
          v30 = 2114;
          v31 = v16;
          v32 = 2048;
          v33 = v17;
          v34 = 2048;
          v35 = v12;
          v36 = 2114;
          v37 = v18;
          _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "[SPACE] checked space on %{public}@ (%{public}@): required %llu and %llu is available | haveEnoughSpace:%{public}@", buf, 0x34u);
        }

        objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "completionQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke_70;
        block[3] = &unk_1EA87A178;
        v21 = *(id *)(a1 + 48);
        v26 = v12 >= v13;
        v24 = v21;
        v25 = v12;
        dispatch_async(v20, block);

        v5 = 0;
        v7 = 0;
      }
      else
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check for available space failed (unable to determine available space through cache delete for basePath=%@)"), v4);
        objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "buildError:underlying:description:", 8602, 0, v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreSpace _spaceCheckPhaseError:checkingFromBase:withIdentier:completion:](SUCoreSpace, "_spaceCheckPhaseError:checkingFromBase:withIdentier:completion:", v7, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }

    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("check for available space failed (unable to determine volume name from basePath=%@)"), v4);
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "buildError:underlying:description:", 8602, 0, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUCoreSpace _spaceCheckPhaseError:checkingFromBase:withIdentier:completion:](SUCoreSpace, "_spaceCheckPhaseError:checkingFromBase:withIdentier:completion:", v7, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }

  }
}

uint64_t __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 completion:(id)a6
{
  +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:timeout:withCompletionQueue:completion:](SUCoreSpace, "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:timeout:withCompletionQueue:completion:", a3, a4, *(_QWORD *)&a5, 0xFFFFFFFFLL, a6, a7);
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 withCompletionQueue:(id)a7 completion:(id)a8
{
  uint64_t v11;
  __CFString *v13;
  id v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v11 = *(_QWORD *)&a5;
  v35[4] = *MEMORY[0x1E0C80C00];
  v13 = (__CFString *)a4;
  v14 = a7;
  v15 = a8;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (v13)
    v16 = v13;
  else
    v16 = CFSTR("/var/mobile/");
  if (a6 >= 1)
    v17 = a6;
  else
    v17 = 300;
  v35[0] = v16;
  v34[0] = CFSTR("CACHE_DELETE_VOLUME");
  v34[1] = CFSTR("CACHE_DELETE_AMOUNT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v18;
  v34[2] = CFSTR("CACHE_DELETE_URGENCY_LIMIT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v19;
  v34[3] = CFSTR("CACHE_DELETE_PURGE_TIMEOUT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v21;
    _os_log_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering CacheDeletePurge with info: %{public}@", buf, 0xCu);
  }

  +[SUCoreSpace _trackSpaceBegin:](SUCoreSpace, "_trackSpaceBegin:", CFSTR("CacheDeletePurgeSpaceWithInfo"));
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.CacheDeletePurge"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v15;
  v25 = v14;
  v26 = v24;
  v29[3] = CacheDeletePurgeSpaceWithInfo();

  _Block_object_dispose(&v28, 8);
}

void __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  CFTypeID TypeID;
  void *v5;
  NSObject *v6;
  const __CFNumber *Value;
  void *v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *valuePtr;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  if (!a2)
  {
    v11 = CFSTR("no results provided on cache delete purge complete");
LABEL_12:
    v12 = 8601;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildError:underlying:description:", v12, 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v3 = a2;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3))
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("cacheDeletePurge"), CFSTR("result provided by CacheDeletePurgeSpaceWithInfo is not CFDictionary type - ignored"), 8112, 0);

    v11 = CFSTR("invalid results type provided on cache delete purge complete");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v3;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[PURGE] cache delete purge results: %@", buf, 0xCu);
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("CACHE_DELETE_AMOUNT"));
  if (!Value)
  {
    v11 = CFSTR("no amount of space purged provided on cache delete purge complete");
    v12 = 8601;
    goto LABEL_14;
  }
  CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = valuePtr;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld bytes", buf, 0xCu);
  }

  if ((unint64_t)valuePtr < *(_QWORD *)(a1 + 64))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR("purged %lld but needed to purge %lld (not enough space)"), valuePtr, *(_QWORD *)(a1 + 64));
    v12 = 8600;
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "oslog");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    v29 = valuePtr;
    v30 = 2048;
    v31 = v20;
    _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }

  v12 = 0;
  v11 = 0;
  v14 = 0;
LABEL_16:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withResult:withError:", CFSTR("CacheDeletePurgeSpaceWithInfo"), v12, v14);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke_95;
    block[3] = &unk_1EA87A1C8;
    v24 = *(id *)(a1 + 48);
    v25 = v12;
    v26 = valuePtr;
    v22 = v14;
    v23 = *(id *)(a1 + 40);
    dispatch_async(v16, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.CacheDeletePurge"));
  }
  v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v17)
  {
    CFRelease(v17);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

uint64_t __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke_95(_QWORD *a1)
{
  (*(void (**)(_QWORD, BOOL, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[7] == 0, a1[8], a1[4]);
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", a1[5], CFSTR("space.CacheDeletePurge"));
}

+ (void)cacheDeletePurge:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](SUCoreSpace, "_isUserVolume:", CFSTR("/var/mobile/")))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.CacheDeletePurge"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSpace sharedSpaceManager](SUCoreSpace, "sharedSpaceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spaceQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_1EA87A240;
    v18 = v10;
    v16 = v9;
    v17 = v11;
    v14 = v11;
    +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:timeout:withCompletionQueue:completion:](SUCoreSpace, "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:timeout:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), v7, 300, v13, v15);

  }
  else
  {
    +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), v7, v9, v10);
  }

}

void __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v7 = a4;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1EA87A218;
    v10 = *(id *)(a1 + 48);
    v16 = a2;
    v14 = v10;
    v15 = a3;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.CacheDeletePurge"));
  }

}

uint64_t __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.CacheDeletePurge"));
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  +[SUCoreSpace checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:timeout:additionalOptions:withCompletionQueue:completion:](SUCoreSpace, "checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:timeout:additionalOptions:withCompletionQueue:completion:", a3, a4, *(_QWORD *)&a5, 0xFFFFFFFFLL, 0, a6, a7);
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 additionalOptions:(id)a7 withCompletionQueue:(id)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  CFTypeID TypeID;
  void *v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  id v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  uint8_t buf[4];
  unint64_t v55;
  __int16 v56;
  unint64_t v57;
  _QWORD v58[3];
  _QWORD v59[5];

  v59[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a7;
  v46 = a8;
  v15 = a9;
  +[SUCoreSpace _trackSpaceBegin:](SUCoreSpace, "_trackSpaceBegin:", CFSTR("CacheDeleteCopyPurgeableSpaceWithInfo"));
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.CacheDeletePurgeable"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 >= 1)
    v16 = a6;
  else
    v16 = 300;
  v47 = v13;
  v59[0] = v13;
  v58[0] = CFSTR("CACHE_DELETE_VOLUME");
  v58[1] = CFSTR("CACHE_DELETE_URGENCY");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v17;
  v58[2] = CFSTR("CACHE_DELETE_PURGE_TIMEOUT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v14)
    objc_msgSend(v20, "addEntriesFromDictionary:", v14);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "oslog");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = (unint64_t)v20;
    _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering cache delete purgeable check with options: %{public}@", buf, 0xCu);
  }

  v23 = CacheDeleteCopyPurgeableSpaceWithInfo();
  v24 = 0x1E0DA8000;
  if (!v23)
  {
    v33 = v14;
    v30 = 0;
    v31 = CFSTR("no results provided on cache delete purgeable complete");
LABEL_18:
    v32 = 8603;
LABEL_21:
    objc_msgSend(*(id *)(v24 + 2336), "sharedCore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "buildError:underlying:description:", v32, 0, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v25 = (void *)v23;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v25))
  {
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trackAnomaly:forReason:withResult:withError:", CFSTR("cacheDeletePurgeable"), CFSTR("result provided by CacheDeleteCopyPurgeableSpaceWithInfo is not CFDictionary type - ignored"), 8112, 0);

    CFRelease(v25);
    v30 = 0;
    v31 = CFSTR("invalid results type provided on cache delete purgeable complete");
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "oslog");
  v28 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = (unint64_t)v25;
    _os_log_impl(&dword_1DDFDD000, v28, OS_LOG_TYPE_DEFAULT, "[SPACE] cache delete purgeable results: %@", buf, 0xCu);
  }

  objc_msgSend(v25, "objectForKey:", CFSTR("CACHE_DELETE_AMOUNT"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v30 = 0;
    v31 = CFSTR("no amount of purgeable space provided on cache delete purgeable complete");
    v32 = 8603;
    goto LABEL_20;
  }
  v30 = objc_msgSend(v29, "unsignedLongLongValue");
  if (v30 < a3)
  {
    v31 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("purgeable %lld but needed to purge %lld (not enough space)"), v30, a3);
    v32 = 8600;
LABEL_20:
    v33 = v14;

    v24 = 0x1E0DA8000uLL;
    goto LABEL_21;
  }
  v33 = v14;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "oslog");
  v43 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v55 = v30;
    v56 = 2048;
    v57 = a3;
    _os_log_impl(&dword_1DDFDD000, v43, OS_LOG_TYPE_DEFAULT, "[SPACE] purgeable %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }

  v32 = 0;
  v31 = 0;
  v35 = 0;
  v24 = 0x1E0DA8000;
LABEL_22:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withResult:withError:", CFSTR("CacheDeleteCopyPurgeableSpaceWithInfo"), v32, v35);
  v36 = *(void **)(v24 + 2336);
  v37 = v15;
  if (v15)
  {
    objc_msgSend(v36, "sharedCore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v46;
    objc_msgSend(v38, "selectCompletionQueue:", v46);
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__SUCoreSpace_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion___block_invoke;
    block[3] = &unk_1EA87A1C8;
    v51 = v37;
    v52 = v32;
    v53 = v30;
    v49 = v35;
    v41 = v45;
    v50 = v45;
    dispatch_async(v40, block);

  }
  else
  {
    v41 = v45;
    objc_msgSend(v36, "endTransaction:withName:", v45, CFSTR("space.CacheDeletePurgeable"));
    v39 = v46;
  }

}

uint64_t __135__SUCoreSpace_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion___block_invoke(_QWORD *a1)
{
  (*(void (**)(_QWORD, BOOL, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[7] == 0, a1[8], a1[4]);
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", a1[5], CFSTR("space.CacheDeletePurgeable"));
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](SUCoreSpace, "_isUserVolume:", CFSTR("/var/mobile/")))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.CacheDeletePurgeable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSpace sharedSpaceManager](SUCoreSpace, "sharedSpaceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spaceQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_1EA87A240;
    v18 = v10;
    v16 = v9;
    v17 = v11;
    v14 = v11;
    +[SUCoreSpace checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:timeout:additionalOptions:withCompletionQueue:completion:](SUCoreSpace, "checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:timeout:additionalOptions:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), v7, 300, 0, v13, v15);

  }
  else
  {
    +[SUCoreSpace checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), v7, v9, v10);
  }

}

void __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v7 = a4;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1EA87A218;
    v10 = *(id *)(a1 + 48);
    v16 = a2;
    v14 = v10;
    v15 = a3;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.CacheDeletePurgeable"));
  }

}

uint64_t __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.CacheDeletePurgeable"));
}

+ (id)cacheDeleteUrgencyName:(int)a3
{
  if ((a3 + 1) > 5)
    return CFSTR("UNKNOWN TYPE");
  else
    return *(&off_1EA87A328 + a3 + 1);
}

+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = (__CFString *)a4;
  +[SUCoreSpace _trackSpaceBegin:](SUCoreSpace, "_trackSpaceBegin:", CFSTR("ASDPurgeableAppRequest"));
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.AppOffloadPurgeable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CF9D98]);
  if (v13)
    v16 = v13;
  else
    v16 = CFSTR("/var/mobile/");
  v17 = (void *)objc_msgSend(v15, "initWithVolume:urgency:", v16, a5);

  objc_msgSend(v17, "setPerformAvailablityCheck:", 1);
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceClass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("AppleTV")))
  {
    v20 = _os_feature_enabled_impl();

    if (v20)
      objc_msgSend(v17, "setSkipLaunchCheck:", 1);
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "oslog");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v17;
    _os_log_impl(&dword_1DDFDD000, v22, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering app offload purgeable check with options: %{public}@", buf, 0xCu);
  }

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9D90]), "initWithOptions:", v17);
  if (v23)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __109__SUCoreSpace_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v27[3] = &unk_1EA87A268;
    v31 = a3;
    v30 = v12;
    v28 = v11;
    v29 = v14;
    objc_msgSend(v23, "startWithCompletionBlock:", v27);

    v24 = v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trackAnomaly:forReason:withResult:withError:", CFSTR("ASDPurgeableAppRequest"), CFSTR("Failed to create ASDPurgeableAppRequest instance"), 8100, 0);

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "buildError:underlying:description:", 8605, 0, CFSTR("Failed to create ASDPurgeAppsRequest instance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _trackSpaceEnd:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withResult:withError:", CFSTR("ASDPurgeAppsRequest"), 8605, v24);
    +[SUCoreSpace _issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:](SUCoreSpace, "_issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:", v12, v11, 0, 0, v24, v14);
  }

}

void __109__SUCoreSpace_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v9 = 0;
    v12 = CFSTR("ASDPurgeableAppRequest returned null response");
    v13 = 8605;
    goto LABEL_12;
  }
  v9 = objc_msgSend(v7, "purgeableSize");
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v9;
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "[SPACE] app offload purgeable space %lld bytes", buf, 0xCu);
  }

  if (v9 < a1[7])
  {
    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("purgeable %lld is less than requested %lld (not enough space)"), v9, a1[7]);
    v13 = 8600;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject buildError:underlying:description:](v15, "buildError:underlying:description:", v13, v8, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_13;
  }
  if (!a2)
  {
    v12 = CFSTR("ASDPurgeableAppRequest returned result=NO");
    v13 = 8606;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "oslog");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = a1[7];
    *(_DWORD *)buf = 134218240;
    v20 = v9;
    v21 = 2048;
    v22 = v16;
    _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "[SPACE] app offload purgeable %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }
  v13 = 0;
  v12 = 0;
  v17 = 0;
  v18 = 1;
LABEL_13:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withResult:withError:", CFSTR("ASDPurgeableAppRequest"), v13, v17);
  +[SUCoreSpace _issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:](SUCoreSpace, "_issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:", a1[6], a1[4], v18, v9, v17, a1[5]);

}

+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v9 = a5;
  v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](SUCoreSpace, "_isUserVolume:", CFSTR("/var/mobile/")))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.AppOffloadPurgeable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectCompletionQueue:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_1EA87A240;
    v18 = v10;
    v16 = v9;
    v17 = v11;
    v14 = v11;
    +[SUCoreSpace checkPurgeableSpaceOffloadApps:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "checkPurgeableSpaceOffloadApps:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), a4, v13, v15);

  }
  else
  {
    +[SUCoreSpace checkPurgeableSpaceOffloadApps:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "checkPurgeableSpaceOffloadApps:cacheDeleteUrgency:withCompletionQueue:completion:", a3, a4, v9, v10);
  }

}

void __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v7 = a4;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1EA87A218;
    v10 = *(id *)(a1 + 48);
    v16 = a2;
    v14 = v10;
    v15 = a3;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.AppOffloadPurgeable"));
  }

}

uint64_t __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.AppOffloadPurgeable"));
}

+ (void)offloadAppsPurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = (__CFString *)a4;
  +[SUCoreSpace _trackSpaceBegin:](SUCoreSpace, "_trackSpaceBegin:", CFSTR("ASDPurgeAppsRequest"));
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.AppOffloadPurge"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CF9D88]);
  if (v13)
    v16 = v13;
  else
    v16 = CFSTR("/var/mobile/");
  v17 = (void *)objc_msgSend(v15, "initWithVolume:urgency:", v16, a5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDesiredPurgeAmount:", v18);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("AppleTV")))
  {
    v21 = _os_feature_enabled_impl();

    if (v21)
      objc_msgSend(v17, "setSkipLaunchCheck:", 1);
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_DEFAULT, "[SPACE] triggering app offload purge with options: %{public}@", buf, 0xCu);
  }

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9D80]), "initWithOptions:", v17);
  if (v24)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __95__SUCoreSpace_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v28[3] = &unk_1EA87A290;
    v32 = a3;
    v31 = v12;
    v29 = v11;
    v30 = v14;
    objc_msgSend(v24, "startWithCompletionBlock:", v28);

    v25 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trackAnomaly:forReason:withResult:withError:", CFSTR("ASDPurgeAppsRequest"), CFSTR("Failed to create ASDPurgeAppsRequest instance"), 8100, 0);

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "buildError:underlying:description:", 8607, 0, CFSTR("Failed to create ASDPurgeAppsRequest instance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _trackSpaceEnd:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withResult:withError:", CFSTR("ASDPurgeAppsRequest"), 8607, v25);
    +[SUCoreSpace _issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:](SUCoreSpace, "_issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:", v12, v11, 0, 0, v25, v14);
  }

}

void __95__SUCoreSpace_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  _QWORD *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v46 = CFSTR("ASDPurgeAppsRequest returned null response");
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: %@", buf, 0xCu);
    }

    v29 = 0;
    v30 = CFSTR("ASDPurgeAppsRequest returned null response");
    v31 = 8607;
    goto LABEL_27;
  }
  if (v11)
  {
    *(_DWORD *)buf = 134217984;
    v46 = (const __CFString *)objc_msgSend(v7, "purgedSize");
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: purged size %lld bytes", buf, 0xCu);
  }
  v37 = a2;
  v38 = a1;
  v39 = v8;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "purgedApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v15;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: number of purgedApps: %d", buf, 8u);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = v7;
  objc_msgSend(v7, "purgedApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "bundleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "oslog");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "bundleID");
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "purgeableReason");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v21, "purgeableType");
            v28 = objc_msgSend(v21, "staticDiskUsage");
            *(_DWORD *)buf = 138413058;
            v46 = v25;
            v47 = 2112;
            v48 = v26;
            v49 = 1024;
            v50 = v27;
            v51 = 2048;
            v52 = v28;
            _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload purged app bundleID: '%@'; reason: '%@'; purgeableType: '%d'; diskUsage: '%lld'",
              buf,
              0x26u);

          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v18);
  }

  v7 = v40;
  v29 = objc_msgSend(v40, "purgedSize");
  a1 = v38;
  if (v29 < v38[7])
  {
    v30 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("purged %lld but needed to purge %lld (not enough space)"), v29, v38[7]);
    v31 = 8600;
    v8 = v39;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v33 = objc_claimAutoreleasedReturnValue();
    -[NSObject buildError:underlying:description:](v33, "buildError:underlying:description:", v31, v8, v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    goto LABEL_28;
  }
  v8 = v39;
  if (!v37)
  {
    v30 = CFSTR("ASDPurgeAppsRequest returned result=NO");
    v31 = 8608;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "oslog");
  v33 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (void *)v38[7];
    *(_DWORD *)buf = 134218240;
    v46 = (const __CFString *)v29;
    v47 = 2048;
    v48 = v34;
    _os_log_impl(&dword_1DDFDD000, v33, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld when needed to purge %lld (have enough space)", buf, 0x16u);
  }
  v31 = 0;
  v30 = 0;
  v35 = 0;
  v36 = 1;
LABEL_28:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withResult:withError:", CFSTR("ASDPurgeAppsRequest"), v31, v35);
  +[SUCoreSpace _issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:](SUCoreSpace, "_issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:", a1[6], a1[4], v36, v29, v35, a1[5]);

}

+ (void)offloadAppsPurge:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v9 = a5;
  v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](SUCoreSpace, "_isUserVolume:", CFSTR("/var/mobile/")))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("space.AppOffloadPurge"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSpace sharedSpaceManager](SUCoreSpace, "sharedSpaceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spaceQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_1EA87A240;
    v18 = v10;
    v16 = v9;
    v17 = v11;
    v14 = v11;
    +[SUCoreSpace offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), a4, v13, v15);

  }
  else
  {
    +[SUCoreSpace offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:](SUCoreSpace, "offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:", a3, CFSTR("/var/mobile/"), a4, v9, v10);
  }

}

void __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v7 = a4;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectCompletionQueue:", *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1EA87A218;
    v10 = *(id *)(a1 + 48);
    v16 = a2;
    v14 = v10;
    v15 = a3;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.AppOffloadPurge"));
  }

}

uint64_t __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.AppOffloadPurge"));
}

+ (void)_issueAppOffloadPurgeCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurged:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectCompletionQueue:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__SUCoreSpace__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction___block_invoke;
    block[3] = &unk_1EA87A218;
    v24 = a5;
    v22 = v13;
    v23 = a6;
    v20 = v15;
    v21 = v16;
    dispatch_async(v18, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v16, CFSTR("space.AppOffloadPurge"));
  }

}

uint64_t __112__SUCoreSpace__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.AppOffloadPurge"));
}

+ (void)_issueSpacePurgeableCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurgeable:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectCompletionQueue:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__SUCoreSpace__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction___block_invoke;
    block[3] = &unk_1EA87A218;
    v24 = a5;
    v22 = v13;
    v23 = a6;
    v20 = v15;
    v21 = v16;
    dispatch_async(v18, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v16, CFSTR("space.AppOffloadPurgeable"));
  }

}

uint64_t __114__SUCoreSpace__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("space.AppOffloadPurgeable"));
}

+ (void)_checkMinimumRequiredSpace:(unint64_t)a3 purgingFromBase:(id)a4 userInitiated:(BOOL)a5 totalRequiredFreeSpace:(unint64_t)a6 freeSpaceAvailable:(unint64_t)a7 checkAvailableSpaceTransaction:(id)a8 withCompletionQueue:(id)a9 completion:(id)a10
{
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  unint64_t v32;
  uint64_t v33;

  v13 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = a3;
      _os_log_impl(&dword_1DDFDD000, v20, OS_LOG_TYPE_DEFAULT, "[SPACE] checking minimal disk space available: need %llu", buf, 0xCu);
    }

    +[SUCoreSpace _trackSpaceBegin:withIdentifier:](SUCoreSpace, "_trackSpaceBegin:withIdentifier:", CFSTR("checkAvailableSpace"), CFSTR("minimal"));
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke;
    v26[3] = &unk_1EA87A2E0;
    v29 = v18;
    v27 = v17;
    v28 = v16;
    v30 = a3;
    +[SUCoreSpace checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:](SUCoreSpace, "checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:", a3, v15, CFSTR("minimal"), v13, v26);

    v21 = v29;
  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("not enough total space (no minimal): need %llu and %llu is available"), a6, a7);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "buildError:underlying:description:", 8600, 0, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = (unint64_t)v21;
      _os_log_impl(&dword_1DDFDD000, v25, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", v18, v17, 0, 0, a7, v23, v16);
  }

}

void __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v7 = a4;
  +[SUCoreSpace sharedSpaceManager](SUCoreSpace, "sharedSpaceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spaceQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke_2;
  block[3] = &unk_1EA87A2B8;
  v14 = v7;
  v17 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v20 = a2;
  v11 = *(_QWORD *)(a1 + 56);
  v16 = v10;
  v18 = v11;
  v19 = a3;
  v12 = v7;
  dispatch_async(v9, block);

}

void __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("minimal"), objc_msgSend(v2, "code"), *(_QWORD *)(a1 + 32));
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (*(_BYTE *)(a1 + 80))
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("minimal"), 0, 0);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 64);
      v6 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 134218240;
      v13 = v5;
      v14 = 2048;
      v15 = v6;
      _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "[SPACE] minimal disk space available: need %llu and %llu is available (have enough space)", buf, 0x16u);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("not enough minimal space to install update: need %llu and %llu is available"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buildError:underlying:description:", 8600, 0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", CFSTR("checkAvailableSpace"), CFSTR("minimal"), objc_msgSend(v11, "code"), v11);
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:](SUCoreSpace, "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 72), v11, *(_QWORD *)(a1 + 48));

  }
}

+ (void)_spaceCheckPhaseError:(id)a3 checkingFromBase:(id)a4 withIdentier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v9 = a3;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0DA8938];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "sharedDiag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("space check from base(%@) phase(%@) failed"), v13, v12);

  objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[SPACE]"), v15, objc_msgSend(v9, "code"), v9);
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "completionQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SUCoreSpace__spaceCheckPhaseError_checkingFromBase_withIdentier_completion___block_invoke;
  block[3] = &unk_1EA878088;
  v21 = v9;
  v22 = v10;
  v18 = v9;
  v19 = v10;
  dispatch_async(v17, block);

}

uint64_t __78__SUCoreSpace__spaceCheckPhaseError_checkingFromBase_withIdentier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

+ (void)_issueSpaceCheckCompletion:(id)a3 withCompletionQueue:(id)a4 haveEnoughSpace:(BOOL)a5 haveTotalRequired:(BOOL)a6 freeSpaceAvailable:(unint64_t)a7 error:(id)a8 releasingTransaction:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = a9;
  v18 = v17;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectCompletionQueue:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __142__SUCoreSpace__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction___block_invoke;
    block[3] = &unk_1EA87A308;
    v26 = a5;
    v27 = a6;
    v24 = v14;
    v25 = a7;
    v22 = v16;
    v23 = v18;
    dispatch_async(v20, block);

  }
  else if (v17)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v17, CFSTR("space.CheckAvailableSpace"));
  }

}

uint64_t __142__SUCoreSpace__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("space.CheckAvailableSpace"));
  return result;
}

+ (BOOL)_isUserVolume:(id)a3
{
  void *v4;
  char v5;
  BOOL result;
  _QWORD v7[3];
  _BYTE v8[4];
  _DWORD v9[258];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  bzero(v8, 0x40CuLL);
  v7[2] = 0;
  v7[0] = 5;
  v7[1] = 2147491840;
  result = 0;
  if (getattrlist((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 5, 2147491840, 0), v7, v8, 0x40CuLL, 0) != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", (char *)v9 + v9[0], 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("User"));

    if ((v5 & 1) != 0)
      return 1;
  }
  return result;
}

+ (void)_trackSpaceBegin:(id)a3
{
  +[SUCoreSpace _trackSpaceBegin:withIdentifier:](SUCoreSpace, "_trackSpaceBegin:withIdentifier:", a3, 0);
}

+ (void)_trackSpaceBegin:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA8938];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDiag");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackBegin:atLevel:forModule:withIdentifier:", v7, 1, CFSTR("space"), v6);

}

+ (void)_trackSpaceEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:](SUCoreSpace, "_trackSpaceEnd:withIdentifier:withResult:withError:", a3, 0, a4, a5);
}

+ (void)_trackSpaceEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0DA8938];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "sharedDiag");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", v12, 1, CFSTR("space"), v11, a5, v10);

}

- (OS_dispatch_queue)spaceQueue
{
  return self->_spaceQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spaceQueue, 0);
}

@end
