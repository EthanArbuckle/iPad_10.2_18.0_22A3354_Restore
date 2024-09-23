@implementation VUIMPHomeShareMediaLibraryManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIMPHomeShareMediaLibraryManager)initWithManager:(id)a3
{
  id v4;
  VUIMPHomeShareMediaLibraryManager *v5;
  VUIMPHomeShareMediaLibraryManager *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *mutableHomeShareMediaLibraries;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIMPHomeShareMediaLibraryManager;
  v5 = -[VUIMPHomeShareMediaLibraryManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_manager, v4);
    -[VUIMPHomeShareMediaLibraryManager _homeShareMediaLibraries](v6, "_homeShareMediaLibraries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    mutableHomeShareMediaLibraries = v6->_mutableHomeShareMediaLibraries;
    v6->_mutableHomeShareMediaLibraries = (NSMutableArray *)v8;

    v10 = dispatch_queue_create("com.apple.videosui.VUIMPHomeShareMediaLibraryManager.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v6->_serialProcessingDispatchQueue;
    v6->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__handleAvailableMediaLibrariesDidChange_, *MEMORY[0x1E0CC1FF0], 0);

  }
  return v6;
}

- (id)_homeShareMediaLibraries
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VUIMPHomeShareMediaLibrary *v10;
  void *v11;
  VUIMPHomeShareMediaLibrary *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "_sharedMPMediaLibraries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [VUIMPHomeShareMediaLibrary alloc];
        -[VUIMPHomeShareMediaLibraryManager manager](self, "manager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[VUIMPMediaLibrary initWithMPMediaLibrary:type:manager:](v10, "initWithMPMediaLibrary:type:manager:", v9, 1, v11);

        objc_msgSend(v3, "addObject:", v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)_sharedMPMediaLibraries
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CC2408], "sharedMediaLibraries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("name"), 1);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)homeShareMediaLibraries
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__22;
  v11 = __Block_byref_object_dispose__22;
  v12 = 0;
  -[VUIMPHomeShareMediaLibraryManager serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__VUIMPHomeShareMediaLibraryManager_homeShareMediaLibraries__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

void __60__VUIMPHomeShareMediaLibraryManager_homeShareMediaLibraries__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mutableHomeShareMediaLibraries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableArray)mutableHomeShareMediaLibraries
{
  return self->_mutableHomeShareMediaLibraries;
}

- (void)beginDiscoveringMediaLibraries
{
  objc_msgSend(MEMORY[0x1E0CC2408], "beginDiscoveringMediaLibraries");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIMPHomeShareMediaLibraryManager;
  -[VUIMPHomeShareMediaLibraryManager dealloc](&v4, sel_dealloc);
}

- (void)endDiscoveringMediaLibraries
{
  objc_msgSend(MEMORY[0x1E0CC2408], "endDiscoveringMediaLibraries");
}

- (void)_handleAvailableMediaLibrariesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIMPHomeShareMediaLibraryManager serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__VUIMPHomeShareMediaLibraryManager__handleAvailableMediaLibrariesDidChange___block_invoke;
  v6[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __77__VUIMPHomeShareMediaLibraryManager__handleAvailableMediaLibrariesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend((id)objc_opt_class(), "_sharedMPMediaLibraries");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateMediaLibrariesWithSharedMPMediaLibraries:", v2);

    WeakRetained = v3;
  }

}

- (void)_updateMediaLibrariesWithSharedMPMediaLibraries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIMPHomeShareMediaLibraryManager mutableHomeShareMediaLibraries](self, "mutableHomeShareMediaLibraries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPHomeShareMediaLibraryManager _homeShareMediaLibraries](self, "_homeShareMediaLibraries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIMPHomeShareMediaLibraryManager: Shared MP media libraries did change: %@. latestHomeShareMediaLibraries: %@, Current Libraries: %@", (uint8_t *)&v12, 0x20u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0DC6998]);
  objc_msgSend(v8, "changeSetFromObjects:toObjects:identifierBlock:isEqualBlock:", v5, v6, &__block_literal_global_109, &__block_literal_global_15_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_applyChangeSet:destinationObjects:", v9, v6);
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "VUIMPHomeShareMediaLibraryManager: Updated home share media libraries : %@ using change set: %@", (uint8_t *)&v12, 0x16u);
  }

  v11 = (void *)objc_msgSend(v5, "copy");
  -[VUIMPHomeShareMediaLibraryManager _notifyDelegateHomeShareMediaLibrariesDidUpdate:withChangeSet:](self, "_notifyDelegateHomeShareMediaLibrariesDidUpdate:withChangeSet:", v11, v9);

}

uint64_t __85__VUIMPHomeShareMediaLibraryManager__updateMediaLibrariesWithSharedMPMediaLibraries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __85__VUIMPHomeShareMediaLibraryManager__updateMediaLibrariesWithSharedMPMediaLibraries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

- (void)_notifyDelegateHomeShareMediaLibrariesDidUpdate:(id)a3 withChangeSet:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VUIMPHomeShareMediaLibraryManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeShareManager:mediaLibrariesDidUpdate:withChangeSet:", self, v7, v6);

}

- (VUIHomeShareMediaLibraryManagerDelegate)delegate
{
  return (VUIHomeShareMediaLibraryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VUIMediaLibraryManager)manager
{
  return (VUIMediaLibraryManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void)setMutableHomeShareMediaLibraries:(id)a3
{
  objc_storeStrong((id *)&self->_mutableHomeShareMediaLibraries, a3);
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_mutableHomeShareMediaLibraries, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
