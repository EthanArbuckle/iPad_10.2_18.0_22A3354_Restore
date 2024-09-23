@implementation PTSettings

- (void)_setObservationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  BOOL v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (PTInstallIsAppleInternal() && self->__observationEnabled != v3)
  {
    PTLogObjectForTopic(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      v7 = CFSTR("disabling");
      if (v3)
        v7 = CFSTR("enabling");
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v8 = v6;
      _os_log_impl(&dword_1B966F000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ observation", buf, 0x16u);

    }
    v9 = MEMORY[0x1E0C809B0];
    self->__observationEnabled = v3;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __37__PTSettings__setObservationEnabled___block_invoke;
    v10[3] = &__block_descriptor_33_e33_v24__0__NSString_8__PTSettings_16l;
    v11 = v3;
    -[PTSettings _enumerateChildrenWithBlock:](self, "_enumerateChildrenWithBlock:", v10);
    -[PTSettings _startOrStopObservingPropertiesAndChildren](self, "_startOrStopObservingPropertiesAndChildren");
  }
}

- (void)addKeyPathObserver:(id)a3
{
  NSHashTable *keyPathObservers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  if (PTInstallIsAppleInternal())
  {
    keyPathObservers = self->__keyPathObservers;
    if (!keyPathObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->__keyPathObservers;
      self->__keyPathObservers = v5;

      keyPathObservers = self->__keyPathObservers;
    }
    -[NSHashTable addObject:](keyPathObservers, "addObject:", v7);
    -[PTSettings _startOrStopObservingPropertiesAndChildren](self, "_startOrStopObservingPropertiesAndChildren");
  }

}

- (void)removeKeyObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (PTInstallIsAppleInternal())
  {
    -[NSHashTable removeObject:](self->__keyObservers, "removeObject:", v4);
    -[PTSettings _startOrStopObservingPropertiesAndChildren](self, "_startOrStopObservingPropertiesAndChildren");
  }

}

- (void)addKeyObserver:(id)a3
{
  NSHashTable *keyObservers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  if (PTInstallIsAppleInternal())
  {
    keyObservers = self->__keyObservers;
    if (!keyObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->__keyObservers;
      self->__keyObservers = v5;

      keyObservers = self->__keyObservers;
    }
    -[NSHashTable addObject:](keyObservers, "addObject:", v7);
    -[PTSettings _startOrStopObservingPropertiesAndChildren](self, "_startOrStopObservingPropertiesAndChildren");
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->__isObservingProperties)
    -[PTSettings _stopObservingProperties](self, "_stopObservingProperties");
  if (self->__isObservingChildren)
    -[PTSettings _stopObservingChildren](self, "_stopObservingChildren");
  v3.receiver = self;
  v3.super_class = (Class)PTSettings;
  -[PTSettings dealloc](&v3, sel_dealloc);
}

- (id)_createChildForKey:(id)a3
{
  return (id)objc_msgSend(objc_alloc(-[PTSettingsClassStructure childClassForKey:](self->__classStructure, "childClassForKey:", a3)), "initWithDefaultValues");
}

