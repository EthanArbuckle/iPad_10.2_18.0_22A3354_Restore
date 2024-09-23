@implementation WBBookmarkDatabaseSyncData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WBBookmarkDatabaseSyncData)databaseSyncDataWithContentsOfData:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:].cold.3(v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v3, 0);
  objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkDatabaseSyncData"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");
  v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:].cold.1(v7);

  return (WBBookmarkDatabaseSyncData *)v6;
}

+ (id)databaseSyncDataInDatabase:(void *)a3 databaseAccessor:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a4, "copySyncDataWithDatabase:", a3);
  objc_msgSend(a1, "databaseSyncDataWithContentsOfData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WBBookmarkDatabaseSyncData)init
{
  WBBookmarkDatabaseSyncData *v2;
  uint64_t v3;
  NSMutableDictionary *recordZoneIDsToLastServerChangeTokens;
  uint64_t v5;
  NSSet *recordIDsToRefresh;
  uint64_t v7;
  NSSet *auxiliaryRecordIDsToDelete;
  uint64_t v9;
  NSMutableDictionary *recordZoneIDsToHashGenerators;
  uint64_t v11;
  NSSet *idsOfRecordZonesToRefresh;
  WBBookmarkDatabaseSyncData *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBBookmarkDatabaseSyncData;
  v2 = -[WBBookmarkDatabaseSyncData init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    recordZoneIDsToLastServerChangeTokens = v2->_recordZoneIDsToLastServerChangeTokens;
    v2->_recordZoneIDsToLastServerChangeTokens = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    recordIDsToRefresh = v2->_recordIDsToRefresh;
    v2->_recordIDsToRefresh = (NSSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    auxiliaryRecordIDsToDelete = v2->_auxiliaryRecordIDsToDelete;
    v2->_auxiliaryRecordIDsToDelete = (NSSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    recordZoneIDsToHashGenerators = v2->_recordZoneIDsToHashGenerators;
    v2->_recordZoneIDsToHashGenerators = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    idsOfRecordZonesToRefresh = v2->_idsOfRecordZonesToRefresh;
    v2->_idsOfRecordZonesToRefresh = (NSSet *)v11;

    v13 = v2;
  }

  return v2;
}

- (NSData)encodedDatabaseSyncData
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (void)writeToDatabase:(void *)a3 databaseAccessor:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a4;
  -[WBBookmarkDatabaseSyncData encodedDatabaseSyncData](self, "encodedDatabaseSyncData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WBBookmarkDatabaseSyncData writeToDatabase:databaseAccessor:].cold.1(v8);
  objc_msgSend(v6, "setSyncData:database:", v7, a3);

}

- (NSDictionary)recordZoneIDsToLastServerChangeTokens
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_recordZoneIDsToLastServerChangeTokens, "copy");
}

- (void)clearAllLastServerChangeTokens
{
  NSMutableDictionary *v3;
  NSMutableDictionary *recordZoneIDsToLastServerChangeTokens;
  NSSet *v5;
  NSSet *recordIDsToRefresh;
  CKServerChangeToken *lastPrivateDatabaseServerChangeToken;
  CKServerChangeToken *lastSharedDatabaseServerChangeToken;
  NSSet *v9;
  NSSet *idsOfRecordZonesToRefresh;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  recordZoneIDsToLastServerChangeTokens = self->_recordZoneIDsToLastServerChangeTokens;
  self->_recordZoneIDsToLastServerChangeTokens = v3;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  recordIDsToRefresh = self->_recordIDsToRefresh;
  self->_recordIDsToRefresh = v5;

  lastPrivateDatabaseServerChangeToken = self->_lastPrivateDatabaseServerChangeToken;
  self->_lastPrivateDatabaseServerChangeToken = 0;

  lastSharedDatabaseServerChangeToken = self->_lastSharedDatabaseServerChangeToken;
  self->_lastSharedDatabaseServerChangeToken = 0;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
  idsOfRecordZonesToRefresh = self->_idsOfRecordZonesToRefresh;
  self->_idsOfRecordZonesToRefresh = v9;

}

- (id)lastServerChangeTokenForRecordZoneID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_recordZoneIDsToLastServerChangeTokens, "objectForKeyedSubscript:", a3);
}

- (void)setLastServerChangeToken:(id)a3 forRecordZoneID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordZoneIDsToLastServerChangeTokens, "setObject:forKeyedSubscript:", a3, a4);
}

