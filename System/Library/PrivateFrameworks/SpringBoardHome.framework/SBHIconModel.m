@implementation SBHIconModel

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (BOOL)isIconVisible:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  BOOL v16;
  void *v18;
  int v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "tags", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[NSSet containsObject:](self->_hiddenIconTags, "containsObject:", v10)
          || !-[NSSet containsObject:](self->_visibleIconTags, "containsObject:", v10))
        {
          SBLogIcon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v26 = v4;
            v27 = 2114;
            v28 = v10;
            _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "Icon is not visible due to tag: %{public}@/%{public}@", buf, 0x16u);
          }
          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v4, "isApplicationIcon"))
  {
    v16 = 1;
    goto LABEL_20;
  }
  objc_msgSend(v4, "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v11 = objc_claimAutoreleasedReturnValue();
  -[SBHIconModel hiddenIconTags](self, "hiddenIconTags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v5);

  if (v13)
  {
    SBLogIcon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    *(_DWORD *)buf = 138412290;
    v26 = v5;
    v15 = "Icon is not visible because bundle identifier is in hidden tags: %@ / app icon";
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && -[NSObject hasHiddenTag](v11, "hasHiddenTag"))
  {
    SBLogIcon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      v15 = "Icon is not visible due to hidden tag: %@";
LABEL_14:
      _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject tags](v11, "tags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", CFSTR("hidden"));

    if (v19)
    {
      SBLogIcon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        v15 = "Icon is not visible due to hidden tag: %@";
        goto LABEL_14;
      }
LABEL_15:

LABEL_18:
      v16 = 0;
      goto LABEL_19;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && -[NSObject isAppClip](v11, "isAppClip"))
  {
    SBLogIcon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      v15 = "App clip icon is not visible: %@ / app clip icon";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  objc_msgSend(v4, "applicationPlaceholder");
  v14 = objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && -[NSObject isAppClip](v14, "isAppClip"))
  {
    SBLogIcon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_INFO, "Downloading icon for app clip is not visible: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }

  v16 = 1;
LABEL_19:

LABEL_20:
  return v16;
}

- (NSSet)hiddenIconTags
{
  return self->_hiddenIconTags;
}

- (NSSet)leafIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E20];
  -[NSMutableDictionary allValues](self->_leafIconsByIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary allValues](self->_widgetIconsByIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  return (NSSet *)v5;
}

- (void)iconModelApplicationDataSource:(id)a3 applicationsAdded:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SBHIconModel addApplication:](self, "addApplication:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)addApplication:(id)a3 force:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  objc_class *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 || !-[SBHIconModel shouldAvoidCreatingIconForApplication:](self, "shouldAvoidCreatingIconForApplication:", v6))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel applicationIconsForBundleIdentifier:](self, "applicationIconsForBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "replaceIconDataSourcesWithApplication:", v6, (_QWORD)v21);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v12);
      }
      v9 = v10;
      goto LABEL_22;
    }
    v15 = -[SBHIconModel iconClassForApplicationWithBundleIdentifier:](self, "iconClassForApplicationWithBundleIdentifier:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "iconIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = v8;
    }
    v10 = v16;
    if (v16)
    {
      v17 = objc_msgSend([v15 alloc], "initWithLeafIdentifier:application:", v16, v6);
      v18 = (void *)v17;
      if (v8 && v17)
      {
        -[SBHIconModel addIcon:](self, "addIcon:", v17);
        v25 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v19 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v19;
LABEL_22:

        objc_msgSend(v9, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
    }
    else
    {
      v18 = 0;
    }

    goto LABEL_22;
  }
  v7 = 0;
LABEL_23:

  return v7;
}

- (BOOL)shouldAvoidCreatingIconForApplication:(id)a3
{
  return 0;
}

- (Class)iconClassForApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "iconClassForApplicationWithBundleIdentifier:", v4);
  -[SBHIconModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend(v6, "iconModel:iconClassForApplicationWithBundleIdentifier:proposedClass:", self, v4, v5);
  v7 = v5;

  return v7;
}

- (SBHIconModelDelegate)delegate
{
  return (SBHIconModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)applicationIconsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKey:](self->_applicationIconsByBundleIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "allObjects");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v3)
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_6;
    }
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_6:

  return v7;
}

- (void)addIcon:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  NSMutableSet *additionalApplicationIconIdentifiers;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1CFEF3000, "addIcon", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "addObserver:", self);
  if (objc_msgSend(v4, "isLeafIcon"))
  {
    objc_msgSend(v4, "leafIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_27:

      goto LABEL_28;
    }
    if (objc_msgSend(v4, "isWidgetIcon"))
    {
      -[NSMutableDictionary objectForKey:](self->_widgetIconsByIdentifier, "objectForKey:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_widgetIconsByIdentifier, "setObject:forKey:", v4, v6);
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_leafIconsByIdentifier, "objectForKey:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_leafIconsByIdentifier, "setObject:forKey:", v4, v6);
    }
    if (objc_msgSend(v4, "isApplicationIcon"))
    {
      objc_msgSend(v4, "applicationBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[NSMutableDictionary objectForKey:](self->_applicationIconsByBundleIdentifier, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v4);
        }
        else if (v9)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v12, "addObject:", v9);
          objc_msgSend(v12, "addObject:", v4);
          -[NSMutableDictionary setObject:forKey:](self->_applicationIconsByBundleIdentifier, "setObject:forKey:", v12, v8);

        }
        else
        {
          -[NSMutableDictionary setObject:forKey:](self->_applicationIconsByBundleIdentifier, "setObject:forKey:", v4, v8);
        }
        if ((objc_msgSend(v4, "leafIdentifierAndApplicationBundleIDMatches") & 1) == 0)
        {
          additionalApplicationIconIdentifiers = self->_additionalApplicationIconIdentifiers;
          objc_msgSend(v4, "leafIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](additionalApplicationIconIdentifiers, "addObject:", v14);

        }
      }

    }
    if (v7)
    {
      if (v7 == v4)
      {
LABEL_26:
        -[SBHIconModel didAddIcon:](self, "didAddIcon:", v4);

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("icon"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("SBIconModelDidReplaceIconNotification"), self, v16);
    }
    else
    {
      -[SBHIconModel delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v15, "iconModel:didAddIcon:", self, v4);
      if (!-[SBHIconModel postsDidAddIconNotification](self, "postsDidAddIconNotification"))
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("icon"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("SBIconModelDidAddIconNotification"), self, v17);

    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_28:
  if (objc_msgSend(v4, "isFolderIcon"))
  {
    objc_msgSend(v4, "folder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addFolderObserver:", self);
    -[NSHashTable addObject:](self->_folders, "addObject:", v18);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __24__SBHIconModel_addIcon___block_invoke;
    v19[3] = &unk_1E8D85658;
    v19[4] = self;
    objc_msgSend(v18, "enumerateAllIconsUsingBlock:", v19);

  }
  os_activity_scope_leave(&state);

}

- (BOOL)postsDidAddIconNotification
{
  return self->_postsDidAddIconNotification;
}

- (id)addApplication:(id)a3
{
  return -[SBHIconModel addApplication:force:](self, "addApplication:force:", a3, 0);
}

+ (Class)iconClassForApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobiletimer"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilecal")))
  {
    v5 = (id)objc_opt_self();
  }
  else
  {
    v5 = (id)objc_msgSend(a1, "applicationIconClass");
  }
  v6 = (objc_class *)v5;

  return v6;
}

+ (Class)applicationIconClass
{
  return (Class)objc_opt_self();
}

- (id)expectedIconForDisplayIdentifier:(id)a3
{
  return -[SBHIconModel expectedIconForDisplayIdentifier:createIfNecessary:](self, "expectedIconForDisplayIdentifier:createIfNecessary:", a3, 0);
}

- (id)expectedIconForDisplayIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && v4)
  {
    -[SBHIconModel applicationDataSource](self, "applicationDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconModel:applicationWithBundleIdentifier:", self, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SBHIconModel addApplication:force:](self, "addApplication:force:", v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)leafIconForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_leafIconsByIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSMutableDictionary objectForKey:](self->_widgetIconsByIdentifier, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBHIconModel)initWithStore:(id)a3 applicationDataSource:(id)a4
{
  id v7;
  id v8;
  SBHIconModel *v9;
  SBHIconModel *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *leafIconsByIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *widgetIconsByIdentifier;
  NSMutableDictionary *v15;
  NSMutableDictionary *applicationIconsByBundleIdentifier;
  NSMutableSet *v17;
  NSMutableSet *additionalApplicationIconIdentifiers;
  uint64_t v19;
  NSHashTable *folders;
  uint64_t v21;
  SBHIconGridSizeClassSet *rootFolderAllowedGridSizeClasses;
  SBSHomeScreenService *v23;
  SBSHomeScreenService *homeScreenService;
  uint64_t v25;
  BSInvalidatable *installedWebClipsObservation;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SBHIconModel;
  v9 = -[SBHIconModel init](&v31, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_applicationDataSource, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    leafIconsByIdentifier = v10->_leafIconsByIdentifier;
    v10->_leafIconsByIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    widgetIconsByIdentifier = v10->_widgetIconsByIdentifier;
    v10->_widgetIconsByIdentifier = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applicationIconsByBundleIdentifier = v10->_applicationIconsByBundleIdentifier;
    v10->_applicationIconsByBundleIdentifier = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    additionalApplicationIconIdentifiers = v10->_additionalApplicationIconIdentifiers;
    v10->_additionalApplicationIconIdentifiers = v17;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v19 = objc_claimAutoreleasedReturnValue();
    folders = v10->_folders;
    v10->_folders = (NSHashTable *)v19;

    *(_WORD *)&v10->_automaticallyAddsApplications = 257;
    v10->_automaticallyAddsApplicationPlaceholders = 1;
    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
    v21 = objc_claimAutoreleasedReturnValue();
    rootFolderAllowedGridSizeClasses = v10->_rootFolderAllowedGridSizeClasses;
    v10->_rootFolderAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v21;

    v10->_postsDidAddIconNotification = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "addIconModelApplicationDataSourceObserver:", v10);
    if ((__sb__runningInSpringBoard() & 1) == 0)
    {
      v23 = (SBSHomeScreenService *)objc_alloc_init(MEMORY[0x1E0DAAE90]);
      homeScreenService = v10->_homeScreenService;
      v10->_homeScreenService = v23;

      -[SBSHomeScreenService addInstalledWebClipsObserver:](v10->_homeScreenService, "addInstalledWebClipsObserver:", v10);
      v25 = objc_claimAutoreleasedReturnValue();
      installedWebClipsObservation = v10->_installedWebClipsObservation;
      v10->_installedWebClipsObservation = (BSInvalidatable *)v25;

    }
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v10, sel__noteApplicationIconImageChanged_, CFSTR("com.apple.LaunchServices.applicationIconChanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "currentLocaleDidChangeNotificationName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v10, sel_localeChanged, v29, 0);

  }
  return v10;
}

+ (id)currentLocaleDidChangeNotificationName
{
  return (id)*MEMORY[0x1E0C99720];
}

- (id)applicationIconForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  -[NSMutableDictionary objectForKey:](self->_applicationIconsByBundleIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!v3)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v7 = v3;
    goto LABEL_6;
  }
  objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_109);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v3, "anyObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = v7;
  }
LABEL_8:

  return v6;
}

- (SBHIconModel)initWithStore:(id)a3
{
  return -[SBHIconModel initWithStore:applicationDataSource:](self, "initWithStore:applicationDataSource:", a3, 0);
}

- (SBHIconModel)init
{
  void *v3;
  SBHIconModel *v4;

  objc_msgSend((id)objc_opt_class(), "defaultApplicationDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHIconModel initWithStore:applicationDataSource:](self, "initWithStore:applicationDataSource:", 0, v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentLocaleDidChangeNotificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  -[BSInvalidatable invalidate](self->_installedWebClipsObservation, "invalidate");
  -[SBHIconModel _tearDownIconRunloopObserverIfNeeded](self, "_tearDownIconRunloopObserverIfNeeded");
  -[SBHIconModel _tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded](self, "_tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)SBHIconModel;
  -[SBHIconModel dealloc](&v6, sel_dealloc);
}

+ (id)defaultApplicationDataSource
{
  return objc_alloc_init(SBHApplicationDataSource);
}

- (void)reloadIcons
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SBIconModelWillReloadIconsNotification"), self, 0);

  -[SBHIconModel removeAllIcons](self, "removeAllIcons");
  -[SBHIconModel loadAllIcons](self, "loadAllIcons");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SBIconModelDidReloadIconsNotification"), self, 0);

}

- (void)loadAllIcons
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[SBHIconModel automaticallyAddsWebClips](self, "automaticallyAddsWebClips"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend((id)objc_opt_class(), "allWebClips");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v36;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v36 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x1D17DF4E4]();
          v10 = -[SBHIconModel addBookmarkIconForWebClip:](self, "addBookmarkIconForWebClip:", v8);
          objc_autoreleasePoolPop(v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v5);
    }

  }
  if (-[SBHIconModel automaticallyAddsApplications](self, "automaticallyAddsApplications"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[SBHIconModelApplicationDataSource allApplicationsForIconModel:](self->_applicationDataSource, "allApplicationsForIconModel:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x1D17DF4E4]();
          v18 = -[SBHIconModel addApplication:](self, "addApplication:", v16);
          objc_autoreleasePoolPop(v17);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v13);
    }

  }
  if (-[SBHIconModel automaticallyAddsApplicationPlaceholders](self, "automaticallyAddsApplicationPlaceholders"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[SBHIconModelApplicationDataSource allApplicationPlaceholdersForIconModel:](self->_applicationDataSource, "allApplicationPlaceholdersForIconModel:", self, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23);
          v25 = (void *)MEMORY[0x1D17DF4E4]();
          v26 = -[SBHIconModel addApplicationPlaceholder:](self, "addApplicationPlaceholder:", v24);
          objc_autoreleasePoolPop(v25);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      }
      while (v21);
    }

  }
}

- (id)removeApplication:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel removeApplicationWithBundleIdentifier:](self, "removeApplicationWithBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)removeApplication:(id)a3 pruneEmptyIcons:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel removeApplicationWithBundleIdentifier:pruneEmptyIcons:](self, "removeApplicationWithBundleIdentifier:pruneEmptyIcons:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)removeApplicationWithBundleIdentifier:(id)a3
{
  return -[SBHIconModel removeApplicationWithBundleIdentifier:pruneEmptyIcons:](self, "removeApplicationWithBundleIdentifier:pruneEmptyIcons:", a3, 0);
}

