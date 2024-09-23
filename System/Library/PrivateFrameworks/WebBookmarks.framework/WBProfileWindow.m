@implementation WBProfileWindow

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (WBTabGroup)unnamedTabGroupForActiveProfile
{
  if (-[WBProfileWindow isInDefaultProfile](self, "isInDefaultProfile"))
    -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
  else
    -[WBProfileWindow existingUnnamedTabGroupForProfileWithIdentifier:](self, "existingUnnamedTabGroupForProfileWithIdentifier:", self->_activeProfileIdentifier);
  return (WBTabGroup *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isInDefaultProfile
{
  NSString *activeProfileIdentifier;
  void *v3;
  void *v4;

  activeProfileIdentifier = self->_activeProfileIdentifier;
  -[WBTabGroupManager defaultProfile](self->_tabGroupManager, "defaultProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activeProfileIdentifier) = -[NSString isEqual:](activeProfileIdentifier, "isEqual:", v4);

  return (char)activeProfileIdentifier;
}

- (void)setCanSwitchProfiles:(BOOL)a3
{
  self->_canSwitchProfiles = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBProfileWindow)initWithWindowState:(id)a3 tabGroupManager:(id)a4 preferredProfileIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBProfileWindow *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *activeProfileIdentifier;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *activeTabGroupUUID;
  uint64_t v23;
  NSString *v24;
  WBProfileWindow *v25;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)WBProfileWindow;
  v12 = -[WBProfileWindow init](&v27, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "activeProfileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      activeProfileIdentifier = v12->_activeProfileIdentifier;
      v12->_activeProfileIdentifier = v15;
    }
    else
    {
      objc_msgSend(v10, "defaultProfile");
      activeProfileIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(activeProfileIdentifier, "identifier");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v12->_activeProfileIdentifier;
      v12->_activeProfileIdentifier = (NSString *)v17;

    }
    objc_storeStrong((id *)&v12->_tabGroupManager, a4);
    objc_storeStrong((id *)&v12->_windowState, a3);
    -[WBProfileWindow _attachLocalGroupToDefaultProfileIfNeeded](v12, "_attachLocalGroupToDefaultProfileIfNeeded");
    -[WBProfileWindow _attachUnnamedTabGroupToProfileWithIdentifier:](v12, "_attachUnnamedTabGroupToProfileWithIdentifier:", v11);
    -[WBTabGroupManager addTabGroupObserver:](v12->_tabGroupManager, "addTabGroupObserver:", v12);
    -[WBProfileWindow _selectPreferredProfileIfNeeded:](v12, "_selectPreferredProfileIfNeeded:", v11);
    objc_msgSend(v9, "activeTabGroupUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      activeTabGroupUUID = v12->_activeTabGroupUUID;
      v12->_activeTabGroupUUID = v21;
    }
    else
    {
      -[WBProfileWindow existingUnnamedTabGroupForProfileWithIdentifier:](v12, "existingUnnamedTabGroupForProfileWithIdentifier:", v11);
      activeTabGroupUUID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(activeTabGroupUUID, "uuid");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v12->_activeTabGroupUUID;
      v12->_activeTabGroupUUID = (NSString *)v23;

    }
    v25 = v12;
  }

  return v12;
}

- (void)_selectPreferredProfileIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *activeProfileIdentifier;
  void *v9;
  void *v10;
  WBTabGroupManager *tabGroupManager;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (v4)
  {
    v17 = v4;
    -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WBProfileWindow _findOrCreateUnnamedTabGroupForProfile:](self, "_findOrCreateUnnamedTabGroupForProfile:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (NSString *)objc_msgSend(v17, "copy");
        activeProfileIdentifier = self->_activeProfileIdentifier;
        self->_activeProfileIdentifier = v7;

        v9 = (void *)objc_msgSend(v17, "copy");
        -[WBWindowState setActiveProfileIdentifier:](self->_windowState, "setActiveProfileIdentifier:", v9);

        -[WBWindowState activeTabGroupUUID](self->_windowState, "activeTabGroupUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          tabGroupManager = self->_tabGroupManager;
          -[WBWindowState activeTabGroupUUID](self->_windowState, "activeTabGroupUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBTabGroupManager tabGroupWithUUID:](tabGroupManager, "tabGroupWithUUID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = 0;
        }

        objc_msgSend(v13, "profileIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v17);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v6, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBWindowState setActiveTabGroupUUID:](self->_windowState, "setActiveTabGroupUUID:", v16);

        }
      }

    }
    v4 = v17;
  }

}

