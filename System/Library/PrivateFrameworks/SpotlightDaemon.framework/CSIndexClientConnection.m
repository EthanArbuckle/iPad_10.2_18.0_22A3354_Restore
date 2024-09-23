@implementation CSIndexClientConnection

- (CSIndexClientConnection)initWithConfiguration:(id)a3 indexer:(id)a4
{
  id v7;
  id v8;
  CSIndexClientConnection *v9;
  CSIndexClientConnection *v10;
  id *p_configuration;
  void *v12;
  MDSearchableIndexService *v13;
  MDSearchableIndexService *service;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CSIndexClientConnection *v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CSIndexClientConnection;
  v9 = -[CSIndexClientConnection init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    p_configuration = (id *)&v9->_configuration;
    objc_storeStrong((id *)&v9->_configuration, a3);
    -[SDConnectionConfiguration bundleID](v10->_configuration, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else if ((objc_msgSend(*p_configuration, "internal") & 1) == 0)
    {
      logForCSLogCategoryDefault();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CSIndexClientConnection initWithConfiguration:indexer:].cold.1(v7);
      v21 = v10;
      v10 = 0;
      goto LABEL_10;
    }
    v13 = objc_alloc_init(MDSearchableIndexService);
    service = v10->_service;
    v10->_service = v13;

    -[MDSearchableIndexService setIndexer:](v10->_service, "setIndexer:", v8);
    -[SDConnectionConfiguration bundleID](v10->_configuration, "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SDConnectionConfiguration bundleID](v10->_configuration, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDSearchableIndexService setClientBundleID:](v10->_service, "setClientBundleID:", v16);

    }
    objc_msgSend(*p_configuration, "personaID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[SDConnectionConfiguration personaID](v10->_configuration, "personaID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDSearchableIndexService setClientPersonaID:](v10->_service, "setClientPersonaID:", v18);

    }
    -[MDSearchableIndexService setIsInternal:](v10->_service, "setIsInternal:", -[SDConnectionConfiguration internal](v10->_configuration, "internal"));
    -[MDSearchableIndexService setIsPrivate:](v10->_service, "setIsPrivate:", -[SDConnectionConfiguration isPrivate](v10->_configuration, "isPrivate"));
    -[MDSearchableIndexService setSearchInternal:](v10->_service, "setSearchInternal:", -[SDConnectionConfiguration searchInternal](v10->_configuration, "searchInternal"));
    -[MDSearchableIndexService setIsExtension:](v10->_service, "setIsExtension:", objc_msgSend(v7, "isExtension"));
    -[MDSearchableIndexService setAllowMail:](v10->_service, "setAllowMail:", -[SDConnectionConfiguration allowMail](v10->_configuration, "allowMail"));
    -[MDSearchableIndexService setAllowPhotosLibraryDeletion:](v10->_service, "setAllowPhotosLibraryDeletion:", -[SDConnectionConfiguration allowPhotosLibraryDeletion](v10->_configuration, "allowPhotosLibraryDeletion"));
    -[MDSearchableIndexService setAllowOpenJournalFile:](v10->_service, "setAllowOpenJournalFile:", -[SDConnectionConfiguration allowOpenJournalFile](v10->_configuration, "allowOpenJournalFile"));
    -[MDSearchableIndexService setAllowNotifications:](v10->_service, "setAllowNotifications:", -[SDConnectionConfiguration allowNotifications](v10->_configuration, "allowNotifications"));
    -[MDSearchableIndexService setEntitledAttributes:](v10->_service, "setEntitledAttributes:", -[SDConnectionConfiguration entitledAttributes](v10->_configuration, "entitledAttributes"));
    -[MDSearchableIndexService setQuotaDisabled:](v10->_service, "setQuotaDisabled:", -[SDConnectionConfiguration quotaDisabled](v10->_configuration, "quotaDisabled"));
    -[SDConnectionConfiguration protectionClass](v10->_configuration, "protectionClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDSearchableIndexService setProtectionClass:](v10->_service, "setProtectionClass:", v19);

    -[MDSearchableIndexService setClientUID:](v10->_service, "setClientUID:", -[SDConnectionConfiguration euid](v10->_configuration, "euid"));
    -[SDConnectionConfiguration connection](v10->_configuration, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDSearchableIndexService setClientConnection:](v10->_service, "setClientConnection:", v20);

    objc_msgSend(CFSTR("com.apple.spotlight.IndexAgent"), "stringByAppendingFormat:", CFSTR(".queue.client.%d"), -[SDConnectionConfiguration pid](v10->_configuration, "pid"));
    v21 = (CSIndexClientConnection *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)-[CSIndexClientConnection UTF8String](v21, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    -[MDSearchableIndexService setClientQueue:](v10->_service, "setClientQueue:", v24);

LABEL_10:
  }

  return v10;
}

- (SDConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (MDSearchableIndexService)service
{
  return self->_service;
}

- (CSIndexClientConnection)initWithConnection:(id)a3 indexer:(id)a4
{
  id v6;
  id v7;
  CSIndexClientConnection *v8;
  SDConnectionConfiguration *v9;
  void *v10;
  MDSearchableIndexService *v11;
  MDSearchableIndexService *service;
  void *v13;
  void *v14;
  void *v15;
  CSIndexClientConnection *v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSIndexClientConnection;
  v8 = -[CSIndexClientConnection init](&v21, sel_init);
  if (v8)
  {
    v9 = -[SDConnectionConfiguration initWithConnection:isPrivate:]([SDConnectionConfiguration alloc], "initWithConnection:isPrivate:", v6, 0);
    objc_storeStrong((id *)&v8->_configuration, v9);
    -[SDConnectionConfiguration bundleID](v9, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else if (!-[SDConnectionConfiguration internal](v9, "internal"))
    {
      logForCSLogCategoryDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:].cold.1((uint64_t)v6, v18);
      v16 = v8;
      v8 = 0;
      goto LABEL_8;
    }
    v11 = objc_alloc_init(MDSearchableIndexService);
    service = v8->_service;
    v8->_service = v11;

    -[MDSearchableIndexService setIndexer:](v8->_service, "setIndexer:", v7);
    -[SDConnectionConfiguration bundleID](v9, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SDConnectionConfiguration bundleID](v9, "bundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDSearchableIndexService setClientBundleID:](v8->_service, "setClientBundleID:", v14);

    }
    -[MDSearchableIndexService setIsInternal:](v8->_service, "setIsInternal:", -[SDConnectionConfiguration internal](v9, "internal"));
    -[MDSearchableIndexService setIsPrivate:](v8->_service, "setIsPrivate:", -[SDConnectionConfiguration isPrivate](v8->_configuration, "isPrivate"));
    -[MDSearchableIndexService setSearchInternal:](v8->_service, "setSearchInternal:", -[SDConnectionConfiguration searchInternal](v9, "searchInternal"));
    -[MDSearchableIndexService setIsExtension:](v8->_service, "setIsExtension:", -[SDConnectionConfiguration isExtension](v9, "isExtension"));
    -[MDSearchableIndexService setQuotaDisabled:](v8->_service, "setQuotaDisabled:", -[SDConnectionConfiguration quotaDisabled](v9, "quotaDisabled"));
    -[SDConnectionConfiguration protectionClass](v9, "protectionClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDSearchableIndexService setProtectionClass:](v8->_service, "setProtectionClass:", v15);

    -[MDSearchableIndexService setClientUID:](v8->_service, "setClientUID:", -[SDConnectionConfiguration euid](v9, "euid"));
    -[MDSearchableIndexService setClientConnection:](v8->_service, "setClientConnection:", v6);
    objc_msgSend(CFSTR("com.apple.spotlight.IndexAgent"), "stringByAppendingFormat:", CFSTR(".queue.client.%d"), -[SDConnectionConfiguration pid](v9, "pid"));
    v16 = (CSIndexClientConnection *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)-[CSIndexClientConnection UTF8String](v16, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v17, v18);
    -[MDSearchableIndexService setClientQueue:](v8->_service, "setClientQueue:", v19);

LABEL_8:
  }

  return v8;
}

- (BOOL)quotaDisabled
{
  return self->_quotaDisabled;
}

- (void)initWithConfiguration:(void *)a1 indexer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "Could not resolve bundle from %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

@end
