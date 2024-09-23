@implementation ICStorageManager

- (ICStorageManager)init
{
  ICStorageManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICStorageManager;
  v2 = -[ICStorageManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.itunescloud.ICStorageManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (unint64_t)storageSpaceAvailable
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "Failed to obtain system free space. err=%{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB2B00]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  if (v8 >= 0x1F400000)
    v9 = v8 - 524288000;
  else
    v9 = 0;

  return v9;
}

- (void)ensureStorageIsAvailable:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ICStorageManager_ensureStorageIsAvailable_withCompletionHandler___block_invoke;
  block[3] = &unk_1E438DF68;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __67__ICStorageManager_ensureStorageIsAvailable_withCompletionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "storageSpaceAvailable");
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 <= v2)
  {
    (*(void (**)(_QWORD, _QWORD, unint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v2, 0);
  }
  else
  {
    v8[0] = CFSTR("/private/var");
    v7[0] = CFSTR("CACHE_DELETE_VOLUME");
    v7[1] = CFSTR("CACHE_DELETE_AMOUNT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3 - v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("CACHE_DELETE_PURGE_TIMEOUT");
    v8[1] = v4;
    v8[2] = &unk_1E43E65E0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(id *)(a1 + 40);
    CacheDeletePurgeSpaceWithInfo();

  }
}

void __67__ICStorageManager_ensureStorageIsAvailable_withCompletionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a2, "objectForKey:", CFSTR("CACHE_DELETE_AMOUNT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, v5, objc_msgSend(*(id *)(a1 + 32), "storageSpaceAvailable"), 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6194);
  return (id)sharedManager___sharedManager;
}

void __33__ICStorageManager_sharedManager__block_invoke()
{
  ICStorageManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICStorageManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

@end
