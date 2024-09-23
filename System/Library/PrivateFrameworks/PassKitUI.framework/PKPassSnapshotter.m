@implementation PKPassSnapshotter

+ (PKPassSnapshotter)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PKPassSnapshotter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_683 != -1)
    dispatch_once(&_MergedGlobals_683, block);
  return (PKPassSnapshotter *)(id)qword_1ED06C7B0;
}

void __35__PKPassSnapshotter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED06C7B0;
  qword_1ED06C7B0 = (uint64_t)v1;

}

- (PKPassSnapshotter)init
{
  PKPassSnapshotter *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v7;
  OS_dispatch_semaphore *snapshotSem;
  NSMutableArray *v9;
  NSMutableArray *currentSnapshotKeys;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPassSnapshotter;
  v2 = -[PKPassSnapshotter init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.passkit.snapshotter", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_semaphore_create(1);
    snapshotSem = v2->_snapshotSem;
    v2->_snapshotSem = (OS_dispatch_semaphore *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentSnapshotKeys = v2->_currentSnapshotKeys;
    v2->_currentSnapshotKeys = v9;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v2->_scale = v13;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  PKPassSnapshotter *v13;
  objc_super v14;
  _QWORD block[5];
  OS_dispatch_queue *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Pass snapshotter deallocating", buf, 2u);
  }

  v4 = self->_queue;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self;
  v5 = (void *)-[NSMutableArray copy](self->_currentSnapshotKeys, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        _SnapshotCacheQueue();
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __28__PKPassSnapshotter_dealloc__block_invoke;
        block[3] = &unk_1E3E61388;
        block[4] = v11;
        v16 = v4;
        dispatch_sync(v12, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

  v14.receiver = v13;
  v14.super_class = (Class)PKPassSnapshotter;
  -[PKPassSnapshotter dealloc](&v14, sel_dealloc);
}

void __28__PKPassSnapshotter_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _SnapshotCompletionsByCacheKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Calling completion blocks without an image for %{public}@", buf, 0xCu);
    }

    _SnapshotCompletionsByCacheKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    if (objc_msgSend(v4, "count"))
    {
      v8 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__PKPassSnapshotter_dealloc__block_invoke_31;
      block[3] = &unk_1E3E612E8;
      v10 = v4;
      dispatch_async(v8, block);

    }
  }

}

void __28__PKPassSnapshotter_dealloc__block_invoke_31(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)passLibrary
{
  PKPassLibrary *passLibrary;
  PKPassLibrary *v4;
  PKPassLibrary *v5;

  passLibrary = self->_passLibrary;
  if (!passLibrary)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v4 = (PKPassLibrary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_passLibrary;
    self->_passLibrary = v4;

    passLibrary = self->_passLibrary;
  }
  return passLibrary;
}

- (void)snapshotWithPass:(id)a3 completion:(id)a4
{
  -[PKPassSnapshotter _snapshotWithPass:size:suppressedContent:withCache:completion:](self, "_snapshotWithPass:size:suppressedContent:withCache:completion:", a3, 1911, 1, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)snapshotWithPass:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  -[PKPassSnapshotter _snapshotWithPass:size:suppressedContent:withCache:completion:](self, "_snapshotWithPass:size:suppressedContent:withCache:completion:", a3, 1911, 1, a5, a4.width, a4.height);
}

- (void)snapshotWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 completion:(id)a6
{
  -[PKPassSnapshotter _snapshotWithPass:size:suppressedContent:withCache:completion:](self, "_snapshotWithPass:size:suppressedContent:withCache:completion:", a3, a5, 1, a6, a4.width, a4.height);
}

- (void)snapshotWithUniqueID:(id)a3 completion:(id)a4
{
  -[PKPassSnapshotter snapshotWithUniqueID:size:completion:](self, "snapshotWithUniqueID:size:completion:", a3, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)snapshotWithUniqueID:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  -[PKPassSnapshotter snapshotWithUniqueID:size:suppressedContent:completion:](self, "snapshotWithUniqueID:size:suppressedContent:completion:", a3, 1911, a5, a4.width, a4.height);
}

