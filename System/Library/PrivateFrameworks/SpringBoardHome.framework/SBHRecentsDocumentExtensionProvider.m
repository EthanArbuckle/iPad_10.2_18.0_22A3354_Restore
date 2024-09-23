@implementation SBHRecentsDocumentExtensionProvider

- (SBHRecentsDocumentExtensionProvider)init
{
  SBHRecentsDocumentExtensionProvider *v2;
  SBHRecentsDocumentExtensionProvider *v3;
  uint64_t v4;
  SBHRecentsDocumentExtensionWrappingViewController *wrappingViewController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHRecentsDocumentExtensionProvider;
  v2 = -[SBHRecentsDocumentExtensionProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:](v2, "_loadExtensionWithCompletion:", 0);
    v4 = objc_opt_new();
    wrappingViewController = v3->_wrappingViewController;
    v3->_wrappingViewController = (SBHRecentsDocumentExtensionWrappingViewController *)v4;

    -[SBHRecentsDocumentExtensionWrappingViewController setDelegate:](v3->_wrappingViewController, "setDelegate:", v3);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBHRecentsDocumentExtensionProvider _teardownHostViewController](self, "_teardownHostViewController");
  v3.receiver = self;
  v3.super_class = (Class)SBHRecentsDocumentExtensionProvider;
  -[SBHRecentsDocumentExtensionProvider dealloc](&v3, sel_dealloc);
}

- (BOOL)usesIntrinsicContentSizeBasedOnScreenSize
{
  return -[SBHRecentsDocumentExtensionWrappingViewController usesIntrinsicContentSizeBasedOnScreenSize](self->_wrappingViewController, "usesIntrinsicContentSizeBasedOnScreenSize");
}

- (void)setUsesIntrinsicContentSizeBasedOnScreenSize:(BOOL)a3
{
  -[SBHRecentsDocumentExtensionWrappingViewController setUsesIntrinsicContentSizeBasedOnScreenSize:](self->_wrappingViewController, "setUsesIntrinsicContentSizeBasedOnScreenSize:", a3);
}

- (BOOL)canShowRecentsDocumentExtensionProviderForBundleIdentifier:(id)a3
{
  return DOCShouldApplicationShowRecentsPopover();
}

- (id)recentsDocumentViewControllerForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  void (**v32)(void *, void *);
  _QWORD aBlock[4];
  id v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRecentsDocumentExtensionProvider hostViewController](self, "hostViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke;
  aBlock[3] = &unk_1E8D88198;
  v8 = v4;
  v34 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v6)
  {
    -[SBHRecentsDocumentExtensionProvider remoteService](self, "remoteService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v35[0] = v5;
    v35[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "frame");
          objc_msgSend(v16, "setFrame:");
          objc_msgSend(v16, "setNeedsLayout");
          objc_msgSend(v16, "setNeedsUpdateConstraints");
          objc_msgSend(v16, "layoutIfNeeded");

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v13);
    }
  }
  else
  {
    -[SBHRecentsDocumentExtensionProvider extension](self, "extension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SBHRecentsDocumentExtensionProvider _loadRemoteViewControllerWithConfiguration:](self, "_loadRemoteViewControllerWithConfiguration:", v9);
    }
    else
    {
      SBLogRecentsDocumentExtension();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBHRecentsDocumentExtensionProvider recentsDocumentViewControllerForBundleIdentifier:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

      v31[0] = v7;
      v31[1] = 3221225472;
      v31[2] = __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke_10;
      v31[3] = &unk_1E8D881C0;
      v31[4] = self;
      v32 = v9;
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:](self, "_loadExtensionWithCompletion:", v31);

    }
  }

  v25 = v5;
  return v25;
}

uint64_t __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateForBundleIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __88__SBHRecentsDocumentExtensionProvider_recentsDocumentViewControllerForBundleIdentifier___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadRemoteViewControllerWithConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)popoverHostExtensionRequestsDismiss:(id)a3
{
  void *v4;
  id v5;

  -[SBHRecentsDocumentExtensionProvider delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentsDocumentExtensionViewControllerRequestsDismiss:", v4);

}

- (void)popoverHostExtensionDidExit:(id)a3
{
  void *v4;
  id v5;

  -[SBHRecentsDocumentExtensionProvider _extensionWillExit:](self, "_extensionWillExit:", a3);
  -[SBHRecentsDocumentExtensionProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentsDocumentExtensionViewControllerRequestsDismiss:", v4);

}

- (BOOL)recentsDocumentExtensionWrappingViewControllerHasTransparentContent:(id)a3
{
  return 0;
}

- (void)_extensionWillExit:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SBHRecentsDocumentExtensionProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentsDocumentExtensionViewControllerRequestsDismiss:", v4);

  -[SBHRecentsDocumentExtensionProvider setExtension:](self, "setExtension:", 0);
  -[SBHRecentsDocumentExtensionProvider _teardownHostViewController](self, "_teardownHostViewController");
}

- (id)_preferredExtensionIdentifier
{
  return CFSTR("com.apple.DocumentManagerUICore.RecentsAppPopover");
}

- (void)_loadExtensionWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  id v21;

  v4 = (void (**)(id, uint64_t))a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.internal.springboard.app-popover"), *MEMORY[0x1E0CB2A28]);
  -[SBHRecentsDocumentExtensionProvider _preferredExtensionIdentifier](self, "_preferredExtensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2A08];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2A08]);

  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v5, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (objc_msgSend(v8, "count"))
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v13 = 0;
  }
  else
  {
    SBLogRecentsDocumentExtension();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:].cold.2();

    objc_msgSend(v5, "removeObjectForKey:", v7);
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v5, &v20);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v20;

    v8 = (void *)v12;
  }
  objc_msgSend(v8, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRecentsDocumentExtensionProvider setExtension:](self, "setExtension:", v14);

  if (v13)
  {
    SBLogRecentsDocumentExtension();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:].cold.1();

  }
  if (v4)
  {
    -[SBHRecentsDocumentExtensionProvider extension](self, "extension");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v13)
      v18 = 1;
    else
      v18 = v16 == 0;
    v19 = !v18;
    v4[2](v4, v19);

  }
}

