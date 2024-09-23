@implementation WQAOverlayCoordinator

- (WQAOverlayCoordinator)initWithDataSource:(id)a3
{
  id v4;
  WQAOverlayCoordinator *v5;
  WQAOverlayCoordinator *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  id *v13;
  void *v14;
  __CFNotificationCenter *v15;
  id *v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WQAOverlayCoordinator;
  v5 = -[WQAOverlayCoordinator init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WQAOverlayCoordinator setDataSource:](v5, "setDataSource:", v4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WQAOverlayCoordinator setQuickActionShapeLayers:](v6, "setQuickActionShapeLayers:", v7);

    objc_msgSend(MEMORY[0x24BE0B848], "sharedBacklight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v6);

    objc_msgSend(MEMORY[0x24BE0B848], "sharedBacklight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_msgSend(v9, "backlightState") & 0xFFFFFFFFFFFFFFFELL) == 2;

    if (v10)
      -[WQAOverlayCoordinator refreshOverlaysIfNecessary](v6, "refreshOverlaysIfNecessary");
    -[WQAOverlayCoordinator _updateGestureSettings](v6, "_updateGestureSettings");
    if (!WatchControlSettingsLibraryCore_frameworkLibrary)
    {
      v20 = xmmword_24F5470E8;
      v21 = 0;
      WatchControlSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (WatchControlSettingsLibraryCore_frameworkLibrary)
    {
      objc_msgSend(getWatchControlSettingsClass(), "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSettingsObserver:", v6);

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      *(_QWORD *)&v20 = 0;
      *((_QWORD *)&v20 + 1) = &v20;
      v21 = 0x2020000000;
      v13 = (id *)getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr;
      v22 = getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr;
      if (!getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr)
      {
        v14 = (void *)WatchControlSettingsLibrary();
        v13 = (id *)dlsym(v14, "kWatchControlReceivedActivationGestureDidChange");
        *(_QWORD *)(*((_QWORD *)&v20 + 1) + 24) = v13;
        getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr = (uint64_t)v13;
      }
      _Block_object_dispose(&v20, 8);
      if (!v13)
        goto LABEL_15;
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)updateGestureSettings, (CFStringRef)objc_retainAutorelease(*v13), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v15 = CFNotificationCenterGetDarwinNotifyCenter();
      *(_QWORD *)&v20 = 0;
      *((_QWORD *)&v20 + 1) = &v20;
      v21 = 0x2020000000;
      v16 = (id *)getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr;
      v22 = getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr;
      if (!getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr)
      {
        v17 = (void *)WatchControlSettingsLibrary();
        v16 = (id *)dlsym(v17, "kWatchControlInputSourcesRequireFocusRingDidChange");
        *(_QWORD *)(*((_QWORD *)&v20 + 1) + 24) = v16;
        getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr = (uint64_t)v16;
      }
      _Block_object_dispose(&v20, 8);
      if (!v16)
      {
LABEL_15:
        -[WQAOverlayCoordinator initWithDataSource:].cold.1();
        __break(1u);
      }
      CFNotificationCenterAddObserver(v15, v6, (CFNotificationCallback)updateGestureSettings, (CFStringRef)objc_retainAutorelease(*v16), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

  return v6;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x24BE0B848], "sharedBacklight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)WQAOverlayCoordinator;
  -[WQAOverlayCoordinator dealloc](&v5, sel_dealloc);
}

- (void)animateConfirmationForQuickAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke;
  block[3] = &unk_24F546F48;
  v11 = v6;
  v12 = v7;
  block[4] = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke(id *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  CGPath *Mutable;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_mainQueue_cleanupShapeLayers");
  v2 = MEMORY[0x24BDAC760];
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2;
  v55[3] = &unk_24F546E58;
  v3 = a1[6];
  v55[4] = a1[4];
  v56 = v3;
  v4 = (void *)MEMORY[0x22E2EA5A8](v55);
  objc_msgSend(a1[5], "animationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  wqa_overlay_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = a1[5];
      *(_DWORD *)buf = 138412546;
      v58 = v5;
      v59 = 2112;
      v60 = v8;
      _os_log_impl(&dword_22B0D4000, v6, OS_LOG_TYPE_INFO, "custom animation handler: %@ will handle confirmation for quick action: %@", buf, 0x16u);
    }

    objc_msgSend(v5, "quickActionWillActivate:", a1[5]);
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    if (v7)
    {
      v9 = a1[5];
      *(_DWORD *)buf = 138412290;
      v58 = v9;
      _os_log_impl(&dword_22B0D4000, v6, OS_LOG_TYPE_INFO, "animating confirmation for quick action: %@", buf, 0xCu);
    }

    objc_msgSend(a1[5], "quickActionHostingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "quickActionPrimaryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "quickActionPath");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10 && v11 && v12)
    {
      if (objc_msgSend(a1[5], "allowsResizingAnimations"))
      {
        objc_msgSend(a1[4], "_createNonAnimatingShapeLayerFromPath:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSublayer:", v14);

        v16 = (void *)MEMORY[0x24BDF6F90];
        v51[0] = v2;
        v51[1] = 3221225472;
        v51[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_5;
        v51[3] = &unk_24F546E80;
        v52 = v11;
        v53 = v10;
        v54 = v14;
        v47[0] = v2;
        v47[1] = 3221225472;
        v47[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2_6;
        v47[3] = &unk_24F546EF8;
        v48 = v52;
        v49 = v54;
        v50 = v4;
        v17 = v54;
        objc_msgSend(v16, "animateWithDuration:animations:completion:", v51, v47, 0.3);

      }
      else
      {
        objc_msgSend(v10, "parentFocusEnvironment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "focusItemContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "coordinateSpace");
        v17 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "frame");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(v10, "coordinateSpace");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "convertRect:toCoordinateSpace:", v28, v21, v23, v25, v27);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;

        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v30, v32, v34, v36);
        WQADefaultTintColor();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setBackgroundColor:", v38);

        objc_msgSend(MEMORY[0x24BDE5758], "layer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setFrame:", v30, v32, v34, v36);
        objc_msgSend(v39, "setFillRule:", *MEMORY[0x24BDE5990]);
        Mutable = CGPathCreateMutable();
        CGPathAddPath(Mutable, 0, (CGPathRef)objc_msgSend(objc_retainAutorelease(v13), "CGPath"));
        objc_msgSend(v39, "setPath:", Mutable);
        objc_msgSend(v37, "layer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setMask:", v39);

        objc_msgSend(v10, "addSubview:", v37);
        v42 = (void *)MEMORY[0x24BDF6F90];
        v44[0] = v2;
        v44[1] = 3221225472;
        v44[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_5;
        v44[3] = &unk_24F546F20;
        v45 = v37;
        v46 = v4;
        v43 = v37;
        objc_msgSend(v42, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v44, 0, 0.0, 0.0);

      }
    }
    else
    {
      AXPerformBlockAsynchronouslyOnMainThread();
    }

  }
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, 1);
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshOverlaysIfNecessary");
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;
  CGAffineTransform v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  v4 = v5;
  result = objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v4);
  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a1 + 40))
  {
    v3 = v5;
    return objc_msgSend(*(id *)(a1 + 48), "setAffineTransform:", &v3);
  }
  return result;
}

