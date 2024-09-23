@implementation UIKeyShortcutHUDService

- (void)handleTouchEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "type");
    v5 = v7;
    if (!v6)
    {
      -[UIKeyShortcutHUDService _cancelAllScheduledHUDPresentationsIfNeeded](self, "_cancelAllScheduledHUDPresentationsIfNeeded");
      v5 = v7;
    }
  }

}

- (void)_cancelAllScheduledHUDPresentationsIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (-[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState") == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("UIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotificationName"), 0, 0, 0);
  }
}

- (void)dismissOrCancelHUDPresentationIfNeeded
{
  int64_t v3;

  v3 = -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState");
  if ((unint64_t)(v3 - 2) >= 2)
  {
    if (v3 == 1)
      -[UIKeyShortcutHUDService _discardScheduledHUDBookkeeping](self, "_discardScheduledHUDBookkeeping");
  }
  else
  {
    -[UIKeyShortcutHUDService _requestHUDDismissal](self, "_requestHUDDismissal");
  }
  -[UIKeyShortcutHUDService _removePresentationObserversIfNeeded](self, "_removePresentationObserversIfNeeded");
}

- (int64_t)hudPresentationState
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;

  -[UIKeyShortcutHUDService scheduledHUDTimer](self, "scheduledHUDTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIKeyShortcutHUDService scheduledHUDTimer](self, "scheduledHUDTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

    if ((v6 & 1) != 0)
      return 1;
  }
  -[UIKeyShortcutHUDService session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return 3;
  else
    return *(_BYTE *)&self->_flags & 2;
}

- (_UIKeyShortcutHUDClientSession)session
{
  return self->_session;
}

- (NSTimer)scheduledHUDTimer
{
  return self->_scheduledHUDTimer;
}

+ (UIKeyShortcutHUDService)_existingHUDService
{
  return (UIKeyShortcutHUDService *)(id)qword_1ECD7EBB8;
}

+ (UIKeyShortcutHUDService)sharedHUDService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIKeyShortcutHUDService_sharedHUDService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7EBC0 != -1)
    dispatch_once(&qword_1ECD7EBC0, block);
  return (UIKeyShortcutHUDService *)(id)qword_1ECD7EBB8;
}

- (void)_removePresentationObserversIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, 0x1E1761BE0, UIApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIApplicationUserDidTakeScreenshotNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  }
}

void __43__UIKeyShortcutHUDService_sharedHUDService__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD7EBB8;
  qword_1ECD7EBB8 = v0;

}

- (UIKeyShortcutHUDService)init
{
  UIKeyShortcutHUDService *v2;
  UIKeyShortcutHUDService *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyShortcutHUDService;
  v2 = -[UIKeyShortcutHUDService init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIKeyShortcutHUDService setMetricsProvider:](v2, "setMetricsProvider:", v2);
    if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
    {
      v4 = (void *)objc_opt_new();
      -[UIKeyShortcutHUDService setOverlayService:](v3, "setOverlayService:", v4);

      -[UIKeyShortcutHUDService overlayService](v3, "overlayService");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDelegate:", v3);

      -[UIKeyShortcutHUDService overlayService](v3, "overlayService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "prewarmConnection");

    }
    -[UIKeyShortcutHUDService _registerForScheduledHUDCancellationDarwinNotifications](v3, "_registerForScheduledHUDCancellationDarwinNotifications");
    -[UIKeyShortcutHUDService _registerForSystemHUDPresentationDarwinNotifications](v3, "_registerForSystemHUDPresentationDarwinNotifications");
    -[UIKeyShortcutHUDService _registerForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded](v3, "_registerForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIKeyShortcutHUDService _unregisterForScheduledHUDCancellationDarwinNotifications](self, "_unregisterForScheduledHUDCancellationDarwinNotifications");
  -[UIKeyShortcutHUDService _unregisterForSystemHUDPresentationDarwinNotifications](self, "_unregisterForSystemHUDPresentationDarwinNotifications");
  -[UIKeyShortcutHUDService _unregisterForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded](self, "_unregisterForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyShortcutHUDService;
  -[UIKeyShortcutHUDService dealloc](&v3, sel_dealloc);
}

- (void)_registerForScheduledHUDCancellationDarwinNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleUIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotification, CFSTR("UIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotificationName"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForScheduledHUDCancellationDarwinNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("UIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotificationName"), 0);
}

- (void)_registerForSystemHUDPresentationDarwinNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleUIKeyShortcutSystemHUDDidPresentDarwinNotification, CFSTR("UIKeyShortcutSystemHUDDidPresentDarwinNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForSystemHUDPresentationDarwinNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("UIKeyShortcutSystemHUDDidPresentDarwinNotification"), 0);
}

- (void)_sendSystemHUDPresentationDarwinNotificationIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (qword_1ECD7EBE0 != -1)
    dispatch_once(&qword_1ECD7EBE0, &__block_literal_global_271_0);
  if (byte_1ECD7EBA1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("UIKeyShortcutSystemHUDDidPresentDarwinNotification"), 0, 0, 0);
  }
}

