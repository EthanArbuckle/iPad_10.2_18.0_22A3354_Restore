@implementation VUIMediaLibraryManager

void __40__VUIMediaLibraryManager_defaultManager__block_invoke()
{
  NSObject *v0;
  VUIMediaLibraryManager *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MediaLibraryManager.Init", ", buf, 2u);
  }

  v1 = objc_alloc_init(VUIMediaLibraryManager);
  v2 = (void *)defaultManager___defaultManager;
  defaultManager___defaultManager = (uint64_t)v1;

  VUISignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MediaLibraryManager.Init", ", v4, 2u);
  }

}

- (VUIMediaLibraryManager)init
{
  VUIMediaLibraryManager *v2;
  VUIMediaLibraryManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  NSObject *v6;
  VUISidebandMediaLibrary *v7;
  VUISidebandMediaLibrary *sidebandMediaLibrary;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  VUIDeviceMediaLibrary *deviceMediaLibrary;
  NSObject *v13;
  NSObject *v14;
  VUIAggregateMediaLibrary *v15;
  VUIAggregateMediaLibrary *aggregateMediaLibrary;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  VUIHomeShareMediaLibraryManager *homeShareManager;
  NSObject *v21;
  uint8_t v23[16];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VUIMediaLibraryManager;
  v2 = -[VUIMediaLibraryManager init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_completionDispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = dispatch_queue_create("com.apple.videosui.VUIMediaLibraryManager.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v3->_serialProcessingDispatchQueue;
    v3->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v4;

    VUISignpostLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SidebandMediaLibrary.Init", ", v23, 2u);
    }

    v7 = -[VUISidebandMediaLibrary initWithManager:]([VUISidebandMediaLibrary alloc], "initWithManager:", v3);
    sidebandMediaLibrary = v3->_sidebandMediaLibrary;
    v3->_sidebandMediaLibrary = v7;

    VUISignpostLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SidebandMediaLibrary.Init", ", v23, 2u);
    }

    VUISignpostLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.Init", ", v23, 2u);
    }

    -[VUIMediaLibraryManager _deviceMediaLibrary](v3, "_deviceMediaLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    deviceMediaLibrary = v3->_deviceMediaLibrary;
    v3->_deviceMediaLibrary = (VUIDeviceMediaLibrary *)v11;

    VUISignpostLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.Init", ", v23, 2u);
    }

    VUISignpostLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AggregateMediaLibrary.Init", ", v23, 2u);
    }

    v15 = -[VUIAggregateMediaLibrary initWithManager:deviceMediaLibrary:sidebandMediaLibrary:]([VUIAggregateMediaLibrary alloc], "initWithManager:deviceMediaLibrary:sidebandMediaLibrary:", v3, v3->_deviceMediaLibrary, v3->_sidebandMediaLibrary);
    aggregateMediaLibrary = v3->_aggregateMediaLibrary;
    v3->_aggregateMediaLibrary = v15;

    VUISignpostLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AggregateMediaLibrary.Init", ", v23, 2u);
    }

    VUISignpostLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HomeShareManager.Init", ", v23, 2u);
    }

    -[VUIMediaLibraryManager _homeShareMediaLibraryManager](v3, "_homeShareMediaLibraryManager");
    v19 = objc_claimAutoreleasedReturnValue();
    homeShareManager = v3->_homeShareManager;
    v3->_homeShareManager = (VUIHomeShareMediaLibraryManager *)v19;

    VUISignpostLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D96EE000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HomeShareManager.Init", ", v23, 2u);
    }

    -[VUIHomeShareMediaLibraryManager setDelegate:](v3->_homeShareManager, "setDelegate:", v3);
  }
  return v3;
}

- (id)_homeShareMediaLibraryManager
{
  void *v3;
  VUIMPHomeShareMediaLibraryManager *v4;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("UseTVHomeSharing"), CFSTR("com.apple.VideosUI"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "BOOLValue");
  v4 = -[VUIMPHomeShareMediaLibraryManager initWithManager:]([VUIMPHomeShareMediaLibraryManager alloc], "initWithManager:", self);

  return v4;
}

- (id)_deviceMediaLibrary
{
  void *v3;
  void *v4;
  VUIPlistMediaLibrary *v5;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("PlistDatabasePath"), CFSTR("com.apple.VideosUI"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VUIPlistMediaLibrary initWithURL:manager:]([VUIPlistMediaLibrary alloc], "initWithURL:manager:", v4, self);

  }
  else
  {
    v5 = -[VUIMPDeviceMediaLibrary initWithManager:]([VUIMPDeviceMediaLibrary alloc], "initWithManager:", self);
  }

  return v5;
}

