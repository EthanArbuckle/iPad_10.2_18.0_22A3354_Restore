@implementation PLPersistedFolderMetadata

- (PLPersistedFolderMetadata)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistedFolderMetadata.m"), 60, CFSTR("Can't initialize a PLPersistedFolderMetadata object using -init."));

  return 0;
}

- (PLPersistedFolderMetadata)initWithPLManagedFolder:(id)a3 pathManager:(id)a4
{
  id v7;
  id v8;
  PLPersistedFolderMetadata *v9;
  PLPersistedFolderMetadata *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PLPersistedFolderMetadata;
  v9 = -[PLPersistedFolderMetadata init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folder, a3);
    -[PLPersistedFolderMetadata setInTrash:](v10, "setInTrash:", 0);
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PLManagedFolder uuid](v10->_folder, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v15, PLFolderMetadataExtension);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedFolderMetadata setMetadataURL:](v10, "setMetadataURL:", v17);

  }
  return v10;
}

- (PLPersistedFolderMetadata)initWithPersistedDataAtURL:(id)a3
{
  id v4;
  PLPersistedFolderMetadata *v5;
  PLPersistedFolderMetadata *v6;
  PLPersistedFolderMetadata *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPersistedFolderMetadata;
  v5 = -[PLPersistedFolderMetadata init](&v9, sel_init);
  v6 = v5;
  if (v5
    && (-[PLPersistedFolderMetadata setMetadataURL:](v5, "setMetadataURL:", v4),
        !-[PLPersistedFolderMetadata _readMetadata](v6, "_readMetadata")))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (BOOL)isRootFolder
{
  void *v2;
  BOOL v3;

  -[PLPersistedFolderMetadata kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 3999;

  return v3;
}

- (BOOL)isProjectAlbumRootFolder
{
  void *v2;
  BOOL v3;

  -[PLPersistedFolderMetadata kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 3998;

  return v3;
}

- (void)removePersistedData
{
  void *v3;
  NSURL *metadataURL;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  metadataURL = self->_metadataURL;
  v11 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", metadataURL, &v11);
  v6 = v11;

  if ((v5 & 1) == 0)
  {
    PLUnderlyingPOSIXError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "code");

    if (v8 != 2)
    {
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](self->_metadataURL, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to remove persisted folder metadata %@ %@", buf, 0x16u);

      }
    }
  }

}

- (id)insertFolderFromDataInManagedObjectContext:(id)a3
{
  id v4;
  int v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *title;
  void *v12;
  NSNumber *kind;
  void *v14;
  int v16;
  NSNumber *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSNumber intValue](self->_kind, "intValue");
  if ((v5 - 3998) < 2)
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Can't replace singleton root folder from metadata", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v5 == 1553)
    {
      title = self->_title;
      objc_msgSend(v4, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = title;
      v9 = 1553;
      goto LABEL_8;
    }
    if (v5 == 4000)
    {
      v6 = self->_title;
      objc_msgSend(v4, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = 4000;
LABEL_8:
      +[PLManagedFolder insertNewFolderWithTitle:kind:intoLibrary:](PLManagedFolder, "insertNewFolderWithTitle:kind:intoLibrary:", v8, v9, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      kind = self->_kind;
      -[NSURL path](self->_metadataURL, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = kind;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unknown Folder Kind %@ at %@", (uint8_t *)&v16, 0x16u);

    }
  }

  v12 = 0;
LABEL_12:
  objc_msgSend(v12, "setUuid:", self->_uuid);
  if (self->_cloudGUID)
    objc_msgSend(v12, "setCloudGUID:");
  if (self->_inTrash && objc_msgSend(v12, "canMoveToTrash"))
    objc_msgSend(v12, "applyTrashedState:cascade:", 1, 1);
  if (self->_pinned)
    objc_msgSend(v12, "setIsPinned:", 1);
  if (self->_prototype)
    objc_msgSend(v12, "setIsPrototype:", 1);
  objc_msgSend(v12, "setCustomSortAscending:", self->_customSortAscending);
  objc_msgSend(v12, "setCustomSortKey:", self->_customSortKey);

  return v12;
}

- (void)updateChildrenOrderingInFolder:(id)a3 includePendingChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[PLPersistedFolderMetadata childUUIDs](self, "childUUIDs");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPersistedFolderMetadata metadataURL](self, "metadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateChildrenOrderingInFolder:usingChildUUIDs:sourceDescription:includePendingChanges:", v6, v10, v9, v4);

}

- (id)description
{
  PLPersistedFolderMetadata *v2;
  void *folder;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PLManagedFolder *v18;
  BOOL v19;
  PLManagedFolder *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  objc_super v30;

  v2 = self;
  if (self->_folder)
    self = (PLPersistedFolderMetadata *)self->_folder;
  -[PLPersistedFolderMetadata title](self, "title");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    folder = v2->_folder;
  else
    folder = v2;
  objc_msgSend(folder, "kind");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v4 = v2->_folder;
  else
    v4 = v2;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v6 = v2->_folder;
  else
    v6 = v2;
  objc_msgSend(v6, "cloudGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v8 = v2->_folder;
  else
    v8 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "isPinned"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v10 = v2->_folder;
  else
    v10 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "isPrototype"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v12 = v2->_folder;
  else
    v12 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "isInTrash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v14 = v2->_folder;
  else
    v14 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "customSortAscending"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_folder)
    v16 = v2->_folder;
  else
    v16 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v16, "customSortKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v2->_folder;
  if (v18)
  {
    v19 = -[PLGenericAlbum isFolder](v18, "isFolder");
    v20 = v2->_folder;
    if (v19)
      -[PLManagedFolder albums](v20, "albums");
    else
      -[PLManagedFolder assets](v20, "assets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLPersistedFolderMetadata childUUIDs](v2, "childUUIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  v23 = objc_msgSend(v21, "count");

  v30.receiver = v2;
  v30.super_class = (Class)PLPersistedFolderMetadata;
  -[PLPersistedFolderMetadata description](&v30, sel_description);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedFolder objectID](v2->_folder, "objectID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(" album %@ : title:%@, uuid:%@, cloudGUID:%@, kind:%@, pin:%@, prototype:%@, trash:%@, sort:%@ asc:%@, childCount:%lu"), v25, v28, v5, v7, v29, v9, v11, v13, v15, v17, v23);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)_readMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  _BYTE v29[37];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLPersistedFolderMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "pl_safeInitForReadingFromData:", v5);
    v7 = v6 != 0;
    if (v6)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setTitle:](self, "setTitle:", v8);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setKind:](self, "setKind:", v9);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setUuid:](self, "setUuid:", v10);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudGUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setCloudGUID:](self, "setCloudGUID:", v11);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPinned"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setPinned:](self, "setPinned:", objc_msgSend(v12, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPrototype"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setPrototype:](self, "setPrototype:", objc_msgSend(v13, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInTrash"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setInTrash:](self, "setInTrash:", objc_msgSend(v14, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSortAscending"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setCustomSortAscending:](self, "setCustomSortAscending:", objc_msgSend(v15, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSortKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setCustomSortKey:](self, "setCustomSortKey:", objc_msgSend(v16, "intValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetUUIDs"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");
      v19 = v18 >> 4;
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v18 >> 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedFolderMetadata setChildUUIDs:](self, "setChildUUIDs:", v20);

      v21 = objc_retainAutorelease(v17);
      v22 = objc_msgSend(v21, "bytes");
      if (v18 >= 0x10)
      {
        v23 = v22;
        v24 = 0;
        v25 = 1;
        do
        {
          memset(v29, 0, sizeof(v29));
          uuid_unparse((const unsigned __int8 *)(v23 + 16 * v24), v29);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableOrderedSet addObject:](self->_childUUIDs, "addObject:", v26);

          v24 = v25;
        }
        while (v19 > v25++);
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_saveMetadata
{
  void *v3;
  void *v4;
  void *folder;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PLManagedFolder *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  if (self->_folder)
    folder = self->_folder;
  else
    folder = self;
  objc_msgSend(folder, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));
  if (self->_folder)
    v7 = self->_folder;
  else
    v7 = self;
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kind"));
  if (self->_folder)
    v9 = self->_folder;
  else
    v9 = self;
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("uuid"));
  if (self->_folder)
    v11 = self->_folder;
  else
    v11 = self;
  objc_msgSend(v11, "cloudGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("cloudGUID"));
  if (self->_folder)
    v13 = self->_folder;
  else
    v13 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "isPinned"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("isPinned"));
  v55 = (void *)v14;
  if (self->_folder)
    v15 = self->_folder;
  else
    v15 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "isPrototype"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("isPrototype"));
  v54 = (void *)v16;
  if (self->_folder)
    v17 = self->_folder;
  else
    v17 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "isInTrash"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("isInTrash"));
  v53 = (void *)v18;
  if (self->_folder)
    v19 = self->_folder;
  else
    v19 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v19, "customSortAscending"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("customSortAscending"));
  if (self->_folder)
    v21 = self->_folder;
  else
    v21 = self;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v21, "customSortKey"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("customSortKey"));
  v51 = (void *)v22;
  v52 = (void *)v20;
  v23 = self->_folder;
  if (v23)
  {
    v46 = v12;
    v47 = v10;
    v48 = v8;
    v49 = v6;
    v45 = v3;
    -[PLManagedFolder albums](v23, "albums");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    v50 = (char *)malloc_type_malloc(16 * v25, 0x749C91F1uLL);
    if (v25)
    {
      v26 = 0;
      v27 = v50;
      do
      {
        v28 = (void *)MEMORY[0x1E0D73308];
        objc_msgSend(v24, "objectAtIndex:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "parseUUIDString:uuidBuffer:", v30, v27);

        ++v26;
        v27 += 16;
      }
      while (v25 != v26);
    }

    v3 = v45;
  }
  else
  {
    -[PLPersistedFolderMetadata childUUIDs](self, "childUUIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v31, "count");

    v32 = (char *)malloc_type_malloc(16 * v25, 0x1AD349EFuLL);
    v50 = v32;
    if (!v25)
    {
LABEL_55:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v50, 16 * v25, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v38, CFSTR("assetUUIDs"));

      goto LABEL_56;
    }
    v46 = v12;
    v47 = v10;
    v48 = v8;
    v49 = v6;
    v33 = 0;
    v34 = v32;
    do
    {
      v35 = (void *)MEMORY[0x1E0D73308];
      -[PLPersistedFolderMetadata childUUIDs](self, "childUUIDs");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndex:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "parseUUIDString:uuidBuffer:", v37, v34);

      ++v33;
      v34 += 16;
    }
    while (v25 != v33);
  }
  v8 = v48;
  v6 = v49;
  v12 = v46;
  v10 = v47;
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_55;
LABEL_56:
  v39 = (void *)MEMORY[0x1E0D73200];
  objc_msgSend(v4, "encodedData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedFolderMetadata metadataURL](self, "metadataURL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "persistMetadata:fileURL:", v40, v41);

  v42 = (void *)MEMORY[0x1E0D73208];
  -[PLPersistedFolderMetadata metadataURL](self, "metadataURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "path");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "changeFileOwnerToMobileAtPath:error:", v44, 0);

  objc_autoreleasePoolPop(v3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (void)setCloudGUID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudGUID, a3);
}

