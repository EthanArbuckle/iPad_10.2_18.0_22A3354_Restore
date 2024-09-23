@implementation UNCAttachmentsRepository

- (UNCAttachmentsRepository)initWithDirectory:(id)a3 librarian:(id)a4
{
  id v6;
  id v7;
  UNCAttachmentsRepository *v8;
  uint64_t v9;
  NSURL *directoryURL;
  UNCKeyedDictionaryRepository *v11;
  UNCKeyedDictionaryRepository *referencesRepository;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNCAttachmentsRepository;
  v8 = -[UNCAttachmentsRepository init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    directoryURL = v8->_directoryURL;
    v8->_directoryURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_librarian, a4);
    v11 = -[UNCKeyedDictionaryRepository initWithDirectory:fileName:pathExtension:librarian:]([UNCKeyedDictionaryRepository alloc], "initWithDirectory:fileName:pathExtension:librarian:", v6, CFSTR("AttachmentsList"), CFSTR("plist"), v7);
    referencesRepository = v8->_referencesRepository;
    v8->_referencesRepository = v11;

  }
  return v8;
}

- (id)bundleIdentifiersClaimingAttachments
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  UNCAttachmentsRepository *v11;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", self->_directoryURL, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__UNCAttachmentsRepository_bundleIdentifiersClaimingAttachments__block_invoke;
  v9[3] = &unk_251AE0D98;
  v10 = v5;
  v11 = self;
  v6 = v5;
  objc_msgSend(v4, "bs_mapNoNulls:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __64__UNCAttachmentsRepository_bundleIdentifiersClaimingAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Attachments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((_DWORD)v5)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(v3, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifierForUniqueIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_claimedRepositoryURLsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UNCAttachmentsRepository _attachmentDirectoryForBundleIdentifier:](self, "_attachmentDirectoryForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __70__UNCAttachmentsRepository__claimedRepositoryURLsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URLByStandardizingPath");
}

- (BOOL)isRepositoryURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;

  v8 = 2;
  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v8, self->_directoryURL, v5, 0);

  return v8 == 0;
}

- (BOOL)isValidRepositoryURL:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    -[UNCAttachmentsRepository _attachmentDirectoryForBundleIdentifier:](self, "_attachmentDirectoryForBundleIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 2;
    objc_msgSend(v8, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v14, v11, v6, 0);
    v12 = v14 == 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)allBundleIdentifiers
{
  return -[UNCKeyedDictionaryRepository allKeys](self->_referencesRepository, "allKeys");
}

- (id)referencesForBundleIdentifier:(id)a3
{
  return -[UNCKeyedDictionaryRepository dictionaryForKey:](self->_referencesRepository, "dictionaryForKey:", a3);
}

- (id)moveFileIntoRepositoryFromFileURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  char v40;
  unint64_t v41;
  NSObject *v42;
  void *v43;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_sha1HashOfFileAtURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v47 = v9;
    objc_msgSend(MEMORY[0x24BDD17C8], "unc_stringWithDigestOfSHA1Hash:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v12;
    -[UNCAttachmentsRepository _fileURLForDigestString:extension:bundleIdentifier:](self, "_fileURLForDigestString:extension:bundleIdentifier:", v12, v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

    if (v17)
    {
      v18 = *MEMORY[0x24BDF8978];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_ERROR))
        -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:].cold.2((uint64_t)v8, v18, v19, v20, v21, v22, v23, v24);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeItemAtURL:error:", v8, 0);

      v26 = v14;
      v27 = v46;
      goto LABEL_20;
    }
    -[UNCAttachmentsRepository _attachmentDirectoryForBundleIdentifier:](self, "_attachmentDirectoryForBundleIdentifier:", v10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v36, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v35, 1, 0, 0);

    v37 = *MEMORY[0x24BDBCC68];
    v49 = 0;
    LOBYTE(v36) = objc_msgSend(v35, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v37, &v49);
    v38 = v49;
    if ((v36 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_ERROR))
      -[UNCFileHandleContentProtectionStrategy _excludeItemFromBackupAtPath:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v38;
    v40 = objc_msgSend(v39, "moveItemAtURL:toURL:error:", v8, v14, &v48);
    v45 = v48;

    if ((v40 & 1) != 0)
    {
      v9 = v47;
      v41 = -[UNCAttachmentsRepository _addReferencesToRepositoryURL:forNotificationIdentifier:bundleIdentifier:](self, "_addReferencesToRepositoryURL:forNotificationIdentifier:bundleIdentifier:", v14, v47, v10);
      v42 = *MEMORY[0x24BDF8978];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v51 = v14;
        v52 = 2112;
        v53 = v47;
        v54 = 2048;
        v55 = v41;
        _os_log_impl(&dword_2499A5000, v42, OS_LOG_TYPE_DEFAULT, "Added reference to repository URL '%@' for notification identifier '%@' (refcount %lu)", buf, 0x20u);
      }
      v26 = v14;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_ERROR))
      {
        v43 = v45;
        -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:].cold.3();
        v26 = 0;
        v27 = v46;
        v9 = v47;
        goto LABEL_19;
      }
      v26 = 0;
      v9 = v47;
    }
    v43 = v45;
    v27 = v46;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v28 = *MEMORY[0x24BDF8978];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_ERROR))
    -[UNCAttachmentsRepository moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:].cold.1((uint64_t)v8, v28, v29, v30, v31, v32, v33, v34);
  v26 = 0;