- (NSArray)homeShareMediaLibraries
{
  void *v2;
  void *v3;

  -[VUIMediaLibraryManager homeShareManager](self, "homeShareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeShareMediaLibraries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (VUIHomeShareMediaLibraryManager)homeShareManager
{
  return self->_homeShareManager;
}

- (VUIAggregateMediaLibrary)aggregateMediaLibrary
{
  return self->_aggregateMediaLibrary;
}

uint64_t __55__VUIMediaLibraryManager__enqueueCompletionQueueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__VUIMediaLibraryManager_completionDispatchQueue__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_enqueueCompletionQueueBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[VUIMediaLibraryManager completionDispatchQueue](self, "completionDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VUIMediaLibraryManager__enqueueCompletionQueueBlock___block_invoke;
  block[3] = &unk_1E9F98E68;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (OS_dispatch_queue)completionDispatchQueue
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
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[VUIMediaLibraryManager serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__VUIMediaLibraryManager_completionDispatchQueue__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (OS_dispatch_queue *)v4;
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

+ (id)defaultManager
{
  if (defaultManager___once != -1)
    dispatch_once(&defaultManager___once, &__block_literal_global_69);
  return (id)defaultManager___defaultManager;
}

- (VUIDeviceMediaLibrary)deviceMediaLibrary
{
  return self->_deviceMediaLibrary;
}

- (VUISidebandMediaLibrary)sidebandMediaLibrary
{
  return self->_sidebandMediaLibrary;
}

- (void)setActiveMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_activeMediaLibrary, a3);
}

- (void)beginDiscoveringHomeShareMediaLibraries
{
  id v2;

  -[VUIMediaLibraryManager homeShareManager](self, "homeShareManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginDiscoveringMediaLibraries");

}

+ (void)setDeleteAllVideosAndKeysOnInitializationForAppRemoval:(BOOL)a3
{
  +[VUISidebandMediaLibrary setDeleteAllVideosAndKeysOnInitializationForAppRemoval:](VUISidebandMediaLibrary, "setDeleteAllVideosAndKeysOnInitializationForAppRemoval:", a3);
}

- (void)setCompletionDispatchQueue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[VUIMediaLibraryManager serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VUIMediaLibraryManager_setCompletionDispatchQueue___block_invoke;
  block[3] = &unk_1E9F98FD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __53__VUIMediaLibraryManager_setCompletionDispatchQueue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)endDiscoveringHomeShareMediaLibraries
{
  id v2;

  -[VUIMediaLibraryManager homeShareManager](self, "homeShareManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDiscoveringMediaLibraries");

}

- (id)mediaLibraryForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  -[VUIMediaLibraryManager serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VUIMediaLibraryManager_mediaLibraryForIdentifier___block_invoke;
  block[3] = &unk_1E9F99E00;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__VUIMediaLibraryManager_mediaLibraryForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_mediaLibraryForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)homeShareManager:(id)a3 mediaLibrariesDidUpdate:(id)a4 withChangeSet:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__VUIMediaLibraryManager_homeShareManager_mediaLibrariesDidUpdate_withChangeSet___block_invoke;
  v11[3] = &unk_1E9F9E3A8;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[VUIMediaLibraryManager _enqueueStrongSelfCompletionQueueBlock:](self, "_enqueueStrongSelfCompletionQueueBlock:", v11);

}

void __81__VUIMediaLibraryManager_homeShareManager_mediaLibrariesDidUpdate_withChangeSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "willChangeValueForKey:", CFSTR("homeShareMediaLibraries"));
  objc_msgSend(v3, "didChangeValueForKey:", CFSTR("homeShareMediaLibraries"));
  objc_msgSend(v3, "_postHomeShareMediaLibrariesDidChangeNotificationWithMediaLibraries:andChangeSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_enqueueStrongSelfCompletionQueueBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__VUIMediaLibraryManager__enqueueStrongSelfCompletionQueueBlock___block_invoke;
  v6[3] = &unk_1E9F9A060;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[VUIMediaLibraryManager _enqueueCompletionQueueBlock:](self, "_enqueueCompletionQueueBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __65__VUIMediaLibraryManager__enqueueStrongSelfCompletionQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (id)_mediaLibraryForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("identifier"));
  -[VUIMediaLibraryManager deviceMediaLibrary](self, "deviceMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryManager homeShareMediaLibraries](self, "homeShareMediaLibraries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addObject:", v5);
  -[VUIMediaLibraryManager sidebandMediaLibrary](self, "sidebandMediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v4);

        if (v15)
        {
          v10 = v13;
          goto LABEL_15;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  return v10;
}

- (void)_postHomeShareMediaLibrariesDidChangeNotificationWithMediaLibraries:(id)a3 andChangeSet:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v10 = objc_alloc_init(v6);
  objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyMediaLibraries"));

  objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeUserInfoKeyChangeSet"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("VUIMediaLibraryManagerHomeSharesDidChangeNotification"), self, v10);

}

- (VUIMediaLibrary)activeMediaLibrary
{
  return self->_activeMediaLibrary;
}

- (void)setDeviceMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMediaLibrary, a3);
}

- (void)setSidebandMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_sidebandMediaLibrary, a3);
}

- (void)setAggregateMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateMediaLibrary, a3);
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (void)setHomeShareManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeShareManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeShareManager, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_aggregateMediaLibrary, 0);
  objc_storeStrong((id *)&self->_sidebandMediaLibrary, 0);
  objc_storeStrong((id *)&self->_deviceMediaLibrary, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeMediaLibrary, 0);
}

@end
