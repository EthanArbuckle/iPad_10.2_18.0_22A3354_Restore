@implementation SBHIconViewContextMenuStateController

- (BOOL)areAnyIconViewContextMenusShowing
{
  return -[NSHashTable count](self->_iconViewsPresentingContextMenues, "count") != 0;
}

void __55__SBHIconViewContextMenuStateController_sharedInstance__block_invoke()
{
  SBHIconViewContextMenuStateController *v0;
  void *v1;

  v0 = objc_alloc_init(SBHIconViewContextMenuStateController);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (SBHIconViewContextMenuStateController)init
{
  SBHIconViewContextMenuStateController *v2;
  uint64_t v3;
  NSMutableSet *presentedWidgetsBundleIdentifiers;
  uint64_t v5;
  NSHashTable *iconViewsPresentingContextMenues;
  uint64_t v7;
  NSHashTable *iconViewsAnimatingContextMenues;
  uint64_t v9;
  NSHashTable *iconViews;
  uint64_t v11;
  NSMutableArray *pendingIconAnimationCompletionBlocks;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBHIconViewContextMenuStateController;
  v2 = -[SBHIconViewContextMenuStateController init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    presentedWidgetsBundleIdentifiers = v2->_presentedWidgetsBundleIdentifiers;
    v2->_presentedWidgetsBundleIdentifiers = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    iconViewsPresentingContextMenues = v2->_iconViewsPresentingContextMenues;
    v2->_iconViewsPresentingContextMenues = (NSHashTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    iconViewsAnimatingContextMenues = v2->_iconViewsAnimatingContextMenues;
    v2->_iconViewsAnimatingContextMenues = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    iconViews = v2->_iconViews;
    v2->_iconViews = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    pendingIconAnimationCompletionBlocks = v2->_pendingIconAnimationCompletionBlocks;
    v2->_pendingIconAnimationCompletionBlocks = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_containerViewDidScrollHiddenIconViewAway_, CFSTR("SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification"), 0);

  }
  return v2;
}

+ (SBHIconViewContextMenuStateController)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  return (SBHIconViewContextMenuStateController *)(id)sharedInstance_sharedInstance;
}

- (void)registerIconView:(id)a3
{
  id v4;
  NSHashTable *iconViews;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  id v9;

  v4 = a3;
  iconViews = self->_iconViews;
  v9 = v4;
  if (iconViews)
  {
    if (-[NSHashTable containsObject:](iconViews, "containsObject:"))
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_iconViews;
    self->_iconViews = v6;

  }
  -[NSHashTable addObject:](self->_iconViews, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iconViewWillPresentContextMenu_, CFSTR("SBIconViewWillPresentContextMenuNotification"), v9);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iconViewWillDismissContextMenu_, CFSTR("SBIconViewWillDismissContextMenuNotification"), v9);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iconViewWillAnimateContextMenu_, CFSTR("SBIconViewWillAnimateContextMenuNotification"), v9);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iconViewDidAnimateContextMenu_, CFSTR("SBIconViewDidAnimateContextMenuNotification"), v9);

LABEL_6:
}

- (void)unregisterIconView:(id)a3
{
  NSHashTable *iconViews;
  id v5;
  id v6;

  iconViews = self->_iconViews;
  v5 = a3;
  -[NSHashTable removeObject:](iconViews, "removeObject:", v5);
  -[NSHashTable removeObject:](self->_iconViewsPresentingContextMenues, "removeObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBIconViewWillPresentContextMenuNotification"), v5);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBIconViewWillDismissContextMenuNotification"), v5);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBIconViewWillAnimateContextMenuNotification"), v5);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBIconViewDidAnimateContextMenuNotification"), v5);

}

- (void)dismissAppIconForceTouchControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  dispatch_time_t v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD block[4];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD aBlock[5];
  id v45;
  _QWORD *v46;
  _QWORD v47[3];
  char v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v48 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke;
  aBlock[3] = &unk_1E8D85C48;
  v46 = v47;
  aBlock[4] = self;
  v26 = v4;
  v45 = v26;
  v27 = _Block_copy(aBlock);
  v28 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[NSHashTable allObjects](self->_iconViewsAnimatingContextMenues, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unionSet:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  -[NSHashTable allObjects](self->_iconViewsPresentingContextMenues, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unionSet:", v10);

  v11 = (void *)objc_msgSend(v28, "mutableCopy");
  if (objc_msgSend(v11, "count"))
  {
    SBLogIcon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v28;
      _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "Starting mass dismissal of all presented icon view context menues: %{public}@", buf, 0xCu);
    }

    v13 = dispatch_group_create();
    for (i = objc_msgSend(v28, "count"); i; --i)
      dispatch_group_enter(v13);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = (void *)objc_msgSend(v28, "copy");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          SBLogIcon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v19;
            _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_DEFAULT, "Dismissing icon force touch controller for icon view: %{public}@", buf, 0xCu);
          }

          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_21;
          v37[3] = &unk_1E8D84F18;
          v37[4] = v19;
          v38 = v11;
          v39 = v13;
          objc_msgSend(v19, "dismissContextMenuWithCompletion:", v37);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v16);
    }

    v21 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_22;
    block[3] = &unk_1E8D85C70;
    v22 = v27;
    v36 = v22;
    v23 = v28;
    v35 = v23;
    v24 = MEMORY[0x1E0C80D38];
    dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);
    v25 = dispatch_time(0, 1000000000);
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2;
    v29[3] = &unk_1E8D85C98;
    v33 = v47;
    v30 = v11;
    v32 = v22;
    v31 = v23;
    dispatch_after(v25, v24, v29);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v27 + 2))(v27, MEMORY[0x1E0C9AA60]);
    SBLogIcon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v28;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "No need for mass dismissal of all presented icon view context menues: %{public}@", buf, 0xCu);
    }
  }

  _Block_object_dispose(v47, 8);
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v5 + 24))
  {
    *(_BYTE *)(v5 + 24) = 1;
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("iconViews");
      v20[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBHIconViewContextMenuStateControllerDidDismissAllIconForceTouchControllersNotification"), 0, v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "_firePendingIconAnimationBlocks");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "earlyTerminateContextMenuDismissAnimation", (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }

}

- (void)_firePendingIconAnimationBlocks
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *pendingIconAnimationCompletionBlocks;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_pendingIconAnimationCompletionBlocks, "copy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pendingIconAnimationCompletionBlocks = self->_pendingIconAnimationCompletionBlocks;
  self->_pendingIconAnimationCompletionBlocks = v4;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)iconViewWillPresentContextMenu:(id)a3
{
  id v4;
  void *v5;
  NSHashTable *iconViewsPresentingContextMenues;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("presentedWidgetBundleIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet bs_safeAddObject:](self->_presentedWidgetsBundleIdentifiers, "bs_safeAddObject:", v8);
  iconViewsPresentingContextMenues = self->_iconViewsPresentingContextMenues;
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSHashTable addObject:](iconViewsPresentingContextMenues, "addObject:", v7);
}

