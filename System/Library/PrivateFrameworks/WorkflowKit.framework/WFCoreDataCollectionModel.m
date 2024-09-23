@implementation WFCoreDataCollectionModel

- (WFCoreDataCollectionModel)initWithManagedObject:(id)a3 database:(id)a4
{
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  WFCoreDataCollectionModel *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *workflowType;
  WFCoreDataCollectionModel *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v8 ? (v9 = 0) : (v9 = (void *)v8[15]),
        (v10 = v9, v10, v10)
     && (v18.receiver = self,
         v18.super_class = (Class)WFCoreDataCollectionModel,
         v11 = -[WFCoreDataCollectionModel init](&v18, sel_init),
         (self = v11) != 0)))
  {
    objc_storeStrong((id *)&v11->_coreDataCollection, a3);
    objc_storeStrong((id *)&self->_database, a4);
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isRootCollection = objc_msgSend(v12, "isEqualToString:", CFSTR("Root"));

    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WFWorkflowTypeForCollectionIdentifier(v13);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    workflowType = self->_workflowType;
    self->_workflowType = v14;

    self = self;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSManagedObject)managedObject
{
  return (NSManagedObject *)self->_coreDataCollection;
}

- (id)identifier
{
  return (id)-[WFCoreDataCollection identifier](self->_coreDataCollection, "identifier");
}

- (NSString)name
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;

  if (-[WFCoreDataCollectionModel isFolder](self, "isFolder"))
  {
    -[WFCoreDataCollectionModel database](self, "database");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(void **)(v3 + 120);
    else
      v5 = 0;
    v6 = v5;
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "folderWithIdentifier:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E7AFA810;
  }
  return (NSString *)v9;
}

- (void)setName:(id)a3
{
  void *v4;
  char v5;
  WFDatabase *database;
  WFDatabase *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[WFCoreDataCollection setName:](self->_coreDataCollection, "setName:", v17);
  -[WFCoreDataCollectionModel name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v17, "isEqualToString:", v4);

  if ((v5 & 1) == 0 && -[WFCoreDataCollectionModel isFolder](self, "isFolder"))
  {
    database = self->_database;
    if (database)
      database = (WFDatabase *)database->_library;
    v7 = database;
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase folderWithIdentifier:error:](v7, "folderWithIdentifier:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase updateFolderWithIdentifier:newName:newIcon:error:](v7, "updateFolderWithIdentifier:newName:newIcon:error:", v10, v17, objc_msgSend(v9, "glyphCharacter"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCoreDataCollectionModel database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "saveLibraryToDatabase:", v7);

    -[WFCoreDataCollectionModel database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0DC7AA8]);
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithIdentifier:objectType:", v15, 2);
    objc_msgSend(v13, "addPendingUpdatedDescriptor:", v16);

  }
}

- (WFWorkflowIcon)icon
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (-[WFCoreDataCollectionModel isFolder](self, "isFolder"))
  {
    -[WFCoreDataCollectionModel database](self, "database");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(void **)(v3 + 120);
    else
      v5 = 0;
    v6 = v5;
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "folderWithIdentifier:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "glyphCharacter");

  }
  else
  {
    v9 = 0;
  }
  return (WFWorkflowIcon *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithPaletteColor:glyphCharacter:customImageData:", 0, v9, 0);
}

- (void)setIcon:(id)a3
{
  void *v4;
  char v5;
  WFDatabase *database;
  WFDatabase *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[WFCoreDataCollection setWorkflowIcon:](self->_coreDataCollection, "setWorkflowIcon:", v18);
  -[WFCoreDataCollectionModel icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "isEqual:", v4);

  if ((v5 & 1) == 0 && -[WFCoreDataCollectionModel isFolder](self, "isFolder"))
  {
    database = self->_database;
    if (database)
      database = (WFDatabase *)database->_library;
    v7 = database;
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase folderWithIdentifier:error:](v7, "folderWithIdentifier:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDatabase updateFolderWithIdentifier:newName:newIcon:error:](v7, "updateFolderWithIdentifier:newName:newIcon:error:", v10, v11, objc_msgSend(v18, "glyphCharacter"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCoreDataCollectionModel database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveLibraryToDatabase:", v7);

    -[WFCoreDataCollectionModel database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0DC7AA8]);
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithIdentifier:objectType:", v16, 2);
    objc_msgSend(v14, "addPendingUpdatedDescriptor:", v17);

  }
}

