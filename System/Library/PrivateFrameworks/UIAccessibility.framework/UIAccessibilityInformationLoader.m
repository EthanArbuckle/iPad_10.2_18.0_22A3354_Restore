@implementation UIAccessibilityInformationLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  return (id)sharedInstance__SharedInfoLoader;
}

void __50__UIAccessibilityInformationLoader_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UIAccessibilityInformationLoader _init]([UIAccessibilityInformationLoader alloc], "_init");
  v1 = (void *)sharedInstance__SharedInfoLoader;
  sharedInstance__SharedInfoLoader = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityInformationLoader;
  return -[UIAccessibilityInformationLoader init](&v3, sel_init);
}

- (void)loadAccessibilityInformation
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[UIAccessibilityInformationLoader _loadAccessibilityInformationOnMainThread:](self, "_loadAccessibilityInformationOnMainThread:", 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__UIAccessibilityInformationLoader_loadAccessibilityInformation__block_invoke;
    block[3] = &unk_1E3DFE9F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __64__UIAccessibilityInformationLoader_loadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAccessibilityInformationOnMainThread:", 0);
}

- (void)setNeedsLoadAccessibilityInformation
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[UIAccessibilityInformationLoader _setNeedsLoadAccessibilityInformationOnMainThread](self, "_setNeedsLoadAccessibilityInformationOnMainThread");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__UIAccessibilityInformationLoader_setNeedsLoadAccessibilityInformation__block_invoke;
    block[3] = &unk_1E3DFE9F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __72__UIAccessibilityInformationLoader_setNeedsLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsLoadAccessibilityInformationOnMainThread");
}