- (void)_handleSystemHUDPresentationDarwinNotification
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (qword_1ECD7EBE0 != -1)
    dispatch_once(&qword_1ECD7EBE0, &__block_literal_global_271_0);
  if (!byte_1ECD7EBA1)
  {
    _UIKeyShortcutHUDLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to non-system HUD due to system HUD presentation", v4, 2u);
    }

    +[UIKeyShortcutHUDService sharedHUDService](UIKeyShortcutHUDService, "sharedHUDService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissOrCancelHUDPresentationIfNeeded");

  }
}

- (void)_registerForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (qword_1ECD7EBE0 != -1)
    dispatch_once(&qword_1ECD7EBE0, &__block_literal_global_271_0);
  if (byte_1ECD7EBA1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleUIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotification, CFSTR("UIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotificationName"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_unregisterForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (qword_1ECD7EBE0 != -1)
    dispatch_once(&qword_1ECD7EBE0, &__block_literal_global_271_0);
  if (byte_1ECD7EBA1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("UIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotificationName"), 0);
  }
}

- (void)_sendSystemHUDPreventUnintendedPresentationDarwinNotificationIfNeeded
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (qword_1ECD7EBE0 != -1)
    dispatch_once(&qword_1ECD7EBE0, &__block_literal_global_271_0);
  if (!byte_1ECD7EBA1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("UIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotificationName"), 0, 0, 0);
  }
}

- (void)_handleSystemHUDPreventUnintendedPresentationDarwinNotificationIfNeeded
{
  if (qword_1ECD7EBE0 != -1)
    dispatch_once(&qword_1ECD7EBE0, &__block_literal_global_271_0);
  if (byte_1ECD7EBA1)
    -[UIKeyShortcutHUDService cancelScheduledHUDPresentationIfNeeded](self, "cancelScheduledHUDPresentationIfNeeded");
}

+ (BOOL)_isOOPFeatureEnabled
{
  if (qword_1ECD7EBC8 != -1)
    dispatch_once(&qword_1ECD7EBC8, &__block_literal_global_15_3);
  return _MergedGlobals_1112;
}

void __47__UIKeyShortcutHUDService__isOOPFeatureEnabled__block_invoke()
{
  id v0;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1112 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

}

- (void)requestHUDPresentationIntoSearchMode
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState");
  if (v3)
  {
    if (v3 != 1)
      return;
    -[UIKeyShortcutHUDService dismissOrCancelHUDPresentationIfNeeded](self, "dismissOrCancelHUDPresentationIfNeeded");
  }
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setPresentedModifierFlag:", 0x100000);
  objc_msgSend(v7, "setSearching:", 1);
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDService lastKeyboardEvent](self, "lastKeyboardEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDClientTraits traitsWithReferenceTraitEnvironment:referenceKeyboardEvent:](_UIKeyShortcutHUDClientTraits, "traitsWithReferenceTraitEnvironment:referenceKeyboardEvent:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientTraits:", v6);

  -[UIKeyShortcutHUDService _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:](self, "_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:", v7);
}

- (void)scheduleHUDPresentation
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _UIInertHoverGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v14[4];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDService.m"), 386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.hudPresentationState != _UIKeyShortcutHUDPresentationStateScheduled"));

  }
  -[UIKeyShortcutHUDService _addPresentationObserversIfNeeded](self, "_addPresentationObserversIfNeeded");
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = -[UIHoverGestureRecognizer initWithTarget:action:]([_UIInertHoverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleScheduledHUDPointerHover_);
        -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.ShortcutHUDDelayHover"));
        objc_msgSend(v8, "addGestureRecognizer:", v9);

        objc_msgSend(v4, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  -[UIKeyShortcutHUDService setScheduledHUDHoverGestureRecognizers:](self, "setScheduledHUDHoverGestureRecognizers:", v4);
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0C99E88];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__UIKeyShortcutHUDService_scheduleHUDPresentation__block_invoke;
  v14[3] = &unk_1E16B26E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, 0.9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDService setScheduledHUDTimer:](self, "setScheduledHUDTimer:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __50__UIKeyShortcutHUDService_scheduleHUDPresentation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "scheduledHUDConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:", v2);

    objc_msgSend(v3, "_discardScheduledHUDBookkeeping");
    WeakRetained = v3;
  }

}