- (id)removeApplicationWithBundleIdentifier:(id)a3 pruneEmptyIcons:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  -[SBHIconModel applicationIconsForBundleIdentifier:](self, "applicationIconsForBundleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "removeApplicationDataSources");
        if (v4 && !objc_msgSend(v11, "iconDataSourceCount"))
          -[SBHIconModel removeIcon:](self, "removeIcon:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(v6, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_noteApplicationIconImageChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("CFBundleIdentifier"), objc_opt_class());
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "Reloading icon image for %@", (uint8_t *)&v8, 0xCu);
      }

      -[SBHIconModel enumerateApplicationIconsForBundleIdentifier:usingBlock:](self, "enumerateApplicationIconsForBundleIdentifier:usingBlock:", v6, &__block_literal_global_3);
    }
  }

}

uint64_t __49__SBHIconModel__noteApplicationIconImageChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadIconImage");
}

+ (id)allWebClips
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3F68], "clipsIncludingWebClips:includingAppClips:", 1, 1);
}

+ (Class)bookmarkIconClass
{
  return (Class)objc_opt_self();
}

+ (Class)bookmarkClass
{
  return (Class)objc_opt_self();
}

- (id)bookmarkIconForWebClipIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBookmarkIcon"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)bookmarkIconForWebClipPlaceholderBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SBHIconModel_bookmarkIconForWebClipPlaceholderBundleIdentifier___block_invoke;
  v8[3] = &unk_1E8D85630;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBHIconModel enumerateLeafIconsUsingBlock:](self, "enumerateLeafIconsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __66__SBHIconModel_bookmarkIconForWebClipPlaceholderBundleIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "isBookmarkIcon");
  v8 = v12;
  if (v7)
  {
    v9 = v12;
    objc_msgSend(v9, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeholderBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    v8 = v12;
  }

}

- (id)addBookmarkIconForWebClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel bookmarkIconForWebClipIdentifier:](self, "bookmarkIconForWebClipIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bookmarkClass")), "initWithWebClip:", v4);
    v7 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bookmarkIconClass")), "initWithBookmark:", v8);
    -[SBHIconModel addIcon:](self, "addIcon:", v7);

  }
  return v7;
}

- (void)updateExistingBookmarkIcon:(id)a3 forUpdatedWebClip:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "bookmarkClass")), "initWithWebClip:", v5);

  objc_msgSend(v6, "setBookmark:", v7);
}

uint64_t __24__SBHIconModel_addIcon___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIcon:", a2);
}

- (void)removeIcon:(id)a3
{
  -[SBHIconModel removeIcon:shouldRemoveFromRootFolder:](self, "removeIcon:shouldRemoveFromRootFolder:", a3, 1);
}

- (void)removeIcon:(id)a3 shouldRemoveFromRootFolder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBHIconModel *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  uint64_t v20;
  NSMutableDictionary *applicationIconsByBundleIdentifier;
  void *v22;
  os_activity_scope_state_s state;
  const __CFString *v24;
  _QWORD v25[2];

  v4 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1CFEF3000, "removeIcon", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  -[SBHIconModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "iconModel:willRemoveIcon:", self, v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("icon");
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SBIconModelWillRemoveIconNotification"), self, v10);

  objc_msgSend(v6, "leafIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBHIconModel rootFolder](self, "rootFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeIcon:options:", v6, 3145728);

  }
  if (objc_msgSend(v6, "isFolderIcon"))
  {
    objc_msgSend(v6, "folder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFolderObserver:", self);
    -[NSHashTable removeObject:](self->_folders, "removeObject:", v13);

  }
  objc_msgSend(v6, "delegate");
  v14 = (SBHIconModel *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == self;

  if (v15)
    objc_msgSend(v6, "setDelegate:", 0);
  if (v11)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_leafIconsByIdentifier, "removeObjectForKey:", v11);
    -[NSMutableDictionary removeObjectForKey:](self->_widgetIconsByIdentifier, "removeObjectForKey:", v11);
  }
  objc_msgSend(v6, "applicationBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[NSMutableDictionary objectForKey:](self->_applicationIconsByBundleIdentifier, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v17, "removeObject:", v6);
      v20 = objc_msgSend(v17, "count");
      if (v20)
      {
        if (v20 == 1)
        {
          applicationIconsByBundleIdentifier = self->_applicationIconsByBundleIdentifier;
          objc_msgSend(v17, "anyObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](applicationIconsByBundleIdentifier, "setObject:forKey:", v22, v16);

        }
        goto LABEL_18;
      }
    }
    else if (!v17)
    {
LABEL_18:

      goto LABEL_19;
    }
    -[NSMutableDictionary removeObjectForKey:](self->_applicationIconsByBundleIdentifier, "removeObjectForKey:", v16);
    goto LABEL_18;
  }
LABEL_19:
  if (v11)
    -[NSMutableSet removeObject:](self->_additionalApplicationIconIdentifiers, "removeObject:", v11);

  os_activity_scope_leave(&state);
}

- (void)removeIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBHIconModel removeIcon:](self, "removeIcon:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeIconForIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBHIconModel removeIcon:](self, "removeIcon:", v4);
    v4 = v5;
  }

}

- (void)removeAllIcons
{
  -[NSMutableDictionary removeAllObjects](self->_leafIconsByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_widgetIconsByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_applicationIconsByBundleIdentifier, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_additionalApplicationIconIdentifiers, "removeAllObjects");
}

- (id)addAdditionalIconMatchingIcon:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Icon model preparing to add additional icon matching icon: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v4, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || !-[SBHIconModel shouldAvoidCreatingIconForApplication:](self, "shouldAvoidCreatingIconForApplication:", v6))
  {
    objc_msgSend(v4, "applicationBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v7 = 0;
      goto LABEL_16;
    }
    -[SBHIconModel rootFolder](self, "rootFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isApplicationIcon"))
    {
      -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v9, "ignoredList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "directlyContainsIcon:", v7);

        if ((v11 & 1) != 0)
        {
LABEL_14:

LABEL_16:
          goto LABEL_17;
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v4, "copyWithLeafIdentifier:", v13);
    if (v7)
      -[SBHIconModel addIcon:](self, "addIcon:", v7);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel _noteRemovedIcons:](self, "_noteRemovedIcons:", v14);

    goto LABEL_14;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)isTrackingIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSHashTable *folders;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isLeafIcon"))
  {
    objc_msgSend(v4, "leafIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
  }
  if (objc_msgSend(v4, "isFolderIcon")
    && (folders = self->_folders,
        objc_msgSend(v4, "folder"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(folders) = -[NSHashTable containsObject:](folders, "containsObject:", v8),
        v8,
        (folders & 1) != 0))
  {
LABEL_5:
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_checkRemovedIcons
{
  void *v3;
  void *v4;
  char v5;
  NSMutableSet *removedIcons;
  id v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  -[SBHIconModel rootFolder](self, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  removedIcons = self->_removedIcons;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__SBHIconModel__checkRemovedIcons__block_invoke;
  v12[3] = &unk_1E8D85680;
  v12[4] = self;
  v13 = v3;
  v15 = v5 & 1;
  v14 = v4;
  v7 = v4;
  v11 = v3;
  -[NSMutableSet objectsPassingTest:](removedIcons, "objectsPassingTest:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel removeIcons:](self, "removeIcons:", v9);

  v10 = self->_removedIcons;
  self->_removedIcons = 0;

  -[SBHIconModel _tearDownIconRunloopObserverIfNeeded](self, "_tearDownIconRunloopObserverIfNeeded");
}

uint64_t __34__SBHIconModel__checkRemovedIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTrackingIcon:", v3)
    && (objc_msgSend(*(id *)(a1 + 40), "indexPathForIcon:includingPlaceholders:", v3, 1),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4)
    && objc_msgSend(*(id *)(a1 + 32), "isIconVisible:", v3))
  {
    if (*(_BYTE *)(a1 + 56))
      v5 = objc_msgSend(*(id *)(a1 + 48), "iconModel:shouldRemoveIcon:", *(_QWORD *)(a1 + 32), v3);
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_noteRemovedIcons:(id)a3
{
  id v4;
  NSMutableSet *removedIcons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  removedIcons = self->_removedIcons;
  v8 = v4;
  if (!removedIcons)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_removedIcons;
    self->_removedIcons = v6;

    v4 = v8;
    removedIcons = self->_removedIcons;
  }
  -[NSMutableSet unionSet:](removedIcons, "unionSet:", v4);
  -[SBHIconModel _setUpIconRunLoopObserver](self, "_setUpIconRunLoopObserver");

}

- (void)_setUpIconRunLoopObserver
{
  const __CFAllocator *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_iconRunLoopObserver)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__SBHIconModel__setUpIconRunLoopObserver__block_invoke;
    v5[3] = &unk_1E8D856A8;
    objc_copyWeak(&v6, &location);
    self->_iconRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999900, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_iconRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __41__SBHIconModel__setUpIconRunLoopObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkRemovedIcons");

}

- (void)_tearDownIconRunloopObserverIfNeeded
{
  __CFRunLoopObserver *iconRunLoopObserver;

  iconRunLoopObserver = self->_iconRunLoopObserver;
  if (iconRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(iconRunLoopObserver);
    CFRelease(self->_iconRunLoopObserver);
    self->_iconRunLoopObserver = 0;
  }
}

- (unint64_t)maxListCountForFolders
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "maxListCountForFoldersForIconModel:", self);
  else
    v5 = 15;

  return v5;
}

- (SBHIconGridSize)listGridSizeForFolderClass:(Class)a3
{
  void *v5;
  void *v6;
  int v7;
  unsigned int v8;
  int v9;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "iconModel:listGridSizeForFolderClass:", self, a3);
    v8 = v7 & 0xFFFF0000;
    v9 = (unsigned __int16)v7;
  }
  else
  {
    v8 = 196608;
    v9 = 3;
  }

  return (SBHIconGridSize)(v8 | v9);
}

- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3
{
  void *v5;
  int v6;
  unsigned int v7;
  int v8;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "iconModel:listWithNonDefaultSizedIconsGridSizeForFolderClass:", self, a3);
    v7 = v6 & 0xFFFF0000;
    v8 = (unsigned __int16)v6;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }

  return (SBHIconGridSize)(v7 | v8);
}

- (unint64_t)maxIconCountForDock
{
  void *v3;
  unint64_t v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "maxIconCountForDockForIconModel:", self);
  else
    v4 = 4;

  return v4;
}

- (unint64_t)maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "iconModel:maxRowCountForListInRootFolderWithInterfaceOrientation:", self, a3);
  else
    v7 = 6;

  return v7;
}

- (unint64_t)maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "iconModel:maxColumnCountForListInRootFolderWithInterfaceOrientation:", self, a3);
  else
    v7 = 6;

  return v7;
}

- (unint64_t)maxRowCountForFavoriteTodayList
{
  void *v3;
  unint64_t v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "maxRowCountForFavoriteTodayListForIconModel:", self);
  else
    v4 = 4;

  return v4;
}

- (unint64_t)maxColumnCountForTodayList
{
  void *v3;
  unint64_t v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "maxColumnCountForTodayListForIconModel:", self);
  else
    v4 = 4;

  return v4;
}

- (SBHIconGridSizeClassSizeMap)gridSizeClassSizes
{
  void *v3;
  void *v4;
  SBHIconGridSizeClassSizeMap *v5;
  SBHIconGridSizeClassSizeMap *v6;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "gridSizeClassSizesForIconModel:", self);
    v5 = (SBHIconGridSizeClassSizeMap *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  }
  v6 = v5;

  return v6;
}

- (id)rotatedGridSizeClassSizes
{
  void *v3;
  void *v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "rotatedGridSizeClassSizesForIconModel:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)listRotatedLayoutClusterGridSizeClass
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "listRotatedLayoutClusterGridSizeClassForIconModel:", self);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("SBHIconGridSizeClassDefault");
  }
  v5 = v4;

  return (NSString *)v5;
}

- (BOOL)listsAllowRotatedLayoutForFolderClass:(Class)a3
{
  void *v5;
  char v6;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconModel:listsAllowRotatedLayoutForFolderClass:", self, a3);
  else
    v6 = 0;

  return v6;
}

- (id)allowedGridSizeClassesForFolderClass:(Class)a3
{
  void *v5;
  void *v6;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "iconModel:allowedGridSizeClassesForFolderClass:", self, a3);
  else
    -[SBHIconModel rootFolderAllowedGridSizeClasses](self, "rootFolderAllowedGridSizeClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allowedGridSizeClassesForDock
{
  void *v3;
  void *v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "allowedGridSizeClassesForDockForIconModel:", self);
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allowedGridSizeClassesForTodayList
{
  void *v3;
  SBHIconGridSizeClassSet *v4;
  SBHIconGridSizeClassSet *v5;
  void *v6;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "allowedGridSizeClassesForTodayListForIconModel:", self);
    v4 = (SBHIconGridSizeClassSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [SBHIconGridSizeClassSet alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v5, "initWithGridSizeClasses:", v6);

  }
  return v4;
}

- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBHIconModel delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "iconModel:supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:", self, v8, v9, v10);
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllNonDefaultGridSizeClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)listsFixedIconLocationBehaviorForFolderClass:(Class)a3
{
  void *v5;
  int64_t v6;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconModel:listsFixedIconLocationBehaviorForFolderClass:", self, a3);
  else
    v6 = 1;

  return v6;
}

- (unint64_t)listsIconLayoutBehaviorForFolderClass:(Class)a3
{
  void *v5;
  unint64_t v6;

  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconModel:listsIconLayoutBehaviorForFolderClass:", self, a3);
  else
    v6 = 0;

  return v6;
}

- (id)customGridSizeClassDomain
{
  void *v3;
  void *v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "gridSizeClassDomainForIconModel:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  void *v2;

  -[SBHIconModel customGridSizeClassDomain](self, "customGridSizeClassDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBHIconGridSizeClassDomain *)v2;
}

- (void)enumerateLeafIconsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *leafIconsByIdentifier;
  uint64_t v6;
  id v7;
  NSMutableDictionary *widgetIconsByIdentifier;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke;
  v11[3] = &unk_1E8D856D0;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](leafIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (!*((_BYTE *)v15 + 24))
  {
    widgetIconsByIdentifier = self->_widgetIconsByIdentifier;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke_2;
    v9[3] = &unk_1E8D856F8;
    v10 = v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](widgetIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
  _Block_object_dispose(&v14, 8);

}

uint64_t __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a4;
  return result;
}

