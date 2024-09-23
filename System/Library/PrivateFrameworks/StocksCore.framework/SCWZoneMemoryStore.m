@implementation SCWZoneMemoryStore

- (SCWZoneMemoryStore)init
{
  SCWZoneMemoryStore *v2;
  SCWZoneMemoryStore *v3;
  NSArray *serverRecords;
  NSArray *v5;
  NSArray *pendingCommands;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCWZoneMemoryStore;
  v2 = -[SCWZoneMemoryStore init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    serverRecords = v2->_serverRecords;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_serverRecords = (NSArray *)MEMORY[0x1E0C9AA60];

    pendingCommands = v3->_pendingCommands;
    v3->_pendingCommands = v5;

  }
  return v3;
}

- (void)applyServerRecordsDiff:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *serverRecords;
  id v7;

  v4 = a3;
  -[SCWZoneMemoryStore serverRecords](self, "serverRecords");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyToRecords:", v7);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  serverRecords = self->_serverRecords;
  self->_serverRecords = v5;

}

- (void)addPendingCommands:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *pendingCommands;
  id v7;

  v4 = a3;
  -[SCWZoneMemoryStore pendingCommands](self, "pendingCommands");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v4);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = v5;

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

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)serverRecords
{
  return self->_serverRecords;
}

- (void)setServerRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)pendingCommands
{
  return self->_pendingCommands;
}

- (void)setPendingCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_serverRecords, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

@end
