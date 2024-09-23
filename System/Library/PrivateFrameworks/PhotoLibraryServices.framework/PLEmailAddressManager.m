@implementation PLEmailAddressManager

- (PLEmailAddressManager)initWithPathManager:(id)a3 lazyAssetsdClient:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PLEmailAddressManager *v11;
  PLEmailAddressManager *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEmailAddressManager.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLEmailAddressManager.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lazyAssetsdClient"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PLEmailAddressManager;
  v11 = -[PLEmailAddressManager init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pathManager, a3);
    objc_storeStrong((id *)&v12->_lazyAssetsdClient, a4);
  }

  return v12;
}

- (id)assetsdClient
{
  return (id)-[PLLazyObject objectValue](self->_lazyAssetsdClient, "objectValue");
}

- (id)plistPath
{
  return (id)-[PLPhotoLibraryPathManager photoDirectoryWithType:additionalPathComponents:](self->_pathManager, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("cloudSharedEmails.plist"));
}

- (id)keyForEmailAddress:(id)a3
{
  id v4;
  PLEmailAddressManager *v5;
  void *v6;
  PLEmailAddressManager *v7;
  void *v8;
  void *v9;
  PLEmailAddressManager *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  PLEmailAddressManager *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_27;
  }
  v5 = self;
  objc_sync_enter(v5);
  -[PLEmailAddressManager _loadDictionariesIfNeeded](v5, "_loadDictionariesIfNeeded");
  -[NSMutableDictionary objectForKey:](v5->_keysForEmails, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
  {
    if ((PLIsAssetsd() & 1) != 0)
    {
      v7 = v5;
      objc_sync_enter(v7);
      -[NSMutableDictionary objectForKey:](v5->_keysForEmails, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v8 = (void *)MEMORY[0x1E0CB37E8];
        ++v7->_maxKey;
        objc_msgSend(v8, "numberWithInt:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v5->_keysForEmails, "setObject:forKey:", v6, v4);
        -[NSMutableDictionary setObject:forKey:](v7->_emailsForKey, "setObject:forKey:", v4, v6);
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5->_keysForEmails, 100, 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLEmailAddressManager plistPath](v7, "plistPath");
        v10 = (PLEmailAddressManager *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "writeToFile:options:error:", v10, 1073741825, 0) & 1) == 0)
        {
          v11 = (void *)objc_opt_new();
          -[PLEmailAddressManager stringByDeletingLastPathComponent](v10, "stringByDeletingLastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v25);
          v14 = v25;

          if (!v13
            || (v24 = v14,
                v15 = objc_msgSend(v9, "writeToFile:options:error:", v10, 1073741825, &v24),
                v16 = v24,
                v14,
                v14 = v16,
                (v15 & 1) == 0))
          {
            PLPhotoSharingGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v10;
              v29 = 2112;
              v30 = v14;
              _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "##### Failed to write %@ at %@", buf, 0x16u);
            }

          }
        }

      }
      objc_sync_exit(v7);
      goto LABEL_22;
    }
    -[PLEmailAddressManager assetsdClient](v5, "assetsdClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cloudInternalClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v20 = objc_msgSend(v19, "keyForEmailAddress:error:", v4, &v26);
    v7 = (PLEmailAddressManager *)v26;

    if (v7)
    {
      PLPhotoSharingGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Error getting key from email address: %@", buf, 0xCu);
      }
      v6 = 0;
    }
    else
    {
      if (v20 == -1)
      {
        v6 = 0;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v5;
      objc_sync_enter(v21);
      -[NSMutableDictionary setObject:forKey:](v5->_keysForEmails, "setObject:forKey:", v6, v4);
      -[objc_class setObject:forKey:](v21[2].isa, "setObject:forKey:", v4, v6);
      objc_sync_exit(v21);
    }

LABEL_22:
  }
  if (objc_msgSend(v6, "intValue") == -1)
  {
    PLPhotoSharingGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Returning invalid keyValue of -1", buf, 2u);
    }

  }
LABEL_27:

  return v6;
}

- (id)emailAddressForKey:(id)a3
{
  id v4;
  void *v5;
  PLEmailAddressManager *v6;
  void *v7;
  PLEmailAddressManager *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "intValue") == -1)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v6 = self;
  objc_sync_enter(v6);
  -[PLEmailAddressManager _loadDictionariesIfNeeded](v6, "_loadDictionariesIfNeeded");
  -[NSMutableDictionary objectForKey:](v6->_emailsForKey, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  if (!v7)
  {
    if ((PLIsAssetsd() & 1) != 0)
    {
      v8 = v6;
      objc_sync_enter(v8);
      -[NSMutableDictionary objectForKey:](v6->_emailsForKey, "objectForKey:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v8);

    }
    else
    {
      -[PLEmailAddressManager assetsdClient](v6, "assetsdClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudInternalClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v10, "emailAddressForKey:error:", (int)objc_msgSend(v5, "intValue"), &v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;

      if (v7)
      {
        v12 = v6;
        objc_sync_enter(v12);
        -[objc_class setObject:forKey:](v12[1].isa, "setObject:forKey:", v5, v7);
        -[NSMutableDictionary setObject:forKey:](v6->_emailsForKey, "setObject:forKey:", v7, v5);
        objc_sync_exit(v12);
      }
      else
      {
        PLPhotoSharingGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v5;
          v18 = 2112;
          v19 = v11;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error getting email address from key: %@, error: %@", buf, 0x16u);
        }
      }

    }
    if (!v7)
    {
      PLPhotoSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Could not find email address for key %@", buf, 0xCu);
      }

      goto LABEL_15;
    }
  }
LABEL_16:

  return v7;
}

- (void)_loadDictionariesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *keysForEmails;
  NSObject *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *emailsForKey;
  NSMutableDictionary *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  if (!self->_keysForEmails)
  {
    if (objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit"))
    {
      v3 = (void *)MEMORY[0x1E0C99D80];
      -[PLEmailAddressManager plistPath](self, "plistPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");
      keysForEmails = self->_keysForEmails;
      self->_keysForEmails = v6;

    }
    else
    {
      PLPhotoSharingGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Could not read dictionary; missing required entitlement",
          buf,
          2u);
      }

    }
    if (!self->_keysForEmails)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_keysForEmails;
      self->_keysForEmails = v9;

    }
    self->_maxKey = 1;
    v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_keysForEmails, "count"));
    emailsForKey = self->_emailsForKey;
    self->_emailsForKey = v11;

    v13 = self->_keysForEmails;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__PLEmailAddressManager__loadDictionariesIfNeeded__block_invoke;
    v14[3] = &unk_1E36732A0;
    v14[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v13, "enumerateKeysAndObjectsUsingBlock:", v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_emailsForKey, 0);
  objc_storeStrong((id *)&self->_keysForEmails, 0);
}

void __50__PLEmailAddressManager__loadDictionariesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = objc_msgSend(a3, "intValue");
  v7 = *(_QWORD *)(a1 + 32);
  if ((int)v6 > *(_DWORD *)(v7 + 24))
  {
    *(_DWORD *)(v7 + 24) = v6;
    v7 = *(_QWORD *)(a1 + 32);
  }
  v8 = *(void **)(v7 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, v9);

}

@end