void __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2_6(id *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_3_7;
  v7[3] = &unk_24F546EA8;
  v8 = a1[4];
  v9 = a1[5];
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_4;
  v4[3] = &unk_24F546ED0;
  v6 = a1[6];
  v5 = a1[5];
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v7, v4, 0.3);

}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_3_7(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  CGAffineTransformMakeScale(&v9, 1.0, 1.0);
  v2 = *(void **)(a1 + 32);
  v8 = v9;
  objc_msgSend(v2, "setTransform:", &v8);
  CGAffineTransformMakeScale(&v7, 1.2, 1.2);
  v3 = *(void **)(a1 + 40);
  v6 = v7;
  objc_msgSend(v3, "setAffineTransform:", &v6);
  LODWORD(v4) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "setOpacity:", v4);
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

void __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.7);
  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_6;
  v7[3] = &unk_24F546E30;
  v8 = *(id *)(a1 + 32);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_7;
  v4[3] = &unk_24F546ED0;
  v6 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v7, v4, 0.3, 0.0);

}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)stopCurrentOverlays
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WQAOverlayCoordinator_stopCurrentOverlays__block_invoke;
  block[3] = &unk_24F546E30;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __44__WQAOverlayCoordinator_stopCurrentOverlays__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_cleanupShapeLayers");
}