- (WBBookmarkDatabaseSyncData)initWithCoder:(id)a3
{
  id v4;
  WBBookmarkDatabaseSyncData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *recordZoneIDsToLastServerChangeTokens;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSSet *v19;
  NSSet *recordIDsToRefresh;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSSet *v26;
  NSSet *auxiliaryRecordIDsToDelete;
  uint64_t v28;
  CKServerChangeToken *lastPrivateDatabaseServerChangeToken;
  uint64_t v30;
  CKServerChangeToken *lastSharedDatabaseServerChangeToken;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *recordZoneIDsToHashGenerators;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSSet *v45;
  NSSet *idsOfRecordZonesToRefresh;
  WBBookmarkDatabaseSyncData *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)WBBookmarkDatabaseSyncData;
  v5 = -[WBBookmarkDatabaseSyncData init](&v49, sel_init);
  if (v5)
  {
    v5->_lastChangeID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("LastChangeID"));
    v5->_didNotSaveRecordsAfterMigration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidNotSaveRecordsAfterMigration"));
    v5->_minimumSyncAPIVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MinimumAPIVersion"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("RecordZoneIDsToLastServerChangeTokens"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    recordZoneIDsToLastServerChangeTokens = v5->_recordZoneIDsToLastServerChangeTokens;
    v5->_recordZoneIDsToLastServerChangeTokens = v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("RecordIDsToRefresh"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v19 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    recordIDsToRefresh = v5->_recordIDsToRefresh;
    v5->_recordIDsToRefresh = v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("AuxiliaryRecordIDsToDelete"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v26 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    auxiliaryRecordIDsToDelete = v5->_auxiliaryRecordIDsToDelete;
    v5->_auxiliaryRecordIDsToDelete = v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastPrivateDatabaseServerChangeToken"));
    v28 = objc_claimAutoreleasedReturnValue();
    lastPrivateDatabaseServerChangeToken = v5->_lastPrivateDatabaseServerChangeToken;
    v5->_lastPrivateDatabaseServerChangeToken = (CKServerChangeToken *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastSharedDatabaseServerChangeToken"));
    v30 = objc_claimAutoreleasedReturnValue();
    lastSharedDatabaseServerChangeToken = v5->_lastSharedDatabaseServerChangeToken;
    v5->_lastSharedDatabaseServerChangeToken = (CKServerChangeToken *)v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("RecordZoneIDsToHashGenerators"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v38 = v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v38 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    recordZoneIDsToHashGenerators = v5->_recordZoneIDsToHashGenerators;
    v5->_recordZoneIDsToHashGenerators = v38;

    v40 = (void *)MEMORY[0x24BDBCF20];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("IDsOfRecordZonesToRefresh"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v45 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    idsOfRecordZonesToRefresh = v5->_idsOfRecordZonesToRefresh;
    v5->_idsOfRecordZonesToRefresh = v45;

    v47 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", self->_lastChangeID, CFSTR("LastChangeID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_minimumSyncAPIVersion, CFSTR("MinimumAPIVersion"));
  if (self->_didNotSaveRecordsAfterMigration)
    objc_msgSend(v6, "encodeBool:forKey:", 1, CFSTR("DidNotSaveRecordsAfterMigration"));
  if (-[NSMutableDictionary count](self->_recordZoneIDsToLastServerChangeTokens, "count"))
    objc_msgSend(v6, "encodeObject:forKey:", self->_recordZoneIDsToLastServerChangeTokens, CFSTR("RecordZoneIDsToLastServerChangeTokens"));
  if (-[NSSet count](self->_recordIDsToRefresh, "count"))
    objc_msgSend(v6, "encodeObject:forKey:", self->_recordIDsToRefresh, CFSTR("RecordIDsToRefresh"));
  v4 = -[NSSet count](self->_auxiliaryRecordIDsToDelete, "count");
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_auxiliaryRecordIDsToDelete, CFSTR("AuxiliaryRecordIDsToDelete"));
    v5 = v6;
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPrivateDatabaseServerChangeToken, CFSTR("LastPrivateDatabaseServerChangeToken"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastSharedDatabaseServerChangeToken, CFSTR("LastSharedDatabaseServerChangeToken"));
  if (-[NSMutableDictionary count](self->_recordZoneIDsToHashGenerators, "count"))
    objc_msgSend(v6, "encodeObject:forKey:", self->_recordZoneIDsToHashGenerators, CFSTR("RecordZoneIDsToHashGenerators"));
  if (-[NSSet count](self->_idsOfRecordZonesToRefresh, "count"))
    objc_msgSend(v6, "encodeObject:forKey:", self->_idsOfRecordZonesToRefresh, CFSTR("IDsOfRecordZonesToRefresh"));

}

- (int64_t)nextChangeID
{
  int64_t v2;

  v2 = self->_lastChangeID + 1;
  self->_lastChangeID = v2;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSMutableDictionary mutableCopy](self->_recordZoneIDsToLastServerChangeTokens, "mutableCopy");
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  v7 = -[NSSet copy](self->_recordIDsToRefresh, "copy");
  v8 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v7;

  v9 = -[NSSet copy](self->_auxiliaryRecordIDsToDelete, "copy");
  v10 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v9;

  objc_storeStrong((id *)v4 + 5, self->_lastPrivateDatabaseServerChangeToken);
  objc_storeStrong((id *)v4 + 6, self->_lastSharedDatabaseServerChangeToken);
  v11 = -[NSMutableDictionary mutableCopy](self->_recordZoneIDsToHashGenerators, "mutableCopy");
  v12 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v11;

  v13 = -[NSSet mutableCopy](self->_idsOfRecordZonesToRefresh, "mutableCopy");
  v14 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v13;

  *((_BYTE *)v4 + 32) = self->_didNotSaveRecordsAfterMigration;
  *((_QWORD *)v4 + 2) = self->_lastChangeID;
  return v4;
}

- (NSDictionary)recordZoneIDsToHashGenerators
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_recordZoneIDsToHashGenerators, "copy");
}