- (void)_loadAccessibilityInformationOnMainThread:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  __int128 v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  uint8_t *v52;
  uint8_t v53[128];
  uint8_t v54[4];
  void *v55;
  uint8_t buf[8];
  uint8_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  if (AXShouldLogValidationErrors())
  {
    AXLogLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      _os_log_impl(&dword_19D0DD000, v4, OS_LOG_TYPE_INFO, "loading ax info. wasCoalesced: %i", buf, 8u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(v41, "safeValueForKey:", CFSTR("delegate"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v40, "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(v41, "_accessibilityRegisterForDictationLifecycleNotifications");
  *(_QWORD *)buf = 0;
  v57 = buf;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__3;
  v60 = __Block_byref_object_dispose__3;
  v5 = MEMORY[0x1E0C809B0];
  v61 = 0;
  v48 = MEMORY[0x1E0C809B0];
  v49 = 3221225472;
  v50 = __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke;
  v51 = &unk_1E3DFDD78;
  v52 = buf;
  AXPerformSafeBlock();
  if (*((_QWORD *)v57 + 5))
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0C99DE8]);
    v7 = (void *)objc_msgSend(v6, "initWithArray:", *((_QWORD *)v57 + 5));
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CEABB8];
    v46[0] = v5;
    v46[1] = 3221225472;
    v46[2] = __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke_2;
    v46[3] = &unk_1E3DFF560;
    v10 = v7;
    v47 = v10;
    objc_msgSend(v9, "_traverseViewControllerHierarchyWithDelayedRelease:", v46);
    *(_QWORD *)&v11 = 138412290;
    v39 = v11;
    while (1)
    {
      if (!objc_msgSend(v10, "count", v39))
      {

        goto LABEL_69;
      }
      objc_msgSend(v10, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeLastObject");
      if ((objc_msgSend(v8, "containsObject:", v12) & 1) == 0)
        break;
LABEL_67:

    }
    objc_msgSend(v8, "addObject:", v12);
    objc_msgSend(v12, "_accessibilityLoadAccessibilityInformation");
    if (AXShouldLogValidationErrors())
    {
      AXLogLoading();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v54 = v39;
        v55 = v12;
        _os_log_debug_impl(&dword_19D0DD000, v13, OS_LOG_TYPE_DEBUG, "loading ax info on %@", v54, 0xCu);
      }

    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v12, "_accessibilityLoadAccessibilityInformationSupplementaryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((objc_msgSend(v8, "containsObject:", v18) & 1) == 0)
            objc_msgSend(v10, "addObject:", v18);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v15);
    }

    v19 = (objc_class *)objc_opt_class();
    if (_AXStrictIsKindOfClass(v12, v19))
    {
      objc_msgSend(v12, "rootViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v10, "addObject:", v20);

    }
    v21 = (objc_class *)objc_opt_class();
    if (_AXStrictIsKindOfClass(v12, v21))
    {
      objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v10, "addObject:", v22);
      objc_msgSend(v12, "safeValueForKey:", CFSTR("subviews"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v10, "addObjectsFromArray:", v23);
      v24 = (objc_class *)objc_opt_class();
      if (_AXStrictIsKindOfClass(v12, v24))
      {
        objc_msgSend(v12, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25 && (objc_msgSend(v25, "isProxy") & 1) == 0)
          objc_msgSend(v10, "addObject:", v26);

      }
      v27 = (objc_class *)objc_opt_class();
      if (_AXStrictIsKindOfClass(v12, v27))
      {
        objc_msgSend(v12, "safeValueForKey:", CFSTR("items"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v10, "addObjectsFromArray:", v28);

      }
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      if (_AXStrictIsKindOfClass(v12, v29))
      {
        v54[0] = 0;
        objc_opt_class();
        objc_msgSend(v12, "safeValueForKey:", CFSTR("_leftBarButtonItems"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54[0])
          abort();
        if (v22)
          objc_msgSend(v10, "addObjectsFromArray:", v22);
        v54[0] = 0;
        objc_opt_class();
        objc_msgSend(v12, "safeValueForKey:", CFSTR("_rightBarButtonItems"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54[0])
          abort();
        if (!v23)
          goto LABEL_66;
      }
      else
      {
        v32 = (objc_class *)objc_opt_class();
        if (!_AXStrictIsKindOfClass(v12, v32))
          goto LABEL_67;
        objc_msgSend(v12, "safeValueForKey:", CFSTR("presentedViewController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v10, "addObject:", v22);
        v33 = (objc_class *)objc_opt_class();
        if (_AXStrictIsKindOfClass(v12, v33))
        {
          objc_msgSend(v12, "safeValueForKey:", CFSTR("navigationBar"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
            objc_msgSend(v10, "addObject:", v34);
          objc_msgSend(v12, "safeValueForKey:", CFSTR("toolbar"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend(v10, "addObject:", v35);
          objc_msgSend(v12, "safeValueForKey:", CFSTR("viewControllers"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            objc_msgSend(v10, "addObjectsFromArray:", v36);

        }
        v37 = (objc_class *)objc_opt_class();
        if (_AXStrictIsKindOfClass(v12, v37))
        {
          objc_msgSend(v12, "safeValueForKeyPath:", CFSTR("_panelImpl.panelController"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_msgSend(v10, "addObject:", v38);

        }
        objc_msgSend(v12, "safeValueForKey:", CFSTR("childViewControllers"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_66;
      }
      objc_msgSend(v10, "addObjectsFromArray:", v23);
    }
LABEL_66:

    goto LABEL_67;
  }
LABEL_69:
  _Block_object_dispose(buf, 8);

}

void __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityAllWindowsOnlyVisibleWindows:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __78__UIAccessibilityInformationLoader__loadAccessibilityInformationOnMainThread___block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (void)_coalesceTimerFired:(id)a3
{
  -[UIAccessibilityInformationLoader _loadAccessibilityInformationOnMainThread:](self, "_loadAccessibilityInformationOnMainThread:", 1);
}

- (void)_setNeedsLoadAccessibilityInformationOnMainThread
{
  NSTimer *v3;
  NSTimer *coalesceTimer;

  -[NSTimer invalidate](self->_coalesceTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__coalesceTimerFired_, 0, 0, 0.5);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  coalesceTimer = self->_coalesceTimer;
  self->_coalesceTimer = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalesceTimer, 0);
}

@end