- (void)_updateGestureSettings
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!WatchControlSettingsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24F5470E8;
    v8 = 0;
    WatchControlSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (WatchControlSettingsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getWatchControlSettingsClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WQAOverlayCoordinator setReceivedActivationGesture:](self, "setReceivedActivationGesture:", objc_msgSend(v3, "receivedActivationGesture"));
    -[WQAOverlayCoordinator setInputSourcesRequireFocusRing:](self, "setInputSourcesRequireFocusRing:", objc_msgSend(v3, "inputSourcesRequireFocusRing"));
    v4 = objc_msgSend(v3, "greyActivationGesture");
    *(_QWORD *)&v7 = 0;
    *((_QWORD *)&v7 + 1) = &v7;
    v8 = 0x2020000000;
    v5 = (_QWORD *)getWCGreyEventNoneSymbolLoc_ptr;
    v9 = getWCGreyEventNoneSymbolLoc_ptr;
    if (!getWCGreyEventNoneSymbolLoc_ptr)
    {
      v6 = (void *)WatchControlSettingsLibrary();
      v5 = dlsym(v6, "WCGreyEventNone");
      *(_QWORD *)(*((_QWORD *)&v7 + 1) + 24) = v5;
      getWCGreyEventNoneSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v7, 8);
    if (!v5)
    {
      -[WQAOverlayCoordinator initWithDataSource:].cold.1();
      __break(1u);
    }
    -[WQAOverlayCoordinator setHasNoActivationGesture:](self, "setHasNoActivationGesture:", v4 == *v5, (_QWORD)v7);

  }
}

- (BOOL)_astFocusRingIsVisible
{
  int v2;

  v2 = _AXSWatchControlEnabled();
  if (v2)
    LOBYTE(v2) = _AXSFullKeyboardAccessFocusRingEnabled() != 0;
  return v2;
}

- (void)refreshOverlaysIfNecessary
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0B848], "sharedBacklight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backlightState");

  if (v4 <= 1)
  {
    wqa_overlay_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B0D4000, v5, OS_LOG_TYPE_INFO, "backlight is off, skipping refresh", buf, 2u);
    }

    return;
  }
  if (-[WQAOverlayCoordinator _astFocusRingIsVisible](self, "_astFocusRingIsVisible"))
  {
    wqa_overlay_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[WQAOverlayCoordinator stopCurrentOverlays](self, "stopCurrentOverlays");
      return;
    }
    *(_WORD *)buf = 0;
    v7 = "AST focus ring is visible, hide all overlays";
LABEL_8:
    _os_log_impl(&dword_22B0D4000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    goto LABEL_9;
  }
  if (_AXSWatchControlEnabled()
    && -[WQAOverlayCoordinator inputSourcesRequireFocusRing](self, "inputSourcesRequireFocusRing"))
  {
    if (-[WQAOverlayCoordinator hasNoActivationGesture](self, "hasNoActivationGesture"))
    {
      wqa_overlay_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v7 = "activation gesture set to none, hide all overlays";
      goto LABEL_8;
    }
    if (-[WQAOverlayCoordinator receivedActivationGesture](self, "receivedActivationGesture"))
    {
      wqa_overlay_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      *(_WORD *)buf = 0;
      v7 = "already received activation gesture, hide all overlays";
      goto LABEL_8;
    }
  }
  -[WQAOverlayCoordinator dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quickActionsForOverlayCoordinator:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

    v18 = v10;
    AXPerformBlockOnMainThread();

  }
  else
  {
    wqa_overlay_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B0D4000, v19, OS_LOG_TYPE_INFO, "no more quick actions, cleaning up overlays", buf, 2u);
    }

    -[WQAOverlayCoordinator stopCurrentOverlays](self, "stopCurrentOverlays");
  }

}

