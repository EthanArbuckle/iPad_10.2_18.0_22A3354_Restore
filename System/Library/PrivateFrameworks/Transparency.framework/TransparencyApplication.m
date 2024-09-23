@implementation TransparencyApplication

- (TransparencyApplication)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  TransparencyApplication *v7;
  TransparencyApplication *v8;
  TransparencyApplication *v9;
  objc_super v11;

  v5 = a3;
  if (initializeApplicationIdentifierMaps_once != -1)
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_10);
  objc_msgSend((id)kApplicationIdentifierMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)TransparencyApplication;
    v7 = -[TransparencyApplication init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_applicationIdentifier, a3);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)applicationValueForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = initializeApplicationIdentifierMaps_once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_10);
  objc_msgSend((id)kApplicationIdentifierMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)applicationIdentifierForValue:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = initializeApplicationIdentifierMaps_once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_10);
  objc_msgSend((id)kApplicationEnumMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)applicationPrefixForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = initializeApplicationIdentifierMaps_once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_10);
  objc_msgSend((id)kApplicationIdentifierToUriPrefixMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)idsServiceForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = initializeApplicationIdentifierMaps_once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&initializeApplicationIdentifierMaps_once, &__block_literal_global_10);
  objc_msgSend((id)kApplicationIDSServiceMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)addApplicationPrefixForIdentifier:(id)a3 uri:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationPrefixForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasPrefix:", v7))
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@"), v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)stripApplicationPrefixForIdentifier:(id)a3 uri:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "applicationPrefixForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasPrefix:", v9))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v9, "length"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
