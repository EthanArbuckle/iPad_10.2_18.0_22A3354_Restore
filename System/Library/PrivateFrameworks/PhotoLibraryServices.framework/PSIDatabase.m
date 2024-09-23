@implementation PSIDatabase

- (PSIDatabase)initWithPathManager:(id)a3 options:(int64_t)a4
{
  id v7;
  PSIDatabase *v8;
  uint64_t v9;
  NSString *path;
  PLSearchMetadataStore *v11;
  void *v12;
  PLSearchMetadataStore *v13;
  PLSearchMetadataStore *inqSearchMetadataStore;
  PLSearchMetadataStore *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *inqSearchMetadata;
  BOOL v19;
  PSIDatabase *v20;
  NSObject *v21;
  __int16 v23[8];
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PSIDatabase;
  v8 = -[PSIDatabase init](&v24, sel_init);
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v7, "searchIndexDatabaseFilePath");
  v9 = objc_claimAutoreleasedReturnValue();
  path = v8->_path;
  v8->_path = (NSString *)v9;

  objc_storeStrong((id *)&v8->_pathManager, a3);
  if ((unint64_t)a4 <= 1)
    a4 = 1;
  v11 = [PLSearchMetadataStore alloc];
  objc_msgSend(v7, "searchIndexMetadataStoreFilePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLSearchMetadataStore initWithPath:](v11, "initWithPath:", v12);

  inqSearchMetadataStore = v8->_inqSearchMetadataStore;
  v8->_inqSearchMetadataStore = v13;
  v15 = v13;

  -[PLSearchMetadataStore currentSearchMetadata](v15, "currentSearchMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  inqSearchMetadata = v8->_inqSearchMetadata;
  v8->_inqSearchMetadata = (NSDictionary *)v17;

  v19 = -[PSIDatabase _prepareSearchIndexAtPath:options:](v8, "_prepareSearchIndexAtPath:options:", v8->_path, a4);
  v8->_databaseIsValid = v19;
  if (!v19)
  {
    PLSearchBackendPSIDatabaseGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23[0] = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to establish database connection, aborting initialization", (uint8_t *)v23, 2u);
    }

    v20 = 0;
  }
  else
  {
LABEL_5:
    v20 = v8;
  }

  return v20;
}

- (BOOL)_prepareSearchIndexAtPath:(id)a3 options:(int64_t)a4
{
  id v6;
  void *v7;
  PSITokenizer *v8;
  PSITokenizer *tokenizer;
  sqlite3 *v10;
  sqlite3 *inqDatabase;
  PSITokenizer *v12;
  BOOL v13;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *groupResultsQueue;
  OS_dispatch_queue *v17;
  NSObject *v18;
  OS_dispatch_queue *v19;
  OS_dispatch_queue *serialQueue;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *searchQueue;
  dispatch_block_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  PSIDatabase *v29;
  id v30;
  __int128 *p_buf;
  int64_t v32;
  __int128 buf;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_options = a4;
  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSITokenizer initWithLocale:useCache:]([PSITokenizer alloc], "initWithLocale:useCache:", v7, a4 & 1);
  tokenizer = self->_tokenizer;
  self->_tokenizer = v8;

  v10 = (sqlite3 *)objc_msgSend((id)objc_opt_class(), "_openDatabaseAtPath:options:", self->_path, a4);
  self->_inqDatabase = v10;
  if (!v10)
  {
LABEL_7:
    v12 = self->_tokenizer;
    self->_tokenizer = 0;

    goto LABEL_8;
  }
  if (sqlite3_busy_timeout(v10, 500))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to set busy timeout");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
    }
    inqDatabase = self->_inqDatabase;
    if (inqDatabase)
    {
      sqlite3_close(inqDatabase);
      self->_inqDatabase = 0;
    }
    goto LABEL_7;
  }
  if ((a4 & 3) == 1 && !-[PSIDatabase _inqVerifyTablesExistInDatabase](self, "_inqVerifyTablesExistInDatabase"))
  {
    PLSearchBackendPSIDatabaseGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "Search Index does not contain any tables", (uint8_t *)&buf, 2u);
    }

  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x2020000000;
    v35 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __49__PSIDatabase__prepareSearchIndexAtPath_options___block_invoke;
    v28 = &unk_1E3674DF8;
    v29 = self;
    v30 = v7;
    p_buf = &buf;
    v32 = a4;
    -[PSIDatabase _inqPerformBatch:](self, "_inqPerformBatch:", &v25);
    self->_inqPreparedStatements = *(__CFDictionary **)(*((_QWORD *)&buf + 1) + 24);
    v15 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.groupResults", 0);
    groupResultsQueue = self->_groupResultsQueue;
    self->_groupResultsQueue = v15;

    if ((a4 & 2) != 0)
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.serial", v18);
      serialQueue = self->_serialQueue;
      self->_serialQueue = v19;

    }
    else
    {
      v17 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.serial", 0);
      v18 = self->_serialQueue;
      self->_serialQueue = v17;
    }

    if ((a4 & 1) != 0)
    {
      v21 = (OS_dispatch_queue *)dispatch_queue_create("PSIDatabase.search", 0);
      searchQueue = self->_searchQueue;
      self->_searchQueue = v21;

      if ((objc_msgSend((id)objc_opt_class(), "_lemonadeIsEnabled", v25, v26, v27, v28, v29) & 1) == 0)
      {
        v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, &__block_literal_global_93751);
        dispatch_async((dispatch_queue_t)self->_searchQueue, v23);

      }
    }

    _Block_object_dispose(&buf, 8);
    if (self->_inqDatabase && self->_inqPreparedStatements)
    {
      self->_inqGroupObjectsById = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
      v13 = 1;
      goto LABEL_9;
    }
  }
LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

+ (sqlite3)_openDatabaseAtPath:(id)a3 options:(int64_t)a4
{
  char v4;
  id v5;
  int v6;
  uint64_t v7;
  id v8;
  const char *v9;
  int v10;
  sqlite3 *v11;
  NSObject *v12;
  sqlite3 *v13;
  char *errmsg;
  sqlite3 *ppDb;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((v4 & 2) != 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E0D732C0], "dataProtectionOpenFlagForPath:", v5) | 0x8002;
  }
  else if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("file:%@?readonly_shm=1"), v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = 32769;
    v5 = (id)v7;
  }
  else
  {
    v6 = 0x8000;
  }
  ppDb = 0;
  v8 = objc_retainAutorelease(v5);
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = sqlite3_open_v2(v9, &ppDb, v6, 0);
  v11 = ppDb;
  if (!v10)
  {
LABEL_17:
    if (v11)
    {
      errmsg = 0;
      if (sqlite3_exec(v11, "PRAGMA journal_mode = WAL", 0, 0, &errmsg))
      {
        PLSearchBackendPSIDatabaseGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          v18 = (const __CFString *)errmsg;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Failed to set sqlite3 WAL mode: %{public}s", buf, 0xCu);
        }

        sqlite3_free(errmsg);
      }
    }
    goto LABEL_22;
  }
  if (ppDb)
  {
    if (sqlite3_close(ppDb) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = CFSTR("Couldn't close db");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    ppDb = 0;
  }
  if ((v4 & 2) != 0)
  {
    if (sqlite3_open_v2(v9, &ppDb, v6 | 4, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = CFSTR("Failed to open db");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      goto LABEL_22;
    }
    v11 = ppDb;
    goto LABEL_17;
  }
LABEL_22:
  v13 = ppDb;

  return v13;
}

- (BOOL)_inqVerifyTablesExistInDatabase
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PSIDatabase__inqVerifyTablesExistInDatabase__block_invoke;
  v4[3] = &unk_1E3674DD0;
  v4[4] = &v5;
  -[PSIDatabase executeStatementFromString:withResultEnumerationBlock:](self, "executeStatementFromString:withResultEnumerationBlock:", CFSTR("SELECT count(*) from sqlite_master where type = 'table' and name = 'prefix'"), v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (__CFDictionary)_inqPrepareStatementsForOptions:(int64_t)a3 tokenizerName:(id)a4
{
  char v4;
  id v6;
  __CFDictionary *Mutable;
  id v8;
  id v9;
  sqlite3_stmt *v10;
  sqlite3_stmt *v11;
  sqlite3_stmt *v12;
  sqlite3_stmt *v13;
  sqlite3_stmt *v14;
  sqlite3_stmt *v15;
  sqlite3_stmt *v16;
  sqlite3_stmt *v17;
  sqlite3_stmt *v18;
  sqlite3_stmt *v19;
  sqlite3_stmt *v20;
  sqlite3_stmt *v21;
  sqlite3_stmt *v22;
  sqlite3_stmt *v23;
  sqlite3_stmt *v24;
  sqlite3_stmt *v25;
  sqlite3_stmt *v26;
  sqlite3_stmt *v27;
  sqlite3_stmt *v28;
  sqlite3_stmt *v29;
  sqlite3_stmt *v30;
  sqlite3_stmt *v31;
  PSIStatement *v32;
  PSIStatement *inqIdsOfAllGroupsStatement;
  PSIStatement *v34;
  PSIStatement *inqIdsOfAllGroupsInPrefixStatement;
  sqlite3_stmt *v36;
  sqlite3_stmt *v37;
  sqlite3_stmt *v38;
  sqlite3_stmt *v39;
  sqlite3_stmt *v40;
  sqlite3_stmt *v41;
  sqlite3_stmt *v42;
  sqlite3_stmt *v43;
  sqlite3_stmt *v44;
  sqlite3_stmt *v45;
  sqlite3_stmt *v46;
  sqlite3_stmt *v47;
  sqlite3_stmt *v48;
  sqlite3_stmt *v49;
  sqlite3_stmt *v50;
  sqlite3_stmt *v51;
  sqlite3_stmt *v52;
  id v53;
  sqlite3_stmt *v54;
  sqlite3_stmt *v55;
  void *v56;
  void *v57;
  id v58;
  sqlite3_stmt *v59;
  id v60;
  sqlite3_stmt *v61;
  id v62;
  sqlite3_stmt *v63;
  id v64;
  sqlite3_stmt *v65;
  id v66;
  sqlite3_stmt *v67;
  sqlite3_stmt *v68;
  PSIStatement *v69;
  PSIStatement *inqAssetIdsByGroupIdForAssetIdsStatement;
  sqlite3_stmt *v71;
  PSIStatement *v72;
  PSIStatement *inqCollectionIdsByGroupIdForCollectionIdsStatement;
  PSIStatement *v74;
  PSIStatement *inqNumberOfAssetsMatchingGroupWithIdStatement;
  PSIStatement *v76;
  PSIStatement *inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement;
  PSIStatement *v78;
  PSIStatement *inqNumberOfCollectionsMatchingGroupWithIdStatement;
  PSIStatement *v80;
  PSIStatement *inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement;
  sqlite3_stmt *v82;
  sqlite3_stmt *v83;
  sqlite3_stmt *v84;
  sqlite3_stmt *v85;
  sqlite3_stmt *v86;
  sqlite3_stmt *v87;
  sqlite3_stmt *v88;
  sqlite3_stmt *v89;
  sqlite3_stmt *v90;
  sqlite3_stmt *v91;
  sqlite3_stmt *v92;
  sqlite3_stmt *v93;
  sqlite3_stmt *v94;
  sqlite3_stmt *v95;
  sqlite3_stmt *v96;
  sqlite3_stmt *v97;
  sqlite3_stmt *v98;
  sqlite3_stmt *v99;
  sqlite3_stmt *v100;
  sqlite3_stmt *v101;
  sqlite3_stmt *v102;
  sqlite3_stmt *v103;
  sqlite3_stmt *v104;
  sqlite3_stmt *v105;
  PSIStatement *v106;
  PSIStatement *assetUUIDByAssetIdWithAssetIdsStatement;
  PSIStatement *v108;
  PSIStatement *collectionResultByCollectionIdWithCollectionIdsStatement;
  sqlite3_stmt *v110;
  sqlite3_stmt *v111;

  v4 = a3;
  v6 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
  if ((v4 & 2) != 0)
  {
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS groups(category INT2, owning_groupid INT, content_string TEXT, normalized_string TEXT, lookup_identifier TEXT, score REAL, token_ranges_0 INT8, token_ranges_1 INT8, UNIQUE(category, owning_groupid, content_string, lookup_identifier, token_ranges_0, token_ranges_1))");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS assets(uuid_0 INT, uuid_1 INT, creationDate INT, UNIQUE(uuid_0, uuid_1))");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS ga(groupid INT, assetid INT, PRIMARY KEY(groupid, assetid))");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS collections(uuid_0 INT, uuid_1 INT, startDate INT, endDate INT, title TEXT, subtitle TEXT, type INT8, keyAssetUUIDPrivate TEXT, keyAssetUUIDShared TEXT, assetsCountPrivate INT32, assetsCountShared INT32, sortDate DOUBLE, UNIQUE(uuid_0, uuid_1))");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS gc(groupid INT, collectionid INT, PRIMARY KEY(groupid, collectionid))");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS tmp_used_groupids (groupid INTEGER PRIMARY KEY);");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE VIRTUAL TABLE IF NOT EXISTS prefix USING fts5(content='groups', normalized_string, category UNINDEXED, tokenize = '%@')"), v6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", objc_msgSend(v8, "UTF8String"));
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TRIGGER IF NOT EXISTS trigger_groups_insert AFTER INSERT ON groups BEGIN INSERT INTO prefix(rowid, normalized_string, category) VALUES (new.rowid, new.normalized_string, new.category); END;");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TRIGGER IF NOT EXISTS trigger_groups_delete AFTER DELETE ON groups BEGIN INSERT INTO prefix(prefix, rowid, normalized_string, category) VALUES('delete', old.rowid, old.normalized_string, old.category); END;");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "DROP INDEX IF EXISTS group_pk");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "DROP TABLE IF EXISTS lookup");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS groupid_by_contentstring_category_lookupid_owner ON groups(content_string, category, lookup_identifier, owning_groupid)");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS groupid_by_normalized_string_category_lookupid_owner ON groups(normalized_string, category, lookup_identifier, owning_groupid) WHERE category = %lu OR category = %lu"), 1203, 1204);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", objc_msgSend(v9, "UTF8String"));
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS asset_pk ON assets(uuid_0, uuid_1)");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS ga_assetid ON ga(assetid, groupid)");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS ga_groupid ON ga(groupid);");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS collection_pk ON collections(uuid_0, uuid_1)");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS gc_collectionid ON gc(collectionid)");
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE INDEX IF NOT EXISTS gc_groupid ON gc(groupid);");
    v10 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO groups VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
    if (v10)
      CFDictionarySetValue(Mutable, CFSTR("insertGroup"), v10);
    v11 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM groups WHERE rowid IN matchingIds");
    if (v11)
      CFDictionarySetValue(Mutable, CFSTR("deleteGroupsWithIds"), v11);
    v12 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "UPDATE groups SET owning_groupid = ? WHERE rowid = ?");
    if (v12)
      CFDictionarySetValue(Mutable, CFSTR("updateGroupOwningGroupId"), v12);
    v13 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "UPDATE groups SET score = ? WHERE rowid = ?");
    if (v13)
      CFDictionarySetValue(Mutable, CFSTR("updateGroupRankingScore"), v13);
    v14 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, category, content_string FROM groups");
    if (v14)
      CFDictionarySetValue(Mutable, CFSTR("selectAllGroups"), v14);
    v15 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, owning_groupid, score FROM groups WHERE category = ? AND normalized_string = ? AND lookup_identifier = ? LIMIT 1");
    if (v15)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupWithNormalizedStr"), v15);
    v16 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM groups WHERE lookup_identifier = ?");
    if (v16)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupsForLookupId"), v16);
    v17 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT groupid FROM gc WHERE groupid IN matchingIds");
    if (v17)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupIdsInGCWithGroupIdsStatement"), v17);
    v18 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO assets(uuid_0, uuid_1, creationDate) VALUES(?, ?, ?)");
    if (v18)
      CFDictionarySetValue(Mutable, CFSTR("insertAsset"), v18);
    v19 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM assets WHERE rowid = ?");
    if (v19)
      CFDictionarySetValue(Mutable, CFSTR("deleteAsset"), v19);
    v20 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE uuid_0 = ? AND uuid_1 = ?");
    if (v20)
      CFDictionarySetValue(Mutable, CFSTR("selectAsset"), v20);
    v21 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO ga VALUES(?, ?)");
    if (v21)
      CFDictionarySetValue(Mutable, CFSTR("insertGA"), v21);
    v22 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM ga WHERE assetid = ?");
    if (v22)
      CFDictionarySetValue(Mutable, CFSTR("deleteGA"), v22);
    v23 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT groupid FROM ga WHERE assetid = ?");
    if (v23)
      CFDictionarySetValue(Mutable, CFSTR("selectGAInv"), v23);
    v24 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT groupid FROM ga WHERE assetid IN matchingIds");
    if (v24)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupIdsInGAWithAssetIds"), v24);
    v25 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO collections(uuid_0, uuid_1, startDate, endDate, title, subtitle, type, keyAssetUUIDPrivate, keyAssetUUIDShared, assetsCountPrivate, assetsCountShared, sortDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (v25)
      CFDictionarySetValue(Mutable, CFSTR("insertCollection"), v25);
    v26 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM collections WHERE rowid = ?");
    if (v26)
      CFDictionarySetValue(Mutable, CFSTR("deleteCollection"), v26);
    v27 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE uuid_0 = ? AND uuid_1 = ?");
    if (v27)
      CFDictionarySetValue(Mutable, CFSTR("selectCollectionForUUID"), v27);
    v28 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1, type FROM collections");
    if (v28)
      CFDictionarySetValue(Mutable, CFSTR("listCollections"), v28);
    v29 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO gc VALUES(?, ?)");
    if (v29)
      CFDictionarySetValue(Mutable, CFSTR("insertGC"), v29);
    v30 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM gc WHERE collectionid = ?");
    if (v30)
      CFDictionarySetValue(Mutable, CFSTR("deleteGC"), v30);
    v31 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT groupid FROM gc WHERE collectionid = ?");
    if (v31)
      CFDictionarySetValue(Mutable, CFSTR("selectGCInv"), v31);
    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT rowid FROM groups"));
    v32 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqIdsOfAllGroupsStatement = self->_inqIdsOfAllGroupsStatement;
    self->_inqIdsOfAllGroupsStatement = v32;

    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT rowid FROM prefix where normalized_string != \"\"));
    v34 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqIdsOfAllGroupsInPrefixStatement = self->_inqIdsOfAllGroupsInPrefixStatement;
    self->_inqIdsOfAllGroupsInPrefixStatement = v34;

    v36 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM tmp_used_groupids;");
    if (v36)
      CFDictionarySetValue(Mutable, CFSTR("deleteUnusedGroupsAndLookups_1"), v36);
    v37 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT OR IGNORE INTO tmp_used_groupids SELECT groupid FROM ga UNION SELECT groupid FROM gc;");
    if (v37)
      CFDictionarySetValue(Mutable, CFSTR("deleteUnusedGroupsAndLookups_2"), v37);
    v38 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT OR IGNORE INTO tmp_used_groupids SELECT ROWID FROM groups WHERE owning_groupid IN (SELECT ROWID FROM tmp_used_groupids);");
    if (v38)
      CFDictionarySetValue(Mutable, CFSTR("deleteUnusedGroupsAndLookups_3"), v38);
    v39 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM groups where ROWID NOT IN (SELECT groupid FROM tmp_used_groupids);");
    if (v39)
      CFDictionarySetValue(Mutable, CFSTR("deleteUnusedGroupsAndLookups_4"), v39);
    -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "CREATE TABLE IF NOT EXISTS embeddings (id INTEGER PRIMARY KEY, type INT, assetUUID TEXT, vector BLOB, UNIQUE(type, assetUUID, vector))");
    v40 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM ga where ROWID IN (SELECT ga.rowid FROM ga JOIN groups ON ga.groupid = groups.rowid WHERE ga.assetid = ? AND groups.category IN matchingIds);");
    if (v40)
      CFDictionarySetValue(Mutable, CFSTR("deleteGAForSelectedGroupsCategories"), v40);
    v41 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "DELETE FROM gc where ROWID IN (SELECT gc.rowid FROM gc JOIN groups ON gc.groupid = groups.rowid WHERE gc.collectionid = ? AND groups.category IN matchingIds);");
    if (v41)
      CFDictionarySetValue(Mutable, CFSTR("deleteGCForSelectedGroupsCategories"), v41);

  }
  if ((v4 & 1) != 0)
  {
    v42 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM prefix WHERE normalized_string MATCH ?");
    if (v42)
      CFDictionarySetValue(Mutable, CFSTR("selectPrefix"), v42);
    v43 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM groups WHERE lookup_identifier = ?");
    if (v43)
      CFDictionarySetValue(Mutable, CFSTR("selectLookupGroupId"), v43);
    v44 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM groups WHERE owning_groupid = 0 AND lookup_identifier = ? LIMIT 1");
    if (v44)
      CFDictionarySetValue(Mutable, CFSTR("selectLookupGroupIdLimit1"), v44);
    v45 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT content_string FROM groups WHERE rowid = ?");
    if (v45)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupAlt"), v45);
    v46 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1 FROM assets WHERE rowid IN matchingIds ORDER BY creationDate");
    if (v46)
      CFDictionarySetValue(Mutable, CFSTR("selectAssetIdsInDateSorted"), v46);
    v47 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets ORDER BY creationDate DESC LIMIT ?");
    if (v47)
      CFDictionarySetValue(Mutable, CFSTR("selectAssetIdsDateSortedDescWithLimit"), v47);
    v48 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1, startDate, endDate, title, subtitle, type, keyAssetUUIDPrivate, keyAssetUUIDShared, assetsCountPrivate, assetsCountShared, sortDate FROM collections WHERE rowid IN matchingIds");
    if (v48)
      CFDictionarySetValue(Mutable, CFSTR("selectCollectionIn"), v48);
    v49 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1 FROM collections WHERE rowid IN matchingIds");
    if (v49)
      CFDictionarySetValue(Mutable, CFSTR("selectCollectionIdsIn"), v49);
    v50 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, category, owning_groupid, content_string, normalized_string, lookup_identifier, score, token_ranges_0, token_ranges_1 FROM groups WHERE rowid = ?");
    if (v50)
      CFDictionarySetValue(Mutable, CFSTR("fetchGroupForGroupId"), v50);
    v51 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, category, owning_groupid, content_string, normalized_string, lookup_identifier, score, token_ranges_0, token_ranges_1 FROM groups WHERE rowid IN matchingIds");
    if (v51)
      CFDictionarySetValue(Mutable, CFSTR("fetchGroupsForGroupIds"), v51);
    v52 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM groups WHERE content_string = ? AND category = ? LIMIT 1");
    if (v52)
      CFDictionarySetValue(Mutable, CFSTR("fetchGroupsForTextAndCategory"), v52);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT rowid, category, owning_groupid, content_string, normalized_string, lookup_identifier, score, token_ranges_0, token_ranges_1 FROM groups WHERE rowid IN matchingIds AND category != %lu"), 2100);
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v53, "UTF8String"));
    if (v54)
      CFDictionarySetValue(Mutable, CFSTR("fetchNonFilenameGroupsForGroupIds"), v54);

    v55 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections");
    if (v55)
      CFDictionarySetValue(Mutable, CFSTR("selectCollection"), v55);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT groups.rowid, content_string, normalized_string, token_ranges_0, token_ranges_1, assetid FROM groups                                                 JOIN ga ON groups.rowid == ga.groupid                                                 WHERE groups.rowid IN matchingIds AND groups.category == %lu"), 2100);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT groups.rowid, content_string, normalized_string, token_ranges_0, token_ranges_1, assetid FROM groups                                                               JOIN ga ON groups.rowid == ga.groupid                                                               JOIN assets ON ga.assetid == assets.rowid                                                               WHERE groups.rowid IN matchingIds AND groups.category == %lu"), 2100);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_retainAutorelease(v56);
    v59 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v58, "UTF8String"));
    if (v59)
      CFDictionarySetValue(Mutable, CFSTR("fetchFilenameGroupsForGroupIds"), v59);
    objc_msgSend(v57, "stringByAppendingString:", CFSTR(" AND creationDate & ? == ?"));
    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v61 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v60, "UTF8String"));
    if (v61)
      CFDictionarySetValue(Mutable, CFSTR("fetchFilenameGroupsForGroupIdsWithSingleDate"), v61);

    objc_msgSend(v57, "stringByAppendingString:", CFSTR(" AND creationDate & ? >= ?"));
    v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v63 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v62, "UTF8String"));
    if (v63)
      CFDictionarySetValue(Mutable, CFSTR("fetchFilenameGroupsForGroupIdsWithStartDate"), v63);

    objc_msgSend(v57, "stringByAppendingString:", CFSTR(" AND creationDate & ? <= ?"));
    v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v65 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v64, "UTF8String"));
    if (v65)
      CFDictionarySetValue(Mutable, CFSTR("fetchFilenameGroupsForGroupIdsWithEndDate"), v65);

    objc_msgSend(v57, "stringByAppendingString:", CFSTR(" AND creationDate & ? >= ? AND creationDate & ? <= ?"));
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v67 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v66, "UTF8String"));
    if (v67)
      CFDictionarySetValue(Mutable, CFSTR("fetchFilenameGroupsForGroupIdsWithStartEndDates"), v67);

    v68 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT groupid FROM ga WHERE assetid IN matchingIds");
    if (v68)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupIdsInGAWithAssetIds"), v68);
    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT groupid, assetid FROM ga WHERE assetid IN matchingIds"));
    v69 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqAssetIdsByGroupIdForAssetIdsStatement = self->_inqAssetIdsByGroupIdForAssetIdsStatement;
    self->_inqAssetIdsByGroupIdForAssetIdsStatement = v69;

    v71 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT groupid FROM gc WHERE collectionid IN matchingIds");
    if (v71)
      CFDictionarySetValue(Mutable, CFSTR("selectGroupIdsInGCWithCollectionIds"), v71);
    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT groupid, collectionid FROM gc WHERE collectionid IN matchingIds"));
    v72 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqCollectionIdsByGroupIdForCollectionIdsStatement = self->_inqCollectionIdsByGroupIdForCollectionIdsStatement;
    self->_inqCollectionIdsByGroupIdForCollectionIdsStatement = v72;

    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT count(*) from ga WHERE groupid = ?"));
    v74 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqNumberOfAssetsMatchingGroupWithIdStatement = self->_inqNumberOfAssetsMatchingGroupWithIdStatement;
    self->_inqNumberOfAssetsMatchingGroupWithIdStatement = v74;

    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT count(*), groupid from ga WHERE groupid IN matchingIds GROUP BY groupid"));
    v76 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement;
    self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement = v76;

    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT count(*) from gc WHERE groupid = ?"));
    v78 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqNumberOfCollectionsMatchingGroupWithIdStatement = self->_inqNumberOfCollectionsMatchingGroupWithIdStatement;
    self->_inqNumberOfCollectionsMatchingGroupWithIdStatement = v78;

    -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT count(*), groupid from gc WHERE groupid IN matchingIds GROUP BY groupid"));
    v80 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
    inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement;
    self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement = v80;

    v82 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT category, owning_groupid, content_string FROM groups WHERE owning_groupid IN matchingIds");
    if (v82)
      CFDictionarySetValue(Mutable, CFSTR("selectSynonymInfoWithOwningGroupIds"), v82);
    v83 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, uuid_0, uuid_1 FROM assets ORDER BY rowid");
    if (v83)
      CFDictionarySetValue(Mutable, CFSTR("kSelectAssetIds"), v83);
    v84 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, uuid_0, uuid_1 FROM collections ORDER BY rowid");
    if (v84)
      CFDictionarySetValue(Mutable, CFSTR("kSelectCollectionIds"), v84);

  }
  v85 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, owning_groupid, score FROM groups WHERE category = ? AND lookup_identifier = ? LIMIT 1");
  if (v85)
    CFDictionarySetValue(Mutable, CFSTR("selectGroupWithLookupId"), v85);
  v86 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid, owning_groupid, score FROM groups WHERE category = ? AND content_string = ? AND lookup_identifier = ? LIMIT 1");
  if (v86)
    CFDictionarySetValue(Mutable, CFSTR("selectGroup"), v86);
  v87 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? == ? ORDER BY rowid");
  if (v87)
    CFDictionarySetValue(Mutable, CFSTR("selectWithSingleDateAsset"), v87);
  v88 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? >= ? ORDER BY rowid");
  if (v88)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartDateAsset"), v88);
  v89 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? <= ? ORDER BY rowid");
  if (v89)
    CFDictionarySetValue(Mutable, CFSTR("selectWithEndDateAsset"), v89);
  v90 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? >= ? AND creationDate & ? <= ? ORDER BY rowid");
  if (v90)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartEndDatesAsset"), v90);
  v91 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT assetid FROM ga WHERE groupid = ? ORDER BY assetid");
  if (v91)
    CFDictionarySetValue(Mutable, CFSTR("selectGA"), v91);
  v92 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? == ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid");
  if (v92)
    CFDictionarySetValue(Mutable, CFSTR("selectWithSingleDateGA"), v92);
  v93 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? >= ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid");
  if (v93)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartDateGA"), v93);
  v94 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? <= ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid");
  if (v94)
    CFDictionarySetValue(Mutable, CFSTR("selectWithEndDateGA"), v94);
  v95 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE creationDate & ? >= ? AND creationDate & ? <= ? AND rowid IN (SELECT assetid FROM ga WHERE groupid = ?) ORDER BY rowid");
  if (v95)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartEndDatesGA"), v95);
  v96 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE startDate & ? <= ? AND endDate & ? >= ? ORDER BY rowid");
  if (v96)
    CFDictionarySetValue(Mutable, CFSTR("selectWithSingleDateCollection"), v96);
  v97 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE endDate & ? >= ? ORDER BY rowid");
  if (v97)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartDateCollection"), v97);
  v98 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE startDate & ? <= ? ORDER BY rowid");
  if (v98)
    CFDictionarySetValue(Mutable, CFSTR("selectWithEndDateCollection"), v98);
  v99 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE endDate & ? >= ? AND startDate & ? <= ? ORDER BY rowid");
  if (v99)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartEndDatesCollection"), v99);
  v100 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT collectionid FROM gc WHERE groupid = ? ORDER BY collectionid");
  if (v100)
    CFDictionarySetValue(Mutable, CFSTR("selectGC"), v100);
  v101 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE startDate & ? <= ? AND endDate & ? >= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid");
  if (v101)
    CFDictionarySetValue(Mutable, CFSTR("selectWithSingleDateGC"), v101);
  v102 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE endDate & ? >= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid");
  if (v102)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartDateGC"), v102);
  v103 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE startDate & ? <= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid");
  if (v103)
    CFDictionarySetValue(Mutable, CFSTR("selectWithEndDateGC"), v103);
  v104 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM collections WHERE endDate & ? >= ? AND startDate & ? <= ? AND rowid IN (SELECT collectionid FROM gc WHERE groupid = ?) ORDER BY rowid");
  if (v104)
    CFDictionarySetValue(Mutable, CFSTR("selectWithStartEndDatesGC"), v104);
  v105 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT uuid_0, uuid_1 FROM assets WHERE rowid IN matchingIds");
  if (v105)
    CFDictionarySetValue(Mutable, CFSTR("selectAssetIdsIn"), v105);
  -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT rowid, uuid_0, uuid_1 FROM assets WHERE rowid IN matchingIds"));
  v106 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  assetUUIDByAssetIdWithAssetIdsStatement = self->_assetUUIDByAssetIdWithAssetIdsStatement;
  self->_assetUUIDByAssetIdWithAssetIdsStatement = v106;

  -[PSIDatabase statementFromString:](self, "statementFromString:", CFSTR("SELECT rowid, uuid_0, uuid_1, startDate, endDate, title, subtitle, type, keyAssetUUIDPrivate, keyAssetUUIDShared, assetsCountPrivate, assetsCountShared, sortDate FROM collections WHERE rowid IN matchingIds"));
  v108 = (PSIStatement *)objc_claimAutoreleasedReturnValue();
  collectionResultByCollectionIdWithCollectionIdsStatement = self->_collectionResultByCollectionIdWithCollectionIdsStatement;
  self->_collectionResultByCollectionIdWithCollectionIdsStatement = v108;

  v110 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT rowid FROM groups WHERE category IN matchingIds");
  if (v110)
    CFDictionarySetValue(Mutable, CFSTR("selectGroupsWithCategories"), v110);
  v111 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "SELECT score FROM groups WHERE rowid = ? LIMIT 1");
  if (v111)
    CFDictionarySetValue(Mutable, CFSTR("selectRankingScoreForGroupId"), v111);

  return Mutable;
}

- (void)_finalizeEverything
{
  __CFDictionary *inqPreparedStatements;

  if (self->_inqDatabase)
  {
    inqPreparedStatements = self->_inqPreparedStatements;
    if (inqPreparedStatements)
    {
      CFDictionaryApplyFunction(inqPreparedStatements, (CFDictionaryApplierFunction)finalizeSqliteStatementInDictionary, 0);
      CFRelease(self->_inqPreparedStatements);
      self->_inqPreparedStatements = 0;
    }
    if ((objc_msgSend((id)objc_opt_class(), "_lemonadeIsEnabled") & 1) == 0)
      -[PSIWordEmbeddingTable finalizze](self->_inqWordEmbeddingTable, "finalizze");
    -[PSIStatement finalizze](self->_assetUUIDByAssetIdWithAssetIdsStatement, "finalizze");
    -[PSIStatement finalizze](self->_collectionResultByCollectionIdWithCollectionIdsStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqAssetIdsByGroupIdForAssetIdsStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqCollectionIdsByGroupIdForCollectionIdsStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqNumberOfAssetsMatchingGroupWithIdStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqNumberOfCollectionsMatchingGroupWithIdStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqIdsOfAllGroupsStatement, "finalizze");
    -[PSIStatement finalizze](self->_inqIdsOfAllGroupsInPrefixStatement, "finalizze");
  }
}

- (void)dealloc
{
  NSObject *v3;
  int v4;
  __CFDictionary *inqGroupObjectsById;
  objc_super v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_inqDatabase)
  {
    -[PSIDatabase _finalizeEverything](self, "_finalizeEverything");
    PLSearchBackendPSIDatabaseGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Closing sqlite3 database", buf, 2u);
    }

    v4 = sqlite3_close(self->_inqDatabase);
    self->_inqDatabase = 0;
    if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("Couldn't close db");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
  }
  inqGroupObjectsById = self->_inqGroupObjectsById;
  if (inqGroupObjectsById)
    CFRelease(inqGroupObjectsById);
  v6.receiver = self;
  v6.super_class = (Class)PSIDatabase;
  -[PSIDatabase dealloc](&v6, sel_dealloc);
}

- (void)_inqAsync:(id)a3
{
  pl_dispatch_async();
}

- (void)_inqSync:(id)a3
{
  pl_dispatch_sync();
}

- (void)_inSearchQueueAsync:(id)a3
{
  pl_dispatch_async();
}

- (void)updateSearchMetadata
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__PSIDatabase_updateSearchMetadata__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v2);
}

- (void)dropDatabaseWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  PLSearchBackendPSIDatabaseGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Dropping database", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke;
  v11[3] = &unk_1E3674E40;
  v11[4] = self;
  v12 = v4;
  v7 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3675C58;
  v9[4] = self;
  v10 = (id)MEMORY[0x19AEC174C](v11);
  v8 = v10;
  -[PSIDatabase _inqAsync:](self, "_inqAsync:", v9);

}

- (BOOL)isDatabaseCorrupted
{
  NSObject *v3;
  uint8_t v4;
  _QWORD v6[6];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  char v10;

  PLSearchBackendPSIDatabaseGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Running database integrity quick check", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v8 = buf;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PSIDatabase_isDatabaseCorrupted__block_invoke;
  v6[3] = &unk_1E3677C68;
  v6[4] = self;
  v6[5] = buf;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v6);
  v4 = v8[24];
  _Block_object_dispose(buf, 8);
  return v4;
}

