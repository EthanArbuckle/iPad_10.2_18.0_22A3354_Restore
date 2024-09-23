@implementation SBFolderIcon

- (BOOL)isFolderIcon
{
  return 1;
}

- (id)badgeNumberOrString
{
  objc_super v4;

  if (self->_delayedIconUpdates || self->_updateIconRunLoopObserver)
    -[SBFolderIcon _performDelayedIconUpdates](self, "_performDelayedIconUpdates");
  v4.receiver = self;
  v4.super_class = (Class)SBFolderIcon;
  -[SBIcon badgeNumberOrString](&v4, sel_badgeNumberOrString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)iconImageViewClassForLocation:(id)a3
{
  return (Class)objc_opt_self();
}

- (id)displayNameForLocation:(id)a3
{
  return -[SBFolder displayName](self->_folder, "displayName", a3);
}

- (unint64_t)listIndexForContainedIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBFolderIcon folder](self, "folder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "indexForIcon:", v4) != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[SBFolderIcon folder](self, "folder");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lists");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v14, "indexOfObject:", v12);

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_11:

  return v8;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  return -[SBFolder indexPathsForContainedNodeIdentifier:prefixPath:](self->_folder, "indexPathsForContainedNodeIdentifier:prefixPath:", a3, a4);
}

- (void)noteContainedIconsAdded:(id)a3 removed:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[SBFolderIcon _adjustForIconsAdded:removed:](self, "_adjustForIconsAdded:removed:", v6, v8);
  v7 = objc_msgSend(v6, "count");

  if (v7 || objc_msgSend(v8, "count"))
    -[SBIcon reloadIconImage](self, "reloadIconImage");

}

- (void)_adjustForIconsAdded:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", self);
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke;
  v22[3] = &unk_1E8D85F60;
  v22[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke_2;
  v21[3] = &unk_1E8D85F60;
  v21[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);
  if (v6)
  {
    objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v16, "isApplicationIcon", (_QWORD)v17)
          && (objc_msgSend(v16, "hasApplicationPlaceholder") & 1) != 0)
        {

          -[SBFolderIcon _updateProgress](self, "_updateProgress");
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

LABEL_15:
  -[SBFolderIcon _updateBadgeValue](self, "_updateBadgeValue", (_QWORD)v17);

}

- (void)_updateBadgeValue
{
  void *v3;
  id v4;

  -[SBFolderIcon folder](self, "folder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setBadge:](self, "setBadge:", v3);

}

- (id)nodeIdentifier
{
  return -[SBFolder nodeIdentifier](self->_folder, "nodeIdentifier");
}

- (void)iconLaunchEnabledDidChange:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[SBFolderIcon folder](self, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsIcon:", v6);

  if (v5)
  {
    -[SBFolderIcon _containedIconImageChanged:](self, "_containedIconImageChanged:", v6);
    -[SBFolderIcon _containedIconLaunchEnabledDidUpdate:](self, "_containedIconLaunchEnabledDidUpdate:", v6);
  }

}

- (void)_containedIconImageChanged:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[SBFolderIcon listIndexForContainedIcon:](self, "listIndexForContainedIcon:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__SBFolderIcon__containedIconImageChanged___block_invoke;
    v5[3] = &unk_1E8D8B4A8;
    v5[4] = self;
    v6 = v4;
    -[SBIcon enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v5);

  }
}

- (void)_containedIconLaunchEnabledDidUpdate:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[SBFolderIcon listIndexForContainedIcon:](self, "listIndexForContainedIcon:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__SBFolderIcon__containedIconLaunchEnabledDidUpdate___block_invoke;
    v5[3] = &unk_1E8D8B4A8;
    v5[4] = self;
    v6 = v4;
    -[SBIcon enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v5);

  }
}

- (void)_containedIconAccessoriesDidUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  SBFolderIcon *v9;
  id v10;

  v4 = a3;
  if (-[SBFolderIcon listIndexForContainedIcon:](self, "listIndexForContainedIcon:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __51__SBFolderIcon__containedIconAccessoriesDidUpdate___block_invoke;
    v8 = &unk_1E8D8B4A8;
    v9 = self;
    v10 = v4;
    -[SBIcon enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", &v5);
    -[SBIcon _notifyAccessoriesDidUpdate](self, "_notifyAccessoriesDidUpdate", v5, v6, v7, v8, v9);

  }
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  id v4;

  v4 = a3;
  -[SBFolderIcon scheduleUpdateIconRunLoopObserver](self, "scheduleUpdateIconRunLoopObserver");
  -[SBFolderIcon _containedIconAccessoriesDidUpdate:](self, "_containedIconAccessoriesDidUpdate:", v4);

}

- (void)scheduleUpdateIconRunLoopObserver
{
  const __CFAllocator *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_updateIconRunLoopObserver && !self->_delayedIconUpdates)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__SBFolderIcon_scheduleUpdateIconRunLoopObserver__block_invoke;
    v5[3] = &unk_1E8D856A8;
    objc_copyWeak(&v6, &location);
    self->_updateIconRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 0, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_updateIconRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (int64_t)progressState
{
  if (self->_delayedIconUpdates || self->_updateIconRunLoopObserver)
    -[SBFolderIcon _performDelayedIconUpdates](self, "_performDelayedIconUpdates");
  return self->_progressState;
}

- (double)progressPercent
{
  if (self->_delayedIconUpdates || self->_updateIconRunLoopObserver)
    -[SBFolderIcon _performDelayedIconUpdates](self, "_performDelayedIconUpdates");
  return self->_progressPercent;
}

- (BOOL)isProgressPaused
{
  return 0;
}

- (SBFolderIcon)initWithFolder:(id)a3
{
  id v5;
  SBFolderIcon *v6;
  SBFolderIcon *v7;
  id *p_folder;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSHashTable *nodeObservers;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBFolderIcon;
  v6 = -[SBIcon init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    p_folder = (id *)&v6->_folder;
    objc_storeStrong((id *)&v6->_folder, a3);
    objc_msgSend(*p_folder, "addNodeObserver:", v7);
    objc_msgSend(*p_folder, "setIcon:", v7);
    objc_msgSend(*p_folder, "addFolderObserver:", v7);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*p_folder, "allIcons", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "addObserver:", v7);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    nodeObservers = v7->_nodeObservers;
    v7->_nodeObservers = (NSHashTable *)v14;

    v7->_delayedIconUpdates = 1;
  }

  return v7;
}