- (void)snapshotWithUniqueID:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  unint64_t v21;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PKPassSnapshotter_snapshotWithUniqueID_size_suppressedContent_completion___block_invoke;
  v16[3] = &unk_1E3E73EE0;
  v16[4] = self;
  v17 = v11;
  v19 = width;
  v20 = height;
  v21 = a5;
  v18 = v12;
  v14 = v12;
  v15 = v11;
  dispatch_async(queue, v16);

}

void __76__PKPassSnapshotter_snapshotWithUniqueID_size_suppressedContent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "passLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passWithUniqueID:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_snapshotWithPass:size:suppressedContent:withCache:completion:", v3, *(_QWORD *)(a1 + 72), 1, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)snapshotWithUniqueID:(id)a3 manifestHash:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *queue;
  _QWORD v16[5];
  id v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  height = a5.height;
  width = a5.width;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  _CacheKey(v11, a4, 1911, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v13;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Snapshot request for %{public}@", buf, 0xCu);
  }

  if (!-[PKPassSnapshotter _cachedImageWithKey:completion:](self, "_cachedImageWithKey:completion:", v13, v12))
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__PKPassSnapshotter_snapshotWithUniqueID_manifestHash_size_completion___block_invoke;
    v16[3] = &unk_1E3E73EE0;
    v16[4] = self;
    v17 = v11;
    v19 = width;
    v20 = height;
    v21 = 1911;
    v18 = v12;
    dispatch_async(queue, v16);

  }
}

void __71__PKPassSnapshotter_snapshotWithUniqueID_manifestHash_size_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "passLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passWithUniqueID:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_snapshotWithPass:size:suppressedContent:withCache:completion:", v3, *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

+ (void)purgeCache
{
  NSObject *v2;

  _SnapshotCacheQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_166);

}

void __31__PKPassSnapshotter_purgeCache__block_invoke()
{
  id v0;

  _SnapshotCache();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

}

+ (void)purgeCacheOfPassSnapshotsWithUinqueID:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  _SnapshotCacheQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke;
  block[3] = &unk_1E3E612E8;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  _SnapshotCache();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke_2;
  v6[3] = &unk_1E3E73F28;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "keysOfEntriesPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _SnapshotCache();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsForKeys:", v5);

}

uint64_t __59__PKPassSnapshotter_purgeCacheOfPassSnapshotsWithUinqueID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
}

- (void)_snapshotWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 withCache:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  PKPassSnapshotter *v20;
  id v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  unint64_t v25;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  objc_msgSend(v13, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "manifestHash");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _CacheKey(v15, v16, a5, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !-[PKPassSnapshotter _cachedImageWithKey:completion:](self, "_cachedImageWithKey:completion:", v17, v14))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke;
    v18[3] = &unk_1E3E73F50;
    v19 = v13;
    v20 = self;
    v21 = v17;
    v23 = width;
    v24 = height;
    v25 = a5;
    v22 = v14;
    objc_msgSend(v19, "loadContentAsyncWithCompletion:", v18);

  }
}

void __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_2;
  v3[3] = &unk_1E3E73F50;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "loadImageSetAsync:preheat:withCompletion:", 0, 1, v3);

}

void __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  PKLogFacilityTypeGetObject();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKTimeProfileBegin();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_3;
  block[3] = &unk_1E3E73F50;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_4;
  v6[3] = &unk_1E3E65930;
  v6[4] = v2;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_prepareSnapshotViewWithPass:size:suppressedContent:cacheKey:completion:", v3, v4, v5, v6, *(double *)(a1 + 64), *(double *)(a1 + 72));

}