- (void)_ingRebuildPrefixTableIfNeeded
{
  NSObject *v3;
  sqlite3_stmt *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  sqlite3_stmt *v8;
  int v9;
  const __CFString *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLSearchBackendPSIDatabaseGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Running database prefix table integrity check", (uint8_t *)&v15, 2u);
  }

  v4 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO prefix(prefix) VALUES('integrity-check')");
  v5 = sqlite3_step(v4);
  sqlite3_finalize(v4);
  PLSearchBackendPSIDatabaseGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 267)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Database corruption detected in the prefix table.", (uint8_t *)&v15, 2u);
    }

    v8 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", "INSERT INTO prefix(prefix) VALUES('rebuild')");
    v9 = sqlite3_step(v8);
    sqlite3_finalize(v8);
    PLSearchBackendPSIDatabaseGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("error");
      if (v9 == 101)
        v10 = CFSTR("success");
      v15 = 138543618;
      v16 = v10;
      v17 = 1026;
      v18 = v9;
      v11 = "Completed prefix table rebuild: %{public}@. Result code: %{public}d";
      v12 = v7;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 18;
      goto LABEL_12;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    v11 = "Prefix table integrity check successful";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 2;
LABEL_12:
    _os_log_impl(&dword_199541000, v12, v13, v11, (uint8_t *)&v15, v14);
  }

}

- (void)updateRankingScoreForGroups:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD);
  const __CFString *v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v8 = objc_msgSend(v6, "count");
  if ((self->_options & 2) != 0 && self->_databaseIsValid && (v9 = (const __CFString *)v8) != 0)
  {
    PLSearchBackendPSIDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "PSI Ranking Update: Updating group rankings for %ld groups. Groups: %@", buf, 0x16u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke;
    v11[3] = &unk_1E3674E68;
    v11[4] = self;
    v13 = v7;
    v12 = v6;
    v14 = v9;
    -[PSIDatabase _inqAsync:](self, "_inqAsync:", v11);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)addAsset:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSIDatabase addAssets:withCompletion:](self, "addAssets:withCompletion:", v9, v7, v10, v11);
}

- (void)addAssets:(id)a3 withCompletion:(id)a4
{
  -[PSIDatabase addAssets:deferRemovingUnusedGroups:withCompletion:](self, "addAssets:deferRemovingUnusedGroups:withCompletion:", a3, 0, a4);
}

- (void)addAssets:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 withCompletion:(id)a5
{
  __CFString *v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  _QWORD v14[5];
  __CFString *v15;
  void (**v16)(_QWORD);
  BOOL v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (void (**)(_QWORD))a5;
  PLSearchBackendPSIDatabaseGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Adding assets: %@", buf, 0xCu);
  }

  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v11 = -[__CFString count](v8, "count");
  if ((self->_options & 2) == 0)
    goto LABEL_7;
  if (self->_databaseIsValid && v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke;
    v14[3] = &unk_1E36755F8;
    v14[4] = self;
    v16 = v9;
    v15 = v8;
    v17 = a4;
    -[PSIDatabase _inqAsync:](self, "_inqAsync:", v14);

    goto LABEL_19;
  }
  if (!self->_databaseIsValid)
  {
LABEL_7:
    PLSearchBackendPSIDatabaseGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid)
        v13 = CFSTR("the database is not writable");
      else
        v13 = CFSTR("the database is invalid");
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Detected invalid state, unable to add assets because %@", buf, 0xCu);
    }

  }
  if (v9)
    v9[2](v9);
LABEL_19:

}

- (void)addCollection:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSIDatabase addCollections:withCompletion:](self, "addCollections:withCompletion:", v9, v7, v10, v11);
}

- (void)addCollections:(id)a3 withCompletion:(id)a4
{
  -[PSIDatabase addCollections:deferRemovingUnusedGroups:withCompletion:](self, "addCollections:deferRemovingUnusedGroups:withCompletion:", a3, 0, a4);
}

- (void)addCollections:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 withCompletion:(id)a5
{
  __CFString *v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  __CFString *v13;
  void (**v14)(_QWORD);
  BOOL v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (void (**)(_QWORD))a5;
  PLSearchBackendPSIDatabaseGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Adding collections: %@", buf, 0xCu);
  }

  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v11 = -[__CFString count](v8, "count");
  if ((self->_options & 2) != 0 && self->_databaseIsValid && v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke;
    v12[3] = &unk_1E36755F8;
    v12[4] = self;
    v14 = v9;
    v13 = v8;
    v15 = a4;
    -[PSIDatabase _inqAsync:](self, "_inqAsync:", v12);

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (void)removeAssetWithUUID:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSIDatabase removeAssetsWithUUIDs:completion:](self, "removeAssetsWithUUIDs:completion:", v9, v7, v10, v11);
}

- (void)removeAssetsWithUUIDs:(id)a3 completion:(id)a4
{
  -[PSIDatabase removeAssetsWithUUIDs:deferRemovingUnusedGroups:completion:](self, "removeAssetsWithUUIDs:deferRemovingUnusedGroups:completion:", a3, 0, a4);
}

- (void)removeAssetsWithUUIDs:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 completion:(id)a5
{
  -[PSIDatabase _removeUUIDs:objectType:deferRemovingUnusedGroups:completion:](self, "_removeUUIDs:objectType:deferRemovingUnusedGroups:completion:", a3, 0, a4, a5);
}

- (void)removeCollectionWithUUID:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSIDatabase removeCollectionsWithUUIDs:completion:](self, "removeCollectionsWithUUIDs:completion:", v9, v7, v10, v11);
}

- (void)removeCollectionsWithUUIDs:(id)a3 completion:(id)a4
{
  -[PSIDatabase removeCollectionsWithUUIDs:deferRemovingUnusedGroups:completion:](self, "removeCollectionsWithUUIDs:deferRemovingUnusedGroups:completion:", a3, 0, a4);
}

- (void)removeCollectionsWithUUIDs:(id)a3 deferRemovingUnusedGroups:(BOOL)a4 completion:(id)a5
{
  -[PSIDatabase _removeUUIDs:objectType:deferRemovingUnusedGroups:completion:](self, "_removeUUIDs:objectType:deferRemovingUnusedGroups:completion:", a3, 1, a4, a5);
}

- (void)_removeUUIDs:(id)a3 objectType:(unint64_t)a4 deferRemovingUnusedGroups:(BOOL)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  unint64_t v16;
  BOOL v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v12 = objc_msgSend(v10, "count");
  if ((self->_options & 2) != 0 && self->_databaseIsValid && v12)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke;
    v13[3] = &unk_1E3674F08;
    v13[4] = self;
    v15 = v11;
    v14 = v10;
    v16 = a4;
    v17 = a5;
    -[PSIDatabase _inqAsync:](self, "_inqAsync:", v13);

  }
  else if (v11)
  {
    v11[2](v11);
  }

}

- (void)removeCategories:(id)a3 forAssetUUID:(id)a4 completion:(id)a5
{
  -[PSIDatabase _removeUUID:categories:objectType:completion:](self, "_removeUUID:categories:objectType:completion:", a4, a3, 0, a5);
}

- (void)_removeUUID:(id)a3 categories:(id)a4 objectType:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  _QWORD v13[5];
  id v14;
  id v15;
  void (**v16)(_QWORD);
  unint64_t v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)buf = 138412290,
         v19 = CFSTR("expect writable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke;
    v13[3] = &unk_1E3674F58;
    v13[4] = self;
    v14 = v10;
    v15 = v11;
    v17 = a5;
    v16 = v12;
    -[PSIDatabase _inqAsync:](self, "_inqAsync:", v13);

  }
  else if (v12)
  {
    v12[2](v12);
  }

}

- (void)removeUnusedGroups
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__PSIDatabase_removeUnusedGroups__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v2);
}

- (void)deleteGroupsWithGraphCollectionsForPersonUUIDs:(id)a3 withCompletion:(id)a4
{
  __CFString *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  __CFString *v11;
  void (**v12)(_QWORD);
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(_QWORD))a4;
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)buf = 138412290,
         v14 = CFSTR("expect writable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid
    && -[__CFString count](v6, "count"))
  {
    PLSearchBackendPSIDatabaseGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Search Indexing: Deleting groups with Knowledge Graph collections for renamed persons with UUIDs: %{public}@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke;
    v10[3] = &unk_1E3676290;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[PSIDatabase _inqAsync:](self, "_inqAsync:", v10);

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Search Indexing: Unable to delete groups with Knowledge Graph collections for renamed persons with UUIDs: %{public}@", buf, 0xCu);
    }

    if (v7)
      v7[2](v7);
  }

}

- (id)allCollectionUUIDsWithCollectionType:(unint64_t)a3
{
  id v5;
  const void *Value;
  id v7;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((self->_options & 2) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return MEMORY[0x1E0C9AA60];
    *(_DWORD *)buf = 138412290;
    v13 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    if ((self->_options & 2) == 0)
      return MEMORY[0x1E0C9AA60];
  }
  if (!self->_databaseIsValid)
    return MEMORY[0x1E0C9AA60];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("listCollections"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PSIDatabase_allCollectionUUIDsWithCollectionType___block_invoke;
  v9[3] = &unk_1E3674F80;
  v11 = a3;
  v7 = v5;
  v10 = v7;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v9);

  return v7;
}

- (id)allAssetUUIDsForGroupsWithCategories:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (((self->_options & 2) != 0
     || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     && (LODWORD(buf) = 138412290,
         *(_QWORD *)((char *)&buf + 4) = CFSTR("expect writable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu),
         (self->_options & 2) != 0))
    && self->_databaseIsValid)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__93030;
    v13 = __Block_byref_object_dispose__93031;
    v14 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PSIDatabase_allAssetUUIDsForGroupsWithCategories___block_invoke;
    v7[3] = &unk_1E3676EA0;
    v7[4] = self;
    v8 = v4;
    p_buf = &buf;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v7);
    v5 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)newQueryWithSearchTextV2:(id)a3 queryTokens:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 searchSuggestionType:(unint64_t)a7 useWildcardSearchText:(BOOL)a8 enableExactMatchPrioritization:(BOOL)a9 libraryScope:(unint64_t)a10 suggestionLimit:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  PSIQuery *v19;
  uint64_t v21;
  _BOOL4 v22;

  v22 = a8;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  LOBYTE(v21) = a9;
  v19 = -[PSIQuery initWithQueryTokensV2:searchText:scopedSearchIdentifiers:searchResultTypes:searchSuggestionType:useWildcardText:enableExactMatchPrioritization:delegate:libraryScope:suggestionLimit:]([PSIQuery alloc], "initWithQueryTokensV2:searchText:scopedSearchIdentifiers:searchResultTypes:searchSuggestionType:useWildcardText:enableExactMatchPrioritization:delegate:libraryScope:suggestionLimit:", v17, v18, v16, a6, a7, v22, v21, self, a10, a11);

  return v19;
}

- (id)newQueryWithSearchText:(id)a3 queryTokens:(id)a4 useWildcardSearchText:(BOOL)a5 libraryScope:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  PSIQuery *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v7 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((self->_options & 1) != 0
    || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
    && (v14 = 138412290,
        v15 = CFSTR("expect searchable"),
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu),
        (self->_options & 1) != 0))
  {
    v12 = -[PSIQuery initWithQueryTokens:searchText:useWildcardText:delegate:libraryScope:]([PSIQuery alloc], "initWithQueryTokens:searchText:useWildcardText:delegate:libraryScope:", v11, v10, v7, self, a6);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_inqOwningContentStringForGroupResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "groups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)((int)objc_msgSend(v8, "category") - 1) > 0xD)
    {
      v9 = 0;
    }
    else
    {
      -[PSIDatabase _inqContentStringForGroupId:](self, "_inqContentStringForGroupId:", objc_msgSend(v8, "owningGroupId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_inqAssetUUIDsForAssetIds:(__CFArray *)a3 range:(_NSRange)a4 creationDateSorted:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  void *v10;
  const __CFString *v11;
  const void *Value;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  if (!a4.length)
    return MEMORY[0x1E0C9AA60];
  v5 = a5;
  length = a4.length;
  location = a4.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4.length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, location, length);
  if (v5)
    v11 = CFSTR("selectAssetIdsInDateSorted");
  else
    v11 = CFSTR("selectAssetIdsIn");
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PSIDatabase__inqAssetUUIDsForAssetIds_range_creationDateSorted___block_invoke;
  v16[3] = &unk_1E3674FA8;
  v17 = v10;
  v13 = v10;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v16);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (id)_inqCollectionUUIDsForCollectionIds:(__CFArray *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  const void *Value;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  if (!a4.length)
    return MEMORY[0x1E0C9AA60];
  length = a4.length;
  location = a4.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, location, length);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectCollectionIdsIn"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PSIDatabase__inqCollectionUUIDsForCollectionIds_range___block_invoke;
  v13[3] = &unk_1E3674FA8;
  v14 = v8;
  v10 = v8;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v13);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (id)_inqAssetUUIDsForAssetIds:(__CFSet *)a3
{
  CFIndex Count;
  void *v6;
  const void *Value;
  id v8;
  _QWORD v10[4];
  id v11;

  Count = CFSetGetCount(a3);
  if (!Count)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectAssetIdsIn"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__PSIDatabase__inqAssetUUIDsForAssetIds___block_invoke;
  v10[3] = &unk_1E3674FA8;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (id)_inqCollectionResultsForCollectionIds:(__CFArray *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  const void *Value;
  id v10;
  unint64_t v11;
  NSUInteger v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSUInteger v18;
  __int16 v19;
  NSUInteger v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4.length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, location, length);
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectCollectionIn"));
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PSIDatabase__inqCollectionResultsForCollectionIds_range___block_invoke;
    v15[3] = &unk_1E3674FA8;
    v10 = v8;
    v16 = v10;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v15);
    -[PSIIntArray unbind](self->_matchingIds, "unbind");
    v11 = objc_msgSend(v10, "count");
    v12 = length - v11;
    if (length > v11)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        v18 = v12;
        v19 = 2050;
        v20 = length;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Couldn't fetch %{public}lu collections of %{public}lu collectionIds.", buf, 0x16u);
      }

    }
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  return v10;
}

- (id)allCollections
{
  CFMutableArrayRef Mutable;
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__93030;
  v12 = __Block_byref_object_dispose__93031;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PSIDatabase_allCollections__block_invoke;
  v7[3] = &unk_1E3675800;
  v7[5] = &v8;
  v7[6] = Mutable;
  v7[4] = self;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v7);
  CFRelease(Mutable);
  v4 = (void *)v9[5];
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_inqContentStringForGroupId:(unint64_t)a3
{
  sqlite3_stmt *Value;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__93030;
  v13 = __Block_byref_object_dispose__93031;
  v14 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupAlt"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PSIDatabase__inqContentStringForGroupId___block_invoke;
  v8[3] = &unk_1E3674FF0;
  v8[4] = &v9;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_inqGroupResultWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6;
  id v7;
  PSIGroupResult *v8;
  PSIGroupResultGroupSnapshot *v9;
  void *v10;
  __CFArray *v11;
  __CFArray *v12;
  __CFArray *v13;
  __CFArray *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PSIGroupResult initWithQueue:]([PSIGroupResult alloc], "initWithQueue:", self->_groupResultsQueue);
  -[PSIGroupResult setDelegate:](v8, "setDelegate:", self);
  v9 = -[PSIGroupResultGroupSnapshot initWithDateFilter:datedTokens:]([PSIGroupResultGroupSnapshot alloc], "initWithDateFilter:datedTokens:", v6, v7);

  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIGroupResult setGroups:](v8, "setGroups:", v10);

  v11 = -[PSIDatabase _inqNewAssetIdsWithDateFilter:](self, "_inqNewAssetIdsWithDateFilter:", v6);
  if (v11)
  {
    v12 = v11;
    -[PSIGroupResult setAssetIds:](v8, "setAssetIds:", v11);
    CFRelease(v12);
  }
  v13 = -[PSIDatabase _inqNewCollectionIdsWithDateFilter:](self, "_inqNewCollectionIdsWithDateFilter:", v6);
  if (v13)
  {
    v14 = v13;
    -[PSIGroupResult setCollectionIds:](v8, "setCollectionIds:", v13);
    CFRelease(v14);
  }

  return v8;
}

- (__CFSet)_inqNewGroupIdsMatchingString:(id)a3 textIsSearchable:(BOOL)a4
{
  return -[PSIDatabase _inqNewGroupIdsMatchingString:categories:textIsSearchable:](self, "_inqNewGroupIdsMatchingString:categories:textIsSearchable:", a3, 0, a4);
}

- (__CFSet)_inqNewGroupIdsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  char *v10;
  __CFSet *Mutable;
  const __CFString *v12;
  void *v13;
  unint64_t i;
  id v15;
  sqlite3_stmt *v16;
  uint64_t v17;
  int v18;
  int v19;
  const __CFString *v20;
  sqlite3_stmt *Value;
  int v22;
  _QWORD v24[5];
  _QWORD v25[7];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  int v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int128 v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = 0;
  v10 = _newUTF8String(v8, &v31);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  if (v9)
  {
    if (v5)
      v12 = CFSTR("SELECT rowid FROM prefix WHERE normalized_string MATCH ? AND category IN (?");
    else
      v12 = CFSTR("SELECT rowid FROM groups WHERE lookup_identifier = ? AND category IN (?");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i < objc_msgSend(v9, "count"); ++i)
      objc_msgSend(v13, "appendString:", CFSTR(", ?"));
    objc_msgSend(v13, "appendString:", CFSTR(")"));
    v15 = objc_retainAutorelease(v13);
    v16 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v15, "UTF8String"));
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = &v34;
    v35 = 0x2020000000;
    v36 = 2;
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_2;
    v25[3] = &unk_1E3675018;
    v25[5] = &v34;
    v25[6] = v16;
    v25[4] = &v27;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v25);
    v18 = sqlite3_bind_text(v16, 1, v10, v31, 0);
    *((_DWORD *)v28 + 6) = v18;
    if (v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_359;
    v24[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v24[4] = Mutable;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", v16, v24);
    v19 = sqlite3_finalize(v16);
    *((_DWORD *)v28 + 6) = v19;
    if (v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = CFSTR("Failed to finalize statement");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    if (v5)
      v20 = CFSTR("selectPrefix");
    else
      v20 = CFSTR("selectLookupGroupId");
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, v20);
    v22 = sqlite3_bind_text(Value, 1, v10, v31, 0);
    *((_DWORD *)v28 + 6) = v22;
    if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v34) = 138412290;
      *(_QWORD *)((char *)&v34 + 4) = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v34, 0xCu);
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke;
    v26[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v26[4] = Mutable;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v26);
  }
  if (v10)
    free(v10);
  _Block_object_dispose(&v27, 8);

  return Mutable;
}

- (__CFSet)_inqNewGroupIdsWithCategories:(id)a3
{
  const __CFAllocator *v4;
  id v5;
  __CFSet *Mutable;
  CFIndex v7;
  CFMutableArrayRef v8;
  uint64_t v9;
  const void *Value;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = a3;
  Mutable = CFSetCreateMutable(v4, 0, 0);
  v7 = objc_msgSend(v5, "count");
  v8 = CFArrayCreateMutable(v4, v7, 0);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke;
  v13[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
  v13[4] = v8;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v13);

  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", v8, 0, v7);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupsWithCategories"));
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke_2;
  v12[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v12[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v12);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  CFRelease(v8);
  return Mutable;
}

- (id)_inqGroupWithFilenameStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 excludingGroupId:(unint64_t)a5 searchResultTypes:(unint64_t)a6
{
  return -[PSIDatabase _inqGroupWithStatement:dateFilter:includeObjects:isFilenameStatement:excludingGroupId:searchResultTypes:](self, "_inqGroupWithStatement:dateFilter:includeObjects:isFilenameStatement:excludingGroupId:searchResultTypes:", a3, a4, 0, 1, a5, a6);
}

- (id)_inqGroupWithStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6
{
  return -[PSIDatabase _inqGroupWithStatement:dateFilter:includeObjects:isFilenameStatement:excludingGroupId:searchResultTypes:](self, "_inqGroupWithStatement:dateFilter:includeObjects:isFilenameStatement:excludingGroupId:searchResultTypes:", a3, a4, a5, 0, 0, a6);
}

- (id)_inqGroupWithStatement:(sqlite3_stmt *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 isFilenameStatement:(BOOL)a6 excludingGroupId:(unint64_t)a7 searchResultTypes:(unint64_t)a8
{
  char v8;
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  sqlite3_int64 v15;
  PSIGroup *v16;
  sqlite3_int64 v17;
  uint64_t v18;
  __CFArray *v19;
  __CFArray *v20;
  char v22;

  v8 = a8;
  v10 = a6;
  v11 = a5;
  v14 = a4;
  v15 = sqlite3_column_int64(a3, 0);
  if (v15 == a7)
  {
    v16 = 0;
  }
  else
  {
    v17 = v15;
    v22 = 0;
    if (v14 || !v11)
    {
      v16 = objc_alloc_init(PSIGroup);
      -[PSIGroup setGroupId:](v16, "setGroupId:", v17);
    }
    else
    {
      -[PSIDatabase _inqDequeueGroupObjectWithId:isCachedGroup:](self, "_inqDequeueGroupObjectWithId:isCachedGroup:", v15, &v22);
      v16 = (PSIGroup *)objc_claimAutoreleasedReturnValue();
      if (v22)
        goto LABEL_18;
    }
    if (v10)
      -[PSIGroup prepareFromFilenameStatement:](v16, "prepareFromFilenameStatement:", a3);
    else
      -[PSIGroup prepareFromStatement:](v16, "prepareFromStatement:", a3);
    v18 = -[PSIGroup groupIdForObjectLookup](v16, "groupIdForObjectLookup");
    if (PLSearchIndexCategoryIsSynonym(-[PSIGroup category](v16, "category")))
    {
      -[PSIDatabase _inqScoreForGroupID:](self, "_inqScoreForGroupID:", v18);
      -[PSIGroup setScore:](v16, "setScore:");
    }
    if (v11)
    {
      if ((v8 & 1) != 0)
      {
        v19 = -[PSIDatabase _inqNewAssetIdsForGroupId:dateFilter:](self, "_inqNewAssetIdsForGroupId:dateFilter:", v18, v14);
        -[PSIGroup setAssetIds:](v16, "setAssetIds:", v19);
        CFRelease(v19);
      }
      if ((v8 & 2) != 0)
      {
        v20 = -[PSIDatabase _inqNewCollectionIdsForGroupId:dateFilter:](self, "_inqNewCollectionIdsForGroupId:dateFilter:", v18, v14);
        -[PSIGroup setCollectionIds:](v16, "setCollectionIds:", v20);
        CFRelease(v20);
      }
    }
  }
LABEL_18:

  return v16;
}

- (double)_inqScoreForGroupID:(unint64_t)a3
{
  sqlite3_stmt *Value;
  double v6;
  _QWORD v8[5];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectRankingScoreForGroupId"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PSIDatabase__inqScoreForGroupID___block_invoke;
  v8[3] = &unk_1E3674FF0;
  v8[4] = &v9;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_inqGroupArraysFromGroupIdSets:(id)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 progressBlock:(id)a6
{
  id v10;
  void (**v11)(id, _BYTE *, double);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t Count;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v30 = a4;
  v11 = (void (**)(id, _BYTE *, double))a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v13);
        Count = CFSetGetCount(*(CFSetRef *)(*((_QWORD *)&v36 + 1) + 8 * i));
        if (Count > v16)
          v16 = Count;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  -[PSIIntArray prepareForNumberOfElements:](self->_matchingIds, "prepareForNumberOfElements:", v16);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v26 = (void *)MEMORY[0x19AEC1554]();
        if (v11)
        {
          v31 = 0;
          v11[2](v11, &v31, 0.5);
          if (v31)
          {
            objc_autoreleasePoolPop(v26);
            goto LABEL_23;
          }
        }
        -[PSIDatabase _inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:](self, "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", v25, v30, 1, a5, 0, v30);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v27);

        objc_autoreleasePoolPop(v26);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_23:

  -[PSIIntArray unprepare](self->_matchingIds, "unprepare");
  v28 = (void *)objc_msgSend(v12, "copy");

  return v28;
}

- (id)_inqAssetUUIDByAssetIdWithAssetIds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PSIStatement *assetUUIDByAssetIdWithAssetIdsStatement;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v5);

  assetUUIDByAssetIdWithAssetIdsStatement = self->_assetUUIDByAssetIdWithAssetIdsStatement;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PSIDatabase__inqAssetUUIDByAssetIdWithAssetIds___block_invoke;
  v10[3] = &unk_1E3675060;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", assetUUIDByAssetIdWithAssetIdsStatement, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (id)assetUUIDByAssetIdWithAssetIds:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__93030;
  v15 = __Block_byref_object_dispose__93031;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PSIDatabase_assetUUIDByAssetIdWithAssetIds___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_inqCollectionResultByCollectionIdWithCollectionIds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PSIStatement *collectionResultByCollectionIdWithCollectionIdsStatement;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v5);

  collectionResultByCollectionIdWithCollectionIdsStatement = self->_collectionResultByCollectionIdWithCollectionIdsStatement;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PSIDatabase__inqCollectionResultByCollectionIdWithCollectionIds___block_invoke;
  v10[3] = &unk_1E3675060;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", collectionResultByCollectionIdWithCollectionIdsStatement, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (id)collectionResultByCollectionIdWithCollectionIds:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__93030;
  v15 = __Block_byref_object_dispose__93031;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PSIDatabase_collectionResultByCollectionIdWithCollectionIds___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_processNextKeywordSuggestionsForQuery:(id)a3 groupResults:(id)a4 allowIdentifiers:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  const __CFAllocator *v9;
  CFMutableSetRef Mutable;
  CFMutableSetRef v11;
  CFMutableSetRef v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  CFAbsoluteTime v22;
  uint64_t v23;
  unint64_t v24;
  __CFSet *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  CFAbsoluteTime v37;
  id v38;
  void *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  int v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  os_signpost_id_t v64;
  unint64_t v65;
  void *v66;
  id v67;
  unint64_t v68;
  double v69;
  double v70;
  double v71;
  PSIRankedGroup *v72;
  unint64_t v73;
  double v74;
  unint64_t v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  CFAbsoluteTime v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unint64_t v90;
  void *v91;
  unint64_t v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  os_signpost_id_t v97;
  NSObject *v98;
  NSObject *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t j;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  void *v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  CFAbsoluteTime v128;
  os_signpost_id_t v129;
  NSObject *v130;
  NSObject *v131;
  void *v132;
  id v133;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  CFAbsoluteTime v137;
  void *v138;
  _BOOL4 v139;
  void *v140;
  uint64_t *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t k;
  void *v146;
  uint64_t *v147;
  uint64_t *v148;
  void *v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t m;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  os_signpost_id_t v161;
  NSObject *v162;
  NSObject *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  id v171;
  int IsUserControlled;
  uint64_t v173;
  uint64_t v174;
  uint64_t n;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t ii;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t jj;
  void *v186;
  id v187;
  id v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  void *v192;
  void *v194;
  void *v195;
  id v196;
  void (**v197)(_QWORD, _QWORD, _QWORD);
  NSObject *v198;
  NSObject *v199;
  NSObject *v200;
  CFAbsoluteTime v201;
  id v202;
  os_signpost_id_t v203;
  void *v204;
  NSObject *v205;
  void *v206;
  unint64_t v207;
  unsigned int v208;
  id v209;
  int v210;
  void *v211;
  void (**v212)(_QWORD, _QWORD, _QWORD, _QWORD, double, double);
  id v213;
  void *v214;
  void *v215;
  void *v216;
  __CFSet *v217;
  void *v218;
  void *v219;
  void *v220;
  CFMutableSetRef v221;
  id v222;
  void *v223;
  NSObject *log;
  __CFSet *v225;
  __CFSet *v226;
  id v227;
  __CFSet *v228;
  void *v229;
  void (**v231)(_QWORD, _QWORD, _QWORD);
  void (**v232)(_QWORD, _QWORD, _QWORD);
  unint64_t v233;
  void *v234;
  os_signpost_id_t spid;
  void *spida;
  unint64_t v237;
  void *v238;
  NSObject *v239;
  void (**v240)(_QWORD, _QWORD);
  unint64_t v241;
  void *v242;
  id v243;
  id v244;
  void *v245;
  unint64_t v246;
  void *v247;
  id v248;
  unint64_t v249;
  uint64_t v250;
  char v251;
  os_signpost_id_t v252;
  os_signpost_id_t v253;
  os_signpost_id_t v254;
  unint64_t v255;
  void *v256;
  id v257;
  uint64_t v258;
  BOOL v259;
  NSObject *v260;
  char v261;
  unint64_t v262;
  unint64_t v263;
  void *v264;
  int v265;
  id v266;
  void *v267;
  __CFSet *v268;
  void *v269;
  uint64_t v270;
  id obj;
  NSObject *obja;
  id objb;
  id objc;
  id v276;
  id v277;
  unint64_t v278;
  void *v279;
  void *v280;
  unint64_t v281;
  uint64_t v282;
  void *v283;
  _QWORD v284[5];
  id v285;
  _QWORD v286[4];
  id v287;
  id v288;
  void *v289;
  id v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  _QWORD v315[6];
  _QWORD v316[4];
  id v317;
  __int128 *v318;
  uint64_t *v319;
  BOOL v320;
  _QWORD v321[4];
  id v322;
  _QWORD v323[4];
  id v324;
  void *v325;
  id v326;
  void (**v327)(_QWORD, _QWORD);
  uint64_t *v328;
  __int128 *v329;
  uint64_t *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t *v335;
  uint64_t v336;
  uint64_t (*v337)(uint64_t, uint64_t);
  void (*v338)(uint64_t);
  id v339;
  uint64_t v340;
  uint64_t *v341;
  uint64_t v342;
  char v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  _QWORD v348[4];
  id v349;
  id v350;
  uint64_t *v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  _QWORD v356[5];
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  _QWORD v361[5];
  __CFSet *v362;
  __CFSet *v363;
  uint8_t *v364;
  uint64_t *v365;
  uint64_t *v366;
  uint64_t v367;
  uint64_t *v368;
  uint64_t v369;
  uint64_t (*v370)(uint64_t, uint64_t);
  void (*v371)(uint64_t);
  id v372;
  uint64_t v373;
  uint64_t *v374;
  uint64_t v375;
  uint64_t (*v376)(uint64_t, uint64_t);
  void (*v377)(uint64_t);
  id v378;
  uint8_t v379[8];
  uint8_t *v380;
  uint64_t v381;
  uint64_t (*v382)(uint64_t, uint64_t);
  void (*v383)(uint64_t);
  id v384;
  _QWORD v385[5];
  _QWORD v386[4];
  __CFSet *v387;
  id v388;
  __CFSet *v389;
  uint64_t *v390;
  _QWORD v391[4];
  NSObject *v392;
  PSIDatabase *v393;
  __CFSet *v394;
  __CFSet *v395;
  __CFSet *v396;
  uint64_t *v397;
  __int128 *p_buf;
  uint64_t *v399;
  uint64_t *v400;
  uint64_t v401;
  unint64_t v402;
  uint64_t v403;
  uint64_t *v404;
  uint64_t v405;
  uint64_t (*v406)(uint64_t, uint64_t);
  void (*v407)(uint64_t);
  id v408;
  uint64_t v409;
  uint64_t *v410;
  uint64_t v411;
  uint64_t (*v412)(uint64_t, uint64_t);
  void (*v413)(uint64_t);
  id v414;
  _QWORD v415[5];
  id v416;
  id v417;
  id v418;
  __CFSet *v419;
  __CFSet *v420;
  __CFSet *v421;
  uint64_t *v422;
  uint64_t *v423;
  uint64_t *v424;
  uint64_t *v425;
  uint64_t *v426;
  uint64_t v427;
  double *v428;
  uint64_t v429;
  CFAbsoluteTime Current;
  uint64_t v431;
  uint64_t *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t *v436;
  uint64_t v437;
  char v438;
  uint64_t v439;
  uint64_t *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t *v448;
  uint64_t v449;
  uint64_t (*v450)(uint64_t, uint64_t);
  void (*v451)(uint64_t);
  id v452;
  _BYTE v453[128];
  _BYTE v454[128];
  _BYTE v455[128];
  _BYTE v456[128];
  _BYTE v457[128];
  uint8_t v458[128];
  __int128 v459;
  uint64_t v460;
  uint64_t (*v461)(uint64_t, uint64_t);
  void (*v462)(uint64_t);
  id v463;
  _BYTE v464[128];
  void *v465;
  _BYTE v466[128];
  uint8_t v467[128];
  __int128 buf;
  uint64_t v469;
  uint64_t (*v470)(uint64_t, uint64_t);
  void (*v471)(uint64_t);
  id v472;
  uint64_t v473;

  v473 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v229 = v6;
  v276 = (id)objc_msgSend(v6, "numberOfNextKeywordSuggestionToProcess");
  if (v276)
  {
    v447 = 0;
    v448 = &v447;
    v449 = 0x3032000000;
    v450 = __Block_byref_object_copy__93030;
    v451 = __Block_byref_object_dispose__93031;
    v452 = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v443 = 0;
    v444 = &v443;
    v445 = 0x2020000000;
    v446 = 0;
    v439 = 0;
    v440 = &v439;
    v441 = 0x2020000000;
    v442 = 0;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v11 = CFSetCreateMutable(v9, 0, 0);
    v12 = CFSetCreateMutable(v9, 0, 0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v435 = 0;
    v436 = &v435;
    v437 = 0x2020000000;
    v438 = 0;
    v431 = 0;
    v432 = &v431;
    v433 = 0x2020000000;
    v434 = 0;
    v427 = 0;
    v428 = (double *)&v427;
    v429 = 0x2020000000;
    Current = 0.0;
    v223 = v7;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend((id)objc_opt_class(), "searchDatabaseLog");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SearchDatabase - processNextKeywordSuggestions - nextKeywordExtract", ", (uint8_t *)&buf, 2u);
    }

    v415[0] = MEMORY[0x1E0C809B0];
    v415[1] = 3221225472;
    v415[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke;
    v415[3] = &unk_1E3675088;
    v422 = &v447;
    v415[4] = self;
    v416 = v223;
    v248 = v8;
    v417 = v248;
    v423 = &v435;
    v222 = v13;
    v418 = v222;
    v424 = &v431;
    v425 = &v443;
    v426 = &v439;
    v228 = Mutable;
    v419 = v228;
    v225 = v11;
    v420 = v225;
    v226 = v12;
    v421 = v226;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v415);
    v18 = v17;
    v19 = v18;
    log = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = os_signpost_enabled(v18);
      v19 = log;
      if (v20)
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, log, OS_SIGNPOST_INTERVAL_END, v15, "SearchDatabase - processNextKeywordSuggestions - nextKeywordExtract", ", (uint8_t *)&buf, 2u);
        v19 = log;
      }
    }

    PLSearchBackendPSIDatabaseGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = CFAbsoluteTimeGetCurrent() - v428[3];
      LODWORD(buf) = 134349056;
      *(CFAbsoluteTime *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "Next Keyword Extraction. Took %{public}f seconds.", (uint8_t *)&buf, 0xCu);
    }

    v23 = -[__CFSet count](v228, "count");
    v255 = -[__CFSet count](v225, "count");
    v262 = -[__CFSet count](v226, "count");
    v24 = -[__CFSet count](v228, "count");
    if (v24 <= 0x31 && v262 <= 9)
    {
      objc_msgSend(v229, "setNextKeywordSuggestions:", MEMORY[0x1E0C9AA60]);
LABEL_287:

      _Block_object_dispose(&v427, 8);
      _Block_object_dispose(&v431, 8);
      _Block_object_dispose(&v435, 8);

      _Block_object_dispose(&v439, 8);
      _Block_object_dispose(&v443, 8);

      _Block_object_dispose(&v447, 8);
      v7 = v223;
      goto LABEL_288;
    }
    v237 = v24;
    v221 = CFSetCreateMutable(v9, 0, 0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v469 = 0x3032000000;
    v470 = __Block_byref_object_copy__93030;
    v471 = __Block_byref_object_dispose__93031;
    v472 = 0;
    v409 = 0;
    v410 = &v409;
    v411 = 0x3032000000;
    v412 = __Block_byref_object_copy__93030;
    v413 = __Block_byref_object_dispose__93031;
    v414 = 0;
    v403 = 0;
    v404 = &v403;
    v405 = 0x3032000000;
    v406 = __Block_byref_object_copy__93030;
    v407 = __Block_byref_object_dispose__93031;
    v408 = 0;
    if (v23 | v262)
    {
      v391[0] = MEMORY[0x1E0C809B0];
      v391[1] = 3221225472;
      v391[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_368;
      v391[3] = &unk_1E36750B0;
      v401 = v23;
      v397 = &v427;
      p_buf = &buf;
      v392 = log;
      v393 = self;
      v394 = v228;
      v402 = v262;
      v395 = v221;
      v399 = &v409;
      v396 = v226;
      v400 = &v403;
      -[PSIDatabase _inqSync:](self, "_inqSync:", v391);

    }
    if (v23 == v255)
    {
      v257 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      v25 = v221;
    }
    else
    {
      v26 = (void *)-[__CFSet mutableCopy](v221, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      v386[0] = MEMORY[0x1E0C809B0];
      v386[1] = 3221225472;
      v386[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_369;
      v386[3] = &unk_1E36750D8;
      v387 = v225;
      v29 = v27;
      v388 = v29;
      v390 = &v409;
      v25 = v26;
      v389 = v25;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v386);
      v257 = v29;

    }
    if (!-[__CFSet count](v25, "count"))
    {
      objc_msgSend(v229, "setNextKeywordSuggestions:", MEMORY[0x1E0C9AA60]);
      goto LABEL_286;
    }
    v217 = v25;
    v385[0] = MEMORY[0x1E0C809B0];
    v385[1] = 3221225472;
    v385[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2;
    v385[3] = &unk_1E3675128;
    v385[4] = self;
    v215 = (void *)MEMORY[0x19AEC174C](v385);
    v30 = (void *)-[__CFSet mutableCopy](v225, "mutableCopy");
    objc_msgSend(v30, "unionSet:", v226);
    v214 = v30;
    v428[3] = CFAbsoluteTimeGetCurrent();
    v31 = os_signpost_id_generate(log);
    v32 = log;
    v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v379 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupArrays", ", v379, 2u);
    }

    *(_QWORD *)v379 = 0;
    v380 = v379;
    v381 = 0x3032000000;
    v382 = __Block_byref_object_copy__93030;
    v383 = __Block_byref_object_dispose__93031;
    v384 = 0;
    v373 = 0;
    v374 = &v373;
    v375 = 0x3032000000;
    v376 = __Block_byref_object_copy__93030;
    v377 = __Block_byref_object_dispose__93031;
    v378 = 0;
    v367 = 0;
    v368 = &v367;
    v369 = 0x3032000000;
    v370 = __Block_byref_object_copy__93030;
    v371 = __Block_byref_object_dispose__93031;
    v372 = 0;
    v361[0] = MEMORY[0x1E0C809B0];
    v361[1] = 3221225472;
    v361[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_372;
    v361[3] = &unk_1E3675150;
    v364 = v379;
    v361[4] = self;
    v362 = v221;
    v365 = &v373;
    v268 = v217;
    v363 = v268;
    v366 = &v367;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v361);
    v34 = v33;
    v35 = v34;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      LOWORD(v459) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v35, OS_SIGNPOST_INTERVAL_END, v31, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupArrays", ", (uint8_t *)&v459, 2u);
    }

    PLSearchBackendPSIDatabaseGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = CFAbsoluteTimeGetCurrent() - v428[3];
      LODWORD(v459) = 134349056;
      *(CFAbsoluteTime *)((char *)&v459 + 4) = v37;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_INFO, "Next Keyword GroupArrays. Took %{public}f seconds.", (uint8_t *)&v459, 0xCu);
    }

    v38 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend((id)v448[5], "objectForKeyedSubscript:", CFSTR("SceneWhitelist"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = (void *)objc_msgSend(v38, "initWithArray:", v39);

    objc_msgSend((id)v448[5], "objectForKeyedSubscript:", CFSTR("MePersonUUID"));
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v428[3] = CFAbsoluteTimeGetCurrent();
    v40 = os_signpost_id_generate(v35);
    v41 = v35;
    v42 = v41;
    spid = v40;
    v241 = v40 - 1;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      LOWORD(v459) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "SearchDatabase - processNextKeywordSuggestions - nextKeywordOverlap", ", (uint8_t *)&v459, 2u);
    }
    v239 = v42;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*((id *)v380 + 5), "count"));
    v243 = (id)objc_claimAutoreleasedReturnValue();
    v360 = 0u;
    v359 = 0u;
    v358 = 0u;
    v357 = 0u;
    obj = *((id *)v380 + 5);
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v467, 16);
    if (!v43)
    {
      v220 = 0;
      v278 = 0;
      v281 = 0;
      goto LABEL_101;
    }
    v220 = 0;
    v278 = 0;
    v281 = 0;
    v44 = 1.4 / (double)(unint64_t)v276;
    v45 = v44 * (double)v255;
    v46 = v44 * (double)v262;
    v47 = *(_QWORD *)v358;