- (void)_attachUnnamedTabGroupToProfileWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "kind"))
    {
      -[WBProfileWindow _findOrCreateUnnamedTabGroupForProfile:](self, "_findOrCreateUnnamedTabGroupForProfile:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v7 = WBS_LOG_CHANNEL_PREFIXProfiles();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[WBProfileWindow _attachUnnamedTabGroupToProfileWithIdentifier:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
      }

    }
  }
}

- (void)_attachLocalGroupToDefaultProfileIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  WBTabGroupManager *tabGroupManager;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[3];
  char v11;

  v3 = (void *)*MEMORY[0x24BE82E70];
  -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v3 & 1) == 0)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    tabGroupManager = self->_tabGroupManager;
    -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__WBProfileWindow__attachLocalGroupToDefaultProfileIfNeeded__block_invoke;
    v9[3] = &unk_24CB31518;
    v9[4] = v10;
    -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", v8, 1, v9);

    _Block_object_dispose(v10, 8);
  }
}

- (void)setUnnamedTabGroupDisplayTitleProvider:(id)a3
{
  void *v4;
  id unnamedTabGroupDisplayTitleProvider;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "copy");
  unnamedTabGroupDisplayTitleProvider = self->_unnamedTabGroupDisplayTitleProvider;
  self->_unnamedTabGroupDisplayTitleProvider = v4;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WBWindowState unnamedTabGroupUUIDs](self->_windowState, "unnamedTabGroupUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](self->_tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", v10, 3221225472, __58__WBProfileWindow_setUnnamedTabGroupDisplayTitleProvider___block_invoke, &unk_24CB31488, self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (WBProfileWindow)initWithWindowState:(id)a3 tabGroupManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WBProfileWindow *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "activeProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WBProfileWindow initWithWindowState:tabGroupManager:preferredProfileIdentifier:](self, "initWithWindowState:tabGroupManager:preferredProfileIdentifier:", v7, v6, v8);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[WBTabGroupManager removeTabGroupObserver:](self->_tabGroupManager, "removeTabGroupObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WBProfileWindow;
  -[WBProfileWindow dealloc](&v3, sel_dealloc);
}

- (void)setActiveProfileIdentifier:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *activeProfileIdentifier;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  WBProfileWindow *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = -[NSString isEqual:](self->_activeProfileIdentifier, "isEqual:", v16);
  v5 = v16;
  if ((v4 & 1) == 0)
  {
    -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[WBProfileWindow _findOrCreateUnnamedTabGroupForProfile:](self, "_findOrCreateUnnamedTabGroupForProfile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (NSString *)objc_msgSend(v16, "copy");
        activeProfileIdentifier = self->_activeProfileIdentifier;
        self->_activeProfileIdentifier = v8;

        -[WBProfileWindow _lastActiveTabGroupForProfile:](self, "_lastActiveTabGroupForProfile:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && (objc_msgSend(v10, "isPrivateBrowsing") & 1) == 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v13 = WeakRetained;
          v14 = self;
          v15 = v11;
        }
        else
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v13 = WeakRetained;
          v14 = self;
          v15 = v7;
        }
        objc_msgSend(WeakRetained, "profileWindow:selectTabGroup:", v14, v15);

      }
    }

    v5 = v16;
  }

}