- (void)_handleScheduledHUDPointerHover:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[2];

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v5, v7, v9);
  v14 = v13;
  v16 = v15;

  v17 = objc_msgSend(v4, "state");
  if ((unint64_t)(v17 - 1) <= 2)
  {
    -[UIKeyShortcutHUDService scheduledHUDInitialPointerLocation](self, "scheduledHUDInitialPointerLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[UIKeyShortcutHUDService scheduledHUDInitialPointerLocation](self, "scheduledHUDInitialPointerLocation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "CGPointValue");
      v22 = sqrt((v14 - v20) * (v14 - v20) + (v16 - v21) * (v16 - v21));

      if (v22 > 10.0)
        -[UIKeyShortcutHUDService _cancelAllScheduledHUDPresentationsIfNeeded](self, "_cancelAllScheduledHUDPresentationsIfNeeded");
    }
    else
    {
      *(double *)v24 = v14;
      *(double *)&v24[1] = v16;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v24, "{CGPoint=dd}");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyShortcutHUDService setScheduledHUDInitialPointerLocation:](self, "setScheduledHUDInitialPointerLocation:", v23);

    }
  }

}

- (void)cancelScheduledHUDPresentationIfNeeded
{
  if (-[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState") == 1)
    -[UIKeyShortcutHUDService dismissOrCancelHUDPresentationIfNeeded](self, "dismissOrCancelHUDPresentationIfNeeded");
}

- (void)_discardScheduledHUDBookkeeping
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIKeyShortcutHUDService scheduledHUDTimer](self, "scheduledHUDTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    -[UIKeyShortcutHUDService scheduledHUDTimer](self, "scheduledHUDTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
  -[UIKeyShortcutHUDService setScheduledHUDTimer:](self, "setScheduledHUDTimer:", 0);
  -[UIKeyShortcutHUDService setScheduledHUDConfiguration:](self, "setScheduledHUDConfiguration:", 0);
  -[UIKeyShortcutHUDService scheduledHUDKeyWindowScene](self, "scheduledHUDKeyWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification"), v6);

    -[UIKeyShortcutHUDService setScheduledHUDKeyWindowScene:](self, "setScheduledHUDKeyWindowScene:", 0);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIKeyShortcutHUDService scheduledHUDHoverGestureRecognizers](self, "scheduledHUDHoverGestureRecognizers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "setEnabled:", 0);
        objc_msgSend(v13, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeGestureRecognizer:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[UIKeyShortcutHUDService setScheduledHUDHoverGestureRecognizers:](self, "setScheduledHUDHoverGestureRecognizers:", 0);
  -[UIKeyShortcutHUDService setScheduledHUDInitialPointerLocation:](self, "setScheduledHUDInitialPointerLocation:", 0);

}

- (void)_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UISuppressKeyShortcutHUD, (uint64_t)CFSTR("UISuppressKeyShortcutHUD")) & 1) != 0|| !byte_1EDDA816C)
  {
    if (-[UIKeyShortcutHUDService _isHUDSupportedOnPlatform](self, "_isHUDSupportedOnPlatform")
      && -[UIKeyShortcutHUDService _isHUDAllowedToAppearForProcess](self, "_isHUDAllowedToAppearForProcess")
      && -[UIKeyShortcutHUDService _isHUDAllowedOverCurrentWindow](self, "_isHUDAllowedOverCurrentWindow")
      && -[UIKeyShortcutHUDService _isHUDAllowedForCurrentResponder](self, "_isHUDAllowedForCurrentResponder")
      && -[UIKeyShortcutHUDService _isHUDAllowedForConfiguration:](self, "_isHUDAllowedForConfiguration:", v4)
      && -[UIKeyShortcutHUDService _isHUDAllowedToBePresentedForPresentationState:](self, "_isHUDAllowedToBePresentedForPresentationState:", -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState")))
    {
      -[UIKeyShortcutHUDService _requestHUDPresentationWithUnpreparedConfiguration:](self, "_requestHUDPresentationWithUnpreparedConfiguration:", v4);
    }
  }
  else
  {
    _UIKeyShortcutHUDLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Suppressing HUD due to UISuppressKeyShortcutHUD default being enabled.", v6, 2u);
    }

  }
}