uint64_t __45__SBHIconModel_enumerateLeafIconsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSSet)visibleLeafIcons
{
  void *v3;
  id v4;
  void *v5;
  NSSet *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  SBHIconModel *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __32__SBHIconModel_visibleLeafIcons__block_invoke;
  v11 = &unk_1E8D85720;
  v12 = self;
  v4 = v3;
  v13 = v4;
  v5 = _Block_copy(&v8);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_leafIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v5, v8, v9, v10, v11, v12);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_widgetIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v5);
  v6 = (NSSet *)v4;

  return v6;
}

void __32__SBHIconModel_visibleLeafIcons__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (NSSet)leafIconsUniquedByApplicationBundleIdentifier
{
  id v3;
  NSMutableDictionary *leafIconsByIdentifier;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SBHIconModel_leafIconsUniquedByApplicationBundleIdentifier__block_invoke;
  v7[3] = &unk_1E8D85748;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](leafIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

void __61__SBHIconModel_leafIconsUniquedByApplicationBundleIdentifier__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "applicationBundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4, v6 = objc_msgSend(v7, "leafIdentifierAndApplicationBundleIDMatches"), v5, v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

- (id)leafIconsForIdentifiers:(id)a3
{
  return -[SBHIconModel leafIconsForIdentifiers:notFoundMarker:](self, "leafIconsForIdentifiers:notFoundMarker:", a3, 0);
}

- (id)leafIconsForIdentifiers:(id)a3 notFoundMarker:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unint64_t)a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14 | v7)
        {
          if (v14)
            v16 = v14;
          else
            v16 = v7;
          objc_msgSend(v8, "addObject:", v16);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

uint64_t __51__SBHIconModel_applicationIconForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "leafIdentifierAndApplicationBundleIDMatches");
}

- (void)enumerateApplicationIconsForBundleIdentifier:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, uint64_t, char *);
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, char *))a4;
  -[NSMutableDictionary objectForKey:](self->_applicationIconsByBundleIdentifier, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = 0;
        v6[2](v6, v15, &v16);
        if (v16)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else if (v7)
  {
    v16 = 0;
    v6[2](v6, (uint64_t)v7, &v16);
  }

}

- (void)removeApplicationIconsForBundleIdentifier:(id)a3
{
  id v4;

  -[SBHIconModel applicationIconsForBundleIdentifier:](self, "applicationIconsForBundleIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel removeIcons:](self, "removeIcons:", v4);

}

- (id)applicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHIconModel applicationDataSource](self, "applicationDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconModel:applicationWithBundleIdentifier:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)widgetIcons
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_widgetIconsByIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)widgetIconForLeafIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_widgetIconsByIdentifier, "objectForKey:", a3);
}

- (id)widgetIconsContainingWidgetsMatchingExtensionBundleIdentifier:(id)a3 kind:(id)a4 sizeClass:(int64_t)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  NSMutableDictionary *obj;
  id v26;
  uint64_t v27;
  SBHIconModel *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26 = (id)objc_opt_new();
  -[SBHIconModel gridSizeClassDomain](self, "gridSizeClassDomain");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v28 = self;
  obj = self->_widgetIconsByIdentifier;
  v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v39;
    v32 = v9;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(obj);
        v30 = v11;
        -[NSMutableDictionary objectForKey:](v28->_widgetIconsByIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v33 = v12;
        objc_msgSend(v12, "widgets");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (!v14)
          goto LABEL_29;
        v15 = v14;
        v16 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v18, "extensionBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v19, "isEqualToString:", v9))
              goto LABEL_23;
            if (v10)
            {
              objc_msgSend(v18, "kind");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v5, "isEqualToString:", v10) & 1) == 0)
              {

LABEL_23:
                continue;
              }
              if (!a5)
              {

LABEL_27:
                v9 = v32;
LABEL_28:
                objc_msgSend(v26, "addObject:", v33);
                goto LABEL_29;
              }
            }
            else if (!a5)
            {
              goto LABEL_27;
            }
            v20 = a5;
            objc_msgSend(v33, "gridSizeClass");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v31, "chsWidgetFamilyForIconGridSizeClass:", v21);

            if (v10)
            a5 = v20;
            v23 = v22 == v20;
            v9 = v32;
            if (v23)
              goto LABEL_28;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v15)
            continue;
          break;
        }
LABEL_29:

        v11 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v29);
  }

  return v26;
}

- (id)widgetIconsContainingWidgetsMatchingUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *widgetIconsByIdentifier;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  widgetIconsByIdentifier = self->_widgetIconsByIdentifier;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SBHIconModel_widgetIconsContainingWidgetsMatchingUniqueIdentifier___block_invoke;
  v12[3] = &unk_1E8D857B0;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](widgetIconsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __69__SBHIconModel_widgetIconsContainingWidgetsMatchingUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "iconDataSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v12)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)leafIconContainingDataSourceWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SBHIconModel_leafIconContainingDataSourceWithIdentifier___block_invoke;
  v8[3] = &unk_1E8D85630;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBHIconModel enumerateLeafIconsUsingBlock:](self, "enumerateLeafIconsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__SBHIconModel_leafIconContainingDataSourceWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "firstIconDataSourceWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)addIconsOfClass:(Class)a3 toSet:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allValues](self->_leafIconsByIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_widgetIconsByIdentifier, "allValues", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (id)iconsOfClass:(Class)a3
{
  void *v5;

  v5 = (void *)objc_opt_new();
  -[SBHIconModel addIconsOfClass:toSet:](self, "addIconsOfClass:toSet:", a3, v5);
  return v5;
}

- (NSSet)leafIconIdentifiers
{
  uint64_t v3;
  NSMutableDictionary *leafIconsByIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[NSMutableDictionary count](self->_widgetIconsByIdentifier, "count");
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    -[NSMutableDictionary allKeys](leafIconsByIdentifier, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary allKeys](self->_widgetIconsByIdentifier, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](leafIconsByIdentifier, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v7;
}

- (BOOL)addIconToDesignatedLocation:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[SBHIconModel rootFolder](self, "rootFolder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[SBHIconModel addIcon:toDesignatedLocationInRootFolder:options:listGridCellInfoOptions:](self, "addIcon:toDesignatedLocationInRootFolder:options:listGridCellInfoOptions:", v8, v9, a4, a5);

  return a5;
}

- (BOOL)addIcon:(id)a3 toDesignatedLocationInRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  char v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  char v17;
  char v18;
  char v19;
  char v20;
  NSObject *v21;
  const char *v22;
  BOOL v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  char v34;
  NSObject *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  SBLogIcon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v10;
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "Icon model preparing to add icon: %{public}@", buf, 0xCu);
  }

  v13 = objc_msgSend(v11, "containsIcon:", v10);
  v14 = (v13 & 1) == 0
     && objc_msgSend(v10, "isLeafIcon")
     && -[SBHIconModel shouldPlaceIconOnIgnoredList:](self, "shouldPlaceIconOnIgnoredList:", v10);
  if (objc_msgSend(v10, "isLeafIcon"))
    v15 = -[SBHIconModel _shouldSkipAddingIcon:toRootFolder:](self, "_shouldSkipAddingIcon:toRootFolder:", v10, v11);
  else
    v15 = 0;
  objc_msgSend(v11, "ignoredList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "directlyContainsIcon:", v10);

  if ((a5 & 4) != 0)
    v18 = 0;
  else
    v18 = v13;
  v19 = v17 ^ 1;
  if ((a5 & 2) == 0)
    v19 = 1;
  v20 = v18 & v19;
  if ((v20 & 1) == 0 && !v15)
  {
    if ((a5 & 4) != 0)
      v19 = 0;
    if ((v19 & 1) == 0)
      objc_msgSend(v11, "removeIcon:options:", v10, 0);
    if (-[SBHIconModel addIconToDesignatedLocationBasedOnDelegate:toRootFolder:options:listGridCellInfoOptions:](self, "addIconToDesignatedLocationBasedOnDelegate:toRootFolder:options:listGridCellInfoOptions:", v10, v11, a5, a6))
    {
      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Added icon based on delegate";
LABEL_35:
        _os_log_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    if (-[SBHIconModel addIconToDesignatedLocationBasedOnDesiredIconState:toRootFolder:options:listGridCellInfoOptions:](self, "addIconToDesignatedLocationBasedOnDesiredIconState:toRootFolder:options:listGridCellInfoOptions:", v10, v11, a5, a6))
    {
      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Added icon based on desired icon state";
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_37;
    }
    if (-[SBHIconModel addIconToIgnoredListBasedOnDefaultIconState:toRootFolder:options:listGridCellInfoOptions:](self, "addIconToIgnoredListBasedOnDefaultIconState:toRootFolder:options:listGridCellInfoOptions:", v10, v11, a5, a6))
    {
      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Added icon to ignored list based on default icon state";
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if (v14)
    {
      objc_msgSend(v11, "ignoredList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addIcon:", v10);

      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Added icon to ignored list";
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    if (objc_msgSend(v10, "isApplicationIcon")
      && objc_msgSend(v10, "leafIdentifierAndApplicationBundleIDMatches"))
    {
      objc_msgSend(v10, "applicationBundleID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __89__SBHIconModel_addIcon_toDesignatedLocationInRootFolder_options_listGridCellInfoOptions___block_invoke;
      v36[3] = &unk_1E8D857D8;
      v21 = v26;
      v37 = v21;
      objc_msgSend(v11, "indexPathForIconPassingTest:", v36);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v11, "iconAtIndexPath:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v11, "replaceIcon:withIcon:options:", v28, v10, 0);

        if (v29)
        {
          SBLogIcon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CFEF3000, v30, OS_LOG_TYPE_DEFAULT, "Added icon replacing another icon", buf, 2u);
          }

          goto LABEL_36;
        }
      }

    }
    objc_msgSend(v10, "gridSizeClass");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gridPathForFirstFreeSlotOfRangeOfSizeClass:avoidingFirstList:listGridCellInfoOptions:", v21, 1, a6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31
      || (v32 = (id)objc_msgSend(v11, "addEmptyListRemovingLeastRecentlyHiddenListIfNecessary"), objc_msgSend(v11, "gridPathForFirstFreeSlotOfRangeOfSizeClass:avoidingFirstList:listGridCellInfoOptions:", v21, 1, a6), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v11, "insertIcon:atGridPath:options:", v10, v31, 16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "containsObject:", v10);

      if ((v34 & 1) == 0)
      {
        SBLogIcon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CFEF3000, v35, OS_LOG_TYPE_DEFAULT, "Added icon to the first free slot available", buf, 2u);
        }

        goto LABEL_36;
      }
    }

LABEL_25:
    v23 = 0;
    goto LABEL_40;
  }
  if ((v20 & 1) == 0)
    goto LABEL_25;
LABEL_37:
  -[SBHIconModel addIcon:](self, "addIcon:", v10);
  if ((a5 & 1) != 0)
    -[SBHIconModel saveIconStateIfNeeded](self, "saveIconStateIfNeeded");
  v23 = 1;
LABEL_40:

  return v23;
}

