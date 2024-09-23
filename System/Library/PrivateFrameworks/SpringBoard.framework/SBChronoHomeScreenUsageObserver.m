@implementation SBChronoHomeScreenUsageObserver

- (void)homeScreenUsageAggregator:(id)a3 didNoteCurrentPageIndexChanged:(unint64_t)a4
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogChrono();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Current home screen page changed to: %lu", (uint8_t *)&v6, 0xCu);
  }

}

- (SBChronoHomeScreenUsageObserver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBChronoHomeScreenUsageObserver.m"), 38, CFSTR("use -initWithSBHIconManager:"));

  return 0;
}

- (SBChronoHomeScreenUsageObserver)initWithIconManager:(id)a3
{
  id v5;
  SBChronoHomeScreenUsageObserver *v6;
  SBChronoHomeScreenUsageObserver *v7;
  void *v8;
  uint64_t v9;
  CHSWidgetHost *widgetHost;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBChronoHomeScreenUsageObserver;
  v6 = -[SBChronoHomeScreenUsageObserver init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconManager, a3);
    -[SBHIconManager setUsageMonitoringEnabled:](v7->_iconManager, "setUsageMonitoringEnabled:", 1);
    -[SBHIconManager usageMonitor](v7->_iconManager, "usageMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v7);

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D101D0]), "initWithIdentifier:", CFSTR("SpringBoard-Homescreen"));
    widgetHost = v7->_widgetHost;
    v7->_widgetHost = (CHSWidgetHost *)v9;

    -[SBChronoHomeScreenUsageObserver _rebuildAndTransmitConfiguredWidgetData:](v7, "_rebuildAndTransmitConfiguredWidgetData:", v7->_iconManager);
  }

  return v7;
}

- (void)homeScreenUsageAggregatorDidNoteListLayoutProviderChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  SBLogChrono();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "List layout provider changed", v7, 2u);
  }

  objc_msgSend(v4, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBChronoHomeScreenUsageObserver _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v6);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconAdded:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SBLogChrono();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "widgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon added: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v7, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBChronoHomeScreenUsageObserver _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v10);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconRemoved:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SBLogChrono();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "widgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon removed: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v7, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBChronoHomeScreenUsageObserver _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v10);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteWidgetIconStackChangedActiveWidget:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SBLogChrono();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "activeDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Widget icon stack changed active widget: %@ all widgets: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(v7, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBChronoHomeScreenUsageObserver _rebuildAndTransmitConfiguredWidgetData:](self, "_rebuildAndTransmitConfiguredWidgetData:", v11);
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserAddedWidgetIconStackSuggestion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  SBLogChrono();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "widgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user added suggestion: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedWidgetIconStackSuggestion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  SBLogChrono();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "widgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted user dislike of suggestion: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  SBLogChrono();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "widgets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Widget icon stack noted dislike of Siri Suggestion on suggestion: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)homeScreenUsageAggregator:(id)a3 didNoteUserTappedWidgetIcon:(id)a4 withURL:(id)a5
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogChrono();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "widgets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Widget icon tapped: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)homeScreenUsageAggregatorAddWidgetSheetWillPresent:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  SBLogChrono();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Add Widget sheet will present", v8, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0D10078]);
  -[SBChronoHomeScreenUsageObserver widgetHost](self, "widgetHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userEnteredAddGalleryForHost:", v7);

}

