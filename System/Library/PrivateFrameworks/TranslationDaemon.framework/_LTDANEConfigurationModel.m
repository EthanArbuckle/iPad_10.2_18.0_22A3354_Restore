@implementation _LTDANEConfigurationModel

- (_LTDANEConfigurationModel)initWithDictionary:(id)a3
{
  id v5;
  _LTDANEConfigurationModel *v6;
  _LTDANEConfigurationModel *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *v11;
  char v12;
  NSDictionary *v13;
  NSDictionary *capabilities;
  _LTDANEConfigurationModel *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTDANEConfigurationModel;
  v6 = -[_LTDANEConfigurationModel init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_root, a3);
    -[NSDictionary objectForKeyedSubscript:](v7->_root, "objectForKeyedSubscript:", CFSTR("FamilyCapability"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = v8;
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v12 = -[NSDictionary lt_ensureTypesForKeys:values:](v11, "lt_ensureTypesForKeys:values:", v9, v10),
          v13 = v11,
          (v12 & 1) == 0))
    {

      v13 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    }

    capabilities = v7->_capabilities;
    v7->_capabilities = v13;

    v15 = v7;
  }

  return v7;
}

- (int64_t)capabilityForSubType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_capabilities, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_capabilities, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "integerValue");

  return v8;
}

- (id)subTypes
{
  return -[NSDictionary allKeys](self->_capabilities, "allKeys");
}

- (id)debugDescription
{
  return (id)-[NSDictionary debugDescription](self->_root, "debugDescription");
}

- (NSString)config
{
  return self->_config;
}

- (NSDictionary)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