- (int64_t)lastSyncedHash
{
  return -[WFCoreDataCollection lastSyncedHash](self->_coreDataCollection, "lastSyncedHash");
}

- (void)setLastSyncedHash:(int64_t)a3
{
  -[WFCoreDataCollection setLastSyncedHash:](self->_coreDataCollection, "setLastSyncedHash:", a3);
}

- (int64_t)wantedEncryptedSchemaVersion
{
  return -[WFCoreDataCollection wantedEncryptedSchemaVersion](self->_coreDataCollection, "wantedEncryptedSchemaVersion");
}

- (void)setWantedEncryptedSchemaVersion:(int64_t)a3
{
  -[WFCoreDataCollection setWantedEncryptedSchemaVersion:](self->_coreDataCollection, "setWantedEncryptedSchemaVersion:", a3);
}

- (int64_t)lastSyncedEncryptedSchemaVersion
{
  return -[WFCoreDataCollection lastSyncedEncryptedSchemaVersion](self->_coreDataCollection, "lastSyncedEncryptedSchemaVersion");
}

- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3
{
  -[WFCoreDataCollection setLastSyncedEncryptedSchemaVersion:](self->_coreDataCollection, "setLastSyncedEncryptedSchemaVersion:", a3);
}

- (BOOL)isDeleted
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[WFCoreDataCollectionModel isFolder](self, "isFolder");
  if (v3)
  {
    -[WFCoreDataCollectionModel database](self, "database");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = *(void **)(v4 + 120);
    else
      v6 = 0;
    v7 = v6;
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "folderWithIdentifier:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDeleted");

    LOBYTE(v3) = v10;
  }
  return v3;
}

- (BOOL)isFolder
{
  BOOL v3;
  void *v4;

  if (-[WFCoreDataCollectionModel isRootCollection](self, "isRootCollection"))
    return 0;
  -[WFCoreDataCollectionModel workflowType](self, "workflowType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (NSOrderedSet)lastRemoteCollectionOrdering
{
  return -[WFCoreDataCollection deserializedLastRemoteCollectionOrdering](self->_coreDataCollection, "deserializedLastRemoteCollectionOrdering");
}

- (void)setLastRemoteCollectionOrdering:(id)a3
{
  -[WFCoreDataCollection setDeserializedLastRemoteCollectionOrdering:](self->_coreDataCollection, "setDeserializedLastRemoteCollectionOrdering:", a3);
}

- (NSOrderedSet)lastRemoteCollectionOrderingSubset
{
  return -[WFCoreDataCollection deserializedLastRemoteCollectionOrderingSubset](self->_coreDataCollection, "deserializedLastRemoteCollectionOrderingSubset");
}

- (void)setLastRemoteCollectionOrderingSubset:(id)a3
{
  -[WFCoreDataCollection setDeserializedLastRemoteCollectionOrderingSubset:](self->_coreDataCollection, "setDeserializedLastRemoteCollectionOrderingSubset:", a3);
}

- (NSOrderedSet)collectionOrdering
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[WFCoreDataCollectionModel isRootCollection](self, "isRootCollection"))
  {
    v3 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[WFCoreDataCollectionModel database](self, "database", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = *(void **)(v4 + 120);
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "folders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v3 = (void *)objc_opt_new();
  }
  return (NSOrderedSet *)v3;
}

- (void)setCollectionOrdering:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  WFDatabase *database;
  WFDatabase *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[6];
  _QWORD v53[6];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFCoreDataCollectionModel collectionOrdering](self, "collectionOrdering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToOrderedSet:", v5);

  if ((v6 & 1) == 0 && -[WFCoreDataCollectionModel isRootCollection](self, "isRootCollection"))
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[WFCoreDataCollectionModel identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v60 = "-[WFCoreDataCollectionModel setCollectionOrdering:]";
      v61 = 2112;
      v62 = v8;
      v63 = 2112;
      v64 = v4;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting collection ordering for %@: %@", buf, 0x20u);

    }
    database = self->_database;
    if (database)
      database = (WFDatabase *)database->_library;
    v10 = database;
    v11 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v44 = v4;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v55;
      v45 = v12;
      v46 = v11;
      v47 = *(_QWORD *)v55;
      do
      {
        v17 = 0;
        v48 = v15;
        do
        {
          if (*(_QWORD *)v55 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v17);
          -[WFDatabase folderWithIdentifier:error:](v10, "folderWithIdentifier:error:", v18, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v11, "addObject:", v19);
          }
          else
          {
            -[WFCoreDataCollectionModel database](self, "database");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = v14;
            v53[1] = 3221225472;
            v53[2] = __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke;
            v53[3] = &unk_1E7AF8B88;
            v53[4] = self;
            v53[5] = v18;
            objc_msgSend(v20, "performOperationWithReason:block:error:", CFSTR("getting collection for id"), v53, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v21, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFDatabase insertFolderWithName:icon:identifier:error:](v10, "insertFolderWithName:icon:identifier:error:", v22, objc_msgSend(v21, "glyphCharacter"), v18, 0);
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = v11;
              v25 = (void *)v23;
              objc_msgSend(v24, "addObject:", v23);

              -[WFCoreDataCollectionModel database](self, "database");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = v14;
              v52[1] = 3221225472;
              v52[2] = __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_2;
              v52[3] = &unk_1E7AF4AC0;
              v52[4] = self;
              v52[5] = v18;
              objc_msgSend(v26, "performOperationWithReason:block:error:", CFSTR("getting collection ordering for id"), v52, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
                objc_msgSend(v27, "array");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFDatabase setShortcutOrdering:forFolderIdentifier:error:](v10, "setShortcutOrdering:forFolderIdentifier:error:", v28, v18, 0);

              }
              v12 = v45;
              v11 = v46;
            }

            v16 = v47;
            v15 = v48;
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v15);
    }

    v29 = objc_msgSend(v11, "count");
    if (v29 == objc_msgSend(v12, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
      v50[0] = v14;
      v50[1] = 3221225472;
      v50[2] = __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_3;
      v50[3] = &unk_1E7AF4AE8;
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v51 = v30;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v50);
      -[WFCoreDataCollectionModel collectionOrdering](self, "collectionOrdering");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToOrderedSet:", v31);

      if ((v32 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v34 = v11;
        v35 = -[WFDatabase moveFolders:toIndexes:error:](v10, "moveFolders:toIndexes:error:", v11, v33, &v49);
        v36 = v49;

        if ((v35 & 1) == 0)
        {
          getWFGeneralLogObject();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            -[WFCoreDataCollectionModel identifier](self, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v60 = "-[WFCoreDataCollectionModel setCollectionOrdering:]";
            v61 = 2112;
            v62 = v38;
            v63 = 2112;
            v64 = v36;
            _os_log_impl(&dword_1C15B3000, v37, OS_LOG_TYPE_ERROR, "%s Unable to set collection ordering for collection: %@ %@", buf, 0x20u);

          }
        }

        v11 = v34;
      }

    }
    -[WFCoreDataCollectionModel database](self, "database");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "saveLibraryToDatabase:", v10);

    -[WFCoreDataCollectionModel database](self, "database");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc(MEMORY[0x1E0DC7AA8]);
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithIdentifier:objectType:", v42, 2);
    objc_msgSend(v40, "addPendingUpdatedDescriptor:", v43);

    v4 = v44;
  }

}