uint64_t __89__SBHIconModel_addIcon_toDesignatedLocationInRootFolder_options_listGridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isApplicationIcon")
    && (objc_msgSend(v3, "leafIdentifierAndApplicationBundleIDMatches") & 1) == 0)
  {
    objc_msgSend(v3, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)addIconToDesignatedLocationBasedOnDelegate:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a4;
  -[SBHIconModel delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "iconModel:customInsertionGridPathForIcon:inRootFolder:", self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    LOBYTE(v12) = 0;
    goto LABEL_8;
  }
  objc_msgSend(v10, "iconModel:customInsertionRelativePathForIcon:inRootFolder:", self, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v9, "gridPathForRelativePath:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_6:
      v13 = (id)objc_msgSend(v9, "insertIcon:atGridPath:options:", v8, v11, 0);

      LOBYTE(v12) = 1;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return (char)v12;
}

- (id)unarchivedRootFolderForAddingIconFromOtherIconState:(id)a3
{
  id v4;
  SBHIconStateUnarchiver *v5;
  SBHIconStateUnarchivingSlugIconSource *v6;
  SBHIconModelDesiredIconStateUnarchiverDelegate *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[SBHIconStateUnarchiver initWithArchive:]([SBHIconStateUnarchiver alloc], "initWithArchive:", v4);

  v6 = objc_alloc_init(SBHIconStateUnarchivingSlugIconSource);
  -[SBHIconStateUnarchiver setIconSource:](v5, "setIconSource:", v6);
  -[SBHIconStateUnarchiver setIconModel:](v5, "setIconModel:", self);
  v7 = objc_alloc_init(SBHIconModelDesiredIconStateUnarchiverDelegate);
  -[SBHIconStateUnarchiver setDelegate:](v5, "setDelegate:", v7);
  -[SBHIconStateUnarchiver unarchive](v5, "unarchive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootFolder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)addIcon:(id)a3 toDesignatedLocationBasedOnOtherRootFolder:(id)a4 toRootFolder:(id)a5 options:(unint64_t)a6 listGridCellInfoOptions:(unint64_t)a7
{
  char v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBFolderIcon *v23;
  id v24;
  id v25;
  void (**v26)(void);
  void (**v27)(void);
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  SBFolderIcon *v34;
  uint64_t v35;
  SBHIconModel *v36;
  SBHIconModel *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  SBFolderIcon *v47;
  id v48;
  void *v49;
  SBFolderIcon *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  SBHIconModel *v78;
  SBFolderIcon *v79;
  void (**v80)(void);
  void *v81;
  SBFolderIcon *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD aBlock[4];
  id v87;
  SBFolderIcon *v88;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if ((v8 & 2) == 0
    || (objc_msgSend(v13, "ignoredList"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "nodeIdentifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "directlyContainsIconWithIdentifier:", v16),
        v16,
        v15,
        (v17 & 1) == 0))
  {
    objc_msgSend(v12, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relativePathForIcon:listGridCellInfoOptions:", v12, a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForIconWithIdentifier:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    LOBYTE(v18) = 0;
    if (!v20 || !v21)
      goto LABEL_29;
    objc_msgSend(v21, "sb_indexPathByRemovingLastIconIndex");
    v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();
    v85 = v20;
    if ((objc_msgSend(v14, "isValidIndexPath:", v23) & 1) != 0)
      goto LABEL_20;
    v78 = self;
    objc_msgSend(v13, "folderContainingIndexPath:relativeIndexPath:", v22, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __112__SBHIconModel_addIcon_toDesignatedLocationBasedOnOtherRootFolder_toRootFolder_options_listGridCellInfoOptions___block_invoke;
    aBlock[3] = &unk_1E8D85800;
    v25 = v14;
    v87 = v25;
    v82 = v23;
    v88 = v82;
    v26 = (void (**)(void))_Block_copy(aBlock);
    v80 = v26;
    v81 = v24;
    if (v24 == v13)
    {
      objc_msgSend(v20, "listIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addEmptyListWithIdentifier:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "indexPathForList:", v33);
      v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();
      v31 = v25;
      v34 = v82;
LABEL_17:

LABEL_18:
      v53 = objc_msgSend(v31, "isValidIndexPath:", v23);

      if (!v53)
      {
        LOBYTE(v18) = 0;
        v20 = v85;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v20 = v85;
LABEL_20:
      objc_msgSend(v14, "listAtIndexPath:", v23);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v54)
      {
        v84 = v19;
        objc_msgSend(v54, "folder");
        v56 = v20;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "uniqueIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "uniqueIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "iconRelativePathWithFolderIdentifier:listIdentifier:", v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gridPathForRelativePath:", v60);
        v61 = objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v18 = (void *)v61;
          v62 = (id)objc_msgSend(v14, "insertIcon:atGridPath:options:", v12, v61, 0);

          LOBYTE(v18) = 1;
        }
        else
        {

          objc_msgSend(v14, "addIcon:toListAtIndex:options:", v12, -[SBFolderIcon sbListIndex](v23, "sbListIndex"), 0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v18) = objc_msgSend(v60, "containsObject:", v12) ^ 1;
        }

        v19 = v84;
        v20 = v85;
      }
      else
      {
        LOBYTE(v18) = 0;
      }

      goto LABEL_28;
    }
    v27 = v26;
    v83 = v19;
    objc_msgSend(v24, "uniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstFolderWithUniqueIdentifier:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      ((void (*)(void (**)(void), void *))v27[2])(v27, v29);
      v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();

      v30 = objc_msgSend(v25, "isValidIndexPath:", v23);
      v82 = v23;
      v19 = v83;
      v31 = v25;
      if ((v30 & 1) != 0)
        goto LABEL_18;
    }
    else
    {

      v19 = v83;
      v31 = v25;
    }
    objc_msgSend(v81, "icon");
    v77 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relativePathForIcon:listGridCellInfoOptions:");
    v76 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "gridPathForRelativePath:");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v78;
    if (v35)
      goto LABEL_14;
    objc_msgSend(v13, "indexPathForIcon:", v77);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v31, "isValidIndexPath:forInsertion:", v64, 1) & 1) == 0
      && objc_msgSend(v64, "sb_iconPathCount") == 1)
    {
      v65 = v31;
      v66 = objc_msgSend(v64, "sbListIndex");
      if (v66 == objc_msgSend(v65, "listCount"))
      {
        objc_msgSend(0, "listIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (id)objc_msgSend(v65, "addEmptyListWithIdentifier:", v67);

        objc_msgSend(v64, "sb_indexPathByReplacingLastIconIndex:", 0);
        v69 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v69;
      }
      v31 = v65;
      v36 = v78;
    }
    if ((objc_msgSend(v31, "isValidIndexPath:forInsertion:", v64, 1) & 1) != 0)
    {
      objc_msgSend(v31, "gridPathForIndexPath:listGridCellInfoOptions:", v64, a7);
      v70 = objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        v71 = v70;

        v35 = v71;
LABEL_14:
        v37 = v36;
        v38 = v35;
        objc_msgSend(v81, "displayName");
        v39 = v31;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "uniqueIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconModel makeFolderWithDisplayName:uniqueIdentifier:](v37, "makeFolderWithDisplayName:uniqueIdentifier:", v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v81, "defaultDisplayName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setDefaultDisplayName:", v43);

        objc_msgSend(v85, "listIdentifier");
        v44 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstList");
        v45 = objc_claimAutoreleasedReturnValue();
        v75 = v44;
        v46 = (id)objc_msgSend(v42, "addEmptyListWithIdentifier:", v44);
        v74 = (void *)v45;
        objc_msgSend(v42, "removeList:", v45);
        v47 = -[SBFolderIcon initWithFolder:]([SBFolderIcon alloc], "initWithFolder:", v42);
        v79 = (SBFolderIcon *)v38;
        v48 = (id)objc_msgSend(v39, "insertIcon:atGridPath:options:", v47, v38, 0);
        objc_msgSend(v42, "firstList");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v39;
        objc_msgSend(v39, "indexPathForList:", v49);
        v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();

        v50 = v47;
        v19 = v83;
        goto LABEL_15;
      }
      objc_msgSend(v31, "gridPathWithListAtIndexPath:gridCellIndex:listGridCellInfoOptions:", v64, 0, a7);
      v73 = objc_claimAutoreleasedReturnValue();

      v35 = v73;
      if (v73)
        goto LABEL_14;
    }
    else
    {

    }
    objc_msgSend(v81, "displayName");
    v72 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "defaultDisplayName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "uniqueIdentifier");
    v75 = objc_claimAutoreleasedReturnValue();
    v79 = (SBFolderIcon *)v72;
    objc_msgSend(v31, "firstFolderWithUniqueIdentifier:displayName:defaultDisplayName:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
      v23 = v82;
      v32 = (void *)v77;
      v52 = (void *)v75;
      goto LABEL_16;
    }
    v74 = v51;
    v80[2]();
    v23 = (SBFolderIcon *)objc_claimAutoreleasedReturnValue();
    v50 = v82;
LABEL_15:

    v32 = (void *)v77;
    v51 = v74;
    v52 = (void *)v75;
LABEL_16:

    v34 = v79;
    v33 = (void *)v76;
    goto LABEL_17;
  }
  LOBYTE(v18) = 0;
LABEL_30:

  return (char)v18;
}

id __112__SBHIconModel_addIcon_toDesignatedLocationBasedOnOtherRootFolder_toRootFolder_options_listGridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "indexPathForFolder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sb_indexPathByRemovingFirstIconPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sbListIndex");

  LODWORD(v6) = objc_msgSend(v4, "isValidListIndex:", v7);
  if ((_DWORD)v6)
    v8 = v7;
  else
    v8 = 0;
  objc_msgSend(v5, "indexPathByAddingIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)addIcon:(id)a3 toIgnoredListIfNecessaryBasedOnOtherRootFolder:(id)a4 toRootFolder:(id)a5 options:(unint64_t)a6 listGridCellInfoOptions:(unint64_t)a7
{
  id v9;
  id v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];

  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(a4, "isIconInIgnoredList:", v9);
  if (v11)
  {
    objc_msgSend(v10, "ignoredList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addIcon:", v9);

    SBLogIcon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "Added icon to ignored list based on other root folder", v15, 2u);
    }

  }
  return v11;
}

