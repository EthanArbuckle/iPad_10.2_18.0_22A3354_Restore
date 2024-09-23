@implementation UIApplicationExtensionActivity

- (UIApplicationExtensionActivity)initWithApplicationExtension:(id)a3
{
  id v4;
  UIApplicationExtensionActivity *v5;
  UIApplicationExtensionActivity *v6;
  UIApplicationExtensionActivity *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationExtensionActivity;
  v5 = -[UIActivity init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIApplicationExtensionActivity setApplicationExtension:](v5, "setApplicationExtension:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSExtension set_requestPostCompletionBlockWithItems:](self->_applicationExtension, "set_requestPostCompletionBlockWithItems:", 0);
  -[NSExtension setRequestCompletionBlock:](self->_applicationExtension, "setRequestCompletionBlock:", 0);
  -[NSExtension setRequestCancellationBlock:](self->_applicationExtension, "setRequestCancellationBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationExtensionActivity;
  -[UIApplicationExtensionActivity dealloc](&v3, sel_dealloc);
}

- (int64_t)activityCategory
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UIApplicationExtensionActivity overrideActivityCategory](self, "overrideActivityCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIApplicationExtensionActivity overrideActivityCategory](self, "overrideActivityCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)objc_msgSend(v4, "intValue");

  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "activityCategory");
  }

  return v5;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationExtensionActivity;
  -[UIActivity description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {extension = %@}"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setApplicationExtension:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_applicationExtension, a3);
  v5 = a3;
  objc_msgSend(v5, "_plugIn");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  self->_installationDate = (NSDate *)(id)objc_msgSend(v6, "timestamp");
}

