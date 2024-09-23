@implementation _SBWidgetExtensionDebugHomeScreenDataSource

- (_SBWidgetExtensionDebugHomeScreenDataSource)initWithIconManager:(id)a3
{
  id v5;
  _SBWidgetExtensionDebugHomeScreenDataSource *v6;
  _SBWidgetExtensionDebugHomeScreenDataSource *v7;
  uint64_t v8;
  NSHashTable *inFlightAnimationTransactions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBWidgetExtensionDebugHomeScreenDataSource;
  v6 = -[_SBWidgetExtensionDebugHomeScreenDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconManager, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    inFlightAnimationTransactions = v7->_inFlightAnimationTransactions;
    v7->_inFlightAnimationTransactions = (NSHashTable *)v8;

  }
  return v7;
}

- (id)hasExistingWidgetFromExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBWidgetExtensionDebugSearchResult *v9;
  uint64_t v10;
  SBWidgetExtensionDebugSearchResult *i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHIconManager iconModel](self->_iconManager, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetIconsContainingWidgetsMatchingExtensionBundleIdentifier:kind:sizeClass:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v7, "widgets", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (SBWidgetExtensionDebugSearchResult *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (SBWidgetExtensionDebugSearchResult *)((char *)i + 1))
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "extensionBundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {
            objc_msgSend(v12, "kind");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "gridSizeClass");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = CHSWidgetFamilyForSBHIconGridSizeClass();

            v9 = -[SBWidgetExtensionDebugSearchResult initWithKind:family:]([SBWidgetExtensionDebugSearchResult alloc], "initWithKind:family:", v15, v17);
            goto LABEL_12;
          }
        }
        v9 = (SBWidgetExtensionDebugSearchResult *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)launchWidget:(id)a3 widgetFamily:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  SBDismissOverlaysAnimationController *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  _SBWidgetExtensionDebugHomeScreenDataSource *v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[5];
  id v25;
  id v26;
  int64_t v27;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke;
  v24[3] = &unk_1E8EB5F70;
  v11 = v9;
  v26 = v11;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v27 = a4;
  v13 = (void *)MEMORY[0x1D17E5550](v24);
  v14 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:]([SBDismissOverlaysAnimationController alloc], "initWithTransitionContextProvider:options:", 0, -1);
  objc_initWeak(&location, v14);
  v16 = v10;
  v17 = 3221225472;
  v18 = __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_3;
  v19 = &unk_1E8EA7FB0;
  v15 = v13;
  v20 = self;
  v21 = v15;
  objc_copyWeak(&v22, &location);
  -[SBDismissOverlaysAnimationController setCompletionBlock:](v14, "setCompletionBlock:", &v16);
  -[NSHashTable addObject:](self->_inFlightAnimationTransactions, "addObject:", v14, v16, v17, v18, v19, v20);
  -[SBDismissOverlaysAnimationController begin](v14, "begin");
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

- (void)_reallyLaunchWidgetOnHomeScreen:(id)a3 widgetFamily:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogWidgets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1D17E2DA8](a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBAvocadoDebuggingController ensuring widget is visible for descriptor: %@ family: %@", buf, 0x16u);

  }
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_ensureWidgetIsVisibleForDebuggingWithDescriptor:sizeClass:", v5, a4);

  objc_msgSend(v5, "extensionIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogWidgets();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_SBWidgetExtensionDebugHomeScreenDataSource _reallyLaunchWidgetOnHomeScreen:widgetFamily:].cold.1((uint64_t)v12, v5, v13);

  v14 = objc_alloc_init(MEMORY[0x1E0D10130]);
  objc_msgSend(v5, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke;
  v17[3] = &unk_1E8EA78D8;
  v18 = v12;
  v16 = v12;
  objc_msgSend(v14, "reloadTimelinesOfKind:containedIn:reason:completion:", v15, v16, CFSTR("Tools"), v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAnimationTransactions, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
}

- (void)_reallyLaunchWidgetOnHomeScreen:(NSObject *)a3 widgetFamily:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Going to reload the timeline for container: %{public}@ kind: %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_20();
}

@end