void __51__WQAOverlayCoordinator_refreshOverlaysIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "quickActionShapeLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "quickActionShapeLayers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "superlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "quickActionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (v12 = objc_msgSend(v11, "currentVisualsToken"), v12 == objc_msgSend(v7, "quickActionVisualsToken")))
        {
          v13 = *(void **)(a1 + 40);
          objc_msgSend(v7, "quickActionIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObjectForKey:", v14);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_mainQueue_removeShapeLayer:", v7);
          objc_msgSend(v2, "addIndex:", v5);
        }

      }
      else
      {
        objc_msgSend(v2, "addIndex:", v5);
      }

      ++v5;
      objc_msgSend(*(id *)(a1 + 32), "quickActionShapeLayers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v5 < v16);
  }
  if (objc_msgSend(v2, "count"))
  {
    wqa_overlay_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v2;
      _os_log_impl(&dword_22B0D4000, v17, OS_LOG_TYPE_INFO, "removing shape layers at indeces: %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "quickActionShapeLayers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectsAtIndexes:", v2);

  }
  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_mainQueue_showUIForQuickActions:", v20);

}

- (void)_mainQueue_removeShapeLayer:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  wqa_overlay_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22B0D4000, v4, OS_LOG_TYPE_INFO, "removing shape layer: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(v3, "removeFromSuperlayer");
}

- (void)_mainQueue_addAnimatedShapeLayerForQuickAction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  double MidX;
  id v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v4, "animationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    wqa_overlay_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v24 = 138412546;
      v25 = v5;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_22B0D4000, v6, OS_LOG_TYPE_INFO, "animation handler: %@ will handle pulse for quick action: %@", (uint8_t *)&v24, 0x16u);
    }

    objc_msgSend(v5, "quickActionWillPulse:", v4);
  }
  else
  {
    objc_msgSend(v4, "quickActionHostingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quickActionPath");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
    {
      wqa_overlay_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v4;
        _os_log_impl(&dword_22B0D4000, v10, OS_LOG_TYPE_INFO, "adding shape layer for quick action: %@", (uint8_t *)&v24, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFromValue:", &unk_24F549798);
      objc_msgSend(v11, "setToValue:", &unk_24F5497A8);
      objc_msgSend(v11, "setAutoreverses:", 1);
      objc_msgSend(v11, "setDuration:", 1.5);
      LODWORD(v12) = 2139095039;
      objc_msgSend(v11, "setRepeatCount:", v12);
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v13);

      LODWORD(v14) = 2139095040;
      objc_msgSend(v11, "setRepeatCount:", v14);
      +[WQAShapeLayer layer](WQAShapeLayer, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setQuickActionIdentifier:", v16);

      objc_msgSend(v15, "setQuickActionVisualsToken:", objc_msgSend(v4, "currentVisualsToken"));
      LODWORD(v17) = 0;
      objc_msgSend(v15, "setOpacity:", v17);
      v18 = objc_retainAutorelease(v9);
      objc_msgSend(v15, "setPath:", objc_msgSend(v18, "CGPath"));
      objc_msgSend(v18, "bounds");
      objc_msgSend(v15, "setBounds:");
      objc_msgSend(v18, "bounds");
      MidX = CGRectGetMidX(v29);
      objc_msgSend(v18, "bounds");
      objc_msgSend(v15, "setPosition:", MidX, CGRectGetMidY(v30));
      WQADefaultTintColor();
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setStrokeColor:", objc_msgSend(v20, "CGColor"));

      objc_msgSend(v15, "setLineWidth:", WQADefaultShapeLineWidth());
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v21, "CGColor"));

      objc_msgSend(v7, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSublayer:", v15);

      objc_msgSend(v15, "addAnimation:forKey:", v11, CFSTR("animations"));
      -[WQAOverlayCoordinator quickActionShapeLayers](self, "quickActionShapeLayers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v15);

    }
  }

}

