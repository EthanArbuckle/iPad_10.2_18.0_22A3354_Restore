@implementation WFCoreDataCollection

- (id)descriptor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataCollection identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFCoreDataCollection workflowIcon](self, "workflowIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFCoreDataCollection workflowIcon](self, "workflowIcon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "glyphCharacter");

    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0DC7E10], "defaultGlyphCharacter");
    }

    -[WFCoreDataCollection name](self, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E7AFA810;
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    v17 = objc_alloc(MEMORY[0x1E0DC7E10]);
    -[WFCoreDataCollection identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithIdentifier:isFolder:name:glyphCharacter:isDeleted:", v18, -[WFCoreDataCollection isFolder](self, "isFolder"), v16, v6, -[WFCoreDataCollection tombstoned](self, "tombstoned"));

    return v19;
  }
  else
  {
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[WFCoreDataCollection name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCoreDataCollection parents](self, "parents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCoreDataCollection collections](self, "collections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCoreDataCollection shortcuts](self, "shortcuts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136316674;
      v21 = "-[WFCoreDataCollection(RecordStorage) descriptor]";
      v22 = 2114;
      v23 = v8;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      v28 = 2114;
      v29 = v11;
      v30 = 2050;
      v31 = -[WFCoreDataCollection lastSyncedHash](self, "lastSyncedHash");
      v32 = 1026;
      v33 = -[WFCoreDataCollection tombstoned](self, "tombstoned");
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Trying to create a descriptor for a collection with nil identifier, name = %{public}@, parents = %{public}@, collections = %{public}@, shortcuts = %{public}@, lastSyncedHash = %{public}lld, tombstoned = %{public}d", (uint8_t *)&v20, 0x44u);

    }
    return 0;
  }
}

- (WFWorkflowIcon)workflowIcon
{
  void *v2;
  void *v3;

  -[WFCoreDataCollection icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v2, "backgroundColorValue"), (unsigned __int16)objc_msgSend(v2, "glyphNumber"), 0);

  return (WFWorkflowIcon *)v3;
}

- (BOOL)isFolder
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  -[WFCoreDataCollection identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WFGetBuiltInCollectionIdentifiers(1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataCollection identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)descriptorFetchRequest
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("name");
  v7[2] = CFSTR("icon");
  v7[3] = CFSTR("tombstoned");
  v7[4] = CFSTR("lastSyncedEncryptedSchemaVersion");
  v7[5] = CFSTR("wantedEncryptedSchemaVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  v6[0] = CFSTR("icon");
  v6[1] = CFSTR("parents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v4);

  return v2;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Collection"));
}

- (void)setWorkflowIcon:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFCoreDataCollection icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C97B20];
    -[WFCoreDataCollection managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ShortcutIcon"), v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    objc_msgSend(v6, "setBackgroundColorValue:", objc_msgSend(v9, "backgroundColorValue"));
    objc_msgSend(v6, "setGlyphNumber:", objc_msgSend(v9, "glyphCharacter"));
  }
  -[WFCoreDataCollection setIcon:](self, "setIcon:", v6);

}

- (NSArray)shortcutOrdering
{
  return (NSArray *)WFOrderedSetFromOrderedRelationshipProperty(self, CFSTR("shortcuts"), CFSTR("workflowID"));
}

- (void)setShortcutOrdering:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  WFCoreDataCollection *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDataWorkflow.m"), 684, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutOrdering"));

  }
  v27 = self;
  -[WFCoreDataCollection managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("workflowID"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v6, "executeFetchRequest:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v17, "workflowID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v14);
  }

  v19 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v22);
  }

  -[WFCoreDataCollection setShortcuts:](v27, "setShortcuts:", v19);
}

- (NSArray)collectionOrdering
{
  return (NSArray *)WFOrderedSetFromOrderedRelationshipProperty(self, CFSTR("collections"), CFSTR("identifier"));
}

- (void)setCollectionOrdering:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[WFCoreDataCollection managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDataWorkflow.m"), 693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionOrdering"));

    -[WFCoreDataCollection managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  WFCoreDataCollectionsWithIdentifiers(v6, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataCollection setCollections:](self, "setCollections:", v7);

}

- (NSOrderedSet)deserializedLastRemoteShortcutOrdering
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataCollection lastRemoteShortcutOrderingData](self, "lastRemoteShortcutOrderingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataCollection lastRemoteShortcutOrderingData](self, "lastRemoteShortcutOrderingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      getWFDatabaseLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteShortcutOrdering]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote shortcut ordering from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteShortcutOrdering:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WFCoreDataCollection *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      getWFDatabaseLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteShortcutOrdering:]";
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote shortcut ordering into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    -[WFCoreDataCollection setLastRemoteShortcutOrderingData:](v8, "setLastRemoteShortcutOrderingData:", v9);

  }
  else
  {
    -[WFCoreDataCollection setLastRemoteShortcutOrderingData:](self, "setLastRemoteShortcutOrderingData:", 0);
  }
}

