@implementation SHJSONLClusterImporter

- (BOOL)createTables:(sqlite3 *)a3 error:(id *)a4
{
  return +[SHSQLiteUtils runNoResultSQL:onDatabase:error:](SHSQLiteUtils, "runNoResultSQL:onDatabase:error:", CFSTR("CREATE TABLE if not exists Cohesion(id INTEGER PRIMARY KEY, high INTEGER, medium INTEGER, low INTEGER, CONSTRAINT constraint_name UNIQUE(low, medium, high) ON CONFLICT IGNORE)"), a3, a4)&& +[SHSQLiteUtils runNoResultSQL:onDatabase:error:](SHSQLiteUtils, "runNoResultSQL:onDatabase:error:", CFSTR("CREATE TABLE if not exists MediaItems(sh_appleMusicID VARCHAR, cohesion INTEGER, FOREIGN KEY(cohesion) REFERENCES Cohesion(id))"), a3, a4)&& +[SHSQLiteUtils runNoResultSQL:onDatabase:error:](SHSQLiteUtils, "runNoResultSQL:onDatabase:error:", CFSTR("CREATE TABLE if not exists Metadata(type VARCHAR, hash VARCHAR, storefront VARCHAR, creationDate DATE)"), a3, a4);
}

- (int64_t)insert:(sqlite3 *)a3 low:(int)a4 medium:(int)a5 high:(int)a6
{
  int64_t v9;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, (const char *)objc_msgSend(CFSTR("INSERT INTO Cohesion (low, medium, high) VALUES (?, ?, ?) returning id"), "cStringUsingEncoding:", 4), -1, &ppStmt, 0)|| (sqlite3_bind_int(ppStmt, 1, a4), sqlite3_bind_int(ppStmt, 2, a5), sqlite3_bind_int(ppStmt, 3, a6), sqlite3_step(ppStmt) != 100))
  {
    v9 = -1;
  }
  else
  {
    v9 = sqlite3_column_int(ppStmt, 0);
  }
  sqlite3_finalize(ppStmt);
  return v9;
}

- (BOOL)insert:(sqlite3 *)a3 appleMusicID:(id)a4 cohesionID:(int64_t)a5
{
  id v7;
  BOOL v8;
  sqlite3_stmt *ppStmt;

  v7 = a4;
  ppStmt = 0;
  if (sqlite3_prepare_v2(a3, (const char *)objc_msgSend(CFSTR("INSERT INTO MediaItems (sh_appleMusicID, cohesion) VALUES (?, ?);"),
                         "cStringUsingEncoding:",
                         4),
         -1,
         &ppStmt,
         0))
  {
    v8 = 0;
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4), -1, 0);
    sqlite3_bind_int64(ppStmt, 2, a5);
    v8 = sqlite3_step(ppStmt) == 101;
  }
  sqlite3_finalize(ppStmt);

  return v8;
}

- (BOOL)loadDataFromFileInfo:(id)a3 withMetadata:(id)a4 toDestinationURL:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SHClusterJSONLReader *v14;
  void *v15;
  BOOL v16;
  id v17;
  _BOOL4 v18;
  SHClusterJSONLReader *v19;
  BOOL v20;
  SHClusterJSONLReader *v22;
  _QWORD v23[6];
  id v24;
  uint64_t v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[SHClusterImporterUtils buildTemporaryClusterURLWithError:](SHClusterImporterUtils, "buildTemporaryClusterURLWithError:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_11;
  v25 = 0;
  +[SHSQLiteUtils createDatabase:atURL:error:](SHSQLiteUtils, "createDatabase:atURL:error:", &v25, v13, a6);
  if (!v25)
    goto LABEL_11;
  if (!-[SHJSONLClusterImporter createTables:error:](self, "createTables:error:", v25, a6))
  {
    +[SHClusterImporterUtils clearTemporaryDatabaseFileAtURL:withError:](SHClusterImporterUtils, "clearTemporaryDatabaseFileAtURL:withError:", v13, 0);
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  +[SHSQLiteUtils startTransactionOnDatabase:](SHSQLiteUtils, "startTransactionOnDatabase:", v25);
  v14 = objc_alloc_init(SHClusterJSONLReader);
  objc_msgSend(v10, "dataFilePathURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v23[1] = 3221225472;
  v23[2] = __83__SHJSONLClusterImporter_loadDataFromFileInfo_withMetadata_toDestinationURL_error___block_invoke;
  v23[3] = &unk_24DCD23F8;
  v23[4] = self;
  v23[5] = v25;
  v22 = v14;
  v23[0] = MEMORY[0x24BDAC760];
  v16 = -[SHClusterJSONLReader readDataLineByLineFromURL:error:callback:](v14, "readDataLineByLineFromURL:error:callback:", v15, &v24, v23);
  v17 = v24;

  +[SHSQLiteUtils commitTransactionOnDatabase:](SHSQLiteUtils, "commitTransactionOnDatabase:", v25);
  if (a6 && v17)
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", v25, 0);
  if (v16)
  {
    v18 = +[SHClusterImporterUtils copyDatabaseFromURL:toDatabaseDestinationURL:error:](SHClusterImporterUtils, "copyDatabaseFromURL:toDatabaseDestinationURL:error:", v13, v12, a6);
    +[SHClusterImporterUtils clearTemporaryDatabaseFileAtURL:withError:](SHClusterImporterUtils, "clearTemporaryDatabaseFileAtURL:withError:", v13, 0);
    v19 = v22;
    v20 = v18
       && +[SHClusterMetadataQuery writeMetadata:toDatabaseAtLocation:error:](SHClusterMetadataQuery, "writeMetadata:toDatabaseAtLocation:error:", v11, v12, a6);
  }
  else
  {
    +[SHClusterImporterUtils clearTemporaryDatabaseFileAtURL:withError:](SHClusterImporterUtils, "clearTemporaryDatabaseFileAtURL:withError:", v13, 0);
    v20 = 0;
    v19 = v22;
  }

LABEL_12:
  return v20;
}

void __83__SHJSONLClusterImporter_loadDataFromFileInfo_withMetadata_toDestinationURL_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = objc_msgSend(*(id *)(a1 + 32), "insert:low:medium:high:", *(_QWORD *)(a1 + 40), objc_msgSend(a4, "intValue"), objc_msgSend(v10, "intValue"), objc_msgSend(v9, "intValue"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(a1 + 32), "insert:appleMusicID:cohesionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v12, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

@end
