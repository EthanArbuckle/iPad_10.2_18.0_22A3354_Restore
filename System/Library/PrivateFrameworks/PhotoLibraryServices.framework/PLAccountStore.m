@implementation PLAccountStore

void __43__PLAccountStore_cachedPrimaryAppleAccount__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  NSObject *v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[15];
  v4 = 0x1E0C99000uLL;
  if (!v3)
  {
    objc_msgSend(v2, "aa_primaryAppleAccount");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 120);
    *(_QWORD *)(v6 + 120) = v5;

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 120);
        *(_DWORD *)buf = 138412290;
        v33 = v11;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Caching primaryAppleAccount: %@", buf, 0xCu);
      }

      v12 = *MEMORY[0x1E0C8F3D8];
      v37[0] = *MEMORY[0x1E0C8F380];
      v37[1] = v12;
      v37[2] = *MEMORY[0x1E0C8F410];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v14)
      {
        v16 = v14;
        v17 = *(_QWORD *)v29;
        *(_QWORD *)&v15 = 138412546;
        v27 = v15;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v13);
            v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "isEnabledForDataclass:", v19, v27, (_QWORD)v28);
            PLBackendGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v27;
              v22 = CFSTR(" NOT ");
              if (v20)
                v22 = CFSTR(" ");
              v33 = v22;
              v34 = 2112;
              v35 = v19;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "primaryAppleAccount is%@enabled for dataclass %@", buf, 0x16u);
            }

          }
          v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v16);
      }

      v4 = 0x1E0C99000;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "No primaryAppleAccount", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 32);
      v13 = *(id *)(v24 + 120);
      *(_QWORD *)(v24 + 120) = v23;
    }

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  objc_msgSend(*(id *)(v4 + 3640), "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v3, "isEqual:", v25);

  if ((v26 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

+ (id)pl_sharedAccountStore
{
  pl_dispatch_once();
  return (id)pl_sharedAccountStore_accountStore;
}

- (ACAccount)cachedPrimaryAppleAccount
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__30582;
  v8 = __Block_byref_object_dispose__30583;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (ACAccount *)v2;
}

void __39__PLAccountStore_pl_sharedAccountStore__block_invoke()
{
  PLAccountStore *v0;
  void *v1;

  v0 = objc_alloc_init(PLAccountStore);
  v1 = (void *)pl_sharedAccountStore_accountStore;
  pl_sharedAccountStore_accountStore = (uint64_t)v0;

}

- (PLAccountStore)init
{
  PLAccountStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLAccountStore;
  v2 = -[PLAccountStore init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("placcount-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_accountDidChange_, *MEMORY[0x1E0C8F010], v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PLAccountStore;
  -[PLAccountStore dealloc](&v4, sel_dealloc);
}

- (void)accountDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "ACAccountStore accountDidChange, clearing cached properties in PLAccountStore.", buf, 2u);
  }

  -[PLAccountStore clearCachedProperties](self, "clearCachedProperties");
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "ACAccountStore accountDidChange. Posting PLAccountStoreDidChange notification.", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PLAccountStoreDidChangeNotification"), self, v6);

}

- (void)clearCachedProperties
{
  pl_dispatch_sync();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrimaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __39__PLAccountStore_clearCachedProperties__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 120);
  *(_QWORD *)(v1 + 120) = 0;

}

@end
