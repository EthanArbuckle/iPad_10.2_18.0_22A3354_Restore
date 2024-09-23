@implementation SBBannerManager

- (BOOL)isDisplayingBannerInAnyWindowScene
{
  SBBannerManager *v2;
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2->_windowScenesToBannerWindows;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (-[SBBannerManager isDisplayingBannerInWindowScene:](v2, "isDisplayingBannerInWindowScene:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (SBBannerManager)init
{
  SBBannerManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  BNBannerSourceListener *bannerSourceListener;
  SBBannerAuthority *v7;
  SBBannerAuthority *bannerAuthority;
  void *v9;
  SBWindowLevelAssertionManager *v10;
  SBWindowLevelAssertionManager *windowLevelAssertionManager;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBBannerManager;
  v2 = -[SBBannerManager init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D01080]);
    objc_msgSend((id)objc_opt_class(), "_defaultAuthorizedBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithAuthorizedBundleIDs:", v4);
    bannerSourceListener = v2->_bannerSourceListener;
    v2->_bannerSourceListener = (BNBannerSourceListener *)v5;

    -[BNBannerSourceListener setDelegate:](v2->_bannerSourceListener, "setDelegate:", v2);
    v7 = objc_alloc_init(SBBannerAuthority);
    bannerAuthority = v2->_bannerAuthority;
    v2->_bannerAuthority = v7;

    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", v2);

    v10 = objc_alloc_init(SBWindowLevelAssertionManager);
    windowLevelAssertionManager = v2->_windowLevelAssertionManager;
    v2->_windowLevelAssertionManager = v10;

    -[SBWindowLevelAssertionManager setDelegate:](v2->_windowLevelAssertionManager, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__systemApertureInsetsDidChange_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);

  }
  return v2;
}

- (id)layoutManagerInWindowScene:(id)a3
{
  void *v3;
  void *v4;

  -[SBBannerManager _contentViewControllerForWindowScene:](self, "_contentViewControllerForWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDisplayingBannerInWindowScene:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  -[SBBannerManager bannerWindowInWindowScene:](self, "bannerWindowInWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isHidden") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)isDisplayingFullScreenBannerInWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBBannerManager _bannerWindowForWindowScene:](self, "_bannerWindowForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedPresentables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        UIViewControllerFromPresentable();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "viewIfLoaded");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "frame");
        v14 = v13;
        v16 = v15;
        objc_msgSend(v5, "frame");
        v18 = v17;
        v20 = v19;

        if (v14 == v18 && v16 == v20)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

  return v8;
}

- (BOOL)pointInsideBanner:(CGPoint)a3 inWindowScene:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedPresentables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        UIViewControllerFromPresentable();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewIfLoaded");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "screen");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v15, "fixedCoordinateSpace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "convertPoint:fromCoordinateSpace:", v16, x, y);
        v18 = v17;
        v20 = v19;

        objc_msgSend(v14, "bounds");
        v28.x = v18;
        v28.y = v20;
        LOBYTE(v15) = CGRectContainsPoint(v29, v28);

        if ((v15 & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)windowSceneForPresentable:(id)a3
{
  void *v4;
  void *v5;

  -[SBBannerManager _presenterForPresentable:](self, "_presenterForPresentable:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)registerAuthority:(id)a3 forRequesterIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authority"));

  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[requesterIdentifier length] > 0"));

  }
  -[SBBannerAuthority registerAuthority:forRequesterIdentifier:](self->_bannerAuthority, "registerAuthority:forRequesterIdentifier:", v10, v7);

}

- (id)acquireGestureRecognizerPriorityAssertionForPresentable:(id)a3 priority:(int64_t)a4 reason:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  SBBannerManager *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMapTable *presentablesToGesturePriorityAssertions;
  uint64_t v17;
  NSMapTable *v18;
  void *v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = self;
    objc_sync_enter(v12);
    -[NSMapTable objectForKey:](v12->_presentablesToGesturePriorityAssertions, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _presenterForPresentable:](v12, "_presenterForPresentable:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _windowSceneForPresenter:](v12, "_windowSceneForPresenter:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _acquireGestureRecognizerPriorityAssertionWithPriority:windowScene:reason:](v12, "_acquireGestureRecognizerPriorityAssertionWithPriority:windowScene:reason:", a4, v15, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "containsObject:", v11) & 1) == 0)
    {
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        presentablesToGesturePriorityAssertions = v12->_presentablesToGesturePriorityAssertions;
        if (!presentablesToGesturePriorityAssertions)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v12->_presentablesToGesturePriorityAssertions;
          v12->_presentablesToGesturePriorityAssertions = (NSMapTable *)v17;

          presentablesToGesturePriorityAssertions = v12->_presentablesToGesturePriorityAssertions;
        }
        -[NSMapTable setObject:forKey:](presentablesToGesturePriorityAssertions, "setObject:forKey:", v13, v8);
      }
      objc_msgSend(v13, "addObject:", v11);
      objc_msgSend(v14, "topPresentables");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastObject");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v20 != v8)
        objc_msgSend(v11, "setEnabled:", 0);
    }

    objc_sync_exit(v12);
  }

  return v11;
}

- (id)acquireBannerSuppressionAssertionForReason:(id)a3
{
  id v4;
  SBBannerManager *v5;
  uint64_t v6;
  NSHashTable *suppressionAssertions;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  id location;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!v5->_suppressionAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = objc_claimAutoreleasedReturnValue();
      suppressionAssertions = v5->_suppressionAssertions;
      v5->_suppressionAssertions = (NSHashTable *)v6;

    }
    objc_initWeak(&location, v5);
    SBLogBanners();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v4;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Instantiating banner suppression assertion for reason: %{public}@", buf, 0xCu);
    }

    v9 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__SBBannerManager_acquireBannerSuppressionAssertionForReason___block_invoke;
    v23[3] = &unk_1E8EA4CC0;
    objc_copyWeak(&v24, &location);
    v23[4] = v5;
    v12 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v11, v4, v23);

    -[NSHashTable addObject:](v5->_suppressionAssertions, "addObject:", v12);
    if (-[NSHashTable count](v5->_suppressionAssertions, "count") == 1)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = v5->_windowScenesToBannerControllers;
      v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v13);
            -[SBBannerManager _bannerControllerForWindowScene:](v5, "_bannerControllerForWindowScene:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSuspended:forReason:revokingCurrent:error:", 1, CFSTR("Banner manager suppression assertion"), 0, 0);

          }
          v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
        }
        while (v14);
      }

    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    objc_sync_exit(v5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __62__SBBannerManager_acquireBannerSuppressionAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id *WeakRetained;
  id *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogBanners();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Banner suppression assertion did invalidate with reason: %{public}@", buf, 0xCu);

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[13], "removeObject:", v3);
    if (!objc_msgSend(v7[13], "count"))
    {
      v8 = v7[13];
      v7[13] = 0;

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(a1 + 32), "_bannerControllerForWindowScene:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), (_QWORD)v15);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setSuspended:forReason:revokingCurrent:error:", 0, CFSTR("Banner manager suppression assertion"), 0, 0);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }

    }
  }

}

- (void)setSuspended:(BOOL)a3 forReason:(id)a4
{
  id v6;
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  NSMutableSet *clientSuppressionAssertions;
  NSMutableSet *v15;
  NSMutableSet *v16;
  void *v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_clientSuppressionAssertions;
  v8 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "reason", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if (v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (v8 || !a3)
  {
    v18 = a3;
    if (!v8)
      v18 = 1;
    if (!v18)
    {
      -[NSMutableSet removeObject:](self->_clientSuppressionAssertions, "removeObject:", v8);
      objc_msgSend(v8, "invalidate");
    }
  }
  else
  {
    clientSuppressionAssertions = self->_clientSuppressionAssertions;
    if (!clientSuppressionAssertions)
    {
      v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v16 = self->_clientSuppressionAssertions;
      self->_clientSuppressionAssertions = v15;

      clientSuppressionAssertions = self->_clientSuppressionAssertions;
    }
    -[SBBannerManager acquireBannerSuppressionAssertionForReason:](self, "acquireBannerSuppressionAssertionForReason:", v6, (_QWORD)v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](clientSuppressionAssertions, "addObject:", v17);

  }
}

- (void)dismissAllBannersInWindowScene:(id)a3 animated:(BOOL)a4 reason:(id)a5
{
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  id obj;
  _BOOL4 v29;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v29 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a5;
  SBLogBanners();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("without");
    *(_DWORD *)buf = 138543874;
    v39 = v6;
    if (v29)
      v9 = CFSTR("with");
    v40 = 2114;
    v41 = v9;
    v42 = 2114;
    v43 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Asked by system to dismiss all banners in window scene '%{public}@' %{public}@ animation for reason: %{public}@", buf, 0x20u);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v6;
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedPresentables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v32 = 0;
          v17 = objc_msgSend(v16, "shouldDismissForReason:outReason:", v7, &v32);
          v18 = v32;
          if ((v17 & 1) != 0)
            goto LABEL_19;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v18 = 0;
LABEL_19:
            objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0;
            -[SBBannerManager revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](self, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v22, v7, 1, v29, 0, &v31);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v31;

            if (!v23)
            {
              SBLogBanners();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                BNEffectivePresentableDescription();
                v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v39 = v25;
                v40 = 2114;
                v41 = v7;
                v42 = 2114;
                v43 = v19;
                _os_log_error_impl(&dword_1D0540000, v24, OS_LOG_TYPE_ERROR, "Failed to revoke presentable '%{public}@' for reason '%{public}@': %{public}@", buf, 0x20u);

              }
            }
            goto LABEL_27;
          }
          v18 = 0;
          if (objc_msgSend(v16, "shouldDismissForReason:", v7))
            goto LABEL_19;
        }
        SBLogBanners();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          BNEffectivePresentableDescription();
          v20 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (reason: '%@')"), v18);
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v21 = v27;
          }
          else
          {
            v21 = &stru_1E8EC7EC0;
          }
          *(_DWORD *)buf = 138543874;
          v39 = v7;
          v40 = 2114;
          v41 = v20;
          v42 = 2114;
          v43 = (id)v21;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Presentable denied system dismissal for reason '%{public}@': %{public}@%{public}@", buf, 0x20u);
          if (v18)

        }
