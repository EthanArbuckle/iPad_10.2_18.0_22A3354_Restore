@implementation ICSecurityInfo

_QWORD *__70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke(_QWORD *result)
{
  *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = *(_BYTE *)(result[4] + 10);
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(result[4] + 11);
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = *(_BYTE *)(result[4] + 8);
  *(_BYTE *)(*(_QWORD *)(result[8] + 8) + 24) = *(_BYTE *)(result[4] + 9);
  return result;
}

- (BOOL)isContentProtectionEnabled
{
  BOOL v3;

  v3 = 0;
  -[ICSecurityInfo _getContentProtectionEnabled:isDeviceClassCUnlocked:](self, "_getContentProtectionEnabled:isDeviceClassCUnlocked:", &v3, 0);
  return v3;
}

- (BOOL)isDeviceClassCUnlocked
{
  BOOL v3;

  v3 = 0;
  -[ICSecurityInfo _getContentProtectionEnabled:isDeviceClassCUnlocked:](self, "_getContentProtectionEnabled:isDeviceClassCUnlocked:", 0, &v3);
  return v3;
}

- (void)_getContentProtectionEnabled:(BOOL *)a3 isDeviceClassCUnlocked:(BOOL *)a4
{
  NSObject *accessQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[9];
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_accessQueue);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  accessQueue = self->_accessQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke;
  block[3] = &unk_1E438FCA0;
  block[4] = self;
  block[5] = &v24;
  block[6] = &v20;
  block[7] = &v16;
  block[8] = &v12;
  dispatch_sync(accessQueue, block);
  if (a3 && !*((_BYTE *)v25 + 24) || a4 && !*((_BYTE *)v17 + 24))
  {
    v9 = self->_accessQueue;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_2;
    v10[3] = &unk_1E438FCC8;
    v10[7] = a3;
    v10[8] = a4;
    v10[4] = self;
    v10[5] = &v20;
    v10[6] = &v12;
    dispatch_barrier_sync(v9, v10);
  }
  if (a3)
    *a3 = *((_BYTE *)v21 + 24);
  if (a4)
    *a4 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

+ (ICSecurityInfo)sharedSecurityInfo
{
  if (sharedSecurityInfo_sOnceToken != -1)
    dispatch_once(&sharedSecurityInfo_sOnceToken, &__block_literal_global_31222);
  return (ICSecurityInfo *)(id)sharedSecurityInfo_sSharedInstance;
}

void __36__ICSecurityInfo_sharedSecurityInfo__block_invoke()
{
  ICSecurityInfo *v0;
  void *v1;

  v0 = objc_alloc_init(ICSecurityInfo);
  v1 = (void *)sharedSecurityInfo_sSharedInstance;
  sharedSecurityInfo_sSharedInstance = (uint64_t)v0;

}

- (ICSecurityInfo)init
{
  ICSecurityInfo *v2;
  ICSecurityInfo *v3;
  uint64_t v4;
  NSMutableArray *pendingFirstUnlockBlocks;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *calloutQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICSecurityInfo;
  v2 = -[ICSecurityInfo init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_firstUnlockNotificationToken = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    pendingFirstUnlockBlocks = v3->_pendingFirstUnlockBlocks;
    v3->_pendingFirstUnlockBlocks = (NSMutableArray *)v4;

    v6 = MEMORY[0x1E0C80D50];
    v7 = dispatch_queue_create("com.apple.itunescloud.ICSecurityInfo.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.itunescloud.ICSecurityInfo.calloutQueue", v6);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

uint64_t __70__ICSecurityInfo__getContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_loadContentProtectionEnabled:isDeviceClassCUnlocked:", *(_QWORD *)(a1 + 56) != 0, *(_QWORD *)(a1 + 64) != 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9);
  return result;
}

- (void)_loadContentProtectionEnabled:(BOOL)a3 isDeviceClassCUnlocked:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int v8;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *accessQueue;
  NSObject *v14;
  _QWORD handler[5];
  uint8_t buf[16];

  v4 = a4;
  v5 = a3;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  if (!self->_hasLoadedContentProtectionEnabled && v5)
  {
    v8 = MKBDeviceFormattedForContentProtection();
    if ((v8 & 0x80000000) == 0)
    {
      self->_hasLoadedContentProtectionEnabled = 1;
      self->_isContentProtectionEnabled = v8 == 1;
    }
  }
  if (!self->_hasLoadedDeviceClassCUnlocked && v4)
  {
    v10 = MKBDeviceUnlockedSinceBoot();
    if (v10 < 0)
      goto LABEL_22;
    v11 = v10;
    self->_hasLoadedDeviceClassCUnlocked = 1;
    self->_isDeviceClassCUnlocked = v10 == 1;
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "Initially Class C unlocked.", buf, 2u);
    }

    if (v11 != 1)
    {
LABEL_22:
      if (!self->_firstUnlockNotificationToken)
      {
        accessQueue = self->_accessQueue;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke;
        handler[3] = &unk_1E4391078;
        handler[4] = self;
        notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockNotificationToken, accessQueue, handler);
        if (MKBDeviceUnlockedSinceBoot() == 1)
        {
          v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "Class C unlocked!", buf, 2u);
          }

          -[ICSecurityInfo _processFirstUnlockNotification](self, "_processFirstUnlockNotification");
        }
      }
    }
  }
}