- (BOOL)addIconToDesignatedLocationBasedOnDesiredIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  -[SBHIconModel desiredIconState](self, "desiredIconState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && ((-[SBHIconModel cachedDesiredRootFolder](self, "cachedDesiredRootFolder"),
         (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[SBHIconModel unarchivedRootFolderForAddingIconFromOtherIconState:](self, "unarchivedRootFolderForAddingIconFromOtherIconState:", v12), v13 = (void *)objc_claimAutoreleasedReturnValue(), -[SBHIconModel setCachedDesiredRootFolder:](self, "setCachedDesiredRootFolder:", v13), -[SBHIconModel scheduleDiscardOfCachedOtherRootFolders](self, "scheduleDiscardOfCachedOtherRootFolders"), v13)))
  {
    v14 = -[SBHIconModel addIcon:toDesignatedLocationBasedOnOtherRootFolder:toRootFolder:options:listGridCellInfoOptions:](self, "addIcon:toDesignatedLocationBasedOnOtherRootFolder:toRootFolder:options:listGridCellInfoOptions:", v10, v13, v11, a5, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)addIconToDesignatedLocationBasedOnDefaultIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  -[SBHIconModel defaultIconState](self, "defaultIconState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && ((-[SBHIconModel cachedDefaultRootFolder](self, "cachedDefaultRootFolder"),
         (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[SBHIconModel unarchivedRootFolderForAddingIconFromOtherIconState:](self, "unarchivedRootFolderForAddingIconFromOtherIconState:", v12), v13 = (void *)objc_claimAutoreleasedReturnValue(), -[SBHIconModel setCachedDefaultRootFolder:](self, "setCachedDefaultRootFolder:", v13), -[SBHIconModel scheduleDiscardOfCachedOtherRootFolders](self, "scheduleDiscardOfCachedOtherRootFolders"), v13)))
  {
    v14 = -[SBHIconModel addIcon:toDesignatedLocationBasedOnOtherRootFolder:toRootFolder:options:listGridCellInfoOptions:](self, "addIcon:toDesignatedLocationBasedOnOtherRootFolder:toRootFolder:options:listGridCellInfoOptions:", v10, v13, v11, a5, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)addIconToIgnoredListBasedOnDefaultIconState:(id)a3 toRootFolder:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;

  v10 = a3;
  v11 = a4;
  -[SBHIconModel defaultIconState](self, "defaultIconState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && ((-[SBHIconModel cachedDefaultRootFolder](self, "cachedDefaultRootFolder"),
         (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (-[SBHIconModel unarchivedRootFolderForAddingIconFromOtherIconState:](self, "unarchivedRootFolderForAddingIconFromOtherIconState:", v12), v13 = (void *)objc_claimAutoreleasedReturnValue(), -[SBHIconModel setCachedDefaultRootFolder:](self, "setCachedDefaultRootFolder:", v13), -[SBHIconModel scheduleDiscardOfCachedOtherRootFolders](self, "scheduleDiscardOfCachedOtherRootFolders"), v13)))
  {
    v14 = -[SBHIconModel addIcon:toIgnoredListIfNecessaryBasedOnOtherRootFolder:toRootFolder:options:listGridCellInfoOptions:](self, "addIcon:toIgnoredListIfNecessaryBasedOnOtherRootFolder:toRootFolder:options:listGridCellInfoOptions:", v10, v13, v11, a5, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_addHiddenAppsToIgnoredListForRootFolder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(v3, "ignoredList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(MEMORY[0x1E0CF9688], "hiddenApplications");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "applicationIconsForBundleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v5, "addIcon:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

}

- (void)scheduleDiscardOfCachedOtherRootFolders
{
  const __CFAllocator *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_discardCachedOtherRootFoldersRunLoopObserver)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__SBHIconModel_scheduleDiscardOfCachedOtherRootFolders__block_invoke;
    v5[3] = &unk_1E8D856A8;
    objc_copyWeak(&v6, &location);
    self->_discardCachedOtherRootFoldersRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999900, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_discardCachedOtherRootFoldersRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __55__SBHIconModel_scheduleDiscardOfCachedOtherRootFolders__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "discardCachedOtherRootFolders");

}

- (void)_tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded
{
  __CFRunLoopObserver *discardCachedOtherRootFoldersRunLoopObserver;

  discardCachedOtherRootFoldersRunLoopObserver = self->_discardCachedOtherRootFoldersRunLoopObserver;
  if (discardCachedOtherRootFoldersRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(discardCachedOtherRootFoldersRunLoopObserver);
    CFRelease(self->_discardCachedOtherRootFoldersRunLoopObserver);
    self->_discardCachedOtherRootFoldersRunLoopObserver = 0;
  }
}

- (void)discardCachedOtherRootFolders
{
  -[SBHIconModel _tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded](self, "_tearDownDiscardCachedOtherRootFoldersRunloopObserverIfNeeded");
  -[SBHIconModel setCachedDesiredRootFolder:](self, "setCachedDesiredRootFolder:", 0);
  -[SBHIconModel setCachedDefaultRootFolder:](self, "setCachedDefaultRootFolder:", 0);
}

- (id)indexPathForIconInPlatformState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "leafIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBHIconModel defaultIconState](self, "defaultIconState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBHIconStateArchiver indexPathForLeafIdentifier:inArchive:](SBHIconStateArchiver, "indexPathForLeafIdentifier:inArchive:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)indexPathForNewIcon:(id)a3 isDesignatedLocation:(BOOL *)a4 replaceExistingIconAtIndexPath:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[SBHIconModel rootFolder](self, "rootFolder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel indexPathInRootFolder:forNewIcon:isDesignatedLocation:replaceExistingIconAtIndexPath:](self, "indexPathInRootFolder:forNewIcon:isDesignatedLocation:replaceExistingIconAtIndexPath:", v9, v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)indexPathInRootFolder:(id)a3 forNewIcon:(id)a4 isDesignatedLocation:(BOOL *)a5 replaceExistingIconAtIndexPath:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "leafIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBHIconModel shouldPlaceIconOnIgnoredList:](self, "shouldPlaceIconOnIgnoredList:", v11);
  -[SBHIconModel delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForIconWithIdentifier:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
LABEL_8:
    v18 = v17;
    goto LABEL_9;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", 0, 30000);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v14, "iconModel:customInsertionIndexPathForIcon:inRootFolder:", self, v11, v10),
        (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SBHIconModel _adjustedDesiredIndexPathInRootFolder:forIconWithIdentifier:](self, "_adjustedDesiredIndexPathInRootFolder:forIconWithIdentifier:", v10, v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  if (-[SBHIconModel _shouldSkipAddingIcon:toRootFolder:](self, "_shouldSkipAddingIcon:toRootFolder:", v11, v10))
  {

    v18 = 0;
LABEL_18:
    v22 = 1;
    goto LABEL_19;
  }
  if (v18 && !v16)
  {
    v19 = SBFolderRelativeListIndex(v18);
    if (!objc_msgSend(v10, "isValidListIndex:", v19)
      || (objc_msgSend(v10, "listAtIndex:", v19), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", 0, objc_msgSend(v10, "listCount"));
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = 0;
      v18 = (void *)v21;
    }

  }
  if (v18)
    goto LABEL_18;
  if (-[SBHIconModel sortsIconsAlphabetically](self, "sortsIconsAlphabetically"))
  {
    objc_msgSend(v10, "icons");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(v25, "count"), 1024, &__block_literal_global_128);
    if (v26 >= objc_msgSend(v25, "count"))
    {
      objc_msgSend(v10, "indexPathForFirstFreeSlotAvoidingFirstList:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v25, "objectAtIndex:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathForIcon:includingPlaceholders:", v27, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_33;
  }
  if (!-[SBHIconModel ignoresIconsNotInIconState](self, "ignoresIconsNotInIconState"))
    goto LABEL_30;
  -[SBHIconModel archivedLeafIdentifiers](self, "archivedLeafIdentifiers");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_30;
  v29 = (void *)v28;
  -[SBHIconModel archivedLeafIdentifiers](self, "archivedLeafIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leafIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "containsObject:", v31);

  v22 = v32;
  if (v32)
  {
LABEL_30:
    objc_msgSend(v10, "indexPathForFirstFreeSlotAvoidingFirstList:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    v22 = 0;
    goto LABEL_19;
  }
  v18 = 0;
LABEL_19:
  if (a5)
    *a5 = v22;
  if (a6)
    *a6 = objc_retainAutorelease(v16);
  v23 = v18;

  return v23;
}

uint64_t __101__SBHIconModel_indexPathInRootFolder_forNewIcon_isDesignatedLocation_replaceExistingIconAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompareDisplayNames:");
}

- (id)_adjustedDesiredIndexPathInRootFolder:(id)a3 forIconWithIdentifier:(id)a4
{
  return -[SBHIconModel _adjustedIndexPathInRootFolder:withinIconState:forIconWithIdentifier:](self, "_adjustedIndexPathInRootFolder:withinIconState:forIconWithIdentifier:", a3, self->_desiredIconState, a4);
}

- (id)_adjustedPlatformIndexPathInRootFolder:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "leafIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBHIconModel defaultIconState](self, "defaultIconState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel _adjustedIndexPathInRootFolder:withinIconState:forIconWithIdentifier:](self, "_adjustedIndexPathInRootFolder:withinIconState:forIconWithIdentifier:", v6, v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_adjustedIndexPathInRootFolder:(id)a3 withinIconState:(id)a4 forIconWithIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  unint64_t v32;
  unint64_t v33;
  void *v35;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  SBHIconModel *v43;
  id v44;
  _BYTE *v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  v8 = a5;
  +[SBHIconStateArchiver indexPathForLeafIdentifier:inArchive:](SBHIconStateArchiver, "indexPathForLeafIdentifier:inArchive:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    v12 = v39;
    objc_msgSend(v11, "sb_lastIconPathComponent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v12;
    v13 = v11;
    if ((unint64_t)objc_msgSend(v11, "sb_iconPathCount") < 2)
      goto LABEL_8;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    *(_QWORD *)&v48 = __Block_byref_object_dispose_;
    v14 = v12;
    *((_QWORD *)&v48 + 1) = v14;
    +[SBHIconStateArchiver folderPathForLeafIdentifier:inArchive:iconSource:](SBHIconStateArchiver, "folderPathForLeafIdentifier:inArchive:iconSource:", v8, v7, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke;
    v40[3] = &unk_1E8D85868;
    v41 = v14;
    v45 = buf;
    v16 = v41;
    v42 = v16;
    v43 = self;
    v44 = v8;
    objc_msgSend(v15, "enumerateFoldersUsingBlock:", v40);
    v17 = *(id *)(*(_QWORD *)&buf[8] + 40);
    if (v17 == v16)
    {
      v38 = v16;
      v13 = v11;
    }
    else
    {
      v38 = v17;

      objc_msgSend(v16, "indexPathForFolder:", v38);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sb_indexPathByAddingIndexPath:", v37);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(buf, 8);

    if (v17 == v16)
    {
      v19 = 0;
    }
    else
    {
LABEL_8:
      v20 = SBFolderRelativeListIndex(v37);
      if (objc_msgSend(v38, "isValidListIndex:", v20))
      {
        objc_msgSend(v38, "listAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      if (objc_msgSend(v21, "isFull")
        && (objc_msgSend(v12, "isIconAtIndexPathInDock:includingDockFolders:", v11, 1) & 1) != 0
        || (objc_msgSend(v21, "isHidden") & 1) != 0)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v21, "icons");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bs_map:", &__block_literal_global_132);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "indexPathByRemovingLastIndex");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBHIconStateArchiver leafIdentifiersInListAtIndexPath:inArchive:](SBHIconStateArchiver, "leafIdentifiersInListAtIndexPath:inArchive:", v23, v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = SBFolderRelativeIconIndex(v37);
        v26 = objc_msgSend(v24, "count");
        if (v25 >= v26)
        {
          SBLogCommon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v47 = (uint64_t (*)(uint64_t, uint64_t))v8;
            LOWORD(v48) = 2048;
            *(_QWORD *)((char *)&v48 + 2) = v26;
            _os_log_error_impl(&dword_1CFEF3000, v31, OS_LOG_TYPE_ERROR, "%@: desired icon index %lu for '%@' is somehow beyond the end of the list that we expected it to be in (%lu)", buf, 0x2Au);
          }
        }
        else
        {
          if (v25)
          {
            objc_msgSend(v24, "objectAtIndex:", v25 - 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v35, "indexOfObject:", v27);
            if (v28 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v29 = v25 - 2;
              while (v29 != -1)
              {

                objc_msgSend(v24, "objectAtIndex:", v29);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v35, "indexOfObject:", v27);
                --v29;
                if (v28 != 0x7FFFFFFFFFFFFFFFLL)
                  goto LABEL_21;
              }
              v30 = 0;
            }
            else
            {
LABEL_21:
              v30 = v28 + 1;
            }

          }
          else
          {
            v30 = 0;
          }
          v32 = objc_msgSend(v21, "numberOfIcons", v35);
          if (v30 >= v32)
            v33 = v32;
          else
            v33 = v30;
          objc_msgSend(v13, "indexPathByRemovingLastIndex");
          v31 = objc_claimAutoreleasedReturnValue();

          -[NSObject indexPathByAddingIndex:](v31, "indexPathByAddingIndex:", v33);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }

        v13 = v13;
        v19 = v13;
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(*(id *)(a1 + 32), "isValidIndexPath:", v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "iconAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v13, "isFolderIcon"))
  {
    objc_msgSend(v13, "folder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultDisplayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", v9) & 1) != 0)
    {
LABEL_8:

LABEL_9:
      objc_msgSend(v13, "folder");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      goto LABEL_17;
    }
    objc_msgSend(v13, "folder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) != 0)
    {

      goto LABEL_8;
    }
    objc_msgSend(v13, "folder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueIdentifier");
    v25 = v16;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v21, "isEqualToString:", v11);

    if ((v26 & 1) != 0)
      goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "firstFolderWithUniqueIdentifier:displayName:defaultDisplayName:", v11, v9, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v22);
  }
  else
  {
    SBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke_cold_1(a1);

  }
LABEL_17:

}

uint64_t __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke_130(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "leafIdentifier");
}

- (BOOL)_shouldSkipAddingIcon:(id)a3 toRootFolder:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isApplicationIcon"))
  {
    objc_msgSend(v4, "application");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationPlaceholder");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "isAppClip"))
    {
      SBLogIcon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "applicationBundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v8;
        v9 = "Application icon for app clip should not be added to folder: %{public}@";
LABEL_14:
        _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0xCu);

      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0 || !-[NSObject isAppClip](v6, "isAppClip"))
      {
        LOBYTE(v7) = 0;
        goto LABEL_17;
      }
      SBLogIcon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "applicationBundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v8;
        v9 = "Downloading icon for app clip should not be added to folder: %{public}@";
        goto LABEL_14;
      }
    }

    LOBYTE(v7) = 1;
LABEL_17:

    goto LABEL_18;
  }
  if (!objc_msgSend(v4, "isBookmarkIcon"))
  {
    LOBYTE(v7) = 0;
    goto LABEL_20;
  }
  v5 = v4;
  objc_msgSend(v5, "webClip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "isAppClip");

  if ((_DWORD)v7)
  {
    SBLogIcon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "webClip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "Web clip icon for app clip should not be added to folder: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    goto LABEL_17;
  }
LABEL_18:

LABEL_20:
  return (char)v7;
}

- (id)desiredIndexPathForIconWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[SBHIconModel hasDesiredIconState](self, "hasDesiredIconState"))
  {
    +[SBHIconStateArchiver indexPathForLeafIdentifier:inArchive:](SBHIconStateArchiver, "indexPathForLeafIdentifier:inArchive:", v4, self->_desiredIconState);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasDesiredIconState
{
  return self->_desiredIconState != 0;
}

- (NSSet)missingDesiredIconIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_desiredIconState)
  {
    +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBHIconStateArchiver, "leafIdentifiersFromArchive:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel currentLeafIdentifiers](self, "currentLeafIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v11, (_QWORD)v13) & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v5;
}

- (void)clearDesiredIconState
{
  -[SBHIconModel clearDesiredIconStateWithOptions:](self, "clearDesiredIconStateWithOptions:", 0);
}

- (void)clearDesiredIconStateWithOptions:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  SBHIconModel *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1CFEF3000, "clearDesiredIconStateWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  if (self->_desiredIconState)
  {
    -[SBHIconModel store](self, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v6, "deleteDesiredIconStateWithOptions:error:", a3, &v11);
    v8 = v11;
    if (v7)
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "%@: deleted desired icon state", buf, 0xCu);
      }
    }
    else
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v14 = self;
        v15 = 2114;
        v16 = v8;
        v17 = 2114;
        v18 = v10;
        _os_log_error_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_ERROR, "%@: unable to delete desired icon state: %{public}@: \n%{public}@", buf, 0x20u);

      }
    }

    -[SBHIconModel setDesiredIconState:](self, "setDesiredIconState:", 0);
    -[SBHIconModel setDesiredIconStateFlattened:](self, "setDesiredIconStateFlattened:", 0);

  }
  os_activity_scope_leave(&state);
}

- (void)clearDesiredIconStateIfPossible
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  if (self->_desiredIconState)
  {
    if (!self->_desiredIconStateFlattened)
    {
      +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBHIconStateArchiver, "leafIdentifiersFromArchive:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconModel setDesiredIconStateFlattened:](self, "setDesiredIconStateFlattened:", v3);

    }
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[SBHIconModel rootFolder](self, "rootFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__SBHIconModel_clearDesiredIconStateIfPossible__block_invoke;
    v8[3] = &unk_1E8D85658;
    v7 = v4;
    v9 = v7;
    objc_msgSend(v5, "enumerateAllIconsWithOptions:usingBlock:", 1, v8);

    v6 = -[NSOrderedSet count](self->_desiredIconStateFlattened, "count");
    if (v6 <= objc_msgSend(v7, "count"))
    {
      if (-[NSOrderedSet isSubsetOfSet:](self->_desiredIconStateFlattened, "isSubsetOfSet:", v7))
        -[SBHIconModel clearDesiredIconState](self, "clearDesiredIconState");
    }

  }
}

void __47__SBHIconModel_clearDesiredIconStateIfPossible__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isLeafIcon"))
  {
    objc_msgSend(v4, "leafIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (id)iconState
{
  id v2;
  id v4;
  id v5;

  v4 = 0;
  v5 = 0;
  -[SBHIconModel _getLoadedIconState:error:](self, "_getLoadedIconState:error:", &v5, &v4);
  v2 = v5;

  return v2;
}

- (int64_t)_getLoadedIconState:(id *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  SBHIconModel *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[SBHIconModel store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v7, "loadCurrentIconState:", &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  v10 = v9;
  if (v8 || !v9)
  {
    if (v8)
    {
      -[SBHIconModel modernizeRootArchive:](self, "modernizeRootArchive:", v8);
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = 1;
        goto LABEL_15;
      }
    }
  }
  else if (objc_msgSend(v9, "code") != 2)
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_INFO, "%@: unable to read icon state: %@", buf, 0x16u);
    }

  }
  SBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = self;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_INFO, "%@: unable to read current icon state: %@. Defaulting to platform state.", buf, 0x16u);
  }

  -[SBHIconModel defaultIconState](self, "defaultIconState");
  v12 = objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = self;
    _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_INFO, "%@: using default platform state", buf, 0xCu);
  }

  v13 = 2;
LABEL_15:
  -[SBHIconModel todayListsStore](self, "todayListsStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && v12)
  {
    v24 = v7;
    v25 = 0;
    v18 = a3;
    v19 = a4;
    objc_msgSend(v16, "loadCurrentIconState:", &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v25;
    if (v20)
    {
      +[SBHIconStateBuilder iconStateByReplacingTodayListsInIconState:withTodayListsFromIconState:](SBHIconStateBuilder, "iconStateByReplacingTodayListsInIconState:withTodayListsFromIconState:", v12, v20);
      v22 = v12;
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SBHIconModel _getLoadedIconState:error:].cold.1();
    }

    a4 = v19;
    a3 = v18;
    v7 = v24;
  }
  if (!v12)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v13 = 3;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v12);

  return v13;
}

- (void)loadDesiredIconState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  SBHIconModel *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SBHIconModel store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "loadDesiredIconState:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = v5;
  if (v4)
  {
    -[SBHIconModel modernizeRootArchive:](self, "modernizeRootArchive:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[SBHIconModel setDesiredIconState:](self, "setDesiredIconState:", v7);
LABEL_3:

    goto LABEL_4;
  }
  if (v5 && objc_msgSend(v5, "code") != 2)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "%@: unable to read desired icon state: %@", buf, 0x16u);
    }
    goto LABEL_3;
  }
LABEL_4:

}

- (NSDictionary)defaultIconState
{
  void *v3;
  void *v4;

  -[SBHIconModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "defaultIconStateForIconModel:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = &unk_1E8E17678;
  }

  return (NSDictionary *)v4;
}

- (BOOL)shouldAvoidPlacingIconOnFirstPage:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconModel:shouldAvoidPlacingIconOnFirstPage:", self, v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldPlaceIconOnIgnoredList:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[SBHIconModel isCheckingModelConsistency](self, "isCheckingModelConsistency"))
  {
    v5 = 0;
  }
  else
  {
    -[SBHIconModel delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v6, "iconModel:shouldPlaceIconOnIgnoredList:", self, v4);
    else
      v5 = 0;

  }
  return v5;
}