- (void)setActiveTabGroupUUID:(id)a3
{
  NSString *v4;
  NSString *activeTabGroupUUID;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[NSString isEqual:](self->_activeTabGroupUUID, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v4;

    -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPrivateBrowsing") & 1) == 0)
    {
      objc_msgSend(v6, "profileIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBWindowState setActiveProfileIdentifier:](self->_windowState, "setActiveProfileIdentifier:", v7);

    }
    -[WBWindowState setActiveTabGroupUUID:forProfileWithIdentifier:](self->_windowState, "setActiveTabGroupUUID:forProfileWithIdentifier:", v9, self->_activeProfileIdentifier);
    -[WBTabGroupManager tabCollection](self->_tabGroupManager, "tabCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveWindowState:completionHandler:", self->_windowState, 0);

  }
}

- (void)willClose
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WBTabGroupManager removeTabGroupObserver:](self->_tabGroupManager, "removeTabGroupObserver:", self);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[WBWindowState unnamedTabGroupUUIDs](self->_windowState, "unnamedTabGroupUUIDs", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          -[WBTabGroupManager removeTabGroup:](self->_tabGroupManager, "removeTabGroup:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __58__WBProfileWindow_setUnnamedTabGroupDisplayTitleProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_displayTitleProviderForTabGroupWithUUID:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayTitleProvider:", v5);

}

- (id)existingUnnamedTabGroupForProfileWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WBTabGroupManager unnamedTabGroupsForProfileWithIdentifier:](self->_tabGroupManager, "unnamedTabGroupsForProfileWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__WBProfileWindow_existingUnnamedTabGroupForProfileWithIdentifier___block_invoke;
  v7[3] = &unk_24CB314B0;
  v7[4] = self;
  objc_msgSend(v4, "safari_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __67__WBProfileWindow_existingUnnamedTabGroupForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "unnamedTabGroupUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  objc_msgSend(a3, "removedTabGroupWithUUID:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_15:

      goto LABEL_16;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[WBWindowState unnamedTabGroupUUIDs](self->_windowState, "unnamedTabGroupUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v20);

    if (v11)
    {
      -[WBWindowState removeUnnamedTabGroupUUID:](self->_windowState, "removeUnnamedTabGroupUUID:", v20);
      -[WBWindowState removeActiveTabGroupUUIDForProfileWithIdentifier:](self->_windowState, "removeActiveTabGroupUUIDForProfileWithIdentifier:", v7);
      if (-[WBProfileWindow canSwitchProfiles](self, "canSwitchProfiles"))
      {
        if (-[WBProfileWindow _isProfileActive:](self, "_isProfileActive:", v7))
        {
          -[WBTabGroupManager tabCollection](self->_tabGroupManager, "tabCollection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "saveWindowState:completionHandler:", self->_windowState, &__block_literal_global);

          -[WBTabGroupManager defaultProfile](self->_tabGroupManager, "defaultProfile");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "profileWindow:selectProfile:", self, v13);
LABEL_13:

        }
      }
      else
      {
        objc_msgSend(WeakRetained, "closeProfileWindow:", self);
      }
    }
    else
    {
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", self->_activeTabGroupUUID);

      if (v15)
      {
        -[WBTabGroupManager profileWithIdentifier:](self->_tabGroupManager, "profileWithIdentifier:", self->_activeProfileIdentifier);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager defaultProfile](self->_tabGroupManager, "defaultProfile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "isEqual:", v16);

        if (v17)
        {
          -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "profileWindow:selectTabGroup:", self, v18);
        }
        else
        {
          objc_msgSend(v8, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBProfileWindow existingUnnamedTabGroupForProfileWithIdentifier:](self, "existingUnnamedTabGroupForProfileWithIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "profileWindow:selectTabGroup:", self, v19);

        }
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
LABEL_16:

}

void __61__WBProfileWindow_tabGroupManager_didRemoveTabGroupWithUUID___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXProfiles();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __61__WBProfileWindow_tabGroupManager_didRemoveTabGroupWithUUID___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)tabGroupManager:(id)a3 didRemoveProfileWithIdentifier:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a4;
  -[WBProfileWindow existingUnnamedTabGroupForProfileWithIdentifier:](self, "existingUnnamedTabGroupForProfileWithIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WBTabGroupManager removeTabGroup:](self->_tabGroupManager, "removeTabGroup:", v5);
    if (-[WBProfileWindow _isProfileActive:](self, "_isProfileActive:", v8))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (-[WBProfileWindow canSwitchProfiles](self, "canSwitchProfiles"))
      {
        -[WBTabGroupManager defaultProfile](self->_tabGroupManager, "defaultProfile");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "profileWindow:selectProfile:", self, v7);

      }
      else
      {
        objc_msgSend(WeakRetained, "closeProfileWindow:", self);
      }

    }
  }

}

uint64_t __60__WBProfileWindow__attachLocalGroupToDefaultProfileIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "setProfileIdentifier:", *MEMORY[0x24BE82E70]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (id)_displayTitleProviderForTabGroupWithUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__WBProfileWindow__displayTitleProviderForTabGroupWithUUID___block_invoke;
  v8[3] = &unk_24CB31540;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x212BD4C84](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

__CFString *__60__WBProfileWindow__displayTitleProviderForTabGroupWithUUID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void (**v4)(id, void *);
  void *v5;
  __CFString *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && (v4 = (void (**)(id, void *))WeakRetained[7]) != 0)
  {
    objc_msgSend(WeakRetained[1], "tabGroupWithUUID:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24CB35168;
  }

  return v6;
}