- (id)_createNonAnimatingShapeLayerFromPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  double MidX;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  id v17;
  CGRect v19;
  CGRect v20;

  v3 = (void *)MEMORY[0x24BDE5758];
  v4 = a3;
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setBounds:");
  objc_msgSend(v6, "bounds");
  MidX = CGRectGetMidX(v19);
  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v20));
  WQADefaultTintColor();
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

  objc_msgSend(v5, "setLineWidth:", WQADefaultShapeLineWidth());
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setFillColor:", objc_msgSend(v17, "CGColor"));

  return v5;
}

- (BOOL)_shouldShowHintsForQuickActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationState");

  if (v6)
  {
    wqa_overlay_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B0D4000, v7, OS_LOG_TYPE_INFO, "will not show quick action banner because UIApp is not active", buf, 2u);
    }

    v8 = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
LABEL_7:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "canShowOverlays", (_QWORD)v17) & 1) != 0)
          break;
        objc_msgSend(v14, "animationHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v11)
            goto LABEL_7;
          goto LABEL_14;
        }
      }

      if (-[WQAOverlayCoordinator _astFocusRingIsVisible](self, "_astFocusRingIsVisible"))
        goto LABEL_16;
      v8 = _AXSWatchQuickActionBannerAppearance() == 0;
    }
    else
    {
LABEL_14:

LABEL_16:
      v8 = 1;
    }
  }

  return v8;
}

- (void)_mainQueue_showUIForQuickActions:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[WQAOverlayCoordinator currentShapeLayersForHint](self, "currentShapeLayersForHint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      wqa_overlay_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_22B0D4000, v6, OS_LOG_TYPE_INFO, "showing UI for quick actions: %@", buf, 0xCu);
      }

      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_22;
      v11[3] = &unk_24F546EA8;
      v11[4] = self;
      v7 = v4;
      v12 = v7;
      v8 = (void *)MEMORY[0x22E2EA5A8](v11);
      v10 = v7;
      v9 = v8;
      AXPerformBlockOnMainThreadAfterDelay();

    }
  }

}

BOOL __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "quickActionType") == 1;
}

void __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_22(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_astFocusRingIsVisible") & 1) == 0)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 32), "_mainQueue_addAnimatedShapeLayerForQuickAction:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

void __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowHintsForQuickActions:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_3;
    v4[3] = &unk_24F546FB0;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "_mainQueue_showHintsWithPrimaryQuickActions:completion:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_localizedBannerInstructionText
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WQAOverlayCoordinator__localizedBannerInstructionText__block_invoke;
  block[3] = &unk_24F546E30;
  block[4] = self;
  if (_localizedBannerInstructionText_onceToken != -1)
    dispatch_once(&_localizedBannerInstructionText_onceToken, block);
  objc_msgSend((id)_localizedBannerInstructionText__Bundle, "localizedStringForKey:value:table:", CFSTR("banner.hint"), &stru_24F547538, CFSTR("Localizable-elton"));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56__WQAOverlayCoordinator__localizedBannerInstructionText__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_localizedBannerInstructionText__Bundle;
  _localizedBannerInstructionText__Bundle = v0;

}

