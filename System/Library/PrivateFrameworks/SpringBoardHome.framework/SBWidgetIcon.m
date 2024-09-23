@implementation SBWidgetIcon

- (BOOL)isWidgetIcon
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  const __CFString *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBWidgetIcon;
  -[SBIcon descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("widget");
LABEL_5:
    objc_msgSend(v4, "appendString:withName:", v8, v9);

    goto LABEL_6;
  }
  if (v5)
  {
    objc_msgSend(v5, "icon:displayNameForLocation:", self, CFSTR("SBIconLocationNone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("fakeWidget");
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBWidgetIcon *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBWidgetIcon initWithCHSWidgetDescriptors:](self, "initWithCHSWidgetDescriptors:", v6, v9, v10);
  return v7;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptor:(id)a3 inDomain:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  SBWidgetIcon *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBWidgetIcon initWithCHSWidgetDescriptors:inDomain:](self, "initWithCHSWidgetDescriptors:inDomain:", v9, v7, v12, v13);
  return v10;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3
{
  return -[SBWidgetIcon initWithCHSWidgetDescriptors:suggestionSource:](self, "initWithCHSWidgetDescriptors:suggestionSource:", a3, 0);
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 inDomain:(id)a4
{
  return -[SBWidgetIcon initWithCHSWidgetDescriptors:suggestionSource:inDomain:](self, "initWithCHSWidgetDescriptors:suggestionSource:inDomain:", a3, 0, a4);
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 suggestionSource:(int64_t)a4
{
  id v6;
  void *v7;
  SBWidgetIcon *v8;

  v6 = a3;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBWidgetIcon initWithCHSWidgetDescriptors:suggestionSource:inDomain:](self, "initWithCHSWidgetDescriptors:suggestionSource:inDomain:", v6, a4, v7);

  return v8;
}

- (SBWidgetIcon)initWithCHSWidgetDescriptors:(id)a3 suggestionSource:(int64_t)a4 inDomain:(id)a5
{
  id v8;
  id v9;
  SBWidgetIcon *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char isKindOfClass;
  uint64_t v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[SBLeafIcon initWithUniqueLeafIdentifier](self, "initWithUniqueLeafIdentifier");
  if (v10)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "sbh_iconDataSourceInDomain:", v9);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            if (a4 && (isKindOfClass & 1) != 0)
            {
              v19 = objc_msgSend(v17, "copyWithSuggestionSource:", a4);

              v17 = (void *)v19;
            }
            -[SBLeafIcon addIconDataSource:](v10, "addIconDataSource:", v17);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v8 = v21;
  }

  return v10;
}

- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4
{
  return -[SBWidgetIcon initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:](self, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 widgetContainerBundleIdentifiers:(id)a5
{
  return -[SBWidgetIcon initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:suggestionSource:](self, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:suggestionSource:", a3, a4, a5, 0);
}

- (SBWidgetIcon)initWithWidgetExtensionIdentifiers:(id)a3 widgetKinds:(id)a4 widgetContainerBundleIdentifiers:(id)a5 suggestionSource:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  SBWidgetIcon *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  SBWidgetIcon *v18;
  int64_t v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[SBLeafIcon initWithUniqueLeafIdentifier](self, "initWithUniqueLeafIdentifier");
  if (v13)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __137__SBWidgetIcon_SBHCHSWidgetDescriptor__initWithWidgetExtensionIdentifiers_widgetKinds_widgetContainerBundleIdentifiers_suggestionSource___block_invoke;
    v15[3] = &unk_1E8D86C78;
    v16 = v11;
    v17 = v12;
    v19 = a6;
    v18 = v13;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  }
  return v13;
}

void __137__SBWidgetIcon_SBHCHSWidgetDescriptor__initWithWidgetExtensionIdentifiers_widgetKinds_widgetContainerBundleIdentifiers_suggestionSource___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SBHSpecialWidgetDescriptor *v9;
  id v10;
  void *v11;
  SBHWidget *v12;
  SBHWidget *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    v8 = SBHSpecialWidgetDescriptorTypeForKind(v6);
    if (v8)
    {
      v9 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", v8);
      -[CHSWidgetDescriptor sbh_iconDataSource](v9, "sbh_iconDataSource");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(void **)(a1 + 40);
      if (v11 && objc_msgSend(v11, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
        v12 = (SBHWidget *)objc_claimAutoreleasedReturnValue();
        v13 = -[SBHWidget initWithKind:extensionBundleIdentifier:containerBundleIdentifier:]([SBHWidget alloc], "initWithKind:extensionBundleIdentifier:containerBundleIdentifier:", v6, v5, v12);
        v10 = -[SBHWidget copyWithSuggestionSource:](v13, "copyWithSuggestionSource:", *(_QWORD *)(a1 + 56));

      }
      else
      {
        v12 = -[SBHWidget initWithKind:extensionBundleIdentifier:]([SBHWidget alloc], "initWithKind:extensionBundleIdentifier:", v6, v5);
        v10 = -[SBHWidget copyWithSuggestionSource:](v12, "copyWithSuggestionSource:", *(_QWORD *)(a1 + 56));
      }

      SBLogWidgets();
      v9 = (SBHSpecialWidgetDescriptor *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v5;
        v17 = 2114;
        v18 = v14;
        _os_log_impl(&dword_1CFEF3000, &v9->super.super.super, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created for icon through extension identifiers.", (uint8_t *)&v15, 0x16u);

      }
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "addIconDataSource:", v10);

}

- (SBWidgetIcon)initWithWidget:(id)a3
{
  id v4;
  SBWidgetIcon *v5;
  SBWidgetIcon *v6;

  v4 = a3;
  v5 = -[SBLeafIcon initWithUniqueLeafIdentifier](self, "initWithUniqueLeafIdentifier");
  v6 = v5;
  if (v5)
    -[SBLeafIcon addIconDataSource:](v5, "addIconDataSource:", v4);

  return v6;
}

- (SBWidgetIcon)initWithWidgets:(id)a3
{
  id v4;
  SBWidgetIcon *v5;
  SBWidgetIcon *v6;

  v4 = a3;
  v5 = -[SBLeafIcon initWithUniqueLeafIdentifier](self, "initWithUniqueLeafIdentifier");
  v6 = v5;
  if (v5)
    -[SBLeafIcon addIconDataSources:](v5, "addIconDataSources:", v4);

  return v6;
}

- (SBWidgetIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  SBWidgetIcon *v4;
  SBWidgetIcon *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWidgetIcon;
  v4 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v7, sel_initWithLeafIdentifier_applicationBundleID_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SBIcon setGridSizeClass:](v4, "setGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    v5->_allowsSuggestions = 1;
    v5->_allowsExternalSuggestions = 1;
  }
  return v5;
}

- (id)firstWidgetPassingTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SBWidgetIcon_firstWidgetPassingTest___block_invoke;
  v8[3] = &unk_1E8D8DA58;
  v9 = v4;
  v5 = v4;
  -[SBLeafIcon firstIconDataSourcePassingTest:](self, "firstIconDataSourcePassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __39__SBWidgetIcon_firstWidgetPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v5 = 0;

  return v5;
}

- (SBHWidget)activeWidget
{
  void *v2;
  void *v3;
  void *v4;
  SBHWidget *v5;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSArray)widgets
{
  void *v3;
  void *v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon iconDataSourcesOfClass:](self, "iconDataSourcesOfClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_fallbackBestDataSource
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBWidgetIcon lastUserSelectedDataSource](self, "lastUserSelectedDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBWidgetIcon;
    -[SBLeafIcon _fallbackBestDataSource](&v8, sel__fallbackBestDataSource);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)didAddIconDataSource:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBWidgetIcon;
  -[SBLeafIcon didAddIconDataSource:](&v4, sel_didAddIconDataSource_, a3);
  -[SBIcon archivableStateDidChange](self, "archivableStateDidChange");
  -[SBWidgetIcon setStackChangeReason:](self, "setStackChangeReason:", 4);
}