LABEL_27:

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

}

- (void)dismissAllBannersInAllWindowScenesAnimated:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  SBBannerManager *v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogBanners();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("without");
    if (v4)
      v8 = CFSTR("with");
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Asked by system to dismiss all banners in all window scenes %{public}@ animation for reason: %{public}@", buf, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v9->_windowScenesToBannerControllers;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        -[SBBannerManager dismissAllBannersInWindowScene:animated:reason:](v9, "dismissAllBannersInWindowScene:animated:reason:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v4, v6, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)addTransitionObserver:(id)a3
{
  id v4;
  NSHashTable *transitionObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    transitionObservers = self->_transitionObservers;
    v8 = v4;
    if (!transitionObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_transitionObservers;
      self->_transitionObservers = v6;

      transitionObservers = self->_transitionObservers;
    }
    -[NSHashTable addObject:](transitionObservers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeTransitionObserver:(id)a3
{
  id v4;
  NSUInteger v5;
  NSHashTable *transitionObservers;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSHashTable removeObject:](self->_transitionObservers, "removeObject:", v4);
    v5 = -[NSHashTable count](self->_transitionObservers, "count");
    v4 = v7;
    if (!v5)
    {
      transitionObservers = self->_transitionObservers;
      self->_transitionObservers = 0;

      v4 = v7;
    }
  }

}

- (BOOL)postPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  SBBannerSourceListenerTemplatePresentableViewController *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  SBBannerSourceListenerTemplatePresentableViewController *v15;
  id WeakRetained;
  char v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = (SBBannerSourceListenerTemplatePresentableViewController *)a3;
  v11 = a5;
  -[SBBannerSourceListenerTemplatePresentableViewController ensurePresentableIsUniquelyIdentifiable](v10, "ensurePresentableIsUniquelyIdentifiable");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBBannerSourceListenerTemplatePresentableViewController setSystemDragCancellationHandler:](v10, "setSystemDragCancellationHandler:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[SBBannerSourceListenerTemplatePresentableViewController providesTemplateContent](v10, "providesTemplateContent"))
    {
      UIViewControllerFromPresentable();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        SBLogBanners();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          BNEffectivePresentableDescription();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v14;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Providing host-side view controller for template presentable': %{public}@", (uint8_t *)&v24, 0xCu);

        }
        v15 = -[SBBannerSourceListenerTemplatePresentableViewController initWithPresentable:]([SBBannerSourceListenerTemplatePresentableViewController alloc], "initWithPresentable:", v10);

        v10 = v15;
      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  v17 = objc_msgSend(WeakRetained, "willInterceptPresentable:userInfo:", v10, v11);

  if ((v17 & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeDisplayWindowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (SBFEffectiveHomeButtonType() == 2 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBBannerManager _homeGestureContextForPresentable:windowScene:](self, "_homeGestureContextForPresentable:windowScene:", v10, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBannerSourceListenerTemplatePresentableViewController setHomeGestureContext:](v10, "setHomeGestureContext:", v21);

    }
    -[SBBannerManager _bannerControllerForWindowScene:](self, "_bannerControllerForWindowScene:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v22, "postPresentable:withOptions:userInfo:error:", v10, a4, v11, a6);

    if ((v18 & 1) == 0)
      -[SBBannerManager _unregisterHomeGestureContextForPresentable:](self, "_unregisterHomeGestureContextForPresentable:", v10);

  }
  return v18;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  id v16;
  SBBannerManager *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v24;
  NSMapTable *obj;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  v26 = v11;
  v15 = v12;
  objc_msgSend(WeakRetained, "revocationRequestedForPresentablesWithIdentification:reason:", v11, v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v16, "addObjectsFromArray:", v24);
  }
  else
  {
    v16 = 0;
  }
  v17 = self;
  objc_sync_enter(v17);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v17->_windowScenesToBannerControllers;
  v18 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        -[SBBannerManager _bannerControllerForWindowScene:](v17, "_bannerControllerForWindowScene:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v26, v15, a5, v13, a7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          if (!v16)
            v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v16, "addObjectsFromArray:", v22);
        }

      }
      v18 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  objc_sync_exit(v17);
  if (a7 && *a7 && objc_msgSend(v24, "isEqualToArray:", v16))
    *a7 = 0;

  return v16;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  SBBannerManager *v16;
  NSMapTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v25 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v26 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  v27 = v13;
  v28 = v12;
  objc_msgSend(WeakRetained, "revocationRequestedForPresentablesWithIdentification:reason:", v12, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "addObjectsFromArray:", v24);
  }
  else
  {
    v15 = 0;
  }
  v16 = self;
  objc_sync_enter(v16);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v16->_windowScenesToBannerControllers;
  v18 = -[NSMapTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v17);
        -[SBBannerManager _bannerControllerForWindowScene:](v16, "_bannerControllerForWindowScene:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v21, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", v28, v27, a5, v25, v26, a8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            if (!v15)
              v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v15, "addObjectsFromArray:", v22);
          }

        }
      }
      v18 = -[NSMapTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  objc_sync_exit(v16);
  if (a8 && *a8 && objc_msgSend(v24, "isEqualToArray:", v15))
    *a8 = 0;

  return v15;
}

- (void)presenter:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  BNBannerSourceListener *bannerSourceListener;
  void *v13;
  void *v14;
  double top;
  double left;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  CGFloat v26;
  double v27;
  CGRect v28;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  bannerSourceListener = self->_bannerSourceListener;
  BSRectWithSize();
  -[SBBannerManager _layoutDescriptionWithBounds:inWindowScene:](self, "_layoutDescriptionWithBounds:inWindowScene:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerSourceListener layoutDescriptionDidChange:](bannerSourceListener, "layoutDescriptionDidChange:", v13);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__SBBannerManager_presenter_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v24[3] = &unk_1E8EBC970;
  v24[4] = self;
  v26 = width;
  v27 = height;
  v23 = v9;
  v25 = v23;
  -[SBBannerManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_bannerManager_containerWillTransitionToSize_withTransitionCoordinator_, v24);
  -[SBBannerManager _windowForPresenter:](self, "_windowForPresenter:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "bounds");
  top = self->_additionalEdgeInsets.top;
  left = self->_additionalEdgeInsets.left;
  v28.origin.x = v17 + left;
  v28.origin.y = top + v18;
  v28.size.width = v19 - (left + self->_additionalEdgeInsets.right);
  v28.size.height = v20 - (top + self->_additionalEdgeInsets.bottom);
  if (height > CGRectGetHeight(v28))
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "restrictSystemApertureToDefaultLayoutWithReason:", CFSTR("Transient restriction due to presentation of large banner"));

  }
}

uint64_t __76__SBBannerManager_presenter_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:containerWillTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)presenter:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6
{
  id v10;
  SBBannerManager *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSMapTable *obj;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id location;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v10 = a4;
  v28 = a5;
  v26 = a6;
  objc_initWeak(&location, self);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke;
  v44[3] = &unk_1E8EB79D8;
  objc_copyWeak(&v46, &location);
  v27 = v10;
  v45 = v27;
  objc_msgSend(v28, "animateAlongsideTransition:completion:", v44, 0);
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(v29, "topPresentables");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBBannerManager _windowSceneForPresenter:](v11, "_windowSceneForPresenter:", v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v40 = 0u;
  obj = v11->_presentablesToGesturePriorityAssertions;
  v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v15)
  {
    v31 = *(_QWORD *)v41;
    do
    {
      v16 = 0;
      v32 = v15;
      do
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[NSMapTable objectForKey:](v11->_presentablesToGesturePriorityAssertions, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v37 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              -[SBBannerManager _setWindowScene:forGestureRecognizerPriorityAssertion:](v11, "_setWindowScene:forGestureRecognizerPriorityAssertion:", v14, v22);
              objc_msgSend(v22, "setEnabled:", v17 == v13);
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v19);
        }

        ++v16;
      }
      while (v16 != v32);
      v15 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v15);
  }

  objc_sync_exit(v11);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke_2;
  v33[3] = &unk_1E8EBC998;
  v33[4] = v11;
  v23 = v27;
  v34 = v23;
  v24 = v28;
  v35 = v24;
  -[SBBannerManager _enumerateObserversRespondingToSelector:usingBlock:](v11, "_enumerateObserversRespondingToSelector:usingBlock:", sel_bannerManager_willPresentPresentable_withTransitionCoordinator_, v33);
  -[SBBannerManager _windowSceneForPresenter:](v11, "_windowSceneForPresenter:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _updateZStackPolicyAssistantForWindowScene:reasonSuffix:transitionCoordinator:](v11, "_updateZStackPolicyAssistantForWindowScene:reasonSuffix:transitionCoordinator:", v25, CFSTR("present presentable"), v24);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

}

