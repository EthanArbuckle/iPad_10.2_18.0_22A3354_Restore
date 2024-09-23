@implementation WBCollectionConfiguration

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (BOOL)isInMemoryDatabase
{
  return -[NSString isEqualToString:](self->_databasePath, "isEqualToString:", CFSTR(":memory:"))
      || -[NSString containsString:](self->_databasePath, "containsString:", CFSTR("mode=memory"));
}

- (WBSDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)setMaximumTabsPerTabGroup:(unint64_t)a3
{
  self->_maximumTabsPerTabGroup = a3;
}

- (BOOL)isReadonly
{
  return self->_isReadonly;
}

- (BOOL)createIfNeeded
{
  return self->_createIfNeeded;
}

- (BOOL)skipsExternalNotifications
{
  return self->_skipsExternalNotifications;
}

+ (id)readonlySafariBookmarkCollectionConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:", 0, 0, 1);
}

- (unint64_t)maximumTabsPerTabGroup
{
  return self->_maximumTabsPerTabGroup;
}

+ (id)safariBookmarkCollectionConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:", 0, 0, 0);
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (int64_t)storeOwner
{
  return self->_storeOwner;
}

+ (id)safariTabCollectionConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:", 1, 0, 0);
  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDevice:", v3);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WBCollectionConfiguration *v4;

  v4 = -[WBCollectionConfiguration initWithCollectionType:databasePath:readonly:createIfNeeded:]([WBCollectionConfiguration alloc], "initWithCollectionType:databasePath:readonly:createIfNeeded:", self->_collectionType, self->_databasePath, self->_isReadonly, self->_createIfNeeded);
  -[WBCollectionConfiguration setSkipsExternalNotifications:](v4, "setSkipsExternalNotifications:", self->_skipsExternalNotifications);
  -[WBCollectionConfiguration setStoreOwner:](v4, "setStoreOwner:", self->_storeOwner);
  -[WBCollectionConfiguration setDevice:](v4, "setDevice:", self->_device);
  -[WBCollectionConfiguration setIdentifier:](v4, "setIdentifier:", self->_identifier);
  return v4;
}

- (WBCollectionConfiguration)initWithCollectionType:(int64_t)a3 databasePath:(id)a4 readonly:(BOOL)a5 createIfNeeded:(BOOL)a6
{
  id v10;
  WBCollectionConfiguration *v11;
  WBCollectionConfiguration *v12;
  uint64_t v13;
  NSString *databasePath;
  WBCollectionConfiguration *v15;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBCollectionConfiguration;
  v11 = -[WBCollectionConfiguration init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_collectionType = a3;
    v11->_createIfNeeded = a6;
    v13 = objc_msgSend(v10, "copy");
    databasePath = v12->_databasePath;
    v12->_databasePath = (NSString *)v13;

    v12->_isReadonly = a5;
    v12->_skipsExternalNotifications = a3 == 1;
    v12->_storeOwner = 0;
    v15 = v12;
  }

  return v12;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void)setSkipsExternalNotifications:(BOOL)a3
{
  self->_skipsExternalNotifications = a3;
}

- (void)setStoreOwner:(int64_t)a3
{
  self->_storeOwner = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (WBCollectionConfiguration)initWithCollectionType:(int64_t)a3 databasePath:(id)a4 readonly:(BOOL)a5
{
  return -[WBCollectionConfiguration initWithCollectionType:databasePath:readonly:createIfNeeded:](self, "initWithCollectionType:databasePath:readonly:createIfNeeded:", a3, a4, a5, !a5);
}

+ (id)inMemoryBookmarkCollectionConfiguration
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:", 0, CFSTR(":memory:"), 0);
}

+ (id)readonlySafariTabCollectionConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:createIfNeeded:", 1, 0, 1, 1);
  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDevice:", v3);

  return v2;
}

+ (id)inMemoryTabCollectionConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:", 1, CFSTR(":memory:"), 0);
  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDevice:", v3);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", v5);

  return v2;
}

+ (id)sharedInMemoryTabCollectionConfiguration
{
  return (id)objc_msgSend(a1, "sharedInMemoryTabCollectionConfigurationWithIdentifier:", CFSTR("default"));
}

+ (id)sharedInMemoryTabCollectionConfigurationWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file:%@?mode=memory&cache=shared"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCollectionType:databasePath:readonly:", 1, v6, 0);

  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDevice:", v8);

  objc_msgSend(v7, "setIdentifier:", v4);
  return v7;
}

+ (id)pptTabCollectionConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollectionType:databasePath:readonly:", 1, CFSTR("/var/mobile/Library/Safari/SafariTabsPPT.db"), 1);
  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDevice:", v3);

  return v2;
}

+ (id)debugTabCollectionConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "safariTabCollectionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStoreOwner:", 1);
  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDevice:", v3);

  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end