- (void)didRemoveIconDataSource:(id)a3
{
  SBLeafIconDataSource *v4;
  SBLeafIconDataSource *lastUserSelectedDataSource;
  NSObject *v6;
  void *v7;
  SBLeafIconDataSource *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBWidgetIcon;
  v4 = (SBLeafIconDataSource *)a3;
  -[SBLeafIcon didRemoveIconDataSource:](&v9, sel_didRemoveIconDataSource_, v4);
  lastUserSelectedDataSource = self->_lastUserSelectedDataSource;

  if (lastUserSelectedDataSource == v4)
  {
    SBLogIcon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SBIcon uniqueIdentifier](self, "uniqueIdentifier", v9.receiver, v9.super_class);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Clearing out last user selected data source for: %@", buf, 0xCu);

    }
    v8 = self->_lastUserSelectedDataSource;
    self->_lastUserSelectedDataSource = 0;

  }
  -[SBIcon archivableStateDidChange](self, "archivableStateDidChange", v9.receiver, v9.super_class);
  -[SBWidgetIcon setStackChangeReason:](self, "setStackChangeReason:", 6);
}

- (void)didReplaceIconDataSource:(id)a3 withIconDataSource:(id)a4
{
  id v7;
  SBLeafIconDataSource *v8;
  SBLeafIconDataSource *lastUserSelectedDataSource;
  NSObject *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBWidgetIcon;
  v8 = (SBLeafIconDataSource *)a3;
  -[SBLeafIcon didReplaceIconDataSource:withIconDataSource:](&v12, sel_didReplaceIconDataSource_withIconDataSource_, v8, v7);
  lastUserSelectedDataSource = self->_lastUserSelectedDataSource;

  if (lastUserSelectedDataSource == v8)
  {
    SBLogIcon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SBIcon uniqueIdentifier](self, "uniqueIdentifier", v12.receiver, v12.super_class);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Replacing last user selected data source for: %@", buf, 0xCu);

    }
    objc_storeStrong((id *)&self->_lastUserSelectedDataSource, a4);
  }
  -[SBIcon archivableStateDidChange](self, "archivableStateDidChange", v12.receiver, v12.super_class);
  -[SBWidgetIcon setStackChangeReason:](self, "setStackChangeReason:", 6);

}

- (void)setLastUserSelectedDataSource:(id)a3
{
  SBLeafIconDataSource *v5;
  SBLeafIconDataSource *v6;

  v5 = (SBLeafIconDataSource *)a3;
  if (self->_lastUserSelectedDataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lastUserSelectedDataSource, a3);
    -[SBIcon archivableStateDidChange](self, "archivableStateDidChange");
    v5 = v6;
  }

}

- (unint64_t)iconDataSourcesExcludingSuggestionsCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBLeafIcon iconDataSources](self, "iconDataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_filter:", &__block_literal_global_68);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  return v4;
}

BOOL __56__SBWidgetIcon_iconDataSourcesExcludingSuggestionsCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v2, "suggestionSource") != 1;

  return v3;
}

- (BOOL)canReceiveGrabbedIcon
{
  return !-[SBWidgetIcon _hasDataSourceThatIgnoresAllOtherDataSources](self, "_hasDataSourceThatIgnoresAllOtherDataSources");
}