- (SBFolderIcon)initWithFolderIcon:(id)a3 copyFolder:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  SBFolderIcon *v8;
  SBFolderIcon *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[SBFolderIcon initWithFolder:](self, "initWithFolder:", v7);
  v9 = v8;
  if (v8)
  {
    v8->_progressState = *((_QWORD *)v5 + 9);
    v8->_progressPercent = *((double *)v5 + 10);
    if (!*((_BYTE *)v5 + 96))
    {
      objc_msgSend(v5, "badgeNumberOrString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIcon setBadge:](v9, "setBadge:", v10);

      v9->_delayedIconUpdates = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFolderIcon invalidateUpdateIconRunLoopObserver](self, "invalidateUpdateIconRunLoopObserver");
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIcon;
  -[SBFolderIcon dealloc](&v3, sel_dealloc);
}

- (id)rootFolder
{
  void *v2;
  void *v3;

  -[SBFolderIcon folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

+ (BOOL)hasIconImage
{
  return 0;
}

- (void)localeChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFolderIcon;
  -[SBIcon localeChanged](&v3, sel_localeChanged);
  -[SBFolderIcon _updateBadgeValue](self, "_updateBadgeValue");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SBFolderIcon;
  -[SBIcon description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder description](self->_folder, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Folder: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __49__SBFolderIcon_scheduleUpdateIconRunLoopObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performDelayedIconUpdates");

}

- (void)invalidateUpdateIconRunLoopObserver
{
  __CFRunLoopObserver *updateIconRunLoopObserver;

  updateIconRunLoopObserver = self->_updateIconRunLoopObserver;
  if (updateIconRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(updateIconRunLoopObserver);
    CFRelease(self->_updateIconRunLoopObserver);
    self->_updateIconRunLoopObserver = 0;
  }
}

- (void)_performDelayedIconUpdates
{
  self->_delayedIconUpdates = 0;
  -[SBFolderIcon invalidateUpdateIconRunLoopObserver](self, "invalidateUpdateIconRunLoopObserver");
  -[SBFolderIcon _updateBadgeValue](self, "_updateBadgeValue");
  -[SBFolderIcon _updateProgress](self, "_updateProgress");
}

- (void)_updateProgress
{
  SBFolderIcon *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  SBFolderIcon *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SBFolderIcon folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leafIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (!v5)
  {

    goto LABEL_24;
  }
  v6 = v5;
  v26 = v2;
  v7 = 0;
  v27 = 0;
  v28 = 0;
  v8 = *(_QWORD *)v31;
  v9 = 0.0;
  do
  {
    v10 = 0;
    v11 = sel_isFailed;
    do
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v4);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
      v13 = objc_msgSend(v12, "progressState");
      if (objc_msgSend(v12, "isApplicationIcon"))
      {
        objc_msgSend(v12, "applicationPlaceholder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "applicationPlaceholder");
          v29 = v7;
          v15 = v6;
          v16 = v8;
          v17 = v11;
          v18 = v4;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isFailed");

          v4 = v18;
          v11 = v17;
          v8 = v16;
          v6 = v15;
          v7 = v29;

          if (v20)
          {
            SBLogCommon();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "applicationPlaceholder");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v35 = "-[SBFolderIcon _updateProgress]";
              v36 = 2114;
              v37 = v22;
              _os_log_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_INFO, "%s: Assumed app with placeholder was installed: %{public}@", buf, 0x16u);

            }
            v9 = v9 + 1.0;
            v7 = v29 + 1;
            v27 = 1;
            goto LABEL_17;
          }
        }
        else
        {

        }
      }
      if (v13 == 2)
      {
        objc_msgSend(v12, "progressPercent");
        v9 = v9 + v24;
        ++v7;
        HIDWORD(v28) = 1;
      }
      else if (v13 == 1)
      {
        objc_msgSend(v12, "progressPercent");
        v9 = v9 + v23;
        ++v7;
        LODWORD(v28) = 1;
      }
LABEL_17:
      ++v10;
    }
    while (v6 != v10);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  }
  while (v6);

  v2 = v26;
  if (((HIDWORD(v28) | v28 & v27) & 1) == 0)
  {
LABEL_24:
    v2->_progressState = 0;
    v2->_progressPercent = 0.0;
    -[SBFolderIcon _updateBadgeValue](v2, "_updateBadgeValue");
    goto LABEL_25;
  }
  v26->_progressState = 2;
  v25 = v9 / (double)v7;
  if (v25 > 1.0)
    v25 = 1.0;
  v26->_progressPercent = v25;
LABEL_25:
  -[SBIcon _notifyAccessoriesDidUpdate](v2, "_notifyAccessoriesDidUpdate");
}

uint64_t __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__SBFolderIcon__adjustForIconsAdded_removed___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:", *(_QWORD *)(a1 + 32));
}

- (void)noteContainedIcon:(id)a3 replacedIcon:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v10 = a3;
  objc_msgSend(v6, "setWithObject:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFolderIcon _adjustForIconsAdded:removed:](self, "_adjustForIconsAdded:removed:", v8, v9);
  -[SBFolderIcon _containedIconImageChanged:](self, "_containedIconImageChanged:", v10);

}