- (void)dealloc
{
  int firstUnlockNotificationToken;
  objc_super v4;

  firstUnlockNotificationToken = self->_firstUnlockNotificationToken;
  if (firstUnlockNotificationToken)
  {
    notify_cancel(firstUnlockNotificationToken);
    self->_firstUnlockNotificationToken = 0;
  }
  -[NSMutableArray removeAllObjects](self->_pendingFirstUnlockBlocks, "removeAllObjects");
  v4.receiver = self;
  v4.super_class = (Class)ICSecurityInfo;
  -[ICSecurityInfo dealloc](&v4, sel_dealloc);
}

- (BOOL)isDeviceUnlocked
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (void)performBlockAfterFirstUnlock:(id)a3
{
  void (**v4)(_QWORD);
  BOOL v5;
  NSObject *accessQueue;
  _QWORD block[5];
  void (**v8)(_QWORD);
  __int16 v9;

  v4 = (void (**)(_QWORD))a3;
  v9 = 0;
  -[ICSecurityInfo _getContentProtectionEnabled:isDeviceClassCUnlocked:](self, "_getContentProtectionEnabled:isDeviceClassCUnlocked:", (char *)&v9 + 1, &v9);
  if (HIBYTE(v9))
    v5 = v9 == 0;
  else
    v5 = 0;
  if (v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke;
    block[3] = &unk_1E4390EF8;
    block[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, block);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)_processFirstUnlockNotification
{
  int firstUnlockNotificationToken;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *calloutQueue;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  *(_WORD *)&self->_hasLoadedDeviceClassCUnlocked = 257;
  firstUnlockNotificationToken = self->_firstUnlockNotificationToken;
  if (firstUnlockNotificationToken)
  {
    notify_cancel(firstUnlockNotificationToken);
    self->_firstUnlockNotificationToken = 0;
  }
  v4 = (void *)-[NSMutableArray copy](self->_pendingFirstUnlockBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingFirstUnlockBlocks, "removeAllObjects");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        calloutQueue = self->_calloutQueue;
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke;
        block[3] = &unk_1E4390D18;
        block[4] = v11;
        dispatch_async(calloutQueue, block);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v13 = self->_calloutQueue;
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke_2;
  v14[3] = &unk_1E43913D8;
  v14[4] = self;
  dispatch_async(v13, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_pendingFirstUnlockBlocks, 0);
}

uint64_t __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__ICSecurityInfo__processFirstUnlockNotification__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICSecurityInfoFirstUnlockNotification"), *(_QWORD *)(a1 + 32));

}

void __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke(uint64_t a1, int token)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(token, &state64);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = state64;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "kMobileKeyBagFirstUnlockNotificationID state changed to %llu", buf, 0xCu);
  }

  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_9;
    v6[3] = &unk_1E43913D8;
    v6[4] = v4;
    dispatch_barrier_async(v5, v6);
  }
}

uint64_t __71__ICSecurityInfo__loadContentProtectionEnabled_isDeviceClassCUnlocked___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "Class C unlocked!", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_processFirstUnlockNotification");
}

void __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_loadContentProtectionEnabled:isDeviceClassCUnlocked:", 1, 1);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 11) && !*(_BYTE *)(v2 + 9))
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "Device locked, waiting for first unlock.", buf, 2u);
    }

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v4 = (void *)MEMORY[0x1A1AFA8D0](*(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "addObject:", v4);
  }
  else
  {
    v3 = *(NSObject **)(v2 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke_7;
    block[3] = &unk_1E4390D18;
    v8 = *(id *)(a1 + 40);
    dispatch_async(v3, block);
    v4 = v8;
  }

}

uint64_t __47__ICSecurityInfo_performBlockAfterFirstUnlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