- (id)_findOrCreateUnnamedTabGroupForProfile:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WBTabGroupManager *tabGroupManager;
  void *v12;
  WBWindowState *windowState;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[5];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x24BE82E70]);

  if (v6)
  {
    -[WBWindowState localTabGroup](self->_windowState, "localTabGroup");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBProfileWindow existingUnnamedTabGroupForProfileWithIdentifier:](self, "existingUnnamedTabGroupForProfileWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "displayTitleProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        tabGroupManager = self->_tabGroupManager;
        objc_msgSend(v9, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __58__WBProfileWindow__findOrCreateUnnamedTabGroupForProfile___block_invoke;
        v32[3] = &unk_24CB31568;
        v32[4] = self;
        -[WBTabGroupManager updateTabGroupWithUUID:persist:usingBlock:](tabGroupManager, "updateTabGroupWithUUID:persist:usingBlock:", v12, 0, v32);

      }
      v7 = v9;
    }
    else
    {
      windowState = self->_windowState;
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBWindowState localOrUnnamedTabGroupForRestoration:inProfileWithIdentifier:deviceIdentifier:](windowState, "localOrUnnamedTabGroupForRestoration:inProfileWithIdentifier:deviceIdentifier:", 0, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBProfileWindow _displayTitleProviderForTabGroupWithUUID:](self, "_displayTitleProviderForTabGroupWithUUID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDisplayTitleProvider:", v18);

      objc_msgSend(v4, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setProfileIdentifier:", v19);

      -[WBTabGroupManager insertUnnamedTabGroup:](self->_tabGroupManager, "insertUnnamedTabGroup:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabGroupManager tabCollection](self->_tabGroupManager, "tabCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "saveWindowState:", self->_windowState);

      if ((v22 & 1) != 0)
      {
        v7 = v20;
      }
      else
      {
        v23 = WBS_LOG_CHANNEL_PREFIXProfiles();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[WBProfileWindow _findOrCreateUnnamedTabGroupForProfile:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
        v7 = 0;
      }

    }
  }

  return v7;
}

void __58__WBProfileWindow__findOrCreateUnnamedTabGroupForProfile___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_displayTitleProviderForTabGroupWithUUID:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayTitleProvider:", v4);

}

- (BOOL)_isProfileActive:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_activeProfileIdentifier);
}

- (id)_lastActiveTabGroupForProfile:(id)a3
{
  WBWindowState *windowState;
  void *v5;
  void *v6;
  void *v7;

  windowState = self->_windowState;
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBWindowState activeTabGroupUUIDForProfileWithIdentifier:](windowState, "activeTabGroupUUIDForProfileWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WBTabGroupManager tabGroupWithUUID:](self->_tabGroupManager, "tabGroupWithUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)activeTabGroupUUID
{
  return self->_activeTabGroupUUID;
}

- (BOOL)canSwitchProfiles
{
  return self->_canSwitchProfiles;
}

- (WBProfileWindowDelegate)delegate
{
  return (WBProfileWindowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)unnamedTabGroupDisplayTitleProvider
{
  return self->_unnamedTabGroupDisplayTitleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unnamedTabGroupDisplayTitleProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_windowState, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
}

void __61__WBProfileWindow_tabGroupManager_didRemoveTabGroupWithUUID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to save window state after removing tab group", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_attachUnnamedTabGroupToProfileWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to attach unnamed tab group in profile window", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_findOrCreateUnnamedTabGroupForProfile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_211022000, a1, a3, "Failed to save unnamed tab group in window state when creating profile window", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