- (id)_unarchiveRootFolderWithLayoutStatus:(int64_t *)a3
{
  NSObject *v5;
  int64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconStateUnarchiver *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t *v28;
  id v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  id v33;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1CFEF3000, "_unarchiveRootFolder", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v32 = 0;
  v33 = 0;
  v6 = -[SBHIconModel _getLoadedIconState:error:](self, "_getLoadedIconState:error:", &v33, &v32);
  v7 = v33;
  v29 = v32;
  -[SBHIconModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SBHIconModel sortsIconsAlphabetically](self, "sortsIconsAlphabetically");
  if (v6 == 1)
  {
    -[SBHIconModel desiredIconState](self, "desiredIconState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[SBHIconModel loadDesiredIconState](self, "loadDesiredIconState");
      -[SBHIconModel desiredIconState](self, "desiredIconState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        -[SBHIconModel setDesiredIconState:](self, "setDesiredIconState:", v7);
    }
  }
  v11 = -[SBHIconStateUnarchiver initWithArchive:iconModel:]([SBHIconStateUnarchiver alloc], "initWithArchive:iconModel:", v7, self);
  -[SBHIconStateUnarchiver setRemovesEmptyFolders:](v11, "setRemovesEmptyFolders:", -[SBHIconModel isRestoring](self, "isRestoring") ^ 1);
  -[SBHIconStateUnarchiver unarchive](v11, "unarchive");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isValid")
    && (objc_msgSend(v12, "rootFolder"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    v31 = v7;
  }
  else
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBHIconModel _unarchiveRootFolderWithLayoutStatus:].cold.1((uint64_t)self, v14);

    -[SBHIconModel clearDesiredIconState](self, "clearDesiredIconState");
    -[SBHIconModel deleteIconState](self, "deleteIconState");
    -[SBHIconModel defaultIconState](self, "defaultIconState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBHIconStateArchiver unarchiveRootFolderFromArchive:withIconSource:](SBHIconStateArchiver, "unarchiveRootFolderFromArchive:withIconSource:", v31, self);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = 2;
    v12 = (void *)v15;
  }
  objc_msgSend(v12, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel didUnarchiveMetadata:](self, "didUnarchiveMetadata:", v16);

  if (objc_msgSend(v12, "isValid")
    && (objc_msgSend(v12, "rootFolder"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    objc_msgSend(v12, "rootFolder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = a3;
    v19 = (objc_class *)(id)objc_opt_self();
    v20 = objc_msgSend(v8, "maxListCountForFoldersForIconModel:", self);
    v21 = objc_msgSend(v8, "iconModel:listGridSizeForFolderClass:", self, v19);
    objc_msgSend(v8, "gridSizeClassSizesForIconModel:", self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend([v19 alloc], "initWithDisplayName:maxListCount:listGridSize:iconGridSizeClassSizes:", &stru_1E8D8E958, v20, v21, v22);
    -[SBHIconModel listRotatedLayoutClusterGridSizeClass](self, "listRotatedLayoutClusterGridSizeClass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setListRotatedLayoutClusterGridSizeClass:", v23);
    -[SBHIconModel allowedGridSizeClassesForFolderClass:](self, "allowedGridSizeClassesForFolderClass:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setListAllowedGridSizeClasses:", v24);
    -[SBHIconModel customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setGridSizeClassDomain:", v25);
    objc_msgSend(v18, "setListsAllowRotatedLayout:", -[SBHIconModel listsAllowRotatedLayoutForFolderClass:](self, "listsAllowRotatedLayoutForFolderClass:", v19));
    objc_msgSend(v18, "setListWithNonDefaultSizedIconsGridSize:", -[SBHIconModel listWithNonDefaultSizedIconsGridSizeForFolderClass:](self, "listWithNonDefaultSizedIconsGridSizeForFolderClass:", v19));
    objc_msgSend(v18, "setListsFixedIconLocationBehavior:", -[SBHIconModel listsFixedIconLocationBehaviorForFolderClass:](self, "listsFixedIconLocationBehaviorForFolderClass:", v19));
    objc_msgSend(v18, "setListsIconLayoutBehavior:", -[SBHIconModel listsIconLayoutBehaviorForFolderClass:](self, "listsIconLayoutBehaviorForFolderClass:", v19));
    -[SBHIconModel rotatedGridSizeClassSizes](self, "rotatedGridSizeClassSizes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRotatedIconGridSizeClassSizes:", v26);

    v6 = 3;
    a3 = v28;
  }
  if (v30)
    objc_msgSend(v18, "sort");
  objc_msgSend(v18, "compactLists", v28);
  if (a3)
    *a3 = v6;

  os_activity_scope_leave(&state);
  return v18;
}

- (BOOL)deleteIconState
{
  return -[SBHIconModel deleteIconStateWithOptions:](self, "deleteIconStateWithOptions:", 0);
}

- (BOOL)deleteIconStateWithOptions:(unint64_t)a3
{
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  SBHIconModel *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBHIconModel markIconStateClean](self, "markIconStateClean");
  -[SBHIconModel store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "deleteCurrentIconStateWithOptions:error:", a3, &v11);
  v7 = v11;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_INFO, "%@: deleted current icon state", buf, 0xCu);
    }

    -[SBHIconModel delegate](self, "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject didDeleteIconState:](v9, "didDeleteIconState:", self);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[SBHIconModel deleteIconStateWithOptions:].cold.1((uint64_t)self);
  }

  return v6;
}

- (void)saveDesiredIconState
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v1, v2, "%@: unable to save desired icon state: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_saveIconState
{
  OUTLINED_FUNCTION_4_0(&dword_1CFEF3000, a1, a3, "Please move to _saveIconStateWithError:", a5, a6, a7, a8, 0);
}

- (BOOL)_saveIconStateWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v9;

  v5 = _os_activity_create(&dword_1CFEF3000, "saveIconState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  -[SBHIconModel iconModelMetadata](self, "iconModelMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBHIconStateArchiver archiveRootFolderInModel:metadata:](SBHIconStateArchiver, "archiveRootFolderInModel:metadata:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[SBHIconModel _saveIconState:error:](self, "_saveIconState:error:", v7, a3);

  os_activity_scope_leave(&v9);
  return (char)a3;
}

- (BOOL)_saveIconState:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  char v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  id v27;
  id v28;
  id *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  SBHIconModel *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBHIconModel autosaveTimer](self, "autosaveTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[SBHIconModel setAutosaveTimer:](self, "setAutosaveTimer:", 0);
  -[SBHIconModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v8, "canSaveIconState:", self))
  {
    v25 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_31;
    goto LABEL_29;
  }
  -[SBHIconModel store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v10 = objc_msgSend(v9, "saveCurrentIconState:error:", v6, &v32);
  v11 = v32;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = self;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "%@: current icon state saved", buf, 0xCu);
    }

    -[SBHIconModel markIconStateClean](self, "markIconStateClean");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "didSaveIconState:", self);
    v14 = 1;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBHIconModel _saveIconState:error:].cold.3();

    v14 = 0;
  }
  -[SBHIconModel todayListsStore](self, "todayListsStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    v17 = v10;
  else
    v17 = 0;
  if (v17 == 1)
  {
    v29 = a4;
    v31 = 0;
    objc_msgSend(v15, "loadCurrentIconState:", &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v31;
    v20 = v19;
    if (v18)
    {
      v28 = v19;
      +[SBHIconStateBuilder iconStateByReplacingTodayListsInIconState:withTodayListsFromIconState:](SBHIconStateBuilder, "iconStateByReplacingTodayListsInIconState:withTodayListsFromIconState:", v18, v6);
      v21 = objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v22 = objc_msgSend(v16, "saveCurrentIconState:error:", v21, &v30);
      v23 = v30;
      if ((v22 & 1) == 0)
      {
        v27 = v23;
        SBLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[SBHIconModel _saveIconState:error:].cold.2();

        v14 = 0;
        v23 = v27;
      }

      v20 = v28;
    }
    else
    {
      SBLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SBHIconModel _getLoadedIconState:error:].cold.1();
      v14 = 0;
    }

    a4 = v29;
  }

  v25 = v14 != 0;
  if (a4)
  {
LABEL_29:
    if (!v25)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_31:

  return v25;
}

- (BOOL)saveIconStateIfNeeded
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[SBHIconModel autosaveTimer](self, "autosaveTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBHIconModel setAutosaveTimer:](self, "setAutosaveTimer:", 0);
  if (-[SBHIconModel isIconStateDirty](self, "isIconStateDirty"))
    return -[SBHIconModel _saveIconStateWithError:](self, "_saveIconStateWithError:", 0);
  if (-[SBHIconModel hasAnyDirtyModelObjects](self, "hasAnyDirtyModelObjects"))
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBHIconModel saveIconStateIfNeeded].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return -[SBHIconModel _saveIconStateWithError:](self, "_saveIconStateWithError:", 0);
  }
  return 1;
}

- (void)importIconState:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  -[SBHIconModel clearDesiredIconState](self, "clearDesiredIconState");
  v8 = 0;
  v5 = -[SBHIconModel _saveIconState:error:](self, "_saveIconState:error:", v4, &v8);

  v6 = v8;
  if (v5)
  {
    -[SBHIconModel layout](self, "layout");
  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBHIconModel importIconState:].cold.1();

  }
}

- (void)importDesiredIconState:(id)a3
{
  void *v4;

  -[SBHIconModel modernizeRootArchive:](self, "modernizeRootArchive:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel setDesiredIconState:](self, "setDesiredIconState:", v4);

  if (self->_desiredIconState)
    -[SBHIconModel saveDesiredIconState](self, "saveDesiredIconState");
}

- (void)markIconStateDirty
{
  if (!-[SBHIconModel isIconStateDirty](self, "isIconStateDirty"))
  {
    -[SBHIconModel setIconStateDirty:](self, "setIconStateDirty:", 1);
    -[SBHIconModel scheduleIconStateAutosave](self, "scheduleIconStateAutosave");
  }
}

- (void)markIconStateClean
{
  id v3;

  if (-[SBHIconModel isIconStateDirty](self, "isIconStateDirty"))
  {
    -[SBHIconModel setIconStateDirty:](self, "setIconStateDirty:", 0);
    -[SBHIconModel rootFolder](self, "rootFolder");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markIconStateClean");

  }
}

- (BOOL)hasAnyDirtyModelObjects
{
  void *v2;
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[SBHIconModel rootFolder](self, "rootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isIconStateDirty") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__SBHIconModel_hasAnyDirtyModelObjects__block_invoke;
    v5[3] = &unk_1E8D858D0;
    v5[4] = &v6;
    objc_msgSend(v2, "enumerateListsWithOptions:usingBlock:", 1, v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
    _Block_object_dispose(&v6, 8);
  }

  return v3;
}

uint64_t __39__SBHIconModel_hasAnyDirtyModelObjects__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isIconStateDirty");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)disableIconStateAutosaveForReason:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSHashTable *autosaveDisableAssertions;
  SBHIconModelDisableAutosaveAssertion *v7;
  void *v8;

  v4 = a3;
  if (!self->_autosaveDisableAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    autosaveDisableAssertions = self->_autosaveDisableAssertions;
    self->_autosaveDisableAssertions = v5;

  }
  v7 = -[SBHIconModelDisableAutosaveAssertion initWithIconModel:reason:]([SBHIconModelDisableAutosaveAssertion alloc], "initWithIconModel:reason:", self, v4);
  -[NSHashTable addObject:](self->_autosaveDisableAssertions, "addObject:", v7);
  -[SBHIconModel autosaveTimer](self, "autosaveTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[SBHIconModel setAutosaveTimer:](self, "setAutosaveTimer:", 0);
  return v7;
}

- (void)_removeIconStateAutosaveDisableAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_autosaveDisableAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_autosaveDisableAssertions, "count"))
    -[SBHIconModel saveIconStateIfNeeded](self, "saveIconStateIfNeeded");
}

- (void)scheduleIconStateAutosave
{
  void *v3;
  uint64_t v4;

  -[SBHIconModel autosaveTimer](self, "autosaveTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  if (!-[NSHashTable count](self->_autosaveDisableAssertions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_autosaveTimerDidFire_, 0, 0, 5.0);
    v4 = objc_claimAutoreleasedReturnValue();
    -[SBHIconModel setAutosaveTimer:](self, "setAutosaveTimer:", v4);
    v3 = (void *)v4;
LABEL_2:

  }
}

- (id)modernizeRootArchive:(id)a3
{
  return a3;
}

+ (id)migratedIdentifierForLeafIdentifier:(id)a3
{
  return a3;
}

- (void)checkModelConsistency
{
  id v3;

  -[SBHIconModel rootFolder](self, "rootFolder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel checkModelConsistencyInRootFolder:listGridCellInfoOptions:](self, "checkModelConsistencyInRootFolder:listGridCellInfoOptions:", v3, 0);

}

- (void)checkModelConsistencyWithListGridCellInfoOptions:(unint64_t)a3
{
  id v5;

  -[SBHIconModel rootFolder](self, "rootFolder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel checkModelConsistencyInRootFolder:listGridCellInfoOptions:](self, "checkModelConsistencyInRootFolder:listGridCellInfoOptions:", v5, a3);

}

- (void)checkModelConsistencyInRootFolder:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  os_activity_scope_state_s state;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = _os_activity_create(&dword_1CFEF3000, "checkModelConsistencyInRootFolder", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  -[SBHIconModel setCheckingModelConsistency:](self, "setCheckingModelConsistency:", 1);
  if (-[SBHIconModel ignoresIconsNotInIconState](self, "ignoresIconsNotInIconState"))
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  else
    -[SBHIconModel leafIcons](self, "leafIcons");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v24, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leafIcons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minusSet:", v8);

  objc_msgSend(v26, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_localizedCompareDisplayNames_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (-[SBHIconModel isIconVisible:](self, "isIconVisible:", v15))
          -[SBHIconModel addIcon:toDesignatedLocationInRootFolder:options:listGridCellInfoOptions:](self, "addIcon:toDesignatedLocationInRootFolder:options:listGridCellInfoOptions:", v15, v6, 0, a4);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v12);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "folderIcons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v16);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v6, "indexPathForIcon:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "folderContainingIndexPath:relativeIndexPath:", v21, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (v22 != v6)
          v23 = (id)objc_msgSend(v6, "addIcon:", v20);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v17);
  }

  if (-[SBHIconModel sortsIconsAlphabetically](self, "sortsIconsAlphabetically"))
    objc_msgSend(v6, "sort");
  -[SBHIconModel setCheckingModelConsistency:](self, "setCheckingModelConsistency:", 0);

  os_activity_scope_leave(&state);
}

