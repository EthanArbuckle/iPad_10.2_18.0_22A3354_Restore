@implementation PGUserDefaultsConfigurationSource

- (PGUserDefaultsConfigurationSource)initWithUserDefaults:(id)a3
{
  id v5;
  PGUserDefaultsConfigurationSource *v6;
  PGUserDefaultsConfigurationSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGUserDefaultsConfigurationSource;
  v6 = -[PGUserDefaultsConfigurationSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userDefaults, a3);

  return v7;
}

- (id)objectForKey:(id)a3
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
