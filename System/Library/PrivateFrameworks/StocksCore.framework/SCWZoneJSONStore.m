@implementation SCWZoneJSONStore

- (NSArray)serverRecords
{
  return self->_serverRecords;
}

- (NSArray)pendingCommands
{
  return self->_pendingCommands;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (SCWZoneJSONStore)initWithZoneSchema:(id)a3 serverRecords:(id)a4 lastSyncDate:(id)a5 lastDirtyDate:(id)a6 serverChangeToken:(id)a7 pendingCommands:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SCWZoneJSONStore *v19;
  SCWZoneJSONStore *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v15 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)SCWZoneJSONStore;
  v19 = -[SCWZoneJSONStore init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_zoneSchema, a3);
    v21 = (void *)MEMORY[0x1E0C9AA60];
    if (v15)
      v22 = v15;
    else
      v22 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v20->_serverRecords, v22);
    objc_storeStrong((id *)&v20->_lastSyncDate, a5);
    objc_storeStrong((id *)&v20->_lastDirtyDate, a6);
    objc_storeStrong((id *)&v20->_serverChangeToken, a7);
    if (v18)
      v23 = v18;
    else
      v23 = v21;
    objc_storeStrong((id *)&v20->_pendingCommands, v23);
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSchema, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_serverRecords, 0);
}

- (void)applyServerRecordsDiff:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *serverRecords;
  id v7;

  v4 = a3;
  -[SCWZoneJSONStore serverRecords](self, "serverRecords");
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

- (void)setServerRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPendingCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (SCWZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

@end
