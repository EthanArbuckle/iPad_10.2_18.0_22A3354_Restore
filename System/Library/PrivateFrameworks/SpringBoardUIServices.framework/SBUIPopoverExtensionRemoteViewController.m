@implementation SBUIPopoverExtensionRemoteViewController

- (SBUIPopoverExtensionRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBUIPopoverExtensionRemoteViewController *v4;
  unsigned int v5;
  uint64_t v6;
  NSUUID *instanceIdentifier;
  NSObject *v8;
  NSUUID *v9;
  objc_super v11;
  uint8_t buf[4];
  NSUUID *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  v4 = -[SBUIPopoverExtensionRemoteViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    do
      v5 = __ldaxr((unsigned int *)&__activeInstanceCount);
    while (__stlxr(v5 + 1, (unsigned int *)&__activeInstanceCount));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    instanceIdentifier = v4->_instanceIdentifier;
    v4->_instanceIdentifier = (NSUUID *)v6;

    SBLogUIRemoteVC();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v4->_instanceIdentifier;
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2048;
      v15 = (int)(v5 + 1);
      _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, "%@!!> init; instance count %lu", buf, 0x16u);
    }

  }
  return v4;
}

- (void)dealloc
{
  unsigned int v3;
  signed int v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  objc_super v7;
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  do
  {
    v3 = __ldaxr((unsigned int *)&__activeInstanceCount);
    v4 = v3 - 1;
  }
  while (__stlxr(v3 - 1, (unsigned int *)&__activeInstanceCount));
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v9 = instanceIdentifier;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@!!!> dealloc; instance count %lu", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController dealloc](&v7, sel_dealloc);
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE791580);
}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE798008);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel__updateForWidgetConfiguration_, 0, 0);

  return v2;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  void *v7;
  int v8;
  NSUUID *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    v8 = 138412546;
    v9 = instanceIdentifier;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> _updateForBundleIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }

  -[SBUIPopoverExtensionRemoteViewController extensionViewController](self, "extensionViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForBundleIdentifier:", v4);

}

- (void)_updateForWidgetConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  void *v7;
  int v8;
  NSUUID *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    instanceIdentifier = self->_instanceIdentifier;
    v8 = 138412546;
    v9 = instanceIdentifier;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_INFO, "%@> _updateForWidgetConfiguration: %@", (uint8_t *)&v8, 0x16u);
  }

  -[SBUIPopoverExtensionRemoteViewController extensionViewController](self, "extensionViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForWidgetConfiguration:", v4);

}

- (void)_invalidateSBUIPopoverExtension
{
  void *v3;
  _QWORD v4[5];

  -[SBUIPopoverExtensionRemoteViewController popoverExtensionContext](self, "popoverExtensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__SBUIPopoverExtensionRemoteViewController__invalidateSBUIPopoverExtension__block_invoke;
  v4[3] = &unk_1E4C3E510;
  v4[4] = self;
  objc_msgSend(v3, "completeRequestReturningItems:completionHandler:", MEMORY[0x1E0C9AA60], v4);

}

void __75__SBUIPopoverExtensionRemoteViewController__invalidateSBUIPopoverExtension__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogUIRemoteVC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968);
    v6 = 138412546;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "%@> Terminated Extension; expired? %{BOOL}d",
      (uint8_t *)&v6,
      0x12u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  objc_super v7;
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v9 = instanceIdentifier;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewWillAppear:%{BOOL}d", buf, 0x12u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  objc_super v7;
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewDidAppear:](&v7, sel_viewDidAppear_);
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v9 = instanceIdentifier;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewDidAppear:%{BOOL}d", buf, 0x12u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  objc_super v7;
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v9 = instanceIdentifier;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewWillDisappear:%{BOOL}d", buf, 0x12u);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  objc_super v7;
  uint8_t buf[4];
  NSUUID *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v9 = instanceIdentifier;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> viewDidDisappear:%{BOOL}d", buf, 0x12u);
  }

}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  void *v7;
  void *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    v9 = 138412546;
    v10 = instanceIdentifier;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> _willAppearInRemoteViewController:%@", (uint8_t *)&v9, 0x16u);
  }

  -[SBUIPopoverExtensionRemoteViewController setHostService:](self, "setHostService:", v4);
  -[SBUIPopoverExtensionRemoteViewController popoverExtensionContext](self, "popoverExtensionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPopoverExtensionRemoteViewController hostService](self, "hostService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHostService:", v8);

}

- (void)addChildViewController:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController addChildViewController:](&v6, sel_addChildViewController_, v4);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE7D2A68))
  {
    -[SBUIPopoverExtensionRemoteViewController _setupChildViewController:](self, "_setupChildViewController:", v4);
  }
  else
  {
    SBLogUIRemoteVC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBUIPopoverExtensionRemoteViewController addChildViewController:].cold.1((uint64_t)self, v5);

  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  NSUUID *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  CGSize v14;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController preferredContentSizeDidChangeForChildContentContainer:](&v8, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize");
  -[SBUIPopoverExtensionRemoteViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    objc_msgSend(v4, "preferredContentSize");
    NSStringFromCGSize(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = instanceIdentifier;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> preferredContentSizeDidChangeForChildContentContainer; preferredContentSize: %{public}@",
      buf,
      0x16u);

  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  NSUUID *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPopoverExtensionRemoteViewController;
  -[SBUIPopoverExtensionRemoteViewController beginRequestWithExtensionContext:](&v8, sel_beginRequestWithExtensionContext_, v4);
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    *(_DWORD *)buf = 138412546;
    v10 = instanceIdentifier;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> beginRequestWithExtensionContext: %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SBLogUIRemoteVC();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBUIPopoverExtensionRemoteViewController beginRequestWithExtensionContext:].cold.1((uint64_t)self, (uint64_t)v4, v7);

  }
}

- (id)popoverExtensionContext
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[SBUIPopoverExtensionRemoteViewController extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBUIPopoverExtensionRemoteViewController extensionContext](self, "extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_setupChildViewController:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *instanceIdentifier;
  void *v7;
  void *v8;
  int v9;
  NSUUID *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogUIRemoteVC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    instanceIdentifier = self->_instanceIdentifier;
    v9 = 138412546;
    v10 = instanceIdentifier;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "%@> _setupChildViewController:%@", (uint8_t *)&v9, 0x16u);
  }

  -[SBUIPopoverExtensionRemoteViewController setExtensionViewController:](self, "setExtensionViewController:", v4);
  -[SBUIPopoverExtensionRemoteViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v7, "addSubview:", v8);

}

- (_SBUIPopoverExtensionHostInterface)hostService
{
  return self->_hostService;
}

- (void)setHostService:(id)a3
{
  objc_storeStrong((id *)&self->_hostService, a3);
}

- (SBUIPopoverExtension)extensionViewController
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
  objc_storeStrong((id *)&self->_hostService, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
}

- (void)addChildViewController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 968);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A471F000, a2, OS_LOG_TYPE_ERROR, "%@> Tried to add a view controller that does not conform to SBUIPopverExtension.", (uint8_t *)&v3, 0xCu);
}

- (void)beginRequestWithExtensionContext:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 968);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1A471F000, a3, OS_LOG_TYPE_ERROR, "%@> Unexpected extension context class %@", (uint8_t *)&v7, 0x16u);

}

@end
