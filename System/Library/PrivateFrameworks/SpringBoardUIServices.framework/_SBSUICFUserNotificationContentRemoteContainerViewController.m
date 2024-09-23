@implementation _SBSUICFUserNotificationContentRemoteContainerViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7D2D68);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7BC5B8);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  _SBSUICFUserNotificationContentRemoteContainerViewController *v15;
  id v16;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionViewController](self, "extensionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBSUICFUserNotificationContentRemoteContainerViewController.m"), 52, CFSTR("Extension view controller must exist to continue."));

  }
  SBLogCFUserNotifications();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = self;
    _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Received configuration request.", buf, 0xCu);
  }

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __88___SBSUICFUserNotificationContentRemoteContainerViewController_configureWithCompletion___block_invoke;
  v14 = &unk_1E4C3E498;
  v15 = self;
  v8 = v5;
  v16 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x1A85A1798](&v11);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v11, v12, v13, v14, v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "configureWithCompletion:", v9);
  else
    v9[2](v9);

}

- (void)invalidateWithCompletion:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBSUIUserNotificationContentProviding _appearState](self->_extensionViewController, "_appearState") - 1;
  if (v5 <= 1)
    -[SBSUIUserNotificationContentProviding beginAppearanceTransition:animated:](self->_extensionViewController, "beginAppearanceTransition:animated:", 0, 0);
  -[SBSUIUserNotificationContentProviding parentViewController](self->_extensionViewController, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SBSUIUserNotificationContentProviding removeFromParentViewController](self->_extensionViewController, "removeFromParentViewController");
  if (v5 <= 1)
    -[SBSUIUserNotificationContentProviding endAppearanceTransition](self->_extensionViewController, "endAppearanceTransition");
  SBLogCFUserNotifications();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = self;
    _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Received invalidate.", buf, 0xCu);
  }

  -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionViewController](self, "extensionViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "invalidate");
  -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionContext](self, "extensionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89___SBSUICFUserNotificationContentRemoteContainerViewController_invalidateWithCompletion___block_invoke;
  v11[3] = &unk_1E4C3E4E8;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "completeRequestReturningItems:completionHandler:", 0, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  SBLogCFUserNotifications();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "<%p> View will appear.", buf, 0xCu);
  }

  -[_SBSUICFUserNotificationContentRemoteContainerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewDidLoad
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController viewDidLoad](&v8, sel_viewDidLoad);
  SBLogCFUserNotifications();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = self;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "<%p> View will load.", buf, 0xCu);
  }

  if (!self->_extensionViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBSUICFUserNotificationContentRemoteContainerViewController.m"), 114, CFSTR("We require an extension view controller at viewDidLoad."));

  }
  -[_SBSUICFUserNotificationContentRemoteContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIUserNotificationContentProviding view](self->_extensionViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  SBLogCFUserNotifications();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "<%p> View did disappear.", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)addChildViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  v4 = a3;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController addChildViewController:](&v5, sel_addChildViewController_, v4);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController _trackChildViewController:](self, "_trackChildViewController:", v4, v5.receiver, v5.super_class);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;
  CGSize v13;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCFUserNotifications();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "preferredContentSize");
    NSStringFromCGSize(v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Child content's preferred content size did change to %{public}@", buf, 0x16u);

  }
  v7.receiver = self;
  v7.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v7, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SBSUICFUserNotificationContentRemoteContainerViewController;
  -[_SBSUICFUserNotificationContentRemoteContainerViewController beginRequestWithExtensionContext:](&v6, sel_beginRequestWithExtensionContext_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_SBSUICFUserNotificationContentRemoteContainerViewController beginRequestWithExtensionContext:].cold.1((uint64_t)v4, v5);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)userNotificationContentExtensionContext
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionContext](self, "extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_trackChildViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  NSObject *v10;
  _BOOL4 isLegacyContentViewController;
  SBSUIUserNotificationContentProviding *extensionViewController;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  _SBSUICFUserNotificationContentRemoteContainerViewController *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  SBSUIUserNotificationContentProviding *v21;
  __int16 v22;
  SBSUIUserNotificationContentProviding *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_extensionViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBSUICFUserNotificationContentRemoteContainerViewController.m"), 169, CFSTR("Cannot have an existing extension view controller for this extension.  Existing = %@, New: %@"), self->_extensionViewController, v5);

  }
  -[_SBSUICFUserNotificationContentRemoteContainerViewController setExtensionViewController:](self, "setExtensionViewController:", v5);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController userNotificationContentExtensionContext](self, "userNotificationContentExtensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBSUICFUserNotificationContentRemoteContainerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHostService:", v7);

  v8 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE7B6A18);
  v9 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE7B6990);
  if ((v8 & 1) == 0 && (v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBSUICFUserNotificationContentRemoteContainerViewController.m"), 176, CFSTR("CFUserNotification content extension view controller (%@) must extend and support the current interface protocol: <SBSUIUserNotificationContentProviding>."), v5);

  }
  self->_isLegacyContentViewController = v8;
  SBLogCFUserNotifications();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    isLegacyContentViewController = self->_isLegacyContentViewController;
    extensionViewController = self->_extensionViewController;
    *(_DWORD *)buf = 134218754;
    if (isLegacyContentViewController)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v17 = self;
    v18 = 2114;
    v19 = v13;
    v20 = 2048;
    v21 = extensionViewController;
    v22 = 2112;
    v23 = extensionViewController;
    _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Extension view controller initialized (legacy=%{public}@): %p - %@", buf, 0x2Au);
  }

}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionViewController](self, "extensionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  v7 = v6;

  -[_SBSUICFUserNotificationContentRemoteContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  -[_SBSUICFUserNotificationContentRemoteContainerViewController extensionViewController](self, "extensionViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v7);

}

- (SBSUIUserNotificationContentProviding)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionViewController, 0);
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A471F000, a2, OS_LOG_TYPE_ERROR, "Unexpected extension context class %@", (uint8_t *)&v5, 0xCu);

}

@end