- (void)_mainQueue_showHintsWithPrimaryQuickActions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v29;
  void *v30;
  int v31;
  double v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  WQAOverlayCoordinator *v47;
  uint64_t v48;
  id v49;
  id v50;
  uint8_t v51[16];
  CGAffineTransform v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGAffineTransform buf;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v47 = self;
  -[WQAOverlayCoordinator _localizedBannerInstructionText](self, "_localizedBannerInstructionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _AXSReduceMotionEnabled();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (!v12)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "localizedTitle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v15, "canShowOverlays") & 1) == 0)
        {
          objc_msgSend(v15, "animationHandler");

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v11);

    if (v12)
    {
      v43 = (void *)objc_opt_new();
      v42 = (void *)objc_opt_new();
      v46 = (void *)objc_opt_new();
      if (!-[WQAOverlayCoordinator _astFocusRingIsVisible](v47, "_astFocusRingIsVisible"))
      {
        v40 = v8;
        v41 = v7;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v39 = v9;
        v16 = v9;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v54;
          v44 = *(_QWORD *)v54;
          v45 = v16;
          do
          {
            v20 = 0;
            v48 = v18;
            do
            {
              if (*(_QWORD *)v54 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v20);
              objc_msgSend(v21, "animationHandler");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                wqa_overlay_log();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  LODWORD(buf.a) = 138412546;
                  *(_QWORD *)((char *)&buf.a + 4) = v22;
                  WORD2(buf.b) = 2112;
                  *(_QWORD *)((char *)&buf.b + 6) = v21;
                  _os_log_impl(&dword_22B0D4000, v23, OS_LOG_TYPE_INFO, "animation handler: %@ will handle hint for quick action: %@", (uint8_t *)&buf, 0x16u);
                }
              }
              else
              {
                objc_msgSend(v21, "quickActionHostingView");
                v23 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "quickActionPrimaryView");
                v24 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "quickActionPath");
                v25 = objc_claimAutoreleasedReturnValue();
                v26 = (void *)v25;
                if (v23)
                  v27 = v24 == 0;
                else
                  v27 = 1;
                if (!v27 && v25 != 0)
                {
                  -[WQAOverlayCoordinator _createNonAnimatingShapeLayerFromPath:](v47, "_createNonAnimatingShapeLayerFromPath:", v25);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject layer](v23, "layer");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "addSublayer:", v29);

                  objc_msgSend(v46, "addObject:", v29);
                  if (objc_msgSend(v21, "allowsResizingAnimations"))
                  {
                    objc_msgSend(v43, "addObject:", v24);
                    if (v23 != v24)
                      objc_msgSend(v42, "addObject:", v29);
                  }

                  v19 = v44;
                  v16 = v45;
                }

                v18 = v48;
              }

              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          }
          while (v18);
        }

        v8 = v40;
        v7 = v41;
        v9 = v39;
      }
      -[WQAOverlayCoordinator setCurrentShapeLayersForHint:](v47, "setCurrentShapeLayersForHint:", v46);
      v31 = _AXSReduceMotionEnabled();
      v32 = 0.93;
      memset(&buf.c, 0, 32);
      if (v31)
        v32 = 1.0;
      *(_OWORD *)&buf.a = 0uLL;
      CGAffineTransformMakeScale(&buf, v32, v32);
      memset(&v52, 0, sizeof(v52));
      CGAffineTransformMakeScale(&v52, 1.0, 1.0);
      wqa_overlay_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_22B0D4000, v33, OS_LOG_TYPE_INFO, "presenting banner and hints", v51, 2u);
      }

      +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "showInstructionalBannerWithTitle:subtitle:", v12, v8);

      v49 = v9;
      v50 = v7;
      v35 = v46;
      v36 = v42;
      v37 = v43;
      AXPerformBlockOnMainThreadAfterDelay();

      goto LABEL_46;
    }
  }
  else
  {

  }
  wqa_overlay_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.a) = 0;
    _os_log_impl(&dword_22B0D4000, v38, OS_LOG_TYPE_INFO, "no title to present banner with", (uint8_t *)&buf, 2u);
  }

  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  v12 = 0;
