@implementation SCKZoneJSONStore

- (SCKZoneJSONStore)initWithZoneName:(id)a3 serverRecords:(id)a4 lastSyncDate:(id)a5 lastDirtyDate:(id)a6 serverChangeToken:(id)a7 pendingCommands:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SCKZoneJSONStore *v19;
  uint64_t v20;
  NSString *zoneName;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v26 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)SCKZoneJSONStore;
  v19 = -[SCKZoneJSONStore init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    zoneName = v19->_zoneName;
    v19->_zoneName = (NSString *)v20;

    v22 = (void *)MEMORY[0x24BDBD1A8];
    if (v15)
      v23 = v15;
    else
      v23 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v19->_serverRecords, v23);
    objc_storeStrong((id *)&v19->_lastSyncDate, a5);
    objc_storeStrong((id *)&v19->_lastDirtyDate, a6);
    objc_storeStrong((id *)&v19->_serverChangeToken, a7);
    if (v18)
      v24 = v18;
    else
      v24 = v22;
    objc_storeStrong((id *)&v19->_pendingCommands, v24);
  }

  return v19;
}

- (void)applyServerRecordsDiff:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *serverRecords;
  id v7;

  v4 = a3;
  -[SCKZoneJSONStore serverRecords](self, "serverRecords");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToRecords:", v7);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  serverRecords = self->_serverRecords;
  self->_serverRecords = v5;

}

- (void)addPendingCommands:(id)a3
{
  NSArray *v4;
  NSArray *pendingCommands;

  -[NSArray arrayByAddingObjectsFromArray:](self->_pendingCommands, "arrayByAddingObjectsFromArray:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = v4;

}

- (void)clearPendingCommandsUpToCount:(unint64_t)a3
{
  NSArray *v4;
  NSArray *pendingCommands;

  -[NSArray subarrayWithRange:](self->_pendingCommands, "subarrayWithRange:", a3, -[NSArray count](self->_pendingCommands, "count") - a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = v4;

}

- (NSArray)serverRecords
{
  return self->_serverRecords;
}

- (void)setServerRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)pendingCommands
{
  return self->_pendingCommands;
}

- (void)setPendingCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_serverRecords, 0);
}

@end
