@implementation PXPhotoLibraryChangeDistributor

uint64_t __58__PXPhotoLibraryChangeDistributor_registerChangeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__PXPhotoLibraryChangeDistributor_unregisterChangeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __58__PXPhotoLibraryChangeDistributor_registerChangeObserver___block_invoke;
    block[3] = &unk_1E5148D08;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __60__PXPhotoLibraryChangeDistributor_unregisterChangeObserver___block_invoke;
    block[3] = &unk_1E5148D08;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (PXPhotoLibraryChangeDistributor)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPhotoLibraryChangeDistributor *v5;
  uint64_t v6;
  NSHashTable *internalObservers;
  uint64_t v8;
  NSHashTable *observers;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *changeDeliverySemaphore;
  dispatch_group_t v14;
  OS_dispatch_group *changePausingGroup;
  uint64_t v16;
  NSMutableSet *changePausingTokens;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  PXPhotoLibraryChangeDistributor *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXPhotoLibraryChangeDistributor;
  v5 = -[PXPhotoLibraryChangeDistributor init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    internalObservers = v5->_internalObservers;
    v5->_internalObservers = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    v10 = dispatch_queue_create("com.apple.photos.changeDistributor", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    v12 = dispatch_semaphore_create(0);
    changeDeliverySemaphore = v5->_changeDeliverySemaphore;
    v5->_changeDeliverySemaphore = (OS_dispatch_semaphore *)v12;

    v14 = dispatch_group_create();
    changePausingGroup = v5->_changePausingGroup;
    v5->_changePausingGroup = (OS_dispatch_group *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    changePausingTokens = v5->_changePausingTokens;
    v5->_changePausingTokens = (NSMutableSet *)v16;

    dispatch_get_global_queue(25, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__PXPhotoLibraryChangeDistributor_initWithPhotoLibrary___block_invoke;
    v20[3] = &unk_1E5148D08;
    v21 = v4;
    v22 = v5;
    dispatch_async(v18, v20);

  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  objc_msgSend(WeakRetained, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPhotoLibraryChangeDistributor;
  -[PXPhotoLibraryChangeDistributor dealloc](&v4, sel_dealloc);
}

- (BOOL)areChangesPaused
{
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 81, CFSTR("must be on main thread"));

  }
  return -[NSMutableSet count](self->_changePausingTokens, "count") != 0;
}

- (void)registerInternalChangeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __66__PXPhotoLibraryChangeDistributor_registerInternalChangeObserver___block_invoke;
    block[3] = &unk_1E5148D08;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)unregisterInternalChangeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __68__PXPhotoLibraryChangeDistributor_unregisterInternalChangeObserver___block_invoke;
    block[3] = &unk_1E5148D08;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)photoLibraryDidChange:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  NSObject *queue;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[7];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  _QWORD v53[3];
  _QWORD v54[3];
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PXPhotosDataSourceSettings sharedInstance](PXPhotosDataSourceSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delayChanges");
  v6 = v5;

  if (v6 > 0.0)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v6);
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__177582;
  v50 = __Block_byref_object_dispose__177583;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__177582;
  v44 = __Block_byref_object_dispose__177583;
  v45 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXPhotoLibraryChangeDistributor_photoLibraryDidChange___block_invoke;
  block[3] = &unk_1E51401A8;
  block[4] = self;
  block[5] = &v46;
  block[6] = &v40;
  dispatch_sync(queue, block);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = (id)v47[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v58, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v11++), "photoLibraryWillChange:", v3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v58, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = (id)v41[5];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v57, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1A85CE17C]();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v17, "prepareForPhotoLibraryChange:", v3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v12, "setObject:forKey:", v19, v17);

        }
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v57, 16);
    }
    while (v14);
  }

  PLUIGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentMode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v22;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "Change Distribution: photoLibraryDidChange calling distributeChangeOnMainQueue (runLoopMode: %{public}@)", buf, 0xCu);

  }
  v23 = v41[5];
  v53[0] = CFSTR("observers");
  v53[1] = CFSTR("changeInstance");
  v54[0] = v23;
  v54[1] = v3;
  v53[2] = CFSTR("preparedInfoByObserver");
  v54[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x1E0C99748];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoLibraryChangeDistributor performSelectorOnMainThread:withObject:waitUntilDone:modes:](self, "performSelectorOnMainThread:withObject:waitUntilDone:modes:", sel_distributeChangeOnMainQueue_, v24, 1, v25);

  PLUIGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentMode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v28;
    _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_INFO, "Change Distribution: photoLibraryDidChange returned from distributeChangeOnMainQueue (runLoopMode: %{public}@)", buf, 0xCu);

  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_changeDeliverySemaphore, 0xFFFFFFFFFFFFFFFFLL);
  PLUIGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_INFO, "Change Distribution: photoLibraryDidChange delivered changes", buf, 2u);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

}

