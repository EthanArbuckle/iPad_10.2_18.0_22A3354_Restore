@implementation PSViewController

- (id)rootController
{
  PSRootController **p_rootController;
  id WeakRetained;
  NSObject *v5;

  p_rootController = &self->_rootController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);

  if (!WeakRetained)
  {
    _PSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PSViewController rootController].cold.1((uint64_t)self, v5);

  }
  return objc_loadWeakRetained((id *)p_rootController);
}

- (void)viewDidLoad
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PSViewController;
  -[PSViewController viewDidLoad](&v18, sel_viewDidLoad);
  PKLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController viewIfLoaded](self, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentViewController](self, "parentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545666;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    v23 = 2160;
    v24 = 1752392040;
    v25 = 2112;
    v26 = v9;
    v27 = 2160;
    v28 = 1752392040;
    v29 = 2112;
    v30 = v10;
    v31 = 2160;
    v32 = 1752392040;
    v33 = 2112;
    v34 = v11;
    v35 = 2160;
    v36 = 1752392040;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x66u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);
  if (WeakRetained)
  {
    v14 = WeakRetained;
    -[PSViewController rootController](self, "rootController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[PSViewController rootController](self, "rootController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logSettingsPath");

    }
  }
}

- (PSViewController)init
{
  PSViewController *v2;
  PSViewController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSViewController;
  v2 = -[PSViewController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[PSViewController navigationItemLargeTitleDisplayMode](v2, "navigationItemLargeTitleDisplayMode");
    -[PSViewController navigationItem](v3, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLargeTitleDisplayMode:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_handleCanBeShownFromSuspendedState_, *MEMORY[0x1E0CEB288], 0);

  }
  return v3;
}

- (int64_t)navigationItemLargeTitleDisplayMode
{
  return 2;
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", a3);
}

- (void)setSpecifier:(id)a3
{
  PSSpecifier *v5;
  PSSpecifier *v6;

  v5 = (PSSpecifier *)a3;
  if (self->_specifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_specifier, a3);
    v5 = v6;
  }

}

- (void)setRootController:(id)a3
{
  objc_storeWeak((id *)&self->_rootController, a3);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (void)handleCanBeShownFromSuspendedState:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PSViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self);

  if (v6 && !-[PSViewController canBeShownFromSuspendedState](self, "canBeShownFromSuspendedState"))
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[PSViewController handleCanBeShownFromSuspendedState:]";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@ canBeShownFromSuspendedState is NO, popping/dismissing controller.", (uint8_t *)&v14, 0x16u);

    }
    -[PSViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "popToViewController:animated:", self, 0);

    -[PSViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 0);

    -[PSViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
}

- (id)parentController
{
  return objc_loadWeakRetained((id *)&self->_parentController);
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  +[PSRootController setPreferenceValue:specifier:](PSRootController, "setPreferenceValue:specifier:", a3, a4);
}