- (PTSettings)initWithDefaultValues
{
  PTSettings *v2;
  int IsAppleInternal;
  _BOOL4 v4;
  objc_class *v6;
  uint64_t v7;
  PTSettingsClassStructure *classStructure;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTSettings;
  v2 = -[PTSettings init](&v10, sel_init);
  if (v2)
  {
    IsAppleInternal = PTInstallIsAppleInternal();
    v4 = -[PTSettings suppressesIntrospectionOnCustomerInstalls](v2, "suppressesIntrospectionOnCustomerInstalls");
    if (!v4 || IsAppleInternal != 0)
    {
      v6 = (objc_class *)objc_opt_class();
      +[PTSettingsClassStructure structureForSettingsClass:]((uint64_t)PTSettingsClassStructure, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      classStructure = v2->__classStructure;
      v2->__classStructure = (PTSettingsClassStructure *)v7;

    }
    if (v4)
      -[PTSettings createChildren](v2, "createChildren");
    else
      -[PTSettings _createChildren](v2, "_createChildren");
    if (IsAppleInternal)
    {
      -[PTSettings _createOutlets](v2, "_createOutlets");
      -[PTSettings setDefaultValues](v2, "setDefaultValues");
      if (v4)
        -[PTSettings _validateChildren](v2, "_validateChildren");
    }
    else
    {
      -[PTSettings setDefaultValues](v2, "setDefaultValues");
    }
  }
  return v2;
}

- (void)_createChildren
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
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
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1BCCC24B8]();
        v10 = -[PTSettings _ensureChildForKey:](self, "_ensureChildForKey:", v8);
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)suppressesIntrospectionOnCustomerInstalls
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__restoreDefaultsObserver);
  objc_storeStrong((id *)&self->__keyPathObservers, 0);
  objc_storeStrong((id *)&self->__keyObservers, 0);
  objc_storeStrong((id *)&self->__classStructure, 0);
}

- (id)_ensureChildForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PTSettings valueForKey:](self, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PTSettings _createChildForKey:](self, "_createChildForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTSettings setValue:forKey:](self, "setValue:forKey:", v5, v4);
  }

  return v5;
}

+ (BOOL)ignoresKey:(id)a3
{
  return 0;
}

+ (unint64_t)settingsVersionNumber
{
  return 0;
}

- (id)_initWithClassStructure:(id)a3
{
  id v5;
  PTSettings *v6;
  PTSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTSettings;
  v6 = -[PTSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__classStructure, a3);

  return v7;
}

- (void)_createChildrenAndOutlets
{
  -[PTSettings _createChildren](self, "_createChildren");
  -[PTSettings _createOutlets](self, "_createOutlets");
}

- (void)_createOutlets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PTSettingsClassStructure outletKeys](self->__classStructure, "outletKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = -[PTOutlet _init]([PTOutlet alloc], "_init");
        -[PTSettings setValue:forKey:](self, "setValue:forKey:", v9, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_validateChildren
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[PTSettings valueForKey:](self, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Child not initialized"), CFSTR("Child with key %@ has not been initialized."), v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_initWithArchiveDictionary:(id)a3
{
  id v4;
  PTSettings *v5;
  PTSettings *v6;

  v4 = a3;
  v5 = -[PTSettings initWithDefaultValues](self, "initWithDefaultValues");
  v6 = v5;
  if (v5)
    -[PTSettings _applyArchiveDictionary:](v5, "_applyArchiveDictionary:", v4);

  return v6;
}

- (void)_applyArchiveDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138412546;
    v21 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v11, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v11);

        if (v14)
        {
          objc_opt_class();
          objc_opt_class();
          if (PTValidateDictionary(v12))
          {
            -[PTSettings _ensureChildForKey:](self, "_ensureChildForKey:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_applyArchiveDictionary:", v12);

          }
          else
          {
            PTLogObjectForTopic(0);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = (void *)objc_opt_class();
              *(_DWORD *)buf = v21;
              v27 = v11;
              v28 = 2112;
              v29 = v19;
              v20 = v19;
              _os_log_impl(&dword_1B966F000, v18, OS_LOG_TYPE_DEFAULT, "PTSettings can't apply archive for child settings key %@ (expected NSDictionary, found %@)", buf, 0x16u);

            }
          }
        }
        else
        {
          -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v11);

          if (v17)
            -[PTSettings applyArchiveValue:forKey:](self, "applyArchiveValue:forKey:", v12, v11);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "applySettings:", self);
  return v4;
}

+ (id)settingsFromArchiveDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  Class v8;
  objc_class *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("_internal_class"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = NSClassFromString(v7);
  else
    v8 = 0;
  if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", a1))
    v9 = v8;
  else
    v9 = (objc_class *)a1;
  v10 = (void *)objc_msgSend([v9 alloc], "_initWithArchiveDictionary:", v4);

  return v10;
}