LABEL_32:
    v48 = 0;
    while (1)
    {
      if (*(_QWORD *)v358 != v47)
        objc_enumerationMutation(obj);
      v49 = *(void **)(*((_QWORD *)&v357 + 1) + 8 * v48);
      v50 = objc_msgSend(v49, "groupId");
      if (a5)
        break;
      objc_msgSend(v49, "contentString");
      v17 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v17, "length"))
        break;
      v52 = v17;
LABEL_53:

LABEL_54:
      if (v43 == ++v48)
      {
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v467, 16);
        v43 = v76;
        if (!v76)
        {
LABEL_101:

          v77 = v239;
          v78 = v77;
          if (v241 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v77))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v78, OS_SIGNPOST_INTERVAL_END, spid, "SearchDatabase - processNextKeywordSuggestions - nextKeywordOverlap", ", (uint8_t *)&v459, 2u);
          }
          obja = v78;

          PLSearchBackendPSIDatabaseGetLog();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            v80 = CFAbsoluteTimeGetCurrent() - v428[3];
            LODWORD(v459) = 134349056;
            *(CFAbsoluteTime *)((char *)&v459 + 4) = v80;
            _os_log_impl(&dword_199541000, v79, OS_LOG_TYPE_INFO, "Next Keyword Overlap. Took %{public}f seconds.", (uint8_t *)&v459, 0xCu);
          }

          v355 = 0u;
          v354 = 0u;
          v353 = 0u;
          v352 = 0u;
          v81 = v243;
          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v352, v466, 16);
          if (v82)
          {
            v83 = *(_QWORD *)v353;
            do
            {
              for (i = 0; i != v82; ++i)
              {
                if (*(_QWORD *)v353 != v83)
                  objc_enumerationMutation(v81);
                v85 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * i);
                v86 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v85, "group");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "numberWithUnsignedLongLong:", objc_msgSend(v87, "groupId"));
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v257, "objectForKeyedSubscript:", v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = objc_msgSend(v89, "count");

                objc_msgSend((id)v410[5], "objectForKeyedSubscript:", v88);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = objc_msgSend(v91, "count");

                if (v281)
                  v93 = (double)v90 * 0.4 / (double)v281 + 0.0;
                else
                  v93 = 0.0;
                if (v278)
                  v93 = (double)v92 * 0.5 / (double)v278 + v93;
                objc_msgSend(v85, "score");
                objc_msgSend(v85, "setScore:", v94 + v93 * 0.1);

              }
              v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v352, v466, 16);
            }
            while (v82);
          }

          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v465 = v95;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v465, 1);
          v218 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v81, "sortUsingDescriptors:", v218);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v348[0] = MEMORY[0x1E0C809B0];
          v348[1] = 3221225472;
          v348[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_384;
          v348[3] = &unk_1E36751A0;
          v213 = v96;
          v349 = v213;
          v266 = v257;
          v350 = v266;
          v351 = &v409;
          v240 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v348);
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          spida = (void *)objc_claimAutoreleasedReturnValue();
          v428[3] = CFAbsoluteTimeGetCurrent();
          v97 = os_signpost_id_generate(obja);
          v98 = obja;
          v99 = v98;
          v263 = v97 - 1;
          if (v97 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v99, OS_SIGNPOST_INTERVAL_BEGIN, v97, "SearchDatabase - processNextKeywordSuggestions - nextKeywordIntersections", ", (uint8_t *)&v459, 2u);
          }
          v253 = v97;
          v260 = v99;

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          v347 = 0u;
          v346 = 0u;
          v345 = 0u;
          v344 = 0u;
          v100 = v81;
          v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v344, v464, 16);
          v279 = v100;
          if (v101)
          {
            v102 = *(_QWORD *)v345;
            do
            {
              v282 = v101;
              for (j = 0; j != v282; ++j)
              {
                if (*(_QWORD *)v345 != v102)
                  objc_enumerationMutation(v100);
                v104 = *(void **)(*((_QWORD *)&v344 + 1) + 8 * j);
                objc_msgSend(v104, "group");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = objc_msgSend(v105, "category");
                v107 = v106;
                v108 = PLSearchUserCategoryForCategory(v106);
                if ((v106 & 0xFFFFFFFE) != 0x44C)
                  goto LABEL_128;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v105, "groupId"));
                v109 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v266, "objectForKeyedSubscript:", v109);
                v110 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v245, "objectForKeyedSubscript:", v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v109) = objc_msgSend(v105, "isEqual:", v111);

                if ((v109 & 1) != 0)
                {
LABEL_128:
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v108);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v256, "objectForKeyedSubscript:", v112);
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v113, "count") < (unint64_t)v276)
                  {
                    v114 = objc_msgSend(v105, "groupId");
                    if ((objc_msgSend(v247, "containsIndex:", v114) & 1) == 0)
                    {
                      objc_msgSend(v247, "addIndex:", v114);
                      objc_msgSend(v105, "contentString");
                      objb = (id)objc_claimAutoreleasedReturnValue();
                      v115 = PLSearchUserCategoryForCategory((int)objc_msgSend(v105, "category"));
                      PLSearchedCategoriesForUserCategory(v115);
                      v269 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(objb, "length"))
                      {
                        objc_msgSend(spida, "objectForKeyedSubscript:", objb);
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        v117 = v116;
                        if (v116)
                        {
                          if ((objc_msgSend(v116, "containsIndexes:", v269) & 1) != 0
                            || ((0x7FFFFC10FEuLL >> v108) & 1) == 0
                            && !PLExclusiveCategoriesIsSupersetOfSearchedCategories(v117))
                          {
                            goto LABEL_151;
                          }
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
                          v117 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(spida, "setObject:forKeyedSubscript:", v117, objb);
                        }
                        objc_msgSend(v117, "addIndexes:", v269);

                      }
                      ((void (**)(_QWORD, void *))v240)[2](v240, v105);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v119 = objc_msgSend(v118, "count");
                      v340 = 0;
                      v341 = &v340;
                      v342 = 0x2020000000;
                      v343 = 1;
                      *(_QWORD *)&v459 = 0;
                      *((_QWORD *)&v459 + 1) = &v459;
                      v460 = 0x3032000000;
                      v461 = __Block_byref_object_copy__93030;
                      v462 = __Block_byref_object_dispose__93031;
                      v463 = 0;
                      v334 = 0;
                      v335 = &v334;
                      v336 = 0x3032000000;
                      v337 = __Block_byref_object_copy__93030;
                      v338 = __Block_byref_object_dispose__93031;
                      v339 = &unk_1E3760DA0;
                      v323[0] = MEMORY[0x1E0C809B0];
                      v323[1] = 3221225472;
                      v323[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_387;
                      v323[3] = &unk_1E36751C8;
                      v327 = v240;
                      v331 = v107;
                      v332 = v108;
                      v333 = v119;
                      v117 = v118;
                      v328 = &v340;
                      v329 = &v459;
                      v324 = v117;
                      v325 = v104;
                      v330 = &v334;
                      v326 = v234;
                      objc_msgSend(v256, "enumerateKeysAndObjectsUsingBlock:", v323);
                      if (*((_BYTE *)v341 + 24))
                      {
                        if (*(_QWORD *)(*((_QWORD *)&v459 + 1) + 40))
                        {
                          objc_msgSend(v104, "score");
                          v121 = v120;
                          objc_msgSend(*(id *)(*((_QWORD *)&v459 + 1) + 40), "score");
                          if (v121 >= v122)
                            v122 = v121;
                          objc_msgSend(v104, "setScore:", v122);
                          objc_msgSend(v256, "objectForKeyedSubscript:", v335[5]);
                          v123 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v123, "removeObject:", *(_QWORD *)(*((_QWORD *)&v459 + 1) + 40));

                        }
                        objc_msgSend(v256, "objectForKeyedSubscript:", v112);
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v124)
                        {
                          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                          v124 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v256, "setObject:forKeyedSubscript:", v124, v112);
                        }
                        if (v108 != 8
                          || (unint64_t)objc_msgSend(v124, "count") < 2
                          || *(_QWORD *)(*((_QWORD *)&v459 + 1) + 40))
                        {
                          objc_msgSend(v124, "addObject:", v104);
                        }

                      }
                      _Block_object_dispose(&v334, 8);

                      _Block_object_dispose(&v459, 8);
                      _Block_object_dispose(&v340, 8);
LABEL_151:

                    }
                  }

                }
                v100 = v279;
              }
              v101 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v344, v464, 16);
            }
            while (v101);
          }

          v125 = v260;
          v126 = v125;
          if (v263 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v125))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v126, OS_SIGNPOST_INTERVAL_END, v253, "SearchDatabase - processNextKeywordSuggestions - nextKeywordIntersections", ", (uint8_t *)&v459, 2u);
          }

          PLSearchBackendPSIDatabaseGetLog();
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            v128 = CFAbsoluteTimeGetCurrent() - v428[3];
            LODWORD(v459) = 134349056;
            *(CFAbsoluteTime *)((char *)&v459 + 4) = v128;
            _os_log_impl(&dword_199541000, v127, OS_LOG_TYPE_INFO, "Next Keyword Intersections. Took %{public}f seconds.", (uint8_t *)&v459, 0xCu);
          }

          v428[3] = CFAbsoluteTimeGetCurrent();
          v129 = os_signpost_id_generate(v126);
          v130 = v126;
          v131 = v130;
          v132 = (void *)(v129 - 1);
          if (v129 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v130))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v131, OS_SIGNPOST_INTERVAL_BEGIN, v129, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDiversity", ", (uint8_t *)&v459, 2u);
          }

          objc_msgSend(v279, "removeAllObjects");
          v321[0] = MEMORY[0x1E0C809B0];
          v321[1] = 3221225472;
          v321[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_389;
          v321[3] = &unk_1E36751F0;
          v133 = v279;
          v322 = v133;
          objc_msgSend(v256, "enumerateKeysAndObjectsUsingBlock:", v321);
          v134 = v131;
          v135 = v134;
          if ((unint64_t)v132 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v135, OS_SIGNPOST_INTERVAL_END, v129, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDiversity", ", (uint8_t *)&v459, 2u);
          }

          PLSearchBackendPSIDatabaseGetLog();
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
          {
            v137 = CFAbsoluteTimeGetCurrent() - v428[3];
            LODWORD(v459) = 134349056;
            *(CFAbsoluteTime *)((char *)&v459 + 4) = v137;
            _os_log_impl(&dword_199541000, v136, OS_LOG_TYPE_INFO, "Next Keyword Diversity. Took %{public}f seconds.", (uint8_t *)&v459, 0xCu);
          }

          objc_msgSend(v133, "sortUsingDescriptors:", v218);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v276);
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v276);
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "socialGroupExtendedAssetIds");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v138, "count"))
          {
            v139 = 1;
          }
          else
          {
            objc_msgSend(v229, "socialGroupExtendedCollectionIds");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = objc_msgSend(v140, "count") != 0;

          }
          v316[0] = MEMORY[0x1E0C809B0];
          v316[1] = 3221225472;
          v316[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2_395;
          v316[3] = &unk_1E3675218;
          v320 = v139;
          v318 = &buf;
          v141 = &v409;
          v209 = v229;
          v317 = v209;
          v319 = &v409;
          v231 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v316);
          v315[0] = MEMORY[0x1E0C809B0];
          v315[1] = 3221225472;
          v315[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3_397;
          v315[3] = &unk_1E3675240;
          v315[4] = &buf;
          v315[5] = &v409;
          v232 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v315);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v276);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v313 = 0u;
          v314 = 0u;
          v311 = 0u;
          v312 = 0u;
          v227 = v133;
          v143 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v311, v458, 16);
          v238 = v142;
          if (v143)
          {
            v144 = *(_QWORD *)v312;
            while (2)
            {
              for (k = 0; k != v143; ++k)
              {
                if (*(_QWORD *)v312 != v144)
                  objc_enumerationMutation(v227);
                objc_msgSend(*(id *)(*((_QWORD *)&v311 + 1) + 8 * k), "group");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_390(v132);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *, void *))v231)[2](v231, v146, v132);
                if (!v139
                  || objc_msgSend(v132, "category") != 1300
                  || objc_msgSend(v146, "assetCount")
                  || objc_msgSend(v146, "collectionCount"))
                {
                  objc_msgSend(v142, "addObject:", v146);
                  objc_msgSend(v242, "addObject:", v132);
                  objc_msgSend(v132, "contentString");
                  v147 = (uint64_t *)objc_claimAutoreleasedReturnValue();
                  v148 = v147;
                  if (!v147)
                  {
                    objc_msgSend(v132, "lookupIdentifier");
                    v141 = (uint64_t *)objc_claimAutoreleasedReturnValue();
                    v148 = v141;
                  }
                  objc_msgSend(v280, "addObject:", v148);
                  if (!v147)

                  if (objc_msgSend(v238, "count") >= (unint64_t)v276)
                  {

                    goto LABEL_189;
                  }
                }

                v142 = v238;
              }
              v143 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v311, v458, 16);
              if (v143)
                continue;
              break;
            }
          }
LABEL_189:

          v149 = v238;
          if (objc_msgSend(v238, "count") < (unint64_t)v276)
          {
            v309 = 0u;
            v310 = 0u;
            v307 = 0u;
            v308 = 0u;
            v150 = v234;
            v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v307, v457, 16);
            if (v151)
            {
              v152 = *(_QWORD *)v308;
              while (2)
              {
                for (m = 0; m != v151; ++m)
                {
                  if (*(_QWORD *)v308 != v152)
                    objc_enumerationMutation(v150);
                  v154 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * m);
                  __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_390(v154);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, void *, void *))v231)[2](v231, v155, v154);
                  if (!v139
                    || objc_msgSend(v154, "category") != 1300
                    || objc_msgSend(v155, "assetCount")
                    || objc_msgSend(v155, "collectionCount"))
                  {
                    objc_msgSend(v238, "addObject:", v155);
                    objc_msgSend(v242, "addObject:", v154);
                    objc_msgSend(v154, "contentString");
                    v156 = (void *)objc_claimAutoreleasedReturnValue();
                    v157 = v156;
                    if (!v156)
                    {
                      objc_msgSend(v154, "lookupIdentifier");
                      v132 = (void *)objc_claimAutoreleasedReturnValue();
                      v157 = v132;
                    }
                    objc_msgSend(v280, "addObject:", v157);
                    if (!v156)

                    if (objc_msgSend(v238, "count") >= (unint64_t)v276)
                    {

                      goto LABEL_208;
                    }
                  }

                }
                v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v307, v457, 16);
                if (v151)
                  continue;
                break;
              }
            }
LABEL_208:

            v149 = v238;
          }
          if (objc_msgSend(v149, "count") < (unint64_t)v276 && v220)
          {
            __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_390(v220);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, void *))v231)[2](v231, v158, v220);
            objc_msgSend(v242, "addObject:", v220);
            objc_msgSend(v220, "contentString");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            v160 = v159;
            if (!v159)
            {
              objc_msgSend(v220, "lookupIdentifier");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v280, "addObject:", v160);
            if (!v159)

            objc_msgSend(v238, "addObject:", v158);
          }
          v428[3] = CFAbsoluteTimeGetCurrent();
          v161 = os_signpost_id_generate(v135);
          v162 = v135;
          v163 = v162;
          v207 = v161 - 1;
          if (v161 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v162))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v163, OS_SIGNPOST_INTERVAL_BEGIN, v161, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDeduping", ", (uint8_t *)&v459, 2u);
          }
          v203 = v161;
          v205 = v163;

          v305 = 0u;
          v306 = 0u;
          v303 = 0u;
          v304 = 0u;
          v244 = *((id *)v380 + 5);
          v164 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v303, v456, 16);
          if (v164)
          {
            v250 = *(_QWORD *)v304;
            do
            {
              objc = 0;
              v254 = v164;
              do
              {
                if (*(_QWORD *)v304 != v250)
                  objc_enumerationMutation(v244);
                v165 = *(void **)(*((_QWORD *)&v303 + 1) + 8 * (_QWORD)objc);
                objc_msgSend(v165, "contentString", v203, v205);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                v167 = v166;
                if (a5 || objc_msgSend(v166, "length"))
                {
                  v168 = (int)objc_msgSend(v165, "category");
                  v169 = PLSearchUserCategoryForCategory(v168);
                  if (((0x7FFFFC10FEuLL >> v169) & 1) == 0)
                  {
                    if (v167)
                    {
                      v170 = v167;
                    }
                    else
                    {
                      objc_msgSend(v165, "lookupIdentifier");
                      v171 = (id)objc_claimAutoreleasedReturnValue();

                      v170 = v171;
                    }
                    v283 = v170;
                    if ((objc_msgSend(v280, "containsObject:") & 1) != 0)
                      goto LABEL_266;
                    IsUserControlled = PLSearchIndexCategoryIsUserControlled(v168);
                    v270 = v169;
                    if (IsUserControlled)
                    {
                      v301 = 0u;
                      v302 = 0u;
                      v299 = 0u;
                      v300 = 0u;
                      v277 = v280;
                      v173 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v299, v455, 16);
                      if (v173)
                      {
                        v174 = *(_QWORD *)v300;
                        while (2)
                        {
                          for (n = 0; n != v173; ++n)
                          {
                            if (*(_QWORD *)v300 != v174)
                              objc_enumerationMutation(v277);
                            v176 = *(void **)(*((_QWORD *)&v299 + 1) + 8 * n);
                            if ((objc_msgSend(v283, "containsString:", v176) & 1) != 0)
                            {
                              v169 = v270;
LABEL_265:
                              v188 = v176;

                              v283 = v188;
                              goto LABEL_266;
                            }
                          }
                          v173 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v299, v455, 16);
                          if (v173)
                            continue;
                          break;
                        }
                      }

                      v169 = v270;
                    }
                    v297 = 0u;
                    v298 = 0u;
                    v295 = 0u;
                    v296 = 0u;
                    v177 = (void *)v404[5];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v165, "groupId"));
                    v178 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v177, "objectForKeyedSubscript:", v178);
                    v277 = (id)objc_claimAutoreleasedReturnValue();

                    v179 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v295, v454, 16);
                    if (v179)
                    {
                      v261 = 0;
                      v180 = *(_QWORD *)v296;
                      v267 = v165;
                      v265 = IsUserControlled;
                      v264 = v167;
                      do
                      {
                        for (ii = 0; ii != v179; ++ii)
                        {
                          if (*(_QWORD *)v296 != v180)
                            objc_enumerationMutation(v277);
                          v176 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * ii);
                          if (IsUserControlled)
                          {
                            v293 = 0u;
                            v294 = 0u;
                            v291 = 0u;
                            v292 = 0u;
                            v182 = v280;
                            v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v291, v453, 16);
                            if (v183)
                            {
                              v184 = *(_QWORD *)v292;
                              while (2)
                              {
                                for (jj = 0; jj != v183; ++jj)
                                {
                                  if (*(_QWORD *)v292 != v184)
                                    objc_enumerationMutation(v182);
                                  v186 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * jj);
                                  if (objc_msgSend(v176, "containsString:", v186))
                                  {
                                    v187 = v186;

                                    v167 = v264;
                                    v165 = v267;
                                    v169 = v270;
                                    IsUserControlled = v265;
                                    v261 = 1;
                                    v283 = v187;
                                    goto LABEL_259;
                                  }
                                }
                                v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v291, v453, 16);
                                if (v183)
                                  continue;
                                break;
                              }
                              v167 = v264;
                              v165 = v267;
                              v169 = v270;
                              IsUserControlled = v265;
                            }
LABEL_259:

                          }
                          else if ((objc_msgSend(v280, "containsObject:", *(_QWORD *)(*((_QWORD *)&v295 + 1) + 8 * ii)) & 1) != 0)
                          {
                            goto LABEL_265;
                          }
                        }
                        v179 = objc_msgSend(v277, "countByEnumeratingWithState:objects:count:", &v295, v454, 16);
                      }
                      while (v179);

                      if ((v261 & 1) == 0)
                        goto LABEL_277;
LABEL_266:
                      v189 = objc_msgSend(v280, "indexOfObject:", v283);
                      objc_msgSend(v242, "objectAtIndex:", v189);
                      v190 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v190 != v165)
                      {
                        v277 = v190;
                        v191 = PLSearchUserCategoryForCategory((int)objc_msgSend(v190, "category"));
                        if (((0x7FFFFC10FEuLL >> v191) & 1) == 0)
                        {
                          objc_msgSend(v238, "objectAtIndex:", v189);
                          v192 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v169 == v191 || v191 == 0)
                          {
                            ((void (**)(_QWORD, void *, void *))v232)[2](v232, v192, v165);
                          }
                          else
                          {
                            PLSearchedCategoriesForUserCategory(v169);
                            v194 = (void *)objc_claimAutoreleasedReturnValue();
                            PLSearchedCategoriesForUserCategory(v191);
                            v195 = (void *)objc_claimAutoreleasedReturnValue();
                            v286[0] = MEMORY[0x1E0C809B0];
                            v286[1] = 3221225472;
                            v286[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_398;
                            v286[3] = &unk_1E3675268;
                            v196 = v195;
                            v287 = v196;
                            v288 = v192;
                            v197 = v232;
                            v289 = v165;
                            v290 = v197;
                            objc_msgSend(v194, "enumerateRangesUsingBlock:", v286);

                          }
                        }
                        goto LABEL_276;
                      }

                    }
                    else
                    {
LABEL_276:

                    }
LABEL_277:

                  }
                }

                objc = (char *)objc + 1;
              }
              while (objc != (id)v254);
              v164 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v303, v456, 16);
            }
            while (v164);
          }

          v198 = v205;
          v199 = v198;
          if (v207 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v198))
          {
            LOWORD(v459) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v199, OS_SIGNPOST_INTERVAL_END, v203, "SearchDatabase - processNextKeywordSuggestions - nextKeywordDeduping", ", (uint8_t *)&v459, 2u);
          }

          PLSearchBackendPSIDatabaseGetLog();
          v200 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
          {
            v201 = CFAbsoluteTimeGetCurrent() - v428[3];
            LODWORD(v459) = 134349056;
            *(CFAbsoluteTime *)((char *)&v459 + 4) = v201;
            _os_log_impl(&dword_199541000, v200, OS_LOG_TYPE_INFO, "Next Keyword Deduping. Took %{public}f seconds.", (uint8_t *)&v459, 0xCu);
          }

          v284[0] = MEMORY[0x1E0C809B0];
          v284[1] = 3221225472;
          v284[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_400;
          v284[3] = &unk_1E3675290;
          v284[4] = self;
          v202 = v215;
          v285 = v202;
          objc_msgSend(v238, "sortWithOptions:usingComparator:", 16, v284);
          objc_msgSend(v209, "setNextKeywordSuggestions:", v238);

          _Block_object_dispose(&v367, 8);
          _Block_object_dispose(&v373, 8);

          _Block_object_dispose(v379, 8);
          v25 = v217;
LABEL_286:

          _Block_object_dispose(&v403, 8);
          _Block_object_dispose(&v409, 8);

          _Block_object_dispose(&buf, 8);
          goto LABEL_287;
        }
        goto LABEL_32;
      }
    }
    v51 = objc_msgSend(v248, "containsIndex:", v50);
    if (!a5)

    if ((v51 & 1) != 0 || !-[__CFSet containsObject:](v268, "containsObject:", v50))
      goto LABEL_54;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v257, "objectForKeyedSubscript:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v410[5], "objectForKeyedSubscript:", v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v49, "category");
    v56 = v55;
    if ((unsigned __int16)v55 > 0x577u)
    {
      if ((unsigned __int16)v55 > 0x709u)
      {
        if ((unsigned __int16)v55 == 1802 || (unsigned __int16)v55 == 2100)
          goto LABEL_52;
      }
      else if ((unsigned __int16)v55 - 1400 < 2 || (unsigned __int16)v55 == 1701)
      {
        goto LABEL_52;
      }
    }
    else if ((unsigned __int16)v55 - 1200 < 5)
    {
      goto LABEL_52;
    }
    if ((PLSearchIndexCategoryIsSynonym(v55) & 1) != 0)
      goto LABEL_52;
    if (v56 == 1500)
    {
      objc_msgSend(v49, "contentString");
      v258 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v258, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "capitalizedString");
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = v57;
      v60 = (void *)v58;

      LOBYTE(v258) = objc_msgSend(v219, "containsObject:", v60);
      if ((v258 & 1) == 0)
        goto LABEL_52;
      v259 = 0;
    }
    else
    {
      v259 = v56 == 1600;
      if (v56 == 11 || (unsigned __int16)v56 == 13)
        goto LABEL_52;
      if ((unsigned __int16)v56 != 1600)
      {
LABEL_63:
        objc_msgSend((id)v374[5], "objectForKeyedSubscript:", v52);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = objc_msgSend(v62, "unsignedIntegerValue");

        objc_msgSend((id)v368[5], "objectForKeyedSubscript:", v52);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v249 = objc_msgSend(v63, "unsignedIntegerValue");

        if (v281 <= v252)
          v64 = v252;
        else
          v64 = v281;
        v65 = v278;
        if (v278 <= v249)
          v65 = v249;
        v278 = v65;
        v281 = v64;
        v246 = objc_msgSend(v54, "count");
        if (v246 >= v440[3])
          goto LABEL_52;
        v233 = objc_msgSend(v53, "count");
        if (v233 + v246 >= v440[3] || *((_BYTE *)v436 + 24) && v233 >= v444[3] && (v56 & 0xFFFFFFFE) == 0x44C)
          goto LABEL_52;
        if (v262 == v246 && (v237 < 0x32 || v255 - v233 < 0x18))
          goto LABEL_52;
        if ((v56 & 0xFFFFFFFFFFFFFFFELL) != 0x514
          || (objc_msgSend(v49, "lookupIdentifier"),
              v66 = (void *)objc_claimAutoreleasedReturnValue(),
              v210 = objc_msgSend(v216, "isEqualToString:", v66),
              v66,
              !v210))
        {
          v208 = v56 & 0xFFFFFFFE;
          if (v53 && v208 == 1100)
          {
            objc_msgSend(v245, "objectForKeyedSubscript:", v53);
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "contentString");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v211, "length");
            objc_msgSend(v206, "contentString");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v68) = v68 > objc_msgSend(v204, "length");

            if ((v68 & 1) == 0)
            {

              goto LABEL_52;
            }
            objc_msgSend(v245, "setObject:forKeyedSubscript:", v49, v53);

          }
          *(_QWORD *)&v459 = 0;
          *((_QWORD *)&v459 + 1) = &v459;
          v460 = 0x2020000000;
          v461 = 0;
          v356[0] = MEMORY[0x1E0C809B0];
          v356[1] = 3221225472;
          v356[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_378;
          v356[3] = &unk_1E3675178;
          v356[4] = &v459;
          v212 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double))MEMORY[0x19AEC174C](v356);
          v69 = v45;
          v212[2](v212, v252, v255, v233, v45, 0.4);
          v212[2](v212, v249, v262, v246, v46, 0.5);
          v70 = *(double *)(*((_QWORD *)&v459 + 1) + 24) / 0.9;
          *(double *)(*((_QWORD *)&v459 + 1) + 24) = v70;
          v71 = 0.75;
          if (!v259)
          {
            if ((unint64_t)(v56 - 1) > 0xD)
            {
              v71 = 0.7;
              if (v208 != 1500)
              {
                -[PSIDatabase _scoreForUserCategory:](self, "_scoreForUserCategory:", PLSearchUserCategoryForCategory(v56));
                v71 = v74;
                v70 = *(double *)(*((_QWORD *)&v459 + 1) + 24);
              }
            }
            else
            {
              v73 = v432[3];
              if (v73 <= v56)
              {
                v71 = 0.2;
              }
              else
              {
                v71 = 0.25;
                if (v56 != 2)
                {
                  if ((v56 & 0xFFFFFFFB) == 3)
                  {
                    v71 = 0.45;
                  }
                  else
                  {
                    v75 = v73 - 1;
                    if (v73 - 1 >= v56)
                      v75 = v56;
                    v71 = (1.0 - (double)(v75 - 1) / (double)(v73 - 2)) * 0.2 + 1.4;
                  }
                }
              }
            }
          }
          v72 = -[PSIRankedGroup initWithGroup:score:]([PSIRankedGroup alloc], "initWithGroup:score:", v49, v71 * 0.25 + v70 * 0.65);
          objc_msgSend(v243, "addObject:", v72);

          v45 = v69;
          _Block_object_dispose(&v459, 8);
          goto LABEL_52;
        }
        v67 = v49;

        v220 = v67;
LABEL_52:

        goto LABEL_53;
      }
    }
    objc_msgSend(v49, "contentString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = objc_msgSend(v222, "containsObject:", v61);

    if ((v251 & 1) != 0)
      goto LABEL_52;
    goto LABEL_63;
  }
LABEL_288:

}

- (unint64_t)_inqNumberOfAssetsMatchingGroupWithId:(unint64_t)a3
{
  PSIStatement *inqNumberOfAssetsMatchingGroupWithIdStatement;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PSIStatement bindInt64:atIndex:](self->_inqNumberOfAssetsMatchingGroupWithIdStatement, "bindInt64:atIndex:", a3, 1);
  inqNumberOfAssetsMatchingGroupWithIdStatement = self->_inqNumberOfAssetsMatchingGroupWithIdStatement;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PSIDatabase__inqNumberOfAssetsMatchingGroupWithId___block_invoke;
  v7[3] = &unk_1E3674DD0;
  v7[4] = &v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", inqNumberOfAssetsMatchingGroupWithIdStatement, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_inqNumberOfAssetsByGroupIdMatchingGroupsWithIds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PSIStatement *inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v5);

  inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PSIDatabase__inqNumberOfAssetsByGroupIdMatchingGroupsWithIds___block_invoke;
  v10[3] = &unk_1E3675060;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (unint64_t)_inqNumberOfCollectionsMatchingGroupWithId:(unint64_t)a3
{
  PSIStatement *inqNumberOfCollectionsMatchingGroupWithIdStatement;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PSIStatement bindInt64:atIndex:](self->_inqNumberOfCollectionsMatchingGroupWithIdStatement, "bindInt64:atIndex:", a3, 1);
  inqNumberOfCollectionsMatchingGroupWithIdStatement = self->_inqNumberOfCollectionsMatchingGroupWithIdStatement;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PSIDatabase__inqNumberOfCollectionsMatchingGroupWithId___block_invoke;
  v7[3] = &unk_1E3674DD0;
  v7[4] = &v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", inqNumberOfCollectionsMatchingGroupWithIdStatement, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PSIStatement *inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v5);

  inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement = self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PSIDatabase__inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds___block_invoke;
  v10[3] = &unk_1E3675060;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (double)_scoreForUserCategory:(unint64_t)a3
{
  double result;

  result = 1.0;
  if (a3 - 1 <= 0x25)
    return dbl_199B9FAF0[a3 - 1];
  return result;
}

- (id)dumpGroupsInfoWithIndexCategories:(id)a3 includeUUIDs:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  PSIDatabase *v15;
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke;
  v13[3] = &unk_1E36752E0;
  v14 = v6;
  v15 = self;
  v17 = a4;
  v8 = v7;
  v16 = v8;
  v9 = v6;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v13);
  v10 = v16;
  v11 = v8;

  return v11;
}