- (void)showController:(id)a3
{
  -[PSViewController showController:animate:](self, "showController:animate:", a3, 1);
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PSViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "childViewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "containsObject:", v7))
  {
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSViewController showController:animate:].cold.3(v10);

    _PSLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PSViewController showController:animate:].cold.2();

    _PSLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PSViewController showController:animate:].cold.1();

  }
  PKLogForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544386;
    v19 = v15;
    v20 = 2114;
    v21 = v16;
    v22 = 2160;
    v23 = 1752392040;
    v24 = 2112;
    v25 = v7;
    v26 = 1024;
    v27 = v4;
    _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ called with %{mask.hash}@, %{BOOL}d", (uint8_t *)&v18, 0x30u);

  }
  if (v4)
  {
    -[PSViewController showViewController:sender:](self, "showViewController:sender:", v7, self);
  }
  else
  {
    -[PSViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushViewController:animated:", v7, 0);

  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment")&& (-[PSViewController viewIfLoaded](self, "viewIfLoaded"), v7 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "window"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v7, !v8))
  {
    -[PSViewController setUrlResourceDictionaryPendingViewControllerContainment:](self, "setUrlResourceDictionaryPendingViewControllerContainment:", v9);
    -[PSViewController setUrlCompletionHandlerPendingViewControllerContainment:](self, "setUrlCompletionHandlerPendingViewControllerContainment:", v6);
  }
  else
  {
    -[PSViewController setCallingHandleURLFromHandleURLWithCompletion:](self, "setCallingHandleURLFromHandleURLWithCompletion:", 1);
    -[PSViewController handleURL:](self, "handleURL:", v9);
    -[PSViewController setCallingHandleURLFromHandleURLWithCompletion:](self, "setCallingHandleURLFromHandleURLWithCompletion:", 0);
    if (v6)
      v6[2](v6);
  }

}

- (void)handleURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[PSViewController isCallingHandleURLFromHandleURLWithCompletion](self, "isCallingHandleURLFromHandleURLWithCompletion"))
  {
    if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment"))
    {
      -[PSViewController viewIfLoaded](self, "viewIfLoaded");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        -[PSViewController setUrlResourceDictionaryPendingViewControllerContainment:](self, "setUrlResourceDictionaryPendingViewControllerContainment:", v6);
    }
  }

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewIsAppearing:](&v15, sel_viewIsAppearing_);
  PKLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = v3;
    v22 = 2160;
    v23 = 1752392040;
    v24 = 2112;
    v25 = v11;
    v26 = 2160;
    v27 = 1752392040;
    v28 = 2112;
    v29 = v12;
    v30 = 2160;
    v31 = 1752392040;
    v32 = 2112;
    v33 = v13;
    v34 = 2160;
    v35 = 1752392040;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  PKLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = v3;
    v22 = 2160;
    v23 = 1752392040;
    v24 = 2112;
    v25 = v11;
    v26 = 2160;
    v27 = 1752392040;
    v28 = 2112;
    v29 = v12;
    v30 = 2160;
    v31 = 1752392040;
    v32 = 2112;
    v33 = v13;
    v34 = 2160;
    v35 = 1752392040;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PSViewController;
  -[PSViewController viewDidAppear:](&v16, sel_viewDidAppear_);
  PKLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    v21 = 1024;
    v22 = v3;
    v23 = 2160;
    v24 = 1752392040;
    v25 = 2112;
    v26 = v11;
    v27 = 2160;
    v28 = 1752392040;
    v29 = 2112;
    v30 = v12;
    v31 = 2160;
    v32 = 1752392040;
    v33 = 2112;
    v34 = v13;
    v35 = 2160;
    v36 = 1752392040;
    v37 = 2112;
    v38 = v14;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);

  }
  if (-[PSViewController _isUndoSupportedInCurrentEnvironment](self, "_isUndoSupportedInCurrentEnvironment"))
    -[PSViewController becomeFirstResponder](self, "becomeFirstResponder");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PSViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __34__PSViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleURLForPendingViewControllerContainmentIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  PKLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = v3;
    v22 = 2160;
    v23 = 1752392040;
    v24 = 2112;
    v25 = v11;
    v26 = 2160;
    v27 = 1752392040;
    v28 = 2112;
    v29 = v12;
    v30 = 2160;
    v31 = 1752392040;
    v32 = 2112;
    v33 = v13;
    v34 = 2160;
    v35 = 1752392040;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);

  }
  if (-[PSViewController _isUndoSupportedInCurrentEnvironment](self, "_isUndoSupportedInCurrentEnvironment"))
    -[PSViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PSViewController;
  -[PSViewController viewDidDisappear:](&v15, sel_viewDidDisappear_);
  PKLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentViewController](self, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSViewController parentController](self, "parentController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545922;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = v3;
    v22 = 2160;
    v23 = 1752392040;
    v24 = 2112;
    v25 = v11;
    v26 = 2160;
    v27 = 1752392040;
    v28 = 2112;
    v29 = v12;
    v30 = 2160;
    v31 = 1752392040;
    v32 = 2112;
    v33 = v13;
    v34 = 2160;
    v35 = 1752392040;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Was called with { animated: %{BOOL}d, window of viewIfLoaded: %{mask.hash}@, navigationController: %{mask.hash}@, parentViewController: %{mask.hash}@, parentPreferencesController: %{mask.hash}@ }.", buf, 0x6Cu);

  }
}