- (void)_requestHUDPresentationWithUnpreparedConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  UIKeyShortcutHUDService *v27;
  id v28;

  v5 = a3;
  if (!-[UIKeyShortcutHUDService _isHUDSupportedOnPlatform](self, "_isHUDSupportedOnPlatform")
    || !-[UIKeyShortcutHUDService _isHUDAllowedToAppearForProcess](self, "_isHUDAllowedToAppearForProcess")
    || !-[UIKeyShortcutHUDService _isHUDAllowedOverCurrentWindow](self, "_isHUDAllowedOverCurrentWindow")
    || !-[UIKeyShortcutHUDService _isHUDAllowedForCurrentResponder](self, "_isHUDAllowedForCurrentResponder")
    || !-[UIKeyShortcutHUDService _isHUDAllowedForConfiguration:](self, "_isHUDAllowedForConfiguration:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDService.m"), 526, CFSTR("Attempted to present the key shortcut HUD when not allowed!"));

  }
  if (-[UIKeyShortcutHUDService _isHUDAllowedToBePresentedForPresentationState:](self, "_isHUDAllowedToBePresentedForPresentationState:", -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState")))
  {
    if (v5)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDService.m"), 528, CFSTR("Attempted to present the key shortcut HUD in a state where it's not allowed!"));

    if (v5)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDService.m"), 529, CFSTR("Attempted to present the key shortcut HUD with a nil configuration!"));

LABEL_8:
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[_UIKeyShortcutHUDModel modelForCurrentMenu](_UIKeyShortcutHUDModel, "modelForCurrentMenu");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModel:", v7);

  }
  objc_msgSend(v5, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmpty");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setConfiguration:", v5);
    if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextEditingSessionWasTornDown:", objc_msgSend(v11, "isCurrentEditResponderInEditingMode"));

    }
    objc_msgSend(v5, "clientTraits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyShortcutHUDService lastKeyboardEvent](self, "lastKeyboardEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIKeyShortcutHUDClientTraits traitsWithReferenceTraitEnvironment:referenceKeyboardEvent:](_UIKeyShortcutHUDClientTraits, "traitsWithReferenceTraitEnvironment:referenceKeyboardEvent:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setClientTraits:", v15);

    }
    -[UIKeyShortcutHUDService modifierKeyListener](self, "modifierKeyListener");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInitialHeldModifierFlags:", objc_msgSend(v16, "currentModifierFlags"));

    +[UIWindowScene _keyWindowScene]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_eventDeferringManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventDeferringManager bufferKeyboardFocusEnvironmentEventsWithReason:]((uint64_t)v18, CFSTR("KeyShortcutHUD request to OverlayUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)&self->_flags |= 2u;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __78__UIKeyShortcutHUDService__requestHUDPresentationWithUnpreparedConfiguration___block_invoke;
    v25[3] = &unk_1E16CF138;
    v26 = v19;
    v27 = self;
    v28 = v10;
    v20 = v10;
    v21 = v19;
    -[UIKeyShortcutHUDService _requestHUDPresentationWithConfiguration:completionHandler:](self, "_requestHUDPresentationWithConfiguration:completionHandler:", v5, v25);

  }
}

void __78__UIKeyShortcutHUDService__requestHUDPresentationWithUnpreparedConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  LODWORD(v3) = objc_msgSend(v4, "accepted");

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setSession:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_addPresentationObserversIfNeeded");
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) &= ~2u;
}

- (void)_requestHUDPresentationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UIORequestKeyShortcutHUDPresentationAction *v9;

  v6 = a4;
  v7 = a3;
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
  {
    v9 = -[_UIORequestKeyShortcutHUDPresentationAction initWithConfiguration:responseHandler:]([_UIORequestKeyShortcutHUDPresentationAction alloc], "initWithConfiguration:responseHandler:", v7, v6);

    -[UIKeyShortcutHUDService overlayService](self, "overlayService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendOverlayAction:", v9);
  }
  else
  {
    +[UIWindowScene _keyWindowScene]();
    v9 = (_UIORequestKeyShortcutHUDPresentationAction *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyShortcutHUDServer sharedHUDServer](_UIKeyShortcutHUDServer, "sharedHUDServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentHUDWithConfiguration:inWindowScene:forConnection:completionHandler:", v7, v9, 0, v6);

  }
}

- (void)presentHUD
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState");
  if (v3)
  {
    if (v3 != 1)
      return;
    -[UIKeyShortcutHUDService cancelScheduledHUDPresentationIfNeeded](self, "cancelScheduledHUDPresentationIfNeeded");
  }
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setPresentedModifierFlag:", 0x800000);
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDService lastKeyboardEvent](self, "lastKeyboardEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDClientTraits traitsWithReferenceTraitEnvironment:referenceKeyboardEvent:](_UIKeyShortcutHUDClientTraits, "traitsWithReferenceTraitEnvironment:referenceKeyboardEvent:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientTraits:", v6);

  -[UIKeyShortcutHUDService _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:](self, "_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:", v7);
}

