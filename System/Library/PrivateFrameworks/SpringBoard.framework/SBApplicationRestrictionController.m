@implementation SBApplicationRestrictionController

- (BOOL)isApplicationIdentifierRestricted:(id)a3
{
  return -[NSSet containsObject:](self->_restrictedIdentifiers, "containsObject:", a3);
}

- (SBApplicationRestrictionController)initWithDataSource:(id)a3
{
  id v5;
  SBApplicationRestrictionController *v6;
  SBApplicationRestrictionController *v7;
  void *v8;
  uint64_t v9;
  SBApplicationDefaults *applicationDefaults;
  NSMutableDictionary *v11;
  NSMutableDictionary *tagValidityMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *validTagsByIdentifier;
  NSMutableSet *v15;
  NSMutableSet *enabledTags;
  NSMutableDictionary *v17;
  NSMutableDictionary *ratingRanksByIdentifier;
  void *v19;
  SBApplicationDefaults *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  _QWORD v27[4];
  SBApplicationRestrictionController *v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SBApplicationRestrictionController;
  v6 = -[SBApplicationRestrictionController init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataSource, v5);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationDefaults");
    v9 = objc_claimAutoreleasedReturnValue();
    applicationDefaults = v7->_applicationDefaults;
    v7->_applicationDefaults = (SBApplicationDefaults *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tagValidityMap = v7->_tagValidityMap;
    v7->_tagValidityMap = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    validTagsByIdentifier = v7->_validTagsByIdentifier;
    v7->_validTagsByIdentifier = v13;

    v7->_tagsNotificationToken = (MGNotificationTokenStruct *)-1;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    enabledTags = v7->_enabledTags;
    v7->_enabledTags = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ratingRanksByIdentifier = v7->_ratingRanksByIdentifier;
    v7->_ratingRanksByIdentifier = v17;

    v7->_hasHideNonDefaultSystemAppsCapability = MGGetBoolAnswer();
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBApplicationRestrictionController.m"), 76, CFSTR("SBApplicationRestrictionController is being created before the telephony state provider"));

    }
    objc_msgSend(v19, "addObserver:", v7);
    v20 = v7->_applicationDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldShowInternalApplications");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldShowNonDefaultSystemApplications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __57__SBApplicationRestrictionController_initWithDataSource___block_invoke;
    v27[3] = &unk_1E8E9DED8;
    v28 = v7;
    v24 = (id)-[SBApplicationDefaults observeDefaults:onQueue:withBlock:](v20, "observeDefaults:onQueue:withBlock:", v23, MEMORY[0x1E0C80D38], v27);

  }
  return v7;
}

void __57__SBApplicationRestrictionController_initWithDataSource___block_invoke(uint64_t a1)
{
  -[SBApplicationRestrictionController _updateVisibilityPreferences](*(_QWORD *)(a1 + 32));
}

- (void)_updateVisibilityPreferences
{
  int v2;
  int v3;
  int v4;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 80);
    *(_BYTE *)(a1 + 80) = objc_msgSend(*(id *)(a1 + 72), "shouldShowInternalApplications");
    v3 = *(unsigned __int8 *)(a1 + 82);
    v4 = (objc_msgSend(*(id *)(a1 + 72), "shouldShowNonDefaultSystemApplications") & 1) != 0 || *(_BYTE *)(a1 + 81) == 0;
    *(_BYTE *)(a1 + 82) = v4;
    if (v3 != v4 || v2 != *(unsigned __int8 *)(a1 + 80))
    {
      if (objc_msgSend(*(id *)(a1 + 16), "count"))
        -[SBApplicationRestrictionController _postRestrictionStateToObservers:](a1, *(void **)(a1 + 16));
    }
  }
}

- (SBApplicationRestrictionController)init
{
  return -[SBApplicationRestrictionController initWithDataSource:](self, "initWithDataSource:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)SBApp, "telephonyStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_tagsNotificationToken != (MGNotificationTokenStruct *)-1)
    MGCancelNotifications();
  v4.receiver = self;
  v4.super_class = (Class)SBApplicationRestrictionController;
  -[SBApplicationRestrictionController dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationRestrictionController.m"), 104, CFSTR("observer cannot be nil"));

    v5 = 0;
  }
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v5))
  {
    observers = self->_observers;
    if (!observers)
    {
      v7 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 16);
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v11);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationRestrictionController _postRestrictionStateToObservers:]((uint64_t)self, v9);

  }
}