- (void)distributeChangeOnMainQueue:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  NSObject *changePausingGroup;
  void *v11;
  _QWORD block[4];
  void (**v13)(_QWORD);
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v16;
  PXPhotoLibraryChangeDistributor *v17;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke;
  aBlock[3] = &unk_1E5148D08;
  v7 = v5;
  v16 = v7;
  v17 = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 183, CFSTR("must be on main thread"));

  }
  if (-[NSMutableSet count](self->_changePausingTokens, "count"))
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "Change Distribution: Waiting for change delivery to be unpaused.", buf, 2u);
    }

    changePausingGroup = self->_changePausingGroup;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke_169;
    block[3] = &unk_1E5148A40;
    v13 = v8;
    dispatch_group_notify(changePausingGroup, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v8[2](v8);
  }

}

- (id)beginPausingChangesWithTimeout:(double)a3 identifier:(id)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 199, CFSTR("must be on main thread"));

  }
  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 200, CFSTR("timeout must be >= 0"));

  }
  objc_msgSend(v7, "length");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotoLibraryChangeDistributor areChangesPaused](self, "areChangesPaused");
  -[NSMutableSet addObject:](self->_changePausingTokens, "addObject:", v8);
  dispatch_group_enter((dispatch_group_t)self->_changePausingGroup);
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v19 = a3;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "Change Distribution: beginPausingChangesWithTimeout: %lf, identifier: %{public}@, token: %{public}@", buf, 0x20u);
  }

  if (v9 != -[PXPhotoLibraryChangeDistributor areChangesPaused](self, "areChangesPaused"))
    -[PXPhotoLibraryChangeDistributor _notifyPausedStateChange](self, "_notifyPausedStateChange");
  if (a3 > 0.0)
  {
    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PXPhotoLibraryChangeDistributor_beginPausingChangesWithTimeout_identifier___block_invoke;
    block[3] = &unk_1E51457C8;
    block[4] = self;
    v16 = v8;
    v17 = v7;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);

  }
  return v8;
}

- (void)endPausingChanges:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 226, CFSTR("must be on main thread"));

    if (!v5)
      goto LABEL_10;
  }
  if ((-[NSMutableSet containsObject:](self->_changePausingTokens, "containsObject:", v5) & 1) != 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_INFO, "Change Distribution: endPausingChanges for token: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = -[PXPhotoLibraryChangeDistributor areChangesPaused](self, "areChangesPaused");
    -[NSMutableSet removeObject:](self->_changePausingTokens, "removeObject:", v5);
    if (v7 != -[PXPhotoLibraryChangeDistributor areChangesPaused](self, "areChangesPaused"))
      -[PXPhotoLibraryChangeDistributor _notifyPausedStateChange](self, "_notifyPausedStateChange");
    dispatch_group_leave((dispatch_group_t)self->_changePausingGroup);
    goto LABEL_13;
  }
LABEL_10:
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Change Distribution: Ignoring endPausingChanges for invalid token: %{public}@", (uint8_t *)&v10, 0xCu);
  }

LABEL_13:
}

- (void)_notifyPausedStateChange
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint8_t v20[128];
  uint8_t buf[8];
  __int128 v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 245, CFSTR("must be on main thread"));

  }
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[PXPhotoLibraryChangeDistributor areChangesPaused](self, "areChangesPaused");
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v22) = 2114;
    *(_QWORD *)((char *)&v22 + 2) = v7;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "Change Distribution: Notifying paused state changed to: %d, runLoopMode = %{public}@", buf, 0x12u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&v22 = buf;
  *((_QWORD *)&v22 + 1) = 0x3032000000;
  v23 = __Block_byref_object_copy__177582;
  v24 = __Block_byref_object_dispose__177583;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PXPhotoLibraryChangeDistributor__notifyPausedStateChange__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(queue, block);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = *(id *)(v22 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "photoLibraryChangesPausedDidChange", (_QWORD)v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changePausingTokens, 0);
  objc_storeStrong((id *)&self->_changePausingGroup, 0);
  objc_storeStrong((id *)&self->_changeDeliverySemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_internalObservers, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
}

void __59__PXPhotoLibraryChangeDistributor__notifyPausedStateChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __77__PXPhotoLibraryChangeDistributor_beginPausingChangesWithTimeout_identifier___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      v6 = 138543618;
      v7 = v4;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Change Distribution: Pause timed out for identifier: %{public}@, token: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "endPausingChanges:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("observers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("changeInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("preparedInfoByObserver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "photoLibraryDidChangeOnMainQueue:withPreparedInfo:", v3, v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "photoLibraryDidChangeOnMainQueue:", v3);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v12 + 40) + 40));
}

uint64_t __63__PXPhotoLibraryChangeDistributor_distributeChangeOnMainQueue___block_invoke_169(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_INFO, "Change Distribution: Change delivery resumed.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PXPhotoLibraryChangeDistributor_photoLibraryDidChange___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 16), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 24), "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __68__PXPhotoLibraryChangeDistributor_unregisterInternalChangeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__PXPhotoLibraryChangeDistributor_registerInternalChangeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__PXPhotoLibraryChangeDistributor_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerChangeObserver:", *(_QWORD *)(a1 + 40));
}

@end