- (void)_requestHUDDismissal
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_KeyShortcutHUDEnhancedLogging, (uint64_t)CFSTR("KeyShortcutHUDEnhancedLogging")) & 1) == 0&& byte_1EDDA7D84)
  {
    _UIKeyShortcutHUDLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal; callStack=%{public}@",
        (uint8_t *)&v7,
        0xCu);

    }
  }
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
  {
    +[_UIORequestKeyShortcutHUDDismissalAction dismissalAction](_UIORequestKeyShortcutHUDDismissalAction, "dismissalAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyShortcutHUDService overlayService](self, "overlayService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendOverlayAction:", v5);

  }
  else
  {
    +[_UIKeyShortcutHUDServer sharedHUDServer](_UIKeyShortcutHUDServer, "sharedHUDServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissHUDForConnection:", 0);
  }

}

- (void)handleKeyboardEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (-[UIKeyShortcutHUDService _isHUDSupportedOnPlatform](self, "_isHUDSupportedOnPlatform"))
  {
    -[UIKeyShortcutHUDService setLastKeyboardEvent:](self, "setLastKeyboardEvent:", v4);
    v10 = (id)objc_msgSend(v4, "_cloneEvent");

    objc_msgSend(v10, "_privatize");
    if (objc_msgSend(v10, "_isKeyDown") && (objc_msgSend(v10, "modifierFlags") & 0x800000) != 0)
    {
      objc_msgSend(v10, "_modifiedInput");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        v6 = objc_msgSend((id)UIApp, "isFrontBoard");

        if ((v6 & 1) == 0)
          -[UIKeyShortcutHUDService preventUnintendedSystemHUDPresentationIfNeeded](self, "preventUnintendedSystemHUDPresentationIfNeeded");
      }
      else
      {

      }
    }
    if (!+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled")
      || _UIApplicationProcessIsOverlayUI())
    {
      +[_UIKeyShortcutHUDServer sharedHUDServer](_UIKeyShortcutHUDServer, "sharedHUDServer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleKeyboardEvent:", v10);

    }
    if (-[UIKeyShortcutHUDService _isHUDAllowedToAppearForProcess](self, "_isHUDAllowedToAppearForProcess"))
    {
      -[UIKeyShortcutHUDService modifierKeyListener](self, "modifierKeyListener");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleKeyboardEvent:", v10);

    }
    v7 = v10;
  }
  else
  {
    v7 = v4;
  }

}

- (_UIKeyShortcutHUDModifierKeyListener)modifierKeyListener
{
  _UIKeyShortcutHUDModifierKeyListener *modifierKeyListener;
  _UIKeyShortcutHUDModifierKeyListener *v4;
  _UIKeyShortcutHUDModifierKeyListener *v5;

  modifierKeyListener = self->_modifierKeyListener;
  if (!modifierKeyListener)
  {
    v4 = (_UIKeyShortcutHUDModifierKeyListener *)objc_opt_new();
    v5 = self->_modifierKeyListener;
    self->_modifierKeyListener = v4;

    -[_UIKeyShortcutHUDModifierKeyListener setDelegate:](self->_modifierKeyListener, "setDelegate:", self);
    modifierKeyListener = self->_modifierKeyListener;
  }
  return modifierKeyListener;
}

- (void)modifierKeyListener:(id)a3 didUpdateModifierFlag:(int64_t)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  v7 = -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState");
  v8 = objc_msgSend(v6, "currentModifierFlags");

  if (-[UIKeyShortcutHUDService _canSummonHUDWithModifierFlag:](self, "_canSummonHUDWithModifierFlag:", a4))
  {
    v9 = v8 & a4;
    if (-[UIKeyShortcutHUDService _isHUDAllowedToBeScheduledForPresentationState:](self, "_isHUDAllowedToBeScheduledForPresentationState:", v7)&& v9)
    {
      v10 = (void *)objc_opt_new();
      -[UIKeyShortcutHUDService setScheduledHUDConfiguration:](self, "setScheduledHUDConfiguration:", v10);

      -[UIKeyShortcutHUDService scheduledHUDConfiguration](self, "scheduledHUDConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPresentedModifierFlag:", a4);

      +[UIWindowScene _keyWindowScene]();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__sceneDidLoseKeyboardFocus_, CFSTR("_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification"), v15);

        -[UIKeyShortcutHUDService setScheduledHUDKeyWindowScene:](self, "setScheduledHUDKeyWindowScene:", v15);
      }
      -[UIKeyShortcutHUDService scheduleHUDPresentation](self, "scheduleHUDPresentation");

    }
    else if (v7 == 1 && !v9)
    {
      -[UIKeyShortcutHUDService scheduledHUDConfiguration](self, "scheduledHUDConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "presentedModifierFlag");

      if (v14 == a4)
        -[UIKeyShortcutHUDService cancelScheduledHUDPresentationIfNeeded](self, "cancelScheduledHUDPresentationIfNeeded");
    }
  }
}

