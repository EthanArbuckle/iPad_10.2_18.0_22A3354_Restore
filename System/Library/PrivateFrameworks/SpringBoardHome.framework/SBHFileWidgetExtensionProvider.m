@implementation SBHFileWidgetExtensionProvider

- (SBHFileWidgetExtensionProvider)init
{
  SBHFileWidgetExtensionProvider *v2;
  SBHFileWidgetExtensionProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHFileWidgetExtensionProvider;
  v2 = -[SBHRecentsDocumentExtensionProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBHRecentsDocumentExtensionProvider extension](v2, "extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v3->_widgetHasTransparentBackground = -[SBHFileWidgetExtensionProvider _extensionHasTransparencyEntitlement:](v3, "_extensionHasTransparencyEntitlement:", v4);

  }
  return v3;
}

- (id)filesWidgetViewControllerWithConfiguration:(id)a3
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  void (**v38)(void *, void *);
  _QWORD aBlock[4];
  id v40;
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHRecentsDocumentExtensionProvider wrappingViewController](self, "wrappingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHRecentsDocumentExtensionProvider hostViewController](self, "hostViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke;
  aBlock[3] = &unk_1E8D88198;
  v8 = v4;
  v40 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v6)
  {
    -[SBHRecentsDocumentExtensionProvider remoteService](self, "remoteService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v41[0] = v5;
    v41[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "frame");
          v18 = v17;
          v20 = v19;
          -[SBHRecentsDocumentExtensionProvider compactPreferredContentSize](self, "compactPreferredContentSize");
          objc_msgSend(v16, "setFrame:", v18, v20, v21, v22);
          objc_msgSend(v16, "setNeedsLayout");
          objc_msgSend(v16, "setNeedsUpdateConstraints");
          objc_msgSend(v16, "layoutIfNeeded");

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
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
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[SBHRecentsDocumentExtensionProvider recentsDocumentViewControllerForBundleIdentifier:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

      v37[0] = v7;
      v37[1] = 3221225472;
      v37[2] = __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke_126;
      v37[3] = &unk_1E8D881C0;
      v37[4] = self;
      v38 = v9;
      -[SBHRecentsDocumentExtensionProvider _loadExtensionWithCompletion:](self, "_loadExtensionWithCompletion:", v37);

    }
  }

  v31 = v5;
  return v31;
}

uint64_t __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateForWidgetConfiguration:", *(_QWORD *)(a1 + 32));
}

uint64_t __77__SBHFileWidgetExtensionProvider_filesWidgetViewControllerWithConfiguration___block_invoke_126(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadRemoteViewControllerWithConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)setWidgetConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHRecentsDocumentExtensionProvider remoteService](self, "remoteService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateForWidgetConfiguration:", v4);

}

- (id)_preferredExtensionIdentifier
{
  return CFSTR("com.apple.DocumentManagerUICore.RecentsAvocado");
}

- (void)_setupHostViewController:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHFileWidgetExtensionProvider;
  v3 = a3;
  -[SBHRecentsDocumentExtensionProvider _setupHostViewController:](&v4, sel__setupHostViewController_, v3);
  objc_msgSend(v3, "setServiceViewShouldShareTouchesWithHost:", 1, v4.receiver, v4.super_class);

}

- (BOOL)_extensionHasTransparencyEntitlement:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = (objc_class *)MEMORY[0x1E0CA5848];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:error:", v6, 0);
  objc_msgSend(v7, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("com.apple.springboard.temporary.files-widget-transparency"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

- (BOOL)widgetHasTransparentBackground
{
  return self->_widgetHasTransparentBackground;
}

- (void)setWidgetHasTransparentBackground:(BOOL)a3
{
  self->_widgetHasTransparentBackground = a3;
}

@end