- (NSString)containingAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIApplicationExtensionActivity activityBundleHelper](self, "activityBundleHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  void *v2;
  void *v3;

  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_defaultSortGroup
{
  return 4;
}

- (id)activityTitle
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[UIApplicationExtensionActivity activityCategory](self, "activityCategory");
  -[UIApplicationExtensionActivity activityBundleHelper](self, "activityBundleHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 == 1)
  {
    objc_msgSend(v5, "containingBundle");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  -[UIActivity preferredLocalizations](self, "preferredLocalizations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (-[UIActivity preferredLocalizations](self, "preferredLocalizations"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "localizedNameWithPreferredLocalizations:useShortNameOnly:", v9, 0),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    objc_msgSend(v6, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v6, "localizedShortName");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v13;

  }
  return v10;
}

- (id)_activityImage
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[UIApplicationExtensionActivity activityCategory](self, "activityCategory");
  -[UIApplicationExtensionActivity activityBundleHelper](self, "activityBundleHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivity contentSizeCategory](self, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForApplicationIconFormat:activityCategory:contentSizeCategory:", 10, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !v6)
  {
    objc_msgSend((id)objc_opt_class(), "_activityImageForActionRepresentationImage:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)_activitySettingsImage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = -[UIApplicationExtensionActivity activityCategory](self, "activityCategory");
  if (v3)
  {
    -[UIApplicationExtensionActivity activityBundleHelper](self, "activityBundleHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivity contentSizeCategory](self, "contentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageForApplicationIconFormat:activityCategory:contentSizeCategory:", 0, v3, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_actionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIApplicationExtensionActivity activityBundleHelper](self, "activityBundleHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivity contentSizeCategory](self, "contentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForApplicationIconFormat:activityCategory:contentSizeCategory:", 10, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_class();
  -[UIActivity contentSizeCategory](self, "contentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_actionImageForActionRepresentationImage:contentSizeCategory:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3
{
  return objc_msgSend(a3, "canExcludeExtensionActivities");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (BOOL)_isServiceExtension
{
  void *v2;
  void *v3;
  char v4;

  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.services"));

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIApplicationExtensionActivity _injectedExtensionItem](self, "_injectedExtensionItem");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  -[UIApplicationExtensionActivity extensionItemDataRequest](self, "extensionItemDataRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[UIApplicationExtensionActivity activityType](self, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISUIActivityExtensionItemDataRequest requestForActivity:activityType:](UISUIActivityExtensionItemDataRequest, "requestForActivity:activityType:", self, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "preparedActivityExtensionItemDataForActivityItemValues:extensionItemDataRequest:", v4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIApplicationExtensionActivity prepareWithActivityExtensionItemData:](self, "prepareWithActivityExtensionItemData:", v10);

}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  id v18;
  id location;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  location = 0;
  objc_initWeak(&location, self);
  -[UIApplicationExtensionActivity originalFileURL](self, "originalFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIApplicationExtensionActivity originalFileURL](self, "originalFileURL");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "fileSystemRepresentation");
    v10 = sandbox_extension_issue_file();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v11, CFSTR("sandbox-token"));
    v20[0] = v12;
    -[UIApplicationExtensionActivity originalFileURL](self, "originalFileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationExtensionActivity prepareWithActivityItems:](self, "prepareWithActivityItems:", v14);

    v7[2](v7);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D97420];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__UIApplicationExtensionActivity__prepareWithActivityItems_completion___block_invoke;
    v16[3] = &unk_1E4001BC0;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    objc_msgSend(v15, "loadSendCopyRepresentationIfNeededForActivityItems:completion:", v6, v16);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);

}

void __71__UIApplicationExtensionActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v4 = v3;
  v5 = *(id *)(a1 + 32);
  sf_dispatch_on_main_queue();

  objc_destroyWeak(&v6);
}

uint64_t __71__UIApplicationExtensionActivity__prepareWithActivityItems_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "prepareWithActivityItems:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(v4, "extensionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIApplicationExtensionActivity _isServiceExtension](self, "_isServiceExtension"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke;
    v17[3] = &unk_1E4003180;
    objc_copyWeak(&v18, &location);
    -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "set_requestPostCompletionBlockWithItems:", v17);

    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_14;
    v15[3] = &unk_1E40031A8;
    objc_copyWeak(&v16, &location);
    -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequestCancellationBlock:", v15);

    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_17;
    v13[3] = &unk_1E40031D0;
    objc_copyWeak(&v14, &location);
    -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequestInterruptionBlock:", v13);

    -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_24;
    v11[3] = &unk_1E40031A8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "beginExtensionRequestWithInputItems:completion:", v5, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[UIApplicationExtensionActivity _instantiateExtensionViewControllerWithInputItems:](self, "_instantiateExtensionViewControllerWithInputItems:", v5);
  }

}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2;
  block[3] = &unk_1E4001A88;
  v13 = v6;
  v14 = WeakRetained;
  v15 = v7;
  v9 = v7;
  v10 = WeakRetained;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "completed request - items: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setExtensionRequestCleanupCompletion:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "activityDidFinish:items:error:", 1, *(_QWORD *)(a1 + 32), 0);
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_15;
  v8[3] = &unk_1E4001248;
  v9 = v4;
  v10 = WeakRetained;
  v6 = WeakRetained;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_15(uint64_t a1)
{
  NSObject *v2;

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_15_cold_1(a1);

  return objc_msgSend(*(id *)(a1 + 40), "activityDidFinish:items:error:", 0, 0, *(_QWORD *)(a1 + 32));
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_18;
  block[3] = &unk_1E4001608;
  v4 = WeakRetained;
  v2 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = CFSTR("Extension was interrupted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_18_cold_1(v5);

  objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:items:error:", 0, 0, v5);
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_25;
  block[3] = &unk_1E4001730;
  v12 = v5;
  v13 = v6;
  v14 = WeakRetained;
  v8 = WeakRetained;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_25(uint64_t a1)
{
  NSObject *v3;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 48), "setExtensionContextIdentifier:");
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_25_cold_1(a1);

  return objc_msgSend(*(id *)(a1 + 48), "activityDidFinish:items:error:", 0, 0, *(_QWORD *)(a1 + 40));
}

+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  return _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(a3, a4);
}

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v6;
  id v7;
  UISUIActivityExtensionItemData *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(UISUIActivityExtensionItemData);
  objc_msgSend(a1, "_activityExtensionItemsForActivityItemValues:extensionItemDataRequest:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISUIActivityExtensionItemData setExtensionItems:](v8, "setExtensionItems:", v9);
  return v8;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;

  v7 = a5;
  -[UIApplicationExtensionActivity setPresenterViewController:](self, "setPresenterViewController:", a3);
  -[UIApplicationExtensionActivity setPresenterCompletion:](self, "setPresenterCompletion:", v7);

  -[UIApplicationExtensionActivity _presentExtensionViewControllerIfPossible](self, "_presentExtensionViewControllerIfPossible");
  return 1;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  UIApplicationExtensionActivity *v21;
  id v22;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[UIApplicationExtensionActivity extensionViewController](self, "extensionViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __89__UIApplicationExtensionActivity__dismissActivityFromViewController_animated_completion___block_invoke;
  v20 = &unk_1E4002500;
  v21 = self;
  v22 = v9;
  v11 = v9;
  v12 = MEMORY[0x1A1AE9514](&v17);
  v13 = (void *)v12;
  if (v8)
  {
    v14 = v8;
  }
  else
  {
    if (!v10)
    {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
      v15 = 0;
      goto LABEL_6;
    }
    v14 = v10;
  }
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", v6, v13, v17, v18, v19, v20, v21, v22);
  v15 = 1;
LABEL_6:

  return v15;
}

uint64_t __89__UIApplicationExtensionActivity__dismissActivityFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "extensionRequestCleanupCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionRequestCleanupCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setExtensionRequestCleanupCompletion:", 0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_managesOwnPresentation
{
  return !-[UIApplicationExtensionActivity _isServiceExtension](self, "_isServiceExtension");
}

- (void)_cleanup
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UIApplicationExtensionActivity setPresenterCompletion:](self, "setPresenterCompletion:", 0);
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set_requestPostCompletionBlockWithItems:", 0);

  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestCancellationBlock:", 0);

  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestInterruptionBlock:", 0);

  -[UIApplicationExtensionActivity setExtensionContextIdentifier:](self, "setExtensionContextIdentifier:", 0);
  -[UIApplicationExtensionActivity setExtensionViewController:](self, "setExtensionViewController:", 0);
  v6.receiver = self;
  v6.super_class = (Class)UIApplicationExtensionActivity;
  -[UIActivity _cleanup](&v6, sel__cleanup);
}