- (void)keyShortcutHUDDidDismissWithResponse:(id)a3 toOverlayService:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  dispatch_source_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  UIKeyShortcutHUDService *v26;
  id v27;
  id buf[2];

  v6 = a3;
  v7 = a4;
  -[UIKeyShortcutHUDService overlayService](self, "overlayService");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[UIKeyShortcutHUDService _removePresentationObserversIfNeeded](self, "_removePresentationObserversIfNeeded");
    -[UIKeyShortcutHUDService session](self, "session");
    v11 = objc_claimAutoreleasedReturnValue();
    -[UIKeyShortcutHUDService setSession:](self, "setSession:", 0);
    if (v11)
    {
      objc_msgSend(v6, "keyCommand");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if ((-[NSObject textEditingSessionWasTornDown](v11, "textEditingSessionWasTornDown") & 1) != 0)
        {
          -[UIKeyShortcutHUDService setDeferredResponse:](self, "setDeferredResponse:", v6);
          -[UIKeyShortcutHUDService setDeferredResponseSession:](self, "setDeferredResponseSession:", v11);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleDeferredDismissalResponse_, CFSTR("UITextInputResponderIsReloadedNotification"), 0);

          v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
          -[UIKeyShortcutHUDService setDeferredResponseTimer:](self, "setDeferredResponseTimer:", v14);

          -[UIKeyShortcutHUDService deferredResponseTimer](self, "deferredResponseTimer");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = dispatch_time(0, 500000000);
          dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);

          objc_initWeak(buf, self);
          -[UIKeyShortcutHUDService deferredResponseTimer](self, "deferredResponseTimer");
          v17 = objc_claimAutoreleasedReturnValue();
          v22 = MEMORY[0x1E0C809B0];
          v23 = 3221225472;
          v24 = __81__UIKeyShortcutHUDService_keyShortcutHUDDidDismissWithResponse_toOverlayService___block_invoke;
          v25 = &unk_1E16B1500;
          objc_copyWeak(&v27, buf);
          v26 = self;
          dispatch_source_set_event_handler(v17, &v22);

          -[UIKeyShortcutHUDService deferredResponseTimer](self, "deferredResponseTimer", v22, v23, v24, v25);
          v18 = objc_claimAutoreleasedReturnValue();
          dispatch_activate(v18);

          objc_destroyWeak(&v27);
          objc_destroyWeak(buf);
        }
        else
        {
          -[UIKeyShortcutHUDService _handleKeyCommandFromResponse:withSession:](self, "_handleKeyCommandFromResponse:withSession:", v6, v11);
        }
      }

    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Something has gone wrong, we got a dismissal response despite our presentation request being rejected", (uint8_t *)buf, 2u);
      }

    }
    else
    {
      v19 = qword_1ECD7EBD8;
      if (!qword_1ECD7EBD8)
      {
        v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7EBD8);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Something has gone wrong, we got a dismissal response despite our presentation request being rejected", (uint8_t *)buf, 2u);
      }
    }
    goto LABEL_18;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Something has gone very wrong, OverlayUI has told the HUD that it dismissed via a different overlay service than the one the HUD service uses", (uint8_t *)buf, 2u);
    }
LABEL_18:

    goto LABEL_19;
  }
  v9 = qword_1ECD7EBD0;
  if (!qword_1ECD7EBD0)
  {
    v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&qword_1ECD7EBD0);
  }
  v10 = *(NSObject **)(v9 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Something has gone very wrong, OverlayUI has told the HUD that it dismissed via a different overlay service than the one the HUD service uses", (uint8_t *)buf, 2u);
  }
LABEL_19:

}

void __81__UIKeyShortcutHUDService_keyShortcutHUDDidDismissWithResponse_toOverlayService___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "deferredResponseTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleDeferredDismissalResponse:", v2);

  }
}

- (void)_handleDeferredDismissalResponse:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  UIKeyShortcutHUDService *v15;

  -[UIKeyShortcutHUDService deferredResponseTimer](self, "deferredResponseTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKeyShortcutHUDService deferredResponseTimer](self, "deferredResponseTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UITextInputResponderIsReloadedNotification"), 0);

  -[UIKeyShortcutHUDService deferredResponse](self, "deferredResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyShortcutHUDService deferredResponseSession](self, "deferredResponseSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__UIKeyShortcutHUDService__handleDeferredDismissalResponse___block_invoke;
  v12[3] = &unk_1E16B47A8;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBlock:", v12);

  -[UIKeyShortcutHUDService setDeferredResponse:](self, "setDeferredResponse:", 0);
  -[UIKeyShortcutHUDService setDeferredResponseSession:](self, "setDeferredResponseSession:", 0);
  -[UIKeyShortcutHUDService setDeferredResponseTimer:](self, "setDeferredResponseTimer:", 0);

}

uint64_t __60__UIKeyShortcutHUDService__handleDeferredDismissalResponse___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
  {
    if (*(_QWORD *)(result + 40))
      return objc_msgSend(*(id *)(result + 48), "_handleKeyCommandFromResponse:withSession:");
  }
  return result;
}

