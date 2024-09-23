@implementation SBHWidgetViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetViewController;
  -[SBHWidgetViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHWidgetViewController setPresentationMode:](self, "setPresentationMode:", 2);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetViewController;
  -[SBHWidgetViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SBHWidgetViewController setPresentationMode:](self, "setPresentationMode:", 1);
}

- (id)acquirePreventSceneBackgroundingAssertionForReason:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *preventBackgroundingAssertions;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  v5 = a3;
  if (!self->_preventBackgroundingAssertions)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    preventBackgroundingAssertions = self->_preventBackgroundingAssertions;
    self->_preventBackgroundingAssertions = v6;

  }
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D01868]);
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C80D38];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__SBHWidgetViewController_acquirePreventSceneBackgroundingAssertionForReason___block_invoke;
  v14[3] = &unk_1E8D85A30;
  objc_copyWeak(&v15, &location);
  v12 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:queue:invalidationBlock:", v9, v5, v10, v14);

  -[NSMutableArray addObject:](self->_preventBackgroundingAssertions, "addObject:", v12);
  -[SBHWidgetViewController log:](self, "log:", CFSTR("New preventSceneBackgroundingAssertion acquired: %@"), v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

void __78__SBHWidgetViewController_acquirePreventSceneBackgroundingAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_invalidateBackgroundingAssertion:", v3);

}

- (void)waitForContentReadyWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (self->_isInvalidated)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke;
    v8[3] = &unk_1E8D85A58;
    v9 = v6;
    -[SBHWidgetViewController ensureContentWithTimeout:completion:](self, "ensureContentWithTimeout:completion:", v8, a3);

  }
}

void __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);

  v3 = a2;
  if (v3)
  {
    SBLogWidgets();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke_cold_1(v3, v4);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v5();

}

- (void)sbh_addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)sbh_removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)sbh_setCustomDisplayConfiguration:(id)a3
{
  SBHWidgetDisplayConfiguration *v4;
  SBHWidgetDisplayConfiguration *customDisplayConfiguration;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_customDisplayConfiguration != a3)
  {
    v4 = (SBHWidgetDisplayConfiguration *)objc_msgSend(a3, "copy");
    customDisplayConfiguration = self->_customDisplayConfiguration;
    self->_customDisplayConfiguration = v4;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "widgetViewControllerDidChangeCustomDisplayConfiguration:", self);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  void *v5;
  objc_super v6;
  objc_super v7;

  if (!self->_isInvalidated)
  {
    if (-[SBHWidgetViewController presentationMode](self, "presentationMode") == a3)
    {
      if (a3 != 1 && self->_pendingStaticMode)
        self->_pendingStaticMode = 0;
    }
    else if (a3 == 1)
    {
      if (-[NSMutableArray count](self->_preventBackgroundingAssertions, "count"))
      {
        -[SBHWidgetViewController log:](self, "log:", CFSTR("Denied transition to Static due to assertions."));
        self->_pendingStaticMode = 1;
      }
      else
      {
        -[SBHWidgetViewController delegate](self, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_isInvalidatingBackgroundAssertion
          || (objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v5, "widgetViewControllerShouldTransitionSceneToBackground:", self) & 1) != 0)
        {
          self->_pendingStaticMode = 0;
          v7.receiver = self;
          v7.super_class = (Class)SBHWidgetViewController;
          -[SBHWidgetViewController setPresentationMode:](&v7, sel_setPresentationMode_, 1);
        }
        else
        {
          -[SBHWidgetViewController log:](self, "log:", CFSTR("Preventing transition to background; adding new preventBackgroundingAssertion; now %lu"),
            -[NSMutableArray count](self->_preventBackgroundingAssertions, "count"));
          self->_pendingStaticMode = 1;
        }

      }
    }
    else
    {
      self->_pendingStaticMode = 0;
      v6.receiver = self;
      v6.super_class = (Class)SBHWidgetViewController;
      -[SBHWidgetViewController setPresentationMode:](&v6, sel_setPresentationMode_, a3);
    }
  }
}