uint64_t __83__PKPassSnapshotter__snapshotWithPass_size_suppressedContent_withCache_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_prepareSnapshotViewWithPass:(id)a3 size:(CGSize)a4 suppressedContent:(unint64_t)a5 cacheKey:(id)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  id v15;
  PKPassView *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  PKPassView *v21;
  _QWORD v22[5];
  PKPassView *v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;

  height = a4.height;
  width = a4.width;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  v16 = -[PKPassView initWithPass:content:]([PKPassView alloc], "initWithPass:content:", v15, 5);

  -[PKPassView setSuppressedContent:](v16, "setSuppressedContent:", a5);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[PKPassView setOpaque:](v16, "setOpaque:", 0);
  -[PKPassView setModallyPresented:](v16, "setModallyPresented:", 1);
  -[PKPassView layoutIfNeeded](v16, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __93__PKPassSnapshotter__prepareSnapshotViewWithPass_size_suppressedContent_cacheKey_completion___block_invoke;
  v22[3] = &unk_1E3E73F78;
  v22[4] = self;
  v23 = v16;
  v26 = width;
  v27 = height;
  v24 = v13;
  v25 = v14;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  objc_msgSend(v18, "_performBlockAfterCATransactionCommits:", v22);

}

uint64_t __93__PKPassSnapshotter__prepareSnapshotViewWithPass_size_suppressedContent_cacheKey_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSnapshot:size:cacheKey:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_performSnapshot:(id)a3 size:(CGSize)a4 cacheKey:(id)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  CGImageRef v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  PKPassSnapshotter *v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  CGImageRef v28;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AE621C]();
  objc_msgSend(v11, "snapshotOfPassView");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = CGImageRetain((CGImageRef)objc_msgSend(v15, "CGImage"));
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_snapshotSem);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPassSnapshotter__performSnapshot_size_cacheKey_completion___block_invoke;
  block[3] = &unk_1E3E73F50;
  v26 = width;
  v27 = height;
  v28 = v16;
  v22 = v15;
  v23 = self;
  v18 = v12;
  v24 = v18;
  v19 = v13;
  v25 = v19;
  v20 = v15;
  dispatch_async(queue, block);

  objc_autoreleasePoolPop(v14);
}

void __63__PKPassSnapshotter__performSnapshot_size_cacheKey_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  CGImage *Image;
  CGImage *v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  CGFloat v14;
  CGFloat v15;
  float v16;
  size_t v17;
  float v18;
  size_t v19;
  size_t AlignedBytesPerRow;
  uint32_t BitmapInfo;
  CGColorSpace *ColorSpace;
  CGContext *v23;
  id v24;
  void *v25;
  PKPassSnapshotCacheItem *v26;
  PKPassSnapshotCacheItem *v27;
  void *v28;
  id v29;
  uint64_t v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*(double *)(a1 + 64) == *MEMORY[0x1E0C9D820] && *(double *)(a1 + 72) == v3)
  {
    Image = CGImageRetain(*(CGImageRef *)(a1 + 80));
    v24 = *(id *)(a1 + 32);
  }
  else
  {
    Image = 0;
    v6 = *(CGImage **)(a1 + 80);
    if (v6)
    {
      v7 = *(double *)(*(_QWORD *)(a1 + 40) + 32);
      if (v7 > 0.0)
      {
        v8 = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 80)) / v7;
        v9 = (double)CGImageGetHeight(v6) / v7;
        if (v8 == v2 && v9 == v3)
        {
          Image = 0;
        }
        else
        {
          PKSizeScaleAspectFit();
          if (v8 == v11 && v9 == v12)
          {
            Image = CGImageRetain(v6);
          }
          else
          {
            v14 = v11;
            v15 = v12;
            v16 = v7 * v11;
            v17 = vcvtps_u32_f32(v16);
            v18 = v7 * v12;
            v19 = vcvtps_u32_f32(v18);
            AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
            BitmapInfo = CGImageGetBitmapInfo(v6);
            ColorSpace = CGImageGetColorSpace(v6);
            v23 = CGBitmapContextCreate(0, v17, v19, 8uLL, AlignedBytesPerRow, ColorSpace, BitmapInfo);
            v32.size.width = (double)v17;
            v32.size.height = (double)v19;
            v32.origin.x = 0.0;
            v32.origin.y = 0.0;
            CGContextClearRect(v23, v32);
            CGContextScaleCTM(v23, v7, v7);
            CGContextGetCTM(&v31, v23);
            CGContextSetBaseCTM();
            v33.origin.x = 0.0;
            v33.origin.y = 0.0;
            v33.size.width = v14;
            v33.size.height = v15;
            CGContextDrawImage(v23, v33, v6);
            Image = CGBitmapContextCreateImage(v23);
            CGContextRelease(v23);
          }
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, 0, *(double *)(*(_QWORD *)(a1 + 40) + 32));
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  if (Image)
  {
    v26 = [PKPassSnapshotCacheItem alloc];
    objc_msgSend(v25, "scale");
    v27 = -[PKPassSnapshotCacheItem initWithCGImage:scale:](v26, "initWithCGImage:scale:", Image);
    objc_msgSend(*(id *)(a1 + 40), "_cacheItem:withKey:", v27, *(_QWORD *)(a1 + 48));

  }
  CGImageRelease(Image);
  CGImageRelease(*(CGImageRef *)(a1 + 80));
  PKLogFacilityTypeGetObject();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)PKTimeProfileEnd();

  v30 = *(_QWORD *)(a1 + 56);
  if (v30)
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v25);

}