void __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_hideStatusBarIfNecessaryForPresentable:", *(_QWORD *)(a1 + 32));

}

uint64_t __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:willPresentPresentable:withTransitionCoordinator:", a1[4], a1[5], a1[6]);
}

- (void)presenter:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  SBBannerManager *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSMapTable *obj;
  _QWORD v30[5];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id location;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v10 = a4;
  v27 = a5;
  v25 = a6;
  objc_initWeak(&location, self);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke;
  v41[3] = &unk_1E8EB79D8;
  objc_copyWeak(&v43, &location);
  v26 = v10;
  v42 = v26;
  objc_msgSend(v27, "animateAlongsideTransition:completion:", v41, 0);
  objc_msgSend(v28, "topPresentables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self;
  objc_sync_enter(v13);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v13->_presentablesToGesturePriorityAssertions;
  v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        -[NSMapTable objectForKey:](v13->_presentablesToGesturePriorityAssertions, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v34 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "setEnabled:", v17 == v12);
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          }
          while (v19);
        }

      }
      v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v14);
  }

  objc_sync_exit(v13);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke_2;
  v30[3] = &unk_1E8EBC998;
  v30[4] = v13;
  v22 = v26;
  v31 = v22;
  v23 = v27;
  v32 = v23;
  -[SBBannerManager _enumerateObserversRespondingToSelector:usingBlock:](v13, "_enumerateObserversRespondingToSelector:usingBlock:", sel_bannerManager_willDismissPresentable_withTransitionCoordinator_, v30);
  -[SBBannerManager _windowSceneForPresenter:](v13, "_windowSceneForPresenter:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _updateZStackPolicyAssistantForWindowScene:reasonSuffix:transitionCoordinator:](v13, "_updateZStackPolicyAssistantForWindowScene:reasonSuffix:transitionCoordinator:", v24, CFSTR("dismiss presentable"), v23);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

}

void __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_revealStatusBarIfNecessaryForPresentable:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "_unregisterHomeGestureContextForPresentable:", *(_QWORD *)(a1 + 32));

}

uint64_t __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:willDismissPresentable:withTransitionCoordinator:", a1[4], a1[5], a1[6]);
}

- (void)presenter:(id)a3 presentable:(id)a4 willTransitionToSize:(CGSize)a5 withTransitionCoordinator:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  CGFloat v17;
  CGFloat v18;

  height = a5.height;
  width = a5.width;
  v10 = a4;
  v11 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__SBBannerManager_presenter_presentable_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E8EBC9C0;
  v14[4] = self;
  v15 = v10;
  v17 = width;
  v18 = height;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[SBBannerManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_bannerManager_presentable_willTransitionToSize_withTransitionCoordinator_, v14);

}

uint64_t __88__SBBannerManager_presenter_presentable_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:presentable:willTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)panGestureRecognizerForPresenter:(id)a3
{
  void *v4;
  void *v5;

  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _updateGesturePriorityForGestureRecognizerInWindowScene:](self, "_updateGesturePriorityForGestureRecognizerInWindowScene:", v4);
  -[SBBannerManager _panGestureInWindowScene:](self, "_panGestureInWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForEvent:(id)a5 inView:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGPoint result;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v13, "type") == 10)
  {
    -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _panGestureInWindowScene:](self, "_panGestureInWindowScene:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 != v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 487, CFSTR("Unknown gesture recognizer: %@"), v12);

    }
    v17 = objc_opt_class();
    v18 = v13;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v22 = v19;

    if ((objc_msgSend(v16, "sb_isInstalledAsSystemGesture") & 1) != 0)
    {
      _UISystemGestureLocationForScrollEventInView();
      v20 = v23;
      v25 = v24;

      objc_msgSend(v15, "reachabilitySceneOffsetProvider");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "effectiveReachabilityYOffset");
      v21 = v25 - v26;
    }
    else
    {
      objc_msgSend(v22, "locationInView:", v14);
      v20 = v27;
      v21 = v28;
    }

  }
  else
  {
    v20 = *MEMORY[0x1E0C9D538];
    v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v29 = v20;
  v30 = v21;
  result.y = v30;
  result.x = v29;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForTouch:(id)a5 inView:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CGPoint result;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _panGestureInWindowScene:](self, "_panGestureInWindowScene:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 501, CFSTR("Unknown gesture recognizer: %@"), v11);

  }
  if ((objc_msgSend(v15, "sb_isInstalledAsSystemGesture") & 1) != 0)
  {
    _UISystemGestureLocationForTouchInView();
    v17 = v16;
    v19 = v18;
    objc_msgSend(v14, "reachabilitySceneOffsetProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "effectiveReachabilityYOffset");
    v22 = v19 - v21;

  }
  else
  {
    if (v12)
      v23 = v12;
    else
      v23 = v11;
    objc_msgSend(v23, "locationInView:", v13);
    v17 = v24;
    v22 = v25;
  }

  v26 = v17;
  v27 = v22;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 velocityInView:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGPoint result;

  v9 = a4;
  v10 = a5;
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _panGestureInWindowScene:](self, "_panGestureInWindowScene:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 513, CFSTR("Unknown gesture recognizer: %@"), v9);

  }
  if (objc_msgSend(v12, "sb_isInstalledAsSystemGesture"))
    _UISystemGestureVelocityInView();
  else
    objc_msgSend(v9, "velocityInView:", v10);
  v15 = v13;
  v16 = v14;

  v17 = v15;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 translationInView:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGPoint result;

  v9 = a4;
  v10 = a5;
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _panGestureInWindowScene:](self, "_panGestureInWindowScene:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 521, CFSTR("Unknown gesture recognizer: %@"), v9);

  }
  if (objc_msgSend(v12, "sb_isInstalledAsSystemGesture"))
    _UISystemGestureTranslationInView();
  else
    objc_msgSend(v9, "translationInView:", v10);
  v15 = v13;
  v16 = v14;

  v17 = v15;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)presenterRequestsVisibility:(id)a3
{
  void *v4;
  id v5;

  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _bannerWindowForWindowScene:creatingIfNecessary:](self, "_bannerWindowForWindowScene:creatingIfNecessary:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _invalidatePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:](self, "_invalidatePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:", v5);
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)presenterRelinquishesVisibility:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:](self, "_acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:");
  -[SBBannerManager _windowForPresenter:](self, "_windowForPresenter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "resignAsKeyWindow");
  objc_msgSend(v7, "setHidden:", 1);

}

- (double)presenterMinimumPreferredTopEdgeInset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  double top;
  BOOL v11;
  double v12;

  v4 = a3;
  -[SBBannerManager _windowSceneForPresenter:](self, "_windowSceneForPresenter:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresented");

  v8 = 0.0;
  if ((v7 & 1) == 0)
  {
    -[SBBannerManager _windowForPresenter:](self, "_windowForPresenter:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "interfaceOrientation") == 1 && objc_msgSend(v5, "isMainDisplayWindowScene"))
    {
      top = self->_additionalEdgeInsets.top;
      v11 = top <= 48.0;
      v12 = top + 12.0;
      if (v11)
        v8 = 0.0;
      else
        v8 = v12;
    }

  }
  return v8;
}

- (BOOL)bannerPanGestureRecognizer:(id)a3 shouldDisableTouchCancellationForTouch:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allPresentables");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v16, "shouldDisableTouchCancellationForTouch:event:", v8, v9, (_QWORD)v18) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_12;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)bannerPanGestureRecognizer:(id)a3 shouldCancelSystemDragGestureWithTouches:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allPresentables");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v16, "shouldCancelSystemDragGestureWithTouches:event:", v8, v9, (_QWORD)v18) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_12;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_12:

  return v13;
}

- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)SBApp, "windowSceneManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDisplayWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBBannerManager _bannerWindowForWindowScene:creatingIfNecessary:](self, "_bannerWindowForWindowScene:creatingIfNecessary:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[SBBannerManager _layoutDescriptionWithBounds:inWindowScene:](self, "_layoutDescriptionWithBounds:inWindowScene:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)bannerSourceListener:(id)a3 presentationSize:(CGSize *)a4 containerSize:(CGSize *)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  id v33;

  if (a5)
  {
    objc_msgSend((id)SBApp, "windowSceneManager", a3, a4, a5, a6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeDisplayWindowScene");
    v33 = (id)objc_claimAutoreleasedReturnValue();

    -[SBBannerManager _bannerWindowForWindowScene:creatingIfNecessary:](self, "_bannerWindowForWindowScene:creatingIfNecessary:", v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    a5->width = v13;
    a5->height = v14;
    if (a4)
    {
      v15 = v11;
      v16 = v12;
      v17 = v13;
      v18 = v14;
      -[SBBannerManager layoutManagerInWindowScene:](self, "layoutManagerInWindowScene:", v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "useableContainerFrameInContainerBounds:onScreen:", v20, v15, v16, v17, v18);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scale");
      objc_msgSend(v19, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v26, v28, v22, v24, v26, v28, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v18, v30);
      a4->width = v31;
      a4->height = v32;

    }
  }
}

- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  return -[SBBannerManager postPresentable:withOptions:userInfo:error:](self, "postPresentable:withOptions:userInfo:error:", a4, a5, a6, a7);
}

- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  return -[SBBannerManager revokePresentablesWithIdentification:reason:options:animated:userInfo:error:](self, "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:", a4, a5, 0, a6, a7, a8);
}

- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  SBBannerManager *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  BOOL v19;
  id v21;
  NSMapTable *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v8 = a6;
  v10 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v12 = a5;
  v13 = self;
  objc_sync_enter(v13);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v13->_windowScenesToBannerControllers;
  v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v15)
        objc_enumerationMutation(obj);
      -[SBBannerManager _bannerControllerForWindowScene:](v13, "_bannerControllerForWindowScene:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "setSuspended:forReason:revokingCurrent:error:", v10, v12, v8, a7);

      if ((v18 & 1) == 0)
        break;
      if (v14 == ++v16)
      {
        v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          goto LABEL_3;
        v19 = 1;
        goto LABEL_11;
      }
    }
  }
  v19 = 0;
LABEL_11:

  objc_sync_exit(v13);
  return v19;
}

- (id)bannerSourceListener:(id)a3 sceneSpecificationForBannerSceneWithIdentifier:(id)a4 forProcess:(id)a5 userInfo:(id)a6
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  char v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  char v30;
  void *v31;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  int v44;

  v6 = a6;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DACA30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (v11)
    v12 = objc_msgSend(v11, "BOOLValue");
  else
    v12 = 1;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DACA50]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v18 = objc_msgSend(v17, "BOOLValue");
  if ((v18 & 1) != 0)
    goto LABEL_27;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DACA40]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  v21 = v19;
  if (v20)
    v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
  else
    v22 = 0;
  v23 = v22;

  v24 = objc_msgSend(v23, "BOOLValue");
  if ((v24 & 1) != 0)
    goto LABEL_27;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DACA48]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_class();
  v27 = v25;
  if (v26)
    v28 = (objc_opt_isKindOfClass() & 1) != 0 ? v27 : 0;
  else
    v28 = 0;
  v29 = v28;

  v30 = objc_msgSend(v29, "BOOLValue");
  if ((v30 & 1) != 0)
    goto LABEL_27;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DACA20]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_class();
  v35 = v33;
  if (v34)
    v36 = (objc_opt_isKindOfClass() & 1) != 0 ? v35 : 0;
  else
    v36 = 0;
  v37 = v36;

  v38 = objc_msgSend(v37, "BOOLValue");
  if ((v38 & 1) != 0 || ((v12 ^ 1) & 1) != 0)
    goto LABEL_27;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DACA10]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_class();
  v41 = v39;
  if (v40)
    v42 = (objc_opt_isKindOfClass() & 1) != 0 ? v41 : 0;
  else
    v42 = 0;
  v43 = v42;

  v44 = objc_msgSend(v43, "BOOLValue");
  if (v44)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0DAC598], "specificationAffectingAppLifecycleIfInternal:", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (void)bannerSourceListener:(id)a3 didUpdateInitialSceneSettingsWithParameters:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__SBBannerManager_bannerSourceListener_didUpdateInitialSceneSettingsWithParameters___block_invoke;
  v4[3] = &unk_1E8EA2A30;
  v4[4] = self;
  objc_msgSend(a4, "updateSettingsWithBlock:", v4);
}

void __84__SBBannerManager_bannerSourceListener_didUpdateInitialSceneSettingsWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = objc_opt_class();
  v14 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v14;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDisplayWindowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_bannerWindowForWindowScene:creatingIfNecessary:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(v9, "interfaceOrientation"));
  objc_msgSend(v8, "_sbDisplayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayConfiguration:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_contentViewControllerForWindowScene:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  objc_msgSend(v12, "convertRect:toView:", 0);
  objc_msgSend(v9, "_convertRectToSceneReferenceSpace:");

  BSRectWithSize();
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setClientContainerViewControllerClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sb_applyDisplayEdgeInfoToSceneSettings:", v6);

}

- (id)bannerSourceListener:(id)a3 newBannerSourceListenerPresentableForBannerSpecification:(id)a4 serviceDomain:(id)a5 scene:(id)a6 readyCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBBannerSourceListenerTemplatePresentableViewController *v16;
  SBBannerSourceListenerTemplatePresentableViewController *v17;
  void *v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "contentBehavior"))
  {
    if (objc_msgSend(v12, "contentBehavior") != 1)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v16 = -[SBBannerSourceListenerTemplatePresentableViewController initWithSpecification:serviceDomain:readyCompletion:]([SBBannerSourceListenerTemplatePresentableViewController alloc], "initWithSpecification:serviceDomain:readyCompletion:", v12, v13, v15);
  }
  else
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    }
    v16 = -[BNBannerSourceListenerHostedPresentableViewController initWithSpecification:serviceDomain:scene:readyCompletion:]([SBBannerSourceListenerHostedPresentableViewController alloc], "initWithSpecification:serviceDomain:scene:readyCompletion:", v12, v13, v14, v15);
  }
  v17 = v16;
LABEL_9:

  return v17;
}

- (BOOL)bannerSourceListenerShouldEnablePresentableContextInterface:(id)a3
{
  return 1;
}

- (id)userInterfaceStyleTransitionAnimationSettingsForPresentable:(id)a3 forTransitionToStyle:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DAC280], "animationSettingsForTransitionToStyle:", a4);
}

- (void)cancelSystemDragForPresentable:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  UIViewControllerFromPresentable();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_windowScenesToPanGestures, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEnabled"))
    {
      objc_msgSend(v5, "setEnabled:", 0);
      objc_msgSend(v5, "setEnabled:", 1);
    }

  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SBBannerManager _zStackPolicyAssistantForParticipant:](self, "_zStackPolicyAssistantForParticipant:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPhysicalButtonSceneTargets:", v7);

  objc_msgSend(v8, "setActivationPolicyForParticipantsBelow:", 0);
}

- (void)physicalButtonZStackPolicyAssistantDidChange:(id)a3
{
  id v3;

  -[SBBannerManager _zStackParticipantForAssistant:](self, "_zStackParticipantForAssistant:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdatePreferencesWithReason:", CFSTR("policy assistant did change"));

}

- (BOOL)_handleButtonEventWithTest:(id)a3 handler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)SBApp;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeDisplayWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SBBannerManager _handleButtonEventWithWindowScene:test:handler:](self, "_handleButtonEventWithWindowScene:test:handler:", v10, v8, v7);
  return (char)self;
}

- (BOOL)_handleButtonEventWithWindowScene:(id)a3 test:(id)a4 handler:(id)a5
{
  id v9;
  unsigned int (**v10)(id, _QWORD);
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (unsigned int (**)(id, _QWORD))a4;
  v11 = a5;
  v12 = (uint64_t (**)(_QWORD, _QWORD))v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 727, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_3:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topPresentables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v10[2](v10, v18) && (v12[2](v12, v18) & 1) != 0)
        {
          LOBYTE(v15) = 1;
          goto LABEL_14;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_14:

  return v15;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SBBannerManager_handleHeadsetButtonPress___block_invoke_2;
  v4[3] = &__block_descriptor_33_e25_B16__0___BNPresentable__8l;
  v5 = a3;
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_343, v4);
}

uint64_t __44__SBBannerManager_handleHeadsetButtonPress___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __44__SBBannerManager_handleHeadsetButtonPress___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHeadsetButtonPress:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)handleHomeButtonPress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_92, &__block_literal_global_95_2);
}

uint64_t __40__SBBannerManager_handleHomeButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __40__SBBannerManager_handleHomeButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonPress");
}

- (BOOL)handleHomeButtonPressInWindowScene:(id)a3
{
  return -[SBBannerManager _handleButtonEventWithWindowScene:test:handler:](self, "_handleButtonEventWithWindowScene:test:handler:", a3, &__block_literal_global_96_1, &__block_literal_global_97_0);
}

uint64_t __54__SBBannerManager_handleHomeButtonPressInWindowScene___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __54__SBBannerManager_handleHomeButtonPressInWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonPress");
}

- (BOOL)handleHomeButtonDoublePress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_98_1, &__block_literal_global_101_2);
}

uint64_t __46__SBBannerManager_handleHomeButtonDoublePress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __46__SBBannerManager_handleHomeButtonDoublePress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonDoublePress");
}

- (BOOL)handleHomeButtonLongPress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_102, &__block_literal_global_105_3);
}

uint64_t __44__SBBannerManager_handleHomeButtonLongPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __44__SBBannerManager_handleHomeButtonLongPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonLongPress");
}

- (BOOL)handleLockButtonPress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_106_1, &__block_literal_global_109_0);
}