LABEL_46:

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 176))
  {
    +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "animateInstructionalBannerWithScaleFactor:interstepDuration:", 0.93, 0.93, 0.15);

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v8, "animationHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          objc_msgSend(v9, "quickActionWillHint:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v5);
  }

  v11 = MEMORY[0x24BDAC760];
  v12 = (void *)MEMORY[0x24BDF6F90];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_2;
  v31[3] = &unk_24F547000;
  v32 = *(id *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 96);
  v34 = *(_OWORD *)(a1 + 80);
  v35 = v13;
  v36 = *(_OWORD *)(a1 + 112);
  v33 = *(id *)(a1 + 48);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_3;
  v19[3] = &unk_24F5470A0;
  v20 = *(id *)(a1 + 40);
  v14 = *(_OWORD *)(a1 + 144);
  v25 = *(_OWORD *)(a1 + 128);
  v26 = v14;
  v27 = *(_OWORD *)(a1 + 160);
  v21 = *(id *)(a1 + 48);
  v15 = *(_OWORD *)(a1 + 96);
  v28 = *(_OWORD *)(a1 + 80);
  v29 = v15;
  v30 = *(_OWORD *)(a1 + 112);
  v16 = *(id *)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 64);
  v18 = *(void **)(a1 + 72);
  v22 = v16;
  v23 = v17;
  v24 = v18;
  objc_msgSend(v12, "animateWithDuration:animations:completion:", v31, v19, 0.15);

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        objc_msgSend(v7, "setTransform:", v22);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        objc_msgSend(v15, "setAffineTransform:", v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v11);
  }

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_4;
  v20[3] = &unk_24F547000;
  v21 = *(id *)(a1 + 32);
  v23 = *(_OWORD *)(a1 + 72);
  v24 = *(_OWORD *)(a1 + 88);
  v25 = *(_OWORD *)(a1 + 104);
  v22 = *(id *)(a1 + 40);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_5;
  v8[3] = &unk_24F5470A0;
  v9 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 136);
  v14 = *(_OWORD *)(a1 + 120);
  v15 = v4;
  v16 = *(_OWORD *)(a1 + 152);
  v10 = *(id *)(a1 + 40);
  v17 = *(_OWORD *)(a1 + 72);
  v18 = *(_OWORD *)(a1 + 88);
  v19 = *(_OWORD *)(a1 + 104);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v20, v8, 0.15);

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        objc_msgSend(v7, "setTransform:", v22);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        objc_msgSend(v15, "setAffineTransform:", v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v11);
  }

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_6;
  v18[3] = &unk_24F547000;
  v19 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 88);
  v21 = *(_OWORD *)(a1 + 72);
  v22 = v4;
  v23 = *(_OWORD *)(a1 + 104);
  v20 = *(id *)(a1 + 40);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_7;
  v9[3] = &unk_24F547078;
  v10 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 136);
  v15 = *(_OWORD *)(a1 + 120);
  v16 = v5;
  v17 = *(_OWORD *)(a1 + 152);
  v11 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v18, v9, 0.15);

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        objc_msgSend(v7, "setTransform:", v22);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        objc_msgSend(v15, "setAffineTransform:", v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v11);
  }

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_8;
  v12[3] = &unk_24F547000;
  v13 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 88);
  v15 = *(_OWORD *)(a1 + 72);
  v16 = v4;
  v17 = *(_OWORD *)(a1 + 104);
  v14 = *(id *)(a1 + 40);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_9;
  v8[3] = &unk_24F546EF8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v12, v8, 0.15);

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        objc_msgSend(v7, "setTransform:", v22);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        objc_msgSend(v15, "setAffineTransform:", v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v11);
  }

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_9(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", &unk_24F5497A8);
  objc_msgSend(v2, "setToValue:", &unk_24F5497B8);
  objc_msgSend(v2, "setDuration:", 0.3);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v3 = v2;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_32(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideInstructionalBanner");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("fadeOutAnimation"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = *(id *)(a1 + 56);
  AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_2_35(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_cleanupHintViews");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)_mainQueue_cleanupHintViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WQAOverlayCoordinator currentShapeLayersForHint](self, "currentShapeLayersForHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[WQAOverlayCoordinator currentShapeLayersForHint](self, "currentShapeLayersForHint", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "removeFromSuperlayer");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[WQAOverlayCoordinator setCurrentShapeLayersForHint:](self, "setCurrentShapeLayersForHint:", 0);
  }
  +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hideInstructionalBanner");

}

- (void)_mainQueue_backlightDidTurnOn
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  wqa_overlay_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B0D4000, v3, OS_LOG_TYPE_INFO, "backlight did turn on", buf, 2u);
  }

  if (_AXSWatchControlEnabled()
    && -[WQAOverlayCoordinator inputSourcesRequireFocusRing](self, "inputSourcesRequireFocusRing")
    && -[WQAOverlayCoordinator hasNoActivationGesture](self, "hasNoActivationGesture"))
  {
    wqa_overlay_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22B0D4000, v4, OS_LOG_TYPE_INFO, "activation gesture set to none, do not show overlays", v6, 2u);
    }
  }
  else
  {
    -[WQAOverlayCoordinator dataSource](self, "dataSource");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject quickActionsForOverlayCoordinator:](v4, "quickActionsForOverlayCoordinator:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WQAOverlayCoordinator _mainQueue_showUIForQuickActions:](self, "_mainQueue_showUIForQuickActions:", v5);

  }
}