- (void)_cacheItem:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  PKPassSnapshotter *v14;

  v6 = a3;
  v7 = a4;
  _SnapshotCacheQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PKPassSnapshotter__cacheItem_withKey___block_invoke;
  block[3] = &unk_1E3E61400;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __40__PKPassSnapshotter__cacheItem_withKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _SnapshotCache();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  _SnapshotCompletionsByCacheKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Calling completion blocks for %{public}@", buf, 0xCu);
    }

    _SnapshotCompletionsByCacheKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "UIImageFromCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __40__PKPassSnapshotter__cacheItem_withKey___block_invoke_41;
      v15 = &unk_1E3E61388;
      v16 = v5;
      v17 = v9;
      v11 = v9;
      dispatch_async(v10, &v12);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "removeObject:", *(_QWORD *)(a1 + 40), v12, v13, v14, v15);
  }

}

void __40__PKPassSnapshotter__cacheItem_withKey___block_invoke_41(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)_cachedImageWithKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  PKPassSnapshotter *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v8 = (void *)objc_msgSend(v7, "copy");

  _SnapshotCacheQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke;
  v13[3] = &unk_1E3E66170;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v17 = &v18;
  v10 = v8;
  v11 = v6;
  dispatch_sync(v9, v13);

  LOBYTE(v8) = *((_BYTE *)v19 + 24) == 0;
  _Block_object_dispose(&v18, 8);
  return (char)v8;
}

void __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _SnapshotCache();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Image in cache, calling completion for %{public}@", buf, 0xCu);
    }

    v6 = *(void **)(a1 + 48);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke_42;
    v13[3] = &unk_1E3E618A0;
    v15 = v6;
    v14 = v3;
    dispatch_async(v7, v13);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

  }
  else
  {
    _SnapshotCompletionsByCacheKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 32));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = _Block_copy(*(const void **)(a1 + 48));
      objc_msgSend(v9, "addObject:", v10);

      v11 = 0;
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      _SnapshotCompletionsByCacheKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v9, *(_QWORD *)(a1 + 32));

      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", *(_QWORD *)(a1 + 32));
      v11 = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;

  }
}

void __52__PKPassSnapshotter__cachedImageWithKey_completion___block_invoke_42(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "UIImageFromCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)runsInBackgroundProcess
{
  return self->_runsInBackgroundProcess;
}

- (void)setRunsInBackgroundProcess:(BOOL)a3
{
  self->_runsInBackgroundProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshotKeys, 0);
  objc_storeStrong((id *)&self->_snapshotSem, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
