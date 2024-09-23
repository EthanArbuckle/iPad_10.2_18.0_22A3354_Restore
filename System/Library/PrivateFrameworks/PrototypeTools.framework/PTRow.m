@implementation PTRow

+ (id)row
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)rowWithTitle:(id)a3 valueKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "staticTitle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueKeyPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)rowWithTitle:(id)a3 valueGetter:(id)a4 valueSetter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "row");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "staticTitle:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setValueGetter:", v9);
  objc_msgSend(v12, "setValueSetter:", v8);

  return v12;
}

- (PTRow)init
{
  PTRow *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTRow;
  v2 = -[PTRow init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)dealloc
{
  void (**unregisterBlock)(id, PTRow *);
  objc_super v4;

  -[PTSettings removeKeyPathObserver:](self->_settings, "removeKeyPathObserver:", self);
  unregisterBlock = (void (**)(id, PTRow *))self->_unregisterBlock;
  if (unregisterBlock)
    unregisterBlock[2](unregisterBlock, self);
  v4.receiver = self;
  v4.super_class = (Class)PTRow;
  -[PTRow dealloc](&v4, sel_dealloc);
}

- (id)valueKeyPath:(id)a3
{
  -[PTRow setValueKeyPath:](self, "setValueKeyPath:", a3);
  return self;
}

- (id)staticTitle:(id)a3
{
  -[PTRow setStaticTitle:](self, "setStaticTitle:", a3);
  return self;
}

- (id)titleKeyPath:(id)a3
{
  -[PTRow setTitleKeyPath:](self, "setTitleKeyPath:", a3);
  return self;
}

- (id)staticImage:(id)a3
{
  -[PTRow setStaticImage:](self, "setStaticImage:", a3);
  return self;
}

- (id)imageKeyPath:(id)a3
{
  -[PTRow setImageKeyPath:](self, "setImageKeyPath:", a3);
  return self;
}

- (id)action:(id)a3
{
  -[PTRow setAction:](self, "setAction:", a3);
  return self;
}

- (id)valueValidator:(id)a3
{
  -[PTRow setValueValidatator:](self, "setValueValidatator:", a3);
  return self;
}

- (id)valueFormatter:(id)a3
{
  -[PTRow setValueFormatter:](self, "setValueFormatter:", a3);
  return self;
}

- (id)condition:(id)a3
{
  -[PTRow setCondition:](self, "setCondition:", a3);
  return self;
}

- (id)conditionFormat:(id)a3
{
  void *v4;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:arguments:", a3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRow setCondition:](self, "setCondition:", v4);

  return self;
}

- (id)title
{
  NSString *staticTitle;

  staticTitle = self->_staticTitle;
  if (staticTitle || !self->_titleKeyPath)
    return staticTitle;
  -[PTSettings valueForKeyPath:](self->_settings, "valueForKeyPath:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)image
{
  UIImage *staticImage;

  staticImage = self->_staticImage;
  if (staticImage || !self->_imageKeyPath)
    return staticImage;
  -[PTSettings valueForKeyPath:](self->_settings, "valueForKeyPath:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PTRowAction)action
{
  PTRowAction *action;

  action = self->_action;
  if (action)
    return action;
  -[PTRow _defaultAction](self, "_defaultAction");
  return (PTRowAction *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)childSettingsForKeyPath:(id)a3
{
  PTSettings *settings;
  PTSettings *v4;

  settings = self->_settings;
  if (a3)
  {
    -[PTSettings valueForKeyPath:](settings, "valueForKeyPath:");
    v4 = (PTSettings *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = settings;
  }
  return v4;
}

- (id)value
{
  uint64_t v3;
  void (**valueGetter)(id, SEL);
  void *v5;
  void (**valueFormatter)(id, void *, PTSettings *);
  id v7;
  void *v8;

  if (self->_valueKeyPath)
  {
    -[PTSettings valueForKeyPath:](self->_settings, "valueForKeyPath:");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v3;
    goto LABEL_6;
  }
  valueGetter = (void (**)(id, SEL))self->_valueGetter;
  if (valueGetter)
  {
    valueGetter[2](valueGetter, a2);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:
  valueFormatter = (void (**)(id, void *, PTSettings *))self->_valueFormatter;
  if (valueFormatter)
  {
    valueFormatter[2](valueFormatter, v5, self->_settings);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)setValue:(id)a3
{
  id v4;
  void (**valueValidatator)(void);
  void *v6;
  void (**valueSetter)(id, void *);
  id v8;

  v4 = a3;
  valueValidatator = (void (**)(void))self->_valueValidatator;
  v8 = v4;
  if (valueValidatator)
    valueValidatator[2]();
  else
    -[PTRow _validatedValue:](self, "_validatedValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_valueKeyPath)
  {
    -[PTSettings setValue:forKeyPath:](self->_settings, "setValue:forKeyPath:", v6);
  }
  else
  {
    valueSetter = (void (**)(id, void *))self->_valueSetter;
    if (valueSetter)
      valueSetter[2](valueSetter, v6);
  }
  if ((objc_msgSend(v6, "isEqual:", v8) & 1) == 0)
    -[PTRow _sendValueChanged](self, "_sendValueChanged");

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setSettings:(id)a3
{
  PTSettings *v5;
  PTSettings *settings;
  PTSettings *v7;

  v5 = (PTSettings *)a3;
  settings = self->_settings;
  if (settings != v5)
  {
    v7 = v5;
    -[PTSettings removeKeyPathObserver:](settings, "removeKeyPathObserver:", self);
    objc_storeStrong((id *)&self->_settings, a3);
    -[PTSettings addKeyPathObserver:](self->_settings, "addKeyPathObserver:", self);
    v5 = v7;
  }

}

- (id)_defaultAction
{
  return 0;
}

- (id)_validatedValue:(id)a3
{
  return a3;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (self->_settings == a3)
  {
    v9 = v6;
    if (objc_msgSend(v6, "isEqualToString:", self->_valueKeyPath))
    {
      -[PTRow _sendValueChanged](self, "_sendValueChanged");
LABEL_8:
      v7 = v9;
      goto LABEL_9;
    }
    if (objc_msgSend(v9, "isEqualToString:", self->_titleKeyPath))
    {
      -[PTRow _sendTitleChanged](self, "_sendTitleChanged");
      goto LABEL_8;
    }
    v8 = objc_msgSend(v9, "isEqualToString:", self->_imageKeyPath);
    v7 = v9;
    if (v8)
    {
      -[PTRow _sendImageChanged](self, "_sendImageChanged");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)_sendValueChanged
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
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "rowDidChangeValue:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendTitleChanged
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
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "rowDidChangeTitle:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendImageChanged
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
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "rowDidChangeImage:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_sendRowDidReload
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
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "rowDidReload:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)isEqual:(id)a3
{
  PTRow *v4;
  char v5;

  v4 = (PTRow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[PTRow isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && BSEqualStrings()
         && BSEqualStrings()
         && BSEqualStrings()
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
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_valueKeyPath);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_staticTitle);
  v6 = (id)objc_msgSend(v3, "appendString:", self->_titleKeyPath);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_imageKeyPath);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_condition);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_action);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setValueKeyPath:", self->_valueKeyPath);
  objc_msgSend(v4, "setStaticTitle:", self->_staticTitle);
  objc_msgSend(v4, "setStaticImage:", self->_staticImage);
  objc_msgSend(v4, "setTitleKeyPath:", self->_titleKeyPath);
  objc_msgSend(v4, "setImageKeyPath:", self->_imageKeyPath);
  objc_msgSend(v4, "setCondition:", self->_condition);
  objc_msgSend(v4, "setAction:", self->_action);
  objc_msgSend(v4, "setValueValidatator:", self->_valueValidatator);
  objc_msgSend(v4, "setValueFormatter:", self->_valueFormatter);
  objc_msgSend(v4, "setValueGetter:", self->_valueGetter);
  objc_msgSend(v4, "setValueSetter:", self->_valueSetter);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_valueKeyPath, CFSTR("valueKeyPath"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_staticTitle, CFSTR("staticTitle"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_titleKeyPath, CFSTR("titleKeyPath"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_imageKeyPath, CFSTR("imageKeyPath"));
  -[NSPredicate predicateFormat](self->_condition, "predicateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("BLOCKPREDICATE"));

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** The NSPredicate provided for -[PTRow condition] is a block based predicate, which cannot be encoded. ***"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v9);
  }
  if (os_variant_allows_internal_security_policies())
    objc_msgSend(v10, "encodeObject:forKey:", self->_condition, CFSTR("condition"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_action, CFSTR("action"));

}

- (PTRow)initWithCoder:(id)a3
{
  id v4;
  PTRow *v5;
  uint64_t v6;
  NSString *valueKeyPath;
  uint64_t v8;
  NSString *staticTitle;
  uint64_t v10;
  NSString *titleKeyPath;
  uint64_t v12;
  NSString *imageKeyPath;
  uint64_t v14;
  PTRowAction *action;
  uint64_t v16;
  NSPredicate *condition;
  int v18;
  NSPredicate *v19;

  v4 = a3;
  v5 = (PTRow *)objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueKeyPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    valueKeyPath = v5->_valueKeyPath;
    v5->_valueKeyPath = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    staticTitle = v5->_staticTitle;
    v5->_staticTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKeyPath"));
    v10 = objc_claimAutoreleasedReturnValue();
    titleKeyPath = v5->_titleKeyPath;
    v5->_titleKeyPath = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageKeyPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageKeyPath = v5->_imageKeyPath;
    v5->_imageKeyPath = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v14 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (PTRowAction *)v14;

    if (os_variant_allows_internal_security_policies())
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("condition"));
      v16 = objc_claimAutoreleasedReturnValue();
      condition = v5->_condition;
      v5->_condition = (NSPredicate *)v16;

      v18 = PTValidatePredicate(v5->_condition);
      v19 = v5->_condition;
      if (v18)
      {
        -[NSPredicate allowEvaluation](v19, "allowEvaluation");
      }
      else
      {
        v5->_condition = 0;

      }
    }
  }

  return v5;
}

- (BOOL)isEncodable
{
  void *v3;
  int IsWhitelistedForRemoteEditing;

  if (self->_action)
  {
    v3 = (void *)objc_opt_class();
    IsWhitelistedForRemoteEditing = PTRowActionClassIsWhitelistedForRemoteEditing(v3);
    if (IsWhitelistedForRemoteEditing)
      LOBYTE(IsWhitelistedForRemoteEditing) = -[PTRowAction isEncodable](self->_action, "isEncodable");
  }
  else
  {
    LOBYTE(IsWhitelistedForRemoteEditing) = 1;
  }
  return IsWhitelistedForRemoteEditing;
}

- (NSString)valueKeyPath
{
  return self->_valueKeyPath;
}

- (void)setValueKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)staticTitle
{
  return self->_staticTitle;
}

- (void)setStaticTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)titleKeyPath
{
  return self->_titleKeyPath;
}

- (void)setTitleKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)staticImage
{
  return self->_staticImage;
}

- (void)setStaticImage:(id)a3
{
  objc_storeStrong((id *)&self->_staticImage, a3);
}

- (NSString)imageKeyPath
{
  return self->_imageKeyPath;
}

- (void)setImageKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)valueValidatator
{
  return self->_valueValidatator;
}

- (void)setValueValidatator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)valueFormatter
{
  return self->_valueFormatter;
}

- (void)setValueFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)valueGetter
{
  return self->_valueGetter;
}

- (void)setValueGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)valueSetter
{
  return self->_valueSetter;
}

- (void)setValueSetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)externalCondition
{
  return self->_externalCondition;
}

- (void)setExternalCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (PTSection)section
{
  return (PTSection *)objc_loadWeakRetained((id *)&self->_section);
}

- (void)setSection:(id)a3
{
  objc_storeWeak((id *)&self->_section, a3);
}

- (void)setIsEncodable:(BOOL)a3
{
  self->_isEncodable = a3;
}

- (PTSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong(&self->_unregisterBlock, 0);
  objc_storeStrong(&self->_externalCondition, 0);
  objc_storeStrong(&self->_valueSetter, 0);
  objc_storeStrong(&self->_valueGetter, 0);
  objc_storeStrong(&self->_valueFormatter, 0);
  objc_storeStrong(&self->_valueValidatator, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_imageKeyPath, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
  objc_storeStrong((id *)&self->_titleKeyPath, 0);
  objc_storeStrong((id *)&self->_staticTitle, 0);
  objc_storeStrong((id *)&self->_valueKeyPath, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