- (id)archiveDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSettingsClassStructure settingsClassName](self->__classStructure, "settingsClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("_internal_class"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PTSettings _allChildAndLeafKeys](self, "_allChildAndLeafKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138412546;
    v18 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if (v13)
        {
          -[PTSettings valueForKey:](self, "valueForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "archiveDictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            goto LABEL_15;
        }
        else
        {
          -[PTSettings archiveValueForKey:](self, "archiveValueForKey:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_15;
        }
        if (PTObjectIsRecursivelyPlistable(v15))
        {
          objc_msgSend(v3, "setObject:forKey:", v15, v11);
        }
        else
        {
          PTLogObjectForTopic(0);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v24 = v11;
            v25 = 2112;
            v26 = v15;
            _os_log_impl(&dword_1B966F000, v16, OS_LOG_TYPE_DEFAULT, "PTSettings cannot use archive value for property %@ as it contains non-plist types: %@", buf, 0x16u);
          }

        }
LABEL_15:

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  return v3;
}

- (void)restoreDefaultValues
{
  id v3;

  -[PTSettings _sendWillRestoreDefaults](self, "_sendWillRestoreDefaults");
  v3 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultValues");
  -[PTSettings applySettings:](self, "applySettings:", v3);
  -[PTSettings _sendDidRestoreDefaults](self, "_sendDidRestoreDefaults");

}

- (void)restoreFromArchiveDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "settingsFromArchiveDictionary:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PTSettings applySettings:](self, "applySettings:", v5);
}