LABEL_21:

  return v26;
}

- (void)removeReferenceToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[UNCAttachmentsRepository isValidRepositoryURL:forBundleIdentifier:](self, "isValidRepositoryURL:forBundleIdentifier:", v8, v10))
  {
    v11 = -[UNCAttachmentsRepository _removeReferencesToRepositoryURL:forNotificationIdentifier:bundleIdentifier:](self, "_removeReferencesToRepositoryURL:forNotificationIdentifier:bundleIdentifier:", v8, v9, v10);
    if (!v11)
      -[UNCAttachmentsRepository _removeRepositoryURL:](self, "_removeRepositoryURL:", v8);
    v12 = *MEMORY[0x24BDF8978];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2048;
      v19 = v11;
      _os_log_impl(&dword_2499A5000, v12, OS_LOG_TYPE_DEFAULT, "Removed reference to repository URL '%@' for notification identifier '%@' (refcount %lu)", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    v13 = *MEMORY[0x24BDF8978];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_ERROR))
      -[UNCAttachmentsRepository removeReferenceToRepositoryURL:forNotificationIdentifier:bundleIdentifier:].cold.1((uint64_t)v8, (uint64_t)v9, v13);
  }

}

- (void)_removeRepositoryURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDF8978];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2499A5000, v4, OS_LOG_TYPE_DEFAULT, "Removing repository URL '%@' as no notifications reference it", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v3, 0);

}

- (void)deleteAllFilesForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDF8978];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2499A5000, v5, OS_LOG_TYPE_DEFAULT, "Removing all attachments for bundle '%@'", (uint8_t *)&v8, 0xCu);
  }
  -[UNCAttachmentsRepository _removeAllReferencesForBundleIdentifier:](self, "_removeAllReferencesForBundleIdentifier:", v4);
  -[UNCAttachmentsRepository _attachmentDirectoryForBundleIdentifier:](self, "_attachmentDirectoryForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

}

- (unint64_t)_addReferencesToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __101__UNCAttachmentsRepository__addReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke;
  v12[3] = &unk_251AE0DE0;
  v13 = v8;
  v9 = v8;
  v10 = -[UNCAttachmentsRepository _transformNotificationIdentifiersForRepositoryURL:bundleIdentifier:usingTransformBlock:](self, "_transformNotificationIdentifiersForRepositoryURL:bundleIdentifier:usingTransformBlock:", a3, a5, v12);

  return v10;
}

uint64_t __101__UNCAttachmentsRepository__addReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setByAddingObject:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)_removeReferencesToRepositoryURL:(id)a3 forNotificationIdentifier:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __104__UNCAttachmentsRepository__removeReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke;
  v12[3] = &unk_251AE0DE0;
  v13 = v8;
  v9 = v8;
  v10 = -[UNCAttachmentsRepository _transformNotificationIdentifiersForRepositoryURL:bundleIdentifier:usingTransformBlock:](self, "_transformNotificationIdentifiersForRepositoryURL:bundleIdentifier:usingTransformBlock:", a3, a5, v12);

  return v10;
}

id __104__UNCAttachmentsRepository__removeReferencesToRepositoryURL_forNotificationIdentifier_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  return v3;
}

- (void)_removeAllReferencesForBundleIdentifier:(id)a3
{
  -[UNCAttachmentsRepository _transformAttachmentsForBundleIdentifier:usingTransformBlock:](self, "_transformAttachmentsForBundleIdentifier:usingTransformBlock:", a3, &__block_literal_global_11);
}

uint64_t __68__UNCAttachmentsRepository__removeAllReferencesForBundleIdentifier___block_invoke()
{
  return 0;
}