- (NSNumber)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isPrototype
{
  return self->_prototype;
}

- (void)setPrototype:(BOOL)a3
{
  self->_prototype = a3;
}

- (BOOL)isInTrash
{
  return self->_inTrash;
}

- (void)setInTrash:(BOOL)a3
{
  self->_inTrash = a3;
}

- (BOOL)customSortAscending
{
  return self->_customSortAscending;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  self->_customSortAscending = a3;
}

- (int)customSortKey
{
  return self->_customSortKey;
}

- (void)setCustomSortKey:(int)a3
{
  self->_customSortKey = a3;
}

- (NSMutableOrderedSet)childUUIDs
{
  return self->_childUUIDs;
}

- (void)setChildUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_childUUIDs, a3);
}

- (NSString)remappedUUID
{
  return self->_remappedUUID;
}

- (PLManagedFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMetadataURL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_remappedUUID, 0);
  objc_storeStrong((id *)&self->_childUUIDs, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)isValidPath:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", PLFolderMetadataExtension);

  return v4;
}

+ (void)updateChildrenOrderingInFolder:(id)a3 usingChildUUIDs:(id)a4 sourceDescription:(id)a5 includePendingChanges:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[18];
  uint64_t v35;

  v6 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "childCollections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v10, "isEqual:", v13);
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      v17 = objc_msgSend(v13, "count");
      objc_msgSend(v9, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v34 = v17;
      *(_WORD *)&v34[4] = 2112;
      *(_QWORD *)&v34[6] = v18;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Persisted child collection UUIDs (%d total) match database ordering for folder %@", buf, 0x12u);

    }
  }
  else
  {
    if (v16)
    {
      objc_msgSend(v9, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v34 = v19;
      *(_WORD *)&v34[8] = 2112;
      *(_QWORD *)&v34[10] = v11;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Updating children in folder %@ to match persisted UUID ordering from %@", buf, 0x16u);

    }
    v20 = (void *)MEMORY[0x1E0C97B48];
    +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchRequestWithEntityName:", v21);
    v15 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v10, "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("uuid in %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v15, "setPredicate:", v24);

    if (v6)
      -[NSObject setIncludesPendingChanges:](v15, "setIncludesPendingChanges:", 1);
    objc_msgSend(v9, "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v25, "executeFetchRequest:error:", v15, &v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v32;

    if (v26)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __116__PLPersistedFolderMetadata_updateChildrenOrderingInFolder_usingChildUUIDs_sourceDescription_includePendingChanges___block_invoke;
      v30[3] = &unk_1E366C6C0;
      v31 = v10;
      objc_msgSend(v26, "sortedArrayUsingComparator:", v30);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addChildCollections:", v29);

    }
  }

}

uint64_t __116__PLPersistedFolderMetadata_updateChildrenOrderingInFolder_usingChildUUIDs_sourceDescription_includePendingChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return v8 > v11;
}

@end