- (void)_postRestrictionStateToObservers:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  __int128 v26;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 84))
  {
    *(_BYTE *)(a1 + 83) = objc_msgSend((id)a1, "isAllowlistActiveAndTransient");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "applicationRestrictionControllerWillPostAppVisibilityUpdate:", a1);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v6);
    }
    v25 = v3;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v11, "addObject:", CFSTR("hidden"));
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(v10, "addObject:", CFSTR("SBInternalAppTag"));
    if (*(_BYTE *)(a1 + 82))
      objc_msgSend(v10, "addObject:", CFSTR("SBNonDefaultSystemAppTag"));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "bundleIdentifiersWithVisibilityOverrideHidden");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionSet:", v13);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "applicationRestrictionController:didUpdateVisibleTags:hiddenTags:", a1, v10, v11);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v16);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v14;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "applicationRestrictionControllerDidPostAppVisibilityUpdate:", a1);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v21);
    }

    v3 = v25;
  }

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)allAllowedAppBundleIdentifiers
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = (void *)-[NSSet copy](self->_restrictedIdentifiers, "copy");
  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(WeakRetained, "allBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minusSet:", v4);
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "alwaysAvailableApplicationBundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minusSet:", v10);
  v11 = (void *)objc_msgSend(v7, "copy");

  return v11;
}

- (id)allRestrictedAppBundleIdentifiers
{
  return (id)-[NSSet copy](self->_restrictedIdentifiers, "copy");
}

- (BOOL)isAllowlistActiveAndTransient
{
  void *v2;
  void *v3;
  int v4;
  BOOL v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveWhitelistedAppBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v2, "BOOLRestrictionForFeature:", CFSTR("SpringBoardShouldConsiderAppAllowlistAsTransient"));
  if (v3)
    v5 = v4 == 1;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)noteApplicationIdentifiersDidChangeWithAdded:(id)a3 replaced:(id)a4 removed:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  const void *v46;
  const void *Value;
  CFTypeID v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  char v52;
  char v53;
  NSObject *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id obj;
  uint64_t v60;
  void *v61;
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  void *v70;
  id v71;
  id from;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  _BYTE v91[10];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v56 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_enabledTags);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[NSMutableDictionary allValues](self->_validTagsByIdentifier, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v87 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v61, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    }
    while (v10);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v13)
  {
    v62 = 0;
    v14 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v83 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
        -[NSMutableDictionary removeObjectForKey:](self->_validTagsByIdentifier, "removeObjectForKey:", v16);
        -[NSMutableDictionary objectForKey:](self->_ratingRanksByIdentifier, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_ratingRanksByIdentifier, "removeObjectForKey:", v16);
          v62 = 1;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v13);
  }
  else
  {
    v62 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v57);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionSet:", v56);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v58 = v19;
  v20 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
  if (v20)
  {
    v60 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v79 != v60)
          objc_enumerationMutation(v58);
        v22 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k);
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(WeakRetained, "applicationWithBundleIdentifier:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "info");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "tags");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke;
        v77[3] = &unk_1E8EC0490;
        v77[4] = self;
        objc_msgSend(v26, "indexesOfObjectsPassingTest:", v77);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "count"))
        {
          v28 = objc_msgSend(v27, "count");
          if (v28 != objc_msgSend(v26, "count"))
          {
            objc_msgSend(v26, "objectsAtIndexes:", v27);
            v29 = objc_claimAutoreleasedReturnValue();

            v26 = (void *)v29;
          }
          -[NSMutableDictionary setObject:forKey:](self->_validTagsByIdentifier, "setObject:forKey:", v26, v22);
        }
        else
        {
          -[NSMutableDictionary removeObjectForKey:](self->_validTagsByIdentifier, "removeObjectForKey:", v22);
        }
        -[NSMutableDictionary objectForKey:](self->_ratingRanksByIdentifier, "objectForKey:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isSystemApplication"))
        {
          if (v30)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_ratingRanksByIdentifier, "removeObjectForKey:", v22);
            v62 = 1;
          }
        }
        else
        {
          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v24, "info");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "ratingRank"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v33, "isEqual:", v30) & 1) == 0)
          {
            -[NSMutableDictionary setObject:forKey:](self->_ratingRanksByIdentifier, "setObject:forKey:", v33, v22);
            v62 = 1;
          }

        }
      }
      v20 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[NSMutableDictionary allValues](self->_validTagsByIdentifier, "allValues");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v74;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v74 != v37)
          objc_enumerationMutation(v35);
        objc_msgSend(v34, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * m));
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
    }
    while (v36);
  }

  if (self->_tagsNotificationToken != (MGNotificationTokenStruct *)-1)
  {
    if ((objc_msgSend(v34, "isEqualToSet:", v61) & 1) != 0)
      goto LABEL_64;
    if (self->_tagsNotificationToken != (MGNotificationTokenStruct *)-1)
    {
      MGCancelNotifications();
      self->_tagsNotificationToken = (MGNotificationTokenStruct *)-1;
    }
  }
  -[NSMutableSet removeAllObjects](self->_enabledTags, "removeAllObjects");
  if (objc_msgSend(v34, "count"))
  {
    objc_initWeak(&from, self);
    objc_msgSend(v34, "allObjects");
    v39 = MEMORY[0x1E0C80D38];
    v67 = MEMORY[0x1E0C809B0];
    v68 = 3221225472;
    v69 = __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke_2;
    v70 = &unk_1E8EACFF8;
    objc_copyWeak(&v71, &from);
    self->_tagsNotificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_msgSend(v34, "allObjects");
    v40 = (void *)MGCopyMultipleAnswers();
    SBLogAppLibrary();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v91 = v40;
      _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_INFO, " *|MGReset|* response=%@", buf, 0xCu);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v42 = v40;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v92, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v64;
      do
      {
        for (n = 0; n != v43; ++n)
        {
          if (*(_QWORD *)v64 != v44)
            objc_enumerationMutation(v42);
          v46 = *(const void **)(*((_QWORD *)&v63 + 1) + 8 * n);
          Value = CFDictionaryGetValue((CFDictionaryRef)v42, v46);
          v48 = CFGetTypeID(Value);
          if (v48 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)Value))
            -[NSMutableSet addObject:](self->_enabledTags, "addObject:", v46);
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v63, v92, 16);
      }
      while (v43);
    }

    if (v42)
      CFRelease(v42);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&from);
  }
