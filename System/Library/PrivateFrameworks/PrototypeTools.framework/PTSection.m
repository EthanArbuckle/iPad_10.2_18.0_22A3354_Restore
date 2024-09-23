@implementation PTSection

- (PTSection)initWithRows:(id)a3
{
  id v4;
  PTSection *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSArray *rows;
  uint64_t v14;
  NSMutableArray *enabledRows;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PTSection;
  v5 = -[PTSection init](&v21, sel_init);
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "setSection:", v5, (_QWORD)v17);
          objc_msgSend(v11, "addObserver:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }

    v12 = objc_msgSend(v6, "copy");
    rows = v5->_rows;
    v5->_rows = (NSArray *)v12;

    v5->_enabledSection = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    enabledRows = v5->_enabledRows;
    v5->_enabledRows = (NSMutableArray *)v14;

    -[PTSection _reloadEnabledRows](v5, "_reloadEnabledRows");
  }

  return v5;
}

- (void)dealloc
{
  void (**unregisterBlock)(id, PTSection *);
  objc_super v4;

  -[PTSettings removeKeyPathObserver:](self->_settings, "removeKeyPathObserver:", self);
  unregisterBlock = (void (**)(id, PTSection *))self->_unregisterBlock;
  if (unregisterBlock)
    unregisterBlock[2](unregisterBlock, self);
  v4.receiver = self;
  v4.super_class = (Class)PTSection;
  -[PTSection dealloc](&v4, sel_dealloc);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_settings)
  {
    PTLogObjectForTopic(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B966F000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set settings on a PTSection that already has settings", buf, 2u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_settings, a3);
    -[PTSettings addKeyPathObserver:](self->_settings, "addKeyPathObserver:", self);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_rows;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setSettings:", self->_settings, (_QWORD)v12);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }

    -[PTSection _reloadEnabledRows](self, "_reloadEnabledRows");
    -[PTSection _recomputeEnabledSection](self, "_recomputeEnabledSection");
  }

}

- (unint64_t)numberOfRows
{
  return -[NSMutableArray count](self->_enabledRows, "count");
}

- (id)rowAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_enabledRows, "objectAtIndex:", a3);
}

- (unint64_t)indexOfRow:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_enabledRows, "indexOfObject:", a3);
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[PTSection _updateEnabledRows](self, "_updateEnabledRows", a3, a4);
  -[PTSection _recomputeEnabledSection](self, "_recomputeEnabledSection");
}

- (NSArray)allSections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)enabledSections
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_enabledSection)
  {
    v4[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

- (id)_remoteEditingWhitelistedComponent
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PTSection *v11;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_rows;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)objc_opt_class();
        if (PTRowClassIsWhitelistedForRemoteEditing(v10)
          && objc_msgSend(v9, "isEncodable", (_QWORD)v16))
        {
          objc_msgSend(v3, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = -[PTSection initWithRows:]([PTSection alloc], "initWithRows:", v3);
  -[PTSection title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSection setTitle:](v11, "setTitle:", v12);

  -[PTSection appearancePredicate](self, "appearancePredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSection setAppearancePredicate:](v11, "setAppearancePredicate:", v13);

  -[PTSection childSettingsKeyPath](self, "childSettingsKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSection setChildSettingsKeyPath:](v11, "setChildSettingsKeyPath:", v14);

  return v11;
}

- (void)_recomputeEnabledSection
{
  NSPredicate *appearancePredicate;
  int v4;
  id WeakRetained;

  appearancePredicate = self->_appearancePredicate;
  if (appearancePredicate)
    v4 = -[NSPredicate evaluateWithObject:](appearancePredicate, "evaluateWithObject:", self->_settings);
  else
    v4 = 1;
  if (self->_enabledSection != v4)
  {
    self->_enabledSection = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
    objc_msgSend(WeakRetained, "enabledSectionsDidChange:", self);

  }
}

- (void)_updateEnabledRows
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_rows;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = -[PTSection _shouldEnableRow:](self, "_shouldEnableRow:", v10, v13);
        v12 = -[NSMutableArray containsObject:](self->_enabledRows, "containsObject:", v10);
        if (v12 && !v11)
        {
          objc_msgSend(v13, "addIndex:", v7);
          -[NSMutableArray removeObject:](self->_enabledRows, "removeObject:", v10);
        }
        if (((v12 | !v11) & 1) == 0)
        {
          objc_msgSend(v14, "addIndex:", v6);
          -[NSMutableArray insertObject:atIndex:](self->_enabledRows, "insertObject:atIndex:", v10, v6);
        }
        v7 += v12;
        v6 += v11;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[PTSection _sendInserts:deletes:](self, "_sendInserts:deletes:", v14, v13);
}

- (void)_reloadEnabledRows
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_enabledRows, "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_rows;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (-[PTSection _shouldEnableRow:](self, "_shouldEnableRow:", v8, (_QWORD)v9))
          -[NSMutableArray addObject:](self->_enabledRows, "addObject:", v8);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[PTSection _sendReload](self, "_sendReload");
}

- (BOOL)_shouldEnableRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(void);
  char v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "condition");
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "evaluateWithObject:", self->_settings);
  }
  else
  {
    objc_msgSend(v4, "externalCondition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = 1;
      goto LABEL_6;
    }
    objc_msgSend(v4, "externalCondition");
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v7 = v6[2]();
  }
  v9 = v7;