uint64_t __40__SBBannerManager_handleLockButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __40__SBBannerManager_handleLockButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleLockButtonPress");
}

- (BOOL)handleVoiceCommandButtonPress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_110, &__block_literal_global_113_0);
}

uint64_t __48__SBBannerManager_handleVoiceCommandButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __48__SBBannerManager_handleVoiceCommandButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleVoiceCommandButtonPress");
}

- (BOOL)handleVolumeUpButtonPress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_114, &__block_literal_global_117_0);
}

uint64_t __44__SBBannerManager_handleVolumeUpButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __44__SBBannerManager_handleVolumeUpButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleVolumeUpButtonPress");
}

- (BOOL)handleVolumeDownButtonPress
{
  return -[SBBannerManager _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_118_0, &__block_literal_global_121_1);
}

uint64_t __46__SBBannerManager_handleVolumeDownButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __46__SBBannerManager_handleVolumeDownButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleVolumeDownButtonPress");
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  v6 = objc_opt_class();
  v9 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[SBBannerManager dismissAllBannersInWindowScene:animated:reason:](self, "dismissAllBannersInWindowScene:animated:reason:", v8, 1, CFSTR("assistantWillAppear"));
}

- (void)ambientPresentationController:(id)a3 willUpdatePresented:(BOOL)a4
{
  id v5;
  SBBannerManager *v6;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  _BOOL4 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6->_windowScenesToBannerControllers;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "ambientPresentationController", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12 == v5;

        if (v13)
        {
          -[SBBannerManager dismissAllBannersInWindowScene:animated:reason:](v6, "dismissAllBannersInWindowScene:animated:reason:", v11, 1, CFSTR("Ambient presenting"));
          goto LABEL_11;
        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v6);
}

- (int64_t)platterHomeGestureManager:(id)a3 zStackParticipantIdentifierForParticipant:(id)a4
{
  return 22;
}

- (id)platterHomeGestureManager:(id)a3 orderedParticipants:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allPresentables");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v11 = (void *)objc_msgSend(v5, "mutableCopy");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v17, (_QWORD)v20))
          {
            objc_msgSend(v10, "addObject:", v17);
            objc_msgSend(v11, "removeObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v18);

  }
  return v10;
}