- (void)_handleKeyCommandFromResponse:(id)a3 withSession:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "keyCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDService.m"), 870, CFSTR("The keyboard shortcut HUD was dismissed without a selected key command, but the non-nil key command code path was run in the HUD service"));

  }
  objc_msgSend(v7, "pasteAuthenticationMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v10);
  objc_msgSend(v8, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appKeyCommandForSelectedKeyCommand:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v8, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "originalTargetForSelectedKeyCommand:", v9);
    v16 = objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isPlaceholder") & 1) == 0 && (objc_msgSend(v13, "attributes") & 1) == 0)
    {
      if (v16)
      {
        objc_msgSend((id)UIApp, "_unswizzledTargetInChainForAction:sender:", objc_msgSend(v13, "action"), v13);
        v17 = objc_claimAutoreleasedReturnValue();

        if (v16 == v17)
        {
          objc_msgSend((id)UIApp, "sendAction:to:from:forEvent:", objc_msgSend(v13, "action"), v16, v13, 0);
          if (objc_msgSend(v13, "upAction"))
            objc_msgSend((id)UIApp, "sendAction:to:from:forEvent:", objc_msgSend(v13, "upAction"), 0, v13, 0);
        }
      }
    }
LABEL_10:

    goto LABEL_16;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Something has gone very wrong, the app was asked to trigger a keyboard shortcut it didn't provide to the keyboard shortcut HUD", buf, 2u);
    }
    goto LABEL_10;
  }
  v18 = _handleKeyCommandFromResponse_withSession____s_category;
  if (!_handleKeyCommandFromResponse_withSession____s_category)
  {
    v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v18, (unint64_t *)&_handleKeyCommandFromResponse_withSession____s_category);
  }
  v19 = *(NSObject **)(v18 + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Something has gone very wrong, the app was asked to trigger a keyboard shortcut it didn't provide to the keyboard shortcut HUD", v21, 2u);
  }
LABEL_16:

}

- (void)overlayServiceDidInvalidate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UIKeyShortcutHUDService overlayService](self, "overlayService");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4 && -[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState") == 3)
  {
    v7 = (id)objc_opt_new();
    -[UIKeyShortcutHUDService overlayService](self, "overlayService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyShortcutHUDService keyShortcutHUDDidDismissWithResponse:toOverlayService:](self, "keyShortcutHUDDidDismissWithResponse:toOverlayService:", v7, v6);

  }
}

- (void)_addPresentationObserversIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), UIApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidBeginIgnoringInteractionEvents_, 0x1E1761BE0, UIApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__didTakeScreenshot_, CFSTR("UIApplicationUserDidTakeScreenshotNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__hardwareKeyboardAvailabilityChanged_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  }
}

- (void)_applicationWillResignActive:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _UIKeyShortcutHUDLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to app resigning active", v6, 2u);
  }

  -[UIKeyShortcutHUDService dismissOrCancelHUDPresentationIfNeeded](self, "dismissOrCancelHUDPresentationIfNeeded");
  -[UIKeyShortcutHUDService modifierKeyListener](self, "modifierKeyListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentModifierFlags:", 0);

}

- (void)_applicationDidBeginIgnoringInteractionEvents:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _UIKeyShortcutHUDLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to app ignoring interaction events", v5, 2u);
  }

  -[UIKeyShortcutHUDService dismissOrCancelHUDPresentationIfNeeded](self, "dismissOrCancelHUDPresentationIfNeeded");
}

- (void)_didTakeScreenshot:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[UIKeyShortcutHUDService hudPresentationState](self, "hudPresentationState", a3) == 1)
  {
    _UIKeyShortcutHUDLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to screenshot being taken", v5, 2u);
    }

    -[UIKeyShortcutHUDService dismissOrCancelHUDPresentationIfNeeded](self, "dismissOrCancelHUDPresentationIfNeeded");
  }
}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  uint8_t v7[16];

  +[UIDevice currentDevice](UIDevice, "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHardwareKeyboardAvailable");

  if ((v5 & 1) == 0)
  {
    _UIKeyShortcutHUDLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to hardware keyboard disconnecting", v7, 2u);
    }

    -[UIKeyShortcutHUDService dismissOrCancelHUDPresentationIfNeeded](self, "dismissOrCancelHUDPresentationIfNeeded");
  }
}

