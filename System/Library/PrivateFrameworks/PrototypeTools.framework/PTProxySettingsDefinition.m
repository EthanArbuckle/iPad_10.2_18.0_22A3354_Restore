@implementation PTProxySettingsDefinition

+ (id)definitionForSettingsClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PTProxySettingsDefinition *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[PTSettingsClassStructure structureForSettingsClass:]((uint64_t)PTSettingsClassStructure, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredForProxySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "childKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        +[PTProxySettingsDefinition definitionForSettingsClass:](PTProxySettingsDefinition, "definitionForSettingsClass:", objc_msgSend(v5, "childClassForKey:", v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend([a3 alloc], "initWithDefaultValues");
  objc_msgSend(v14, "archiveDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class settingsControllerModule](a3, "settingsControllerModule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_remoteEditingWhitelistedModule");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(PTProxySettingsDefinition);
  -[PTProxySettingsDefinition setStructure:](v18, "setStructure:", v5);
  -[PTProxySettingsDefinition setChildDefinitions:](v18, "setChildDefinitions:", v6);
  -[PTProxySettingsDefinition setDefaultValueArchive:](v18, "setDefaultValueArchive:", v15);
  -[PTProxySettingsDefinition setModule:](v18, "setModule:", v17);

  return v18;
}

- (Class)settingsClass
{
  NSString *v2;
  Class v3;
  Class v4;

  -[PTSettingsClassStructure settingsClassName](self->_structure, "settingsClassName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = NSClassFromString(v2);

  if (-[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", objc_opt_class()))
    v4 = v3;
  else
    v4 = 0;
  return v4;
}

- (BOOL)allSettingsClassesExistAndHaveCorrectVersion
{
  objc_class *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[PTProxySettingsDefinition settingsClass](self, "settingsClass");
  if (!v3)
    return 0;
  v4 = -[objc_class settingsVersionNumber](v3, "settingsVersionNumber");
  if (v4 != -[PTSettingsClassStructure settingsClassVersion](self->_structure, "settingsClassVersion"))
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSDictionary allValues](self->_childDefinitions, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "allSettingsClassesExistAndHaveCorrectVersion"))
        {
          v10 = 0;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PTProxySettingsDefinition *v4;
  char v5;

  v4 = (PTProxySettingsDefinition *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[PTProxySettingsDefinition isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
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
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_structure);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_childDefinitions);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_defaultValueArchive);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_module);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  PTSettingsClassStructure *structure;
  id v5;

  structure = self->_structure;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", structure, CFSTR("structure"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_childDefinitions, CFSTR("childDefinitions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultValueArchive, CFSTR("defaultValueArchive"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_module, CFSTR("module"));

}

- (PTProxySettingsDefinition)initWithCoder:(id)a3
{
  id v4;
  PTProxySettingsDefinition *v5;
  uint64_t v6;
  PTSettingsClassStructure *structure;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *childDefinitions;
  NSDictionary *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *defaultValueArchive;
  uint64_t v18;
  PTModule *module;

  v4 = a3;
  v5 = -[PTProxySettingsDefinition init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("structure"));
    v6 = objc_claimAutoreleasedReturnValue();
    structure = v5->_structure;
    v5->_structure = (PTSettingsClassStructure *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("childDefinitions"));
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_class();
    if ((PTValidateDictionary(v12) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ expected String->%@ dictionary for '%@', got %@"), CFSTR("PTProxySettingsDescription"), CFSTR("PTProxySettingsDescription"), CFSTR("childDefinitions"), v12);
    childDefinitions = v5->_childDefinitions;
    v5->_childDefinitions = v12;
    v14 = v12;

    PTPlistableClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("defaultValueArchive"));
    v16 = objc_claimAutoreleasedReturnValue();
    defaultValueArchive = v5->_defaultValueArchive;
    v5->_defaultValueArchive = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("module"));
    v18 = objc_claimAutoreleasedReturnValue();
    module = v5->_module;
    v5->_module = (PTModule *)v18;

  }
  return v5;
}

- (PTSettingsClassStructure)structure
{
  return self->_structure;
}

- (void)setStructure:(id)a3
{
  objc_storeStrong((id *)&self->_structure, a3);
}

- (NSDictionary)childDefinitions
{
  return self->_childDefinitions;
}

- (void)setChildDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_childDefinitions, a3);
}

- (NSDictionary)defaultValueArchive
{
  return self->_defaultValueArchive;
}

- (void)setDefaultValueArchive:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValueArchive, a3);
}

- (PTModule)module
{
  return self->_module;
}

- (void)setModule:(id)a3
{
  objc_storeStrong((id *)&self->_module, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_defaultValueArchive, 0);
  objc_storeStrong((id *)&self->_childDefinitions, 0);
  objc_storeStrong((id *)&self->_structure, 0);
}

@end