- (_UIActivityBundleHelper)activityBundleHelper
{
  _UIActivityBundleHelper *activityBundleHelper;
  void *v4;
  _UIActivityBundleHelper *v5;
  _UIActivityBundleHelper *v6;

  activityBundleHelper = self->_activityBundleHelper;
  if (!activityBundleHelper)
  {
    -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIActivityBundleHelper activityBundleHelperForExtension:](_UIActivityBundleHelper, "activityBundleHelperForExtension:", v4);
    v5 = (_UIActivityBundleHelper *)objc_claimAutoreleasedReturnValue();
    v6 = self->_activityBundleHelper;
    self->_activityBundleHelper = v5;

    activityBundleHelper = self->_activityBundleHelper;
  }
  return activityBundleHelper;
}

- (void)_instantiateExtensionViewControllerWithInputItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke;
  v19[3] = &unk_1E4003180;
  objc_copyWeak(&v20, &location);
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set_requestPostCompletionBlockWithItems:", v19);

  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_30;
  v17[3] = &unk_1E40031A8;
  objc_copyWeak(&v18, &location);
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequestCancellationBlock:", v17);

  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_32;
  v15[3] = &unk_1E40031D0;
  objc_copyWeak(&v16, &location);
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequestInterruptionBlock:", v15);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_34;
  v12[3] = &unk_1E4003220;
  objc_copyWeak(&v14, &location);
  v11 = v6;
  v13 = v11;
  objc_msgSend(v5, "instantiateViewControllerWithInputItems:connectionHandler:", v4, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2;
  block[3] = &unk_1E4001A88;
  v13 = v6;
  v14 = WeakRetained;
  v15 = v7;
  v9 = v7;
  v10 = WeakRetained;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "completed request - items: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setExtensionRequestCleanupCompletion:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "activityDidFinish:items:error:", 1, *(_QWORD *)(a1 + 32), 0);
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_31;
  v8[3] = &unk_1E4001248;
  v9 = v4;
  v10 = WeakRetained;
  v6 = WeakRetained;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_31(uint64_t a1)
{
  NSObject *v2;

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_15_cold_1(a1);

  return objc_msgSend(*(id *)(a1 + 40), "activityDidFinish:items:error:", 0, 0, *(_QWORD *)(a1 + 32));
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_32(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_33;
  block[3] = &unk_1E4001608;
  v4 = WeakRetained;
  v2 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_33(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = CFSTR("Extension was interrupted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_18_cold_1(v5);

  objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:items:error:", 0, 0, v5);
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_34(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_35;
  block[3] = &unk_1E40031F8;
  v16 = v7;
  v17 = v8;
  v18 = *(id *)(a1 + 32);
  v19 = v9;
  v20 = WeakRetained;
  v11 = WeakRetained;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_35(uint64_t a1)
{
  NSObject *v3;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 64), "setExtensionContextIdentifier:");
    objc_msgSend(*(id *)(a1 + 64), "setExtensionViewController:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 64), "_presentExtensionViewControllerIfPossible");
  }
  else
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_35_cold_1(a1, v3);

    return objc_msgSend(*(id *)(a1 + 64), "activityDidFinish:items:error:", 0, 0, *(_QWORD *)(a1 + 56));
  }
}

- (void)_presentExtensionViewControllerIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[UIApplicationExtensionActivity extensionViewController](self, "extensionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = v3;
    -[UIApplicationExtensionActivity presenterViewController](self, "presenterViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NSExtension"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtensionActionWantsFullScreenPresentation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
      {
        v9 = 5;
      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSExtensionAttributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSExtensionActionWantsFullScreenPresentation"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "BOOLValue"))
          v9 = 5;
        else
          v9 = 2;

      }
      objc_msgSend(v14, "setModalPresentationStyle:", v9);
      objc_msgSend(v14, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTintAdjustmentMode:", 1);

      -[UIApplicationExtensionActivity presenterCompletion](self, "presenterCompletion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentViewController:animated:completion:", v14, 1, v13);

    }
    v3 = v14;
  }

}

- (NSExtension)applicationExtension
{
  return self->_applicationExtension;
}

- (NSExtensionItem)_injectedExtensionItem
{
  return self->__injectedExtensionItem;
}

- (void)set_injectedExtensionItem:(id)a3
{
  objc_storeStrong((id *)&self->__injectedExtensionItem, a3);
}

- (NSNumber)overrideActivityCategory
{
  return self->_overrideActivityCategory;
}

- (void)setOverrideActivityCategory:(id)a3
{
  objc_storeStrong((id *)&self->_overrideActivityCategory, a3);
}

- (UIViewController)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViewController, a3);
}

- (id)extensionContextIdentifier
{
  return self->_extensionContextIdentifier;
}

- (void)setExtensionContextIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UIViewController)presenterViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenterViewController);
}