- (NSOrderedSet)deserializedLastRemoteShortcutOrderingSubset
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataCollection lastRemoteShortcutOrderingSubsetData](self, "lastRemoteShortcutOrderingSubsetData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataCollection lastRemoteShortcutOrderingSubsetData](self, "lastRemoteShortcutOrderingSubsetData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      getWFDatabaseLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteShortcutOrderingSubset]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote shortcut ordering subset from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteShortcutOrderingSubset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WFCoreDataCollection *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      getWFDatabaseLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteShortcutOrderingSubset:]";
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote shortcut ordering subset into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    -[WFCoreDataCollection setLastRemoteShortcutOrderingSubsetData:](v8, "setLastRemoteShortcutOrderingSubsetData:", v9);

  }
  else
  {
    -[WFCoreDataCollection setLastRemoteShortcutOrderingSubsetData:](self, "setLastRemoteShortcutOrderingSubsetData:", 0);
  }
}

- (NSOrderedSet)deserializedLastRemoteCollectionOrdering
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataCollection lastRemoteCollectionOrderingData](self, "lastRemoteCollectionOrderingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataCollection lastRemoteCollectionOrderingData](self, "lastRemoteCollectionOrderingData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      getWFDatabaseLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteCollectionOrdering]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote collection ordering from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteCollectionOrdering:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WFCoreDataCollection *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      getWFDatabaseLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteCollectionOrdering:]";
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote collection ordering into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    -[WFCoreDataCollection setLastRemoteCollectionOrderingData:](v8, "setLastRemoteCollectionOrderingData:", v9);

  }
  else
  {
    -[WFCoreDataCollection setLastRemoteCollectionOrderingData:](self, "setLastRemoteCollectionOrderingData:", 0);
  }
}

- (NSOrderedSet)deserializedLastRemoteCollectionOrderingSubset
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataCollection lastRemoteCollectionOrderingSubsetData](self, "lastRemoteCollectionOrderingSubsetData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataCollection lastRemoteCollectionOrderingSubsetData](self, "lastRemoteCollectionOrderingSubsetData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      getWFDatabaseLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataCollection(RecordStorage) deserializedLastRemoteCollectionOrderingSubset]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize last remote collection ordering subset from plist data: %{public}@", buf, 0x16u);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (NSOrderedSet *)v8;
}

- (void)setDeserializedLastRemoteCollectionOrderingSubset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  WFCoreDataCollection *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;

    if (v6)
    {
      v8 = self;
      v9 = v6;
    }
    else
    {
      getWFDatabaseLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFCoreDataCollection(RecordStorage) setDeserializedLastRemoteCollectionOrderingSubset:]";
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Failed to serialize last remote collection ordering subset into plist data: %{public}@", buf, 0x16u);
      }

      v8 = self;
      v9 = 0;
    }
    -[WFCoreDataCollection setLastRemoteCollectionOrderingSubsetData:](v8, "setLastRemoteCollectionOrderingSubsetData:", v9);

  }
  else
  {
    -[WFCoreDataCollection setLastRemoteCollectionOrderingSubsetData:](self, "setLastRemoteCollectionOrderingSubsetData:", 0);
  }
}

+ (id)recordPropertyMap
{
  _QWORD v3[8];
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("icon");
  v3[1] = CFSTR("deleted");
  v4[0] = CFSTR("workflowIcon");
  v4[1] = CFSTR("tombstoned");
  v3[2] = CFSTR("lastRemoteShortcutOrdering");
  v3[3] = CFSTR("lastRemoteShortcutOrderingSubset");
  v4[2] = CFSTR("deserializedLastRemoteShortcutOrdering");
  v4[3] = CFSTR("deserializedLastRemoteShortcutOrderingSubset");
  v3[4] = CFSTR("lastRemoteCollectionOrdering");
  v3[5] = CFSTR("lastRemoteCollectionOrderingSubset");
  v4[4] = CFSTR("deserializedLastRemoteCollectionOrdering");
  v4[5] = CFSTR("deserializedLastRemoteCollectionOrderingSubset");
  v3[6] = CFSTR("wantedEncryptedSchemaVersion");
  v3[7] = CFSTR("lastSyncedEncryptedSchemaVersion");
  v4[6] = CFSTR("wantedEncryptedSchemaVersion");
  v4[7] = CFSTR("lastSyncedEncryptedSchemaVersion");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