LABEL_6:
  return v9;
}

- (void)_sendInserts:(id)a3 deletes:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count") || objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
    objc_msgSend(WeakRetained, "section:didInsertRows:deleteRows:", self, v8, v6);

  }
}

- (void)_sendReload
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_componentObserver);
  objc_msgSend(WeakRetained, "sectionDidReload:", self);

}

- (BOOL)isEqual:(id)a3
{
  PTSection *v4;
  char v5;

  v4 = (PTSection *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[PTSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
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
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_rows);
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
  objc_msgSend(v4, "encodeObject:forKey:", self->_rows, CFSTR("rows"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_childSettingsKeyPath, CFSTR("childKeyPath"));
  if (os_variant_allows_internal_security_policies())
    objc_msgSend(v4, "encodeObject:forKey:", self->_appearancePredicate, CFSTR("predicate"));

}

- (PTSection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PTSection *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *childSettingsKeyPath;
  uint64_t v14;
  NSPredicate *appearancePredicate;
  int v16;
  NSPredicate *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("rows"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PTSection initWithRows:](self, "initWithRows:", v8);
  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childKeyPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    childSettingsKeyPath = v9->_childSettingsKeyPath;
    v9->_childSettingsKeyPath = (NSString *)v12;

    if (os_variant_allows_internal_security_policies())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
      v14 = objc_claimAutoreleasedReturnValue();
      appearancePredicate = v9->_appearancePredicate;
      v9->_appearancePredicate = (NSPredicate *)v14;

      v16 = PTValidatePredicate(v9->_appearancePredicate);
      v17 = v9->_appearancePredicate;
      if (v16)
      {
        -[NSPredicate allowEvaluation](v17, "allowEvaluation");
      }
      else
      {
        v9->_appearancePredicate = 0;

      }
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:"), "initWithArray:copyItems:", self->_rows, 1);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRows:", v5);
  objc_msgSend(v6, "setTitle:", self->_title);
  objc_msgSend(v6, "setChildSettingsKeyPath:", self->_childSettingsKeyPath);
  objc_msgSend(v6, "setAppearancePredicate:", self->_appearancePredicate);

  return v6;
}

- (PTSettings)settings
{
  return self->_settings;
}

- (PTComponentObserver)componentObserver
{
  return (PTComponentObserver *)objc_loadWeakRetained((id *)&self->_componentObserver);
}

- (void)setComponentObserver:(id)a3
{
  objc_storeWeak((id *)&self->_componentObserver, a3);
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

- (id)footerTextGetter
{
  return self->_footerTextGetter;
}

- (void)setFooterTextGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterBlock, 0);
  objc_storeStrong(&self->_footerTextGetter, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_childSettingsKeyPath, 0);
  objc_storeStrong((id *)&self->_appearancePredicate, 0);
  objc_destroyWeak((id *)&self->_componentObserver);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_enabledRows, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