- (id)dumpGroupsInfoForAssetUUID:(id)a3 indexCategories:(id)a4 includeUUIDs:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PSIDatabase *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0;
  v26 = 0;
  if ((PLStringUUIDComponents(v8, &v26, &v25) & 1) != 0)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke;
    v18 = &unk_1E3675380;
    v19 = self;
    v22 = v26;
    v23 = v25;
    v20 = v9;
    v24 = a5;
    v11 = v10;
    v21 = v11;
    -[PSIDatabase _inqSync:](self, "_inqSync:", &v15);
    objc_msgSend(v11, "allObjects", v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Invalid asset UUID %{public}@", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)dumpLookupStringsWithIndexCategories:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  PSIDatabase *v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke;
  v11[3] = &unk_1E3677530;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v6 = v5;
  v7 = v4;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v11);
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)assetCountForLookupIdentifier:(id)a3
{
  id v4;
  PSIQueryToken *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  CFIndex Count;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "containsString:", CFSTR(",")))
  {
    v5 = -[PSIQueryToken initWithIdentifier:userCategory:]([PSIQueryToken alloc], "initWithIdentifier:userCategory:", v4, 0);
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = 0;
    v8 = -[PSIDatabase newQueryWithSearchTextV2:queryTokens:scopedSearchIdentifiers:searchResultTypes:searchSuggestionType:useWildcardSearchText:enableExactMatchPrioritization:libraryScope:suggestionLimit:](self, "newQueryWithSearchTextV2:queryTokens:scopedSearchIdentifiers:searchResultTypes:searchSuggestionType:useWildcardSearchText:enableExactMatchPrioritization:libraryScope:suggestionLimit:", &stru_1E36789C0, v6, v7, 1, 0, 0, v13, 0, 0);

    objc_msgSend(v8, "runLookupIdentifierQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Count = objc_msgSend(v10, "count");

  }
  else
  {
    -[PSIDatabase groupForLookupIdentifier:searchResultTypes:](self, "groupForLookupIdentifier:searchResultTypes:", v4, 1);
    v5 = (PSIQueryToken *)objc_claimAutoreleasedReturnValue();
    if (-[PSIQueryToken assetIds](v5, "assetIds"))
      Count = CFArrayGetCount((CFArrayRef)-[PSIQueryToken assetIds](v5, "assetIds"));
    else
      Count = 0;
  }

  return Count;
}

- (id)_inqGenerateGroupsInfoDictionaryFromText:(const char *)a3 identifier:(const char *)a4 category:(signed __int16)a5 score:(double)a6 groupId:(unint64_t)a7 includeUUIDs:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v8 = a8;
  v11 = a5;
  v30[8] = *MEMORY[0x1E0C80C00];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a4, 4);
  PLDebugStringForSearchIndexCategory((int)v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PSIDatabase _inqAssetUUIDsForGroupID:](self, "_inqAssetUUIDsForGroupID:", a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIDatabase _inqCollectionUUIDsForGroupID:](self, "_inqCollectionUUIDsForGroupID:", a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  v29[0] = CFSTR("text");
  v29[1] = CFSTR("lookup_identifier");
  v28 = (void *)v14;
  v30[0] = v14;
  v30[1] = v15;
  v29[2] = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v19;
  v29[3] = CFSTR("category_humanReadable");
  v20 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[3] = v20;
  v29[4] = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v21;
  v29[5] = CFSTR("group_id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v22;
  v29[6] = CFSTR("assetUUIDs");
  v23 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v23;
  v29[7] = CFSTR("collectionUUIDs");
  v24 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[7] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_12;
  }
  else
  {

    if (v17)
      goto LABEL_12;
  }

LABEL_12:
  if (!v16)

  return v25;
}

- (void)_sortedSearchIndexRowIdsFromUUIDs:(id)a3 searchResultType:(unint64_t)a4 completion:(id)a5
{
  char v6;
  char v9;
  id v10;
  void (**v11)(id, CFMutableArrayRef, id);
  char v12;
  CFMutableArrayRef Mutable;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  CFMutableArrayRef v21;
  char v22;

  v6 = a4;
  v9 = ~(_BYTE)a4;
  v10 = a3;
  v11 = (void (**)(id, CFMutableArrayRef, id))a5;
  if ((v9 & 3) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIDatabase.m"), 3063, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!wantsAssetsAndCollections"));

  }
  v12 = v6 & 1;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke;
  v18[3] = &unk_1E3675D50;
  v22 = v12;
  v18[4] = self;
  v19 = v10;
  v20 = v14;
  v21 = Mutable;
  v15 = v14;
  v16 = v10;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v18);
  v11[2](v11, Mutable, v15);

}

- (BOOL)assetExistsWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PSIDatabase_assetExistsWithUUID___block_invoke;
  v7[3] = &unk_1E3676EA0;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (id)_inqDequeueGroupObjectWithId:(unint64_t)a3 isCachedGroup:(BOOL *)a4
{
  PSIGroup *v7;
  PSIGroup *v8;
  PSIGroup *v9;

  CFDictionaryGetValue(self->_inqGroupObjectsById, (const void *)a3);
  v7 = (PSIGroup *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v9 = objc_alloc_init(PSIGroup);
    -[PSIGroup setGroupId:](v9, "setGroupId:", a3);
    CFDictionarySetValue(self->_inqGroupObjectsById, (const void *)a3, v9);
    if (!a4)
      return v9;
    goto LABEL_3;
  }
  -[PSIGroup resetIntersectedIds](v7, "resetIntersectedIds");
  v9 = v8;
  if (a4)
LABEL_3:
    *a4 = v8 != 0;
  return v9;
}

- (void)_inqRecycleGroups
{
  CFDictionaryRemoveAllValues(self->_inqGroupObjectsById);
}

- (void)_prepareTokenOutput:(tokenOutput_t *)a3 forIndexing:(BOOL)a4
{
  NSMutableString *tokenizerOutputString;
  NSMutableString *v7;
  NSMutableArray *tokenizerOutputTokens;
  NSMutableArray *v9;
  NSMutableString *v10;
  NSMutableArray *v11;
  NSMutableArray *tokenizerOutputNormalizedTokens;
  NSMutableArray *v13;
  NSMutableArray *v14;
  int8x16_t v15;

  if (a4)
  {
    tokenizerOutputString = self->_tokenizerOutputString;
    if (tokenizerOutputString)
      v7 = tokenizerOutputString;
    else
      v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v10 = self->_tokenizerOutputString;
    self->_tokenizerOutputString = v7;

    -[NSMutableString deleteCharactersInRange:](self->_tokenizerOutputString, "deleteCharactersInRange:", 0, -[NSMutableString length](self->_tokenizerOutputString, "length"));
    a3->var0 = self->_tokenizerOutputString;
    *(_OWORD *)&a3->var1 = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    a3->var5 = 0;
    a3->var6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_tokenizerOutputRanges;
  }
  else
  {
    tokenizerOutputTokens = self->_tokenizerOutputTokens;
    if (tokenizerOutputTokens)
      v9 = tokenizerOutputTokens;
    else
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_tokenizerOutputTokens;
    self->_tokenizerOutputTokens = v9;

    -[NSMutableArray removeAllObjects](self->_tokenizerOutputTokens, "removeAllObjects");
    tokenizerOutputNormalizedTokens = self->_tokenizerOutputNormalizedTokens;
    if (tokenizerOutputNormalizedTokens)
      v13 = tokenizerOutputNormalizedTokens;
    else
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = self->_tokenizerOutputNormalizedTokens;
    self->_tokenizerOutputNormalizedTokens = v13;

    -[NSMutableArray removeAllObjects](self->_tokenizerOutputNormalizedTokens, "removeAllObjects");
    v15 = *(int8x16_t *)&self->_tokenizerOutputTokens;
    a3->var0 = 0;
    *(int8x16_t *)&a3->var1 = vextq_s8(v15, v15, 8uLL);
    a3->var3 = 0;
    a3->var4 = 0;
    a3->var5 = 0;
    a3->var6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_tokenizerOutputRanges;
  }
  *(_OWORD *)&a3->var7 = xmmword_199B9FE10;
}

- (void)_inqGetTokensFromString:(id)a3 category:(signed __int16)a4 tokenOutput:(tokenOutput_t *)a5
{
  uint64_t v7;
  id v8;

  if (a4 == 2100)
    v7 = 12;
  else
    v7 = 0;
  v8 = a3;
  -[PSIDatabase _prepareTokenOutput:forIndexing:](self, "_prepareTokenOutput:forIndexing:", a5, 1);
  -[PSITokenizer tokenizeString:withOptions:tokenOutput:](self->_tokenizer, "tokenizeString:withOptions:tokenOutput:", v8, v7, a5);

}

- (unint64_t)_inqUpdateGroupForText:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningGroupId:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  _OWORD v16[4];
  uint64_t v17;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    -[PSITokenizer normalizeString:](self->_tokenizer, "normalizeString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  if (objc_msgSend(v12, "length"))
    -[PSIDatabase _inqGetTokensFromString:category:tokenOutput:](self, "_inqGetTokensFromString:category:tokenOutput:", v12, v7, v16);
  LOWORD(v15) = PLSearchIndexCategoryIsSynonym((int)v7);
  v13 = -[PSIDatabase _inqGroupIdForCategory:owningGroupId:contentString:normalizedString:identifier:rankingScore:insertIfNeeded:tokenOutput:shouldUpdateOwningGroupId:shouldUpdateRankingScore:](self, "_inqGroupIdForCategory:owningGroupId:contentString:normalizedString:identifier:rankingScore:insertIfNeeded:tokenOutput:shouldUpdateOwningGroupId:shouldUpdateRankingScore:", v7, a6, v10, v12, v11, 1, 0.0, v16, v15);

  return v13;
}

- (void)_inqRemoveUUID:(id)a3 objectType:(unint64_t)a4 isInBatch:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  PSIDatabase *v18;
  id v19;
  unint64_t v20;
  SEL v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (self->_inqDatabase)
  {
    PLSearchBackendPSIDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = CFSTR("collection");
      if (!a4)
        v11 = CFSTR("asset");
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2114;
      v25 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Removing %{public}@ with UUID: %{public}@", buf, 0x16u);
    }

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __51__PSIDatabase__inqRemoveUUID_objectType_isInBatch___block_invoke;
    v17 = &unk_1E36753D0;
    v20 = a4;
    v18 = self;
    v19 = v9;
    v21 = a2;
    v12 = MEMORY[0x19AEC174C](&v14);
    v13 = (void *)v12;
    if (v5)
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    else
      -[PSIDatabase _inqPerformBatch:](self, "_inqPerformBatch:", v12, v14, v15, v16, v17, v18);

  }
}

- (void)_inqRemoveUnusedGroups
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  PLSearchBackendPSIDatabaseGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Removing unused groups", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "searchDatabaseLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SearchDatabase - removeUnusedGroups", ", v11, 2u);
  }

  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("deleteUnusedGroupsAndLookups_1")), 0);
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("deleteUnusedGroupsAndLookups_2")), 0);
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("deleteUnusedGroupsAndLookups_3")), 0);
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("deleteUnusedGroupsAndLookups_4")), 0);
  v8 = v7;
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v5, "SearchDatabase - removeUnusedGroups", ", v10, 2u);
  }

}

- (void)_inqRemoveUUID:(id)a3 categories:(id)a4 objectType:(unint64_t)a5 isInBatch:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  SEL v19;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  if (self->_inqDatabase)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke;
    v15[3] = &unk_1E36753F8;
    v18 = a5;
    v15[4] = self;
    v16 = v11;
    v19 = a2;
    v17 = v12;
    v13 = MEMORY[0x19AEC174C](v15);
    v14 = (void *)v13;
    if (v6)
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    else
      -[PSIDatabase _inqPerformBatch:](self, "_inqPerformBatch:", v13);

  }
}

- (void)_inqDeleteGroupsWithGraphCollectionsForPersonUUID:(id)a3
{
  __CFString *v5;
  const __CFAllocator *v6;
  const __CFSet *Mutable;
  const __CFSet *v8;
  sqlite3_stmt *Value;
  char *v10;
  uint64_t v11;
  CFIndex Count;
  NSObject *v13;
  NSObject *v14;
  const void *v15;
  CFIndex v16;
  _BOOL4 v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  int v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIDatabase.m"), 3280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID"));

  }
  v24 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v8 = CFSetCreateMutable(v6, 0, 0);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupsForLookupId"));
  v10 = _newUTF8String(v5, &v24);
  if (sqlite3_bind_text(Value, 1, v10, v24, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke;
  v23[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v23[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v23);
  Count = CFSetGetCount(Mutable);
  PLSearchBackendPSIDatabaseGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (Count < 1)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    v18 = "Search Indexing: Failed to find groups corresponding to person with UUID: %{public}@. Unable to remove any sta"
          "le groups for rename.";
    v19 = v14;
    v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    v26 = (const __CFString *)Count;
    v27 = 2114;
    v28 = v5;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Search Indexing: Found %{public}lu groups corresponding to person with UUID: %{public}@", buf, 0x16u);
  }

  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", Mutable);
  v15 = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupIdsInGCWithGroupIdsStatement"));
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke_460;
  v22[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v22[4] = v8;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", v15, v22);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  v16 = CFSetGetCount(v8);
  PLSearchBackendPSIDatabaseGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v16 < 1)
  {
    if (!v17)
      goto LABEL_19;
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    v18 = "Search Indexing: did not find groups in the GC table corresponding to person with UUID: %{public}@";
    v19 = v14;
    v20 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
    _os_log_impl(&dword_199541000, v19, v20, v18, buf, 0xCu);
LABEL_19:

    if (!v10)
      goto LABEL_21;
LABEL_20:
    free(v10);
    goto LABEL_21;
  }
  if (v17)
  {
    *(_DWORD *)buf = 134349314;
    v26 = (const __CFString *)v16;
    v27 = 2114;
    v28 = v5;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Search Indexing: Found %{public}lu groups for person with UUID: %{public}@ to remove in GC table.", buf, 0x16u);
  }

  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v8);
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("deleteGroupsWithIds")), 0);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  if (v10)
    goto LABEL_20;
LABEL_21:
  CFRelease(Mutable);
  CFRelease(v8);

}

- (unint64_t)_inqAssetIdForUUID:(id)a3 uuid_0:(unint64_t *)a4 uuid_1:(unint64_t *)a5
{
  __CFString *v8;
  sqlite3_stmt *Value;
  NSObject *v10;
  unint64_t v11;
  _QWORD v13[5];
  sqlite3_int64 v14;
  sqlite3_int64 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14 = 0;
  v15 = 0;
  if (PLStringUUIDComponents(v8, &v15, &v14))
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectAsset"));
    if (sqlite3_bind_int64(Value, 1, v15) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v14) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__PSIDatabase__inqAssetIdForUUID_uuid_0_uuid_1___block_invoke;
    v13[3] = &unk_1E3674FF0;
    v13[4] = &v16;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v13);
  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Asset has an invalid UUID: %{public}@", buf, 0xCu);
    }

  }
  if (a4)
    *a4 = v15;
  if (a5)
    *a5 = v14;
  v11 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (unint64_t)_inqAssetIdForUUID:(id)a3
{
  return -[PSIDatabase _inqAssetIdForUUID:uuid_0:uuid_1:](self, "_inqAssetIdForUUID:uuid_0:uuid_1:", a3, 0, 0);
}

- (unint64_t)_inqAssetIdWithAsset:(id)a3
{
  id v4;
  __CFString *v5;
  sqlite3_int64 insert_rowid;
  sqlite3_stmt *Value;
  void *v8;
  int v9;
  NSObject *v10;
  sqlite3_int64 v12;
  sqlite3_int64 v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  sqlite3_int64 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 0;
  insert_rowid = -[PSIDatabase _inqAssetIdForUUID:uuid_0:uuid_1:](self, "_inqAssetIdForUUID:uuid_0:uuid_1:", v5, &v13, &v12);
  if (!insert_rowid)
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("insertAsset"));
    if (sqlite3_bind_int64(Value, 1, v13) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v12) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(v4, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = sqlite3_bind_int64(Value, 3, objc_msgSend(v8, "int64Representation"));

    if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
    insert_rowid = sqlite3_last_insert_rowid(self->_inqDatabase);
    PLSearchBackendPSIDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2050;
      v17 = insert_rowid;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Inserted asset with UUID %{public}@ at assetId: %{public}lld", buf, 0x16u);
    }

  }
  return insert_rowid;
}

- (unint64_t)_inqCollectionIdForUUID:(id)a3 uuid_0:(unint64_t *)a4 uuid_1:(unint64_t *)a5
{
  __CFString *v8;
  sqlite3_stmt *Value;
  NSObject *v10;
  unint64_t v11;
  _QWORD v13[5];
  sqlite3_int64 v14;
  sqlite3_int64 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14 = 0;
  v15 = 0;
  if (PLStringUUIDComponents(v8, &v15, &v14))
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectCollectionForUUID"));
    if (sqlite3_bind_int64(Value, 1, v15) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v14) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__PSIDatabase__inqCollectionIdForUUID_uuid_0_uuid_1___block_invoke;
    v13[3] = &unk_1E3674FF0;
    v13[4] = &v16;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v13);
  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Collection has an invalid UUID: %{public}@", buf, 0xCu);
    }

  }
  if (a4)
    *a4 = v15;
  if (a5)
    *a5 = v14;
  v11 = v17[3];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (unint64_t)_inqCollectionIdForUUID:(id)a3
{
  return -[PSIDatabase _inqCollectionIdForUUID:uuid_0:uuid_1:](self, "_inqCollectionIdForUUID:uuid_0:uuid_1:", a3, 0, 0);
}

