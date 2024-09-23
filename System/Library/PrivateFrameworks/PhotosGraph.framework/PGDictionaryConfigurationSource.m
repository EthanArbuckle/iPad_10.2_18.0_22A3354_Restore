@implementation PGDictionaryConfigurationSource

- (PGDictionaryConfigurationSource)initWithDictionary:(id)a3
{
  id v5;
  PGDictionaryConfigurationSource *v6;
  PGDictionaryConfigurationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGDictionaryConfigurationSource;
  v6 = -[PGDictionaryConfigurationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationData, a3);

  return v7;
}

- (id)objectForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configurationData, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationData, 0);
}

@end