- (BOOL)_isUndoSupportedInCurrentEnvironment
{
  int v2;
  void *v3;
  void *v4;
  char v5;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences"));

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)handleURLForPendingViewControllerContainmentIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  char isKindOfClass;
  id v7;

  if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment"))
  {
    -[PSViewController urlResourceDictionaryPendingViewControllerContainment](self, "urlResourceDictionaryPendingViewControllerContainment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PSViewController urlCompletionHandlerPendingViewControllerContainment](self, "urlCompletionHandlerPendingViewControllerContainment");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PSViewController setUrlCompletionHandlerPendingViewControllerContainment:](self, "setUrlCompletionHandlerPendingViewControllerContainment:", 0);
      -[PSViewController urlResourceDictionaryPendingViewControllerContainment](self, "urlResourceDictionaryPendingViewControllerContainment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSViewController setUrlResourceDictionaryPendingViewControllerContainment:](self, "setUrlResourceDictionaryPendingViewControllerContainment:", 0);
      v5 = v7;
      if (v7
        || (NSClassFromString(CFSTR("PSListController")),
            isKindOfClass = objc_opt_isKindOfClass(),
            v5 = 0,
            (isKindOfClass & 1) != 0))
      {
        -[PSViewController handleURL:withCompletion:](self, "handleURL:withCompletion:", v4, v5);
      }
      else
      {
        -[PSViewController handleURL:](self, "handleURL:", v4);
      }

    }
  }
}

- (void)addChildViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSViewController;
  -[PSViewController addChildViewController:](&v8, sel_addChildViewController_, v4);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (-[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment")&& v7)
  {
    objc_msgSend(v7, "setUrlHandlingDeferredForViewControllerContainment:", -[PSViewController isURLHandlingDeferredForViewControllerContainment](self, "isURLHandlingDeferredForViewControllerContainment"));
  }

}

- (BOOL)isURLHandlingDeferredForViewControllerContainment
{
  return self->_urlHandlingDeferredForViewControllerContainment;
}

- (void)setUrlHandlingDeferredForViewControllerContainment:(BOOL)a3
{
  self->_urlHandlingDeferredForViewControllerContainment = a3;
}

- (BOOL)isCallingHandleURLFromHandleURLWithCompletion
{
  return self->_callingHandleURLFromHandleURLWithCompletion;
}

- (void)setCallingHandleURLFromHandleURLWithCompletion:(BOOL)a3
{
  self->_callingHandleURLFromHandleURLWithCompletion = a3;
}

- (NSDictionary)urlResourceDictionaryPendingViewControllerContainment
{
  return self->_urlResourceDictionaryPendingViewControllerContainment;
}

- (void)setUrlResourceDictionaryPendingViewControllerContainment:(id)a3
{
  objc_storeStrong((id *)&self->_urlResourceDictionaryPendingViewControllerContainment, a3);
}

- (id)urlCompletionHandlerPendingViewControllerContainment
{
  return self->_urlCompletionHandlerPendingViewControllerContainment;
}

- (void)setUrlCompletionHandlerPendingViewControllerContainment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlCompletionHandlerPendingViewControllerContainment, 0);
  objc_storeStrong((id *)&self->_urlResourceDictionaryPendingViewControllerContainment, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);
  objc_destroyWeak((id *)&self->_parentController);
}

- (void)rootController
{
  objc_class *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[PSViewController rootController]";
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "%s: %@'s .rootController was accessed, but rootController will be nil for most controllers. This usage of rootController should be replaced by PSViewController's methods, or by accessing .navigationController", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_9();
}

- (void)showController:animate:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1A3819000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)showController:animate:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CEABB8], "_printHierarchy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1A3819000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)showController:(os_log_t)log animate:.cold.3(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[PSViewController showController:animate:]";
  _os_log_error_impl(&dword_1A3819000, log, OS_LOG_TYPE_ERROR, "%s: pushing a view controller that's already in the stack.", (uint8_t *)&v1, 0xCu);
}

@end