- (unint64_t)_inqCollectionIdWithCollection:(id)a3
{
  id v4;
  __CFString *v5;
  sqlite3_int64 insert_rowid;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  sqlite3_stmt *Value;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  const char *v17;
  void *v18;
  char *v19;
  char *v20;
  _BYTE *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  sqlite3_int64 v34;
  sqlite3_int64 v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  sqlite3_int64 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = 0;
  insert_rowid = -[PSIDatabase _inqCollectionIdForUUID:uuid_0:uuid_1:](self, "_inqCollectionIdForUUID:uuid_0:uuid_1:", v5, &v35, &v34);
  if (!insert_rowid)
  {
    objc_msgSend(v4, "keyAssetPrivate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "keyAssetShared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length") && !objc_msgSend(v10, "length"))
    {
      PLSearchBackendPSIDatabaseGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "uuid");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v29;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "No key asset for collection UUID: %{public}@", buf, 0xCu);

      }
      insert_rowid = 0;
      goto LABEL_58;
    }
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("insertCollection"));
    if (sqlite3_bind_int64(Value, 1, v35) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (sqlite3_bind_int64(Value, 2, v34) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(v4, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sqlite3_bind_int64(Value, 3, objc_msgSend(v12, "int64Representation"));

    if (v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(v4, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = sqlite3_bind_int64(Value, 4, objc_msgSend(v14, "int64Representation"));

    if (v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(v4, "title");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v4, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = _newUTF8String(v16, &v33);

    if (sqlite3_bind_text(Value, 5, v17, v33, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(v4, "subtitle", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v18;
    if (v18)
    {
      v19 = _newUTF8String(v18, &v33);
      if (!sqlite3_bind_text(Value, 6, v19, v33, 0))
        goto LABEL_25;
    }
    else
    {
      v19 = 0;
      if (!sqlite3_bind_null(Value, 6))
        goto LABEL_25;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
LABEL_25:
    if (sqlite3_bind_int(Value, 7, objc_msgSend(v4, "type"))
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if (objc_msgSend(v8, "length"))
    {
      v20 = _newUTF8String(v8, &v33);
      if (!sqlite3_bind_text(Value, 8, v20, v33, 0))
        goto LABEL_34;
    }
    else
    {
      v20 = 0;
      if (!sqlite3_bind_null(Value, 8))
        goto LABEL_34;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
LABEL_34:
    if (objc_msgSend(v10, "length"))
    {
      v21 = _newUTF8String(v10, &v33);
      if (!sqlite3_bind_text(Value, 9, v21, v33, 0))
      {
LABEL_40:
        if (sqlite3_bind_int(Value, 10, objc_msgSend(v4, "assetsCountPrivate"))
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        v22 = v10;
        if (sqlite3_bind_int(Value, 11, objc_msgSend(v4, "assetsCountShared"))
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        objc_msgSend(v4, "sortDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        v25 = v24;

        if (sqlite3_bind_double(Value, 12, v25) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
        insert_rowid = sqlite3_last_insert_rowid(self->_inqDatabase);
        free(v30);
        v10 = v22;
        if (v20)
          free(v20);
        v26 = v32;
        if (v21)
          free(v21);
        if (v19)
          free(v19);
        PLSearchBackendPSIDatabaseGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138544386;
          v37 = v5;
          v38 = 2112;
          v39 = v32;
          v40 = 2114;
          v41 = v8;
          v42 = 2114;
          v43 = v22;
          v44 = 2050;
          v45 = insert_rowid;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "Inserted collection with UUID %{public}@, title \"%@\", keyAssetUUIDPrivate %{public}@, keyAssetUUIDShared: %{public}@, at collectionId: %{public}lld", buf, 0x34u);
        }

LABEL_58:
        goto LABEL_59;
      }
    }
    else
    {
      v21 = 0;
      if (!sqlite3_bind_null(Value, 9))
        goto LABEL_40;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    goto LABEL_40;
  }
LABEL_59:

  return insert_rowid;
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 contentString:(id)a4
{
  int v4;
  id v6;
  sqlite3_stmt *Value;
  char *v8;
  unint64_t v9;
  _QWORD v11[5];
  int v12;
  __int128 buf;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchGroupsForTextAndCategory"));
  v12 = 0;
  v8 = _newUTF8String(v6, &v12);
  if (sqlite3_bind_text(Value, 1, v8, v12, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, v4) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PSIDatabase__inqGroupIdForCategory_contentString___block_invoke;
  v11[3] = &unk_1E3674FF0;
  v11[4] = &buf;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v11);
  if (v8)
    free(v8);
  v9 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);

  return v9;
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 contentString:(id)a4 identifier:(id)a5 outOwningGroupId:(unint64_t *)a6 outScore:(double *)a7
{
  int v10;
  id v12;
  id v13;
  sqlite3_stmt *Value;
  char *v15;
  char *v16;
  unint64_t v17;
  _QWORD v19[7];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  __int128 buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v10 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroup"));
  if (sqlite3_bind_int(Value, 1, v10) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  v29 = 0;
  v15 = _newUTF8String(v12, &v29);
  if (sqlite3_bind_text(Value, 2, v15, v29, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  v28 = 0;
  v16 = _newUTF8String(v13, &v28);
  if (sqlite3_bind_text(Value, 3, v16, v28, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x2020000000;
  v32 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__PSIDatabase__inqGroupIdForCategory_contentString_identifier_outOwningGroupId_outScore___block_invoke;
  v19[3] = &unk_1E3675420;
  v19[4] = &buf;
  v19[5] = &v24;
  v19[6] = &v20;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v19);
  if (a6)
    *a6 = v25[3];
  if (a7)
    *a7 = v21[3];
  if (v15)
    free(v15);
  if (v16)
    free(v16);
  v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 normalizedString:(id)a4 identifier:(id)a5 outOwningGroupId:(unint64_t *)a6 outScore:(double *)a7
{
  int v10;
  id v12;
  id v13;
  sqlite3_stmt *Value;
  char *v15;
  char *v16;
  unint64_t v17;
  _QWORD v19[7];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  __int128 buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v10 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupWithNormalizedStr"));
  if (sqlite3_bind_int(Value, 1, v10) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  v29 = 0;
  v15 = _newUTF8String(v12, &v29);
  if (sqlite3_bind_text(Value, 2, v15, v29, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  v28 = 0;
  v16 = _newUTF8String(v13, &v28);
  if (sqlite3_bind_text(Value, 3, v16, v28, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x2020000000;
  v32 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__PSIDatabase__inqGroupIdForCategory_normalizedString_identifier_outOwningGroupId_outScore___block_invoke;
  v19[3] = &unk_1E3675420;
  v19[4] = &buf;
  v19[5] = &v24;
  v19[6] = &v20;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v19);
  if (a6)
    *a6 = v25[3];
  if (a7)
    *a7 = v21[3];
  if (v15)
    free(v15);
  if (v16)
    free(v16);
  v17 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 identifier:(id)a4 outOwningGroupId:(unint64_t *)a5 outScore:(double *)a6
{
  int v8;
  id v10;
  sqlite3_stmt *Value;
  char *v12;
  unint64_t v13;
  _QWORD v15[7];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int128 buf;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupWithLookupId"));
  if (sqlite3_bind_int(Value, 1, v8) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  v24 = 0;
  v12 = _newUTF8String(v10, &v24);
  if (sqlite3_bind_text(Value, 2, v12, v24, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PSIDatabase__inqGroupIdForCategory_identifier_outOwningGroupId_outScore___block_invoke;
  v15[3] = &unk_1E3675420;
  v15[4] = &buf;
  v15[5] = &v20;
  v15[6] = &v16;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v15);
  if (a5)
    *a5 = v21[3];
  if (a6)
    *a6 = v17[3];
  if (v12)
    free(v12);
  v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  return v13;
}

- (unint64_t)_inqGroupIdForCategory:(signed __int16)a3 owningGroupId:(unint64_t)a4 contentString:(id)a5 normalizedString:(id)a6 identifier:(id)a7 rankingScore:(double)a8 insertIfNeeded:(BOOL)a9 tokenOutput:(const tokenOutput_t *)a10 shouldUpdateOwningGroupId:(BOOL)a11 shouldUpdateRankingScore:(BOOL)a12
{
  _BOOL4 v12;
  uint64_t v17;
  id v19;
  id v20;
  id v21;
  sqlite3_int64 insert_rowid;
  _BOOL4 v23;
  NSObject *v24;
  sqlite3_stmt *Value;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  char *v31;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var6;
  int64_t var7;
  sqlite3_stmt *v34;
  NSObject *v35;
  NSObject *v36;
  int v38;
  int v39;
  int v40;
  _QWORD v41[5];
  double v42;
  uint64_t v43;
  uint8_t v44[4];
  const __CFString *v45;
  _BYTE buf[22];
  uint64_t v47;

  v12 = a9;
  v17 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v42 = 0.0;
  v43 = 0;
  if (a12)
  {
    insert_rowid = -[PSIDatabase _inqGroupIdForCategory:contentString:identifier:outOwningGroupId:outScore:](self, "_inqGroupIdForCategory:contentString:identifier:outOwningGroupId:outScore:", v17, v19, v21, &v43, &v42);
    if (!insert_rowid)
      insert_rowid = -[PSIDatabase _inqGroupIdForCategory:identifier:outOwningGroupId:outScore:](self, "_inqGroupIdForCategory:identifier:outOwningGroupId:outScore:", v17, v21, &v43, &v42);
    v23 = insert_rowid == 0;
    if (insert_rowid && v42 != a8)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = insert_rowid;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = a8;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "Setting ranking score for group id: %llu to score: %f", buf, 0x16u);
      }

      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("updateGroupRankingScore"));
      if (sqlite3_bind_double(Value, 1, a8) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      if (sqlite3_bind_int64(Value, 2, insert_rowid) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
      goto LABEL_64;
    }
  }
  else
  {
    if ((unsigned __int16)(v17 - 1203) > 1u)
      v26 = -[PSIDatabase _inqGroupIdForCategory:contentString:identifier:outOwningGroupId:outScore:](self, "_inqGroupIdForCategory:contentString:identifier:outOwningGroupId:outScore:", v17, v19, v21, &v43, &v42);
    else
      v26 = -[PSIDatabase _inqGroupIdForCategory:normalizedString:identifier:outOwningGroupId:outScore:](self, "_inqGroupIdForCategory:normalizedString:identifier:outOwningGroupId:outScore:", v17, v20, v21, &v43, &v42);
    insert_rowid = v26;
    v23 = v26 == 0;
  }
  if (v23 || v43 == a4)
  {
    if (v23 && v12)
    {
      v40 = 0;
      v29 = _newUTF8String(v19, &v40);
      v39 = 0;
      v30 = _newUTF8String(v20, &v39);
      v38 = 0;
      v31 = _newUTF8String(v21, &v38);
      var6 = a10->var6;
      if (a10->var8 >= a10->var7)
        var7 = a10->var7;
      else
        var7 = a10->var8;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      +[PSIGroup getCompressedRanges:fromTokenRanges:count:](PSIGroup, "getCompressedRanges:fromTokenRanges:count:", buf, var6, var7);
      v34 = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("insertGroup"));
      if (sqlite3_bind_int(v34, 1, v17) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_int64(v34, 2, a4) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_text(v34, 3, v29, v40, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_text(v34, 4, v30, v39, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_text(v34, 5, v31, v38, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_double(v34, 6, a8) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_int64(v34, 7, *(sqlite3_int64 *)buf)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      if (sqlite3_bind_int64(v34, 8, *(sqlite3_int64 *)&buf[8])
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v44 = 138412290;
        v45 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", v44, 0xCu);
      }
      -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", v34, 0);
      insert_rowid = sqlite3_last_insert_rowid(self->_inqDatabase);
      PLSearchBackendPSIDatabaseGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v44 = 134217984;
        v45 = (const __CFString *)insert_rowid;
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEBUG, "Inserting groupID: %llu", v44, 0xCu);
      }

      if (v29)
        free(v29);
      if (v30)
        free(v30);
      if (v31)
        free(v31);
    }
  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __185__PSIDatabase__inqGroupIdForCategory_owningGroupId_contentString_normalizedString_identifier_rankingScore_insertIfNeeded_tokenOutput_shouldUpdateOwningGroupId_shouldUpdateRankingScore___block_invoke;
    v41[3] = &unk_1E3675448;
    v41[4] = self;
    v27 = MEMORY[0x19AEC174C](v41);
    v28 = (void *)v27;
    if (a11)
    {
      (*(void (**)(uint64_t, sqlite3_int64, unint64_t))(v27 + 16))(v27, insert_rowid, a4);
    }
    else if (v43)
    {
      (*(void (**)(uint64_t, sqlite3_int64, _QWORD))(v27 + 16))(v27, insert_rowid, 0);
      PLSearchBackendPSIDatabaseGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349314;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_INFO, "Dropping previous owningGroupId (%{public}llu) for keyword with different owning categories. ContentString: %@", buf, 0x16u);
      }

    }
  }
LABEL_64:

  return insert_rowid;
}

- (void)_inqUpdateGATableWithGroupId:(unint64_t)a3 assetId:(unint64_t)a4
{
  sqlite3_stmt *Value;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("insertGA"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, a4) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  -[PSIDatabase _inqExecutePreparedStatement:allowError:withStatementBlock:](self, "_inqExecutePreparedStatement:allowError:withStatementBlock:", Value, 19, 0);
  PLSearchBackendPSIDatabaseGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134349312;
    v10 = (const __CFString *)a4;
    v11 = 2050;
    v12 = a3;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Inserted assetId %{public}lld in GA table for groupId %{public}lld", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_inqUpdateGCTableWithGroupId:(unint64_t)a3 collectionId:(unint64_t)a4
{
  sqlite3_stmt *Value;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("insertGC"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, a4) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  -[PSIDatabase _inqExecutePreparedStatement:allowError:withStatementBlock:](self, "_inqExecutePreparedStatement:allowError:withStatementBlock:", Value, 19, 0);
  PLSearchBackendPSIDatabaseGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134349312;
    v10 = (const __CFString *)a4;
    v11 = 2050;
    v12 = a3;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Inserted collectionId %{public}lld in GC table for groupId %{public}lld", (uint8_t *)&v9, 0x16u);
  }

}

- (id)_inqGroupWithMatchingGroupId:(unint64_t)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v8;
  sqlite3_stmt *Value;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__93030;
  v21 = __Block_byref_object_dispose__93031;
  v22 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchGroupForGroupId"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PSIDatabase__inqGroupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke;
  v13[3] = &unk_1E3675470;
  v15 = &v17;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v16 = a5;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_inqFilenameGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 matchingPredicateBlock:(id)a6
{
  id v10;
  id v11;
  CFIndex Count;
  void *v13;
  void *v14;
  void *v15;
  sqlite3_stmt *Value;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, sqlite3_stmt *);
  void *v51;
  PSIDatabase *v52;
  id v53;
  id v54;
  __int128 *p_buf;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  Count = CFSetGetCount(a3);
  if (!Count)
  {
    v26 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
  if (v10)
  {
    objc_msgSend(v10, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      && (objc_msgSend(v10, "endDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchFilenameGroupsForGroupIdsWithStartEndDates"));
      objc_msgSend(v10, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = sqlite3_bind_int64(Value, 1, objc_msgSend(v17, "int64RepresentationMask"));

      if (v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v10, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = sqlite3_bind_int64(Value, 2, objc_msgSend(v19, "int64Representation"));

      if (v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v10, "endDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = sqlite3_bind_int64(Value, 3, objc_msgSend(v21, "int64RepresentationMask"));

      if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v10, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = sqlite3_bind_int64(Value, 4, objc_msgSend(v23, "int64Representation"));

      if (!v24 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
      v25 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(v10, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchFilenameGroupsForGroupIdsWithStartDate"));
        objc_msgSend(v10, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = sqlite3_bind_int64(Value, 1, objc_msgSend(v28, "int64RepresentationMask"));

        if (v29 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
        }
        objc_msgSend(v10, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = sqlite3_bind_int64(Value, 2, objc_msgSend(v30, "int64Representation"));

        if (!v31 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
        v25 = MEMORY[0x1E0C81028];
      }
      else
      {
        objc_msgSend(v10, "endDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchFilenameGroupsForGroupIdsWithEndDate"));
          objc_msgSend(v10, "endDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = sqlite3_bind_int64(Value, 1, objc_msgSend(v40, "int64RepresentationMask"));

          if (v41 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
          }
          objc_msgSend(v10, "endDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = sqlite3_bind_int64(Value, 2, objc_msgSend(v42, "int64Representation"));

          if (!v43 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_26;
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
          v25 = MEMORY[0x1E0C81028];
        }
        else
        {
          objc_msgSend(v10, "singleDate");
          Value = (sqlite3_stmt *)objc_claimAutoreleasedReturnValue();

          if (!Value)
            goto LABEL_26;
          Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchFilenameGroupsForGroupIdsWithSingleDate"));
          objc_msgSend(v10, "singleDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = sqlite3_bind_int64(Value, 1, objc_msgSend(v44, "int64RepresentationMask"));

          if (v45 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
          }
          objc_msgSend(v10, "singleDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = sqlite3_bind_int64(Value, 2, objc_msgSend(v46, "int64Representation"));

          if (!v47 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_26;
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
          v25 = MEMORY[0x1E0C81028];
        }
      }
    }
    _os_log_error_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  else
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchFilenameGroupsForGroupIds"));
  }
LABEL_26:
  v32 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke;
  v62[3] = &unk_1E3675498;
  v64 = v11;
  v33 = v13;
  v63 = v33;
  v34 = (void *)MEMORY[0x19AEC174C](v62);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__93030;
  v68 = __Block_byref_object_dispose__93031;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v48 = v32;
  v49 = 3221225472;
  v50 = __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke_2;
  v51 = &unk_1E36754C0;
  v52 = self;
  v53 = v10;
  p_buf = &buf;
  v57 = a5;
  v35 = v34;
  v54 = v35;
  v56 = &v58;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, &v48);
  v36 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v36)
  {
    (*((void (**)(id, uint64_t, uint64_t))v35 + 2))(v35, v36, v59[3]);
    CFRelease((CFTypeRef)v59[3]);
  }
  -[PSIIntArray unbind](self->_matchingIds, "unbind", v48, v49, v50, v51, v52);
  v37 = v54;
  v26 = v33;

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&buf, 8);

LABEL_29:
  return v26;
}

- (id)_inqNonFilenameGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6 matchingPredicateBlock:(id)a7
{
  id v12;
  id v13;
  CFIndex Count;
  void *v15;
  const void *Value;
  id v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  PSIDatabase *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  BOOL v30;

  v12 = a4;
  v13 = a7;
  Count = CFSetGetCount(a3);
  if (Count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
    Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("fetchNonFilenameGroupsForGroupIds"));
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __124__PSIDatabase__inqNonFilenameGroupsWithMatchingGroupIds_dateFilter_includeObjects_searchResultTypes_matchingPredicateBlock___block_invoke;
    v24 = &unk_1E36754E8;
    v25 = self;
    v30 = a5;
    v26 = v12;
    v29 = a6;
    v28 = v13;
    v17 = v15;
    v27 = v17;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, &v21);
    -[PSIIntArray unbind](self->_matchingIds, "unbind", v21, v22, v23, v24, v25);
    v18 = v27;
    v19 = v17;

  }
  else
  {
    v19 = (id)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)_inqGroupsWithMatchingGroupIds:(__CFSet *)a3 dateFilter:(id)a4 includeObjects:(BOOL)a5 searchResultTypes:(unint64_t)a6 matchingPredicateBlock:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  CFIndex Count;
  void *v15;
  void *v16;
  const __CFAllocator *v17;
  CFIndex v18;
  __CFSet *MutableCopy;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  Count = CFSetGetCount(a3);
  if (Count)
  {
    v27 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLSearchIndexConfiguration shouldIndexFilenames](PLSearchIndexConfiguration, "shouldIndexFilenames"))
    {
      -[PSIDatabase _inqFilenameGroupsWithMatchingGroupIds:dateFilter:searchResultTypes:matchingPredicateBlock:](self, "_inqFilenameGroupsWithMatchingGroupIds:dateFilter:searchResultTypes:matchingPredicateBlock:", a3, v12, a6, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }
    v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v18 = CFSetGetCount(a3);
    MutableCopy = CFSetCreateMutableCopy(v17, v18, a3);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = v16;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          CFSetRemoveValue(MutableCopy, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24++), "groupId"));
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v22);
    }

    -[PSIDatabase _inqNonFilenameGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:](self, "_inqNonFilenameGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", MutableCopy, v12, v27, a6, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(MutableCopy);
    objc_msgSend(v15, "addObjectsFromArray:", v25);
    objc_msgSend(v15, "addObjectsFromArray:", v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (id)_inqNewSynonymTextsByOwningGroupIdWithGroupIds:(__CFSet *)a3
{
  void *v5;
  const void *Value;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", CFSetGetCount(a3));
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectSynonymInfoWithOwningGroupIds"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PSIDatabase__inqNewSynonymTextsByOwningGroupIdWithGroupIds___block_invoke;
  v9[3] = &unk_1E3674FA8;
  v7 = v5;
  v10 = v7;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v9);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v7;
}

- (__CFArray)_inqNewAssetIdsWithDateFilter:(id)a3
{
  id v4;
  __CFArray *Mutable;
  void *v6;
  sqlite3_stmt *Value;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v14;
  void *v15;
  __CFDictionary *inqPreparedStatements;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  _QWORD v34[5];
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(v4, "singleDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithSingleDateAsset"));
      objc_msgSend(v4, "singleDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = sqlite3_bind_int64(Value, 1, objc_msgSend(v8, "int64RepresentationMask"));

      if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v4, "singleDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sqlite3_bind_int64(Value, 2, objc_msgSend(v10, "int64Representation"));

      if (!v11 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_DWORD *)buf = 138412290;
      v36 = CFSTR("Failed to bind parameter");
      v25 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(v4, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v4, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v15)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartEndDatesAsset"));
          objc_msgSend(v4, "startDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = sqlite3_bind_int64(Value, 1, objc_msgSend(v17, "int64RepresentationMask"));

          if (v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = sqlite3_bind_int64(Value, 2, objc_msgSend(v19, "int64Representation"));

          if (v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = sqlite3_bind_int64(Value, 3, objc_msgSend(v21, "int64RepresentationMask"));

          if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "endDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = sqlite3_bind_int64(Value, 4, objc_msgSend(v23, "int64Representation"));

          if (!v24 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_8;
          *(_DWORD *)buf = 138412290;
          v36 = CFSTR("Failed to bind parameter");
          v25 = MEMORY[0x1E0C81028];
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartDateAsset"));
          objc_msgSend(v4, "startDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = sqlite3_bind_int64(Value, 1, objc_msgSend(v30, "int64RepresentationMask"));

          if (v31 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "startDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = sqlite3_bind_int64(Value, 2, objc_msgSend(v32, "int64Representation"));

          if (!v33 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_8;
          *(_DWORD *)buf = 138412290;
          v36 = CFSTR("Failed to bind parameter");
          v25 = MEMORY[0x1E0C81028];
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithEndDateAsset"));
        objc_msgSend(v4, "endDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = sqlite3_bind_int64(Value, 1, objc_msgSend(v26, "int64RepresentationMask"));

        if (v27 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        objc_msgSend(v4, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = sqlite3_bind_int64(Value, 2, objc_msgSend(v28, "int64Representation"));

        if (!v29 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 138412290;
        v36 = CFSTR("Failed to bind parameter");
        v25 = MEMORY[0x1E0C81028];
      }
    }
    _os_log_error_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
LABEL_8:
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __45__PSIDatabase__inqNewAssetIdsWithDateFilter___block_invoke;
    v34[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v34[4] = Mutable;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v34);
    goto LABEL_12;
  }
  PLSearchBackendPSIDatabaseGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "This should not get called with a nil dateFilter", buf, 2u);
  }

  Mutable = 0;
LABEL_12:

  return Mutable;
}

- (__CFArray)_inqNewAssetIdsForGroupId:(unint64_t)a3 dateFilter:(id)a4
{
  id v6;
  __CFArray *Mutable;
  void *v8;
  sqlite3_stmt *Value;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v16;
  void *v17;
  __CFDictionary *inqPreparedStatements;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  _QWORD v35[5];
  uint8_t buf[4];
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  if (v6)
  {
    objc_msgSend(v6, "singleDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithSingleDateGA"));
      objc_msgSend(v6, "singleDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sqlite3_bind_int64(Value, 1, objc_msgSend(v10, "int64RepresentationMask"));

      if (v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v6, "singleDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = sqlite3_bind_int64(Value, 2, objc_msgSend(v12, "int64Representation"));

      if (v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = CFSTR("Failed to bind parameter");
        v14 = MEMORY[0x1E0C81028];
LABEL_51:
        _os_log_error_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v6, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v6, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v17)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartEndDatesGA"));
          objc_msgSend(v6, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = sqlite3_bind_int64(Value, 1, objc_msgSend(v19, "int64RepresentationMask"));

          if (v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = sqlite3_bind_int64(Value, 2, objc_msgSend(v21, "int64Representation"));

          if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "endDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = sqlite3_bind_int64(Value, 3, objc_msgSend(v23, "int64RepresentationMask"));

          if (v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = sqlite3_bind_int64(Value, 4, objc_msgSend(v25, "int64Representation"));

          if (v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 5, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            v14 = MEMORY[0x1E0C81028];
            goto LABEL_51;
          }
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartDateGA"));
          objc_msgSend(v6, "startDate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = sqlite3_bind_int64(Value, 1, objc_msgSend(v31, "int64RepresentationMask"));

          if (v32 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "startDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = sqlite3_bind_int64(Value, 2, objc_msgSend(v33, "int64Representation"));

          if (v34 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = CFSTR("Failed to bind parameter");
            v14 = MEMORY[0x1E0C81028];
            goto LABEL_51;
          }
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithEndDateGA"));
        objc_msgSend(v6, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = sqlite3_bind_int64(Value, 1, objc_msgSend(v27, "int64RepresentationMask"));

        if (v28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        objc_msgSend(v6, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = sqlite3_bind_int64(Value, 2, objc_msgSend(v29, "int64Representation"));

        if (v30 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = CFSTR("Failed to bind parameter");
          v14 = MEMORY[0x1E0C81028];
          goto LABEL_51;
        }
      }
    }
  }
  else
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGA"));
    if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = CFSTR("Failed to bind parameter");
      v14 = MEMORY[0x1E0C81028];
      goto LABEL_51;
    }
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __52__PSIDatabase__inqNewAssetIdsForGroupId_dateFilter___block_invoke;
  v35[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v35[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v35);

  return Mutable;
}

- (__CFArray)_inqNewCollectionIdsWithDateFilter:(id)a3
{
  id v4;
  __CFArray *Mutable;
  void *v6;
  sqlite3_stmt *Value;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v18;
  void *v19;
  __CFDictionary *inqPreparedStatements;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  _QWORD v38[5];
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(v4, "singleDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithSingleDateCollection"));
      objc_msgSend(v4, "singleDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = sqlite3_bind_int64(Value, 1, objc_msgSend(v8, "int64RepresentationMask"));

      if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v4, "singleDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sqlite3_bind_int64(Value, 2, objc_msgSend(v10, "int64Representation"));

      if (v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v4, "singleDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = sqlite3_bind_int64(Value, 3, objc_msgSend(v12, "int64RepresentationMask"));

      if (v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v4, "singleDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sqlite3_bind_int64(Value, 4, objc_msgSend(v14, "int64Representation"));

      if (!v15 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 138412290;
      v40 = CFSTR("Failed to bind parameter");
      v29 = MEMORY[0x1E0C81028];
    }
    else
    {
      objc_msgSend(v4, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v4, "endDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v19)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartEndDatesCollection"));
          objc_msgSend(v4, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = sqlite3_bind_int64(Value, 1, objc_msgSend(v21, "int64RepresentationMask"));

          if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = sqlite3_bind_int64(Value, 2, objc_msgSend(v23, "int64Representation"));

          if (v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = sqlite3_bind_int64(Value, 3, objc_msgSend(v25, "int64RepresentationMask"));

          if (v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "endDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = sqlite3_bind_int64(Value, 4, objc_msgSend(v27, "int64Representation"));

          if (!v28 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          *(_DWORD *)buf = 138412290;
          v40 = CFSTR("Failed to bind parameter");
          v29 = MEMORY[0x1E0C81028];
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartDateCollection"));
          objc_msgSend(v4, "startDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = sqlite3_bind_int64(Value, 1, objc_msgSend(v34, "int64RepresentationMask"));

          if (v35 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = sqlite3_bind_int64(Value, 2, objc_msgSend(v36, "int64Representation"));

          if (!v37 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          *(_DWORD *)buf = 138412290;
          v40 = CFSTR("Failed to bind parameter");
          v29 = MEMORY[0x1E0C81028];
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithEndDateCollection"));
        objc_msgSend(v4, "endDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = sqlite3_bind_int64(Value, 1, objc_msgSend(v30, "int64RepresentationMask"));

        if (v31 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        objc_msgSend(v4, "endDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = sqlite3_bind_int64(Value, 2, objc_msgSend(v32, "int64Representation"));

        if (!v33 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        *(_DWORD *)buf = 138412290;
        v40 = CFSTR("Failed to bind parameter");
        v29 = MEMORY[0x1E0C81028];
      }
    }
    _os_log_error_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
LABEL_14:
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __50__PSIDatabase__inqNewCollectionIdsWithDateFilter___block_invoke;
    v38[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
    v38[4] = Mutable;
    -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v38);
    goto LABEL_18;
  }
  PLSearchBackendPSIDatabaseGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "This should not get called with a nil dateFilter", buf, 2u);
  }

  Mutable = 0;
LABEL_18:

  return Mutable;
}

- (__CFArray)_inqNewCollectionIdsForGroupId:(unint64_t)a3 dateFilter:(id)a4
{
  id v6;
  __CFArray *Mutable;
  void *v8;
  sqlite3_stmt *Value;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v20;
  void *v21;
  __CFDictionary *inqPreparedStatements;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  _QWORD v39[5];
  uint8_t buf[4];
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  if (v6)
  {
    objc_msgSend(v6, "singleDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithSingleDateGC"));
      objc_msgSend(v6, "singleDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = sqlite3_bind_int64(Value, 1, objc_msgSend(v10, "int64RepresentationMask"));

      if (v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v6, "singleDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = sqlite3_bind_int64(Value, 2, objc_msgSend(v12, "int64Representation"));

      if (v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v6, "singleDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sqlite3_bind_int64(Value, 3, objc_msgSend(v14, "int64RepresentationMask"));

      if (v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      objc_msgSend(v6, "singleDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = sqlite3_bind_int64(Value, 4, objc_msgSend(v16, "int64Representation"));

      if (v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      if (sqlite3_bind_int64(Value, 5, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = CFSTR("Failed to bind parameter");
        v18 = MEMORY[0x1E0C81028];
LABEL_57:
        _os_log_error_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v6, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v6, "endDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        inqPreparedStatements = self->_inqPreparedStatements;
        if (v21)
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartEndDatesGC"));
          objc_msgSend(v6, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = sqlite3_bind_int64(Value, 1, objc_msgSend(v23, "int64RepresentationMask"));

          if (v24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "startDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = sqlite3_bind_int64(Value, 2, objc_msgSend(v25, "int64Representation"));

          if (v26 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "endDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = sqlite3_bind_int64(Value, 3, objc_msgSend(v27, "int64RepresentationMask"));

          if (v28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "endDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = sqlite3_bind_int64(Value, 4, objc_msgSend(v29, "int64Representation"));

          if (v30 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 5, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            v18 = MEMORY[0x1E0C81028];
            goto LABEL_57;
          }
        }
        else
        {
          Value = (sqlite3_stmt *)CFDictionaryGetValue(inqPreparedStatements, CFSTR("selectWithStartDateGC"));
          objc_msgSend(v6, "startDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = sqlite3_bind_int64(Value, 1, objc_msgSend(v35, "int64RepresentationMask"));

          if (v36 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          objc_msgSend(v6, "startDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = sqlite3_bind_int64(Value, 2, objc_msgSend(v37, "int64Representation"));

          if (v38 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
          }
          if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("Failed to bind parameter");
            v18 = MEMORY[0x1E0C81028];
            goto LABEL_57;
          }
        }
      }
      else
      {
        Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectWithEndDateGC"));
        objc_msgSend(v6, "endDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = sqlite3_bind_int64(Value, 1, objc_msgSend(v31, "int64RepresentationMask"));

        if (v32 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        objc_msgSend(v6, "endDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = sqlite3_bind_int64(Value, 2, objc_msgSend(v33, "int64Representation"));

        if (v34 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_int64(Value, 3, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = CFSTR("Failed to bind parameter");
          v18 = MEMORY[0x1E0C81028];
          goto LABEL_57;
        }
      }
    }
  }
  else
  {
    Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGC"));
    if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = CFSTR("Failed to bind parameter");
      v18 = MEMORY[0x1E0C81028];
      goto LABEL_57;
    }
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __57__PSIDatabase__inqNewCollectionIdsForGroupId_dateFilter___block_invoke;
  v39[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v39[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v39);

  return Mutable;
}

- (__CFSet)_inqNewGroupIdsForAssetId:(unint64_t)a3
{
  __CFSet *Mutable;
  sqlite3_stmt *Value;
  _QWORD v8[5];
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGAInv"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PSIDatabase__inqNewGroupIdsForAssetId___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v8[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v8);
  return Mutable;
}

- (__CFSet)_inqNewGroupIdsForAssetIds:(__CFSet *)a3
{
  __CFSet *Mutable;
  const void *Value;
  _QWORD v8[5];

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupIdsInGAWithAssetIds"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PSIDatabase__inqNewGroupIdsForAssetIds___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v8[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v8);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  return Mutable;
}

- (id)_inqAssetIdsByGroupIdForAssetIds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PSIStatement *inqAssetIdsByGroupIdForAssetIdsStatement;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v5);

  inqAssetIdsByGroupIdForAssetIdsStatement = self->_inqAssetIdsByGroupIdForAssetIdsStatement;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PSIDatabase__inqAssetIdsByGroupIdForAssetIds___block_invoke;
  v10[3] = &unk_1E3675060;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", inqAssetIdsByGroupIdForAssetIdsStatement, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (__CFSet)_inqNewGroupIdsForCollectionId:(unint64_t)a3
{
  __CFSet *Mutable;
  sqlite3_stmt *Value;
  _QWORD v8[5];
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGCInv"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PSIDatabase__inqNewGroupIdsForCollectionId___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v8[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v8);
  return Mutable;
}

- (__CFSet)_inqNewGroupIdsForCollectionIds:(__CFSet *)a3
{
  __CFSet *Mutable;
  const void *Value;
  _QWORD v8[5];

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectGroupIdsInGCWithCollectionIds"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PSIDatabase__inqNewGroupIdsForCollectionIds___block_invoke;
  v8[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v8[4] = Mutable;
  -[PSIDatabase _inqExecutePreparedStatement:withStatementBlock:](self, "_inqExecutePreparedStatement:withStatementBlock:", Value, v8);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  return Mutable;
}

- (id)_inqCollectionIdsByGroupIdForCollectionIds:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PSIStatement *inqCollectionIdsByGroupIdForCollectionIdsStatement;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v5);

  inqCollectionIdsByGroupIdForCollectionIdsStatement = self->_inqCollectionIdsByGroupIdForCollectionIdsStatement;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PSIDatabase__inqCollectionIdsByGroupIdForCollectionIds___block_invoke;
  v10[3] = &unk_1E3675060;
  v8 = v6;
  v11 = v8;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", inqCollectionIdsByGroupIdForCollectionIdsStatement, v10);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");

  return v8;
}

- (sqlite3_stmt)_inqPrepareStatement:(const char *)a3
{
  int v5;
  int v6;
  const char *v7;
  const char *v8;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v5 = sqlite3_prepare_v2(self->_inqDatabase, a3, -1, &ppStmt, 0);
  if (v5)
  {
    v6 = v5;
    v7 = sqlite3_errmsg(self->_inqDatabase);
    if (!ppStmt)
    {
      v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v12 = a3;
        v13 = 2080;
        v14 = v8;
        v15 = 1024;
        v16 = v6;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to prepare \"%s\": %s (%d).", buf, 0x1Cu);
      }
    }
  }
  return ppStmt;
}

- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 allowError:(int)a4 withStatementBlock:(id)a5
{
  uint64_t (**v8)(id, sqlite3_stmt *);
  int v9;
  int v10;
  const char *v11;
  NSObject *v12;
  int v13;
  sqlite3_stmt *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (**)(id, sqlite3_stmt *))a5;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = (sqlite3_stmt *)CFSTR("Statement is nil");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }
  v9 = 100;
  while (v9 == 100)
  {
    v10 = sqlite3_step(a3);
    v9 = v10;
    if (v8 && v10 == 100 && (v8[2](v8, a3) & 1) == 0)
      goto LABEL_19;
  }
  if (v9 != 101 && (!a4 || (v9 & a4) != a4))
  {
    v11 = sqlite3_errmsg(self->_inqDatabase);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = 134218498;
      v14 = a3;
      v15 = 2080;
      v16 = v11;
      v17 = 1024;
      v18 = v9;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to execute \"%p\": %s (%d).", (uint8_t *)&v13, 0x1Cu);
    }
    if ((~v9 & 0xB) == 0)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 134218498;
        v14 = a3;
        v15 = 2080;
        v16 = v11;
        v17 = 1026;
        v18 = v9;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Database corruption detected during statement execution: \"%p\": %s (%{public}d).", (uint8_t *)&v13, 0x1Cu);
      }

    }
  }
LABEL_19:
  sqlite3_reset(a3);

}

- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 withCancelableStatementBlock:(id)a4
{
  -[PSIDatabase _inqExecutePreparedStatement:allowError:withStatementBlock:](self, "_inqExecutePreparedStatement:allowError:withStatementBlock:", a3, 0, a4);
}

- (void)_inqExecutePreparedStatement:(sqlite3_stmt *)a3 withStatementBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PSIDatabase__inqExecutePreparedStatement_withStatementBlock___block_invoke;
  v8[3] = &unk_1E3675510;
  v9 = v6;
  v7 = v6;
  -[PSIDatabase _inqExecutePreparedStatement:allowError:withStatementBlock:](self, "_inqExecutePreparedStatement:allowError:withStatementBlock:", a3, 0, v8);

}

- (void)_inqPrepareAndExecuteStatement:(const char *)a3
{
  sqlite3_stmt *v5;
  int i;
  const char *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:");
  for (i = 100; i == 100; i = sqlite3_step(v5))
    ;
  if (i != 101)
  {
    v7 = sqlite3_errmsg(self->_inqDatabase);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315650;
      v10 = a3;
      v11 = 2080;
      v12 = v7;
      v13 = 1024;
      v14 = i;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to execute \"%s\": %s (%d).", (uint8_t *)&v9, 0x1Cu);
    }
    if ((~i & 0xB) == 0)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315650;
        v10 = a3;
        v11 = 2080;
        v12 = v7;
        v13 = 1026;
        v14 = i;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Database corruption detected during statement execution: \"%s\": %s (%{public}d).", (uint8_t *)&v9, 0x1Cu);
      }

    }
  }
  if (v5 && sqlite3_finalize(v5) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to finalize statement");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_inqPerformBatch:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "BEGIN TRANSACTION");
  v4[2](v4);

  -[PSIDatabase _inqPrepareAndExecuteStatement:](self, "_inqPrepareAndExecuteStatement:", "END TRANSACTION");
}

- (void)_runWithMatchingIDs:(id)a3 block:(id)a4
{
  const __CFAllocator *v6;
  void (**v7)(_QWORD);
  id v8;
  CFMutableSetRef Mutable;
  __CFSet *v10;
  _QWORD v11[4];
  CFMutableSetRef v12;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = (void (**)(_QWORD))a4;
  v8 = a3;
  Mutable = CFSetCreateMutable(v6, 0, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__PSIDatabase__runWithMatchingIDs_block___block_invoke;
  v11[3] = &unk_1E3675308;
  v12 = Mutable;
  v10 = Mutable;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v11);

  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", v10);
  v7[2](v7);

  -[PSIIntArray unbind](self->_matchingIds, "unbind");
}

- (sqlite3)databaseConnection
{
  return self->_inqDatabase;
}

- (id)newSuggestionsQueryForQueryText:(id)a3 suggestionType:(unint64_t)a4 suggestionLimit:(unint64_t)a5 resultTypes:(unint64_t)a6 libraryScope:(unint64_t)a7
{
  id v12;
  PSIQuery *v13;

  v12 = a3;
  v13 = -[PSIQuery initWithQueryText:suggestionType:suggestionLimit:resultTypes:delegate:libraryScope:]([PSIQuery alloc], "initWithQueryText:suggestionType:suggestionLimit:resultTypes:delegate:libraryScope:", v12, a4, a5, a6, self, a7);

  return v13;
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke;
  v16[3] = &unk_1E3674F58;
  v16[4] = self;
  v17 = v10;
  v19 = v12;
  v20 = a4;
  v18 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[PSIDatabase _inqAsync:](self, "_inqAsync:", v16);

}

- (void)deleteEmbeddingsForModelTypes:(id)a3 assetUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((self->_options & 2) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = CFSTR("expect writable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke;
  v10[3] = &unk_1E3677530;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PSIDatabase _inqAsync:](self, "_inqAsync:", v10);

}

- (void)fetchEmbeddingsForModelTypes:(id)a3 assetUUID:(id)a4 withBatchHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  PSIQuery *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((self->_options & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = CFSTR("expect searchable");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
  }
  v11 = -[PSIQuery initWithEmbeddingModelTypes:assetUUID:delegate:]([PSIQuery alloc], "initWithEmbeddingModelTypes:assetUUID:delegate:", v8, v9, self);
  -[PSIQuery runFetchEmbeddingQueryWitBatchHandler:](v11, "runFetchEmbeddingQueryWitBatchHandler:", v10);

}

- (sqlite3_stmt)prepareEmbeddingStatement:(int64_t)a3 modelTypes:(id)a4 assetUUID:(id)a5
{
  id v8;
  id v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  sqlite3_stmt *v22;
  int v23;
  id v24;
  int v25;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint8_t buf[4];
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = CFSTR("SELECT type, assetUUID, vector");
  if (a3 != 1)
    v10 = 0;
  if (a3)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("DELETE");
  if (objc_msgSend(v8, "count"))
  {
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(" FROM embeddings WHERE type IN ("));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v12, "stringByAppendingString:", CFSTR("?, "));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v12 = v14;
      }
      while (objc_msgSend(v8, "count") > v13);
    }
    else
    {
      v14 = v12;
    }
    objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "stringByAppendingString:", CFSTR(")"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_17;
    objc_msgSend(v16, "stringByAppendingString:", CFSTR(" AND assetUUID = ?"));
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(" FROM embeddings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v9)
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(" WHERE assetUUID = ?"));
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v19 = (void *)v17;

    v16 = v19;
  }
LABEL_17:
  objc_msgSend(v16, "stringByAppendingString:", CFSTR(";"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_retainAutorelease(v20);
  v22 = -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(v21, "UTF8String"));
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__PSIDatabase_prepareEmbeddingStatement_modelTypes_assetUUID___block_invoke;
  v27[3] = &unk_1E3675018;
  v27[5] = &v28;
  v27[6] = v22;
  v27[4] = &v32;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v27);
  if (v9)
  {
    v23 = *((_DWORD *)v29 + 6);
    v24 = objc_retainAutorelease(v9);
    v25 = sqlite3_bind_text(v22, v23, (const char *)objc_msgSend(v24, "UTF8String"), objc_msgSend(v24, "length"), 0);
    *((_DWORD *)v33 + 6) = v25;
    if (v25)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = CFSTR("Failed to bind parameter");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
    }
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v22;
}

- (unint64_t)countOfAssets
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PSIDatabase_countOfAssets__block_invoke;
  v4[3] = &unk_1E3677C68;
  v4[4] = self;
  v4[5] = &v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)fetchAssetUUIDsForDateFilter:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__93030;
  v15 = __Block_byref_object_dispose__93031;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PSIDatabase_fetchAssetUUIDsForDateFilter___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (__CFArray)assetIdsWithDateFilter:(id)a3
{
  id v4;
  id v5;
  const void *v6;
  __CFArray *v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PSIDatabase_assetIdsWithDateFilter___block_invoke;
  v9[3] = &unk_1E3676EA0;
  v11 = &v12;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v9);
  v6 = (const void *)v13[3];
  if (v6)
    v7 = (__CFArray *)CFAutorelease(v6);
  else
    v7 = 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_inqAssetUUIDsForGroupID:(unint64_t)a3
{
  __CFArray *v4;
  void *v5;

  v4 = -[PSIDatabase _inqNewAssetIdsForGroupId:dateFilter:](self, "_inqNewAssetIdsForGroupId:dateFilter:", a3, 0);
  -[PSIDatabase _inqAssetUUIDsForAssetIds:range:creationDateSorted:](self, "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", v4, 0, CFArrayGetCount(v4), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v4);
  return v5;
}

- (id)_inqCollectionUUIDsForGroupID:(unint64_t)a3
{
  __CFArray *v4;
  void *v5;

  v4 = -[PSIDatabase _inqNewCollectionIdsForGroupId:dateFilter:](self, "_inqNewCollectionIdsForGroupId:dateFilter:", a3, 0);
  -[PSIDatabase _inqCollectionUUIDsForCollectionIds:range:](self, "_inqCollectionUUIDsForCollectionIds:range:", v4, 0, CFArrayGetCount(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v4);
  return v5;
}

- (void)assetIdsFromUUIDs:(id)a3 completion:(id)a4
{
  -[PSIDatabase _sortedSearchIndexRowIdsFromUUIDs:searchResultType:completion:](self, "_sortedSearchIndexRowIdsFromUUIDs:searchResultType:completion:", a3, 1, a4);
}

- (void)collectionIdsFromUUIDs:(id)a3 completion:(id)a4
{
  -[PSIDatabase _sortedSearchIndexRowIdsFromUUIDs:searchResultType:completion:](self, "_sortedSearchIndexRowIdsFromUUIDs:searchResultType:completion:", a3, 2, a4);
}

- (__CFArray)mostRecentSortedAssetIdsWithLimit:(unint64_t)a3
{
  CFMutableArrayRef Mutable;
  __CFArray *v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v6 = Mutable;
  if (a3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke;
    v8[3] = &unk_1E3675558;
    v8[6] = a3;
    v8[7] = Mutable;
    v8[4] = self;
    v8[5] = &v9;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
    v6 = (__CFArray *)v10[3];
    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

- (__CFSet)groupIdsWithCategories:(id)a3
{
  id v4;
  id v5;
  __CFSet *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PSIDatabase_groupIdsWithCategories___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = (__CFSet *)CFAutorelease((CFTypeRef)v12[3]);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)groupsForSearchIndexCategories:(id)a3 searchResultTypes:(unint64_t)a4 dateFilter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__93030;
  v23 = __Block_byref_object_dispose__93031;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PSIDatabase_groupsForSearchIndexCategories_searchResultTypes_dateFilter___block_invoke;
  v14[3] = &unk_1E3675D28;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v17 = &v19;
  v11 = v9;
  v16 = v11;
  v18 = a4;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)groupForText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 resultTypes:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  PSIDatabase *v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "length"))
  {
    if (!a5)
    {
      v12 = 0;
      goto LABEL_7;
    }
LABEL_6:
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__93030;
    v26 = __Block_byref_object_dispose__93031;
    v27 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__PSIDatabase_groupForText_identifier_category_resultTypes___block_invoke;
    v15[3] = &unk_1E3676150;
    v16 = v11;
    v17 = v10;
    v18 = self;
    v19 = &v22;
    v20 = a5;
    v21 = a6;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v15);
    v12 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    goto LABEL_7;
  }
  v13 = objc_msgSend(v11, "length");
  v12 = 0;
  if (a5 && v13)
    goto LABEL_6;
LABEL_7:

  return v12;
}

- (void)_clearInitialSuggestions
{
  void *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PSIDatabase pathManager](self, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v3 = +[PLInitialSuggestionsStorageManager deleteInitialSuggestionsForPathManager:error:](PLInitialSuggestionsStorageManager, "deleteInitialSuggestionsForPathManager:error:", v2, &v10);
  v4 = v10;

  PLSearchBackendPSIDatabaseGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      v7 = "Successfully deleted initial suggestions following index drop: %@";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    v7 = "Failed to delete initial suggestions following index drop: %@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

- (NSString)path
{
  return self->_path;
}

- (int64_t)options
{
  return self->_options;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_tokenizerOutputNormalizedTokens, 0);
  objc_storeStrong((id *)&self->_tokenizerOutputTokens, 0);
  objc_storeStrong((id *)&self->_tokenizerOutputString, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_inqSearchMetadata, 0);
  objc_storeStrong((id *)&self->_inqSearchMetadataStore, 0);
  objc_storeStrong((id *)&self->_groupResultsQueue, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_inqIdsOfAllGroupsInPrefixStatement, 0);
  objc_storeStrong((id *)&self->_inqIdsOfAllGroupsStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfCollectionsMatchingGroupWithIdStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfAssetsByGroupIdMatchingGroupsWithIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqNumberOfAssetsMatchingGroupWithIdStatement, 0);
  objc_storeStrong((id *)&self->_inqCollectionIdsByGroupIdForCollectionIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqAssetIdsByGroupIdForAssetIdsStatement, 0);
  objc_storeStrong((id *)&self->_collectionResultByCollectionIdWithCollectionIdsStatement, 0);
  objc_storeStrong((id *)&self->_assetUUIDByAssetIdWithAssetIdsStatement, 0);
  objc_storeStrong((id *)&self->_inqWordEmbeddingTable, 0);
  objc_storeStrong((id *)&self->_matchingIds, 0);
}

void __60__PSIDatabase_groupForText_identifier_category_resultTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int16 v4;
  uint64_t v5;
  const void *v6;
  __CFSet *Mutable;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "length");
    v3 = *(void **)(a1 + 48);
    v4 = *(_WORD *)(a1 + 64);
    if (v2)
      v5 = objc_msgSend(v3, "_inqGroupIdForCategory:contentString:identifier:outOwningGroupId:outScore:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
    else
      v5 = objc_msgSend(v3, "_inqGroupIdForCategory:identifier:outOwningGroupId:outScore:", v4, *(_QWORD *)(a1 + 32), 0, 0);
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 48), "_inqGroupIdForCategory:contentString:", *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  }
  v6 = (const void *)v5;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  CFSetAddValue(Mutable, v6);
  objc_msgSend(*(id *)(a1 + 48), "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", Mutable, 0, 1, *(_QWORD *)(a1 + 72), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  CFRelease(Mutable);
}

void __75__PSIDatabase_groupsForSearchIndexCategories_searchResultTypes_dateFilter___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_inqNewGroupIdsWithCategories:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", v2, *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 64), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  CFRelease(v2);
}

uint64_t __38__PSIDatabase_groupIdsWithCategories___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqNewGroupIdsWithCategories:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke(uint64_t a1)
{
  sqlite3_stmt *Value;
  void *v3;
  const __CFArray *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const __CFString *v7;
  uint64_t v8;
  CFRange v9;

  v8 = *MEMORY[0x1E0C80C00];
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("selectAssetIdsDateSortedDescWithLimit"));
  if (sqlite3_bind_int64(Value, 1, *(_QWORD *)(a1 + 48)) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v7 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke_491;
  v5[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v5[4] = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "_inqExecutePreparedStatement:withStatementBlock:", Value, v5);
  v4 = *(const __CFArray **)(a1 + 56);
  v9.length = CFArrayGetCount(v4);
  v9.location = 0;
  CFArraySortValues(v4, v9, (CFComparatorFunction)PSIRowIDCompare_93036, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayCreateCopy(0, *(CFArrayRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __49__PSIDatabase_mostRecentSortedAssetIdsWithLimit___block_invoke_491(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
}

uint64_t __38__PSIDatabase_assetIdsWithDateFilter___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqNewAssetIdsWithDateFilter:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __44__PSIDatabase_fetchAssetUUIDsForDateFilter___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  __CFSet *Mutable;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (const __CFArray *)objc_msgSend(*(id *)(a1 + 32), "_inqNewAssetIdsWithDateFilter:", *(_QWORD *)(a1 + 40));
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  Count = CFArrayGetCount(v2);
  if (Count)
  {
    v5 = Count;
    for (i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
      CFSetAddValue(Mutable, ValueAtIndex);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDsForAssetIds:", Mutable);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  CFRelease(v2);
  CFRelease(Mutable);
}

void __28__PSIDatabase_countOfAssets__block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "SELECT COUNT(rowid) FROM assets");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PSIDatabase_countOfAssets__block_invoke_2;
  v4[3] = &unk_1E3674FF0;
  v3 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "_inqExecutePreparedStatement:withStatementBlock:", v2, v4);
  if (sqlite3_finalize(v2))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = CFSTR("Failed to finalize statement");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
  }
}

uint64_t __28__PSIDatabase_countOfAssets__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;

  result = sqlite3_column_int(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (int)result;
  return result;
}

void __62__PSIDatabase_prepareEmbeddingStatement_modelTypes_assetUUID___block_invoke(uint64_t a1, int a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke_2;
  v3[3] = &unk_1E3677530;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_inqPerformBatch:", v3);

}

void __55__PSIDatabase_deleteEmbeddingsForModelTypes_assetUUID___block_invoke_2(uint64_t a1)
{
  sqlite3_stmt *v2;
  int v3;
  int v4;
  const char *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "prepareEmbeddingStatement:modelTypes:assetUUID:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = sqlite3_step(v2);
  if (v3 != 101)
  {
    v4 = v3;
    v5 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 8));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = 134218498;
      v8 = (const __CFString *)v2;
      v9 = 2080;
      v10 = v5;
      v11 = 1024;
      v12 = v4;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to execute \"%p\": %s (%d).", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if (sqlite3_finalize(v2) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = CFSTR("Failed to finalize statement");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v7, 0xCu);
  }
  PLSearchBackendPSIDatabaseGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Embeddings cleared successfully", (uint8_t *)&v7, 2u);
  }

}

void __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke_2;
  v11[3] = &unk_1E3674F30;
  v2 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  v13 = v3;
  v15 = v4;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v12, "_inqPerformBatch:", v11);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v5, v6, v7, v8, v9);

}

void __63__PSIDatabase_insertEmbeddings_modelType_assetUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  sqlite3_stmt *v2;
  __int128 v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  int v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  int v18;
  int v19;
  NSObject *v20;
  int v21;
  int v22;
  const char *v23;
  NSObject *v24;
  __int128 v25;
  id obj;
  uint64_t v27;
  sqlite3_stmt *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "INSERT INTO embeddings(type, assetUUID, vector) VALUES (?, ?, ?);");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(v1 + 40);
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v35;
    *(_QWORD *)&v3 = 134218498;
    v25 = v3;
    v28 = v2;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        v5 = v1;
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v7 = 8 * objc_msgSend(v6, "count", v25);
        v8 = (char *)malloc_type_malloc(v7, 0x42B9AC5AuLL);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v31;
          do
          {
            v14 = 0;
            v15 = v12;
            v16 = &v8[8 * v12];
            do
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v14), "doubleValue");
              *(_QWORD *)&v16[8 * v14++] = v17;
            }
            while (v11 != v14);
            v12 = v15 + v14;
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          }
          while (v11);
        }

        v1 = v5;
        v18 = *(_DWORD *)(v5 + 56);
        v2 = v28;
        v19 = sqlite3_bind_int(v28, 1, v18);
        v20 = MEMORY[0x1E0C81028];
        if (v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_text(v28, 2, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(v1 + 48)), "UTF8String"), objc_msgSend(*(id *)(v1 + 48), "length"), 0)&& os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        if (sqlite3_bind_blob(v28, 3, v8, v7, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8])
          && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = CFSTR("Failed to bind parameter");
          _os_log_error_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
        v21 = sqlite3_step(v28);
        if (v21 != 101)
        {
          v22 = v21;
          v23 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)(v1 + 32) + 8));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v39 = (const __CFString *)v28;
            v40 = 2080;
            v41 = v23;
            v42 = 1024;
            v43 = v22;
            _os_log_error_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to execute \"%p\": %s (%d).", buf, 0x1Cu);
          }
        }
        if (sqlite3_reset(v28) && os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = CFSTR("Failed to reset statement");
          _os_log_error_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
        }
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v29);
  }

  if (sqlite3_finalize(v2) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v39 = CFSTR("Failed to finalize statement");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  PLSearchBackendPSIDatabaseGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "Embeddings inserted successfully", buf, 2u);
  }

}

uint64_t __41__PSIDatabase__runWithMatchingIDs_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __63__PSIDatabase__inqExecutePreparedStatement_withStatementBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

void __58__PSIDatabase__inqCollectionIdsByGroupIdForCollectionIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *Mutable;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "int64AtColumn:", 0);
  v4 = objc_msgSend(v7, "int64AtColumn:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", Mutable, v5);
  }
  objc_msgSend(Mutable, "addObject:", v4);

}

void __47__PSIDatabase__inqNewGroupIdsForCollectionIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __46__PSIDatabase__inqNewGroupIdsForCollectionId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __48__PSIDatabase__inqAssetIdsByGroupIdForAssetIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *Mutable;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "int64AtColumn:", 0);
  v4 = objc_msgSend(v7, "int64AtColumn:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", Mutable, v5);
  }
  objc_msgSend(Mutable, "addObject:", v4);

}

void __42__PSIDatabase__inqNewGroupIdsForAssetIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __41__PSIDatabase__inqNewGroupIdsForAssetId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __57__PSIDatabase__inqNewCollectionIdsForGroupId_dateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
}

void __50__PSIDatabase__inqNewCollectionIdsWithDateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
}

void __52__PSIDatabase__inqNewAssetIdsForGroupId_dateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
}

void __45__PSIDatabase__inqNewAssetIdsWithDateFilter___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
}

void __62__PSIDatabase__inqNewSynonymTextsByOwningGroupIdWithGroupIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  __int16 v4;
  sqlite3_int64 v5;
  void *v6;
  void *v7;
  id v8;

  v4 = sqlite3_column_int(a2, 0);
  if (PLSearchIndexCategoryIsSynonym(v4))
  {
    v5 = sqlite3_column_int64(a2, 1);
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", sqlite3_column_text(a2, 2), 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __124__PSIDatabase__inqNonFilenameGroupsWithMatchingGroupIds_dateFilter_includeObjects_searchResultTypes_matchingPredicateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupWithStatement:dateFilter:includeObjects:searchResultTypes:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v3), v3 = v6, v5))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    v3 = v6;
  }

}

void __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CFArrayRef v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setAssetIds:", a3);
  v5 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  objc_msgSend(v7, "setCollectionIds:", v5);
  CFRelease(v5);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6 || (*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v7))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __106__PSIDatabase__inqFilenameGroupsWithMatchingGroupIds_dateFilter_searchResultTypes_matchingPredicateBlock___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  const void *v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupWithFilenameStatement:dateFilter:excludingGroupId:searchResultTypes:", a2, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "groupId"), *(_QWORD *)(a1 + 72));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_QWORD *)(v4 + 40))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v4 + 40), obj);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  }
  v5 = (const void *)sqlite3_column_int64(a2, 5);
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v5);

}

void __73__PSIDatabase__inqGroupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupWithStatement:dateFilter:includeObjects:searchResultTypes:", a2, *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __185__PSIDatabase__inqGroupIdForCategory_owningGroupId_contentString_normalizedString_identifier_rankingScore_insertIfNeeded_tokenOutput_shouldUpdateOwningGroupId_shouldUpdateRankingScore___block_invoke(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3)
{
  NSObject *v6;
  sqlite3_stmt *Value;
  int v9;
  const __CFString *v10;
  __int16 v11;
  sqlite3_int64 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLSearchBackendPSIDatabaseGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134218240;
    v10 = (const __CFString *)a2;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Setting owning group id for group id: %llu, owningGroupID: %llu", (uint8_t *)&v9, 0x16u);
  }

  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("updateGroupOwningGroupId"));
  if (sqlite3_bind_int64(Value, 1, a3) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, a2) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v9, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
}

void __75__PSIDatabase__inqGroupIdForCategory_identifier_outOwningGroupId_outScore___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = sqlite3_column_double(a2, 2);
}

