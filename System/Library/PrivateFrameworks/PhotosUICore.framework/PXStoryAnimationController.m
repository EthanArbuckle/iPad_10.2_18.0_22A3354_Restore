@implementation PXStoryAnimationController

- (PXStoryAnimationController)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryAnimationController.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryAnimationController initWithObservableModel:]");

  abort();
}

- (PXStoryAnimationController)initWithModel:(id)a3
{
  id v4;
  PXStoryAnimationController *v5;
  PXStoryAnimationController *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *animationInfoByIdentifier;
  NSCountedSet *v9;
  NSCountedSet *checkOutCountsByIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryAnimationController;
  v5 = -[PXStoryController initWithObservableModel:](&v12, sel_initWithObservableModel_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_model, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animationInfoByIdentifier = v6->_animationInfoByIdentifier;
    v6->_animationInfoByIdentifier = v7;

    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    checkOutCountsByIdentifier = v6->_checkOutCountsByIdentifier;
    v6->_checkOutCountsByIdentifier = v9;

  }
  return v6;
}

- (void)configureUpdater:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryAnimationController;
  -[PXStoryController configureUpdater:](&v6, sel_configureUpdater_, v4);
  objc_msgSend(v4, "addUpdateSelector:", sel__updateAnimations);

}

- (void)enumerateAnimationsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PXStoryAnimationController_enumerateAnimationsUsingBlock___block_invoke;
  v7[3] = &unk_1E5145950;
  v8 = v4;
  v6 = v4;
  -[PXStoryAnimationController _enumerateAnimationInfosUsingBlock:](self, "_enumerateAnimationInfosUsingBlock:", v7);

}

- (void)_enumerateAnimationInfosUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7 = (id)-[NSMutableDictionary copy](self->_animationInfoByIdentifier, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PXStoryAnimationController__enumerateAnimationInfosUsingBlock___block_invoke;
  v8[3] = &unk_1E5145978;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (void)_handleAnimationInvalidation
{
  NSObject *v3;
  _QWORD v4[5];

  -[PXStoryController storyQueue](self, "storyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PXStoryAnimationController__handleAnimationInvalidation__block_invoke;
  v4[3] = &unk_1E51459A0;
  v4[4] = self;
  -[PXStoryController performChanges:](self, "performChanges:", v4);
}

- (void)addAnimation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 isUpdatingAnimations;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLStoryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    isUpdatingAnimations = self->_isUpdatingAnimations;
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 1024;
    v16 = isUpdatingAnimations;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[77239634] Add existing animation with identifier: %{public}@, updatingAnimations: %d", buf, 0x12u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__PXStoryAnimationController_addAnimation___block_invoke;
  v11[3] = &unk_1E51459C8;
  v12 = v4;
  v9 = v4;
  v10 = -[PXStoryAnimationController checkOutAnimationWithIdentifier:creationBlock:](self, "checkOutAnimationWithIdentifier:creationBlock:", v6, v11);

}

- (id)checkOutAnimationWithIdentifier:(id)a3 creationBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  _BOOL4 isUpdatingAnimations;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _PXStoryAnimationInfo *v17;
  uint64_t v18;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PXStoryController storyQueue](self, "storyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  PLStoryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    isUpdatingAnimations = self->_isUpdatingAnimations;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = isUpdatingAnimations;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[77239634] Check out animation with identifier: %{public}@, updatingAnimations: %d", buf, 0x12u);
  }

  -[NSMutableDictionary objectForKey:](self->_animationInfoByIdentifier, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "animation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "animation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v12;
  }
  else
  {
    v7[2](v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    memset(buf, 0, sizeof(buf));
    -[PXStoryAnimationController model](self, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "elapsedTime");
    else
      memset(buf, 0, sizeof(buf));

    v17 = [_PXStoryAnimationInfo alloc];
    v20 = *(_OWORD *)buf;
    v21 = *(_QWORD *)&buf[16];
    v18 = -[_PXStoryAnimationInfo initWithAnimation:startTime:](v17, "initWithAnimation:startTime:", v14, &v20);

    -[PXStoryAnimationController _configureAnimation:withAnimationInfo:](self, "_configureAnimation:withAnimationInfo:", v14, v18);
    -[PXStoryAnimationController signalChange:](self, "signalChange:", 1);
    objc_msgSend(v14, "registerChangeObserver:context:", self, AnimationObservationContext);
    -[NSMutableDictionary setObject:forKey:](self->_animationInfoByIdentifier, "setObject:forKey:", v18, v6);
    v11 = (void *)v18;
  }
  -[NSCountedSet addObject:](self->_checkOutCountsByIdentifier, "addObject:", v6);
  -[PXStoryAnimationController signalChange:](self, "signalChange:", 1);

  return v14;
}

- (void)checkInAnimation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 isUpdatingAnimations;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLStoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      isUpdatingAnimations = self->_isUpdatingAnimations;
      v11 = 138543618;
      v12 = v6;
      v13 = 1024;
      v14 = isUpdatingAnimations;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[77239634] Check in animation with identifier: %{public}@, updatingAnimations: %d", (uint8_t *)&v11, 0x12u);
    }

    -[NSCountedSet removeObject:](self->_checkOutCountsByIdentifier, "removeObject:", v6);
    if (!-[NSCountedSet countForObject:](self->_checkOutCountsByIdentifier, "countForObject:", v6))
    {
      -[NSMutableDictionary objectForKey:](self->_animationInfoByIdentifier, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "animation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performChanges:", &__block_literal_global_287114);

      -[NSMutableDictionary removeObjectForKey:](self->_animationInfoByIdentifier, "removeObjectForKey:", v6);
    }

  }
}