- (void)_mainQueue_backlightDidTurnOff
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  wqa_overlay_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22B0D4000, v3, OS_LOG_TYPE_INFO, "backlight did turn off", v4, 2u);
  }

  -[WQAOverlayCoordinator _mainQueue_cleanupShapeLayers](self, "_mainQueue_cleanupShapeLayers");
}

- (void)_mainQueue_cleanupShapeLayers
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WQAOverlayCoordinator quickActionShapeLayers](self, "quickActionShapeLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    wqa_overlay_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[WQAOverlayCoordinator quickActionShapeLayers](self, "quickActionShapeLayers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_22B0D4000, v5, OS_LOG_TYPE_INFO, "removing shape layers: %@", buf, 0xCu);

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[WQAOverlayCoordinator quickActionShapeLayers](self, "quickActionShapeLayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          -[WQAOverlayCoordinator _mainQueue_removeShapeLayer:](self, "_mainQueue_removeShapeLayer:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    -[WQAOverlayCoordinator quickActionShapeLayers](self, "quickActionShapeLayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WQAOverlayCoordinator dataSource](self, "dataSource", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quickActionsForOverlayCoordinator:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v19, "animationHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          objc_msgSend(v20, "quickActionDidBecomeInactive:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  -[WQAOverlayCoordinator _mainQueue_cleanupHintViews](self, "_mainQueue_cleanupHintViews");
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  id v12;
  unint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "previousState") <= 1
      && (objc_msgSend(v9, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke;
      v15[3] = &unk_24F546E30;
      v15[4] = self;
      v10 = MEMORY[0x24BDAC9B8];
      v11 = v15;
LABEL_8:
      dispatch_async(v10, v11);
      goto LABEL_10;
    }
    v12 = v9;
    if ((objc_msgSend(v12, "previousState") & 0xFFFFFFFFFFFFFFFELL) != 2)
    {

      goto LABEL_10;
    }
    v13 = objc_msgSend(v12, "state");

    if (v13 <= 1)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke_2;
      v14[3] = &unk_24F546E30;
      v14[4] = self;
      v10 = MEMORY[0x24BDAC9B8];
      v11 = v14;
      goto LABEL_8;
    }
  }
LABEL_10:

}

uint64_t __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_backlightDidTurnOn");
}

uint64_t __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_backlightDidTurnOff");
}

- (WQAOverlayDataSource)dataSource
{
  return (WQAOverlayDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSMutableArray)quickActionShapeLayers
{
  return self->_quickActionShapeLayers;
}

- (void)setQuickActionShapeLayers:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionShapeLayers, a3);
}

- (NSArray)currentShapeLayersForHint
{
  return self->_currentShapeLayersForHint;
}

- (void)setCurrentShapeLayersForHint:(id)a3
{
  objc_storeStrong((id *)&self->_currentShapeLayersForHint, a3);
}

- (BOOL)receivedActivationGesture
{
  return self->_receivedActivationGesture;
}

- (void)setReceivedActivationGesture:(BOOL)a3
{
  self->_receivedActivationGesture = a3;
}

- (BOOL)hasNoActivationGesture
{
  return self->_hasNoActivationGesture;
}

- (void)setHasNoActivationGesture:(BOOL)a3
{
  self->_hasNoActivationGesture = a3;
}

- (BOOL)inputSourcesRequireFocusRing
{
  return self->_inputSourcesRequireFocusRing;
}

- (void)setInputSourcesRequireFocusRing:(BOOL)a3
{
  self->_inputSourcesRequireFocusRing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentShapeLayersForHint, 0);
  objc_storeStrong((id *)&self->_quickActionShapeLayers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (uint64_t)initWithDataSource:.cold.1()
{
  dlerror();
  abort_report_np();
  return __getWatchControlSettingsClass_block_invoke_cold_1();
}

@end