- (void)_transformAttachmentsForBundleIdentifier:(id)a3 usingTransformBlock:(id)a4
{
  UNCKeyedDictionaryRepository *referencesRepository;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UNCKeyedDictionaryRepository *v12;
  id v13;

  v13 = a3;
  referencesRepository = self->_referencesRepository;
  v7 = (void (**)(id, void *))a4;
  -[UNCKeyedDictionaryRepository dictionaryForKey:](referencesRepository, "dictionaryForKey:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[2](v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = objc_msgSend(v10, "count");
  v12 = self->_referencesRepository;
  if (v11)
    -[UNCKeyedDictionaryRepository setDictionary:forKey:](v12, "setDictionary:forKey:", v10, v13);
  else
    -[UNCKeyedDictionaryRepository removeDictionaryForKey:](v12, "removeDictionaryForKey:", v13);

}

- (unint64_t)_transformNotificationIdentifiersForRepositoryURL:(id)a3 bundleIdentifier:(id)a4 usingTransformBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __115__UNCAttachmentsRepository__transformNotificationIdentifiersForRepositoryURL_bundleIdentifier_usingTransformBlock___block_invoke;
  v15[3] = &unk_251AE0E48;
  v11 = v8;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v18 = &v19;
  -[UNCAttachmentsRepository _transformAttachmentsForBundleIdentifier:usingTransformBlock:](self, "_transformAttachmentsForBundleIdentifier:usingTransformBlock:", v9, v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

id __115__UNCAttachmentsRepository__transformNotificationIdentifiersForRepositoryURL_bundleIdentifier_usingTransformBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "objectForKey:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  (*(void (**)(void))(a1[5] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v9, "count");
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    objc_msgSend(v3, "setObject:forKey:", v9, a1[4]);
  else
    objc_msgSend(v3, "removeObjectForKey:", a1[4]);

  return v3;
}

- (void)performMigration
{
  -[UNCAttachmentsRepository _performAttachmentFilesMigration](self, "_performAttachmentFilesMigration");
  -[UNCAttachmentsRepository _performAttachmentRepositoryKeyMigration](self, "_performAttachmentRepositoryKeyMigration");
}

- (void)_performAttachmentFilesMigration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  os_log_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char v22;
  id v23;
  NSObject *v24;
  char v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v3;
  v45[1] = CFSTR("SpringBoard");
  v45[2] = CFSTR("PushStore");
  v45[3] = CFSTR("Attachments");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    v29 = v5;
    v30 = v4;
    v31 = v3;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v7;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    v12 = (os_log_t *)MEMORY[0x24BDF89D0];
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x24BCFE9BC]();
          objc_msgSend(v16, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("Attachments"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = *v12;
          if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v16;
            v42 = 2114;
            v43 = v20;
            _os_log_impl(&dword_2499A5000, v21, OS_LOG_TYPE_DEFAULT, "Move attachments directory from '%{public}@' to '%{public}@'", buf, 0x16u);
          }
          v35 = 0;
          v22 = objc_msgSend(v8, "moveItemAtURL:toURL:error:", v16, v20, &v35);
          v23 = v35;
          if ((v22 & 1) == 0)
          {
            v24 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v41 = v20;
              v42 = 2114;
              v43 = v23;
              _os_log_impl(&dword_2499A5000, v24, OS_LOG_TYPE_DEFAULT, "Moving attachment bundle directory to '%{public}@' failed: %{public}@", buf, 0x16u);
            }
          }

          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v13);
    }

    v34 = 0;
    v5 = v29;
    v25 = objc_msgSend(v8, "removeItemAtURL:error:", v29, &v34);
    v26 = v34;
    if ((v25 & 1) == 0)
    {
      v27 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2114;
        v43 = v26;
        _os_log_impl(&dword_2499A5000, v27, OS_LOG_TYPE_DEFAULT, "Removing attachments directory '%{public}@' failed: %{public}@", buf, 0x16u);
      }
    }

    v4 = v30;
    v3 = v31;
    v7 = v28;
  }

}