- (void)_configureAnimation:(id)a3 withAnimationInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PXStoryController storyQueue](self, "storyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[PXStoryAnimationController model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PXStoryAnimationController__configureAnimation_withAnimationInfo___block_invoke;
  v13[3] = &unk_1E5145A30;
  v14 = v9;
  v15 = v7;
  v16 = v6;
  v10 = v6;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v10, "performChanges:", v13);

}

- (void)_invalidateAnimations
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAnimations);

}

- (void)_updateAnimations
{
  NSObject *v3;
  BOOL isUpdatingAnimations;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PXStoryController storyQueue](self, "storyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  isUpdatingAnimations = self->_isUpdatingAnimations;
  self->_isUpdatingAnimations = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__287103;
  v23 = __Block_byref_object_dispose__287104;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__PXStoryAnimationController__updateAnimations__block_invoke;
  v18[3] = &unk_1E5145A58;
  v18[4] = self;
  v18[5] = &v19;
  -[PXStoryAnimationController _enumerateAnimationInfosUsingBlock:](self, "_enumerateAnimationInfosUsingBlock:", v18);
  if (objc_msgSend((id)v20[5], "count"))
  {
    PLStoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v20[5], "componentsJoinedByString:", CFSTR(", "));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[77239634] Removing animations with identifiers: %{public}@", buf, 0xCu);

    }
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)v20[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary removeObjectForKey:](self->_animationInfoByIdentifier, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++), (_QWORD)v14);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v8);
  }

  if (objc_msgSend((id)v20[5], "count"))
  {
    PLStoryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableDictionary allKeys](self->_animationInfoByIdentifier, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "[77239634] Remaining animations: %{public}@", buf, 0xCu);

    }
  }
  self->_isUpdatingAnimations = isUpdatingAnimations;
  _Block_object_dispose(&v19, 8);

}

- (void)handleModelChange:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[5];
  objc_super v7;

  -[PXStoryController storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7.receiver = self;
  v7.super_class = (Class)PXStoryAnimationController;
  -[PXStoryController handleModelChange:](&v7, sel_handleModelChange_, a3);
  if ((a3 & 0x4001002) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__PXStoryAnimationController_handleModelChange___block_invoke;
    v6[3] = &unk_1E51459A0;
    v6[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v6);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  NSObject *v9;
  objc_super v10;
  _QWORD block[4];
  id v12;
  id location;

  v8 = a3;
  if ((void *)AnimationObservationContext == a5)
  {
    if ((a4 & 2) != 0)
    {
      if (self->_isUpdatingAnimations)
      {
        objc_initWeak(&location, self);
        -[PXStoryController storyQueue](self, "storyQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __59__PXStoryAnimationController_observable_didChange_context___block_invoke;
        block[3] = &unk_1E5148D30;
        objc_copyWeak(&v12, &location);
        dispatch_async(v9, block);

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      else
      {
        -[PXStoryAnimationController _handleAnimationInvalidation](self, "_handleAnimationInvalidation");
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXStoryAnimationController;
    -[PXStoryController observable:didChange:context:](&v10, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_checkOutCountsByIdentifier, 0);
  objc_storeStrong((id *)&self->_animationInfoByIdentifier, 0);
}

void __59__PXStoryAnimationController_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAnimationInvalidation");

}

uint64_t __48__PXStoryAnimationController_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAnimations");
}

void __47__PXStoryAnimationController__updateAnimations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStopped");
  if (!v3 || v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v10, "animationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_configureAnimation:withAnimationInfo:", v3, v10);
  }

}

void __68__PXStoryAnimationController__configureAnimation_withAnimationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  CMTime v7[3];
  CMTime v8;
  CMTime rhs;
  CMTime lhs;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "elapsedTime");
  else
    memset(&v7[2], 0, sizeof(CMTime));
  v5 = *(void **)(a1 + 40);
  if (v5)
    objc_msgSend(v5, "startTime");
  else
    memset(&v7[1], 0, sizeof(CMTime));
  lhs = v7[2];
  rhs = v7[1];
  CMTimeSubtract(&v8, &lhs, &rhs);
  v7[0] = v8;
  objc_msgSend(v3, "setElapsedTime:", v7);
  if (objc_msgSend(*(id *)(a1 + 48), "canBePaused"))
  {
    v6 = (objc_msgSend(*(id *)(a1 + 32), "isTouching") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "desiredPlayState") == 0;
    objc_msgSend(v3, "setIsPaused:", v6);
  }

}

uint64_t __47__PXStoryAnimationController_checkInAnimation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

id __43__PXStoryAnimationController_addAnimation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PXStoryAnimationController__handleAnimationInvalidation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAnimations");
}

uint64_t __65__PXStoryAnimationController__enumerateAnimationInfosUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__PXStoryAnimationController_enumerateAnimationsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "animation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, v7, a3);

  }
}

@end