- (void)_rootFolder:(id)a3 moveIconsToFirstPage:(id)a4 placeBumpedIconsSomewhereNice:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v11 = _os_activity_create(&dword_1CFEF3000, "_rootFolder:moveIconsToFirstPage:placeBumpedIconsSomewhereNice:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = 0;
    objc_msgSend(v8, "firstList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __79__SBHIconModel__rootFolder_moveIconsToFirstPage_placeBumpedIconsSomewhereNice___block_invoke;
    v21 = &unk_1E8D858F8;
    v13 = v12;
    v22 = v13;
    v23 = v8;
    v25 = &v26;
    v14 = (unint64_t)v10;
    v24 = (id)v14;
    objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, &v18);
    v15 = v27[5];
    if (v14 | v15)
    {
      if (v15)
        v16 = v27[5];
      else
        v16 = v14;
      v17 = -[SBFolder addIcons:](self->_rootFolder, "addIcons:", v16, v18, v19, v20, v21, v22, v23);
    }

    _Block_object_dispose(&v26, 8);
  }
  os_activity_scope_leave(&state);

}

void __79__SBHIconModel__rootFolder_moveIconsToFirstPage_placeBumpedIconsSomewhereNice___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "numberOfIcons");
  v6 = objc_msgSend(*(id *)(a1 + 32), "isFull");
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", v5 - v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  v20 = v8;
  objc_msgSend(v9, "insertIcon:atIndexPath:options:", v4, &v20, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v20;
  if (v10)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v12)
    {
      v13 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v12)
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObjects:atIndexes:", v10, v19);

  }
}

- (void)setVisibilityOfIconsWithVisibleTags:(id)a3 hiddenTags:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSSet *v14;
  NSSet *visibleIconTags;
  NSSet *v16;
  NSSet *hiddenIconTags;
  NSObject *v18;
  NSSet *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(id *, void *, uint64_t);
  void *v31;
  id v32;
  SBHIconModel *v33;
  id v34;
  id v35;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSSet *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_1CFEF3000, "setVisibilityOfIconsWithVisibleTags:hiddenTags:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  v9 = objc_msgSend(v7, "count");
  if (v9 != -[NSSet count](self->_hiddenIconTags, "count")
    || (v10 = objc_msgSend(v6, "count"), v10 != -[NSSet count](self->_visibleIconTags, "count"))
    || !objc_msgSend(v7, "isEqualToSet:", self->_hiddenIconTags)
    || !objc_msgSend(v6, "isEqualToSet:", self->_visibleIconTags)
    || !self->_tagsHaveBeenSet)
  {
    -[SBHIconModel visibleIconIdentifiers](self, "visibleIconIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = (NSSet *)objc_msgSend(v6, "copy");
    visibleIconTags = self->_visibleIconTags;
    self->_visibleIconTags = v14;

    v16 = (NSSet *)objc_msgSend(v7, "copy");
    hiddenIconTags = self->_hiddenIconTags;
    self->_hiddenIconTags = v16;

    SBLogIcon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_hiddenIconTags;
      *(_DWORD *)buf = 138543362;
      v38 = v19;
      _os_log_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEFAULT, "Hidden Icon Tags: %{public}@", buf, 0xCu);
    }

    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __63__SBHIconModel_setVisibilityOfIconsWithVisibleTags_hiddenTags___block_invoke;
    v31 = &unk_1E8D85920;
    v20 = v11;
    v32 = v20;
    v33 = self;
    v21 = v13;
    v34 = v21;
    v22 = v12;
    v35 = v22;
    -[SBHIconModel enumerateLeafIconsUsingBlock:](self, "enumerateLeafIconsUsingBlock:", &v28);
    -[SBHIconModel adjustIconsToShow:iconsToHide:afterChangeToVisibleIconTags:hiddenIconTags:](self, "adjustIconsToShow:iconsToHide:afterChangeToVisibleIconTags:hiddenIconTags:", v22, v21, self->_visibleIconTags, self->_hiddenIconTags, v28, v29, v30, v31);
    v23 = objc_msgSend(v22, "count");
    v24 = objc_msgSend(v21, "count");
    if (v23 | v24 || !self->_tagsHaveBeenSet)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v26 = v25;
      if (v23)
        objc_msgSend(v25, "setObject:forKey:", v22, CFSTR("SBIconModelIconsToShowKey"));
      if (v24)
        objc_msgSend(v26, "setObject:forKey:", v21, CFSTR("SBIconModelIconsToHideKey"));
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("SBIconModelVisibilityDidChangeNotification"), self, v26);

      self->_tagsHaveBeenSet = 1;
    }

  }
  os_activity_scope_leave(&state);

}

void __63__SBHIconModel_setVisibilityOfIconsWithVisibleTags_hiddenTags___block_invoke(id *a1, void *a2, uint64_t a3)
{
  int v5;
  id *v6;
  id v7;

  v7 = a2;
  LODWORD(a3) = objc_msgSend(a1[4], "containsObject:", a3);
  v5 = objc_msgSend(a1[5], "isIconVisible:", v7);
  if ((_DWORD)a3)
  {
    if ((v5 & 1) == 0)
    {
      v6 = a1 + 6;
LABEL_6:
      objc_msgSend(*v6, "addObject:", v7);
    }
  }
  else if (v5)
  {
    v6 = a1 + 7;
    goto LABEL_6;
  }

}

- (NSSet)visibleIconIdentifiers
{
  void *v3;
  id v4;
  void *v5;
  NSSet *v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SBHIconModel_visibleIconIdentifiers__block_invoke;
  v8[3] = &unk_1E8D85948;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[SBHIconModel enumerateLeafIconsUsingBlock:](self, "enumerateLeafIconsUsingBlock:", v8);
  v5 = v9;
  v6 = (NSSet *)v4;

  return v6;
}

void __38__SBHIconModel_visibleIconIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:", a2))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)setStore:(id)a3
{
  SBIconModelStore *v5;
  SBIconModelStore *v6;

  v5 = (SBIconModelStore *)a3;
  if (self->_store != v5)
  {
    v6 = v5;
    -[SBHIconModel saveIconStateIfNeeded](self, "saveIconStateIfNeeded");
    objc_storeStrong((id *)&self->_store, a3);
    -[SBHIconModel setDesiredIconState:](self, "setDesiredIconState:", 0);
    -[SBHIconModel setDesiredIconStateFlattened:](self, "setDesiredIconStateFlattened:", 0);
    -[SBHIconModel layout](self, "layout");
    v5 = v6;
  }

}

- (void)setTodayListsStore:(id)a3
{
  SBIconModelStore *v5;

  v5 = (SBIconModelStore *)a3;
  if (self->_todayListsStore != v5)
  {
    objc_storeStrong((id *)&self->_todayListsStore, a3);
    if (self->_rootFolder)
      -[SBHIconModel layout](self, "layout");
  }

}

- (void)layout
{
  NSObject *v3;
  NSDictionary *desiredIconState;
  void *v5;
  void *v6;
  SBRootFolder **p_rootFolder;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  SBRootFolder *rootFolder;
  SBRootFolder *v15;
  SBRootFolder *v16;
  SBFolderIcon *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  uint64_t v39;
  os_activity_scope_state_s state;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1CFEF3000, "layout icon model", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  -[SBHIconModel saveIconStateIfNeeded](self, "saveIconStateIfNeeded");
  -[SBHIconModel setLayingOut:](self, "setLayingOut:", 1);
  desiredIconState = self->_desiredIconState;
  -[SBHIconModel willLayout](self, "willLayout");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SBIconModelWillLayoutIconStateNotification"), self, 0);

  context = (void *)MEMORY[0x1D17DF4E4]();
  v39 = 0;
  -[SBHIconModel _unarchiveRootFolderWithLayoutStatus:](self, "_unarchiveRootFolderWithLayoutStatus:", &v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    p_rootFolder = &self->_rootFolder;
    -[SBRootFolder setModel:](self->_rootFolder, "setModel:", 0);
    -[SBFolder removeFolderObserver:](self->_rootFolder, "removeFolderObserver:", self);
    v26 = (void *)-[NSMutableDictionary copy](self->_widgetIconsByIdentifier, "copy");
    v8 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __22__SBHIconModel_layout__block_invoke;
    v38[3] = &unk_1E8D85970;
    v38[4] = self;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v38);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = (void *)-[NSMutableSet copy](self->_additionalApplicationIconIdentifiers, "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v9);
          -[SBHIconModel leafIconForIdentifier:](self, "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHIconModel removeIcon:shouldRemoveFromRootFolder:](self, "removeIcon:shouldRemoveFromRootFolder:", v13, 0);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_rootFolder, v6);
    -[SBRootFolder setModel:](self->_rootFolder, "setModel:", self);
    -[SBRootFolder checkIgnoredListConsistency](*p_rootFolder, "checkIgnoredListConsistency");
    -[SBFolder markIconStateClean](*p_rootFolder, "markIconStateClean");
    rootFolder = self->_rootFolder;
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __22__SBHIconModel_layout__block_invoke_2;
    v33[3] = &unk_1E8D85658;
    v33[4] = self;
    -[SBFolder enumerateAllIconsUsingBlock:](rootFolder, "enumerateAllIconsUsingBlock:", v33);
    -[SBFolder addFolderObserver:](self->_rootFolder, "addFolderObserver:", self);
    v15 = self->_rootFolder;
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __22__SBHIconModel_layout__block_invoke_3;
    v32[3] = &unk_1E8D85658;
    v32[4] = self;
    -[SBFolder enumerateAllIconsWithOptions:usingBlock:](v15, "enumerateAllIconsWithOptions:usingBlock:", 1, v32);
    -[SBHIconModel _addHiddenAppsToIgnoredListForRootFolder:](self, "_addHiddenAppsToIgnoredListForRootFolder:", v6);
    -[SBHIconModel checkModelConsistencyInRootFolder:listGridCellInfoOptions:](self, "checkModelConsistencyInRootFolder:listGridCellInfoOptions:", self->_rootFolder, 0);
    if (-[SBFolder isIconStateDirty](*p_rootFolder, "isIconStateDirty"))
      -[SBHIconModel markIconStateDirty](self, "markIconStateDirty");
    else
      -[SBHIconModel markIconStateClean](self, "markIconStateClean");
    v16 = *p_rootFolder;
    if (*p_rootFolder)
      v17 = -[SBFolderIcon initWithFolder:]([SBFolderIcon alloc], "initWithFolder:", *p_rootFolder);
    else
      v17 = 0;
    -[SBHIconModel setRootFolderIcon:](self, "setRootFolderIcon:", v17);
    if (v16)

    if (desiredIconState)
      -[SBHIconModel _saveIconStateWithError:](self, "_saveIconStateWithError:", 0);
    else
      -[SBHIconModel saveIconStateIfNeeded](self, "saveIconStateIfNeeded");
    if (-[SBHIconModel ignoresIconsNotInIconState](self, "ignoresIconsNotInIconState"))
    {
      -[SBFolder leafIcons](*p_rootFolder, "leafIcons");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "leafIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v24);

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        }
        while (v21);
      }

      -[SBHIconModel setArchivedLeafIdentifiers:](self, "setArchivedLeafIdentifiers:", v19);
    }

  }
  -[SBHIconModel setLastLayoutStatus:](self, "setLastLayoutStatus:", v39);

  objc_autoreleasePoolPop(context);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "postNotificationName:object:userInfo:", CFSTR("SBIconModelDidLayoutIconStateNotification"), self, 0);

  -[SBHIconModel clearDesiredIconStateIfPossible](self, "clearDesiredIconStateIfPossible");
  if (!desiredIconState && self->_desiredIconState)
    -[SBHIconModel saveDesiredIconState](self, "saveDesiredIconState");
  -[SBHIconModel setLayingOut:](self, "setLayingOut:", 0);
  os_activity_scope_leave(&state);
}

uint64_t __22__SBHIconModel_layout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIcon:shouldRemoveFromRootFolder:", a3, 0);
}

void __22__SBHIconModel_layout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isWidgetIcon") & 1) != 0
    || objc_msgSend(v3, "isApplicationIcon")
    && (objc_msgSend(v3, "leafIdentifierAndApplicationBundleIDMatches") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIcon:", v3);
  }

}

void __22__SBHIconModel_layout__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isFolderIcon") & 1) != 0 || objc_msgSend(v3, "isWidgetIcon"))
    objc_msgSend(*(id *)(a1 + 32), "addIcon:", v3);

}