- (id)platterHomeGestureManager:(id)a3 windowForParticipant:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)platterHomeGestureManager:(id)a3 gestureRecognizerPriorityAssertionForParticipant:(id)a4 reason:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBBannerManager acquireGestureRecognizerPriorityAssertionForPresentable:priority:reason:](self, "acquireGestureRecognizerPriorityAssertionForPresentable:priority:reason:", v7, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)platterHomeGestureManager:(id)a3 participantOwningHomeGestureDidChange:(id)a4
{
  id v6;
  void *v7;
  int v8;
  SBBannerManager *v9;
  NSMapTable *presentableHomeGestureParticipantsToGesturePriorityAssertions;
  void *v11;
  void *v12;
  void *v13;
  NSMapTable *v14;
  uint64_t v15;
  NSMapTable *v16;
  NSMapTable *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(v6, "presentableHomeGestureContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "homeGestureContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  v8 = objc_msgSend(v7, "ownsHomeGesture");
  v9 = self;
  objc_sync_enter(v9);
  presentableHomeGestureParticipantsToGesturePriorityAssertions = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
  if (v8)
  {
    -[NSMapTable objectForKey:](presentableHomeGestureParticipantsToGesturePriorityAssertions, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("platter participant acquired home gesture: %@"), v6, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _acquireGestureRecognizerPriorityAssertionWithPriority:windowScene:reason:](v9, "_acquireGestureRecognizerPriorityAssertionWithPriority:windowScene:reason:", 1, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
      v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions = (NSMapTable *)v15;

      v14 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
    }
    -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v13, v6);
  }
  else
  {
    -[NSMapTable objectForKey:](presentableHomeGestureParticipantsToGesturePriorityAssertions, "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");
    -[NSMapTable removeObjectForKey:](v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions, "removeObjectForKey:", v6);
    if (!-[NSMapTable count](v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions, "count"))
    {
      v17 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
      v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions = 0;

    }
  }

  objc_sync_exit(v9);
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topPresentables");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v13);
        if (!v16)
        {
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend(v19, "shouldAcquireWindowLevelAssertion"))
          {
            -[SBWindowLevelAssertionManager acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:](self->_windowLevelAssertionManager, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", a3, v10, v11, a4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4
{
  -[SBBannerManager _updateWindowLevelForScene:](self, "_updateWindowLevelForScene:", a4);
}

+ (id)_defaultAuthorizedBundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("BannersAuthorizedBundleIDs"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.SOSBuddy"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_bannerControllerForWindowScene:(id)a3
{
  return (id)objc_msgSend(a3, "bannerController");
}

- (id)_presenterForWindowScene:(id)a3
{
  void *v3;
  void *v4;

  -[SBBannerManager _bannerControllerForWindowScene:](self, "_bannerControllerForWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_presenterForPresentable:(id)a3
{
  id v4;
  SBBannerManager *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5->_windowScenesToBannerControllers;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v6);
      -[SBBannerManager _presenterForWindowScene:](v5, "_presenterForWindowScene:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allPresentables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (id)_contentViewControllerForWindowScene:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)_windowForPresenter:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_bannerWindowForWindowScene:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SBBannerManager *v7;
  SBBannerWindow *v8;
  BOOL v9;
  int v10;
  SBTraitsWindowParticipantDelegate *v11;
  SBTraitsWindowParticipantDelegate *windowParticipantDelegate;
  uint64_t v13;
  NSMapTable *windowScenesToTraitsParticipant;
  void *v15;
  void *v16;
  NSMapTable *windowScenesToBannerWindows;
  uint64_t v18;
  NSMapTable *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  SBBannerWindow *v25;
  SBBannerWindow *v26;
  SBBannerWindow *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[NSMapTable objectForKey:](v7->_windowScenesToBannerWindows, "objectForKey:", v6);
    v8 = (SBBannerWindow *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 1;
    else
      v9 = !v4;
    if (!v9)
    {
      v10 = SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleBanner"));
      if (v10)
      {
        v8 = -[SBBannerWindow initWithWindowScene:]([SBBannerWindow alloc], "initWithWindowScene:", v6);
        if (!v7->_windowParticipantDelegate)
        {
          v11 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
          windowParticipantDelegate = v7->_windowParticipantDelegate;
          v7->_windowParticipantDelegate = v11;

        }
        if (!v7->_windowScenesToTraitsParticipant)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v13 = objc_claimAutoreleasedReturnValue();
          windowScenesToTraitsParticipant = v7->_windowScenesToTraitsParticipant;
          v7->_windowScenesToTraitsParticipant = (NSMapTable *)v13;

        }
        objc_msgSend(v6, "traitsArbiter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "acquireParticipantWithRole:delegate:", CFSTR("SBTraitsParticipantRoleBanner"), v7->_windowParticipantDelegate);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBTraitsWindowParticipantDelegate setParticipant:ownedByWindow:](v7->_windowParticipantDelegate, "setParticipant:ownedByWindow:", v16, v8);
        -[SBTraitsWindowParticipantDelegate windowDidUpdatePreferredWindowLevel:ownedParticipant:](v7->_windowParticipantDelegate, "windowDidUpdatePreferredWindowLevel:ownedParticipant:", v16, *MEMORY[0x1E0CEBBD0] + 40.0);
        objc_msgSend(v16, "setNeedsUpdatePreferencesWithReason:", CFSTR("Setup"));
        -[NSMapTable setObject:forKey:](v7->_windowScenesToTraitsParticipant, "setObject:forKey:", v16, v6);

      }
      else
      {
        v8 = -[SBOldBannerWindow initWithWindowScene:]([SBOldBannerWindow alloc], "initWithWindowScene:", v6);
      }
      windowScenesToBannerWindows = v7->_windowScenesToBannerWindows;
      if (!windowScenesToBannerWindows)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v7->_windowScenesToBannerWindows;
        v7->_windowScenesToBannerWindows = (NSMapTable *)v18;

        windowScenesToBannerWindows = v7->_windowScenesToBannerWindows;
      }
      -[NSMapTable setObject:forKey:](windowScenesToBannerWindows, "setObject:forKey:", v8, v6);
      -[SBBannerManager _presenterForWindowScene:](v7, "_presenterForWindowScene:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v21 = objc_opt_class();
        v22 = v20;
        if (v21)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v23 = v22;
          else
            v23 = 0;
        }
        else
        {
          v23 = 0;
        }
        v27 = v23;

        -[SBBannerWindow setRootViewController:](v8, "setRootViewController:", v27);
      }
      else
      {
        v24 = objc_opt_class();
        v25 = v8;
        if (v24)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
        }
        else
        {
          v26 = 0;
        }
        v27 = v26;

        v28 = objc_opt_class();
        v29 = v20;
        if (v28)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v30 = v29;
          else
            v30 = 0;
        }
        else
        {
          v30 = 0;
        }
        v31 = v30;

        -[SBBannerWindow setContentViewController:](v27, "setContentViewController:", v31);
      }

      -[SBBannerManager _updateWindowLevelForScene:](v7, "_updateWindowLevelForScene:", v6);
      -[SBBannerManager _acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:](v7, "_acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:", v6);

    }
    objc_sync_exit(v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_bannerWindowForWindowScene:(id)a3
{
  return -[SBBannerManager _bannerWindowForWindowScene:creatingIfNecessary:](self, "_bannerWindowForWindowScene:creatingIfNecessary:", a3, 0);
}

- (id)_windowSceneForBannerController:(id)a3
{
  id v4;
  SBBannerManager *v5;
  NSMapTable *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  _BOOL4 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5->_windowScenesToBannerControllers;
    v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          -[NSMapTable objectForKey:](v5->_windowScenesToBannerControllers, "objectForKey:", v10, (_QWORD)v14);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v11 == v4;

          if (v12)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_windowSceneForPresenter:(id)a3
{
  id v4;
  SBBannerManager *v5;
  NSMapTable *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5->_windowScenesToBannerControllers;
    v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          -[NSMapTable objectForKey:](v5->_windowScenesToBannerControllers, "objectForKey:", v10, (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "presenter");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = v12 == v4;

          if (v13)
          {
            v7 = v10;

            goto LABEL_12;
          }

        }
        v7 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_layoutDescriptionWithBounds:(CGRect)a3 inWindowScene:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MinY;
  void *v31;
  CGFloat v33;
  CGFloat v34;
  CGRect v35;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[SBBannerManager layoutManagerInWindowScene:](self, "layoutManagerInWindowScene:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = width;
  v34 = height;
  objc_msgSend(v10, "useableContainerFrameInContainerBounds:onScreen:", v11, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v9, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "scale");
  objc_msgSend(v10, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v17, v19, v13, v15, v17, v19, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, v21);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v35.origin.x = v23;
  v35.origin.y = v25;
  v35.size.width = v27;
  v35.size.height = v29;
  MinY = CGRectGetMinY(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = v33;
  v36.size.height = v34;
  objc_msgSend(MEMORY[0x1E0D01078], "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:offsetFromPresentationEdge:", v27, v29, v17, v19, MinY - CGRectGetMinY(v36));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)_updateWindowLevelForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBBannerManager _bannerWindowForWindowScene:](self, "_bannerWindowForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowLevelAssertionManager highestPriorityWindowLevelAssertionForWindowScene:](self->_windowLevelAssertionManager, "highestPriorityWindowLevelAssertionForWindowScene:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowLevel");
  v8 = v7;
  if (v6)
    objc_msgSend(v6, "windowLevel");
  else
    v9 = *MEMORY[0x1E0CEBBD0] + 40.0;
  objc_msgSend(v5, "setWindowLevel:", v9);
  objc_msgSend(v5, "windowLevel");
  if (v10 != v8)
  {
    SBLogBanners();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Updated banner window level using assertion: banner window: %{public}@; assertion: %{public}@",
        buf,
        0x16u);
    }

    v12 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__SBBannerManager__updateWindowLevelForScene___block_invoke;
    v14[3] = &unk_1E8EBCC48;
    v14[4] = self;
    v15 = v5;
    -[SBBannerManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_bannerManager_didUpdateWindowLevelOfWindow_, v14);
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __46__SBBannerManager__updateWindowLevelForScene___block_invoke_2;
    v13[3] = &unk_1E8EBCC70;
    v13[4] = self;
    -[SBBannerManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_bannerManagerDidUpdateWindowLevel_, v13);

  }
}

uint64_t __46__SBBannerManager__updateWindowLevelForScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:didUpdateWindowLevelOfWindow:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __46__SBBannerManager__updateWindowLevelForScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bannerManagerDidUpdateWindowLevel:", *(_QWORD *)(a1 + 32));
}

- (id)_panGestureInWindowScene:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SBBannerManager *v7;
  SBBannerPanGestureRecognizer *v8;
  BOOL v9;
  SBBannerPanGestureRecognizer *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMapTable *windowScenesToPanGestures;
  uint64_t v16;
  NSMapTable *v17;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[NSMapTable objectForKey:](v7->_windowScenesToPanGestures, "objectForKey:", v6);
    v8 = (SBBannerPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = 1;
    else
      v9 = !v4;
    if (!v9)
    {
      v10 = objc_alloc_init(SBBannerPanGestureRecognizer);
      -[SBBannerPanGestureRecognizer setWindowScene:](v10, "setWindowScene:", v6);
      v8 = v10;
      -[SBBannerPanGestureRecognizer setSystemDragCancellingDelegate:](v8, "setSystemDragCancellingDelegate:", v7);
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        -[SBBannerPanGestureRecognizer setAllowedScrollTypesMask:](v8, "setAllowedScrollTypesMask:", 3);
      -[SBBannerPanGestureRecognizer allowedTouchTypes](v8, "allowedTouchTypes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "removeObject:", &unk_1E91D1F70);
      -[SBBannerPanGestureRecognizer setAllowedTouchTypes:](v8, "setAllowedTouchTypes:", v14);
      -[SBBannerPanGestureRecognizer setName:](v8, "setName:", CFSTR("bannerPan"));
      windowScenesToPanGestures = v7->_windowScenesToPanGestures;
      if (!windowScenesToPanGestures)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v7->_windowScenesToPanGestures;
        v7->_windowScenesToPanGestures = (NSMapTable *)v16;

        windowScenesToPanGestures = v7->_windowScenesToPanGestures;
      }
      -[NSMapTable setObject:forKey:](windowScenesToPanGestures, "setObject:forKey:", v8, v6);

    }
    objc_sync_exit(v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_panGestureInWindowScene:(id)a3
{
  return -[SBBannerManager _panGestureInWindowScene:creatingIfNecessary:](self, "_panGestureInWindowScene:creatingIfNecessary:", a3, 0);
}

- (void)_updateGesturePriorityForGestureRecognizerInWindowScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableArray bs_firstObjectPassingTest:](self->_gesturePriorityAssertions, "bs_firstObjectPassingTest:", &__block_literal_global_157_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "priority");
  -[SBBannerManager _panGestureInWindowScene:creatingIfNecessary:](self, "_panGestureInWindowScene:creatingIfNecessary:", v4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    -[SBBannerManager _panGestureInWindowScene:creatingIfNecessary:](self, "_panGestureInWindowScene:creatingIfNecessary:", v4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "systemGestureManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (!v7 || (v6 == 0) != objc_msgSend(v8, "sb_isInstalledAsSystemGesture")))
  {
    SBLogBanners();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v11)
      {
        v14 = 138543618;
        v15 = v8;
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to default using assertion: gestureRecognizer: %{public}@; assertion: %{public}@",
          (uint8_t *)&v14,
          0x16u);
      }

      if (objc_msgSend(v8, "sb_isInstalledAsSystemGesture"))
        objc_msgSend(v9, "removeGestureRecognizer:", v8);
      -[SBBannerManager _bannerWindowForWindowScene:](self, "_bannerWindowForWindowScene:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addGestureRecognizer:", v8);

      goto LABEL_16;
    }
    if (v11)
    {
      v14 = 138543618;
      v15 = v8;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to system using assertion: gestureRecognizer: %{public}@; assertion: %{public}@",
        (uint8_t *)&v14,
        0x16u);
    }

    objc_msgSend(v8, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeGestureRecognizer:", v8);

    if (objc_msgSend(v9, "isValid"))
    {
      objc_msgSend(v9, "addGestureRecognizer:withType:", v8, 110);
LABEL_16:
      objc_msgSend(v8, "sb_setInstalledAsSystemGesture:", v6 == 0);
    }
  }

}

uint64_t __75__SBBannerManager__updateGesturePriorityForGestureRecognizerInWindowScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

- (void)_setWindowScene:(id)a3 forGestureRecognizerPriorityAssertion:(id)a4
{
  id v6;
  SBBannerManager *v7;
  NSMapTable *gesturePriorityAssertionsToWindowScenes;
  uint64_t v9;
  NSMapTable *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    gesturePriorityAssertionsToWindowScenes = v7->_gesturePriorityAssertionsToWindowScenes;
    if (!gesturePriorityAssertionsToWindowScenes)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v7->_gesturePriorityAssertionsToWindowScenes;
      v7->_gesturePriorityAssertionsToWindowScenes = (NSMapTable *)v9;

      gesturePriorityAssertionsToWindowScenes = v7->_gesturePriorityAssertionsToWindowScenes;
    }
    -[NSMapTable setObject:forKey:](gesturePriorityAssertionsToWindowScenes, "setObject:forKey:", v11, v6);
    -[SBBannerManager _updateGesturePriorityForGestureRecognizerInWindowScene:](v7, "_updateGesturePriorityForGestureRecognizerInWindowScene:", v11);
    objc_sync_exit(v7);

  }
}

- (id)_acquireGestureRecognizerPriorityAssertionWithPriority:(int64_t)a3 windowScene:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  SBBannerManager *v11;
  NSMutableArray *gesturePriorityAssertions;
  uint64_t v13;
  id v14;
  SBBannerGestureRecognizerPriorityAssertion *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  id v22;
  void *v24;
  void *v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v9 = a4;
  v10 = a5;
  if (+[SBBannerGestureRecognizerPriorityAssertion isValidBannerGestureRecognizerPriority:](SBBannerGestureRecognizerPriorityAssertion, "isValidBannerGestureRecognizerPriority:", a3))
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 1139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[SBBannerGestureRecognizerPriorityAssertion isValidBannerGestureRecognizerPriority:priority]"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 1140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__101;
  v43 = __Block_byref_object_dispose__101;
  v44 = 0;
  v11 = self;
  objc_sync_enter(v11);
  gesturePriorityAssertions = v11->_gesturePriorityAssertions;
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke;
  v36[3] = &unk_1E8EBCCD8;
  v14 = v10;
  v37 = v14;
  v38 = &v39;
  -[NSMutableArray enumerateObjectsUsingBlock:](gesturePriorityAssertions, "enumerateObjectsUsingBlock:", v36);
  if (!v40[5])
  {
    objc_initWeak(&location, v11);
    v15 = [SBBannerGestureRecognizerPriorityAssertion alloc];
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2;
    v33[3] = &unk_1E8EBCD00;
    objc_copyWeak(&v34, &location);
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_165;
    v31[3] = &unk_1E8EBCD00;
    objc_copyWeak(&v32, &location);
    v16 = -[SBBannerGestureRecognizerPriorityAssertion initWithPriority:reason:enablementChangeHandler:invalidationHandler:](v15, "initWithPriority:reason:enablementChangeHandler:invalidationHandler:", a3, v14, v33, v31);
    v17 = (void *)v40[5];
    v40[5] = v16;

    v18 = v11->_gesturePriorityAssertions;
    if (!v18)
    {
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = v11->_gesturePriorityAssertions;
      v11->_gesturePriorityAssertions = v19;

      v18 = v11->_gesturePriorityAssertions;
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v30 = -[NSMutableArray count](v18, "count");
    v21 = v11->_gesturePriorityAssertions;
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2_166;
    v26[3] = &unk_1E8EBCD28;
    v26[4] = &v27;
    v26[5] = a3;
    -[NSMutableArray enumerateObjectsUsingBlock:](v21, "enumerateObjectsUsingBlock:", v26);
    -[NSMutableArray insertObject:atIndex:](v11->_gesturePriorityAssertions, "insertObject:atIndex:", v40[5], v28[3]);
    if (v9)
      -[SBBannerManager _setWindowScene:forGestureRecognizerPriorityAssertion:](v11, "_setWindowScene:forGestureRecognizerPriorityAssertion:", v9, v40[5]);
    _Block_object_dispose(&v27, 8);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v11);
  v22 = (id)v40[5];
  _Block_object_dispose(&v39, 8);

  return v22;
}

void __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogBanners();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Gesture recognizer priority assertion enablement did change: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[10], "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateGesturePriorityForGestureRecognizerInWindowScene:", v7);

  }
}