void __43__SBFolderIcon__containedIconImageChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "folderIcon:containedIconImageDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __51__SBFolderIcon__containedIconAccessoriesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "folderIcon:containedIconAccessoriesDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __53__SBFolderIcon__containedIconLaunchEnabledDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "folderIcon:containedIconLaunchEnabledDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)badgeBehaviorProviderDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolderIcon _updateBadgeValue](self, "_updateBadgeValue");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBFolderIcon folder](self, "folder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "isFolderIcon"))
          objc_msgSend(v11, "badgeBehaviorProviderDidChange:", v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)leafIconsWithBadgesSortedByImportance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  -[SBFolderIcon rootFolder](self, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "effectiveBadgeBehaviorProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[SBFolderIcon folder](self, "folder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEmpty") & 1) != 0)
      {
        v6 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke;
        v16[3] = &unk_1E8D8A198;
        v17 = v4;
        v9 = v7;
        v18 = v9;
        objc_msgSend(v5, "enumerateAllIconsUsingBlock:", v16);
        if (objc_msgSend(v9, "count"))
        {
          v14[0] = v8;
          v14[1] = 3221225472;
          v14[2] = __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_3;
          v14[3] = &unk_1E8D8B4F0;
          v15 = &__block_literal_global_54;
          objc_msgSend(MEMORY[0x1E0C9AA60], "indexesOfObjectsPassingTest:", v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObjectsAtIndexes:", v10);

          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_4;
          v12[3] = &unk_1E8D8B518;
          v13 = &__block_literal_global_54;
          objc_msgSend(v9, "sortUsingComparator:", v12);

        }
        v6 = (id)objc_msgSend(v9, "copy");

      }
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (id)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

void __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "allowsBadgingForIcon:"))
  {
    if (objc_msgSend(v4, "isLeafIcon"))
    {
      objc_msgSend(v4, "badgeNumberOrString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    }
  }

}

uint64_t __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  objc_msgSend(a2, "badgeNumberOrString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "integerValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v2, "isEqualToString:", CFSTR("!")) & 1) != 0)
      {
        v3 = -1;
      }
      else
      {
        v3 = objc_msgSend(v2, "integerValue");
        if (v3 >= 1)
        {
          objc_msgSend(v2, "rangeOfString:", CFSTR("+"));
          if (v4)
            ++v3;
        }
      }
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

BOOL __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() < 1;
}

uint64_t __53__SBFolderIcon_leafIconsWithBadgesSortedByImportance__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7 >= v8)
  {
    if (v7 > v8)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "localizedStandardCompare:", v11);

    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  return 0;
}

- (BOOL)canBeAddedToSubfolder
{
  return 0;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3
{
  return a3;
}

- (id)iconAtListIndex:(unint64_t)a3 iconIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[SBFolderIcon folder](self, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  return -[SBFolder containsNodeIdentifier:](self->_folder, "containsNodeIdentifier:", a3);
}

- (id)containedNodeIdentifiers
{
  return -[SBFolder containedNodeIdentifiers](self->_folder, "containedNodeIdentifiers");
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  return -[SBFolder nodesAlongIndexPath:consumedIndexes:](self->_folder, "nodesAlongIndexPath:consumedIndexes:", a3, a4);
}

- (void)addNodeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_nodeObservers, "containsObject:"))
    -[NSHashTable addObject:](self->_nodeObservers, "addObject:", v4);

}

- (void)removeNodeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_nodeObservers, "removeObject:", a3);
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  return -[SBFolder nodeDescriptionWithPrefix:](self->_folder, "nodeDescriptionWithPrefix:", a3);
}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  id v6;
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
  v6 = a4;
  if (self->_folder == a3)
  {
    v7 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "node:didAddContainedNodeIdentifiers:", self, v6, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v6;
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
  v6 = a4;
  if (self->_folder == a3)
  {
    v7 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "node:didRemoveContainedNodeIdentifiers:", self, v6, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_folder == a3)
  {
    v4 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "nodeDidMoveContainedNodes:", self, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  if (!objc_msgSend(a3, "indexOfList:", a4))
    -[SBIcon reloadIconImage](self, "reloadIconImage");
}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  if (objc_msgSend(a5, "containsIndex:", 0, a4))
    -[SBIcon reloadIconImage](self, "reloadIconImage");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFolder:", self->_folder);
  objc_msgSend(v4, "_setPropertiesFromIcon:", self);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_nodeObservers, 0);
}

@end