- (void)setPresenterViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presenterViewController, a3);
}

- (id)presenterCompletion
{
  return self->_presenterCompletion;
}

- (void)setPresenterCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setActivityBundleHelper:(id)a3
{
  objc_storeStrong((id *)&self->_activityBundleHelper, a3);
}

- (id)extensionRequestCleanupCompletion
{
  return self->_extensionRequestCleanupCompletion;
}

- (void)setExtensionRequestCleanupCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSURL)originalFileURL
{
  return self->_originalFileURL;
}

- (void)setOriginalFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_originalFileURL, a3);
}

- (NSDate)installationDate
{
  return self->_installationDate;
}

- (UISUIActivityExtensionItemDataRequest)extensionItemDataRequest
{
  return self->_extensionItemDataRequest;
}

- (void)setExtensionItemDataRequest:(id)a3
{
  objc_storeStrong((id *)&self->_extensionItemDataRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionItemDataRequest, 0);
  objc_storeStrong((id *)&self->_originalFileURL, 0);
  objc_storeStrong(&self->_extensionRequestCleanupCompletion, 0);
  objc_storeStrong((id *)&self->_activityBundleHelper, 0);
  objc_storeStrong(&self->_presenterCompletion, 0);
  objc_destroyWeak((id *)&self->_presenterViewController);
  objc_storeStrong(&self->_extensionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_overrideActivityCategory, 0);
  objc_storeStrong((id *)&self->__injectedExtensionItem, 0);
  objc_storeStrong((id *)&self->_applicationExtension, 0);
}

+ (id)_applicationExtensionActivitiesForItems:(id)a3
{
  id v3;
  _UIActivityMatchingContext *v4;
  _UIActivityMatchingContext *v5;
  void *v6;
  void *v7;
  _UIActivityApplicationExtensionDiscovery *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v3 = a3;
  v4 = [_UIActivityMatchingContext alloc];
  v5 = -[_UIActivityMatchingContext initWithActivityItems:itemValues:](v4, "initWithActivityItems:itemValues:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  -[_UIActivityMatchingContext setIsContentManaged:](v5, "setIsContentManaged:", 0);
  -[_UIActivityMatchingContext setShouldMatchOnlyUserElectedExtensions:](v5, "setShouldMatchOnlyUserElectedExtensions:", 1);
  _NSExtensionItemsFromActivityItemValues(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIActivityApplicationExtensionDiscovery extensionMatchingDictionariesForExtensionItems:](_UIActivityApplicationExtensionDiscovery, "extensionMatchingDictionariesForExtensionItems:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setActivityItemValueExtensionMatchingDictionaries:](v5, "setActivityItemValueExtensionMatchingDictionaries:", v7);

  v8 = objc_alloc_init(_UIActivityApplicationExtensionDiscovery);
  v13 = 0;
  -[_UIActivityApplicationExtensionDiscovery activitiesForMatchingContext:error:](v8, "activitiesForMatchingContext:error:", v5, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v10)
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[UIApplicationExtensionActivity(UIActivity_PerformanceTest) _applicationExtensionActivitiesForItems:].cold.1();

  }
  return v9;
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_15_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19E419000, v2, v3, "cancelled request - error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_18_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19E419000, v2, v3, "request interrupted - error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_25_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19E419000, v2, v3, "Application extension failed to launch! error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_35_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543874;
  v7 = v4;
  v8 = 2114;
  v9 = v3;
  v10 = 2114;
  v11 = v5;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Cannot connect to view controller in %{public}@ - %{public}@ info %{public}@", (uint8_t *)&v6, 0x20u);

}

@end