void __92__PSIDatabase__inqGroupIdForCategory_normalizedString_identifier_outOwningGroupId_outScore___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = sqlite3_column_double(a2, 2);
}

void __89__PSIDatabase__inqGroupIdForCategory_contentString_identifier_outOwningGroupId_outScore___block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = sqlite3_column_double(a2, 2);
}

sqlite3_int64 __52__PSIDatabase__inqGroupIdForCategory_contentString___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

sqlite3_int64 __53__PSIDatabase__inqCollectionIdForUUID_uuid_0_uuid_1___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

sqlite3_int64 __48__PSIDatabase__inqAssetIdForUUID_uuid_0_uuid_1___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __65__PSIDatabase__inqDeleteGroupsWithGraphCollectionsForPersonUUID___block_invoke_460(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[7];

  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PSIDatabase.m"), 3257, CFSTR("Group not supported by %s"), "-[PSIDatabase _inqRemoveUUID:categories:objectType:isInBatch:]_block_invoke");

      return;
    case 1:
      v3 = objc_msgSend(*(id *)(a1 + 32), "_inqCollectionIdForUUID:", *(_QWORD *)(a1 + 40));
      if (!v3)
        return;
      goto LABEL_8;
    case 0:
      v3 = objc_msgSend(*(id *)(a1 + 32), "_inqAssetIdForUUID:", *(_QWORD *)(a1 + 40));
      if (v3)
      {
LABEL_8:
        v4 = *(void **)(a1 + 32);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke_2;
        v8[3] = &unk_1E3677C90;
        v5 = *(_QWORD *)(a1 + 48);
        v6 = *(_QWORD *)(a1 + 56);
        v8[4] = v4;
        v8[5] = v6;
        v8[6] = v3;
        objc_msgSend(v4, "_runWithMatchingIDs:block:", v5, v8);
      }
      break;
  }
}

uint64_t __62__PSIDatabase__inqRemoveUUID_categories_objectType_isInBatch___block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  sqlite3_stmt *Value;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
    v2 = CFSTR("deleteGCForSelectedGroupsCategories");
  else
    v2 = CFSTR("deleteGAForSelectedGroupsCategories");
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), v2);
  if (sqlite3_bind_int64(Value, 1, *(_QWORD *)(a1 + 48)) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
}

void __51__PSIDatabase__inqRemoveUUID_objectType_isInBatch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  sqlite3_int64 v4;
  const __CFString *v5;
  sqlite3_stmt *Value;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  sqlite3_stmt *v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  sqlite3_int64 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PSIDatabase.m"), 3199, CFSTR("Group not supported by %s"), "-[PSIDatabase _inqRemoveUUID:objectType:isInBatch:]_block_invoke");

    return;
  }
  if (v2 == 1)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_inqCollectionIdForUUID:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v2)
      return;
    v3 = objc_msgSend(*(id *)(a1 + 32), "_inqAssetIdForUUID:", *(_QWORD *)(a1 + 40));
  }
  v4 = v3;
  if (v3)
  {
    if (*(_QWORD *)(a1 + 48))
      v5 = CFSTR("deleteCollection");
    else
      v5 = CFSTR("deleteAsset");
    Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), v5);
    if (sqlite3_bind_int64(Value, 1, v4) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
    PLSearchBackendPSIDatabaseGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (*(_QWORD *)(a1 + 48))
        v8 = CFSTR("collection");
      else
        v8 = CFSTR("asset");
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2050;
      v17 = v4;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Deleted %{public}@ with id: %{public}lld", buf, 0x16u);
    }

    if (*(_QWORD *)(a1 + 48))
      v9 = CFSTR("deleteGC");
    else
      v9 = CFSTR("deleteGA");
    v10 = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), v9);
    if (sqlite3_bind_int64(v10, 1, v4) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_inqExecutePreparedStatement:withStatementBlock:", v10, 0);
    PLSearchBackendPSIDatabaseGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (*(_QWORD *)(a1 + 48))
        v12 = CFSTR("collection from GC");
      else
        v12 = CFSTR("asset from GA");
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2050;
      v17 = v4;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Deleted %{public}@ table: %{public}lld", buf, 0x16u);
    }

  }
}

uint64_t __35__PSIDatabase_assetExistsWithUUID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqAssetIdForUUID:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

void __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke(uint64_t a1)
{
  int v2;
  const __CFDictionary *v3;
  const __CFString *v4;
  const void *Value;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
    v4 = CFSTR("kSelectAssetIds");
  else
    v4 = CFSTR("kSelectCollectionIds");
  Value = CFDictionaryGetValue(v3, v4);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke_2;
  v10[3] = &unk_1E36753A8;
  v13 = v19;
  v14 = v18;
  v15 = v17;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = v7;
  v16 = v8;
  v12 = v9;
  objc_msgSend(v6, "_inqExecutePreparedStatement:withStatementBlock:", Value, v10);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);
}

void __77__PSIDatabase__sortedSearchIndexRowIdsFromUUIDs_searchResultType_completion___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = sqlite3_column_int64(a2, 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = sqlite3_column_int64(a2, 2);
  v4 = (void *)PLStringNewFromUUIDComponents(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  if (v4)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v8 = v4;
      v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
      v4 = v8;
      if (v5)
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 72), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v6 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

        v4 = v8;
      }
    }
  }

}

void __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;
  sqlite3_stmt *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[7];
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT lookup_identifier from groups WHERE category IN (?"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
    {
      v3 = 1;
      do
      {
        objc_msgSend(v2, "appendString:", CFSTR(", ?"));
        ++v3;
      }
      while (v3 < objc_msgSend(*(id *)(a1 + 32), "count"));
    }
    objc_msgSend(v2, "appendString:", CFSTR(")"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT lookup_identifier from groups"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(void **)(a1 + 40);
  v5 = objc_retainAutorelease(v2);
  v6 = (sqlite3_stmt *)objc_msgSend(v4, "_inqPrepareStatement:", objc_msgSend(v5, "UTF8String"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v7 = *(void **)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_2;
  v13[3] = &unk_1E3675018;
  v13[5] = v14;
  v13[6] = v6;
  v13[4] = &v16;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_421;
  v11[3] = &unk_1E3674FA8;
  v9 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "_inqExecutePreparedStatement:withStatementBlock:", v6, v11);
  v10 = sqlite3_finalize(v6);
  *((_DWORD *)v17 + 6) = v10;
  if (v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = CFSTR("Failed to finalize statement");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

}

void __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_2(uint64_t a1, int a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __52__PSIDatabase_dumpLookupStringsWithIndexCategories___block_invoke_421(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_text(a2, 0));
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke(uint64_t a1)
{
  sqlite3_stmt *v2;
  void *v3;
  uint64_t v4;
  CFMutableSetRef Mutable;
  sqlite3_stmt *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t i;
  void *v13;
  id v14;
  sqlite3_stmt *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unint64_t j;
  void *v23;
  id v24;
  sqlite3_stmt *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  char v29;
  _QWORD v30[7];
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  char v37;
  _QWORD v38[7];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v2 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "SELECT rowid FROM assets WHERE uuid_0 = ? AND uuid_1 = ?");
  sqlite3_bind_int64(v2, 1, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(v2, 2, *(_QWORD *)(a1 + 64));
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2;
  v50[3] = &unk_1E3674FF0;
  v50[4] = &v51;
  objc_msgSend(v3, "_inqExecutePreparedStatement:withStatementBlock:", v2, v50);
  sqlite3_finalize(v2);
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v6 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "SELECT groupid FROM ga WHERE assetid = ?");
  sqlite3_bind_int64(v6, 1, v52[3]);
  v7 = *(void **)(a1 + 32);
  v49[0] = v4;
  v49[1] = 3221225472;
  v49[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3;
  v49[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v49[4] = Mutable;
  objc_msgSend(v7, "_inqExecutePreparedStatement:withStatementBlock:", v6, v49);
  sqlite3_finalize(v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "bindElements:", Mutable);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v9 = *(void **)(a1 + 40);
  v47[0] = v4;
  v47[1] = 3221225472;
  v47[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_4;
  v47[3] = &unk_1E3675308;
  v10 = v8;
  v48 = v10;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v47);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT normalized_string, lookup_identifier, category, rowid, score from groups WHERE rowid IN matchingIds AND category IN (?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i < objc_msgSend(v10, "count"); ++i)
      objc_msgSend(v11, "appendString:", CFSTR(", ?"));
    objc_msgSend(v11, "appendString:", CFSTR(")"));
    v13 = *(void **)(a1 + 32);
    v14 = objc_retainAutorelease(v11);
    v15 = (sqlite3_stmt *)objc_msgSend(v13, "_inqPrepareStatement:", objc_msgSend(v14, "UTF8String"));
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    v38[0] = v4;
    v38[1] = 3221225472;
    v38[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_5;
    v38[3] = &unk_1E3675018;
    v38[5] = &v39;
    v38[6] = v15;
    v38[4] = &v43;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v38);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);

  }
  else
  {
    v15 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatement:", "SELECT normalized_string, lookup_identifier, category, rowid, score FROM groups WHERE rowid IN matchingIds");
  }
  v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v17 = *(void **)(a1 + 32);
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_411;
  v34[3] = &unk_1E3675330;
  v34[4] = v17;
  v37 = *(_BYTE *)(a1 + 72);
  v35 = *(id *)(a1 + 48);
  v18 = v16;
  v36 = v18;
  objc_msgSend(v17, "_inqExecutePreparedStatement:withStatementBlock:", v15, v34);
  sqlite3_finalize(v15);
  v19 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2_412;
  v31[3] = &unk_1E3675358;
  v32 = *(id *)(a1 + 40);
  v20 = v19;
  v33 = v20;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v31);
  if (objc_msgSend(v20, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT normalized_string, lookup_identifier, category, rowid, score from groups WHERE owning_groupid IN matchingIds AND category IN (?"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 1; j < objc_msgSend(v20, "count"); ++j)
      objc_msgSend(v21, "appendString:", CFSTR(", ?"));
    objc_msgSend(v21, "appendString:", CFSTR(")"));
    v23 = *(void **)(a1 + 32);
    v24 = objc_retainAutorelease(v21);
    v25 = (sqlite3_stmt *)objc_msgSend(v23, "_inqPrepareStatement:", objc_msgSend(v24, "UTF8String"));
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    v30[0] = v4;
    v30[1] = 3221225472;
    v30[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3_415;
    v30[3] = &unk_1E3675018;
    v30[5] = &v39;
    v30[6] = v25;
    v30[4] = &v43;
    objc_msgSend(v20, "enumerateIndexesUsingBlock:", v30);
    v26 = *(void **)(a1 + 32);
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_416;
    v27[3] = &unk_1E36752B8;
    v27[4] = v26;
    v29 = *(_BYTE *)(a1 + 72);
    v28 = *(id *)(a1 + 48);
    objc_msgSend(v26, "_inqExecutePreparedStatement:withStatementBlock:", v25, v27);
    sqlite3_finalize(v25);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);

  }
  CFRelease(Mutable);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unbind");

  _Block_object_dispose(&v51, 8);
}

sqlite3_int64 __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

uint64_t __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PLSearchIndexCategoryIsSynonym(a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", PLSearchIndexParentCategoryForCategory(a2));
  return result;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_5(uint64_t a1, int a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_411(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  __int16 v6;
  sqlite3_int64 v7;
  id v8;

  v4 = sqlite3_column_text(a2, 0);
  v5 = sqlite3_column_text(a2, 1);
  v6 = sqlite3_column_int(a2, 2);
  v7 = sqlite3_column_int64(a2, 3);
  objc_msgSend(*(id *)(a1 + 32), "_inqGenerateGroupsInfoDictionaryFromText:identifier:category:score:groupId:includeUUIDs:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 56), sqlite3_column_double(a2, 4));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", v6);

}

uint64_t __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_2_412(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = PLSearchIndexSynonymCategoryForCategory(a2);
  if (result)
  {
    v4 = result;
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      return objc_msgSend(*(id *)(a1 + 40), "addIndex:", v4);
    result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v4);
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 40), "addIndex:", v4);
  }
  return result;
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_3_415(uint64_t a1, int a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __71__PSIDatabase_dumpGroupsInfoForAssetUUID_indexCategories_includeUUIDs___block_invoke_416(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  __int16 v6;
  sqlite3_int64 v7;
  id v8;

  v4 = sqlite3_column_text(a2, 0);
  v5 = sqlite3_column_text(a2, 1);
  v6 = sqlite3_column_int(a2, 2);
  v7 = sqlite3_column_int64(a2, 3);
  objc_msgSend(*(id *)(a1 + 32), "_inqGenerateGroupsInfoDictionaryFromText:identifier:category:score:groupId:includeUUIDs:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 48), sqlite3_column_double(a2, 4));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  sqlite3_stmt *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;
  _QWORD v14[7];
  _QWORD v15[3];
  int v16;
  __int128 buf;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT normalized_string, lookup_identifier, category, rowid, score from groups WHERE category IN (?"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
    {
      v4 = 1;
      do
      {
        objc_msgSend(v3, "appendString:", CFSTR(", ?"));
        ++v4;
      }
      while (v4 < objc_msgSend(*(id *)(a1 + 32), "count"));
    }
    objc_msgSend(v3, "appendString:", CFSTR(")"));
    v5 = *(void **)(a1 + 40);
    v6 = objc_retainAutorelease(v3);
    v7 = (sqlite3_stmt *)objc_msgSend(v5, "_inqPrepareStatement:", objc_msgSend(v6, "UTF8String"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2020000000;
    v19 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v16 = 1;
    v8 = *(void **)(a1 + 32);
    v14[0] = v2;
    v14[1] = 3221225472;
    v14[2] = __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_2;
    v14[3] = &unk_1E3675018;
    v14[5] = v15;
    v14[6] = v7;
    v14[4] = &buf;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v14);
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v7 = (sqlite3_stmt *)objc_msgSend(*(id *)(a1 + 40), "_inqPrepareStatement:", "SELECT normalized_string, lookup_identifier, category, rowid, score from groups");
  }
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_407;
  v10[3] = &unk_1E36752B8;
  v9 = *(void **)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v13 = *(_BYTE *)(a1 + 56);
  v12 = v9;
  objc_msgSend(v11, "_inqExecutePreparedStatement:withStatementBlock:", v7, v10);
  if (sqlite3_finalize(v7) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to finalize statement");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }

}

void __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_2(uint64_t a1, int a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __62__PSIDatabase_dumpGroupsInfoWithIndexCategories_includeUUIDs___block_invoke_407(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v4;
  const unsigned __int8 *v5;
  __int16 v6;
  sqlite3_int64 v7;
  id v8;

  v4 = sqlite3_column_text(a2, 0);
  v5 = sqlite3_column_text(a2, 1);
  v6 = sqlite3_column_int(a2, 2);
  v7 = sqlite3_column_int64(a2, 3);
  objc_msgSend(*(id *)(a1 + 32), "_inqGenerateGroupsInfoDictionaryFromText:identifier:category:score:groupId:includeUUIDs:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 48), sqlite3_column_double(a2, 4));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __69__PSIDatabase__inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64AtColumn:", 0);
  v5 = objc_msgSend(v3, "int64AtColumn:", 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

uint64_t __58__PSIDatabase__inqNumberOfCollectionsMatchingGroupWithId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64AtColumn:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __64__PSIDatabase__inqNumberOfAssetsByGroupIdMatchingGroupsWithIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64AtColumn:", 0);
  v5 = objc_msgSend(v3, "int64AtColumn:", 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

uint64_t __53__PSIDatabase__inqNumberOfAssetsMatchingGroupWithId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64AtColumn:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  int v13;
  char v14;
  char v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "objectForKeyedSubscript:", CFSTR("BlacklistedMeaningsByMeaning"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = *(id *)(a1 + 40);
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v46;
    v5 = 14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v36 = v7;
        v37 = v6;
        objc_msgSend(v7, "groups");
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v8)
        {
          v9 = v8;
          v40 = *(_QWORD *)v42;
          v10 = 1;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v42 != v40)
                objc_enumerationMutation(v39);
              v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v12, "groupId"));
              v13 = objc_msgSend(v12, "category");
              v14 = PLSearchIndexGraphOnlyCategoriesContainsCategory(v13);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) |= v13 == 1102;
              if ((v13 & 0xFFFFFFFE) == 0x578)
              {

                goto LABEL_43;
              }
              v15 = v14;
              if (v5 > v13 && (unint64_t)(v13 - 1) < 0xE)
                v5 = v13;
              if ((v13 & 0xFFFFFFFE) == 0x640)
              {
                objc_msgSend(v12, "contentString");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectForKeyedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v18);

              }
              v19 = objc_msgSend(v12, "owningGroupId");
              if (v19)
              {
                v20 = v19;
                do
                {
                  if ((objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v20) & 1) != 0)
                    break;
                  v21 = *(void **)(a1 + 32);
                  objc_msgSend(v12, "dateFilter");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "_inqGroupWithMatchingGroupId:dateFilter:searchResultTypes:", v20, v22, 3);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  v20 = objc_msgSend(v23, "owningGroupId");
                }
                while (v20);
              }
              v10 &= v15;
            }
            v9 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v9)
              continue;
            break;
          }
        }
        else
        {
          v10 = 1;
        }

        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
        if (!v5 || v5 > *(_QWORD *)(v24 + 24))
          *(_QWORD *)(v24 + 24) = v5;
        v25 = objc_msgSend(v36, "assetMatchCount");
        v26 = objc_msgSend(v36, "collectionMatchCount");
        v27 = v26;
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
        v29 = *(_QWORD *)(v28 + 24);
        if (v29 <= v25)
          v29 = v25;
        *(_QWORD *)(v28 + 24) = v29;
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
        v31 = *(_QWORD *)(v30 + 24);
        if (v31 <= v26 + v25)
          v31 = v26 + v25;
        *(_QWORD *)(v30 + 24) = v31;
        objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", objc_msgSend(v36, "assetIds"));
        if (v27)
          v32 = v10;
        else
          v32 = 0;
        if ((v32 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", objc_msgSend(v36, "assetIds"));
        objc_msgSend(*(id *)(a1 + 80), "addObjectsFromArray:", objc_msgSend(v36, "collectionIds"));
LABEL_43:
        v6 = v37 + 1;
      }
      while (v37 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v35);
  }

}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_368(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  CFAbsoluteTime v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  CFAbsoluteTime v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  CFAbsoluteTime v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 104))
  {
    *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
    v3 = *(id *)(a1 + 32);
    v4 = v3;
    if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForAssetIds", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_inqAssetIdsByGroupIdForAssetIds:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "keyEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "unsignedIntegerValue"));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v10);
    }

    v13 = *(id *)(a1 + 32);
    v14 = v13;
    if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v2, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForAssetIds", ", buf, 2u);
    }

    PLSearchBackendPSIDatabaseGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134349056;
      v45 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Next Keyword GroupIds for AssetIds. Took %{public}f seconds.", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 112))
  {
    *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    v17 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
    v18 = *(id *)(a1 + 32);
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForCollectionIds", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_inqCollectionIdsByGroupIdForCollectionIds:", *(_QWORD *)(a1 + 64));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "keyEnumerator", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "unsignedIntegerValue"));
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v25);
    }

    v28 = *(id *)(a1 + 32);
    v29 = v28;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v17, "SearchDatabase - processNextKeywordSuggestions - nextKeywordGroupIdsForCollectionIds", ", buf, 2u);
    }

    PLSearchBackendPSIDatabaseGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134349056;
      v45 = v31;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_INFO, "Next Keyword GroupIds for CollectionIds. Took %{public}f seconds.", buf, 0xCu);
    }

  }
  v32 = objc_msgSend(*(id *)(a1 + 40), "_inqNewSynonymTextsByOwningGroupIdWithGroupIds:", *(_QWORD *)(a1 + 56));
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v32;

}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_369(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CFMutableSetRef MutableCopy;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  MutableCopy = CFSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], objc_msgSend(v5, "count"), (CFSetRef)v5);
  -[__CFSet intersectSet:](MutableCopy, "intersectSet:", *(_QWORD *)(a1 + 32));
  if (-[__CFSet count](MutableCopy, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MutableCopy, v9);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      objc_msgSend(*(id *)(a1 + 48), "removeObject:", objc_msgSend(v9, "unsignedIntegerValue"));
  }

}

id __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3;
  v6[3] = &unk_1E3675100;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_372(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", *(_QWORD *)(a1 + 40), 0, 0, 3, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_inqNumberOfAssetsByGroupIdMatchingGroupsWithIds:", *(_QWORD *)(a1 + 48));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_inqNumberOfCollectionsByGroupIdMatchingGroupsWithIds:", *(_QWORD *)(a1 + 48));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

double __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_378(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, double result, double a6)
{
  double v6;
  double v7;
  uint64_t v8;

  if (a2 && a3)
  {
    v6 = (double)a4;
    if ((double)a4 <= result)
      v7 = v6 / result;
    else
      v7 = 1.0 - (v6 - result) / ((double)a3 - result);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(double *)(v8 + 24) + v7 * a6;
    *(double *)(v8 + 24) = result;
  }
  return result;
}

id __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_384(uint64_t a1, void *a2)
{
  void *v3;
  void *Mutable;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a2, "groupId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(Mutable, "unionSet:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(Mutable, "unionSet:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", Mutable, v3);
  }

  return Mutable;
}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_387(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v17;
  _BOOL4 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  void *v24;
  unint64_t v25;
  _BOOL4 v27;
  _BYTE *v28;
  void *v29;
  void *v30;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = a3;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v37)
    goto LABEL_43;
  v36 = *(_QWORD *)v39;
  while (2)
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v39 != v36)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v7, "group");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v11 = objc_msgSend(v8, "category");
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 88);
      v14 = v13 - 1;
      v15 = v11 - 1;
      v17 = (unint64_t)(v13 - 1) < 0xE && v15 < 0xE;
      v18 = 1;
      if (v13 != v11 && !v17)
      {
        v19 = *(_QWORD *)(a1 + 96);
        v18 = v19 == PLSearchUserCategoryForCategory(v11);
      }
      v20 = *(_QWORD *)(a1 + 104);
      if (v10 >= v20)
        v21 = *(_QWORD *)(a1 + 104);
      else
        v21 = v10;
      v22 = (double)v21;
      if (v10 > v20)
        v20 = v10;
      if ((double)v20 * 0.8 <= v22 || v18)
      {
        v34 = v7;
        v24 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
        objc_msgSend(v24, "intersectSet:", v9);
        if (v22 * 0.8 > (double)(unint64_t)objc_msgSend(v24, "count"))
        {

          goto LABEL_26;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
        v25 = *(_QWORD *)(a1 + 88);
        v27 = v25 == 1000 && (_DWORD)v12 == 2;
        if (v25 == 2 || v27 || v14 > 0xD || v15 > 0xD)
        {
          if (v27 || !v18)
          {
            v28 = a4;
            if (!v27)
              goto LABEL_42;
          }
          else
          {
            v28 = a4;
            if (*(_QWORD *)(a1 + 104) <= v10)
              goto LABEL_42;
          }
        }
        else
        {
          v28 = a4;
          if (v25 >= v12 || floor((double)v10 * 0.95) > (double)*(unint64_t *)(a1 + 104))
            goto LABEL_42;
        }
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v34);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a2);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_42:
        v29 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "group");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v30);

        *v28 = 1;
        goto LABEL_43;
      }
LABEL_26:

    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v37)
      continue;
    break;
  }
LABEL_43:

}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_389(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 1.0;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v8 != 1.0)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "score");
          objc_msgSend(v10, "setScore:", v8 * v11);
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
        v8 = v8 * 0.8;
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_2_395(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "groupId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
    v7 = objc_msgSend(v5, "category") == 1300;
  else
    v7 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "socialGroupExtendedAssetIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minusSet:", v10);

  }
  objc_msgSend(v14, "setAssetIds:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "socialGroupExtendedCollectionIds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minusSet:", v13);

  }
  objc_msgSend(v14, "setCollectionIds:", v12);

}

void __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3_397(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(a3, "groupId"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionIds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unionSet:", v9);
}

PSIQueryToken *__84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_390(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  PSIQueryToken *v5;
  PSIQueryToken *v6;
  PSIQueryToken *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "contentString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLSearchUserCategoryForCategory((int)objc_msgSend(v1, "category"));
  v4 = objc_msgSend(v2, "length");
  v5 = [PSIQueryToken alloc];
  v6 = v5;
  if (v4)
  {
    v7 = -[PSIQueryToken initWithText:userCategory:matchType:](v5, "initWithText:userCategory:matchType:", v2, v3, 2);
  }
  else
  {
    objc_msgSend(v1, "lookupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PSIQueryToken initWithIdentifier:userCategory:](v6, "initWithIdentifier:userCategory:", v8, v3);

  }
  return v7;
}

uint64_t __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_398(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", a2, a3);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "setUserCategory:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setSearchedCategories:", 0);
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *a4 = 1;
  }
  return result;
}

uint64_t __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_400(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_scoreForUserCategory:", objc_msgSend(v5, "userCategory"));
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_scoreForUserCategory:", objc_msgSend(v6, "userCategory"));
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &unk_1E3760DB8;
  if (v8)
    v12 = v8;
  else
    v12 = &unk_1E3760DB8;
  v13 = objc_msgSend(v10, "compare:", v12);
  if (!v13)
  {
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "searchedCategories");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "searchedCategories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v16, "compare:", v19);

  }
  return v13;
}

uint64_t __84__PSIDatabase__processNextKeywordSuggestionsForQuery_groupResults_allowIdentifiers___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_scoreForUserCategory:", PLSearchUserCategoryForCategory(a2));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v5 + 24) >= v4)
    v4 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = v4;
  return result;
}

void __63__PSIDatabase_collectionResultByCollectionIdWithCollectionIds___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqCollectionResultByCollectionIdWithCollectionIds:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__PSIDatabase__inqCollectionResultByCollectionIdWithCollectionIds___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  PSIDate *v18;
  PSIDate *v19;
  void *v20;
  PSICollectionResult *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  v2 = a2;
  v25 = objc_msgSend(v2, "int64AtColumn:", 0);
  v3 = objc_msgSend(v2, "int64AtColumn:", 1);
  v4 = objc_msgSend(v2, "int64AtColumn:", 2);
  v5 = objc_msgSend(v2, "int64AtColumn:", 3);
  v24 = objc_msgSend(v2, "int64AtColumn:", 4);
  objc_msgSend(v2, "textAtColumn:", 5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E36789C0;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(v2, "textAtColumn:", 6);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v2, "int64AtColumn:", 7);
  objc_msgSend(v2, "textAtColumn:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textAtColumn:", 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v2, "int64AtColumn:", 10);
  v14 = objc_msgSend(v2, "int64AtColumn:", 11);
  objc_msgSend(v2, "doubleAtColumn:", 12);
  v16 = v15;

  v17 = (void *)PLStringNewFromUUIDComponents(v3, v4);
  v18 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", v5);
  v19 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", v24);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PSICollectionResult initWithUUID:startDate:endDate:title:subtitle:keyAssetUUIDPrivate:keyAssetUUIDShared:type:assetsCountPrivate:assetsCountShared:sortDate:]([PSICollectionResult alloc], "initWithUUID:startDate:endDate:title:subtitle:keyAssetUUIDPrivate:keyAssetUUIDShared:type:assetsCountPrivate:assetsCountShared:sortDate:", v17, v18, v19, v9, v27, v11, v12, v10, v13, v14, v20);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

}

void __46__PSIDatabase_assetUUIDByAssetIdWithAssetIds___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDByAssetIdWithAssetIds:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__PSIDatabase__inqAssetUUIDByAssetIdWithAssetIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64AtColumn:", 0);
  v5 = objc_msgSend(v3, "int64AtColumn:", 1);
  v6 = objc_msgSend(v3, "int64AtColumn:", 2);

  v9 = (id)PLStringNewFromUUIDComponents(v5, v6);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

void __35__PSIDatabase__inqScoreForGroupID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_double(a2, 0);
}

void __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

void __45__PSIDatabase__inqNewGroupIdsWithCategories___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_2(uint64_t a1, int a2)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v3, 0xCu);
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __73__PSIDatabase__inqNewGroupIdsMatchingString_categories_textIsSearchable___block_invoke_359(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v3);
}

void __43__PSIDatabase__inqContentStringForGroupId___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = sqlite3_column_text(a2, 0);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v3, 4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __29__PSIDatabase_allCollections__block_invoke(uint64_t a1)
{
  const void *Value;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("selectCollection"));
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PSIDatabase_allCollections__block_invoke_2;
  v7[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v7[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "_inqExecutePreparedStatement:withStatementBlock:", Value, v7);
  objc_msgSend(*(id *)(a1 + 32), "_inqCollectionResultsForCollectionIds:range:", *(_QWORD *)(a1 + 48), 0, CFArrayGetCount(*(CFArrayRef *)(a1 + 48)));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __29__PSIDatabase_allCollections__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  const void *v3;

  v3 = (const void *)sqlite3_column_int64(a2, 0);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
}

void __59__PSIDatabase__inqCollectionResultsForCollectionIds_range___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3;
  sqlite3_int64 v4;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  const unsigned __int8 *v7;
  const unsigned __int8 *v8;
  unsigned __int8 *v9;
  const unsigned __int8 *v10;
  int v11;
  double v12;
  PSIDate *v13;
  PSIDate *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PSICollectionResult *v19;
  int v20;
  int v21;
  id v23;

  v3 = sqlite3_column_int64(a2, 0);
  v4 = sqlite3_column_int64(a2, 1);
  v5 = sqlite3_column_int64(a2, 2);
  v6 = sqlite3_column_int64(a2, 3);
  v7 = sqlite3_column_text(a2, 4);
  v8 = sqlite3_column_text(a2, 5);
  v21 = sqlite3_column_int(a2, 6);
  v9 = (unsigned __int8 *)sqlite3_column_text(a2, 7);
  v10 = sqlite3_column_text(a2, 8);
  v20 = sqlite3_column_int(a2, 9);
  v11 = sqlite3_column_int(a2, 10);
  v12 = sqlite3_column_double(a2, 11);
  v23 = (id)PLStringNewFromUUIDComponents(v3, v4);
  v13 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", v5);
  v14 = -[PSIDate initWithInt64Representation:]([PSIDate alloc], "initWithInt64Representation:", v6);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v7, 4);
  if (v8)
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v8, 4);
  else
    v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v9 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v9, 4);
  if (v10)
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v10, 4);
  else
    v18 = 0;
  v19 = -[PSICollectionResult initWithUUID:startDate:endDate:title:subtitle:keyAssetUUIDPrivate:keyAssetUUIDShared:type:assetsCountPrivate:assetsCountShared:sortDate:]([PSICollectionResult alloc], "initWithUUID:startDate:endDate:title:subtitle:keyAssetUUIDPrivate:keyAssetUUIDShared:type:assetsCountPrivate:assetsCountShared:sortDate:", v23, v13, v14, v15, v16, v9, v18, v21, v20, v11, v17);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);

}

void __41__PSIDatabase__inqAssetUUIDsForAssetIds___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  sqlite3_int64 v5;
  id v6;

  v4 = sqlite3_column_int64(a2, 0);
  v5 = sqlite3_column_int64(a2, 1);
  v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __57__PSIDatabase__inqCollectionUUIDsForCollectionIds_range___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  sqlite3_int64 v5;
  id v6;

  v4 = sqlite3_column_int64(a2, 0);
  v5 = sqlite3_column_int64(a2, 1);
  v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __66__PSIDatabase__inqAssetUUIDsForAssetIds_range_creationDateSorted___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  sqlite3_int64 v5;
  id v6;

  v4 = sqlite3_column_int64(a2, 0);
  v5 = sqlite3_column_int64(a2, 1);
  v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __52__PSIDatabase_allAssetUUIDsForGroupsWithCategories___block_invoke(uint64_t a1)
{
  void *v2;
  CFMutableSetRef Mutable;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_inqNewGroupIdsWithCategories:", *(_QWORD *)(a1 + 40));
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "_inqNewAssetIdsForGroupId:dateFilter:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), 0, (_QWORD)v13);
        -[__CFSet addObjectsFromArray:](Mutable, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDsForAssetIds:", Mutable);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __52__PSIDatabase_allCollectionUUIDsWithCollectionType___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  sqlite3_int64 v5;
  id v6;

  if (*(_QWORD *)(a1 + 40) == sqlite3_column_int(a2, 2))
  {
    v4 = sqlite3_column_int64(a2, 0);
    v5 = sqlite3_column_int64(a2, 1);
    v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
}

void __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke_2;
  v8[3] = &unk_1E3677C18;
  v2 = (void *)a1[5];
  v9 = (id)a1[4];
  v10 = v2;
  objc_msgSend(v9, "_inqPerformBatch:", v8);
  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v3, v4, v5, v6);

}

