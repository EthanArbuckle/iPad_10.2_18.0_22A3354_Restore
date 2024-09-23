@implementation PTModule

+ (PTModule)moduleWithTitle:(id)a3 contents:(id)a4
{
  id v5;
  id v6;
  PTModule *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PTModule initWithContents:]([PTModule alloc], "initWithContents:", v5);

  -[PTModule setTitle:](v7, "setTitle:", v6);
  return v7;
}

+ (id)sectionWithRows:(id)a3
{
  return (id)objc_msgSend(a1, "sectionWithRows:title:", a3, 0);
}

+ (id)sectionWithRows:(id)a3 title:(id)a4
{
  return (id)objc_msgSend(a1, "sectionWithRows:title:conditionFormat:", a3, a4, 0);
}

+ (id)sectionWithRows:(id)a3 title:(id)a4 conditionFormat:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:arguments:", a5, &v12);
    a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "sectionWithRows:title:condition:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sectionWithRows:(id)a3 title:(id)a4 condition:(id)a5
{
  id v7;
  id v8;
  id v9;
  PTSection *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PTSection initWithRows:]([PTSection alloc], "initWithRows:", v9);

  -[PTSection setTitle:](v10, "setTitle:", v8);
  -[PTSection setAppearancePredicate:](v10, "setAppearancePredicate:", v7);

  return v10;
}

+ (id)submoduleWithModule:(id)a3
{
  return (id)objc_msgSend(a1, "submoduleWithModule:childSettingsKeyPath:", a3, 0);
}

+ (id)submoduleWithModule:(id)a3 childSettingsKeyPath:(id)a4
{
  return (id)objc_msgSend(a1, "submoduleWithModule:childSettingsKeyPath:condition:", a3, a4, 0);
}

+ (id)submoduleWithModule:(id)a3 childSettingsKeyPath:(id)a4 condition:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "setChildSettingsKeyPath:", a4);
  objc_msgSend(v7, "setAppearancePredicate:", v8);

  return v7;
}

+ (PTModule)moduleWithSettings:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSettings:", v3);

  return (PTModule *)v4;
}

- (PTModule)initWithContents:(id)a3
{
  id v4;
  PTModule *v5;
  uint64_t v6;
  NSHashTable *observers;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *components;
  uint64_t v19;
  NSArray *allSections;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PTModule;
  v5 = -[PTModule init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF22DE10, (_QWORD)v22))
          {
            objc_msgSend(v15, "setComponentObserver:", v5);
            objc_msgSend(v8, "addObject:", v15);
            objc_msgSend(v15, "allSections");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObjectsFromArray:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

    v17 = objc_msgSend(v8, "copy");
    components = v5->_components;
    v5->_components = (NSArray *)v17;

    v19 = objc_msgSend(v9, "copy");
    allSections = v5->_allSections;
    v5->_allSections = (NSArray *)v19;

    objc_storeStrong((id *)&v5->_enabledSections, v5->_allSections);
  }

  return v5;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  v3 = self->_components;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setComponentObserver:", 0);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[PTSettings removeKeyPathObserver:](self->_settings, "removeKeyPathObserver:", self);
  v8.receiver = self;
  v8.super_class = (Class)PTModule;
  -[PTModule dealloc](&v8, sel_dealloc);
}

- (void)setSettings:(id)a3
{
  id v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_settings)
  {
    PTLogObjectForTopic(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set settings on a module that already has settings", buf, 2u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_settings, a3);
    -[PTSettings addKeyPathObserver:](self->_settings, "addKeyPathObserver:", self);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_components;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "settings", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            -[PTModule _settingsForComponent:](self, "_settingsForComponent:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setSettings:", v14);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    -[PTModule _updateEnabledSections](self, "_updateEnabledSections");
  }

}

- (unint64_t)numberOfSections
{
  return -[NSArray count](self->_enabledSections, "count");
}

- (id)sectionAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_enabledSections, "objectAtIndex:", a3);
}

- (id)rowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PTModule sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v4, "pt_section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "pt_row");

  objc_msgSend(v5, "rowAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)indexPathForRow:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  uint64_t v7;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray indexOfObject:](self->_enabledSections, "indexOfObject:", v5);
  v7 = objc_msgSend(v5, "indexOfRow:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "pt_indexPathForRow:inSection:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)section:(id)a3 didInsertRows:(id)a4 deleteRows:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSHashTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  NSUInteger v29;
  _QWORD v30[4];
  id v31;
  NSUInteger v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  objc_msgSend(WeakRetained, "section:didInsertRows:deleteRows:", v8, v9, v10);

  if (-[NSHashTable count](self->_observers, "count"))
  {
    v12 = -[NSArray indexOfObject:](self->_enabledSections, "indexOfObject:", v8);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __45__PTModule_section_didInsertRows_deleteRows___block_invoke;
      v30[3] = &unk_1E7058528;
      v16 = v14;
      v31 = v16;
      v32 = v13;
      objc_msgSend(v9, "enumerateIndexesUsingBlock:", v30);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v27[0] = v15;
      v27[1] = 3221225472;
      v27[2] = __45__PTModule_section_didInsertRows_deleteRows___block_invoke_2;
      v27[3] = &unk_1E7058528;
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v17;
      v29 = v13;
      objc_msgSend(v10, "enumerateIndexesUsingBlock:", v27);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = self->_observers;
      v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "module:didInsertRows:deleteRows:", self, v16, v17, (_QWORD)v23);
          }
          v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        }
        while (v20);
      }

    }
  }

}