- (BOOL)canBeReceivedByIcon
{
  return !-[SBWidgetIcon _hasDataSourceThatIgnoresAllOtherDataSources](self, "_hasDataSourceThatIgnoresAllOtherDataSources");
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

- (id)supportedGridSizeClasses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBLeafIcon iconDataSources](self, "iconDataSources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v4)
  {

LABEL_17:
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "supportedGridSizeClassesForIcon:", self);
      else
        +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllNonDefaultGridSizeClasses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v6)
        objc_msgSend(v6, "intersectGridSizeClassSet:", v10);
      else
        v6 = (void *)objc_msgSend(v10, "mutableCopy");

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_17;
  return v6;
}

- (BOOL)isWidgetStackIcon
{
  return -[SBLeafIcon iconDataSourceCount](self, "iconDataSourceCount") > 1;
}

- (BOOL)supportsConfiguration
{
  void *v3;
  char v4;

  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "iconSupportsConfiguration:", self);
  else
    v4 = 0;

  return v4;
}

- (SBHWidget)firstSuggestedWidget
{
  return (SBHWidget *)-[SBWidgetIcon firstWidgetPassingTest:](self, "firstWidgetPassingTest:", &__block_literal_global_15_1);
}

BOOL __36__SBWidgetIcon_firstSuggestedWidget__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suggestionSource") == 1;
}

- (SBLeafIconDataSource)firstSuggestedIconDataSource
{
  return (SBLeafIconDataSource *)-[SBLeafIcon firstIconDataSourcePassingTest:](self, "firstIconDataSourcePassingTest:", &__block_literal_global_16_0);
}

BOOL __44__SBWidgetIcon_firstSuggestedIconDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && objc_msgSend(v2, "suggestionSource") == 1;

  return v3;
}

- (void)removeFirstSuggestedIconDataSource
{
  void *v3;
  void *v4;

  -[SBWidgetIcon firstSuggestedIconDataSource](self, "firstSuggestedIconDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[SBLeafIcon removeIconDataSource:](self, "removeIconDataSource:", v3);
    v3 = v4;
  }

}

- (void)addFirstSuggestedWidget
{
  void *v3;
  id v4;

  -[SBWidgetIcon firstSuggestedWidget](self, "firstSuggestedWidget");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v4, "copyWithSuggestionSource:", 0);
  -[SBLeafIcon replaceIconDataSource:withIconDataSource:](self, "replaceIconDataSource:withIconDataSource:", v4, v3);

}

- (void)addDataSourcesFromWidgetIcons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBLeafIcon iconDataSources](self, "iconDataSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v5);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "iconDataSources");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = -[SBLeafIcon iconDataSourceCount](self, "iconDataSourceCount");
  else
    v15 = v7 + 1;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v15, objc_msgSend(v8, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLeafIcon insertIconDataSources:atIndexes:](self, "insertIconDataSources:atIndexes:", v8, v16);

  SBLogIcon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "Activating data source due to icon insertion", v20, 2u);
  }

  objc_msgSend(v9, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWidgetIcon setStackChangeReason:](self, "setStackChangeReason:", 4);
  -[SBLeafIcon setActiveDataSource:](self, "setActiveDataSource:", v19);

}

- (void)setAllowsSuggestions:(BOOL)a3
{
  if (self->_allowsSuggestions != a3)
  {
    self->_allowsSuggestions = a3;
    -[SBIcon archivableStateDidChange](self, "archivableStateDidChange");
  }
}

- (void)setAllowsExternalSuggestions:(BOOL)a3
{
  if (self->_allowsExternalSuggestions != a3)
  {
    self->_allowsExternalSuggestions = a3;
    -[SBIcon archivableStateDidChange](self, "archivableStateDidChange");
  }
}

- (void)_setPropertiesFromIcon:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWidgetIcon;
  -[SBLeafIcon _setPropertiesFromIcon:](&v9, sel__setPropertiesFromIcon_, v4);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v4;
    -[SBWidgetIcon setAllowsSuggestions:](self, "setAllowsSuggestions:", objc_msgSend(v7, "allowsSuggestions"));
    v8 = objc_msgSend(v7, "allowsExternalSuggestions");

    -[SBWidgetIcon setAllowsExternalSuggestions:](self, "setAllowsExternalSuggestions:", v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBWidgetIcon;
  result = -[SBLeafIcon copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_BYTE *)result + 120) = self->_allowsSuggestions;
    *((_BYTE *)result + 121) = self->_allowsExternalSuggestions;
  }
  return result;
}