- (NSOrderedSet)lastRemoteShortcutOrdering
{
  return -[WFCoreDataCollection deserializedLastRemoteShortcutOrdering](self->_coreDataCollection, "deserializedLastRemoteShortcutOrdering");
}

- (void)setLastRemoteShortcutOrdering:(id)a3
{
  -[WFCoreDataCollection setDeserializedLastRemoteShortcutOrdering:](self->_coreDataCollection, "setDeserializedLastRemoteShortcutOrdering:", a3);
}

- (NSOrderedSet)lastRemoteShortcutOrderingSubset
{
  return -[WFCoreDataCollection deserializedLastRemoteShortcutOrderingSubset](self->_coreDataCollection, "deserializedLastRemoteShortcutOrderingSubset");
}

- (void)setLastRemoteShortcutOrderingSubset:(id)a3
{
  -[WFCoreDataCollection setDeserializedLastRemoteShortcutOrderingSubset:](self->_coreDataCollection, "setDeserializedLastRemoteShortcutOrderingSubset:", a3);
}

- (NSOrderedSet)shortcutOrdering
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  if (-[WFCoreDataCollectionModel isFolder](self, "isFolder"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC7E58]);
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithFolderIdentifier:", v4);
    goto LABEL_8;
  }
  if (!-[WFCoreDataCollectionModel isRootCollection](self, "isRootCollection"))
  {
    -[WFCoreDataCollectionModel workflowType](self, "workflowType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_12;
    v8 = objc_alloc(MEMORY[0x1E0DC7E58]);
    -[WFCoreDataCollectionModel workflowType](self, "workflowType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "initWithWorkflowType:", v4);
LABEL_8:
    v6 = (void *)v5;

    if (v6)
      goto LABEL_9;
LABEL_12:
    v14 = (void *)objc_opt_new();
    return (NSOrderedSet *)v14;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 1);
  if (!v6)
    goto LABEL_12;
LABEL_9:
  -[WFCoreDataCollectionModel database](self, "database");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = *(void **)(v9 + 120);
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v12, "shortcutIdentifiersWithQuery:error:", v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v14;
}

- (void)setShortcutOrdering:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  WFDatabase *database;
  WFDatabase *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFCoreDataCollectionModel shortcutOrdering](self, "shortcutOrdering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToOrderedSet:", v5);

  if ((v6 & 1) == 0)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[WFCoreDataCollectionModel identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[WFCoreDataCollectionModel setShortcutOrdering:]";
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting shortcut ordering for %@: %@", buf, 0x20u);

    }
    database = self->_database;
    if (database)
      database = (WFDatabase *)database->_library;
    v10 = database;
    v11 = -[WFCoreDataCollectionModel isFolder](self, "isFolder");
    objc_msgSend(v4, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v26 = 0;
      v14 = -[WFDatabase setShortcutOrdering:forFolderIdentifier:error:](v10, "setShortcutOrdering:forFolderIdentifier:error:", v12, v13, &v26);
      v15 = v26;

      if ((v14 & 1) == 0)
      {
        getWFGeneralLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[WFCoreDataCollectionModel identifier](self, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v28 = "-[WFCoreDataCollectionModel setShortcutOrdering:]";
          v29 = 2112;
          v30 = v17;
          v31 = 2112;
          v32 = v15;
          v18 = "%s Unable to set shortcut ordering for folder: %@ %@";
LABEL_13:
          _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0x20u);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else
    {
      v25 = 0;
      v19 = -[WFDatabase setShortcutOrdering:forCollectionIdentifier:error:](v10, "setShortcutOrdering:forCollectionIdentifier:error:", v12, v13, &v25);
      v15 = v25;

      if ((v19 & 1) == 0)
      {
        getWFGeneralLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[WFCoreDataCollectionModel identifier](self, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v28 = "-[WFCoreDataCollectionModel setShortcutOrdering:]";
          v29 = 2112;
          v30 = v17;
          v31 = 2112;
          v32 = v15;
          v18 = "%s Unable to set shortcut ordering for collection: %@ %@";
          goto LABEL_13;
        }
LABEL_14:

      }
    }

    -[WFCoreDataCollectionModel database](self, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "saveLibraryToDatabase:", v10);

    -[WFCoreDataCollectionModel database](self, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0DC7AA8]);
    -[WFCoreDataCollectionModel identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithIdentifier:objectType:", v23, 2);
    objc_msgSend(v21, "addPendingUpdatedDescriptor:", v24);

  }
}

