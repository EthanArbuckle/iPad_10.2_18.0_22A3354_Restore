@implementation PTProxySettings

+ (id)proxyWithDefinition:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PTProxySettings _initWithDefinition:]([PTProxySettings alloc], "_initWithDefinition:", v3);

  return v4;
}

+ (id)settingsOrProxyWithDefinition:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "allSettingsClassesExistAndHaveCorrectVersion"))
  {
    v4 = (objc_class *)objc_msgSend(v3, "settingsClass");

    v5 = (void *)objc_msgSend([v4 alloc], "initWithDefaultValues");
  }
  else
  {
    +[PTProxySettings proxyWithDefinition:](PTProxySettings, "proxyWithDefinition:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_initWithDefinition:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v5 = a3;
  objc_msgSend(v5, "structure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PTProxySettings;
  v7 = -[PTSettings _initWithClassStructure:](&v11, sel__initWithClassStructure_, v6);

  if (v7)
  {
    objc_storeStrong(v7 + 7, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v7[6];
    v7[6] = (id)v8;

    objc_msgSend(v7, "_createChildrenAndOutlets");
    objc_msgSend(v7, "restoreDefaultValues");
  }

  return v7;
}

- (id)module
{
  void *v2;
  void *v3;

  -[PTProxySettingsDefinition module](self->_definition, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithDefinition:", self->_definition);
  objc_msgSend(v4, "applySettings:", self);
  return v4;
}

- (void)restoreDefaultValues
{
  void *v3;

  -[PTSettings _sendWillRestoreDefaults](self, "_sendWillRestoreDefaults");
  -[PTProxySettingsDefinition defaultValueArchive](self->_definition, "defaultValueArchive");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSettings _applyArchiveDictionary:](self, "_applyArchiveDictionary:", v3);

  -[PTSettings _sendDidRestoreDefaults](self, "_sendDidRestoreDefaults");
}

- (void)restoreFromArchiveDictionary:(id)a3
{
  PTProxySettingsDefinition *definition;
  void *v5;
  id v6;

  definition = self->_definition;
  v6 = a3;
  -[PTProxySettingsDefinition defaultValueArchive](definition, "defaultValueArchive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTSettings _applyArchiveDictionary:](self, "_applyArchiveDictionary:", v5);

  -[PTSettings _applyArchiveDictionary:](self, "_applyArchiveDictionary:", v6);
}

- (id)_createChildForKey:(id)a3
{
  PTProxySettingsDefinition *definition;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  definition = self->_definition;
  v4 = a3;
  -[PTProxySettingsDefinition childDefinitions](definition, "childDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PTProxySettings settingsOrProxyWithDefinition:](PTProxySettings, "settingsOrProxyWithDefinition:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PTProxySettingsDefinition structure](self->_definition, "structure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  objc_msgSend(v7, "outletKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  objc_msgSend(v7, "leafKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v6);

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || v13 && (!v14 || PTObjectIsRecursivelyPlistable(v14)))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v14, v6);
  }
  -[PTSettings invalidateValueForKey:](self, "invalidateValueForKey:", v6);

}

- (PTProxySettings)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PTProxySettings forbids -init. Use +proxyForSettings: instead."));

  return 0;
}

+ (id)new
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PTProxySettings forbids +new. Use +proxyForSettings: instead."));
  return 0;
}

- (PTProxySettings)initWithDefaultValues
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PTProxySettings forbids -initWithDefaultValues. Use +proxyForSettings: instead."));

  return 0;
}

+ (id)settingsFromArchiveDictionary:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PTProxySettings forbids +settingsFromArchiveDictionary. Use NSSecureCoding for persistence/IPC."));
  return 0;
}

- (PTProxySettingsDefinition)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