- (id)metricsForWindow:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");

  return (id)objc_opt_new();
}

- (BOOL)_canSummonHUDWithModifierFlag:(int64_t)a3
{
  return a3 == 0x100000 || a3 == 0x800000;
}

- (BOOL)_isHUDSupportedOnPlatform
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    v4 = v3 == 3;
  else
    v4 = 1;
  return !v4;
}

- (BOOL)_isHUDAllowedToAppearForProcess
{
  return _UIApplicationProcessIsOverlayUI() ^ 1;
}

- (BOOL)_isHUDAllowedOverCurrentWindow
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;
  double v6;
  double v7;
  BOOL v8;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

  if ((v4 & 1) != 0 || (objc_msgSend(v2, "_isHostedInAnotherProcess") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "frame");
    v8 = vabdd_f64(v6, *(double *)(MEMORY[0x1E0C9D820] + 8)) >= 0.00000011920929;
    v5 = vabdd_f64(v7, *MEMORY[0x1E0C9D820]) >= 0.00000011920929 || v8;
  }

  return v5;
}

- (BOOL)_isHUDAllowedForConfiguration:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "presentedModifierFlag");
  if (v3 == 0x800000)
    return objc_msgSend((id)UIApp, "_isGlobeKeyShortcutHUDEnabled");
  if (v3 == 0x100000)
    return objc_msgSend((id)UIApp, "_areKeyboardHUDsEnabled");
  return 0;
}

- (BOOL)_isHUDAllowedForCurrentResponder
{
  void *v2;
  char v3;

  +[UIResponder _globalFirstResponder](UIResponder, "_globalFirstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_disallowsPresentationOfKeyboardShortcutHUD") ^ 1;

  return v3;
}

- (BOOL)_isHUDAllowedToBeScheduledForPresentationState:(int64_t)a3
{
  return !a3 || a3 == 3;
}

- (BOOL)_isHUDAllowedToBePresentedForPresentationState:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (_UIOverlayService)overlayService
{
  return self->_overlayService;
}

- (void)setOverlayService:(id)a3
{
  objc_storeStrong((id *)&self->_overlayService, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setScheduledHUDTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledHUDTimer, a3);
}

- (_UIKeyShortcutHUDConfiguration)scheduledHUDConfiguration
{
  return self->_scheduledHUDConfiguration;
}

- (void)setScheduledHUDConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledHUDConfiguration, a3);
}

- (UIWindowScene)scheduledHUDKeyWindowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scheduledHUDKeyWindowScene);
}

- (void)setScheduledHUDKeyWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_scheduledHUDKeyWindowScene, a3);
}

- (_UIKeyShortcutHUDDismissalResponse)deferredResponse
{
  return self->_deferredResponse;
}

- (void)setDeferredResponse:(id)a3
{
  objc_storeStrong((id *)&self->_deferredResponse, a3);
}

- (_UIKeyShortcutHUDClientSession)deferredResponseSession
{
  return self->_deferredResponseSession;
}

- (void)setDeferredResponseSession:(id)a3
{
  objc_storeStrong((id *)&self->_deferredResponseSession, a3);
}

- (OS_dispatch_source)deferredResponseTimer
{
  return self->_deferredResponseTimer;
}

- (void)setDeferredResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deferredResponseTimer, a3);
}

- (NSArray)scheduledHUDHoverGestureRecognizers
{
  return self->_scheduledHUDHoverGestureRecognizers;
}

- (void)setScheduledHUDHoverGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledHUDHoverGestureRecognizers, a3);
}

- (NSValue)scheduledHUDInitialPointerLocation
{
  return self->_scheduledHUDInitialPointerLocation;
}

- (void)setScheduledHUDInitialPointerLocation:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledHUDInitialPointerLocation, a3);
}

- (UIPhysicalKeyboardEvent)lastKeyboardEvent
{
  return self->_lastKeyboardEvent;
}

- (void)setLastKeyboardEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastKeyboardEvent, a3);
}

- (UIKeyShortcutHUDMetricsProvider)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metricsProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_lastKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_scheduledHUDInitialPointerLocation, 0);
  objc_storeStrong((id *)&self->_scheduledHUDHoverGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_deferredResponseTimer, 0);
  objc_storeStrong((id *)&self->_deferredResponseSession, 0);
  objc_storeStrong((id *)&self->_deferredResponse, 0);
  objc_destroyWeak((id *)&self->_scheduledHUDKeyWindowScene);
  objc_storeStrong((id *)&self->_scheduledHUDConfiguration, 0);
  objc_storeStrong((id *)&self->_scheduledHUDTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
  objc_storeStrong((id *)&self->_modifierKeyListener, 0);
}

@end