void __77__PSIDatabase_deleteGroupsWithGraphCollectionsForPersonUUIDs_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "searchDatabaseLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SearchDatabase - deleteGroupsForPersonRename", ", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "_inqDeleteGroupsWithGraphCollectionsForPersonUUID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  v11 = v5;
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v3, "SearchDatabase - deleteGroupsForPersonRename", ", buf, 2u);
  }

}

uint64_t __33__PSIDatabase_removeUnusedGroups__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__PSIDatabase_removeUnusedGroups__block_invoke_2;
  v3[3] = &unk_1E3677AA0;
  v3[4] = v1;
  return objc_msgSend(v1, "_inqPerformBatch:", v3);
}

uint64_t __33__PSIDatabase_removeUnusedGroups__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqRemoveUnusedGroups");
}

void __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke_2;
  v11[3] = &unk_1E3674F30;
  v2 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v14 = v3;
  v15 = v4;
  objc_msgSend(v12, "_inqPerformBatch:", v11);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v5, v6, v7, v8, v9);

}

uint64_t __60__PSIDatabase__removeUUID_categories_objectType_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_inqRemoveUUID:categories:objectType:isInBatch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_inqRemoveUnusedGroups");
}

void __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke_338;
    v11[3] = &unk_1E3674EE0;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v12 = v3;
    v13 = v4;
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v2, "_inqPerformBatch:", v11);
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v5, v6, v7);

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v17 = "-[PSIDatabase _removeUUIDs:objectType:deferRemovingUnusedGroups:completion:]_block_invoke";
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

void __76__PSIDatabase__removeUUIDs_objectType_deferRemovingUnusedGroups_completion___block_invoke_338(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_inqRemoveUUID:objectType:isInBatch:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i), *(_QWORD *)(a1 + 48), 1, (_QWORD)v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 40), "_inqRemoveUnusedGroups");
}

void __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  char v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_336;
    v6[3] = &unk_1E3675C80;
    v6[4] = v2;
    v7 = *(id *)(a1 + 40);
    v8 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v2, "_inqPerformBatch:", v6);
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(void))(v3 + 16))();

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v10 = "-[PSIDatabase addCollections:deferRemovingUnusedGroups:withCompletion:]_block_invoke";
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

void __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_336(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  int v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  __int128 v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *context;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  PSIGroupCache *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  uint64_t v62;
  __int16 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t v76[128];
  uint8_t buf[4];
  _BYTE v78[10];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v51 = -[PSIGroupCache initWithDelegate:]([PSIGroupCache alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v54 = a1;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (v2)
  {
    v41 = *(_QWORD *)v69;
    *(_QWORD *)&v3 = 138543362;
    v39 = v3;
    do
    {
      v48 = 0;
      v42 = v2;
      do
      {
        if (*(_QWORD *)v69 != v41)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v48);
        context = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v4, "uuid");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "keyAssetPrivate");
        v47 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "keyAssetShared");
        v53 = v4;
        v45 = objc_claimAutoreleasedReturnValue();
        v43 = v5;
        v44 = v6;
        if (objc_msgSend(v5, "length") && (!objc_msgSend(v6, "length") ? (v7 = 1) : (v7 = (v47 | v45) == 0), !v7))
        {
          objc_msgSend(v4, "tokens");
          v52 = objc_claimAutoreleasedReturnValue();
          if (v52 && v6)
          {
            objc_msgSend(*(id *)(v54 + 32), "_inqRemoveUUID:objectType:isInBatch:", v5, 1, 1);
            v10 = objc_msgSend(*(id *)(v54 + 32), "_inqCollectionIdWithCollection:", v4);
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v8 = v52;
            -[NSObject reverseObjectEnumerator](v52, "reverseObjectEnumerator");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
            if (v12)
            {
              v13 = 0;
              LOWORD(v14) = 0;
              v15 = *(_QWORD *)v65;
              v49 = v11;
              do
              {
                v16 = 0;
                v17 = v14;
                do
                {
                  if (*(_QWORD *)v65 != v15)
                    objc_enumerationMutation(v49);
                  v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v16);
                  objc_msgSend(v18, "text", v39);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "identifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = objc_msgSend(v18, "category");
                  v21 = objc_msgSend(v18, "owningCategory");
                  if ((unsigned __int16)v21 == v17)
                    v22 = v13;
                  else
                    v22 = 0;
                  if (v21)
                    v23 = v22;
                  else
                    v23 = 0;
                  v13 = -[PSIGroupCache idOfGroupWithText:identifier:category:owningGroupId:](v51, "idOfGroupWithText:identifier:category:owningGroupId:", v19, v20, v14, v23);
                  objc_msgSend(*(id *)(v54 + 32), "_inqUpdateGCTableWithGroupId:collectionId:", v13, v10);
                  v24 = PLSearchIndexSynonymCategoryForCategory(v14);
                  v59[0] = MEMORY[0x1E0C809B0];
                  v59[1] = 3221225472;
                  v59[2] = __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_337;
                  v59[3] = &unk_1E3674EB8;
                  v63 = v24;
                  v62 = v13;
                  v60 = v50;
                  v61 = &v72;
                  objc_msgSend(v53, "enumerateSynonymsForOriginalContentString:orOriginalLookupIdentifier:handler:", v19, v20, v59);

                  v8 = v52;
                  ++v16;
                  v17 = v14;
                }
                while (v12 != v16);
                v11 = v49;
                v12 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
              }
              while (v12);
            }

          }
          else
          {
            v8 = v52;
          }
        }
        else
        {
          PLSearchBackendPSIDatabaseGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "uuid");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v39;
            *(_QWORD *)v78 = v9;
            _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Missing required search attributes to index Collection UUID: %{public}@", buf, 0xCu);

          }
        }

        objc_autoreleasePoolPop(context);
        ++v48;
      }
      while (v48 != v42);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    }
    while (v2);
  }

  PLSearchBackendPSIDatabaseGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = -[PSIGroupCache numberOfGroupsQueried](v51, "numberOfGroupsQueried");
    v27 = -[PSIGroupCache numberOfGroupsChecked](v51, "numberOfGroupsChecked");
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v78 = v26;
    *(_WORD *)&v78[4] = 1026;
    *(_DWORD *)&v78[6] = v27;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "Search Indexing: Queried %{public}d groups for %{public}d groups checked.", buf, 0xEu);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v28 = v50;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v56 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v33 = *(void **)(v54 + 32);
        objc_msgSend(v32, "text", v39);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_inqUpdateGroupForText:identifier:category:owningGroupId:", v34, v35, (__int16)objc_msgSend(v32, "category"), objc_msgSend(v32, "owningGroupId"));

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
    }
    while (v29);
  }

  PLSearchBackendPSIDatabaseGetLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = objc_msgSend(v28, "count");
    v38 = v73[3];
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v78 = v37;
    *(_WORD *)&v78[4] = 1026;
    *(_DWORD *)&v78[6] = v38;
    _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_INFO, "Search Indexing: Registered %{public}d synonyms for %{public}d synonyms encountered.", buf, 0xEu);
  }

  if (!*(_BYTE *)(v54 + 48))
    objc_msgSend(*(id *)(v54 + 32), "_inqRemoveUnusedGroups");
  _Block_object_dispose(&v72, 8);

}

void __71__PSIDatabase_addCollections_deferRemovingUnusedGroups_withCompletion___block_invoke_337(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  PSISynonym *v9;

  if (*(unsigned __int16 *)(a1 + 56) == (unsigned __int16)a3)
  {
    v7 = a4;
    v8 = a2;
    v9 = -[PSISynonym initWithText:category:owningGroupId:identifier:]([PSISynonym alloc], "initWithText:category:owningGroupId:identifier:", v8, a3, *(_QWORD *)(a1 + 48), v7);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  }
}

void __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  char v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_327;
    v6[3] = &unk_1E3675C80;
    v6[4] = v2;
    v7 = *(id *)(a1 + 40);
    v8 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v2, "_inqPerformBatch:", v6);
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(void))(v3 + 16))();

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v10 = "-[PSIDatabase addAssets:deferRemovingUnusedGroups:withCompletion:]_block_invoke";
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

void __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_327(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int16 v24;
  id v25;
  NSObject *v26;
  int v27;
  int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  int v48;
  __int128 v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *context;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  PSIGroupCache *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;
  __int16 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE v90[128];
  uint8_t v91[128];
  uint8_t buf[4];
  _BYTE v93[10];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v61 = -[PSIGroupCache initWithDelegate:]([PSIGroupCache alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v86 = 0;
  v87 = &v86;
  v88 = 0x2020000000;
  v89 = 0;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v63 = a1;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v2)
  {
    v51 = *(_QWORD *)v83;
    *(_QWORD *)&v3 = 138412290;
    v49 = v3;
    do
    {
      v56 = 0;
      v52 = v2;
      do
      {
        if (*(_QWORD *)v83 != v51)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v56);
        context = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v4, "uuid");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5 == 0;

        if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v49;
          *(_QWORD *)v93 = CFSTR("expect uuid");
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        objc_msgSend(v4, "uuid", v49);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "tokens");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          if (objc_msgSend(v4, "isUpdate"))
          {
            v8 = v7;
            PLSearchIndexCategoriesForAssetPropertySet(objc_msgSend(v4, "propertySets"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v63 + 32), "_inqRemoveUUID:categories:objectType:isInBatch:", v55, v9, 0, 1);

            v7 = v8;
          }
          else
          {
            objc_msgSend(*(id *)(v63 + 32), "_inqRemoveUUID:objectType:isInBatch:", v55, 0, 1);
          }
          v62 = objc_msgSend(*(id *)(v63 + 32), "_inqAssetIdWithAsset:", v4);
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v53 = v7;
          objc_msgSend(v7, "reverseObjectEnumerator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
          if (v11)
          {
            LOWORD(v12) = 0;
            v13 = 0;
            v14 = *(_QWORD *)v79;
            v58 = v10;
            do
            {
              v15 = 0;
              v16 = v12;
              do
              {
                if (*(_QWORD *)v79 != v14)
                  objc_enumerationMutation(v58);
                v17 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v15);
                objc_msgSend(v17, "text");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = objc_msgSend(v17, "category");
                v20 = objc_msgSend(v17, "owningCategory");
                if ((unsigned __int16)v20 == v16)
                  v21 = v13;
                else
                  v21 = 0;
                if (v20)
                  v22 = v21;
                else
                  v22 = 0;
                v13 = -[PSIGroupCache idOfGroupWithText:identifier:category:owningGroupId:](v61, "idOfGroupWithText:identifier:category:owningGroupId:", v18, v19, v12, v22);
                objc_msgSend(*(id *)(v63 + 32), "_inqUpdateGATableWithGroupId:assetId:", v13, v62);
                if (objc_msgSend(v18, "length") && (PLSearchIndexCategoryMaskForCategory(v12) & 0x13A4234C04) != 0)
                {
                  objc_msgSend(v57, "addObject:", v18);
                  objc_msgSend(v59, "objectForKeyedSubscript:", v18);
                  v23 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v23)
                  {
                    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                    objc_msgSend(v59, "setObject:forKeyedSubscript:", v23, v18);
                  }
                }
                else
                {
                  v23 = 0;
                }
                v24 = PLSearchIndexSynonymCategoryForCategory(v12);
                v72[0] = MEMORY[0x1E0C809B0];
                v72[1] = 3221225472;
                v72[2] = __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_333;
                v72[3] = &unk_1E3674E90;
                v77 = v24;
                v76 = v13;
                v73 = v60;
                v25 = v23;
                v74 = v25;
                v75 = &v86;
                objc_msgSend(v4, "enumerateSynonymsForOriginalContentString:orOriginalLookupIdentifier:handler:", v18, v19, v72);

                ++v15;
                v16 = v12;
              }
              while (v11 != v15);
              v10 = v58;
              v11 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
            }
            while (v11);
          }

          v7 = v53;
        }

        objc_autoreleasePoolPop(context);
        ++v56;
      }
      while (v56 != v52);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v2);
  }

  PLSearchBackendPSIDatabaseGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = -[PSIGroupCache numberOfGroupsQueried](v61, "numberOfGroupsQueried");
    v28 = -[PSIGroupCache numberOfGroupsChecked](v61, "numberOfGroupsChecked");
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v93 = v27;
    *(_WORD *)&v93[4] = 1026;
    *(_DWORD *)&v93[6] = v28;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "Search Indexing: Queried %{public}d groups for %{public}d group checks.", buf, 0xEu);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v29 = v60;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v91, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v69 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        v34 = *(void **)(v63 + 32);
        objc_msgSend(v33, "text");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_inqUpdateGroupForText:identifier:category:owningGroupId:", v35, v36, (__int16)objc_msgSend(v33, "category"), objc_msgSend(v33, "owningGroupId"));

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v91, 16);
    }
    while (v30);
  }

  PLSearchBackendPSIDatabaseGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = objc_msgSend(v29, "count");
    v39 = v87[3];
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v93 = v38;
    *(_WORD *)&v93[4] = 1026;
    *(_DWORD *)&v93[6] = v39;
    _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_INFO, "Search Indexing: Registered %{public}d synonyms for %{public}d synonyms encountered.", buf, 0xEu);
  }

  if ((objc_msgSend((id)objc_opt_class(), "_lemonadeIsEnabled") & 1) == 0)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v40 = v57;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v90, 16);
    if (v41)
    {
      v42 = 0;
      v43 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v65 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
          objc_msgSend(v59, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(v63 + 32) + 40), "insertWord:synonyms:", v45, v46);
          LODWORD(v45) = objc_msgSend(v46, "count");

          v42 += v45;
        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v90, 16);
      }
      while (v41);
    }
    else
    {
      v42 = 0;
    }

    PLSearchBackendPSIDatabaseGetLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      v48 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v93 = v42;
      *(_WORD *)&v93[4] = 1026;
      *(_DWORD *)&v93[6] = v48;
      _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "Search Indexing: Inserted %{public}d Word Embedding synonyms for %{public}d words.", buf, 0xEu);
    }

  }
  if (!*(_BYTE *)(v63 + 48))
    objc_msgSend(*(id *)(v63 + 32), "_inqRemoveUnusedGroups");
  _Block_object_dispose(&v86, 8);

}

void __66__PSIDatabase_addAssets_deferRemovingUnusedGroups_withCompletion___block_invoke_333(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  PSISynonym *v9;
  void *v10;
  id v11;

  v7 = a2;
  if (*(unsigned __int16 *)(a1 + 64) == (unsigned __int16)a3)
  {
    v11 = v7;
    v8 = a4;
    v9 = -[PSISynonym initWithText:category:owningGroupId:identifier:]([PSISynonym alloc], "initWithText:category:owningGroupId:identifier:", v11, a3, *(_QWORD *)(a1 + 56), v8);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    v10 = *(void **)(a1 + 40);
    if (v10)
      objc_msgSend(v10, "addObject:", v11);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

    v7 = v11;
  }

}

void __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke_321;
    v8[3] = &unk_1E3677C40;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v9 = v3;
    v10 = v4;
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v2, "_inqPerformBatch:", v8);
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(void))(v5 + 16))();

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v13 = "-[PSIDatabase updateRankingScoreForGroups:withCompletion:]_block_invoke";
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to perform PSI operation on NULL db: %{public}s", buf, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
}

void __58__PSIDatabase_updateRankingScoreForGroups_withCompletion___block_invoke_321(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *obj;
  char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = -[NSObject countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v2)
    goto LABEL_15;
  v3 = v2;
  v18 = 0;
  v4 = *(_QWORD *)v21;
  obj = v1;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v21 != v4)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v7 = *(void **)(a1 + 40);
      v8 = objc_msgSend(v6, "category");
      v9 = objc_msgSend(v6, "owningGroupId");
      objc_msgSend(v6, "contentString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "normalizedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lookupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "score");
      LOWORD(v16) = 256;
      v13 = objc_msgSend(v7, "_inqGroupIdForCategory:owningGroupId:contentString:normalizedString:identifier:rankingScore:insertIfNeeded:tokenOutput:shouldUpdateOwningGroupId:shouldUpdateRankingScore:", v8, v9, v10, v11, v12, 0, 0, v16);

      if (!v13)
      {
        PLSearchBackendPSIDatabaseGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v6;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "PSI Ranking Update: Failed to find group for ranking score update: %@", buf, 0xCu);
        }
        ++v18;

      }
    }
    v3 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  }
  while (v3);

  if (v18)
  {
    PLSearchBackendPSIDatabaseGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218240;
      v25 = v18;
      v26 = 2048;
      v27 = v15;
      _os_log_impl(&dword_199541000, v1, OS_LOG_TYPE_ERROR, "PSI Ranking Update: Failed to update ranking score for %ld of %ld groups.", buf, 0x16u);
    }
LABEL_15:

  }
}

void __34__PSIDatabase_isDatabaseCorrupted__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_integrityCheckDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) ^ 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      PLSearchBackendPSIDatabaseGetLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Database corruption detected during integrity quick check.", v3, 2u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_ingRebuildPrefixTableIfNeeded");
    }
  }
}

void __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_clearInitialSuggestions");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __42__PSIDatabase_dropDatabaseWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[1])
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v2, "_finalizeEverything");
  return objc_msgSend((id)objc_opt_class(), "_dropDatabase:withCompletion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

void __35__PSIDatabase_updateSearchMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "currentSearchMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

}

void __49__PSIDatabase__prepareSearchIndexAtPath_options___block_invoke(uint64_t a1)
{
  __CFString *v2;
  NSObject *v3;
  PSIWordEmbeddingTable *v4;
  uint64_t v5;
  void *v6;
  PSIIntArray *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  +[PSITokenizer ftsTokenizerName](PSITokenizer, "ftsTokenizerName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "registerFTS5TokenizerForDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)))
  {
    PLSearchBackendPSIDatabaseGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Failed to create fts custom tokenizer, falling back to ascii", v10, 2u);
    }

    v2 = CFSTR("ascii");
  }
  if ((objc_msgSend((id)objc_opt_class(), "_lemonadeIsEnabled") & 1) == 0)
  {
    v4 = -[PSIWordEmbeddingTable initWithDelegate:searchable:writable:locale:]([PSIWordEmbeddingTable alloc], "initWithDelegate:searchable:writable:locale:");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = -[PSIIntArray initWithLabel:database:]([PSIIntArray alloc], "initWithLabel:database:", CFSTR("matchingIds"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_inqPrepareStatementsForOptions:tokenizerName:", *(_QWORD *)(a1 + 56), v2);
}

uint64_t __49__PSIDatabase__prepareSearchIndexAtPath_options___block_invoke_40()
{
  return +[PSIQuery bootstrap](PSIQuery, "bootstrap");
}

uint64_t __46__PSIDatabase__inqVerifyTablesExistInDatabase__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64AtColumn:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == 1;
  return result;
}

+ (BOOL)_lemonadeIsEnabled
{
  return _os_feature_enabled_impl();
}

+ (void)dropDatabaseAtPath:(id)a3 withCompletion:(id)a4
{
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a4;
  v6 = objc_msgSend(a1, "_openDatabaseAtPath:options:", a3, 2);
  if (v6)
  {
    objc_msgSend(a1, "_dropDatabase:withCompletion:", v6, v7);
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

+ (void)_dropDatabase:(sqlite3 *)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = CFSTR("expect db connection");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  PLSearchBackendPSIDatabaseGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Closed Search Index sqlite database.", buf, 2u);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  *(_DWORD *)buf = 129;
  v8 = sqlite3_file_control(a3, 0, 101, buf);
  if ((_DWORD)v8)
    objc_msgSend(v7, "appendFormat:", CFSTR("Failed to truncate database: %s (%d). "), sqlite3_errmsg(a3), v8);
  v9 = sqlite3_close(a3);
  v10 = v9;
  if ((_DWORD)v9)
    objc_msgSend(v7, "appendFormat:", CFSTR("Failed to close database: %s (%d)."), sqlite3_errstr(v9), v9);
  if (!(v10 | v8))
  {
    v13 = 0;
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2D50];
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.search"), -1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
LABEL_12:
    v5[2](v5, v13);
LABEL_13:

}

+ (BOOL)_integrityCheckDatabase:(sqlite3 *)a3
{
  BOOL v3;
  int v4;
  const unsigned __int8 *v5;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, "pragma quick_check", -1, &ppStmt, 0))
    return 0;
  while (1)
  {
    v4 = sqlite3_step(ppStmt);
    v3 = v4 == 100;
    if (v4 != 100)
      break;
    v5 = sqlite3_column_text(ppStmt, 0);
    if (v5)
    {
      if (!strcmp((const char *)v5, "ok"))
        break;
    }
  }
  sqlite3_finalize(ppStmt);
  return v3;
}

+ (id)searchDatabaseLog
{
  if (searchDatabaseLog_onceToken != -1)
    dispatch_once(&searchDatabaseLog_onceToken, &__block_literal_global_468);
  return (id)searchDatabaseLog_searchDatabaseLog;
}

void __32__PSIDatabase_searchDatabaseLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.search", "SearchDatabase");
  v1 = (void *)searchDatabaseLog_searchDatabaseLog;
  searchDatabaseLog_searchDatabaseLog = (uint64_t)v0;

}

- (id)initForTestingWithOptions:(int64_t)a3
{
  PSIDatabase *v4;
  PSIDatabase *v5;
  NSString *path;
  int64_t v7;
  _BOOL4 v8;
  PSIDatabase *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSIDatabase;
  v4 = -[PSIDatabase init](&v11, sel_init);
  v5 = v4;
  if (v4
    && ((path = v4->_path, v4->_path = (NSString *)CFSTR(":memory:"), path, (unint64_t)a3 <= 1)
      ? (v7 = 1)
      : (v7 = a3),
        v8 = -[PSIDatabase _prepareSearchIndexAtPath:options:](v5, "_prepareSearchIndexAtPath:options:", v5->_path, v7),
        v5->_databaseIsValid = v8,
        !v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (int64_t)insertAsset:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PSIDatabase_UnitTesting__insertAsset___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (int64_t)insertCollection:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PSIDatabase_UnitTesting__insertCollection___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (int64_t)insertGroup:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;
  PSIDatabase *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PSIDatabase_UnitTesting__insertGroup___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (void)linkAssetWithId:(int64_t)a3 toGroupWithId:(int64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PSIDatabase_UnitTesting__linkAssetWithId_toGroupWithId___block_invoke;
  v4[3] = &unk_1E3677C90;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v4);
}

- (void)linkCollectionWithId:(int64_t)a3 toGroupWithId:(int64_t)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PSIDatabase_UnitTesting__linkCollectionWithId_toGroupWithId___block_invoke;
  v4[3] = &unk_1E3677C90;
  v4[4] = self;
  v4[5] = a4;
  v4[6] = a3;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v4);
}

- (id)allGroupIds
{
  CFMutableSetRef Mutable;
  __CFSet *v4;
  __CFSet *v5;
  __CFSet *v6;
  _QWORD v8[5];
  __CFSet *v9;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v4 = Mutable;
  v9 = v4;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (void)exqExecuteStatementFromString:(id)a3 withResultEnumerationBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PSIDatabase_UnitTesting__exqExecuteStatementFromString_withResultEnumerationBlock___block_invoke;
  v10[3] = &unk_1E3676290;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v10);

}

- (id)groupIdsInPrefixTable
{
  CFMutableSetRef Mutable;
  __CFSet *v4;
  __CFSet *v5;
  __CFSet *v6;
  _QWORD v8[5];
  __CFSet *v9;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v4 = Mutable;
  v9 = v4;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = v2[15];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke_2;
  v4[3] = &unk_1E3675060;
  v5 = v1;
  objc_msgSend(v2, "executeStatement:withResultEnumerationBlock:", v3, v4);

}

void __49__PSIDatabase_UnitTesting__groupIdsInPrefixTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v3, "int64AtColumn:", 0));

}

uint64_t __85__PSIDatabase_UnitTesting__exqExecuteStatementFromString_withResultEnumerationBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeStatementFromString:withResultEnumerationBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = v2[14];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke_2;
  v4[3] = &unk_1E3675060;
  v5 = v1;
  objc_msgSend(v2, "executeStatement:withResultEnumerationBlock:", v3, v4);

}

void __39__PSIDatabase_UnitTesting__allGroupIds__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v3, "int64AtColumn:", 0));

}

uint64_t __63__PSIDatabase_UnitTesting__linkCollectionWithId_toGroupWithId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqUpdateGCTableWithGroupId:collectionId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __58__PSIDatabase_UnitTesting__linkAssetWithId_toGroupWithId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqUpdateGATableWithGroupId:assetId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__PSIDatabase_UnitTesting__insertGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  char *v10;
  sqlite3_stmt *Value;
  int v12;
  int v13;
  int v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "contentString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = _newUTF8String(v3, &v14);

  }
  else
  {
    v4 = 0;
  }

  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "normalizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "normalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _newUTF8String(v6, &v13);

  }
  else
  {
    v7 = 0;
  }

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "lookupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = _newUTF8String(v8, &v12);
  else
    v10 = 0;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("insertGroup"));
  if (sqlite3_bind_int(Value, 1, objc_msgSend(*(id *)(a1 + 32), "category"))
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_int64(Value, 2, objc_msgSend(*(id *)(a1 + 32), "owningGroupId"))
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_text(Value, 3, v4, v14, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_text(Value, 4, v7, v13, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  if (sqlite3_bind_text(Value, 5, v10, v12, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "_inqExecutePreparedStatement:withStatementBlock:", Value, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(_QWORD *)(a1 + 40) + 8));
  if (v4)
    free(v4);
  if (v7)
    free(v7);
  if (v10)
    free(v10);

}

uint64_t __45__PSIDatabase_UnitTesting__insertCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqCollectionIdWithCollection:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __40__PSIDatabase_UnitTesting__insertAsset___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqAssetIdWithAsset:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)statementFromString:(id)a3
{
  return -[PSIStatement initWithSQLite3Stmt:]([PSIStatement alloc], "initWithSQLite3Stmt:", -[PSIDatabase _inqPrepareStatement:](self, "_inqPrepareStatement:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String")));
}

- (void)executeStatementFromString:(id)a3
{
  id v4;

  -[PSIDatabase statementFromString:](self, "statementFromString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PSIDatabase executeStatement:](self, "executeStatement:", v4);
  objc_msgSend(v4, "finalizze");

}

- (void)executeStatementFromString:(id)a3 withResultEnumerationBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PSIDatabase statementFromString:](self, "statementFromString:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", v7, v6);

  objc_msgSend(v7, "finalizze");
}

- (void)executeStatement:(id)a3
{
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", a3, 0);
}

- (void)executeStatement:(id)a3 withResultEnumerationBlock:(id)a4
{
  __CFString *v6;
  void (**v7)(id, id, uint8_t *);
  sqlite3_stmt *v8;
  int v9;
  int v10;
  int v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, id, uint8_t *))a4;
  v8 = (sqlite3_stmt *)-[__CFString stmt](v6, "stmt");
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = CFSTR("Statement is nil");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  do
  {
    while (1)
    {
      v9 = sqlite3_step(v8);
      if (!v7 || v9 != 100)
        break;
      buf[0] = 0;
      v7[2](v7, v6, buf);
      if (buf[0])
        goto LABEL_9;
    }
  }
  while (v9 == 100);
LABEL_9:
  v10 = sqlite3_reset(v8);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to reset statement: %s"), sqlite3_errmsg(self->_inqDatabase));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
    }
    if ((~v11 & 0xB) == 0)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v6;
        v16 = 2112;
        v17 = v12;
        v18 = 1026;
        v19 = v11;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Database corruption detected during statement execution: %@: %@ (%{public}d).", buf, 0x1Cu);
      }

    }
  }

}

- (void)prepareForNumberOfMatchingIds:(unint64_t)a3
{
  -[PSIIntArray prepareForNumberOfElements:](self->_matchingIds, "prepareForNumberOfElements:", a3);
}

- (void)unprepareMatchingIds
{
  -[PSIIntArray unprepare](self->_matchingIds, "unprepare");
}

- (void)bindMatchingIds:(__CFSet *)a3
{
  -[PSIIntArray bindElements:](self->_matchingIds, "bindElements:", a3);
}

- (void)bindMatchingIds:(__CFArray *)a3 range:(_NSRange)a4
{
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, a4.location, a4.length);
}

- (void)bindMatchingIds:(const int64_t *)a3 numberOfMatchingIds:(unint64_t)a4
{
  -[PSIIntArray bindElements:numberOfElements:](self->_matchingIds, "bindElements:numberOfElements:", a3, a4);
}

- (void)unbindMatchingIds
{
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
}

- (int64_t)lastInsertedRowID
{
  return sqlite3_last_insert_rowid(self->_inqDatabase);
}

- (PSITokenizer)tokenizer
{
  return self->_tokenizer;
}

- (OS_dispatch_queue)groupResultsQueue
{
  return self->_groupResultsQueue;
}

- (void)executeQueryV2:(id)a3 resultsHandler:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int64_t options;
  const __CFString *v12;
  __CFString *v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setQueryBeginParsingTime:](v6, "setQueryBeginParsingTime:", v8);

  if (((self->_options & 1) != 0
     || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)buf = 138412290,
         v16 = CFSTR("expect searchable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) != 0))
    && self->_databaseIsValid)
  {
    v13 = v6;
    v14 = v7;
    pl_dispatch_sync();

  }
  else
  {
    PLSearchBackendQueryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid)
        v10 = CFSTR("valid");
      else
        v10 = CFSTR("invalid");
      options = self->_options;
      *(_DWORD *)buf = 138412802;
      v16 = v6;
      v17 = 2114;
      v18 = v10;
      if ((options & 1) != 0)
        v12 = CFSTR("yes");
      else
        v12 = CFSTR("no");
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to execute search query: %@. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)_executeQueryV2:(id)a3 resultsHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  __int128 *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t *v34;
  __int128 *p_buf;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  _QWORD *v40;
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  uint8_t v53[4];
  id v54;
  __int16 v55;
  uint64_t v56;
  __int128 buf;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  PLSearchBackendQueryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Begin query execution: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "searchText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryTokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") || objc_msgSend(v10, "count"))
  {
    objc_msgSend(v6, "bootstrap");
    objc_msgSend(v6, "processImplicitTokenization");
    objc_msgSend(v6, "processDates");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__93030;
    v60 = __Block_byref_object_dispose__93031;
    v61 = 0;
    v48 = 0;
    v49 = &v48;
    if (objc_msgSend(v6, "implicitTokenizationIncludeBaseParseResults"))
      v11 = 6;
    else
      v11 = 7;
    v50 = 0x3010000000;
    v51 = &unk_199CADF31;
    v52 = xmmword_199B9FD90;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3010000000;
    v46 = &unk_199CADF31;
    v47 = xmmword_199B9FD90;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v12 = MEMORY[0x1E0C809B0];
    v42 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke;
    v37[3] = &unk_1E3675580;
    v39 = &v43;
    v13 = v6;
    v38 = v13;
    v40 = v41;
    objc_msgSend(v13, "enumerateParsesWithMode:usingBlock:", 2, v37);
    objc_msgSend(v13, "queryBeginParsingTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceNow");
    objc_msgSend(v13, "setElapsedTimeQueryParsing:", 0.0 - v15);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setQueryBeginResultGenerationAndIntersectionsTime:", v16);

    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_2;
    v30[3] = &unk_1E36755A8;
    v32 = &v48;
    v17 = v13;
    v31 = v17;
    v33 = v41;
    v34 = &v43;
    p_buf = &buf;
    v36 = v11;
    objc_msgSend(v17, "enumerateParsesWithMode:usingBlock:", 1, v30);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      if (v49[5] == v44[5] && v49[4] == v44[4])
        v19 = 4;
      else
        v19 = 6;
    }
    else
    {
      v19 = 6;
    }
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_793;
    v26[3] = &unk_1E36755D0;
    v20 = v17;
    v27 = v20;
    v28 = &buf;
    v29 = v19;
    objc_msgSend(v20, "enumerateParsesWithMode:usingBlock:", v19, v26);
    if ((objc_msgSend(v20, "isCanceled") & 1) != 0)
    {
      v21 = 0;
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v53 = 138412546;
        v54 = v20;
        v55 = 2112;
        v56 = v23;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Query: %@ was executed with search result %@.", v53, 0x16u);
      }

      v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    }
    v7[2](v7, v21);
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_794;
    v25[3] = &unk_1E3677AA0;
    v25[4] = self;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v25);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    PLSearchBackendQueryGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "Query is empty, returning from execution: %@", (uint8_t *)&buf, 0xCu);
    }

    v7[2](v7, 0);
  }

}

- (void)executeQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 resultsHandler:(id)a5
{
  __CFString *v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  int64_t options;
  const __CFString *v12;
  __CFString *v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a5;
  if (((self->_options & 1) != 0
     || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     && (*(_DWORD *)buf = 138412290,
         v16 = CFSTR("expect searchable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) != 0))
    && self->_databaseIsValid)
  {
    v13 = v7;
    v14 = v8;
    pl_dispatch_sync();

  }
  else
  {
    PLSearchBackendPSIDatabaseGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid)
        v10 = CFSTR("valid");
      else
        v10 = CFSTR("invalid");
      options = self->_options;
      *(_DWORD *)buf = 138412802;
      v16 = v7;
      v17 = 2114;
      v18 = v10;
      if ((options & 1) != 0)
        v12 = CFSTR("yes");
      else
        v12 = CFSTR("no");
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to execute search query: %@. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60]);
  }

}