- (void)iconViewWillDismissContextMenu:(id)a3
{
  void *v4;
  void *v5;
  NSHashTable *iconViewsPresentingContextMenues;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("presentedWidgetBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableSet removeObject:](self->_presentedWidgetsBundleIdentifiers, "removeObject:", v5);
  iconViewsPresentingContextMenues = self->_iconViewsPresentingContextMenues;
  objc_msgSend(v8, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable removeObject:](iconViewsPresentingContextMenues, "removeObject:", v7);

}

- (void)iconViewWillAnimateContextMenu:(id)a3
{
  NSHashTable *iconViewsAnimatingContextMenues;
  id v4;

  iconViewsAnimatingContextMenues = self->_iconViewsAnimatingContextMenues;
  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSHashTable addObject:](iconViewsAnimatingContextMenues, "addObject:", v4);

}

- (void)iconViewDidAnimateContextMenu:(id)a3
{
  NSHashTable *iconViewsAnimatingContextMenues;
  void *v5;

  iconViewsAnimatingContextMenues = self->_iconViewsAnimatingContextMenues;
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable removeObject:](iconViewsAnimatingContextMenues, "removeObject:", v5);

  if (!-[NSHashTable count](self->_iconViewsAnimatingContextMenues, "count"))
    -[SBHIconViewContextMenuStateController _firePendingIconAnimationBlocks](self, "_firePendingIconAnimationBlocks");
}

- (void)containerViewDidScrollHiddenIconViewAway:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBHHiddenIconViewUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[NSHashTable containsObject:](self->_iconViewsAnimatingContextMenues, "containsObject:", v5))
  {
    objc_msgSend(v5, "earlyTerminateContextMenuDismissAnimation");
  }
  else if (-[NSHashTable containsObject:](self->_iconViewsPresentingContextMenues, "containsObject:", v5))
  {
    -[SBHIconViewContextMenuStateController dismissAppIconForceTouchControllers:](self, "dismissAppIconForceTouchControllers:", 0);
  }

}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1CFEF3000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed icon force touch controller for icon view: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_22(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    SBLogIcon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2_cold_1(a1, v2);

    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

- (BOOL)areAnyIconViewContextMenusAnimating
{
  return -[NSHashTable count](self->_iconViewsAnimatingContextMenues, "count") != 0;
}

- (void)performAfterContextMenuAnimationsHaveCompleted:(id)a3
{
  NSMutableArray *pendingIconAnimationCompletionBlocks;
  void (**v5)(void);
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  if (-[SBHIconViewContextMenuStateController areAnyIconViewContextMenusAnimating](self, "areAnyIconViewContextMenusAnimating"))
  {
    pendingIconAnimationCompletionBlocks = self->_pendingIconAnimationCompletionBlocks;
    v5 = (void (**)(void))_Block_copy(aBlock);

    -[NSMutableArray addObject:](pendingIconAnimationCompletionBlocks, "addObject:", v5);
    aBlock = v5;
  }
  else
  {
    aBlock[2]();
  }

}

- (void)earlyTerminateAnyContextMenuAnimations
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSHashTable copy](self->_iconViewsAnimatingContextMenues, "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "earlyTerminateContextMenuDismissAnimation", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)noteFolderControllerWillClose:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__SBHIconViewContextMenuStateController_noteFolderControllerWillClose___block_invoke;
  v3[3] = &unk_1E8D85CC0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateDisplayedIconViewsUsingBlock:", v3);
}

void __71__SBHIconViewContextMenuStateController_noteFolderControllerWillClose___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = a2;
  if (objc_msgSend(v3, "containsObject:"))
  {
    objc_msgSend(v5, "earlyTerminateContextMenuDismissAnimation");

  }
  else
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v5);

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "dismissAppIconForceTouchControllers:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingIconAnimationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_iconViewsAnimatingContextMenues, 0);
  objc_storeStrong((id *)&self->_iconViewsPresentingContextMenues, 0);
  objc_storeStrong((id *)&self->_presentedWidgetsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
}

void __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Dismissal of icon force touch controller for icons '%{public}@' failed.", (uint8_t *)&v3, 0xCu);
}

@end
