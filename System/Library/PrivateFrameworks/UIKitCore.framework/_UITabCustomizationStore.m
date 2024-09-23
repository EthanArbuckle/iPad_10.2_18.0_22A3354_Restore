@implementation _UITabCustomizationStore

+ (_UITabCustomizationStore)customizationStoreWithPersistenceIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;

  v3 = a3;
  if (qword_1ECD7ED60 != -1)
    dispatch_once(&qword_1ECD7ED60, &__block_literal_global_325);
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)v4;
  v6 = CFSTR("com.apple.UIKit.UITabCustomization.DefaultIdentifier");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend((id)_MergedGlobals_1117, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_UITabCustomizationStore _initWithPersistenceIdentifier:]([_UITabCustomizationStore alloc], "_initWithPersistenceIdentifier:", v7);
    objc_msgSend((id)_MergedGlobals_1117, "setObject:forKey:", v8, v7);
  }

  return (_UITabCustomizationStore *)v8;
}

- (id)_initWithPersistenceIdentifier:(id)a3
{
  id v5;
  _UITabCustomizationStore *v6;
  _UITabCustomizationStore *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableOrderedSet *includedItems;
  uint64_t v22;
  NSMutableSet *excludedItems;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSMutableSet *visibleItems;
  uint64_t v38;
  NSMutableSet *hiddenItems;
  uint64_t v40;
  NSMutableDictionary *displayOrdersByIdentifier;
  uint64_t v42;
  NSMutableOrderedSet *v43;
  uint64_t v44;
  NSMutableSet *v45;
  uint64_t v46;
  NSMutableSet *v47;
  uint64_t v48;
  NSMutableSet *v49;
  uint64_t v50;
  id v52;
  objc_super v53;

  v5 = a3;
  v53.receiver = self;
  v53.super_class = (Class)_UITabCustomizationStore;
  v6 = -[_UITabCustomizationStore init](&v53, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistenceIdentifier, a3);
    objc_msgSend((id)objc_opt_class(), "_customizationDataForPersistenceIdentifier:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("version"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == &unk_1E1A98460 || v9 && (v11 = objc_msgSend(v9, "isEqual:", &unk_1E1A98460), v10, v11))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("includedItems"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x1E0C9AA60];
      if (v12)
        v15 = (void *)v12;
      else
        v15 = (void *)MEMORY[0x1E0C9AA60];
      v16 = v15;

      objc_msgSend(v8, "objectForKey:", CFSTR("excludedItems"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = v14;
      v52 = v19;

      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v16);
      includedItems = v7->_includedItems;
      v7->_includedItems = (NSMutableOrderedSet *)v20;

      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v52);
      excludedItems = v7->_excludedItems;
      v7->_excludedItems = (NSMutableSet *)v22;

      objc_msgSend(v8, "objectForKey:", CFSTR("visibleItems"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (void *)v24;
      else
        v26 = v14;
      v27 = v26;

      objc_msgSend(v8, "objectForKey:", CFSTR("hiddenItems"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
        v30 = (void *)v28;
      else
        v30 = v14;
      v31 = v30;

      objc_msgSend(v8, "objectForKey:", CFSTR("displayOrder"));
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      v34 = (void *)MEMORY[0x1E0C9AA70];
      if (v32)
        v34 = (void *)v32;
      v35 = v34;

      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v27);
      visibleItems = v7->_visibleItems;
      v7->_visibleItems = (NSMutableSet *)v36;

      v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v31);
      hiddenItems = v7->_hiddenItems;
      v7->_hiddenItems = (NSMutableSet *)v38;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v35);
      v40 = objc_claimAutoreleasedReturnValue();

      displayOrdersByIdentifier = v7->_displayOrdersByIdentifier;
      v7->_displayOrdersByIdentifier = (NSMutableDictionary *)v40;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v7->_includedItems;
      v7->_includedItems = (NSMutableOrderedSet *)v42;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v7->_excludedItems;
      v7->_excludedItems = (NSMutableSet *)v44;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = v7->_hiddenItems;
      v7->_hiddenItems = (NSMutableSet *)v46;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v7->_visibleItems;
      v7->_visibleItems = (NSMutableSet *)v48;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v50 = objc_claimAutoreleasedReturnValue();
      v16 = v7->_displayOrdersByIdentifier;
      v7->_displayOrdersByIdentifier = (NSMutableDictionary *)v50;
    }

  }
  return v7;
}