void __45__PTModule_section_didInsertRows_deleteRows___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "pt_indexPathForRow:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __45__PTModule_section_didInsertRows_deleteRows___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "pt_indexPathForRow:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)sectionDidReload:(id)a3
{
  id v4;
  id WeakRetained;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  objc_msgSend(WeakRetained, "sectionDidReload:", v4);

  if (-[NSHashTable count](self->_observers, "count")
    && -[NSArray indexOfObject:](self->_enabledSections, "indexOfObject:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "moduleDidReload:", self, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateEnabledSections
{
  NSArray *v3;
  NSArray *enabledSections;
  id WeakRetained;
  NSArray *v6;

  v6 = self->_enabledSections;
  -[PTModule _computeEnabledSections](self, "_computeEnabledSections");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  enabledSections = self->_enabledSections;
  self->_enabledSections = v3;

  if (!-[NSArray isEqualToArray:](self->_enabledSections, "isEqualToArray:", v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
    objc_msgSend(WeakRetained, "enabledSectionsDidChange:", self);

    -[PTModule _reportSectionInsertsAndDeletesRelativeTo:](self, "_reportSectionInsertsAndDeletesRelativeTo:", v6);
  }

}

- (id)_computeEnabledSections
{
  NSPredicate *appearancePredicate;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  appearancePredicate = self->_appearancePredicate;
  if (appearancePredicate
    && !-[NSPredicate evaluateWithObject:](appearancePredicate, "evaluateWithObject:", self->_settings))
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_components;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "enabledSections", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (void)_reportSectionInsertsAndDeletesRelativeTo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _BOOL4 v13;
  unsigned int v14;
  NSHashTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSArray *obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  if (-[NSHashTable count](self->_observers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = self->_allSections;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v13 = -[NSArray containsObject:](self->_enabledSections, "containsObject:", v12);
          v14 = objc_msgSend(v21, "containsObject:", v12);
          if (v14 && !v13)
            objc_msgSend(v5, "addIndex:", v9);
          if (((v14 | !v13) & 1) == 0)
            objc_msgSend(v4, "addIndex:", v8);
          v9 += v14;
          v8 += v13;
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = self->_observers;
      v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "module:didInsertSections:deleteSections:", self, v4, v5);
          }
          v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v17);
      }

    }
  }

}

- (id)_settingsForComponent:(id)a3
{
  void *v4;
  PTSettings *settings;
  PTSettings *v6;
  PTSettings *v7;

  objc_msgSend(a3, "childSettingsKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  if (v4)
  {
    -[PTSettings valueForKeyPath:](settings, "valueForKeyPath:", v4);
    v6 = (PTSettings *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = settings;
  }
  v7 = v6;

  return v7;
}

- (id)_remoteEditingWhitelistedModule
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_components;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "_remoteEditingWhitelistedComponent", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  -[PTModule title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTModule appearancePredicate](self, "appearancePredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppearancePredicate:", v12);

  -[PTModule childSettingsKeyPath](self, "childSettingsKeyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setChildSettingsKeyPath:", v13);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PTModule *v4;
  char v5;

  v4 = (PTModule *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[PTModule isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && BSEqualObjects()
         && BSEqualStrings()
         && BSEqualObjects())
  {
    v5 = BSEqualObjects();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_components);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_title);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_appearancePredicate);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_childSettingsKeyPath);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_components, CFSTR("components"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_childSettingsKeyPath, CFSTR("childKeyPath"));
  if (os_variant_allows_internal_security_policies())
    objc_msgSend(v4, "encodeObject:forKey:", self->_appearancePredicate, CFSTR("predicate"));

}

- (PTModule)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PTModule *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *childSettingsKeyPath;
  uint64_t v15;
  NSPredicate *appearancePredicate;
  int v17;
  NSPredicate *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("components"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PTModule initWithContents:](self, "initWithContents:", v9);
  if (v10)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v10->_title;
    v10->_title = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childKeyPath"));
    v13 = objc_claimAutoreleasedReturnValue();
    childSettingsKeyPath = v10->_childSettingsKeyPath;
    v10->_childSettingsKeyPath = (NSString *)v13;

    if (os_variant_allows_internal_security_policies())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
      v15 = objc_claimAutoreleasedReturnValue();
      appearancePredicate = v10->_appearancePredicate;
      v10->_appearancePredicate = (NSPredicate *)v15;

      v17 = PTValidatePredicate(v10->_appearancePredicate);
      v18 = v10->_appearancePredicate;
      if (v17)
      {
        -[NSPredicate allowEvaluation](v18, "allowEvaluation");
      }
      else
      {
        v10->_appearancePredicate = 0;

      }
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_components, 1);
  -[PTModule title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTModule childSettingsKeyPath](self, "childSettingsKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setChildSettingsKeyPath:", v7);

  -[PTModule appearancePredicate](self, "appearancePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppearancePredicate:", v8);

  return v6;
}

- (PTComponentObserver)componentObserver
{
  return (PTComponentObserver *)objc_loadWeakRetained((id *)&self->_componentObserver);
}

- (void)setComponentObserver:(id)a3
{
  objc_storeWeak((id *)&self->_componentObserver, a3);
}

- (PTSettings)settings
{
  return self->_settings;
}

- (NSArray)allSections
{
  return self->_allSections;
}

- (NSArray)enabledSections
{
  return self->_enabledSections;
}

- (NSPredicate)appearancePredicate
{
  return self->_appearancePredicate;
}

- (void)setAppearancePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_appearancePredicate, a3);
}

- (NSString)childSettingsKeyPath
{
  return self->_childSettingsKeyPath;
}

- (void)setChildSettingsKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_childSettingsKeyPath, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_childSettingsKeyPath, 0);
  objc_storeStrong((id *)&self->_appearancePredicate, 0);
  objc_storeStrong((id *)&self->_enabledSections, 0);
  objc_storeStrong((id *)&self->_allSections, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_componentObserver);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