- (void)_rebuildAndTransmitConfiguredWidgetData:(id)a3
{
  id v5;
  unint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;
  SEL v11;

  v5 = a3;
  v6 = -[SBChronoHomeScreenUsageObserver widgetDataGeneration](self, "widgetDataGeneration") + 1;
  -[SBChronoHomeScreenUsageObserver setWidgetDataGeneration:](self, "setWidgetDataGeneration:", v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke;
  v8[3] = &unk_1E8EA1360;
  v8[4] = self;
  v9 = v5;
  v10 = v6;
  v11 = a2;
  v7 = v5;
  objc_msgSend(v7, "performAfterCachingWidgetIntentsUsingBlock:", v8);

}

void __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "widgetDataGeneration"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "rootFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke_2;
    v15[3] = &unk_1E8EB1068;
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    v16 = v5;
    v17 = v6;
    v7 = v3;
    v18 = v7;
    objc_msgSend(v5, "enumerateAllIconsWithOptions:usingBlock:", 2, v15);
    SBLogChrono();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_descriptionForArray:name:", v7, CFSTR("containers"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Configured widgets changed: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "widgetMetricsProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemDefaultMetricsSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SBChronoHomeScreenUsageObserver.m"), 130, CFSTR("A widget metrics specification is required."));

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10150]), "initWithContainerDescriptors:metricsSpecification:", v7, v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setConfiguration:", v13);

  }
}

void __75__SBChronoHomeScreenUsageObserver__rebuildAndTransmitConfiguredWidgetData___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  v6 = objc_opt_class();
  SBSafeCast(v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(a1[4], "visibleIndexForIndex:", objc_msgSend(v11, "indexAtPosition:", 0));
    if (objc_msgSend(a1[4], "isIconAtIndexPathInTodayList:", v11))
      v9 = 2;
    else
      v9 = 1;
    objc_msgSend(a1[5], "_containerDescriptorForWidgetIcon:atLocation:page:", v7, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(a1[6], "addObject:", v10);

  }
}

- (id)_containerDescriptorForWidgetIcon:(id)a3 atLocation:(int64_t)a4 page:(unint64_t)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v35;
  id obj;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  _QWORD v48[3];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClass");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = CHSWidgetFamilyForSBHIconGridSizeClass();
  objc_msgSend(v5, "widgets");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v41)
  {
    v38 = *(_QWORD *)v43;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v6);
        -[SBChronoHomeScreenUsageObserver iconManager](self, "iconManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v5;
        objc_msgSend(v8, "intentForWidget:ofIcon:", v7, v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_alloc(MEMORY[0x1E0D10148]);
        objc_msgSend(v7, "extensionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "containerBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "kind");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v11, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v12, v13, v14, v40, v10);

        -[SBChronoHomeScreenUsageObserver iconManager](self, "iconManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "widgetMetricsProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "systemMetricsForWidget:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_alloc(MEMORY[0x1E0D10080]);
        objc_msgSend(v7, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithUniqueIdentifier:widget:metrics:", v20, v15, v18);

        objc_msgSend(v21, "setSuggestion:", objc_msgSend(v7, "suggestionSource") == 1);
        objc_msgSend(v21, "setSystemConfigured:", objc_msgSend(v7, "suggestionSource") == 2);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 0, 0);
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 2, 2);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 2, 0);
        v48[0] = v22;
        v48[1] = v23;
        v48[2] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSupportedRenderSchemes:", v25);

        if (v21)
        {
          objc_msgSend(v37, "addObject:", v21);
          SBLogChronoVerbose();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v21;
            _os_log_debug_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEBUG, "Found configured widget: %@", buf, 0xCu);
          }

        }
        ++v6;
        v5 = v9;
      }
      while (v41 != v6);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v41);
  }
  if (objc_msgSend(v37, "count"))
  {
    v27 = objc_alloc(MEMORY[0x1E0D0FFB8]);
    objc_msgSend(v5, "uniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeWidget");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v27, "initWithUniqueIdentifier:location:canAppearInSecureEnvironment:page:family:widgets:activeWidget:", v28, a4, a4 == 2, a5, v40, v37, v30);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_descriptionForArray:(id)a3 name:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0D01748];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "builderWithObject:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v7, v6, 0);

  objc_msgSend(v8, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CHSWidgetHost)widgetHost
{
  return self->_widgetHost;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (unint64_t)widgetDataGeneration
{
  return self->_widgetDataGeneration;
}

- (void)setWidgetDataGeneration:(unint64_t)a3
{
  self->_widgetDataGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_widgetHost, 0);
}

@end