- (void)_executeQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 resultsHandler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  char v48;
  __int16 v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  NSObject *v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  os_signpost_id_t v62;
  NSObject *v63;
  NSObject *v64;
  double Current;
  NSObject *v66;
  CFAbsoluteTime v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  void *v74;
  void (**v75)(id, _QWORD);
  void *v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  BOOL v82;
  _QWORD v83[4];
  NSObject *v84;
  id v85;
  id v86;
  uint64_t v87;
  BOOL v88;
  _QWORD v89[4];
  id v90;
  NSObject *v91;
  id v92;
  __int128 *p_buf;
  _QWORD *v94;
  uint64_t *v95;
  uint64_t v96;
  BOOL v97;
  _QWORD v98[4];
  id v99;
  uint64_t *v100;
  _QWORD *v101;
  _QWORD v102[3];
  char v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  void *v107;
  __int128 v108;
  uint8_t v109[4];
  CFAbsoluteTime v110;
  __int16 v111;
  uint64_t v112;
  __int128 buf;
  uint64_t v114;
  void *v115;
  __int128 v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v75 = (void (**)(id, _QWORD))a5;
  PLSearchBackendPSIDatabaseGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Begin query execution: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v8, "searchText");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryTokens");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v76, "length") || objc_msgSend(v74, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "searchDatabaseLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);
    v12 = v10;
    v13 = v12;
    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      objc_msgSend(v8, "bootstrap");
      v15 = v13;
    }
    else
    {
      if (os_signpost_enabled(v12))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SearchIndex - executeQuery - queryBootstrap", ", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(v8, "bootstrap");
      v14 = v13;
      if (os_signpost_enabled(v14))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v11, "SearchIndex - executeQuery - queryBootstrap", ", (uint8_t *)&buf, 2u);
      }
    }

    PLSearchBackendPSIDatabaseGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Process implicit tokenization: %@", (uint8_t *)&buf, 0xCu);
    }

    v17 = os_signpost_id_generate(v13);
    v18 = v13;
    v19 = v18;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      objc_msgSend(v8, "processImplicitTokenization");
      v21 = v19;
    }
    else
    {
      if (os_signpost_enabled(v18))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SearchIndex - executeQuery - queryProcessImplicitTokenization", ", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(v8, "processImplicitTokenization");
      v20 = v19;
      if (os_signpost_enabled(v20))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v17, "SearchIndex - executeQuery - queryProcessImplicitTokenization", ", (uint8_t *)&buf, 2u);
      }
    }

    v22 = os_signpost_id_generate(v19);
    v23 = MEMORY[0x1E0C81028];
    v24 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Photos Search PSIDatabase: process dates: %@", (uint8_t *)&buf, 0xCu);
    }

    v25 = v19;
    v26 = v25;
    if (v22 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      objc_msgSend(v8, "processDates");
      v28 = v26;
    }
    else
    {
      if (os_signpost_enabled(v25))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SearchIndex - executeQuery - queryProcessDates", ", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(v8, "processDates");
      v27 = v26;
      if (os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v27, OS_SIGNPOST_INTERVAL_END, v22, "SearchIndex - executeQuery - queryProcessDates", ", (uint8_t *)&buf, 2u);
      }
    }

    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = os_signpost_id_generate(v26);
    v31 = v26;
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SearchIndex - executeQuery - queryEnumerateParses", ", (uint8_t *)&buf, 2u);
    }

    v33 = objc_msgSend(v8, "implicitTokenizationIncludeBaseParseResults");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    if (v33)
      v34 = 6;
    else
      v34 = 7;
    v114 = 0x3010000000;
    v115 = &unk_199CADF31;
    v116 = xmmword_199B9FD90;
    v104 = 0;
    v105 = &v104;
    v106 = 0x3010000000;
    v107 = &unk_199CADF31;
    v108 = xmmword_199B9FD90;
    v102[0] = 0;
    v102[1] = v102;
    v102[2] = 0x2020000000;
    v103 = 0;
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke;
    v98[3] = &unk_1E3675580;
    v100 = &v104;
    v35 = v8;
    v99 = v35;
    v101 = v102;
    objc_msgSend(v35, "enumerateParsesWithMode:usingBlock:", 2, v98);
    PLSearchBackendPSIDatabaseGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v109 = 138412290;
      v110 = *(double *)&v35;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_INFO, "Enumerate parses for query: %@", v109, 0xCu);
    }

    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_797;
    v89[3] = &unk_1E3675620;
    p_buf = &buf;
    v37 = v35;
    v90 = v37;
    v94 = v102;
    v95 = &v104;
    v96 = v34;
    v38 = v32;
    v91 = v38;
    v97 = a4;
    v39 = v29;
    v92 = v39;
    objc_msgSend(v37, "enumerateParsesWithMode:usingBlock:", 1, v89);
    if (objc_msgSend(v39, "count"))
    {
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == v105[5] && *(_QWORD *)(*((_QWORD *)&buf + 1) + 32) == v105[4])
        v41 = 4;
      else
        v41 = 6;
    }
    else
    {
      v41 = 6;
    }
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_798;
    v83[3] = &unk_1E3675648;
    v42 = v38;
    v84 = v42;
    v43 = v37;
    v85 = v43;
    v88 = a4;
    v44 = v39;
    v86 = v44;
    v87 = v41;
    objc_msgSend(v43, "enumerateParsesWithMode:usingBlock:", v41, v83);
    v45 = v42;
    v46 = v45;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)v109 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v46, OS_SIGNPOST_INTERVAL_END, v30, "SearchIndex - executeQuery - queryEnumerateParses", ", v109, 2u);
    }

    if ((objc_msgSend(v43, "isCanceled") & 1) != 0)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        v110 = *(double *)&v43;
        _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "Query: %@ was cancelled, exiting execution", v109, 0xCu);
      }
    }
    else
    {
      v48 = objc_msgSend(v43, "wordEmbeddingMode");
      v49 = objc_msgSend(v43, "wordEmbeddingMode");
      if ((v48 & 3) == 0 || (v49 & 0x100) != 0 && objc_msgSend(v44, "count"))
        goto LABEL_66;
      PLSearchBackendPSIDatabaseGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        v110 = *(double *)&v43;
        _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_INFO, "Generating word embeddings for query: %@", v109, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "searchDatabaseLog");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = os_signpost_id_generate(v51);
      v53 = v51;
      v54 = v53;
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SearchDatabase - WordEmbeddings", ", v109, 2u);
      }

      objc_msgSend(v43, "processWordEmbeddings");
      if ((objc_msgSend(v43, "isCanceled") & 1) == 0)
      {
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_799;
        v79[3] = &unk_1E3675670;
        v55 = v43;
        v80 = v55;
        v82 = a4;
        v81 = v44;
        objc_msgSend(v55, "enumerateParsesWithMode:usingBlock:", 8, v79);
        if ((objc_msgSend(v55, "isCanceled") & 1) == 0)
          objc_msgSend(v55, "computeSuggestions");

      }
      v56 = v54;
      v47 = v56;
      if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v47, OS_SIGNPOST_INTERVAL_END, v52, "SearchDatabase - WordEmbeddings", ", v109, 2u);
      }

    }
LABEL_66:
    if ((objc_msgSend(v43, "isCanceled") & 1) != 0)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        v110 = *(double *)&v43;
        _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_INFO, "Query: %@ was cancelled, exiting execution.", v109, 0xCu);
      }
    }
    else
    {
      v78 = 0;
      +[PSIPostProcessor postProcessGroupResults:dedupedGroupResults:query:](PSIPostProcessor, "postProcessGroupResults:dedupedGroupResults:query:", v44, &v78, v43);
      v58 = v78;
      v57 = v58;
      if (v58)
        v59 = v58;
      else
        v59 = MEMORY[0x1E0C9AA60];
      objc_msgSend(v43, "setDedupedGroupResults:", v59);
    }

    if ((objc_msgSend(v43, "isCanceled") & 1) == 0 && objc_msgSend(v43, "numberOfNextKeywordSuggestionToProcess"))
    {
      PLSearchBackendPSIDatabaseGetLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        v110 = *(double *)&v43;
        _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_INFO, "Generating next token suggestions for query: %@", v109, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "searchDatabaseLog");
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = os_signpost_id_generate(v61);
      v63 = v61;
      v64 = v63;
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "SearchDatabase - NextKeywordSuggestions", ", v109, 2u);
      }

      Current = CFAbsoluteTimeGetCurrent();
      -[PSIDatabase _processNextKeywordSuggestionsForQuery:groupResults:allowIdentifiers:](self, "_processNextKeywordSuggestionsForQuery:groupResults:allowIdentifiers:", v43, v44, 0);
      PLSearchBackendPSIDatabaseGetLog();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)v109 = 134349056;
        v110 = v67 - Current;
        _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_INFO, "Next Keyword Suggestions. Took %{public}f seconds.", v109, 0xCu);
      }

      v68 = v64;
      v69 = v68;
      if (v62 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v68))
      {
        *(_WORD *)v109 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v69, OS_SIGNPOST_INTERVAL_END, v62, "SearchDatabase - NextKeywordSuggestions", ", v109, 2u);
      }

    }
    if ((objc_msgSend(v43, "isCanceled") & 1) != 0)
    {
      PLSearchBackendPSIDatabaseGetLog();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v109 = 138412290;
        v110 = *(double *)&v43;
        _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_INFO, "Query: %@ was cancelled, exiting execution.", v109, 0xCu);
      }

      v75[2](v75, MEMORY[0x1E0C9AA60]);
    }
    else
    {
      PLSearchBackendPSIDatabaseGetLog();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        v72 = objc_msgSend(v44, "count");
        *(_DWORD *)v109 = 138412546;
        v110 = *(double *)&v43;
        v111 = 2050;
        v112 = v72;
        _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_INFO, "Query: %@ was executed with %{public}lu group results.", v109, 0x16u);
      }

      ((void (**)(id, id))v75)[2](v75, v44);
    }
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_801;
    v77[3] = &unk_1E3677AA0;
    v77[4] = self;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v77);

    _Block_object_dispose(v102, 8);
    _Block_object_dispose(&v104, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_94;
  }
  PLSearchBackendPSIDatabaseGetLog();
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_INFO, "Query is empty, returning from execution: %@", (uint8_t *)&buf, 0xCu);
  }

  v75[2](v75, MEMORY[0x1E0C9AA60]);
LABEL_94:

}

- (id)groupArraysFromGroupIdSets:(id)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__93030;
  v28 = __Block_byref_object_dispose__93031;
  v29 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__PSIDatabase_PSIQueryDelegate__groupArraysFromGroupIdSets_dateFilter_searchResultTypes_progressBlock___block_invoke;
  v18[3] = &unk_1E3675698;
  v22 = &v24;
  v18[4] = self;
  v13 = v10;
  v19 = v13;
  v14 = v11;
  v20 = v14;
  v23 = a5;
  v15 = v12;
  v21 = v15;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v18);
  v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (id)groupsFromGroupIds:(__CFSet *)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  __CFSet *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__93030;
  v21 = __Block_byref_object_dispose__93031;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PSIDatabase_PSIQueryDelegate__groupsFromGroupIds_dateFilter_searchResultTypes___block_invoke;
  v12[3] = &unk_1E36756C0;
  v14 = &v17;
  v15 = a3;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v16 = a5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (__CFSet)groupIdsMatchingString:(id)a3 categories:(id)a4 textIsSearchable:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  __CFSet *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PSIDatabase_PSIQueryDelegate__groupIdsMatchingString_categories_textIsSearchable___block_invoke;
  v14[3] = &unk_1E36756E8;
  v17 = &v19;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v18 = a5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v14);
  v12 = (__CFSet *)CFAutorelease((CFTypeRef)v20[3]);

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)groupWithMatchingGroupId:(unint64_t)a3 dateFilter:(id)a4 searchResultTypes:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__93030;
  v21 = __Block_byref_object_dispose__93031;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PSIDatabase_PSIQueryDelegate__groupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke;
  v12[3] = &unk_1E36756C0;
  v14 = &v17;
  v15 = a3;
  v12[4] = self;
  v9 = v8;
  v13 = v9;
  v16 = a5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)groupForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  PSIDatabase *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIDatabase.m"), 5257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lookupIdentifier.length > 0"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__93030;
  v21 = __Block_byref_object_dispose__93031;
  v22 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke;
  v12[3] = &unk_1E3674DF8;
  v8 = v7;
  v13 = v8;
  v14 = self;
  v15 = &v17;
  v16 = a4;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v12);
  v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (id)groupResultWithDateFilter:(id)a3 datedTokens:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__93030;
  v20 = __Block_byref_object_dispose__93031;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PSIDatabase_PSIQueryDelegate__groupResultWithDateFilter_datedTokens___block_invoke;
  v12[3] = &unk_1E3676EC8;
  v15 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)wordEmbeddingMatchesForToken:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_lemonadeIsEnabled") & 1) != 0)
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__93030;
    v14 = __Block_byref_object_dispose__93031;
    v15 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__PSIDatabase_PSIQueryDelegate__wordEmbeddingMatchesForToken___block_invoke;
    v7[3] = &unk_1E3676EA0;
    v9 = &v10;
    v7[4] = self;
    v8 = v4;
    -[PSIDatabase _inqSync:](self, "_inqSync:", v7);
    v5 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

- (id)meNodeIdentifier
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__93030;
  v9 = __Block_byref_object_dispose__93031;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PSIDatabase_PSIQueryDelegate__meNodeIdentifier__block_invoke;
  v4[3] = &unk_1E3677C68;
  v4[4] = self;
  v4[5] = &v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)suggestionWhitelistedScenes
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__93030;
  v9 = __Block_byref_object_dispose__93031;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PSIDatabase_PSIQueryDelegate__suggestionWhitelistedScenes__block_invoke;
  v4[3] = &unk_1E3677C68;
  v4[4] = self;
  v4[5] = &v5;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)group:(id)a3 fetchOwningContentString:(BOOL)a4 assetIdRange:(_NSRange)a5 collectionIdRange:(_NSRange)a6 completionHandler:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PSIDatabase *v19;
  id v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  BOOL v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  length = a6.length;
  location = a6.location;
  v9 = a5.length;
  v10 = a5.location;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  if ((self->_options & 1) == 0
    && (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     || (*(_DWORD *)buf = 138412290,
         v27 = CFSTR("expect searchable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) == 0))
    || !self->_databaseIsValid)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__PSIDatabase_PSIQueryDelegate__group_fetchOwningContentString_assetIdRange_collectionIdRange_completionHandler___block_invoke;
  v17[3] = &unk_1E3675710;
  v22 = v9;
  v23 = location;
  v24 = length;
  v18 = v13;
  v19 = self;
  v25 = a4;
  v20 = v14;
  v21 = v10;
  v15 = v14;
  v16 = v13;
  -[PSIDatabase _inqAsync:](self, "_inqAsync:", v17);

}

- (void)fetchAssetUUIDsForAssetIDs:(__CFArray *)a3 creationDateSorted:(BOOL)a4 completionHandler:(id)a5
{
  void (**v8)(id, _QWORD);
  void (**v9)(id, _QWORD);
  _QWORD v10[5];
  id v11;
  __CFArray *v12;
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a5;
  if ((self->_options & 1) == 0
    && (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     || (*(_DWORD *)buf = 138412290,
         v15 = CFSTR("expect searchable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) == 0))
    || !self->_databaseIsValid)
  {
    v8[2](v8, 0);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__PSIDatabase_PSIQueryDelegate__fetchAssetUUIDsForAssetIDs_creationDateSorted_completionHandler___block_invoke;
  v10[3] = &unk_1E3675738;
  v11 = v8;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v9 = v8;
  -[PSIDatabase _inqAsync:](self, "_inqAsync:", v10);

}

- (void)groupsForAssetIds:(__CFArray *)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  if (!a3)
  {
    PLSearchBackendQueryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unexpected NULL assetIds passed to groupsForAssetIds", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
  }
  if (!CFArrayGetCount(a3))
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__93030;
  v20 = __Block_byref_object_dispose__93031;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__93030;
  v14 = __Block_byref_object_dispose__93031;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke;
  v9[3] = &unk_1E3675788;
  v9[4] = self;
  v9[5] = buf;
  v9[6] = &v10;
  v9[7] = a3;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v9);
  if (*((_QWORD *)v17 + 5))
    v8 = *((_QWORD *)v17 + 5);
  else
    v8 = MEMORY[0x1E0C9AA60];
  (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v8, v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(buf, 8);
}

- (void)groupsForCollectionIds:(__CFArray *)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  if (!a3)
  {
    PLSearchBackendQueryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unexpected NULL collectionIds passed to groupsForCollectionIds", buf, 2u);
    }

    goto LABEL_10;
  }
  if (!CFArrayGetCount(a3))
  {
LABEL_10:
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA60], 0);
    goto LABEL_11;
  }
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__93030;
  v20 = __Block_byref_object_dispose__93031;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__93030;
  v14 = __Block_byref_object_dispose__93031;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke;
  v9[3] = &unk_1E3675788;
  v9[4] = self;
  v9[5] = buf;
  v9[6] = &v10;
  v9[7] = a3;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v9);
  if (*((_QWORD *)v17 + 5))
    v7 = *((_QWORD *)v17 + 5);
  else
    v7 = MEMORY[0x1E0C9AA60];
  (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v7, v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(buf, 8);
LABEL_11:

}

- (void)_inqGroupIdsForAssetOrCollectionIds:(__CFArray *)a3 resultType:(unint64_t)a4 completion:(id)a5
{
  id v8;
  CFIndex Count;
  id v10;
  void *v11;
  CFMutableSetRef Mutable;
  CFMutableSetRef v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  CFMutableSetRef v24;
  uint8_t buf[16];

  v8 = a5;
  if (!a3)
  {
    PLSearchBackendQueryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Unexpected NULL PSI identifiers passed to _inqGroupIdsForAssetOrCollectionIds";
LABEL_10:
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    }
LABEL_11:

    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
    goto LABEL_12;
  }
  if (!a4)
  {
    PLSearchBackendQueryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Result type was not specified in _inqGroupIdsForAssetOrCollectionIds";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  Count = CFArrayGetCount(a3);
  v10 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, 0, Count);
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v13 = Mutable;
  v14 = 72;
  if (a4 == 1)
    v14 = 64;
  v15 = *(Class *)((char *)&self->super.isa + v14);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__PSIDatabase_PSIQueryDelegate___inqGroupIdsForAssetOrCollectionIds_resultType_completion___block_invoke;
  v21[3] = &unk_1E36757B0;
  v23 = v10;
  v24 = Mutable;
  v22 = v11;
  v16 = v10;
  v17 = v11;
  v18 = v15;
  -[PSIDatabase executeStatement:withResultEnumerationBlock:](self, "executeStatement:withResultEnumerationBlock:", v18, v21);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  (*((void (**)(id, CFMutableSetRef, id, id))v8 + 2))(v8, v13, v16, v17);

LABEL_12:
}

- (id)searchResultV2WithDateFilter:(id)a3 scopedSearchIdentifiers:(id)a4 searchResultTypes:(unint64_t)a5 suggestionType:(unint64_t)a6
{
  int v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  const void *v19;
  PLSearchSuggestionComponent *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  PLSearchSuggestionComponent *v25;
  PLSearchResultV2 *v26;
  void *v27;
  void *v28;
  void *v29;
  PLSearchResultV2 *v30;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  PSIDatabase *v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  char v41;
  BOOL v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v7 = a5;
  v51[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIDatabase.m"), 5513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateFilter"));

  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __119__PSIDatabase_PSIQueryDelegate__searchResultV2WithDateFilter_scopedSearchIdentifiers_searchResultTypes_suggestionType___block_invoke;
  v36 = &unk_1E36757D8;
  v41 = v7 & 1;
  v39 = &v47;
  v37 = self;
  v13 = v11;
  v38 = v13;
  v40 = &v43;
  v42 = (v7 & 2) != 0;
  -[PSIDatabase _inqSync:](self, "_inqSync:", &v33);
  if ((v7 & 1) != 0)
  {
    -[PSIDatabase assetUUIDsForAssetIDs:](self, "assetUUIDsForAssetIDs:", v48[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "mutableCopy");

  }
  else
  {
    v14 = 0;
  }
  if ((v7 & 2) != 0)
  {
    -[PSIDatabase collectionUUIDsForCollectionIDs:](self, "collectionUUIDsForCollectionIDs:", v44[3]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v17, "mutableCopy");

  }
  else
  {
    v16 = 0;
  }
  v18 = (const void *)v48[3];
  if (v18)
    CFRelease(v18);
  v19 = (const void *)v44[3];
  if (v19)
    CFRelease(v19);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v14, "intersectsSet:", v12);
    objc_msgSend(v16, "intersectsSet:", v12);
  }
  if ((~v7 & 3) != 0)
  {
    if ((v7 & 1) != 0)
    {
      if (objc_msgSend(v14, "count"))
        goto LABEL_21;
      goto LABEL_23;
    }
    if ((v7 & 2) == 0)
      goto LABEL_23;
LABEL_20:
    if (objc_msgSend(v16, "count"))
      goto LABEL_21;
LABEL_23:
    v30 = 0;
    goto LABEL_24;
  }
  if (!objc_msgSend(v14, "count"))
    goto LABEL_20;
LABEL_21:
  v20 = [PLSearchSuggestionComponent alloc];
  objc_msgSend(v13, "displayString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v14, "count");
  v23 = objc_msgSend(v16, "count");
  LODWORD(v24) = 0;
  v25 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v20, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v21, 0, 0, v22, v23, 1102, v24, 0, a6, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v33, v34, v35, v36,
          v37);

  v26 = [PLSearchResultV2 alloc];
  objc_msgSend(v14, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PLSearchResultV2 initWithAssetUUIDs:collectionUUIDs:suggestions:](v26, "initWithAssetUUIDs:collectionUUIDs:suggestions:", v27, v28, v29);

LABEL_24:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v30;
}

- (id)assetUUIDsForAssetIDs:(__CFArray *)a3
{
  void *v5;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[7];
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((self->_options & 1) != 0
      || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)buf = 138412290,
          *(_QWORD *)&buf[4] = CFSTR("expect searchable"),
          _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
          (self->_options & 1) != 0))
    {
      if (self->_databaseIsValid)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v14 = __Block_byref_object_copy__93030;
        v15 = __Block_byref_object_dispose__93031;
        v16 = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __55__PSIDatabase_PSIQueryDelegate__assetUUIDsForAssetIDs___block_invoke;
        v12[3] = &unk_1E3675800;
        v12[5] = buf;
        v12[6] = a3;
        v12[4] = self;
        -[PSIDatabase _inqSync:](self, "_inqSync:", v12);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        _Block_object_dispose(buf, 8);

        return v5;
      }
    }
    PLSearchBackendQueryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid)
        v8 = CFSTR("valid");
      else
        v8 = CFSTR("invalid");
      v9 = CFSTR("yes");
      if ((self->_options & 1) == 0)
        v9 = CFSTR("no");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to fetch asset UUIDs for assetIds. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "No assetIds provided to assetUUIDsForAssetIDs", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)collectionUUIDsForCollectionIDs:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex v6;
  void *v7;
  const void *Value;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  const void *v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    PLSearchBackendQueryGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "No collectionIds provided to collectionUUIDsForCollectionIDs", buf, 2u);
    }

    goto LABEL_21;
  }
  if ((self->_options & 1) == 0
    && (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
     || (*(_DWORD *)buf = 138412290,
         v22 = CFSTR("expect searchable"),
         _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu),
         (self->_options & 1) == 0))
    || !self->_databaseIsValid)
  {
    PLSearchBackendQueryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self->_databaseIsValid)
        v15 = CFSTR("valid");
      else
        v15 = CFSTR("invalid");
      v16 = CFSTR("yes");
      if ((self->_options & 1) == 0)
        v16 = CFSTR("no");
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unable to fetch collection UUIDs for collectionIds. Database is: %{public}@. Options are searchable: %{public}@", buf, 0x16u);
    }

    goto LABEL_21;
  }
  Count = CFArrayGetCount(a3);
  if (!Count)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = Count;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", Count);
  Value = CFDictionaryGetValue(self->_inqPreparedStatements, CFSTR("selectCollectionIdsIn"));
  -[PSIIntArray bindElements:range:](self->_matchingIds, "bindElements:range:", a3, 0, v6);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke;
  v18[3] = &unk_1E3677C40;
  v18[4] = self;
  v20 = Value;
  v9 = v7;
  v19 = v9;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v18);
  -[PSIIntArray unbind](self->_matchingIds, "unbind");
  PLSearchBackendQueryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218240;
    v22 = (const __CFString *)v11;
    v23 = 2048;
    v24 = (const __CFString *)v6;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Fetched %llu collection UUIDs for %ld collectionIds.", buf, 0x16u);
  }

  v12 = (void *)objc_msgSend(v9, "copy");
  return v12;
}

- (void)executeFetchEmbeddingQuery:(id)a3 batchHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PSIDatabase *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke;
  v10[3] = &unk_1E3676290;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[PSIDatabase _inqSync:](self, "_inqSync:", v10);

}

void __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  sqlite3_stmt *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, sqlite3_stmt *);
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  int v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "modelTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queryAssetUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (sqlite3_stmt *)objc_msgSend(v2, "prepareEmbeddingStatement:modelTypes:assetUUID:", 1, v3, v4);

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    v7 = *(void **)(a1 + 40);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke_2;
    v13 = &unk_1E3675828;
    v14 = *(id *)(a1 + 32);
    v17 = v18;
    v8 = v6;
    v15 = v8;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_inqExecutePreparedStatement:withCancelableStatementBlock:", v5, &v10);
    if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled", v10, v11, v12, v13) & 1) == 0)
    {
      if (objc_msgSend(v8, "count"))
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      if (v5 && sqlite3_finalize(v5) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = CFSTR("Failed to finalize statement");
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", buf, 0xCu);
      }
      PLSearchBackendPSIDatabaseGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_INFO, "Embeddings fetched successfully", buf, 2u);
      }

    }
    _Block_object_dispose(v18, 8);

  }
}

uint64_t __73__PSIDatabase_PSIQueryDelegate__executeFetchEmbeddingQuery_batchHandler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v4;
  int v5;
  void *v6;
  double *v7;
  int v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  PLEmbeddingCompareObject *v13;

  v4 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((v4 & 1) == 0)
  {
    v5 = sqlite3_column_int(a2, 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", sqlite3_column_text(a2, 1), 4);
    v7 = (double *)sqlite3_column_blob(a2, 2);
    v8 = sqlite3_column_bytes(a2, 2);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)v8 >> 3);
    if (v8 >= 8)
    {
      if (v8 >> 3 <= 1)
        v10 = 1;
      else
        v10 = (v8 >> 3);
      do
      {
        v11 = *v7++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        --v10;
      }
      while (v10);
    }
    v13 = -[PLEmbeddingCompareObject initWithAssetUUID:vector:]([PLEmbeddingCompareObject alloc], "initWithAssetUUID:vector:", v6, v9);
    -[PLEmbeddingCompareObject setModelType:](v13, "setModelType:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
    if (__ROR8__(0x8F5C28F5C28F5C29 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 1) < 0x51EB851EB851EB9uLL)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    }

  }
  return v4 ^ 1u;
}

void __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke_2;
  v3[3] = &unk_1E3674FA8;
  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_inqExecutePreparedStatement:withStatementBlock:", v2, v3);

}

void __65__PSIDatabase_PSIQueryDelegate__collectionUUIDsForCollectionIDs___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  sqlite3_int64 v5;
  id v6;

  v4 = sqlite3_column_int64(a2, 0);
  v5 = sqlite3_column_int64(a2, 1);
  v6 = (id)PLStringNewFromUUIDComponents(v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __55__PSIDatabase_PSIQueryDelegate__assetUUIDsForAssetIDs___block_invoke(uint64_t a1)
{
  CFIndex Count;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  CFIndex v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", *(_QWORD *)(a1 + 48), 0, Count, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);

  }
  PLSearchBackendQueryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    v8 = 134218240;
    v9 = v7;
    v10 = 2048;
    v11 = Count;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "PSI fetched %llu asset UUIDs for %ld assetIds.", (uint8_t *)&v8, 0x16u);
  }

}

uint64_t __119__PSIDatabase_PSIQueryDelegate__searchResultV2WithDateFilter_scopedSearchIdentifiers_searchResultTypes_suggestionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (*(_BYTE *)(a1 + 64))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_inqNewAssetIdsWithDateFilter:", *(_QWORD *)(a1 + 40));
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  if (*(_BYTE *)(a1 + 65))
    result = objc_msgSend(*(id *)(a1 + 32), "_inqNewCollectionIdsWithDateFilter:", *(_QWORD *)(a1 + 40));
  else
    result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __91__PSIDatabase_PSIQueryDelegate___inqGroupIdsForAssetOrCollectionIds_resultType_completion___block_invoke(uint64_t a1, void *a2)
{
  const void *v3;
  uint64_t v4;
  void *v5;
  void *Mutable;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (const void *)objc_msgSend(v9, "int64AtColumn:", 0);
  v4 = objc_msgSend(v9, "int64AtColumn:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", Mutable, v5);
  }
  objc_msgSend(Mutable, "addObject:", v4);
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 48), v3);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

uint64_t __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke_2;
  v3[3] = &unk_1E3675760;
  v4 = *(_OWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 48);
  return objc_msgSend((id)v4, "_inqGroupIdsForAssetOrCollectionIds:resultType:completion:", v1, 2, v3);
}

void __67__PSIDatabase_PSIQueryDelegate__groupsForCollectionIds_completion___block_invoke_2(uint64_t a1, const void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CFTypeRef cf;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CFRange v34;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a2)
  {
    v25 = a3;
    cf = a2;
    v27 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", a2, 0, 0, 2, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = a1;
    v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId", v24));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v34.length = CFArrayGetCount((CFArrayRef)v23);
            v34.location = 0;
            CFArraySortValues((CFMutableArrayRef)v23, v34, (CFComparatorFunction)PSIRowIDCompare_93036, 0);
            objc_msgSend(v18, "setCollectionIds:", v23);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v24 + 48) + 8) + 40), v25);
    CFRelease(cf);
    v8 = v27;
  }

}

uint64_t __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke_2;
  v3[3] = &unk_1E3675760;
  v4 = *(_OWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 48);
  return objc_msgSend((id)v4, "_inqGroupIdsForAssetOrCollectionIds:resultType:completion:", v1, 1, v3);
}

void __62__PSIDatabase_PSIQueryDelegate__groupsForAssetIds_completion___block_invoke_2(uint64_t a1, const void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CFTypeRef cf;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CFRange v34;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a2)
  {
    v25 = a3;
    cf = a2;
    v27 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", a2, 0, 0, 1, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = a1;
    v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId", v24));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "groupId"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v34.length = CFArrayGetCount((CFArrayRef)v23);
            v34.location = 0;
            CFArraySortValues((CFMutableArrayRef)v23, v34, (CFComparatorFunction)PSIRowIDCompare_93036, 0);
            objc_msgSend(v18, "setAssetIds:", v23);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v24 + 48) + 8) + 40), v25);
    CFRelease(cf);
    v8 = v27;
  }

}

void __97__PSIDatabase_PSIQueryDelegate__fetchAssetUUIDsForAssetIDs_creationDateSorted_completionHandler___block_invoke(uint64_t a1)
{
  CFIndex Count;
  uint64_t v3;
  id v4;

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", *(_QWORD *)(a1 + 48), 0, Count, *(unsigned __int8 *)(a1 + 56));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __113__PSIDatabase_PSIQueryDelegate__group_fetchOwningContentString_assetIdRange_collectionIdRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "assetIds");
  v3 = objc_msgSend(*(id *)(a1 + 32), "collectionIds");
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 80);
  if (v4 <= v5)
    v6 = *(_QWORD *)(a1 + 80);
  else
    v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "prepareForNumberOfElements:", v6);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_inqAssetUUIDsForAssetIds:range:creationDateSorted:", v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "_inqCollectionResultsForCollectionIds:range:", v3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v9 = 0;
    if (v5)
      goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_9:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "unprepare");
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "_inqOwningContentStringForGroupResult:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__PSIDatabase_PSIQueryDelegate__suggestionWhitelistedScenes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", CFSTR("SceneWhitelist"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__PSIDatabase_PSIQueryDelegate__meNodeIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", CFSTR("MePersonUUID"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__PSIDatabase_PSIQueryDelegate__wordEmbeddingMatchesForToken___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 40), "matchesForToken:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__PSIDatabase_PSIQueryDelegate__groupResultWithDateFilter_datedTokens___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupResultWithDateFilter:datedTokens:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke(uint64_t a1)
{
  char *v2;
  sqlite3_stmt *Value;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  int v10;
  __int128 buf;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = _newUTF8String(*(void **)(a1 + 32), &v10);
  Value = (sqlite3_stmt *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("selectLookupGroupIdLimit1"));
  if (sqlite3_bind_text(Value, 1, v2, v10, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = CFSTR("Failed to bind parameter");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke_804;
  v9[3] = &unk_1E3674FF0;
  v9[4] = &buf;
  objc_msgSend(v4, "_inqExecutePreparedStatement:withStatementBlock:", Value, v9);
  v5 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_inqGroupWithMatchingGroupId:dateFilter:searchResultTypes:", v5, 0, *(_QWORD *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  if (v2)
    free(v2);
  _Block_object_dispose(&buf, 8);
}

sqlite3_int64 __76__PSIDatabase_PSIQueryDelegate__groupForLookupIdentifier_searchResultTypes___block_invoke_804(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result;

  result = sqlite3_column_int64(a2, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __87__PSIDatabase_PSIQueryDelegate__groupWithMatchingGroupId_dateFilter_searchResultTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupWithMatchingGroupId:dateFilter:searchResultTypes:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __84__PSIDatabase_PSIQueryDelegate__groupIdsMatchingString_categories_textIsSearchable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqNewGroupIdsMatchingString:categories:textIsSearchable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __81__PSIDatabase_PSIQueryDelegate__groupsFromGroupIds_dateFilter_searchResultTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupsWithMatchingGroupIds:dateFilter:includeObjects:searchResultTypes:matchingPredicateBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 64), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __103__PSIDatabase_PSIQueryDelegate__groupArraysFromGroupIdSets_dateFilter_searchResultTypes_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqGroupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "searchTextExtendedRangeForParse:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v9;
  v10 = objc_msgSend(v6, "numberOfTokens");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10 > 6;
  *a4 = 1;
}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_797(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "searchTextExtendedRangeForParse:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    || (*(_BYTE *)(a1 + 80) & 1) != 0
    || ((v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
         v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
         v13 = *(_QWORD *)(v10 + 32),
         v12 = *(_QWORD *)(v10 + 40),
         v15 = *(_QWORD *)(v11 + 32),
         v14 = *(_QWORD *)(v11 + 40),
         v13 == v15)
      ? (v16 = v12 == v14)
      : (v16 = 0),
        v16))
  {
    v17 = os_signpost_id_generate(*(os_log_t *)(a1 + 40));
    v18 = *(id *)(a1 + 40);
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "SearchIndex - executeQuery - queryProcessParse", ", (uint8_t *)&v26, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "processParse:disableWildcardMatchesForUserControlledCategories:", v6, *(unsigned __int8 *)(a1 + 88));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(id *)(a1 + 40);
    v22 = v21;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_END, v17, "SearchIndex - executeQuery - queryProcessParse", ", (uint8_t *)&v26, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v20);
    PLSearchBackendPSIDatabaseGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = objc_msgSend(*(id *)(a1 + 48), "count");
      v26 = 138412546;
      v27 = v24;
      v28 = 2050;
      v29 = v25;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "Enumerate parses with mode base parse for query: %@ generated group results: %{public}lu", (uint8_t *)&v26, 0x16u);
    }

  }
  else
  {
    *a4 = 1;
  }

}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_798(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  v5 = os_signpost_id_generate(v3);
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SearchIndex - executeQuery - queryProcessParse", ", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "processParse:disableWildcardMatchesForUserControlledCategories:", v4, *(unsigned __int8 *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(id *)(a1 + 32);
  v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v5, "SearchIndex - executeQuery - queryProcessParse", ", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v8);
  PLSearchBackendPSIDatabaseGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(*(id *)(a1 + 48), "count");
    v15 = 134349570;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2050;
    v20 = v14;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Enumerate parses with mode %{public}lu for query: %@ generated group results: %{public}lu", (uint8_t *)&v15, 0x20u);
  }

}

void __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_799(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "processParse:disableWildcardMatchesForUserControlledCategories:", a2, *(unsigned __int8 *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);
  *a4 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");

}

uint64_t __112__PSIDatabase_PSIQueryDelegate___executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke_801(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqRecycleGroups");
}

uint64_t __111__PSIDatabase_PSIQueryDelegate__executeQuery_disableWildcardMatchesForUserControlledCategories_resultsHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeQuery:disableWildcardMatchesForUserControlledCategories:resultsHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "searchTextExtendedRangeForParse:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v9;
  v10 = objc_msgSend(v6, "numberOfTokens");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10 > 6;
  *a4 = 1;
}

void __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend((id)objc_opt_class(), "searchTextExtendedRangeForParse:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (*(_BYTE *)(a1 + 72) & 1) != 0
    || ((v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8),
         v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
         v13 = *(_QWORD *)(v10 + 32),
         v12 = *(_QWORD *)(v10 + 40),
         v15 = *(_QWORD *)(v11 + 32),
         v14 = *(_QWORD *)(v11 + 40),
         v13 == v15)
      ? (v16 = v12 == v14)
      : (v16 = 0),
        v16))
  {
    objc_msgSend(*(id *)(a1 + 32), "processParseV2:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = *(void **)(v18 + 40);
    v19 = (id *)(v18 + 40);
    v20 = v21;
    if (v21)
      objc_msgSend(v20, "mergeWithSearchResult:", v17);
    else
      objc_storeStrong(v19, v17);
    PLSearchBackendQueryGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v25 = 138412546;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Enumerate parses with mode base parse for query: %@ generated search result: %@", (uint8_t *)&v25, 0x16u);
    }

  }
  else
  {
    *a4 = 1;
  }

}

void __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_793(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "processParseV2:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    objc_msgSend(v6, "mergeWithSearchResult:", v3);
  else
    objc_storeStrong(v5, v3);
  PLSearchBackendQueryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = 134218498;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Enumerate parses with mode: %llu for query: %@ generated search result: %@", (uint8_t *)&v12, 0x20u);
  }

}

uint64_t __64__PSIDatabase_PSIQueryDelegate___executeQueryV2_resultsHandler___block_invoke_794(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqRecycleGroups");
}

uint64_t __63__PSIDatabase_PSIQueryDelegate__executeQueryV2_resultsHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeQueryV2:resultsHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
