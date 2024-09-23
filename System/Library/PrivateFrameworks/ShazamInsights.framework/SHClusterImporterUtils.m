@implementation SHClusterImporterUtils

+ (id)cachesDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.ShazamInsights"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)buildTemporaryClusterURLWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[8];
  uint64_t v19;

  objc_msgSend(a1, "cachesDirectory", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = 0,
        v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v19),
        v8,
        (v9 & 1) != 0))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_temp"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "cachesDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("unknown"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sh_log_object();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A508000, v13, OS_LOG_TYPE_ERROR, "Failed to create the caches directory!", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

+ (BOOL)copyDatabaseFromURL:(id)a3 toDatabaseDestinationURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
  {
    if (+[SHClusterSQLiteDataStore sqliteDatabaseExistsAtURL:](SHClusterSQLiteDataStore, "sqliteDatabaseExistsAtURL:", v7)&& +[SHClusterSQLiteDataStore sqliteDatabaseExistsAtURL:](SHClusterSQLiteDataStore, "sqliteDatabaseExistsAtURL:", v8))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v11 = objc_msgSend(v10, "removeItemAtURL:error:", v8, &v23);
      v12 = v23;

      if ((v11 & 1) == 0)
      {
        if (a5)
        {
          +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, v12);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        sh_log_object();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v12;
          _os_log_impl(&dword_21A508000, v14, OS_LOG_TYPE_ERROR, "Failed to delete existing database %@", buf, 0xCu);
        }
        goto LABEL_15;
      }
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v14, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, a5);

      if (!v9)
      {
        v12 = v13;
        goto LABEL_17;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    LOBYTE(v9) = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v7, v8, &v22);
    v12 = v22;

    if (!a5 || (v9 & 1) != 0)
      goto LABEL_17;
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    sh_log_object();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_21A508000, v20, OS_LOG_TYPE_ERROR, "Failed to move database into place %@", buf, 0xCu);
    }

LABEL_15:
    LOBYTE(v9) = 0;
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v9) = 1;
LABEL_18:

  return v9;
}

+ (BOOL)clearTemporaryDatabaseFileAtURL:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  id v11;
  id v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v5, &v13);
    v11 = v13;

    if ((v10 & 1) == 0 && a4)
    {
      +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 201, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (id)importerForFile:(id)a3
{
  void *v3;
  _BOOL4 v4;
  __objc2_class **v5;

  objc_msgSend(a3, "dataFilePathURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[SHClusterSQLiteDataStore sqliteDatabaseExistsAtURL:](SHClusterSQLiteDataStore, "sqliteDatabaseExistsAtURL:", v3);

  v5 = &off_24DCD2020;
  if (!v4)
    v5 = &off_24DCD1FF0;
  return objc_alloc_init(*v5);
}

@end
