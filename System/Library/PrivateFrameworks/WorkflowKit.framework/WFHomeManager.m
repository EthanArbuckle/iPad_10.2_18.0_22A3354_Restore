@implementation WFHomeManager

void __30__WFHomeManager_sharedManager__block_invoke()
{
  WFHomeManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFHomeManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (WFHomeManager)init
{
  WFHomeManager *v2;
  WFHomeManager *v3;
  NSArray *homes;
  uint64_t v5;
  NSHashTable *eventObservers;
  dispatch_group_t v7;
  OS_dispatch_group *loadHomesGroup;
  void *v9;
  WFHomeManager *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFHomeManager;
  v2 = -[WFHomeManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    homes = v2->_homes;
    v2->_homes = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    eventObservers = v3->_eventObservers;
    v3->_eventObservers = (NSHashTable *)v5;

    v7 = dispatch_group_create();
    loadHomesGroup = v3->_loadHomesGroup;
    v3->_loadHomesGroup = (OS_dispatch_group *)v7;

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addApplicationStateObserver:forEvent:", v3, 3);

    v10 = v3;
  }

  return v3;
}

- (void)reloadData
{
  void *v3;
  uint64_t v4;
  HMHomeManager *v5;
  HMHomeManager *homeManager;

  if (!self->_loading)
  {
    v3 = (void *)objc_opt_new();
    v4 = objc_msgSend(v3, "status");

    if (v4 == 4)
    {
      if (!self->_homeManager)
      {
        v5 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)getHMHomeManagerClass[0]()), "initWithOptions:", 1025);
        homeManager = self->_homeManager;
        self->_homeManager = v5;

      }
      self->_loading = 1;
      dispatch_group_enter((dispatch_group_t)self->_loadHomesGroup);
      -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", 0);
      -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
    }
  }
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  if (a4 == 3)
    -[WFHomeManager reloadData](self, "reloadData", a3);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1724 != -1)
    dispatch_once(&sharedManager_onceToken_1724, &__block_literal_global_1725);
  return (id)sharedManager_sharedManager;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  void *v4;

  *(_WORD *)&self->_hasLoadedHomes = 1;
  objc_msgSend(a3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeManager _setHomes:](self, "_setHomes:", v4);

  dispatch_group_leave((dispatch_group_t)self->_loadHomesGroup);
}

- (void)_setHomes:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *homes;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToArray:", self->_homes) & 1) == 0)
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    homes = self->_homes;
    self->_homes = v5;

    -[WFHomeManager cacheHomeSceneNames](self, "cacheHomeSceneNames");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[WFHomeManager eventObservers](self, "eventObservers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "homeManagerDidUpdateHomes:", self);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeApplicationStateObserver:forEvent:", self, 3);

  v4.receiver = self;
  v4.super_class = (Class)WFHomeManager;
  -[WFHomeManager dealloc](&v4, sel_dealloc);
}

- (void)ensureHomesAreLoadedWithCompletionHandler:(id)a3
{
  void (**block)(void);

  block = (void (**)(void))a3;
  if (-[WFHomeManager hasLoadedHomes](self, "hasLoadedHomes"))
  {
    block[2]();
  }
  else
  {
    -[WFHomeManager reloadData](self, "reloadData");
    dispatch_group_notify((dispatch_group_t)self->_loadHomesGroup, MEMORY[0x1E0C80D38], block);
  }

}

- (void)addEventObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFHomeManager eventObservers](self, "eventObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeEventObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFHomeManager eventObservers](self, "eventObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (unint64_t)status
{
  void *v2;
  char v3;

  -[WFHomeManager homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return (v3 & 0x31) != 0;
}

- (NSArray)homesToWhichWeHaveAdminAccess
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFHomeManager homes](self, "homes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "currentUser");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "homeAccessControlForUser:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isAdministrator"))
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)homesToWhichWeCanAddHomeAutomations
{
  void *v2;
  void *v3;

  -[WFHomeManager homesToWhichWeHaveAdminAccess](self, "homesToWhichWeHaveAdminAccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_119);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)homeNamed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[WFHomeManager homes](self, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__WFHomeManager_homeNamed___block_invoke;
  v10[3] = &unk_1E7AEAA10;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)homeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[WFHomeManager homes](self, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__WFHomeManager_homeWithIdentifier___block_invoke;
  v10[3] = &unk_1E7AEAA10;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)primaryHome
{
  void *v2;
  void *v3;
  void *v4;

  -[WFHomeManager homes](self, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_120);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sceneNamed:(id)a3 inHome:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  objc_msgSend(a4, "actionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__WFHomeManager_sceneNamed_inHome___block_invoke;
  v11[3] = &unk_1E7AEAA58;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "if_objectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)serviceWithIdentifier:(id)a3 inHome:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[WFHomeManager homes](self, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v42;
    v31 = v6;
    v28 = *(_QWORD *)v42;
    do
    {
      v9 = 0;
      v27 = v7;
      do
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v9);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v10, "serviceGroups");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v30)
        {
          v12 = *(_QWORD *)v38;
          v26 = v9;
          v32 = v11;
          v29 = *(_QWORD *)v38;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v11);
              v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              objc_msgSend(v14, "services");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v34;
                while (2)
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v34 != v18)
                      objc_enumerationMutation(v15);
                    v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                    objc_msgSend(v20, "uniqueIdentifier");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "UUIDString");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "isEqualToString:", v5);

                    if ((v23 & 1) != 0)
                    {
                      v24 = v20;

                      v6 = v31;
                      goto LABEL_26;
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  if (v17)
                    continue;
                  break;
                }
              }

              ++v13;
              v6 = v31;
              v11 = v32;
              v12 = v29;
            }
            while (v13 != v30);
            v9 = v26;
            v30 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v30);
        }

        ++v9;
        v8 = v28;
      }
      while (v9 != v27);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      v8 = v28;
      v24 = 0;
    }
    while (v7);
  }
  else
  {
    v24 = 0;
  }
LABEL_26:

  return v24;
}

- (void)cacheHomeSceneNames
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[WFHomeManager homes](self, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "actionSets", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "name");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v3, CFSTR("WFKnownHomeSceneNames"));

}

- (NSArray)homes
{
  return self->_homes;
}

- (BOOL)hasLoadedHomes
{
  return self->_hasLoadedHomes;
}

- (NSHashTable)eventObservers
{
  return self->_eventObservers;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (OS_dispatch_group)loadHomesGroup
{
  return self->_loadHomesGroup;
}

- (void)setLoadHomesGroup:(id)a3
{
  objc_storeStrong((id *)&self->_loadHomesGroup, a3);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadHomesGroup, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

BOOL __35__WFHomeManager_sceneNamed_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedStandardCompare:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

uint64_t __28__WFHomeManager_primaryHome__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrimary");
}

uint64_t __36__WFHomeManager_homeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  WFSerializableHomeIdentifier(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __27__WFHomeManager_homeNamed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedStandardCompare:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

BOOL __52__WFHomeManager_homesToWhichWeCanAddHomeAutomations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "residentDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (id)cachedHomeSceneNames
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("WFKnownHomeSceneNames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
