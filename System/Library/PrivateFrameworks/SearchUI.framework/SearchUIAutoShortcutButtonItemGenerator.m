@implementation SearchUIAutoShortcutButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  return 0;
}

+ (id)shortcutsForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (shortcutsForBundleId__onceToken != -1)
    dispatch_once(&shortcutsForBundleId__onceToken, &__block_literal_global_0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)shortcutsForBundleId__shortcutsProvider, "autoShortcutsForApplicationRecord:localeIdentifier:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __64__SearchUIAutoShortcutButtonItemGenerator_shortcutsForBundleId___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shortcutsForBundleId__shortcutsProvider;
  shortcutsForBundleId__shortcutsProvider = v0;

}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  SearchUIButtonItem *v23;
  void *v24;
  void *v25;
  void (**v26)(id, void *, uint64_t);
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = (void (**)(id, void *, uint64_t))a4;
  v29 = v5;
  objc_msgSend(v5, "appAutoShortcutsItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "shortcutsForBundleId:", v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v12, "systemImageName");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v12, "localizedShortTitle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v12, "systemImageName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setSymbolName:", v17);

            objc_msgSend(v16, "setIsTemplate:", 1);
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC79C0]), "initWithAutoShortcut:bundleIdentifier:", v12, v28);
            v19 = (void *)objc_opt_new();
            objc_msgSend(v19, "setIsRunnableWorkflow:", 1);
            v30 = 0;
            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v30);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v30;
            objc_msgSend(v19, "setIntentMessageData:", v20);

            if (v21)
            {
              SearchUIGeneralLog();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v21;
                _os_log_error_impl(&dword_1DAD39000, v22, OS_LOG_TYPE_ERROR, "SearchUIAutoShortcutButtonItemGenerator autoshortcuts archive data object error: %@", buf, 0xCu);
              }

            }
            v23 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", v29);
            objc_msgSend(v12, "localizedShortTitle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUIButtonItem setTitle:](v23, "setTitle:", v24);

            -[SearchUIButtonItem setImage:](v23, "setImage:", v16);
            -[SearchUIButtonItem setCommand:](v23, "setCommand:", v19);
            objc_msgSend(v27, "addObject:", v23);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v9);
  }

  v26[2](v26, v27, 1);
}

@end