- (void)layoutIfNeeded
{
  void *v3;

  -[SBHIconModel rootFolder](self, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[SBHIconModel layout](self, "layout");
}

- (id)iconModelMetadata
{
  return 0;
}

- (id)makeFolderWithDisplayName:(id)a3
{
  return -[SBHIconModel makeFolderWithDisplayName:uniqueIdentifier:](self, "makeFolderWithDisplayName:uniqueIdentifier:", a3, 0);
}

- (id)makeFolderWithDisplayName:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  SBHIconGridSize v10;
  void *v11;
  SBFolder *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = -[SBHIconModel maxListCountForFolders](self, "maxListCountForFolders");
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (SBHIconGridSize)-[SBHIconModel listGridSizeForFolderClass:](self, "listGridSizeForFolderClass:", v9);

  -[SBHIconModel gridSizeClassSizes](self, "gridSizeClassSizes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBFolder initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:]([SBFolder alloc], "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", v6, v7, v8, *(unsigned int *)&v10, v11);

  -[SBHIconModel allowedGridSizeClassesForFolderClass:](self, "allowedGridSizeClassesForFolderClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder setListAllowedGridSizeClasses:](v12, "setListAllowedGridSizeClasses:", v13);
  -[SBHIconModel customGridSizeClassDomain](self, "customGridSizeClassDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder setGridSizeClassDomain:](v12, "setGridSizeClassDomain:", v14);

  return v12;
}

- (id)localizedFolderNameForDefaultDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[SBHIconModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "iconModel:localizedFolderNameForDefaultDisplayName:", self, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (NSString)localizedDefaultFolderName
{
  void *v3;
  void *v4;

  -[SBHIconModel unlocalizedDefaultFolderName](self, "unlocalizedDefaultFolderName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel localizedFolderNameForDefaultDisplayName:](self, "localizedFolderNameForDefaultDisplayName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)unlocalizedDefaultFolderName
{
  return (NSString *)CFSTR("Folder");
}

- (void)localeChanged
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[SBHIconModel leafIcons](self, "leafIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  -[SBHIconModel rootFolder](self, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allIcons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "localeChanged", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)addApplicationPlaceholder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_activity_scope_state_s state;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1CFEF3000, "addApplicationPlaceholder", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel applicationIconsForBundleIdentifier:](self, "applicationIconsForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(-[SBHIconModel iconClassForApplicationWithBundleIdentifier:](self, "iconClassForApplicationWithBundleIdentifier:", v6)), "initWithLeafIdentifier:applicationBundleID:", v6, v6);
    -[SBHIconModel addIcon:](self, "addIcon:", v8);
    v22[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "addIconDataSource:", v4, (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(v10, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v14;
}

- (id)removeApplicationPlaceholder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  os_activity_scope_state_s state;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1CFEF3000, "removeApplicationPlaceholder", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel applicationIconsForBundleIdentifier:](self, "applicationIconsForBundleIdentifier:", v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "removeIconDataSource:", v4, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v7, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v11;
}

- (void)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  SBHIconModel *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBHIconModel delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIcon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138413058;
    v14 = self;
    v15 = 2114;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "SBHModel %@ launchFromLocation:%{public}@ context:%@ delegate:%@", (uint8_t *)&v13, 0x2Au);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "iconModel:launchIcon:fromLocation:context:", self, v8, v9, v10);

}

- (void)iconWantsUninstall:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  -[SBHIconModel applicationDataSource](self, "applicationDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isApplicationIcon");

  if (v6 && v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "uninstallApplicationWithBundleIdentifier:completion:", v5, 0);

}

- (void)folder:(id)a3 willAddIcon:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_activity_scope_state_s v9;

  v6 = a3;
  v7 = a4;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  v8 = _os_activity_create(&dword_1CFEF3000, "folder will add icon", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v9);

  if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v7, v9.opaque[0], v9.opaque[1]))
    -[SBHIconModel addIcon:](self, "addIcon:", v7);
  os_activity_scope_leave(&v9);

}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  os_activity_scope_state_s state;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v11 = _os_activity_create(&dword_1CFEF3000, "folder didAddIcons:removedIcons:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v16, (_QWORD)v17))
          -[SBHIconModel addIcon:](self, "addIcon:", v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v13);
  }

  -[SBHIconModel _noteRemovedIcons:](self, "_noteRemovedIcons:", v10);
  os_activity_scope_leave(&state);

}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  os_activity_scope_state_s v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  v11 = _os_activity_create(&dword_1CFEF3000, "folder didReplaceIcon:withIcon:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v13);

  if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v10, v13.opaque[0], v13.opaque[1]))
    -[SBHIconModel addIcon:](self, "addIcon:", v10);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel _noteRemovedIcons:](self, "_noteRemovedIcons:", v12);

  }
  os_activity_scope_leave(&v13);

}

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!-[SBHIconModel isTrackingIcon:](self, "isTrackingIcon:", v10))
          -[SBHIconModel addIcon:](self, "addIcon:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)-[SBHIconModel listGridSizeForFolderClass:](self, "listGridSizeForFolderClass:", a4);
}

- (SBHIconGridSize)iconStateUnarchiver:(id)a3 listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a4
{
  return (SBHIconGridSize)-[SBHIconModel listWithNonDefaultSizedIconsGridSizeForFolderClass:](self, "listWithNonDefaultSizedIconsGridSizeForFolderClass:", a4);
}

- (BOOL)iconStateUnarchiver:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4
{
  return -[SBHIconModel listsAllowRotatedLayoutForFolderClass:](self, "listsAllowRotatedLayoutForFolderClass:", a4);
}

- (id)iconStateUnarchiver:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  return -[SBHIconModel allowedGridSizeClassesForFolderClass:](self, "allowedGridSizeClassesForFolderClass:", a4);
}

- (id)iconStateUnarchiver:(id)a3 didUnarchiveWidgetIcon:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(v5, "leafIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel widgetIconForLeafIdentifier:](self, "widgetIconForLeafIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v5, "matchesWidgetIcon:", v7) & 1) == 0)
  {

    v7 = 0;
  }

  return v7;
}

- (id)iconStateUnarchiver:(id)a3 supportedGridSizeClassesForWidgetWithKind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6
{
  return -[SBHIconModel supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:](self, "supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:", a4, a5, a6);
}

- (int64_t)iconStateUnarchiver:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4
{
  return -[SBHIconModel listsFixedIconLocationBehaviorForFolderClass:](self, "listsFixedIconLocationBehaviorForFolderClass:", a4);
}

- (unint64_t)iconStateUnarchiver:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4
{
  return -[SBHIconModel listsIconLayoutBehaviorForFolderClass:](self, "listsIconLayoutBehaviorForFolderClass:", a4);
}

- (id)iconStateUnarchiver:(id)a3 iconForRepresentation:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHIconModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconModel:iconForArchiveRepresentation:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)iconStateUnarchiver:(id)a3 iconDataSourceForRepresentation:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHIconModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconModel:iconDataSourceForArchiveRepresentation:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)archiver:(id)a3 representationForIcon:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHIconModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconModel:archiveRepresentationForIcon:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)archiver:(id)a3 representationForIconDataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHIconModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconModel:archiveRepresentationForIconDataSource:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)versionForIconStateArchiver:(id)a3
{
  void *v4;
  void *v5;

  -[SBHIconModel delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "archiveVersionForIconModel:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)iconModelApplicationDataSource:(id)a3 applicationsUpdated:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SBHIconModel addApplication:](self, "addApplication:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)iconModelApplicationDataSource:(id)a3 applicationsRemoved:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[SBHIconModel removeApplication:](self, "removeApplication:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && !objc_msgSend(v10, "iconDataSourceCount"))
          -[SBHIconModel removeIcon:](self, "removeIcon:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)iconModelApplicationDataSource:(id)a3 applicationPlaceholdersAdded:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SBHIconModel addApplicationPlaceholder:](self, "addApplicationPlaceholder:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)iconModelApplicationDataSource:(id)a3 applicationPlaceholdersRemoved:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = -[SBHIconModel removeApplicationPlaceholder:](self, "removeApplicationPlaceholder:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)installedWebClipsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[SBHIconModel automaticallyAddsWebClips](self, "automaticallyAddsWebClips"))
  {
    objc_msgSend((id)objc_opt_class(), "allWebClips");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel iconsOfClass:](self, "iconsOfClass:", objc_msgSend((id)objc_opt_class(), "bookmarkIconClass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "identifier", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHIconModel bookmarkIconForWebClipIdentifier:](self, "bookmarkIconForWebClipIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "removeObject:", v13);
          else
            v14 = -[SBHIconModel addBookmarkIconForWebClip:](self, "addBookmarkIconForWebClip:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconModel removeIcons:](self, "removeIcons:", v15);

  }
}

- (NSString)description
{
  return (NSString *)-[SBHIconModel descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIconModel descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  -[SBHIconModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("store"));

  -[SBHIconModel applicationDataSource](self, "applicationDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendPointer:withName:", v7, CFSTR("applicationDataSource"));

  -[SBHIconModel rootFolder](self, "rootFolder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("rootFolder"));

  v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel hasDesiredIconState](self, "hasDesiredIconState"), CFSTR("hasDesiredIconState"), 1);
  v12 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel ignoresIconsNotInIconState](self, "ignoresIconsNotInIconState"), CFSTR("ignoresIconsNotInIconState"), 1);
  v13 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel sortsIconsAlphabetically](self, "sortsIconsAlphabetically"), CFSTR("sortsIconsAlphabetically"), 1);
  v14 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel automaticallyAddsApplications](self, "automaticallyAddsApplications"), CFSTR("automaticallyAddsApplications"), 0);
  v15 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBHIconModel automaticallyAddsWebClips](self, "automaticallyAddsWebClips"), CFSTR("automaticallyAddsWebClips"), 0);
  return v4;
}

- (SBIconModelStore)store
{
  return self->_store;
}

- (SBHIconModelApplicationDataSource)applicationDataSource
{
  return self->_applicationDataSource;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)visibleIconTags
{
  return self->_visibleIconTags;
}

- (BOOL)automaticallyAddsApplications
{
  return self->_automaticallyAddsApplications;
}

- (void)setAutomaticallyAddsApplications:(BOOL)a3
{
  self->_automaticallyAddsApplications = a3;
}

- (BOOL)automaticallyAddsWebClips
{
  return self->_automaticallyAddsWebClips;
}

- (void)setAutomaticallyAddsWebClips:(BOOL)a3
{
  self->_automaticallyAddsWebClips = a3;
}

- (BOOL)ignoresIconsNotInIconState
{
  return self->_ignoresIconsNotInIconState;
}

- (void)setIgnoresIconsNotInIconState:(BOOL)a3
{
  self->_ignoresIconsNotInIconState = a3;
}

- (BOOL)sortsIconsAlphabetically
{
  return self->_sortsIconsAlphabetically;
}

- (void)setSortsIconsAlphabetically:(BOOL)a3
{
  self->_sortsIconsAlphabetically = a3;
}

- (NSDictionary)desiredIconState
{
  return self->_desiredIconState;
}

- (void)setDesiredIconState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isIconStateDirty
{
  return self->_iconStateDirty;
}

- (void)setIconStateDirty:(BOOL)a3
{
  self->_iconStateDirty = a3;
}

- (BOOL)isLayingOut
{
  return self->_layingOut;
}

- (void)setLayingOut:(BOOL)a3
{
  self->_layingOut = a3;
}

- (int64_t)lastLayoutStatus
{
  return self->_lastLayoutStatus;
}

- (void)setLastLayoutStatus:(int64_t)a3
{
  self->_lastLayoutStatus = a3;
}

- (BOOL)isRestoring
{
  return self->_restoring;
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

- (BOOL)automaticallyAddsApplicationPlaceholders
{
  return self->_automaticallyAddsApplicationPlaceholders;
}

- (void)setAutomaticallyAddsApplicationPlaceholders:(BOOL)a3
{
  self->_automaticallyAddsApplicationPlaceholders = a3;
}

- (SBIconModelStore)todayListsStore
{
  return self->_todayListsStore;
}

- (void)setPostsDidAddIconNotification:(BOOL)a3
{
  self->_postsDidAddIconNotification = a3;
}

- (NSSet)archivedLeafIdentifiers
{
  return self->_archivedLeafIdentifiers;
}

- (void)setArchivedLeafIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSOrderedSet)desiredIconStateFlattened
{
  return self->_desiredIconStateFlattened;
}

- (void)setDesiredIconStateFlattened:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (SBRootFolder)cachedDesiredRootFolder
{
  return self->_cachedDesiredRootFolder;
}

- (void)setCachedDesiredRootFolder:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDesiredRootFolder, a3);
}

- (SBRootFolder)cachedDefaultRootFolder
{
  return self->_cachedDefaultRootFolder;
}

- (void)setCachedDefaultRootFolder:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDefaultRootFolder, a3);
}

- (BOOL)isCheckingModelConsistency
{
  return self->_checkingModelConsistency;
}

- (void)setCheckingModelConsistency:(BOOL)a3
{
  self->_checkingModelConsistency = a3;
}

- (SBIcon)rootFolderIcon
{
  return self->_rootFolderIcon;
}

- (void)setRootFolderIcon:(id)a3
{
  objc_storeStrong((id *)&self->_rootFolderIcon, a3);
}

- (NSTimer)autosaveTimer
{
  return self->_autosaveTimer;
}

- (void)setAutosaveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autosaveTimer, a3);
}

- (SBSHomeScreenService)homeScreenService
{
  return self->_homeScreenService;
}

- (BSInvalidatable)installedWebClipsObservation
{
  return self->_installedWebClipsObservation;
}

- (void)setInstalledWebClipsObservation:(id)a3
{
  objc_storeStrong((id *)&self->_installedWebClipsObservation, a3);
}

- (SBHIconGridSizeClassSet)rootFolderAllowedGridSizeClasses
{
  return self->_rootFolderAllowedGridSizeClasses;
}

- (void)setRootFolderAllowedGridSizeClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFolderAllowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_installedWebClipsObservation, 0);
  objc_storeStrong((id *)&self->_homeScreenService, 0);
  objc_storeStrong((id *)&self->_autosaveTimer, 0);
  objc_storeStrong((id *)&self->_rootFolderIcon, 0);
  objc_storeStrong((id *)&self->_cachedDefaultRootFolder, 0);
  objc_storeStrong((id *)&self->_cachedDesiredRootFolder, 0);
  objc_storeStrong((id *)&self->_desiredIconStateFlattened, 0);
  objc_storeStrong((id *)&self->_archivedLeafIdentifiers, 0);
  objc_storeStrong((id *)&self->_todayListsStore, 0);
  objc_storeStrong((id *)&self->_desiredIconState, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationDataSource, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_visibleIconTags, 0);
  objc_storeStrong((id *)&self->_hiddenIconTags, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
  objc_storeStrong((id *)&self->_autosaveDisableAssertions, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_additionalApplicationIconIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationIconsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIconsByIdentifier, 0);
  objc_storeStrong((id *)&self->_leafIconsByIdentifier, 0);
}

- (void)setLeafIconsByIdentifier:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *leafIconsByIdentifier;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  leafIconsByIdentifier = self->_leafIconsByIdentifier;
  self->_leafIconsByIdentifier = v4;

}

- (void)setForecastedLeavesOnIconModel:(id)a3 includingMissingIcons:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  SBLeafIcon *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_leafIconsByIdentifier, 1);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:]([SBLeafIcon alloc], "initWithLeafIdentifier:applicationBundleID:", v14, v14);
          objc_msgSend(v8, "setObject:forKey:", v16, v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setLeafIconsByIdentifier:", v8);
}

void __85__SBHIconModel__adjustedIndexPathInRootFolder_withinIconState_forIconWithIdentifier___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  __int16 v2;
  uint64_t v3;
  os_log_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 48);
  v5 = 138412802;
  v6 = v1;
  OUTLINED_FUNCTION_3_0();
  v7 = v2;
  v8 = v3;
  _os_log_error_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_ERROR, "%@: missing expected folder with name '%@' for inserting icon with identifier '%@'", (uint8_t *)&v5, 0x20u);
}

- (void)_getLoadedIconState:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "%@: unable to load layout from the today lists store: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)_unarchiveRootFolderWithLayoutStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "%@: icon state was corrupt; reverting to the default platform state",
    (uint8_t *)&v2,
    0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)deleteIconStateWithOptions:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v1, v2, "%@: unable to delete current icon state: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_saveIconState:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "%@: unable to save layout to the today lists store: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)_saveIconState:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "%@: unable to save current icon state: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)saveIconStateIfNeeded
{
  OUTLINED_FUNCTION_4_0(&dword_1CFEF3000, a1, a3, "Icon model is not marked dirty but has dirty model objects", a5, a6, a7, a8, 0);
}

- (void)importIconState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "%@: error saving imported icon state: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