- (id)copyWithUniqueLeafIdentifier
{
  void *v3;
  void *v4;
  id *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SBWidgetIcon;
  v5 = -[SBLeafIcon copyWithLeafIdentifier:](&v7, sel_copyWithLeafIdentifier_, v4);

  if (v5)
  {
    objc_storeStrong(v5 + 16, self->_lastUserSelectedDataSource);
    objc_msgSend(v5, "_updateActiveDataSource");
  }
  return v5;
}

- (id)copyWithSuggestionSource:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[SBLeafIcon iconDataSources](self, "iconDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return -[SBWidgetIcon copyWithUniqueLeafIdentifier](self, "copyWithUniqueLeafIdentifier");
  v7 = (void *)-[SBWidgetIcon copy](self, "copy");
  -[SBIcon gridSizeClass](self, "gridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGridSizeClass:", v8);

  if (v7)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[SBWidgetIcon widgets](self, "widgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(v14, "copyWithSuggestionSource:", a3);
          objc_msgSend(v7, "replaceIconDataSource:withIconDataSource:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLeafIcon iconDataSourcesOfClass:](self, "iconDataSourcesOfClass:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          v23 = (void *)objc_msgSend(v22, "copyWithSuggestionSource:", a3);
          objc_msgSend(v7, "replaceIconDataSource:withIconDataSource:", v22, v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

  }
  return v7;
}

- (BOOL)matchesWidgetIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  char v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[SBLeafIcon leafIdentifier](self, "leafIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leafIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if (!v7)
    goto LABEL_6;
  -[SBLeafIcon iconDataSources](self, "iconDataSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconDataSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = BSEqualArrays();

  if (!v10)
    goto LABEL_6;
  -[SBLeafIcon activeDataSource](self, "activeDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BSEqualObjects();

  if (!v13)
    goto LABEL_6;
  v14 = -[SBWidgetIcon allowsSuggestions](self, "allowsSuggestions");
  if (v14 == objc_msgSend(v4, "allowsSuggestions")
    && (v15 = -[SBWidgetIcon allowsExternalSuggestions](self, "allowsExternalSuggestions"),
        v15 == objc_msgSend(v4, "allowsExternalSuggestions")))
  {
    -[SBIcon gridSizeClass](self, "gridSizeClass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridSizeClass");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v18 == (void *)v19)
    {
      v16 = 1;
      v20 = v18;
    }
    else
    {
      v20 = (void *)v19;
      -[SBIcon gridSizeClass](self, "gridSizeClass");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "gridSizeClass");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v21, "isEqualToString:", v22);

    }
  }
  else
  {
LABEL_6:
    v16 = 0;
  }

  return v16;
}

- (BOOL)canGenerateIconsInBackground
{
  return 1;
}

+ (BOOL)hasIconImage
{
  return 0;
}

- (BOOL)_hasDataSourceThatIgnoresAllOtherDataSources
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBLeafIcon iconDataSources](self, "iconDataSources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v8, "iconShouldIgnoreOtherDataSources:", self) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (SBLeafIconDataSource)lastUserSelectedDataSource
{
  return self->_lastUserSelectedDataSource;
}

- (unint64_t)stackChangeReason
{
  return self->_stackChangeReason;
}

- (void)setStackChangeReason:(unint64_t)a3
{
  self->_stackChangeReason = a3;
}

- (BOOL)allowsSuggestions
{
  return self->_allowsSuggestions;
}

- (BOOL)allowsExternalSuggestions
{
  return self->_allowsExternalSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserSelectedDataSource, 0);
}

@end