- (void)applySettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTSettings _ensureChildForKey:](self, "_ensureChildForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "applySettings:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
        objc_msgSend(v4, "valueForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTSettings _safeSetValue:forLeafKey:](self, "_safeSetValue:forLeafKey:", v19, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

}

- (void)_safeSetValue:(id)a3 forLeafKey:(id)a4
{
  id v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = -[PTSettingsClassStructure leafClassForKey:](self->__classStructure, "leafClassForKey:", v6);
  -[PTSettingsClassStructure leafStructNameForKey:](self->__classStructure, "leafStructNameForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (!v10)
    {
LABEL_6:
      -[PTSettings setValue:forKey:](self, "setValue:forKey:", v10, v6);
      goto LABEL_7;
    }
  }
  else
  {
    objc_opt_class();
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
LABEL_7:

}

- (void)removeKeyPathObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (PTInstallIsAppleInternal())
  {
    -[NSHashTable removeObject:](self->__keyPathObservers, "removeObject:", v4);
    -[PTSettings _startOrStopObservingPropertiesAndChildren](self, "_startOrStopObservingPropertiesAndChildren");
  }

}

- (void)invalidateValueForKey:(id)a3
{
  id v4;

  v4 = a3;
  -[PTSettings _sendKeyChanged:](self, "_sendKeyChanged:", v4);
  -[PTSettings _sendKeyPathChanged:](self, "_sendKeyPathChanged:", v4);

}

- (id)module
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "settingsControllerModule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)settingsControllerModule
{
  return 0;
}

- (id)drillDownSummary
{
  return 0;
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v12 = 0;
  v7 = -[PTSettings _applyArchiveValue:forLeafKey:error:](self, "_applyArchiveValue:forLeafKey:error:", a3, v6, &v12);
  v8 = v12;
  if (!v7)
  {
    PTLogObjectForTopic(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      v11 = v10;
      _os_log_impl(&dword_1B966F000, v9, OS_LOG_TYPE_DEFAULT, "%@ cannot apply archive value for key '%@': %@", buf, 0x20u);

    }
  }

}

+ (BOOL)_supportsArchivingCustomClass:(Class)a3
{
  return 0;
}

+ (BOOL)_supportsArchivingStructType:(id)a3
{
  return 0;
}

+ (id)_archiveDictionaryForObject:(id)a3 ofCustomClass:(Class)a4
{
  return 0;
}

+ (id)_archiveDictionaryForValue:(id)a3 ofStructType:(id)a4
{
  return 0;
}

+ (id)_objectOfCustomClass:(Class)a3 fromArchiveDictionary:(id)a4
{
  return 0;
}

+ (id)_valueOfStructType:(id)a3 fromArchiveDictionary:(id)a4
{
  return 0;
}

uint64_t __37__PTSettings__setObservationEnabled___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_setObservationEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_setRestoreDefaultsObserver:(id)a3
{
  objc_storeWeak((id *)&self->__restoreDefaultsObserver, a3);
}

- (BOOL)_hasObservers
{
  return -[NSHashTable count](self->__keyObservers, "count")
      || -[NSHashTable count](self->__keyPathObservers, "count") != 0;
}

- (BOOL)_hasKeyPathObservers
{
  return -[NSHashTable count](self->__keyPathObservers, "count") != 0;
}

- (void)_startOrStopObservingPropertiesAndChildren
{
  BOOL v3;
  BOOL v4;
  _BOOL4 v5;

  if (!self->__observationEnabled)
  {
LABEL_11:
    v5 = 0;
LABEL_12:
    if (self->__isObservingProperties)
    {
      -[PTSettings _stopObservingProperties](self, "_stopObservingProperties");
      if (v5)
        goto LABEL_14;
    }
    else if (v5)
    {
      goto LABEL_14;
    }
LABEL_17:
    if (self->__isObservingChildren)
      -[PTSettings _stopObservingChildren](self, "_stopObservingChildren");
    return;
  }
  v3 = -[PTSettings _hasObservers](self, "_hasObservers");
  v4 = v3;
  if (!self->__observationEnabled)
  {
    if (v3)
    {
      if (!self->__isObservingProperties)
        -[PTSettings _startObservingProperties](self, "_startObservingProperties");
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  v5 = -[PTSettings _hasKeyPathObservers](self, "_hasKeyPathObservers");
  if (!v4)
    goto LABEL_12;
  if (!self->__isObservingProperties)
    -[PTSettings _startObservingProperties](self, "_startObservingProperties");
  if (!v5)
    goto LABEL_17;
LABEL_14:
  if (!self->__isObservingChildren)
    -[PTSettings _startObservingChildren](self, "_startObservingChildren");
}

- (void)_startObservingProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->__isObservingProperties = 1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PTSettings _allChildAndLeafKeys](self, "_allChildAndLeafKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[PTSettings addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 3, 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingProperties
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->__isObservingProperties = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PTSettings _allChildAndLeafKeys](self, "_allChildAndLeafKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[PTSettings removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_startObservingChildren
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
  self->__isObservingChildren = 1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys", 0);
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
        -[PTSettings valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addKeyPathObserver:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_stopObservingChildren
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
  self->__isObservingChildren = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys", 0);
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
        -[PTSettings valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeKeyPathObserver:", self);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_allChildAndLeafKeys
{
  void *v3;
  void *v4;
  void *v5;

  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_applyArchiveValue:(id)a3 forLeafKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  objc_class *v22;

  v8 = a3;
  v9 = a4;
  -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if ((v11 & 1) != 0)
  {
    v12 = -[PTSettingsClassStructure leafClassForKey:](self->__classStructure, "leafClassForKey:", v9);
    -[PTSettingsClassStructure leafStructNameForKey:](self->__classStructure, "leafStructNameForKey:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend((id)objc_opt_class(), "_supportsArchivingCustomClass:", v12))
      {
        objc_msgSend((id)objc_opt_class(), "_objectOfCustomClass:fromArchiveDictionary:", v12, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTSettings setValue:forKey:](self, "setValue:forKey:", v15, v9);

LABEL_22:
        v16 = 1;
        goto LABEL_29;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = objc_opt_class();
          v22 = v12;
LABEL_18:
          objc_msgSend(v17, "stringWithFormat:", CFSTR("don't know how to convert %@ to %@"), v18, v22);
LABEL_19:
          v16 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          goto LABEL_30;
        }
        goto LABEL_25;
      }
    }
    else
    {
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend((id)objc_opt_class(), "_supportsArchivingStructType:", v14))
        {
          objc_msgSend((id)objc_opt_class(), "_valueOfStructType:fromArchiveDictionary:", v14, v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v19 != 0;
          if (v19)
          {
            -[PTSettings setValue:forKey:](self, "setValue:forKey:", v19, v9);
          }
          else if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create struct %@ from %@"), v14, v8);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_29;
        }
        if (a5)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = objc_opt_class();
          v22 = (objc_class *)v14;
          goto LABEL_18;
        }
LABEL_25:
        v16 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("don't know how to convert %@ to scalar"), objc_opt_class(), v21);
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
    -[PTSettings setValue:forKey:](self, "setValue:forKey:", v8, v9);
    goto LABEL_22;
  }
  v16 = 0;
  if (a5)
    *a5 = CFSTR("no such leaf key");
LABEL_30:

  return v16;
}

- (id)_archiveValueForLeafKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[PTSettings valueForKey:](self, "valueForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PTSettingsClassStructure leafClassForKey:](self->__classStructure, "leafClassForKey:", v4);
    -[PTSettingsClassStructure leafStructNameForKey:](self->__classStructure, "leafStructNameForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend((id)objc_opt_class(), "_supportsArchivingCustomClass:", v8))
    {
      objc_msgSend((id)objc_opt_class(), "_archiveDictionaryForObject:ofCustomClass:", v7, v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v9 && objc_msgSend((id)objc_opt_class(), "_supportsArchivingStructType:", v9))
    {
      objc_msgSend((id)objc_opt_class(), "_archiveDictionaryForValue:ofStructType:", v7, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v7;
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_enumerateLeafValuesWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PTSettings__enumerateLeafValuesWithBlock___block_invoke;
  v7[3] = &unk_1E7058600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __44__PTSettings__enumerateLeafValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_enumerateChildrenWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PTSettings__enumerateChildrenWithBlock___block_invoke;
  v7[3] = &unk_1E7058600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __42__PTSettings__enumerateChildrenWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_enumerateOutletsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PTSettingsClassStructure outletKeys](self->__classStructure, "outletKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PTSettings__enumerateOutletsWithBlock___block_invoke;
  v7[3] = &unk_1E7058600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __41__PTSettings__enumerateOutletsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_getChild:(id *)a3 create:(BOOL)a4 leafKey:(id *)a5 forKeyPath:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id *v26;

  v9 = a4;
  v12 = a6;
  v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("."));
  if (v14)
  {
    v15 = v13;
    v16 = v14;
    v26 = a3;
    v17 = a5;
    objc_msgSend(v12, "substringToIndex:", v13);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", v18);

    if (v20)
    {
      if ((v9 & 1) != 0)
        -[PTSettings _ensureChildForKey:](self, "_ensureChildForKey:", v18);
      else
        -[PTSettings valueForKey:](self, "valueForKey:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringFromIndex:", v15 + v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v23, "_getChild:create:leafKey:forKeyPath:error:", v26, v9, v17, v24, a7);

      goto LABEL_18;
    }
    if (!a7)
    {
      LOBYTE(v9) = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ has no child for key '%@'"), objc_opt_class(), v18);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 0;
LABEL_14:
    *a7 = v22;
    goto LABEL_18;
  }
  v18 = v12;
  -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v21, "containsObject:", v18);

  if (!(_DWORD)v9)
  {
    if (!a7)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ has no leaf key '%@'"), objc_opt_class(), v18);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (a3)
    *a3 = objc_retainAutorelease(self);
  if (a5)
  {
    v18 = objc_retainAutorelease(v18);
    *a5 = v18;
  }
LABEL_18:

  return v9;
}

- (BOOL)_applyArchiveValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  PTSettings *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  v10 = -[PTSettings _getChild:create:leafKey:forKeyPath:error:](self, "_getChild:create:leafKey:forKeyPath:error:", &v27, 1, &v26, v9, &v25);
  v11 = (PTSettings *)v27;
  v12 = v26;
  v13 = v25;
  v14 = v13;
  if (!v10)
  {
    if (!a5)
    {
      v17 = 0;
      v16 = v13;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ can't apply value for keyPath '%@' (%@)"), objc_opt_class(), v9, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
LABEL_13:
    v17 = 0;
    *a5 = v18;
    goto LABEL_14;
  }
  v24 = v13;
  v15 = -[PTSettings _applyArchiveValue:forLeafKey:error:](v11, "_applyArchiveValue:forLeafKey:error:", v8, v12, &v24);
  v16 = v24;

  if (!v15)
  {
    if (!a5)
    {
      v17 = 0;
      goto LABEL_14;
    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    if (v11 == self)
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ can't apply value for key '%@' (%@)"), v20, v9, v16, v22, v23);
    else
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ can't apply value for keyPath '%@' because %@ can't apply value for key '%@' (%@)"), v20, v9, objc_opt_class(), v12, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v17 = 1;
LABEL_14:

  return v17;
}

- (id)_archiveValueForKeyPath:(id)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  id v8;
  id v9;

  v8 = 0;
  v9 = 0;
  v3 = -[PTSettings _getChild:create:leafKey:forKeyPath:error:](self, "_getChild:create:leafKey:forKeyPath:error:", &v9, 0, &v8, a3, 0);
  v4 = v9;
  v5 = v8;
  v6 = 0;
  if (v3)
  {
    objc_msgSend(v4, "_archiveValueForLeafKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v8 = *MEMORY[0x1E0CB2CC8];
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    -[PTSettingsClassStructure leafKeys](self->__classStructure, "leafKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v16);

    -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v16);

    if (v13 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
    {
      -[PTSettings _sendKeyChanged:](self, "_sendKeyChanged:", v16);
      -[PTSettings _sendKeyPathChanged:](self, "_sendKeyPathChanged:", v16);
    }
    if (v15 && self->__isObservingChildren)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "removeKeyPathObserver:", self);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v11, "addKeyPathObserver:", self);
    }
  }

}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[PTSettings _keyForChild:](self, "_keyForChild:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTSettings _sendKeyPathChanged:](self, "_sendKeyPathChanged:", v7);

  }
}

- (id)_keyForChild:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PTSettingsClassStructure childKeys](self->__classStructure, "childKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PTSettings valueForKey:](self, "valueForKey:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)_sendKeyChanged:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->__keyObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "settings:changedValueForKey:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_sendKeyPathChanged:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->__keyPathObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "settings:changedValueForKeyPath:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_sendWillRestoreDefaults
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->__restoreDefaultsObserver);
  objc_msgSend(WeakRetained, "settingsWillRestoreDefaults:", self);

}

- (void)_sendDidRestoreDefaults
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->__restoreDefaultsObserver);
  objc_msgSend(WeakRetained, "settingsDidRestoreDefaults:", self);

}

+ (id)emptyArchiveForSettingsClassName:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("_internal_class"));

  return v5;
}

+ (void)_applyArchiveValue:(id)a3 forKeyPath:(id)a4 toArchive:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && (PTObjectIsRecursivelyPlistable(v7) & 1) == 0)
  {
    PTLogObjectForTopic(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1B966F000, v10, OS_LOG_TYPE_DEFAULT, "PTSettings cannot use archive value for keyPath '%@' as it contains non-plist types: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject count](v10, "count");
    if (v11)
    {
      v12 = v11;
      v13 = v9;
      v14 = v13;
      v15 = v12 - 1;
      if (v12 == 1)
      {
        v18 = v13;
      }
      else
      {
        v16 = 0;
        do
        {
          -[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v17);
          }

          ++v16;
          v14 = v18;
        }
        while (v15 != v16);
      }
      -[NSObject lastObject](v10, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, v19);

    }
  }

}

@end