LABEL_64:
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "effectiveWhitelistedAppBundleIDs");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    if (objc_msgSend(v57, "count"))
      v51 = 1;
    else
      v51 = objc_msgSend(obj, "count") != 0;
  }
  else
  {
    v51 = 0;
  }
  v52 = -[NSMutableSet isEqualToSet:](self->_enabledTags, "isEqualToSet:", v55);
  v53 = v52;
  if (((v62 | v51) & 1) != 0)
  {
    SBLogAppLibrary();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v91 = v62 & 1;
      *(_WORD *)&v91[4] = 1024;
      *(_DWORD *)&v91[6] = v51;
      _os_log_impl(&dword_1D0540000, v54, OS_LOG_TYPE_INFO, "restriction update: installed change - rankChange=%{BOOL}u allowedAppsFilterChange=%{BOOL}u", buf, 0xEu);
    }

    -[SBApplicationRestrictionController _updateRestrictionsAndForcePost:]((uint64_t)self, v53 ^ 1);
  }
  else if ((v52 & 1) == 0)
  {
    -[SBApplicationRestrictionController _postRestrictionState]((uint64_t)self);
  }

}

uint64_t __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGIsQuestionValid());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v4, v3);
  }
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

void __100__SBApplicationRestrictionController_noteApplicationIdentifiersDidChangeWithAdded_replaced_removed___block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *v4;
  id *WeakRetained;
  NSObject *v6;
  int v7;
  CFTypeID v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (const void *)MGCopyAnswer();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  SBLogAppLibrary();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(WeakRetained[6], "containsObject:", a2);
    v9 = 138412802;
    v10 = a2;
    v11 = 1024;
    v12 = v7;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, " *|MGUpdate|* tag=%@ old=%i new=%@", (uint8_t *)&v9, 0x1Cu);
  }

  if (v4)
  {
    v8 = CFGetTypeID(v4);
    if (v8 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4))
      objc_msgSend(WeakRetained[6], "addObject:", a2);
    else
      objc_msgSend(WeakRetained[6], "removeObject:", a2);
    CFRelease(v4);
  }
  -[SBApplicationRestrictionController _postRestrictionState]((uint64_t)WeakRetained);

}

- (void)_postRestrictionState
{
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
      -[SBApplicationRestrictionController _postRestrictionStateToObservers:](a1, *(void **)(a1 + 16));
  }
}