void __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_165(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained[9], "containsObject:", v8))
  {
    objc_msgSend(v4[9], "removeObject:", v8);
    if (!objc_msgSend(v4[9], "count"))
    {
      v5 = v4[9];
      v4[9] = 0;

    }
    objc_msgSend(v4[10], "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[10], "removeObjectForKey:", v8);
    if (!objc_msgSend(v4[10], "count"))
    {
      v7 = v4[10];
      v4[10] = 0;

    }
    objc_msgSend(v4, "_updateGesturePriorityForGestureRecognizerInWindowScene:", v6);

  }
}

uint64_t __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2_166(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(a2, "priority");
  if (v7 < result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_invalidatePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:(id)a3
{
  id v4;
  SBBannerManager *v5;
  void *v6;
  NSMapTable *windowScenesToPresenterVisibilityGesturePriorityAssertions;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");
    if (!-[NSMapTable count](v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions, "count"))
    {
      windowScenesToPresenterVisibilityGesturePriorityAssertions = v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
      v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions = 0;

    }
    objc_sync_exit(v5);

    v4 = v8;
  }

}

- (void)_acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:(id)a3
{
  SBBannerManager *v4;
  NSMapTable *windowScenesToPresenterVisibilityGesturePriorityAssertions;
  uint64_t v6;
  NSMapTable *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = self;
    objc_sync_enter(v4);
    windowScenesToPresenterVisibilityGesturePriorityAssertions = v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
    if (!windowScenesToPresenterVisibilityGesturePriorityAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
      v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions = (NSMapTable *)v6;

      windowScenesToPresenterVisibilityGesturePriorityAssertions = v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
    }
    -[SBBannerManager _acquireGestureRecognizerPriorityAssertionWithPriority:windowScene:reason:](v4, "_acquireGestureRecognizerPriorityAssertionWithPriority:windowScene:reason:", 1, v9, CFSTR("presenter relinquishes visibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](windowScenesToPresenterVisibilityGesturePriorityAssertions, "setObject:forKey:", v8, v9);

    objc_sync_exit(v4);
  }

}

- (BOOL)_isPresentableHUD:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "presentableType") == 1;

  return v4;
}

- (BOOL)_isPresentableNotice:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "presentableBehavior") == 1
    || -[SBBannerManager _isPresentableHUD:](self, "_isPresentableHUD:", v4);

  return v5;
}

- (BOOL)_shouldHideStatusBarForPresentable:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;

  v4 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v5 = !-[SBBannerManager _isPresentableNotice:](self, "_isPresentableNotice:", v4);
      goto LABEL_10;
    }
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
    LOBYTE(v5) = 0;
  else
    v5 = !-[SBBannerManager _isPresentableNotice:](self, "_isPresentableNotice:", v4);

LABEL_10:
  return v5;
}

- (id)_statusBarAssertionReasonForPresentable:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requesterIdentifier", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(v3, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_hideStatusBarIfNecessaryForPresentable:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableSet *statusBarAssertionReasons;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  BSInvalidatable *v16;
  BSInvalidatable *systemStatusBarAssertion;
  void *v18;
  void *v19;
  BSInvalidatable *v20;
  BSInvalidatable *appsStatusBarAssertion;
  NSObject *v22;
  NSMutableSet *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  NSMutableSet *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 && -[SBBannerManager _shouldHideStatusBarForPresentable:](self, "_shouldHideStatusBarForPresentable:", v5))
  {
    -[SBBannerManager _statusBarAssertionReasonForPresentable:](self, "_statusBarAssertionReasonForPresentable:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](self->_statusBarAssertionReasons, "containsObject:", v6) & 1) == 0)
    {
      SBLogBanners();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BNEffectivePresentableDescription();
        v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Hiding status bar for presentable: %{public}@", buf, 0xCu);

      }
      if (!-[NSMutableSet count](self->_statusBarAssertionReasons, "count"))
      {
        if (!self->_statusBarAssertionReasons)
        {
          v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          statusBarAssertionReasons = self->_statusBarAssertionReasons;
          self->_statusBarAssertionReasons = v9;

        }
        if (self->_systemStatusBarAssertion)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 1249, CFSTR("We have a system status bar assertion, but no reasons: %@"), self->_systemStatusBarAssertion);

        }
        if (self->_appsStatusBarAssertion)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 1250, CFSTR("We have an apps status bar assertion, but no reasons: %@"), self->_appsStatusBarAssertion);

        }
        SBLogBanners();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Hiding status bar", buf, 2u);
        }

        +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "assertionManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (BSInvalidatable *)objc_msgSend(v13, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 12, v15);
        systemStatusBarAssertion = self->_systemStatusBarAssertion;
        self->_systemStatusBarAssertion = v16;

        -[BSInvalidatable acquire](self->_systemStatusBarAssertion, "acquire");
        -[SBBannerManager windowSceneForPresentable:](self, "windowSceneForPresentable:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "switcherController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "requestInAppStatusBarHiddenAssertionForReason:animated:", CFSTR("SBNotificationBannerDestination"), 0);
        v20 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        appsStatusBarAssertion = self->_appsStatusBarAssertion;
        self->_appsStatusBarAssertion = v20;

      }
      SBLogBanners();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_statusBarAssertionReasons;
        *(_DWORD *)buf = 138543362;
        v27 = v23;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Status bar hidden: %{public}@", buf, 0xCu);
      }

      -[NSMutableSet addObject:](self->_statusBarAssertionReasons, "addObject:", v6);
    }

  }
}

