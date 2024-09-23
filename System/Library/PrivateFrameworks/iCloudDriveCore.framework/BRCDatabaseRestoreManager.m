@implementation BRCDatabaseRestoreManager

- (BRCDatabaseRestoreManager)initWithUserURL:(id)a3
{
  id v5;
  BRCDatabaseRestoreManager *v6;
  BRCDatabaseRestoreManager *v7;
  uint64_t v8;
  NSURL *clientDatabaseURL;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCDatabaseRestoreManager;
  v6 = -[BRCDatabaseRestoreManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userURL, a3);
    -[NSURL URLByAppendingPathComponent:](v7->_userURL, "URLByAppendingPathComponent:", CFSTR("Library/Application Support/CloudDocs/session/db/client.db"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientDatabaseURL = v7->_clientDatabaseURL;
    v7->_clientDatabaseURL = (NSURL *)v8;

    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[NSURL path](v7->_clientDatabaseURL, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_INFO, "[INFO] Initializing restore manager with %@%@", buf, 0x16u);

    }
  }

  return v7;
}

- (void)restoreWithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  BRCDatabaseBackupManager *v5;
  void *v6;
  BRCDatabaseBackupStorage *v7;
  void *v8;
  NSURL *clientDatabaseURL;
  BOOL v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[BRCDatabaseBackupManager initWithUserURL:outputUserURL:]([BRCDatabaseBackupManager alloc], "initWithUserURL:outputUserURL:", self->_userURL, self->_userURL);
  -[BRCDatabaseBackupManager databaseURL](v5, "databaseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCDatabaseBackupStorage initWithDatabaseURL:]([BRCDatabaseBackupStorage alloc], "initWithDatabaseURL:", v6);
  -[NSURL path](self->_userURL, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDatabaseBackupStorage populateNewColumnsWithBasePath:](v7, "populateNewColumnsWithBasePath:", v8);
  clientDatabaseURL = self->_clientDatabaseURL;
  v23 = 0;
  v10 = -[BRCDatabaseBackupStorage attachDatabase:error:](v7, "attachDatabase:error:", clientDatabaseURL, &v23);
  v11 = v23;
  if (v10)
  {
    if (-[BRCDatabaseBackupStorage updateAttachedDatabase](v7, "updateAttachedDatabase"))
    {
      -[NSURL URLByAppendingPathComponent:isDirectory:](self->_userURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Application Support/CloudDocs/"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v11;
      v13 = BRCRecursivelyChangeOwnerAndGroupToMobile(v12, &v22);
      v14 = v22;

      if (v13)
      {

        -[BRCDatabaseBackupManager cleanOnDisk](v5, "cleanOnDisk");
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_INFO, "[INFO] Calling completion block with success.%@", buf, 0xCu);
        }

        v4[2](v4, 1, 0);
        v7 = 0;
      }
      else
      {
        ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v14);
      }
      v11 = v14;
    }
    else
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[BRCDatabaseRestoreManager restoreWithCompletionBlock:].cold.1((uint64_t)v7, (uint64_t)v19, v20);

      v4[2](v4, 0, 0);
    }
  }
  else
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      -[NSURL path](self->_clientDatabaseURL, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v21;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] Unable to attach db %@: %@%@", buf, 0x20u);

    }
    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v11);
  }

}

- (NSURL)userURL
{
  return self->_userURL;
}

- (void)setUserURL:(id)a3
{
  objc_storeStrong((id *)&self->_userURL, a3);
}

- (NSURL)clientDatabaseURL
{
  return self->_clientDatabaseURL;
}

- (void)setClientDatabaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_clientDatabaseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDatabaseURL, 0);
  objc_storeStrong((id *)&self->_userURL, 0);
}

- (void)restoreWithCompletionBlock:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] Failed to update attached database %@%@", (uint8_t *)&v3, 0x16u);
}

@end
