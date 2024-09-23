@implementation PTSettingsClassStructure

- (NSSet)childKeys
{
  return self->_childKeys;
}

+ (PTSettingsClassStructure)structureForSettingsClass:(uint64_t)a1
{
  void *v3;
  PTSettingsClassStructure *v4;
  uint64_t v5;
  NSDictionary *v6;
  objc_property_t *v7;
  objc_property_t *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_property *v12;
  const char *Name;
  id v14;
  const char *Attributes;
  void *v16;
  void *v17;
  NSString *v18;
  int v19;
  NSString *v20;
  Class v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  objc_class *v27;
  char v28;
  void *v29;
  NSDictionary *v30;
  Class v31;
  void *v32;
  NSDictionary *classes;
  NSDictionary *v34;
  NSDictionary *structNames;
  NSDictionary *v36;
  objc_class *aClass;
  uint64_t v39;
  NSDictionary *v40;
  NSDictionary *v41;
  void *v42;
  void *v43;
  void *v44;
  NSDictionary *v45;
  id v46;
  id v47;
  NSDictionary *v48;
  id v49;
  objc_class *v50;
  unsigned int outCount;
  id v52;
  id v53;

  objc_opt_self();
  if (structureForSettingsClass__onceToken != -1)
    dispatch_once(&structureForSettingsClass__onceToken, &__block_literal_global_1);
  os_unfair_lock_lock((os_unfair_lock_t)&structureForSettingsClass____lock);
  objc_msgSend((id)structureForSettingsClass___classStructureCache, "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v41 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_class();
    aClass = a2;
    if (!-[objc_class isSubclassOfClass:](a2, "isSubclassOfClass:", v5) || (objc_class *)v5 == a2)
    {
LABEL_36:
      v4 = objc_alloc_init(PTSettingsClassStructure);
      NSStringFromClass(aClass);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTSettingsClassStructure setSettingsClassName:](v4, "setSettingsClassName:", v32);

      -[PTSettingsClassStructure setSettingsClassVersion:](v4, "setSettingsClassVersion:", -[objc_class settingsVersionNumber](aClass, "settingsVersionNumber"));
      -[PTSettingsClassStructure setLeafKeys:](v4, "setLeafKeys:", v44);
      -[PTSettingsClassStructure setChildKeys:](v4, "setChildKeys:", v43);
      -[PTSettingsClassStructure setOutletKeys:](v4, "setOutletKeys:", v42);
      classes = v4->_classes;
      v4->_classes = v40;
      v34 = v40;

      structNames = v4->_structNames;
      v4->_structNames = v41;
      v36 = v41;

      objc_msgSend((id)structureForSettingsClass___classStructureCache, "setObject:forKey:", v4, aClass);
      os_unfair_lock_unlock((os_unfair_lock_t)&structureForSettingsClass____lock);

      v3 = 0;
      goto LABEL_37;
    }
    v39 = v5;
    while (1)
    {
      v49 = v43;
      v47 = v42;
      v46 = v44;
      v48 = v40;
      v6 = v41;
      outCount = 0;
      v7 = class_copyPropertyList(a2, &outCount);
      if (v7)
      {
        v8 = v7;
        v50 = a2;
        v45 = v6;
        if (_NSObjectProtocolProperties_onceToken != -1)
          dispatch_once(&_NSObjectProtocolProperties_onceToken, &__block_literal_global_88);
        v9 = (id)_NSObjectProtocolProperties___properties;
        if (outCount)
        {
          v10 = 0;
          while (1)
          {
            v11 = (void *)MEMORY[0x1BCCC24B8]();
            v12 = v8[v10];
            Name = property_getName(v12);
            _NSStringFromRuntimeString(Name);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            Attributes = property_getAttributes(v12);
            _NSStringFromRuntimeString(Attributes);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            if (objc_msgSend(v17, "scanString:intoString:", CFSTR("T@\"), 0)
              && (v53 = 0,
                  v19 = objc_msgSend(v17, "scanUpToString:intoString:", CFSTR("\"), &v53),
                  v20 = (NSString *)v53,
                  v18 = v20,
                  v19))
            {
              v21 = NSClassFromString(v20);
              v22 = 0;
            }
            else
            {
              objc_msgSend(v17, "setScanLocation:", 0);
              v23 = 0;
              if (objc_msgSend(v17, "scanString:intoString:", CFSTR("T{"), 0)
                && (v52 = 0,
                    v24 = objc_msgSend(v17, "scanUpToString:intoString:", CFSTR("="), &v52),
                    v25 = v52,
                    v23 = v25,
                    v24))
              {
                v22 = objc_retainAutorelease(v25);
                v23 = v22;
              }
              else
              {
                objc_msgSend(v17, "setScanLocation:", 0);
                v22 = 0;
              }

              v21 = 0;
            }

            v26 = v14;
            v27 = (objc_class *)v22;
            if ((objc_msgSend(v9, "containsObject:", v26) & 1) != 0
              || (-[objc_class ignoresKey:](v50, "ignoresKey:", v26) & 1) != 0)
            {
              goto LABEL_32;
            }
            v28 = -[objc_class isSubclassOfClass:](v21, "isSubclassOfClass:", objc_opt_class());
            v29 = v49;
            if ((v28 & 1) == 0)
            {
              if (-[objc_class isSubclassOfClass:](v21, "isSubclassOfClass:", objc_opt_class()))
                v29 = v47;
              else
                v29 = v46;
            }
            objc_msgSend(v29, "addObject:", v26);
            if (v21)
              break;
            if (v27)
            {
              v30 = v45;
              v31 = v27;
              goto LABEL_31;
            }
LABEL_32:

            objc_autoreleasePoolPop(v11);
            if (++v10 >= (unint64_t)outCount)
              goto LABEL_33;
          }
          v30 = v48;
          v31 = v21;
LABEL_31:
          -[NSDictionary setObject:forKey:](v30, "setObject:forKey:", v31, v26);
          goto LABEL_32;
        }
LABEL_33:
        free(v8);

        v5 = v39;
        a2 = v50;
        v6 = v45;
      }

      a2 = (objc_class *)-[objc_class superclass](a2, "superclass");
      if (!-[objc_class isSubclassOfClass:](a2, "isSubclassOfClass:", v5) || a2 == (objc_class *)v5)
        goto LABEL_36;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&structureForSettingsClass____lock);
  v4 = v3;
LABEL_37:

  return v4;
}

- (Class)_classForKey:(id)a3
{
  NSDictionary *classes;
  void *v5;
  NSString *v6;

  classes = self->_classes;
  if (classes)
  {
    -[NSDictionary objectForKeyedSubscript:](classes, "objectForKeyedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_classNames, "objectForKeyedSubscript:", a3);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (Class)v5;
}

- (void)setSettingsClassVersion:(unint64_t)a3
{
  self->_settingsClassVersion = a3;
}

- (void)setSettingsClassName:(id)a3
{
  objc_storeStrong((id *)&self->_settingsClassName, a3);
}

- (void)setOutletKeys:(id)a3
{
  objc_storeStrong((id *)&self->_outletKeys, a3);
}

- (void)setLeafKeys:(id)a3
{
  objc_storeStrong((id *)&self->_leafKeys, a3);
}

- (void)setChildKeys:(id)a3
{
  objc_storeStrong((id *)&self->_childKeys, a3);
}

void __54__PTSettingsClassStructure_structureForSettingsClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)structureForSettingsClass___classStructureCache;
  structureForSettingsClass___classStructureCache = v0;

}

- (id)filteredForProxySettings
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  objc_class *v10;
  NSObject *v11;
  NSString *settingsClassName;
  objc_class *v13;
  objc_class *v14;
  NSObject *v15;
  NSString *v16;
  PTSettingsClassStructure *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *classes;
  uint64_t v21;
  NSDictionary *classNames;
  NSDictionary *structNames;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  objc_class *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PTSettingsClassStructure _generateClassNamesIfNecessary](self, "_generateClassNamesIfNecessary");
  v26 = (void *)-[NSDictionary mutableCopy](self->_classes, "mutableCopy");
  v25 = (void *)-[NSDictionary mutableCopy](self->_classNames, "mutableCopy");
  v3 = (void *)-[NSSet mutableCopy](self->_leafKeys, "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = self->_leafKeys;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[PTSettingsClassStructure leafStructNameForKey:](self, "leafStructNameForKey:", v9);
        v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          PTLogObjectForTopic(0);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            settingsClassName = self->_settingsClassName;
            *(_DWORD *)buf = 138412802;
            v32 = settingsClassName;
            v33 = 2112;
            v34 = v9;
            v35 = 2112;
            v36 = v10;
            _os_log_impl(&dword_1B966F000, v11, OS_LOG_TYPE_DEFAULT, "Proxy for %@ will omit key '%@', as %@ is a struct", buf, 0x20u);
          }

          objc_msgSend(v3, "removeObject:", v9);
        }
        v13 = -[PTSettingsClassStructure leafClassForKey:](self, "leafClassForKey:", v9);
        if (v13)
        {
          v14 = v13;
          if ((PTClassIsPlistable() & 1) == 0)
          {
            PTLogObjectForTopic(0);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = self->_settingsClassName;
              *(_DWORD *)buf = 138412802;
              v32 = v16;
              v33 = 2112;
              v34 = v9;
              v35 = 2112;
              v36 = v14;
              _os_log_impl(&dword_1B966F000, v15, OS_LOG_TYPE_DEFAULT, "Proxy for %@ will omit key '%@', as %@ is not a plist type", buf, 0x20u);
            }

            objc_msgSend(v3, "removeObject:", v9);
            objc_msgSend(v26, "setObject:forKeyedSubscript:", 0, v9);
            objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v9);
          }
        }

      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v6);
  }

  v17 = objc_alloc_init(PTSettingsClassStructure);
  -[PTSettingsClassStructure setSettingsClassName:](v17, "setSettingsClassName:", self->_settingsClassName);
  -[PTSettingsClassStructure setSettingsClassVersion:](v17, "setSettingsClassVersion:", self->_settingsClassVersion);
  -[PTSettingsClassStructure setChildKeys:](v17, "setChildKeys:", self->_childKeys);
  -[PTSettingsClassStructure setOutletKeys:](v17, "setOutletKeys:", self->_outletKeys);
  v18 = (void *)objc_msgSend(v3, "copy");
  -[PTSettingsClassStructure setLeafKeys:](v17, "setLeafKeys:", v18);

  v19 = objc_msgSend(v26, "copy");
  classes = v17->_classes;
  v17->_classes = (NSDictionary *)v19;

  v21 = objc_msgSend(v25, "copy");
  classNames = v17->_classNames;
  v17->_classNames = (NSDictionary *)v21;

  structNames = v17->_structNames;
  v17->_structNames = (NSDictionary *)MEMORY[0x1E0C9AA70];

  return v17;
}