+ (id)sbh_sharedWidgetExtensionProvider
{
  if (sbh_sharedWidgetExtensionProvider_onceToken != -1)
    dispatch_once(&sbh_sharedWidgetExtensionProvider_onceToken, &__block_literal_global_5);
  return (id)sbh_sharedWidgetExtensionProvider_sharedWidgetExtensionProvider;
}

void __60__SBHWidgetViewController_sbh_sharedWidgetExtensionProvider__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D101B0]);
  v1 = (void *)sbh_sharedWidgetExtensionProvider_sharedWidgetExtensionProvider;
  sbh_sharedWidgetExtensionProvider_sharedWidgetExtensionProvider = (uint64_t)v0;

}

- (id)sbh_effectiveWidgetExtensionProvider
{
  void *v2;

  -[SBHWidgetViewController sbh_widgetExtensionProvider](self, "sbh_widgetExtensionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "sbh_sharedWidgetExtensionProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)sbh_widgetDescriptor
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHWidgetViewController sbh_effectiveWidgetExtensionProvider](self, "sbh_effectiveWidgetExtensionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetViewController widget](self, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetDescriptorForWidget:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sbh_widgetExtension
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SBHWidgetViewController sbh_effectiveWidgetExtensionProvider](self, "sbh_effectiveWidgetExtensionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetViewController widget](self, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetExtensionContainerForExtensionBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "extensionForExtensionIdentity:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_invalidateBackgroundingAssertion:(id)a3
{
  id v4;

  v4 = a3;
  -[SBHWidgetViewController log:](self, "log:", CFSTR("Invalidating preventSceneBackgroundingAssertion '%@'"), v4);
  self->_isInvalidatingBackgroundAssertion = 1;
  if (-[NSMutableArray containsObject:](self->_preventBackgroundingAssertions, "containsObject:", v4))
  {
    -[NSMutableArray removeObject:](self->_preventBackgroundingAssertions, "removeObject:", v4);
    if (self->_pendingStaticMode && !-[NSMutableArray count](self->_preventBackgroundingAssertions, "count"))
    {
      -[SBHWidgetViewController log:](self, "log:", CFSTR("Last prevent scene background assertion invalidated.  Adjusting now to static mode."));
      self->_pendingStaticMode = 0;
      -[SBHWidgetViewController setPresentationMode:](self, "setPresentationMode:", 1);
    }
  }
  self->_isInvalidatingBackgroundAssertion = 0;

}

- (void)invalidate
{
  objc_super v3;

  if (!self->_isInvalidated)
  {
    -[SBHWidgetViewController setPresentationMode:](self, "setPresentationMode:", 1);
    self->_isInvalidated = 1;
    v3.receiver = self;
    v3.super_class = (Class)SBHWidgetViewController;
    -[SBHWidgetViewController invalidate](&v3, sel_invalidate);
  }
}

- (CHSWidgetExtensionProvider)sbh_widgetExtensionProvider
{
  return (CHSWidgetExtensionProvider *)objc_loadWeakRetained((id *)&self->_widgetExtensionProvider);
}

- (void)sbh_setWidgetExtensionProvider:(id)a3
{
  objc_storeWeak((id *)&self->_widgetExtensionProvider, a3);
}

- (SBHWidgetDisplayConfiguration)sbh_customDisplayConfiguration
{
  return self->_customDisplayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDisplayConfiguration, 0);
  objc_destroyWeak((id *)&self->_widgetExtensionProvider);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_preventBackgroundingAssertions, 0);
}

void __69__SBHWidgetViewController_waitForContentReadyWithTimeout_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136446466;
  v5 = "-[SBHWidgetViewController waitForContentReadyWithTimeout:completion:]_block_invoke";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "%{public}s Error waiting for non-placeholder content to appear: %{public}@", (uint8_t *)&v4, 0x16u);

}

@end