- (NSData)cloudKitFolderRecordMetadata
{
  return (NSData *)-[WFCoreDataCollection cloudKitFolderRecordMetadata](self->_coreDataCollection, "cloudKitFolderRecordMetadata");
}

- (void)setCloudKitFolderRecordMetadata:(id)a3
{
  -[WFCoreDataCollection setCloudKitFolderRecordMetadata:](self->_coreDataCollection, "setCloudKitFolderRecordMetadata:", a3);
}

- (NSData)cloudKitOrderingRecordMetadata
{
  return (NSData *)-[WFCoreDataCollection cloudKitOrderingRecordMetadata](self->_coreDataCollection, "cloudKitOrderingRecordMetadata");
}

- (void)setCloudKitOrderingRecordMetadata:(id)a3
{
  -[WFCoreDataCollection setCloudKitOrderingRecordMetadata:](self->_coreDataCollection, "setCloudKitOrderingRecordMetadata:", a3);
}

- (WFCoreDataCollection)coreDataCollection
{
  return self->_coreDataCollection;
}

- (WFDatabase)database
{
  return self->_database;
}

- (BOOL)isRootCollection
{
  return self->_isRootCollection;
}

- (NSString)workflowType
{
  return self->_workflowType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowType, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_coreDataCollection, 0);
}

id __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), *(_QWORD *)(a1 + 40), CFSTR("identifier"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectOfClass:withIdentifier:forKey:createIfNecessary:properties:", objc_opt_class(), *(_QWORD *)(a1 + 40), CFSTR("identifier"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deserializedLastRemoteShortcutOrdering");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__WFCoreDataCollectionModel_setCollectionOrdering___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