- (void)_performAttachmentRepositoryKeyMigration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  UNCKeyedDictionaryRepository *referencesRepository;
  void *v25;
  id v26;
  id v27;
  id obj;
  id obja;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_directoryURL, "path");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v3;
  objc_msgSend(v3, "enumeratorAtPath:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x24BCFE9BC]();
        objc_msgSend(v30, "stringByAppendingPathComponent:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("AttachmentsList"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("plist"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "fileExistsAtPath:", v12))
          objc_msgSend(v26, "addObject:", v8);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v26;
  v13 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v13)
  {
    v14 = v13;
    obja = *(id *)v36;
    do
    {
      v15 = 0;
      do
      {
        if (*(id *)v36 != obja)
          objc_enumerationMutation(v27);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x24BCFE9BC]();
        -[UNCBundleLibrarian bundleIdentifierForUniqueIdentifier:](self->_librarian, "bundleIdentifierForUniqueIdentifier:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[UNCAttachmentsRepository _attachmentDirectoryForBundleIdentifier:](self, "_attachmentDirectoryForBundleIdentifier:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCKeyedDictionaryRepository dictionaryForKey:](self->_referencesRepository, "dictionaryForKey:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __68__UNCAttachmentsRepository__performAttachmentRepositoryKeyMigration__block_invoke;
          v32[3] = &unk_251AE0E70;
          v33 = v19;
          v34 = v21;
          v22 = v21;
          v23 = v19;
          objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v32);
          referencesRepository = self->_referencesRepository;
          v25 = (void *)objc_msgSend(v22, "copy");
          -[UNCKeyedDictionaryRepository setDictionary:forKey:](referencesRepository, "setDictionary:forKey:", v25, v18);

        }
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v14 != v15);
      v14 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v14);
  }

}

void __68__UNCAttachmentsRepository__performAttachmentRepositoryKeyMigration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v6);

}

- (void)ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UNCAttachmentsRepository bundleIdentifiersClaimingAttachments](self, "bundleIdentifiersClaimingAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke;
          v13[3] = &unk_251AE0EC0;
          v13[4] = self;
          v13[5] = v10;
          v14 = v11;
          -[UNCAttachmentsRepository _transformAttachmentsForBundleIdentifier:usingTransformBlock:](self, "_transformAttachmentsForBundleIdentifier:usingTransformBlock:", v10, v13);

        }
        else
        {
          -[UNCAttachmentsRepository deleteAllFilesForBundleIdentifier:](self, "deleteAllFilesForBundleIdentifier:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

id __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_claimedRepositoryURLsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v10))
        {
          objc_msgSend(v5, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke_2;
          v26[3] = &unk_251AE0E98;
          v27 = *(id *)(a1 + 48);
          objc_msgSend(v11, "bs_filter:", v26);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
            objc_msgSend(v21, "setObject:forKey:", v12, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(v21, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(v13, "containsObject:", v19) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "_removeRepositoryURL:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v16);
  }

  return v21;
}

uint64_t __92__UNCAttachmentsRepository_ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_fileURLForDigestString:(id)a3 extension:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  -[UNCAttachmentsRepository _attachmentDirectoryForBundleIdentifier:](self, "_attachmentDirectoryForBundleIdentifier:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "URLByAppendingPathExtension:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_attachmentDirectoryForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UNCBundleLibrarian uniqueIdentifierForBundleIdentifier:](self->_librarian, "uniqueIdentifierForBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_directoryURL, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Attachments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_sha1HashOfFileAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v13;
  CC_SHA1_CTX c;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA1_Init(&c);
    v13 = 0;
    objc_msgSend(v4, "readDataUpToLength:error:", 1024, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    v7 = v6;
    if (v5)
    {
      while (objc_msgSend(v5, "length"))
      {
        v8 = objc_retainAutorelease(v5);
        CC_SHA1_Update(&c, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
        v13 = 0;
        objc_msgSend(v4, "readDataUpToLength:error:", 1024, &v13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13;

        v7 = v9;
        if (!v5)
          goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 20);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CC_SHA1_Final((unsigned __int8 *)objc_msgSend(v11, "mutableBytes"), &c);
    }
    else
    {
      v9 = v6;
LABEL_8:
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8978], OS_LOG_TYPE_ERROR))
        +[UNCAttachmentsRepository _sha1HashOfFileAtURL:].cold.1();
      v5 = 0;
      v11 = 0;
      v7 = v9;
    }
    objc_msgSend(v4, "closeFile");
    v10 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_referencesRepository, 0);
}

- (void)moveFileIntoRepositoryFromFileURL:(uint64_t)a3 forNotificationIdentifier:(uint64_t)a4 bundleIdentifier:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "Could not hash file at '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)moveFileIntoRepositoryFromFileURL:(uint64_t)a3 forNotificationIdentifier:(uint64_t)a4 bundleIdentifier:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "File at '%@' already exists in the repository", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)moveFileIntoRepositoryFromFileURL:forNotificationIdentifier:bundleIdentifier:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "File at '%@' was not moved into the repository correctly, error=%{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)removeReferenceToRepositoryURL:(uint64_t)a1 forNotificationIdentifier:(uint64_t)a2 bundleIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, a2, a3, "Attempted to remove reference for repository URL '%@' for notification identifier '%@' but this isn't in the repository", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_6();
}

+ (void)_sha1HashOfFileAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not read file at '%{public}@': error=%{public}@");
  OUTLINED_FUNCTION_6();
}

@end
