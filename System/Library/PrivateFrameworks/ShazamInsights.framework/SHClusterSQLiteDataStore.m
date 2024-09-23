@implementation SHClusterSQLiteDataStore

+ (BOOL)sqliteDatabaseExistsAtURL:(id)a3
{
  BOOL v3;
  uint64_t v5;

  v5 = 0;
  if (+[SHSQLiteUtils openDatabase:atURL:error:](SHSQLiteUtils, "openDatabase:atURL:error:", &v5, a3, 0))
  {
    v3 = +[SHSQLiteUtils database:hasPopulatedTable:error:](SHSQLiteUtils, "database:hasPopulatedTable:error:", v5, CFSTR("Cohesion"), 0);
  }
  else
  {
    v3 = 0;
  }
  +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", v5, 0);
  return v3;
}

- (SHClusterSQLiteDataStore)initWithClusterType:(int64_t)a3 databaseMaxAge:(double)a4 forStorefront:(id)a5 databaseFilePathURL:(id)a6
{
  id v11;
  id v12;
  SHClusterSQLiteDataStore *v13;
  SHClusterSQLiteDataStore *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SHClusterSQLiteDataStore;
  v13 = -[SHClusterSQLiteDataStore init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_clusterType = a3;
    objc_storeStrong((id *)&v13->_databaseFilePathURL, a6);
    v14->_databaseMaxAge = a4;
    objc_storeStrong((id *)&v14->_requiredStorefront, a5);
  }

  return v14;
}

- (BOOL)isDataValid
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)MEMORY[0x24BDBCE60];
  -[SHClusterSQLiteDataStore databaseMaxAge](self, "databaseMaxAge");
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:", -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SHClusterSQLiteDataStore isDataLoaded](self, "isDataLoaded"))
  {
    -[SHClusterSQLiteDataStore requiredStorefront](self, "requiredStorefront");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SHClusterSQLiteDataStore hasNotPassedExpiryDate:isForCountryCode:](self, "hasNotPassedExpiryDate:isForCountryCode:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasNotPassedExpiryDate:(id)a3 isForCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  -[SHClusterSQLiteDataStore databaseFilePathURL](self, "databaseFilePathURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHClusterMetadataQuery metadataFromDatabaseAtLocation:error:](SHClusterMetadataQuery, "metadataFromDatabaseAtLocation:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && -[SHClusterSQLiteDataStore isDataLoaded](self, "isDataLoaded"))
  {
    objc_msgSend(v9, "storefront");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v7))
    {
      objc_msgSend(v9, "creationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "laterDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "creationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v15 = objc_msgSend(v9, "clusterType");
        v14 = v15 == -[SHClusterSQLiteDataStore clusterType](self, "clusterType");
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isDataLoaded
{
  void *v2;
  BOOL v3;
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  -[SHClusterSQLiteDataStore databaseFilePathURL](self, "databaseFilePathURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v3 = +[SHSQLiteUtils openDatabase:atURL:error:](SHSQLiteUtils, "openDatabase:atURL:error:", &v12, v2, &v11);
  v4 = v11;

  if (v3)
  {
    v10 = v4;
    v5 = +[SHSQLiteUtils database:hasPopulatedTable:error:](SHSQLiteUtils, "database:hasPopulatedTable:error:", v12, CFSTR("Cohesion"), &v10);
    v6 = v10;

    if (!v5)
    {
      sh_log_object();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_21A508000, v7, OS_LOG_TYPE_ERROR, "Failed to check database load status %@", buf, 0xCu);
      }

    }
    +[SHSQLiteUtils closeDatabase:error:](SHSQLiteUtils, "closeDatabase:error:", v12, 0);
    v4 = v6;
  }
  else
  {
    sh_log_object();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_21A508000, v8, OS_LOG_TYPE_ERROR, "Failed to check database load status %@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (SHClusterStatus)dataStatus
{
  SHClusterStatus *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SHClusterStatus);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHClusterSQLiteDataStore databaseFilePathURL](self, "databaseFilePathURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

  if (v7)
  {
    if (-[SHClusterSQLiteDataStore isDataLoaded](self, "isDataLoaded"))
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  -[SHClusterStatus setLoadStatus:](v3, "setLoadStatus:", v8);
  -[SHClusterSQLiteDataStore databaseFilePathURL](self, "databaseFilePathURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHClusterStatus setDataURL:](v3, "setDataURL:", v9);

  if (-[SHClusterStatus loadStatus](v3, "loadStatus") == 1)
  {
    -[SHClusterStatus setIsDataValid:](v3, "setIsDataValid:", -[SHClusterSQLiteDataStore isDataValid](self, "isDataValid"));
    -[SHClusterSQLiteDataStore databaseFilePathURL](self, "databaseFilePathURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    +[SHClusterMetadataQuery metadataFromDatabaseAtLocation:error:](SHClusterMetadataQuery, "metadataFromDatabaseAtLocation:error:", v10, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;

    if (v11)
    {
      -[SHClusterStatus setMetadata:](v3, "setMetadata:", v11);
    }
    else
    {
      sh_log_object();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_21A508000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

    }
  }
  return v3;
}

- (double)databaseMaxAge
{
  return self->_databaseMaxAge;
}

- (NSURL)databaseFilePathURL
{
  return self->_databaseFilePathURL;
}

- (int64_t)clusterType
{
  return self->_clusterType;
}

- (NSString)requiredStorefront
{
  return self->_requiredStorefront;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredStorefront, 0);
  objc_storeStrong((id *)&self->_databaseFilePathURL, 0);
}

@end