- (void)_revealStatusBarIfNecessaryForPresentable:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *v8;
  NSObject *appsStatusBarAssertion;
  NSMutableSet *statusBarAssertionReasons;
  NSObject *v11;
  BSInvalidatable *systemStatusBarAssertion;
  void *v13;
  void *v14;
  uint8_t buf[4];
  NSMutableSet *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 && -[SBBannerManager _shouldHideStatusBarForPresentable:](self, "_shouldHideStatusBarForPresentable:", v5))
  {
    -[SBBannerManager _statusBarAssertionReasonForPresentable:](self, "_statusBarAssertionReasonForPresentable:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_statusBarAssertionReasons, "containsObject:", v6))
    {
      SBLogBanners();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BNEffectivePresentableDescription();
        v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Revealing status bar for presentable: %{public}@", buf, 0xCu);

      }
      -[NSMutableSet removeObject:](self->_statusBarAssertionReasons, "removeObject:", v6);
      if (-[NSMutableSet count](self->_statusBarAssertionReasons, "count"))
      {
        SBLogBanners();
        appsStatusBarAssertion = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(appsStatusBarAssertion, OS_LOG_TYPE_DEFAULT))
        {
          statusBarAssertionReasons = self->_statusBarAssertionReasons;
          *(_DWORD *)buf = 138543362;
          v16 = statusBarAssertionReasons;
          _os_log_impl(&dword_1D0540000, appsStatusBarAssertion, OS_LOG_TYPE_DEFAULT, "Status bar hidden: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (!self->_systemStatusBarAssertion)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 1271, CFSTR("We have a reason, but no system status bar assertion: %@"), self->_systemStatusBarAssertion);

        }
        if (!self->_appsStatusBarAssertion)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBannerManager.m"), 1272, CFSTR("We have a reason, but no apps status bar assertion: %@"), self->_appsStatusBarAssertion);

        }
        SBLogBanners();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Revealing status bar", buf, 2u);
        }

        -[BSInvalidatable invalidate](self->_systemStatusBarAssertion, "invalidate");
        systemStatusBarAssertion = self->_systemStatusBarAssertion;
        self->_systemStatusBarAssertion = 0;

        -[BSInvalidatable invalidate](self->_appsStatusBarAssertion, "invalidate");
        appsStatusBarAssertion = self->_appsStatusBarAssertion;
        self->_appsStatusBarAssertion = 0;
      }

    }
  }

}

- (id)_platterHomeGestureManager
{
  SBPlatterHomeGestureManager *v3;
  SBPlatterHomeGestureManager *platterHomeGestureManager;

  if (SBFEffectiveHomeButtonType() == 2 && !self->_platterHomeGestureManager)
  {
    v3 = -[SBPlatterHomeGestureManager initWithDelegate:]([SBPlatterHomeGestureManager alloc], "initWithDelegate:", self);
    platterHomeGestureManager = self->_platterHomeGestureManager;
    self->_platterHomeGestureManager = v3;

  }
  return self->_platterHomeGestureManager;
}

- (id)_homeGestureContextForPresentable:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBBannerManager _platterHomeGestureManager](self, "_platterHomeGestureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerParticipant:windowScene:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_unregisterHomeGestureContextForPresentable:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBPlatterHomeGestureManager unregisterParticipant:](self->_platterHomeGestureManager, "unregisterParticipant:", v4);

}

- (id)_zStackParticipantForWindowScene:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *windowScenesToZStackParticipants;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_windowScenesToZStackParticipants, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (!self->_windowScenesToZStackParticipants)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        windowScenesToZStackParticipants = self->_windowScenesToZStackParticipants;
        self->_windowScenesToZStackParticipants = v6;

      }
      objc_msgSend(v4, "zStackResolver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "acquireParticipantWithIdentifier:delegate:", 23, self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_windowScenesToZStackParticipants, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_zStackPolicyAssistantForWindowScene:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *windowScenesToPhysicalButtonAssistants;

  v4 = a3;
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_windowScenesToPhysicalButtonAssistants, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (!self->_windowScenesToPhysicalButtonAssistants)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        windowScenesToPhysicalButtonAssistants = self->_windowScenesToPhysicalButtonAssistants;
        self->_windowScenesToPhysicalButtonAssistants = v6;

      }
      v5 = -[SBPhysicalButtonZStackPolicyAssistant initWithDelegate:]((id *)[SBPhysicalButtonZStackPolicyAssistant alloc], self);
      -[NSMapTable setObject:forKey:](self->_windowScenesToPhysicalButtonAssistants, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_zStackPolicyAssistantForParticipant:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable keyEnumerator](self->_windowScenesToPhysicalButtonAssistants, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        -[NSMapTable objectForKey:](self->_windowScenesToZStackParticipants, "objectForKey:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  -[SBBannerManager _zStackPolicyAssistantForWindowScene:](self, "_zStackPolicyAssistantForWindowScene:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_zStackParticipantForAssistant:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable keyEnumerator](self->_windowScenesToPhysicalButtonAssistants, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        -[NSMapTable objectForKey:](self->_windowScenesToPhysicalButtonAssistants, "objectForKey:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  -[SBBannerManager _zStackParticipantForWindowScene:](self, "_zStackParticipantForWindowScene:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_updatePolicyAssistantForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBBannerManager _zStackParticipantForWindowScene:](self, "_zStackParticipantForWindowScene:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16 = v5;
    -[SBBannerManager _zStackPolicyAssistantForWindowScene:](self, "_zStackPolicyAssistantForWindowScene:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v4);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topPresentables");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v12, "targetSceneForPhysicalButtonInteraction");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              if (!v9)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v9, "addObject:", v13);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    -[SBPhysicalButtonZStackPolicyAssistant setForegroundScenes:]((uint64_t)v15, v9);
    v5 = v16;
  }

}

- (void)_updateZStackPolicyAssistantForWindowScene:(id)a3 reasonSuffix:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v7 = a3;
  v8 = a5;
  -[SBBannerManager _zStackParticipantForWindowScene:](self, "_zStackParticipantForWindowScene:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke;
    v13[3] = &unk_1E8EA1AD8;
    v13[4] = self;
    v14 = v7;
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke_2;
    v11[3] = &unk_1E8EA1AD8;
    v11[4] = self;
    v12 = v14;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, v11);

  }
}

uint64_t __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyAssistantForWindowScene:", *(_QWORD *)(a1 + 40));
}

uint64_t __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePolicyAssistantForWindowScene:", *(_QWORD *)(a1 + 40));
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (-[NSHashTable count](self->_transitionObservers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_transitionObservers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_systemApertureInsetsDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBSystemApertureEdgeInsets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "UIEdgeInsetsValue");
  if (self->_additionalEdgeInsets.top != v6)
  {
    self->_additionalEdgeInsets.top = v6;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMapTable keyEnumerator](self->_windowScenesToBannerControllers, "keyEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "isMainDisplayWindowScene"))
          {
            -[SBBannerManager _bannerControllerForWindowScene:](self, "_bannerControllerForWindowScene:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "presenter");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_opt_respondsToSelector();

            if ((v15 & 1) != 0)
            {
              objc_msgSend(v13, "presenter");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "preferredMinimumTopInsetDidInvalidate");

            }
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (SBPresentableIntercepting)presentableInterceptor
{
  return (SBPresentableIntercepting *)objc_loadWeakRetained((id *)&self->_presentableInterceptor);
}

- (void)setPresentableInterceptor:(id)a3
{
  objc_storeWeak((id *)&self->_presentableInterceptor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentableInterceptor);
  objc_storeStrong((id *)&self->_windowParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_windowScenesToTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_presentableHomeGestureParticipantsToGesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_platterHomeGestureManager, 0);
  objc_storeStrong((id *)&self->_statusBarAssertionReasons, 0);
  objc_storeStrong((id *)&self->_appsStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_systemStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_clientSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_transitionObservers, 0);
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_storeStrong((id *)&self->_windowScenesToPresenterVisibilityGesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_presentablesToGesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_gesturePriorityAssertionsToWindowScenes, 0);
  objc_storeStrong((id *)&self->_gesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_windowScenesToPhysicalButtonAssistants, 0);
  objc_storeStrong((id *)&self->_windowScenesToZStackParticipants, 0);
  objc_storeStrong((id *)&self->_windowScenesToPanGestures, 0);
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, 0);
  objc_storeStrong((id *)&self->_bannerSourceListener, 0);
  objc_storeStrong((id *)&self->_windowScenesToBannerWindows, 0);
  objc_storeStrong((id *)&self->_windowScenesToBannerControllers, 0);
  objc_storeStrong((id *)&self->_bannerAuthority, 0);
}

- (id)newBannerControllerForWindowScene:(id)a3
{
  id v5;
  SBBannerManager *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMapTable *windowScenesToBannerControllers;
  uint64_t v11;
  NSMapTable *v12;
  void *v13;
  void *v15;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[NSMapTable objectForKey:](v6->_windowScenesToBannerControllers, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBBannerManager.m"), 1430, CFSTR("Already have a banner controller for this scene: bannerController: %@; scene: %@"),
        v7,
        v5);

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01090]), "initWithAuthority:", v6->_bannerAuthority);
    objc_msgSend(v8, "setDelegate:", v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01060]), "initWithAuthority:pender:presenter:", v6->_bannerAuthority, 0, v8);

    objc_msgSend(v8, "setPoster:", v9);
    windowScenesToBannerControllers = v6->_windowScenesToBannerControllers;
    if (!windowScenesToBannerControllers)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v6->_windowScenesToBannerControllers;
      v6->_windowScenesToBannerControllers = (NSMapTable *)v11;

      windowScenesToBannerControllers = v6->_windowScenesToBannerControllers;
    }
    -[NSMapTable setObject:forKey:](windowScenesToBannerControllers, "setObject:forKey:", v9, v5);
    if (-[NSHashTable count](v6->_suppressionAssertions, "count"))
      objc_msgSend(v9, "setSuspended:forReason:revokingCurrent:error:", 1, CFSTR("Banner manager suppression assertion"), 0, 0);
    objc_msgSend(v5, "ambientPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v6);

    objc_sync_exit(v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