- (id)leafStructNameForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_structNames, "objectForKeyedSubscript:", a3);
}

- (void)_generateClassNamesIfNecessary
{
  NSDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSDictionary *classNames;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_classNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSDictionary allKeys](self->_classes, "allKeys", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          NSStringFromClass((Class)-[NSDictionary objectForKeyedSubscript:](self->_classes, "objectForKeyedSubscript:", v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    classNames = self->_classNames;
    self->_classNames = v3;

  }
}

- (BOOL)isEqual:(id)a3
{
  PTSettingsClassStructure *v4;
  char v5;

  v4 = (PTSettingsClassStructure *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    -[PTSettingsClassStructure _generateClassNamesIfNecessary](self, "_generateClassNamesIfNecessary");
    if (-[PTSettingsClassStructure isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && BSEqualStrings()
      && self->_settingsClassVersion == v4->_settingsClassVersion
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v5 = BSEqualObjects();
    }
    else
    {
      v5 = 0;
    }
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
  id v10;
  unint64_t v11;

  -[PTSettingsClassStructure _generateClassNamesIfNecessary](self, "_generateClassNamesIfNecessary");
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_settingsClassName);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_settingsClassVersion);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_leafKeys);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_childKeys);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_outletKeys);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_classNames);
  v10 = (id)objc_msgSend(v3, "appendObject:", self->_structNames);
  v11 = objc_msgSend(v3, "hash");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[PTSettingsClassStructure _generateClassNamesIfNecessary](self, "_generateClassNamesIfNecessary");
  objc_msgSend(v4, "encodeObject:forKey:", self->_settingsClassName, CFSTR("settingsClassName"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_settingsClassVersion, CFSTR("settingsClassVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_leafKeys, CFSTR("leafKeys"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_childKeys, CFSTR("childKeys"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outletKeys, CFSTR("outletKeys"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_classNames, CFSTR("classNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_structNames, CFSTR("structNames"));

}

- (PTSettingsClassStructure)initWithCoder:(id)a3
{
  id v4;
  PTSettingsClassStructure *v5;
  uint64_t v6;
  NSString *settingsClassName;
  uint64_t v8;
  NSSet *leafKeys;
  uint64_t v10;
  NSSet *childKeys;
  uint64_t v12;
  NSSet *outletKeys;
  uint64_t v14;
  NSDictionary *structNames;
  uint64_t v16;
  NSDictionary *classNames;

  v4 = a3;
  v5 = -[PTSettingsClassStructure init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsClassName"));
    v6 = objc_claimAutoreleasedReturnValue();
    settingsClassName = v5->_settingsClassName;
    v5->_settingsClassName = (NSString *)v6;

    v5->_settingsClassVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("settingsClassVersion"));
    -[PTSettingsClassStructure _decodeStringSetForKey:withCoder:](v5, "_decodeStringSetForKey:withCoder:", CFSTR("leafKeys"), v4);
    v8 = objc_claimAutoreleasedReturnValue();
    leafKeys = v5->_leafKeys;
    v5->_leafKeys = (NSSet *)v8;

    -[PTSettingsClassStructure _decodeStringSetForKey:withCoder:](v5, "_decodeStringSetForKey:withCoder:", CFSTR("childKeys"), v4);
    v10 = objc_claimAutoreleasedReturnValue();
    childKeys = v5->_childKeys;
    v5->_childKeys = (NSSet *)v10;

    -[PTSettingsClassStructure _decodeStringSetForKey:withCoder:](v5, "_decodeStringSetForKey:withCoder:", CFSTR("outletKeys"), v4);
    v12 = objc_claimAutoreleasedReturnValue();
    outletKeys = v5->_outletKeys;
    v5->_outletKeys = (NSSet *)v12;

    -[PTSettingsClassStructure _decodeStringStringDictionaryForKey:withCoder:](v5, "_decodeStringStringDictionaryForKey:withCoder:", CFSTR("structNames"), v4);
    v14 = objc_claimAutoreleasedReturnValue();
    structNames = v5->_structNames;
    v5->_structNames = (NSDictionary *)v14;

    -[PTSettingsClassStructure _decodeStringStringDictionaryForKey:withCoder:](v5, "_decodeStringStringDictionaryForKey:withCoder:", CFSTR("classNames"), v4);
    v16 = objc_claimAutoreleasedReturnValue();
    classNames = v5->_classNames;
    v5->_classNames = (NSDictionary *)v16;

  }
  return v5;
}

- (id)_decodeStringStringDictionaryForKey:(id)a3 withCoder:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_opt_class();
  if ((PTValidateDictionary(v10) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ expected [String:String] dictionary for '%@'; got %@"),
      objc_opt_class(),
      v5,
      v10);

  return v10;
}

- (id)_decodeStringSetForKey:(id)a3 withCoder:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((PTValidateSet(v10) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ expected set of Strings for '%@'; got %@"),
      objc_opt_class(),
      v5,
      v10);

  return v10;
}

- (NSString)settingsClassName
{
  return self->_settingsClassName;
}

- (unint64_t)settingsClassVersion
{
  return self->_settingsClassVersion;
}

- (NSSet)leafKeys
{
  return self->_leafKeys;
}

- (NSSet)outletKeys
{
  return self->_outletKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outletKeys, 0);
  objc_storeStrong((id *)&self->_childKeys, 0);
  objc_storeStrong((id *)&self->_leafKeys, 0);
  objc_storeStrong((id *)&self->_settingsClassName, 0);
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_structNames, 0);
}

@end