- (id)favoriteOrderForDefaultIdentifiers:(id)a3
{
  id v4;
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
  v4 = a3;
  if (-[_UITabCustomizationStore hasFavoriteOrderCustomization](self, "hasFavoriteOrderCustomization"))
  {
    v5 = (void *)-[NSMutableOrderedSet mutableCopy](self->_includedItems, "mutableCopy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
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
          if ((-[NSMutableOrderedSet containsObject:](self->_includedItems, "containsObject:", v11, (_QWORD)v13) & 1) == 0
            && (-[NSMutableSet containsObject:](self->_excludedItems, "containsObject:", v11) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)performWithoutSavingCustomization:(id)a3
{
  self->_ignoringUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoringUpdates = 0;
}

- (void)updateCustomizationForTab:(id)a3
{
  if (!self->_ignoringUpdates)
  {
    -[_UITabCustomizationStore _saveCustomizationForTab:recursive:](self, "_saveCustomizationForTab:recursive:", a3, 0);
    -[_UITabCustomizationStore _saveCustomization](self, "_saveCustomization");
  }
}

- (void)saveCustomizationForTabs:(id)a3
{
  id v4;
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
  v4 = a3;
  -[NSMutableSet removeAllObjects](self->_visibleItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_hiddenItems, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_displayOrdersByIdentifier, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        -[_UITabCustomizationStore _saveCustomizationForTab:recursive:](self, "_saveCustomizationForTab:recursive:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[_UITabCustomizationStore _saveCustomization](self, "_saveCustomization");
}

- (BOOL)favoriteOrderContainsTab:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *includedItems;

  v4 = a3;
  v5 = objc_msgSend(v4, "_tabPlacement");
  if (v5 == 3)
  {
    LOBYTE(includedItems) = 1;
  }
  else
  {
    if (v5 == 2)
    {
      includedItems = self->_includedItems;
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(includedItems) = objc_msgSend(includedItems, "containsObject:", v6);
    }
    else
    {
      if (v5 != 1)
      {
        LOBYTE(includedItems) = 0;
        goto LABEL_9;
      }
      includedItems = self->_excludedItems;
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(includedItems) = objc_msgSend(includedItems, "containsObject:", v6) ^ 1;
    }

  }
LABEL_9:

  return (char)includedItems;
}

- (void)saveFavoriteOrderCustomization:(id)a3 defaultIdentifiers:(id)a4 excludedIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableOrderedSet removeAllObjects](self->_includedItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_excludedItems, "removeAllObjects");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v16))
          -[NSMutableSet addObject:](self->_excludedItems, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v9, "isEqual:", v8) || -[NSMutableSet count](self->_excludedItems, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          -[NSMutableOrderedSet addObject:](self->_includedItems, "addObject:", v22, (_QWORD)v23);
          -[NSMutableSet removeObject:](self->_excludedItems, "removeObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }

  }
  -[_UITabCustomizationStore _notifyForFavoriteOrderChange](self, "_notifyForFavoriteOrderChange", (_QWORD)v23);
  -[_UITabCustomizationStore _saveCustomization](self, "_saveCustomization");

}

- (void)reset
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[_UITabCustomizationStore persistenceIdentifier](self, "persistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_saveCustomizationData:forPersistenceIdentifier:", 0, v4);

  -[NSMutableOrderedSet removeAllObjects](self->_includedItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_excludedItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_visibleItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_hiddenItems, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_displayOrdersByIdentifier, "removeAllObjects");
  -[_UITabCustomizationStore _notifyForContentReset](self, "_notifyForContentReset");
}

- (id)displayOrderIdentifiersForGroupWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_displayOrdersByIdentifier, "objectForKey:", a3);
}

- (BOOL)isHiddenForTabIdentifier:(id)a3 isCustomized:(BOOL *)a4
{
  id v6;
  char v7;
  char v8;

  v6 = a3;
  v7 = -[NSMutableSet containsObject:](self->_hiddenItems, "containsObject:", v6);
  if ((v7 & 1) != 0)
    v8 = 1;
  else
    v8 = -[NSMutableSet containsObject:](self->_visibleItems, "containsObject:", v6);
  *a4 = v8;

  return v7;
}

- (void)_saveCustomizationForTab:(id)a3 recursive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSMutableSet *hiddenItems;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isHidden");
  if (v8 == objc_msgSend(v6, "isHiddenByDefault"))
  {
    -[NSMutableSet removeObject:](self->_hiddenItems, "removeObject:", v7);
    -[NSMutableSet removeObject:](self->_visibleItems, "removeObject:", v7);
  }
  else
  {
    if (objc_msgSend(v6, "isHidden"))
      hiddenItems = self->_hiddenItems;
    else
      hiddenItems = self->_visibleItems;
    -[NSMutableSet addObject:](hiddenItems, "addObject:", v7);
  }
  if (objc_msgSend(v6, "_isGroup"))
  {
    v10 = v6;
    objc_msgSend(v10, "_filteredDisplayOrderIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bs_map:", &__block_literal_global_21_5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v11;
    v15 = v13;
    v16 = v15;
    if (v14 == v15)
    {

    }
    else
    {
      if (!v14 || !v15)
      {

        goto LABEL_17;
      }
      v17 = objc_msgSend(v14, "isEqual:", v15);

      if ((v17 & 1) == 0)
      {
LABEL_17:
        -[NSMutableDictionary setValue:forKey:](self->_displayOrdersByIdentifier, "setValue:forKey:", v14, v7);
        if (v4)
          goto LABEL_18;
        goto LABEL_26;
      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_displayOrdersByIdentifier, "removeObjectForKey:", v7);
    if (v4)
    {
LABEL_18:
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v10, "children", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            -[_UITabCustomizationStore _saveCustomizationForTab:recursive:](self, "_saveCustomizationForTab:recursive:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), 1);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v20);
      }

    }
LABEL_26:

  }
}

- (void)addObserver:(id)a3
{
  NSPointerArray *observers;
  NSPointerArray *v5;
  NSPointerArray *v6;
  id v7;

  v7 = a3;
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSPointerArray compact](observers, "compact");
  if (-[_UITabCustomizationStore _indexOfObserver:](self, "_indexOfObserver:", v7) == 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray addPointer:](self->_observers, "addPointer:", v7);

}

