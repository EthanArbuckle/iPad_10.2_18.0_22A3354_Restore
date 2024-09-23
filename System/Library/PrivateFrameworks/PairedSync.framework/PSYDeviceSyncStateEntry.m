@implementation PSYDeviceSyncStateEntry

- (PSYDeviceSyncStateEntry)initWithPairingID:(id)a3 syncState:(unint64_t)a4
{
  id v7;
  PSYDeviceSyncStateEntry *v8;
  PSYDeviceSyncStateEntry *v9;
  void *v10;
  void *v11;
  PSYDeviceSyncStateEntry *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PSYDeviceSyncStateEntry;
  v8 = -[PSYDeviceSyncStateEntry init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pairingID, a3);
    v9->_initialSyncState = a4;
    +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceForPairingID:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {

      v12 = 0;
      goto LABEL_6;
    }
    v9->_syncSwitchIndex = objc_msgSend(v10, "lastSyncSwitchIndex");
    v9->_migrationIndex = objc_msgSend(v10, "migrationCountForPairingID:", v7);

  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (BOOL)hasCompletedInitialSync
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  psy_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    psy_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromPSYDeviceSyncState(self->_initialSyncState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_20CFE4000, v5, OS_LOG_TYPE_DEFAULT, "NRPDR has completed initial sync %@", (uint8_t *)&v8, 0xCu);

    }
  }
  return self->_initialSyncState == 3;
}

- (BOOL)hasCompletedInitialOrMigrationSync
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  unsigned int migrationIndex;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceForPairingID:", self->_pairingID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6E678]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = self->_initialSyncState == 3 && self->_migrationIndex == v6;
  psy_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    psy_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromPSYDeviceSyncState(self->_initialSyncState);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      migrationIndex = self->_migrationIndex;
      v13 = CFSTR("NO");
      v15 = 138413058;
      v16 = v11;
      if (v7)
        v13 = CFSTR("YES");
      v17 = 1024;
      v18 = migrationIndex;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_20CFE4000, v10, OS_LOG_TYPE_DEFAULT, "NRPDR initial sync state %@;           migration index: %d;           nr migration index: %d           hasComple"
        "tedInitialOrMigrationSync %@;",
        (uint8_t *)&v15,
        0x22u);

    }
  }

  return v7;
}

- (BOOL)hasCompletedSync
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t syncSwitchIndex;
  uint64_t v10;
  BOOL v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[PSYRegistrySingleton registry](PSYRegistrySingleton, "registry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  psy_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    psy_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NSUUID UUIDString](self->_pairingID, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "switchIndex");
      syncSwitchIndex = self->_syncSwitchIndex;
      v13 = 138412802;
      v14 = v7;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = syncSwitchIndex;
      _os_log_impl(&dword_20CFE4000, v6, OS_LOG_TYPE_DEFAULT, "NRPDR %@ syncSwitchIndex: %ld prefs switchIndex: %ld", (uint8_t *)&v13, 0x20u);

    }
  }
  if (-[PSYDeviceSyncStateEntry hasCompletedInitialOrMigrationSync](self, "hasCompletedInitialOrMigrationSync"))
  {
    v10 = self->_syncSwitchIndex;
    v11 = objc_msgSend(v3, "switchIndex") == v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *pairingID;
  id v5;

  pairingID = self->_pairingID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pairingID, CFSTR("pairingID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_initialSyncState, CFSTR("syncState"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_syncSwitchIndex, CFSTR("syncSwitchIndex"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_migrationIndex, CFSTR("migrationIndex"));

}

- (PSYDeviceSyncStateEntry)initWithCoder:(id)a3
{
  id v4;
  PSYDeviceSyncStateEntry *v5;
  uint64_t v6;
  NSUUID *pairingID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSYDeviceSyncStateEntry;
  v5 = -[PSYDeviceSyncStateEntry init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingID"));
    v6 = objc_claimAutoreleasedReturnValue();
    pairingID = v5->_pairingID;
    v5->_pairingID = (NSUUID *)v6;

    v5->_initialSyncState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncState"));
    v5->_syncSwitchIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("syncSwitchIndex"));
    v5->_migrationIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("migrationIndex"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t syncSwitchIndex;
  uint64_t migrationIndex;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_pairingID, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromPSYDeviceSyncState(self->_initialSyncState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  syncSwitchIndex = self->_syncSwitchIndex;
  migrationIndex = self->_migrationIndex;
  v10 = -[PSYDeviceSyncStateEntry hasCompletedSync](self, "hasCompletedSync");
  v11 = CFSTR("Not Completed");
  if (v10)
    v11 = CFSTR("Completed");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; pairingID=%@ initialSyncState=%@ syncSwitchIndex=%lu migrationIndex=%lu syncState=%@>"),
    v5,
    self,
    v6,
    v7,
    syncSwitchIndex,
    migrationIndex,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PSYDeviceSyncStateEntry *v4;
  PSYDeviceSyncStateEntry *v5;
  BOOL v6;

  v4 = (PSYDeviceSyncStateEntry *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_13;
  }
  if (v4)
  {
    v5 = v4;
    v6 = -[NSUUID isEqual:](self->_pairingID, "isEqual:", v5->_pairingID)
      && self->_initialSyncState == v5->_initialSyncState
      && self->_syncSwitchIndex == v5->_syncSwitchIndex
      && self->_migrationIndex == v5->_migrationIndex;

  }
  else
  {
LABEL_9:
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSUUID hash](self->_pairingID, "hash");
  v4 = self->_initialSyncState - v3 + 32 * v3;
  v5 = self->_syncSwitchIndex - v4 + 32 * v4;
  return self->_migrationIndex - v5 + 32 * v5 + 923521;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_pairingID);
  *(_QWORD *)(v4 + 24) = self->_initialSyncState;
  *(_DWORD *)(v4 + 8) = self->_syncSwitchIndex;
  *(_DWORD *)(v4 + 12) = self->_migrationIndex;
  return (id)v4;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingID, a3);
}

- (unint64_t)initialSyncState
{
  return self->_initialSyncState;
}

- (void)setInitialSyncState:(unint64_t)a3
{
  self->_initialSyncState = a3;
}

- (unsigned)syncSwitchIndex
{
  return self->_syncSwitchIndex;
}

- (void)setSyncSwitchIndex:(unsigned int)a3
{
  self->_syncSwitchIndex = a3;
}

- (unsigned)migrationIndex
{
  return self->_migrationIndex;
}

- (void)setMigrationIndex:(unsigned int)a3
{
  self->_migrationIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end
