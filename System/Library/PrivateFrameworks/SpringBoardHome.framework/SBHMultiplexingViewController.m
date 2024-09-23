@implementation SBHMultiplexingViewController

- (BOOL)sbh_isMultiplexingViewController
{
  return 1;
}

- (UIViewController)multiplexedViewController
{
  return self->_multiplexedViewController;
}

- (SBHMultiplexingViewController)initWithLevel:(double)a3 identifier:(id)a4
{
  id v6;
  SBHMultiplexingViewController *v7;
  SBHMultiplexingViewController *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHMultiplexingViewController;
  v7 = -[SBHMultiplexingViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_level = a3;
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBHMultiplexingViewController multiplexingManager](self, "multiplexingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validateActiveMultiplexingViewControllerForIdentifier:", self->_identifier);

  v4.receiver = self;
  v4.super_class = (Class)SBHMultiplexingViewController;
  -[SBHMultiplexingViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[SBHMultiplexingViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHMultiplexingViewController;
  -[SBHMultiplexingViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHMultiplexingViewController _setUpMultiplexedViewController](self, "_setUpMultiplexedViewController");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)activateWithViewController:(id)a3
{
  UIViewController *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  UIViewController *multiplexedViewController;
  int v11;
  void *v12;
  __int16 v13;
  SBHMultiplexingViewController *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  UIViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (UIViewController *)a3;
  SBLogWidgets();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544386;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2080;
    v16 = "-[SBHMultiplexingViewController activateWithViewController:]";
    v17 = 2114;
    v18 = v9;
    v19 = 2048;
    v20 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s <%{public}@:%p>", (uint8_t *)&v11, 0x34u);

  }
  multiplexedViewController = self->_multiplexedViewController;
  self->_multiplexedViewController = v4;

  if (-[SBHMultiplexingViewController isViewLoaded](self, "isViewLoaded"))
    -[SBHMultiplexingViewController _setUpMultiplexedViewController](self, "_setUpMultiplexedViewController");
}

- (void)deactivate
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  UIViewController *multiplexedViewController;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  SBHMultiplexingViewController *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_multiplexedViewController)
  {
    SBLogWidgets();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_DEACTIVATE", "%{public}@", buf, 0xCu);

    }
    SBLogWidgets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      v26 = 2048;
      v27 = self;
      v28 = 2080;
      v29 = "-[SBHMultiplexingViewController deactivate]";
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> %s", buf, 0x20u);

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "multiplexingViewControllerWillDeactivate:", self);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    multiplexedViewController = self->_multiplexedViewController;
    self->_multiplexedViewController = 0;

    SBLogWidgets();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_DEACTIVATE", " isAnimation=YES ", buf, 2u);
    }

  }
}

- (void)addObserver:(id)a3
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

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_setUpMultiplexedViewController
{
  UIViewController *v3;
  UIViewController *v4;
  SBHMultiplexingViewController *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = self->_multiplexedViewController;
  v4 = v3;
  if (v3)
  {
    -[UIViewController parentViewController](v3, "parentViewController");
    v5 = (SBHMultiplexingViewController *)objc_claimAutoreleasedReturnValue();

    if (v5 != self)
    {
      SBLogWidgets();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v6))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v9, self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_ACTIVATE", "%{public}@", buf, 0xCu);

      }
      -[UIViewController view](v4, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHMultiplexingViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      objc_msgSend(v11, "setFrame:");

      objc_msgSend(v11, "setAutoresizingMask:", 18);
      -[UIViewController bs_endAppearanceTransition:](v4, "bs_endAppearanceTransition:", 1);
      -[SBHMultiplexingViewController bs_addChildViewController:](self, "bs_addChildViewController:", v4);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = (void *)-[NSHashTable copy](self->_observers, "copy");
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "multiplexingViewControllerDidActivate:", self);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }

      SBLogWidgets();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_MULTIPLEX_ACTIVATE", " isAnimation=YES ", buf, 2u);
      }

    }
  }

}

- (double)level
{
  return self->_level;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (SBHMultiplexingManager)multiplexingManager
{
  return self->_multiplexingManager;
}

- (void)setMultiplexingManager:(id)a3
{
  objc_storeStrong((id *)&self->_multiplexingManager, a3);
}

- (BOOL)multiplexedViewControllerShowsContentWhileDeactivated
{
  return self->_multiplexedViewControllerShowsContentWhileDeactivated;
}

- (void)setMultiplexedViewControllerShowsContentWhileDeactivated:(BOOL)a3
{
  self->_multiplexedViewControllerShowsContentWhileDeactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiplexingManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_multiplexedViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)sbh_underlyingAvocadoHostViewControllers
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBHMultiplexingViewController multiplexedViewController](self, "multiplexedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sbh_isWidgetHostViewController");
  v5 = (void *)MEMORY[0x1E0C99E60];
  if ((v4 & 1) != 0)
  {
    -[SBHMultiplexingViewController multiplexedViewController](self, "multiplexedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
