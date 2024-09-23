@implementation PRSMutableMigrationDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  PRSMigrationDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(PRSMigrationDescriptor);
  -[PRSMigrationDescriptor isHomeScreenDim](self, "isHomeScreenDim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenDim:](v4, "setHomeScreenDim:", v5);

  -[PRSMigrationDescriptor homeScreenTintColor](self, "homeScreenTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenTintColor:](v4, "setHomeScreenTintColor:", v6);

  -[PRSMigrationDescriptor homeScreenIconSize](self, "homeScreenIconSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenIconSize:](v4, "setHomeScreenIconSize:", v7);

  -[PRSMigrationDescriptor homeScreenIconStyle](self, "homeScreenIconStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSMigrationDescriptor setHomeScreenIconStyle:](v4, "setHomeScreenIconStyle:", v8);

  return v4;
}

@end