- (void)removeObserver:(id)a3
{
  unint64_t v4;

  if (self->_observers)
  {
    v4 = -[_UITabCustomizationStore _indexOfObserver:](self, "_indexOfObserver:", a3);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v4);
    -[NSPointerArray compact](self->_observers, "compact");
  }
}

- (unint64_t)_indexOfObserver:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (-[NSPointerArray count](self->_observers, "count"))
  {
    v5 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v5) != v4)
    {
      if (++v5 >= -[NSPointerArray count](self->_observers, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (id)_customizationDataForPersistenceIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.UIKit.UITabCustomization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_saveCustomizationData:(id)a3 forPersistenceIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.UIKit.UITabCustomization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = v12;
  if (!v12 || v8)
  {
    if (!v12)
    {
      objc_msgSend(v8, "removeObjectForKey:", v5);
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v12;
    v8 = (void *)v10;
  }
  objc_msgSend(v8, "setObject:forKey:", v9, v5);
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("com.apple.UIKit.UITabCustomization"));

}

- (BOOL)hasModelCustomizations
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableSet count](self->_visibleItems, "count");
  v4 = -[NSMutableSet count](self->_hiddenItems, "count") + v3;
  return v4 + -[NSMutableDictionary count](self->_displayOrdersByIdentifier, "count") != 0;
}

- (BOOL)hasFavoriteOrderCustomization
{
  uint64_t v3;

  v3 = -[NSMutableOrderedSet count](self->_includedItems, "count");
  return v3 + -[NSMutableSet count](self->_excludedItems, "count") != 0;
}

- (void)_saveCustomization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  if (-[_UITabCustomizationStore hasFavoriteOrderCustomization](self, "hasFavoriteOrderCustomization")
    || -[_UITabCustomizationStore hasModelCustomizations](self, "hasModelCustomizations"))
  {
    v13[0] = &unk_1E1A98460;
    v12[0] = CFSTR("version");
    v12[1] = CFSTR("includedItems");
    -[NSMutableOrderedSet array](self->_includedItems, "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    v13[1] = v4;
    v12[2] = CFSTR("excludedItems");
    -[NSMutableSet allObjects](self->_excludedItems, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v5;
    v12[3] = CFSTR("visibleItems");
    -[NSMutableSet allObjects](self->_visibleItems, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v6;
    v12[4] = CFSTR("hiddenItems");
    -[NSMutableSet allObjects](self->_hiddenItems, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[4] = v7;
    v12[5] = CFSTR("displayOrder");
    v8 = (void *)-[NSMutableDictionary copy](self->_displayOrdersByIdentifier, "copy");
    v13[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_opt_class();
  -[_UITabCustomizationStore persistenceIdentifier](self, "persistenceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_saveCustomizationData:forPersistenceIdentifier:", v9, v11);

}

- (void)_notifyForFavoriteOrderChange
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

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSPointerArray copy](self->_observers, "copy", 0);
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
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (v8)
          objc_msgSend(v8, "favoriteOrderDidChange:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSPointerArray compact](self->_observers, "compact");
}

- (void)_notifyForContentReset
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

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSPointerArray copy](self->_observers, "copy", 0);
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
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (v8)
          objc_msgSend(v8, "customizationStoreDidReset:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSPointerArray compact](self->_observers, "compact");
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (NSMutableSet)excludedItems
{
  return self->_excludedItems;
}

- (void)setExcludedItems:(id)a3
{
  objc_storeStrong((id *)&self->_excludedItems, a3);
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (NSMutableOrderedSet)includedItems
{
  return self->_includedItems;
}

- (NSMutableSet)hiddenItems
{
  return self->_hiddenItems;
}

- (NSMutableSet)visibleItems
{
  return self->_visibleItems;
}

- (NSMutableDictionary)displayOrdersByIdentifier
{
  return self->_displayOrdersByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayOrdersByIdentifier, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_hiddenItems, 0);
  objc_storeStrong((id *)&self->_includedItems, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_excludedItems, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
}

@end
