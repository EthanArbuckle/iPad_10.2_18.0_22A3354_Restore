@implementation SCKDatabaseMemoryStore

- (SCKDatabaseMemoryStore)init
{
  SCKDatabaseMemoryStore *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *zoneStoresByName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCKDatabaseMemoryStore;
  v2 = -[SCKDatabaseMemoryStore init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    zoneStoresByName = v2->_zoneStoresByName;
    v2->_zoneStoresByName = v3;

  }
  return v2;
}

- (id)zoneStoreForSchema:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SCKZoneMemoryStore *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SCKDatabaseMemoryStore zoneStoresByName](self, "zoneStoresByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (SCKZoneMemoryStore *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(SCKZoneMemoryStore);
    -[SCKDatabaseMemoryStore zoneStoresByName](self, "zoneStoresByName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isCloudBackupEnabled
{
  return self->_cloudBackupEnabled;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_cloudBackupEnabled = a3;
}

- (NSMutableDictionary)zoneStoresByName
{
  return self->_zoneStoresByName;
}

- (void)setZoneStoresByName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneStoresByName, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

@end