- (id)hashGeneratorForRecordZoneID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_recordZoneIDsToHashGenerators, "objectForKeyedSubscript:", a3);
}

- (void)setHashGenerator:(id)a3 forRecordZoneID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recordZoneIDsToHashGenerators, "setObject:forKeyedSubscript:", v7, v6);

}

- (CKServerChangeToken)lastPrivateDatabaseServerChangeToken
{
  return self->_lastPrivateDatabaseServerChangeToken;
}

- (void)setLastPrivateDatabaseServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CKServerChangeToken)lastSharedDatabaseServerChangeToken
{
  return self->_lastSharedDatabaseServerChangeToken;
}

- (void)setLastSharedDatabaseServerChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)didNotSaveRecordsAfterMigration
{
  return self->_didNotSaveRecordsAfterMigration;
}

- (void)setDidNotSaveRecordsAfterMigration:(BOOL)a3
{
  self->_didNotSaveRecordsAfterMigration = a3;
}

- (int64_t)minimumSyncAPIVersion
{
  return self->_minimumSyncAPIVersion;
}

- (void)setMinimumSyncAPIVersion:(int64_t)a3
{
  self->_minimumSyncAPIVersion = a3;
}

- (NSSet)recordIDsToRefresh
{
  return self->_recordIDsToRefresh;
}

- (void)setRecordIDsToRefresh:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)auxiliaryRecordIDsToDelete
{
  return self->_auxiliaryRecordIDsToDelete;
}

- (void)setAuxiliaryRecordIDsToDelete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)idsOfRecordZonesToRefresh
{
  return self->_idsOfRecordZonesToRefresh;
}

- (void)setIdsOfRecordZonesToRefresh:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsOfRecordZonesToRefresh, 0);
  objc_storeStrong((id *)&self->_auxiliaryRecordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordIDsToRefresh, 0);
  objc_storeStrong((id *)&self->_lastSharedDatabaseServerChangeToken, 0);
  objc_storeStrong((id *)&self->_lastPrivateDatabaseServerChangeToken, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToHashGenerators, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToLastServerChangeTokens, 0);
}

+ (void)databaseSyncDataWithContentsOfData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_211022000, log, OS_LOG_TYPE_DEBUG, "Successfully created WBBookmarkDatabaseSyncData", v1, 2u);
}

+ (void)databaseSyncDataWithContentsOfData:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Failed to create WBBookmarkDatabaseSyncData with exception: %{public}@", buf, 0xCu);

}

+ (void)databaseSyncDataWithContentsOfData:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_5(&dword_211022000, v3, v4, "Trying to create WBBookmarkDatabaseSyncData from data of size %lu", v5, v6, v7, v8, 0);

  OUTLINED_FUNCTION_3_0();
}

- (void)writeToDatabase:(void *)a1 databaseAccessor:.cold.1(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_5(&dword_211022000, v3, v4, "Writing sync data of size %lu to database", v5, v6, v7, v8, 0);

  OUTLINED_FUNCTION_3_0();
}

@end