- (void)_updateRestrictionsAndForcePost:(uint64_t)a1
{
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  int v49;
  int v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  _QWORD v59[5];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateRestrictionCache");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v4, "restrictedAppBundleIDs");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "unionSet:", v7);
    v54 = (void *)v7;
    objc_msgSend(v4, "effectiveWhitelistedAppBundleIDs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55 && (objc_msgSend(v4, "isInSingleAppMode") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "allBundleIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v8);
      objc_msgSend(v9, "minusSet:", v55);
      objc_msgSend(v5, "unionSet:", v9);

    }
    objc_msgSend(v4, "effectiveValueForSetting:", *MEMORY[0x1E0D470B0]);
    v57 = WeakRetained;
    v58 = v4;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v52 = a2;
      v10 = objc_msgSend(v56, "intValue");
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v11 = *(id *)(a1 + 56);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v70 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "intValue");

            if (v18 > v10)
              objc_msgSend(v5, "addObject:", v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        }
        while (v13);
      }

      WeakRetained = v57;
      v4 = v58;
      a2 = v52;
    }
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(WeakRetained, "alwaysAvailableApplicationBundleIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v21;
    objc_msgSend(v5, "minusSet:", v21);
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "carrierDisabledApplicationIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v5, "unionSet:", v23);
    v51 = v23;
    if ((objc_msgSend(v4, "isAppClipsAllowed") & 1) == 0)
    {
      v24 = a2;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(WeakRetained, "allApplications");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v66 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_msgSend(v30, "info");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isAppClip");

            if (v32)
            {
              objc_msgSend(v30, "bundleIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v33);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        }
        while (v27);
      }

      WeakRetained = v57;
      a2 = v24;
      v23 = v51;
    }
    if ((objc_msgSend(*(id *)(a1 + 64), "isEqualToSet:", v5) & 1) == 0)
    {
      SBLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = v5;
        _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "New list of restricted identifiers: %@", buf, 0xCu);
      }

      v35 = objc_msgSend(v5, "copy");
      v36 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v35;

      +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend((id)SBApp, "windowSceneManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "connectedWindowScenes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v62;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v62 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "sceneManager");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "externalApplicationSceneHandlesForBundleIdentifiers:", v5);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "unionSet:", v46);

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        }
        while (v42);
      }

      a2 = 1;
      SBApplicationSceneEntityDestructionMakeIntent(1, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke;
      v59[3] = &unk_1E8EA93C0;
      v59[4] = a1;
      v60 = v37;
      v48 = v37;
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v38, v47, v59);

      WeakRetained = v57;
      v23 = v51;
    }
    v49 = *(unsigned __int8 *)(a1 + 83);
    v50 = objc_msgSend((id)a1, "isAllowlistActiveAndTransient");
    if ((a2 & 1) != 0 || v49 != v50)
    {
      if (objc_msgSend(*(id *)(a1 + 16), "count"))
        -[SBApplicationRestrictionController _postRestrictionStateToObservers:](a1, *(void **)(a1 + 16));
    }

  }
}

- (void)noteRestrictionsMayHaveChanged
{
  -[SBApplicationRestrictionController _updateRestrictionsAndForcePost:]((uint64_t)self, 0);
}

- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  SBLogAppLibrary();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "restriction update: carrier change", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SBApplicationRestrictionController_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __86__SBApplicationRestrictionController_carrierBundleInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  -[SBApplicationRestrictionController _updateRestrictionsAndForcePost:](*(_QWORD *)(a1 + 32), 0);
}

- (void)beginPostingChanges
{
  if (!self->_canPostRestrictionState)
  {
    -[SBApplicationRestrictionController _updateVisibilityPreferences]((uint64_t)self);
    if (!self->_restrictedIdentifiers)
      -[SBApplicationRestrictionController _updateRestrictionsAndForcePost:]((uint64_t)self, 0);
    self->_canPostRestrictionState = 1;
    -[SBApplicationRestrictionController _postRestrictionState]((uint64_t)self);
  }
}

void __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke_2;
  v3[3] = &unk_1E8EC04B8;
  v4 = v1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __70__SBApplicationRestrictionController__updateRestrictionsAndForcePost___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "applicationWithBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if (v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Killing %@ because it has been disabled", (uint8_t *)&v9, 0xCu);
    }

    SBWorkspaceKillApplication(v4, 1, CFSTR("app has been disabled/restricted"), 0);
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AppStore")))
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "App for rdar://67699908 is restricted", (uint8_t *)&v9, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationDefaults, 0);
  objc_storeStrong((id *)&self->_restrictedIdentifiers, 0);
  objc_storeStrong((id *)&self->_ratingRanksByIdentifier, 0);
  objc_storeStrong((id *)&self->_enabledTags, 0);
  objc_storeStrong((id *)&self->_validTagsByIdentifier, 0);
  objc_storeStrong((id *)&self->_tagValidityMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