- (id)_viewControllerConfiguration:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  void (**v28)(id, void *);
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRecentsDocumentExtensionProvider hostViewController](self, "hostViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBHRecentsDocumentExtensionProvider remoteService](self, "remoteService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v29[0] = v5;
    v29[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "frame");
          objc_msgSend(v13, "setFrame:");
          objc_msgSend(v13, "setNeedsLayout");
          objc_msgSend(v13, "setNeedsUpdateConstraints");
          objc_msgSend(v13, "layoutIfNeeded");

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v10);
    }
  }
  else
  {
    -[SBHRecentsDocumentExtensionProvider extension](self, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SBHRecentsDocumentExtensionProvider _loadRemoteViewControllerWithConfiguration:](self, "_loadRemoteViewControllerWithConfiguration:", v4);
    }
    else
    {
      SBLogRecentsDocumentExtension();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBHRecentsDocumentExtensionProvider recentsDocumentViewControllerForBundleIdentifier:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __68__SBHRecentsDocumentExtensionProvider__viewControllerConfiguration___block_invoke;
      v27[3] = &unk_1E8D881C0;
      v27[4] = self;
      v28 = v4;
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:](self, "_loadExtensionWithCompletion:", v27);

    }
  }

  return v5;
}

uint64_t __68__SBHRecentsDocumentExtensionProvider__viewControllerConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadRemoteViewControllerWithConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)_loadRemoteViewControllerWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[SBHRecentsDocumentExtensionProvider extension](self, "extension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke;
  v7[3] = &unk_1E8D88208;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (v7)
  {
    SBLogRecentsDocumentExtension();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_cold_1();

  }
  else if (WeakRetained)
  {
    v11 = v6;
    objc_msgSend(v11, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_27);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v9[5];
    v9[5] = v12;

    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "remoteService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    objc_msgSend(v9, "_setupHostViewController:", v11);
  }

}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogRecentsDocumentExtension();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_15_cold_1();

}

- (void)_setupHostViewController:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  SBUIPopoverExtensionHostViewController *hostViewController;
  id v8;
  id v9;

  v4 = a3;
  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_hostViewController)
  {
    objc_msgSend(v9, "preferredContentSize");
    self->_compactPreferredContentSize.width = v5;
    self->_compactPreferredContentSize.height = v6;
  }
  objc_msgSend(v4, "setDelegate:", self);
  hostViewController = self->_hostViewController;
  self->_hostViewController = (SBUIPopoverExtensionHostViewController *)v4;
  v8 = v4;

  objc_msgSend(v9, "wrapRemoteViewController:", v8);
}

- (void)_teardownHostViewController
{
  void *v3;
  SBUIPopoverExtensionHostViewController *hostViewController;
  id v5;

  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wrapRemoteViewController:", 0);

  hostViewController = self->_hostViewController;
  self->_hostViewController = 0;

  -[SBHRecentsDocumentExtensionProvider remoteService](self, "remoteService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_invalidateSBUIPopoverExtension");

}

- (SBHRecentsDocumentExtensionProviderDelegate)delegate
{
  return (SBHRecentsDocumentExtensionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHRecentsDocumentExtensionWrappingViewController)wrappingViewController
{
  return self->_wrappingViewController;
}

- (void)setWrappingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_wrappingViewController, a3);
}

- (SBUIPopoverExtensionHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (_SBUIPopoverExtensionRemoteInterface)remoteService
{
  return self->_remoteService;
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (CGSize)compactPreferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_compactPreferredContentSize.width;
  height = self->_compactPreferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCompactPreferredContentSize:(CGSize)a3
{
  self->_compactPreferredContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_wrappingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)recentsDocumentViewControllerForBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1CFEF3000, a1, a3, "Failed to instantiate SBUIPopoverExtensionHostViewController, extension is nil!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_loadExtensionWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Failed to find extensions with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_loadExtensionWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Failed to find extensions with error %@, falling back to basic attributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Failed to instantiate SBUIPopoverExtensionHostViewController from extension with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __82__SBHRecentsDocumentExtensionProvider__loadRemoteViewControllerWithConfiguration___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Failed to get remote service with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
