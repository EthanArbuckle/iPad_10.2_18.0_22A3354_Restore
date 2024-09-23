@implementation PLFolderJournalEntryPayload

+ (id)modelPropertiesDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PLFolderJournalEntryPayload;
  objc_msgSendSuper2(&v11, sel_modelPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v12[0] = CFSTR("uuid");
  v12[1] = CFSTR("kind");
  v13 = CFSTR("childCollections");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("childCollections"), v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

  return v5;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLFolderJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_55942 != -1)
    dispatch_once(&modelProperties_onceToken_55942, block);
  return (id)modelProperties_modelProperties_55943;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PLFolderJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_55940 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_55940, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_55941;
}

+ (id)payloadClassID
{
  return +[PLManagedFolder entityName](PLManagedFolder, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (void)updateChildrenOrderingInFolder:(id)a3 usingChildCollectionUUIDs:(id)a4 includePendingChanges:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  _BYTE v24[18];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "childCollections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __110__PLFolderJournalEntryPayload_updateChildrenOrderingInFolder_usingChildCollectionUUIDs_includePendingChanges___block_invoke;
  v19[3] = &unk_1E3673960;
  v11 = v9;
  v20 = v11;
  v22 = a5;
  v12 = v8;
  v21 = v12;
  objc_msgSend(a1, "sortedObjectsToAddWithUUIDs:uuidKey:andExistingObjects:fetchBlock:", v11, CFSTR("uuid"), v10, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v24 = v15;
      *(_WORD *)&v24[8] = 2112;
      *(_QWORD *)&v24[10] = v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Updating children in folder %@ to match persisted UUID ordering from %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeChildCollections:", v16);
    objc_msgSend(v12, "addChildCollections:", v16);
  }
  else
  {
    if (!objc_msgSend(v11, "count"))
      goto LABEL_6;
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v11, "count");
      objc_msgSend(v12, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v24 = v17;
      *(_WORD *)&v24[4] = 2112;
      *(_QWORD *)&v24[6] = v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Persisted child collection UUIDs (%d total) match database ordering for folder %@", buf, 0x12u);

    }
  }

LABEL_6:
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PLManagedFolder validKindsForPersistence](PLManagedFolder, "validKindsForPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

id __110__PLFolderJournalEntryPayload_updateChildrenOrderingInFolder_usingChildCollectionUUIDs_includePendingChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("uuid in %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v4, "setIncludesPendingChanges:", 1);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v4, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __67__PLFolderJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_55941;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_55941 = v1;

}

uint64_t __46__PLFolderJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_55943;
  modelProperties_modelProperties_55943 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_55943, 0);
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  void *v36;
  PLFolderJournalEntryPayload *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("childCollections")))
  {
    v47.receiver = self;
    v47.super_class = (Class)PLFolderJournalEntryPayload;
    v34 = -[PLGenericAlbumJournalEntryPayload updatePayloadAttributes:andNilAttributes:withManagedObject:forPayloadProperty:](&v47, sel_updatePayloadAttributes_andNilAttributes_withManagedObject_forPayloadProperty_, v10, v11, v12, v13);
    goto LABEL_21;
  }
  v37 = self;
  v38 = v13;
  v40 = v11;
  v41 = v10;
  v39 = v12;
  v14 = v12;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = v14;
  objc_msgSend(v14, "childCollections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (!v17)
    goto LABEL_19;
  v18 = v17;
  v19 = *(_QWORD *)v49;
  v20 = &off_1E3659000;
  v42 = v16;
  v43 = v15;
  v45 = *(_QWORD *)v49;
  do
  {
    v21 = 0;
    v46 = v18;
    do
    {
      if (*(_QWORD *)v49 != v19)
        objc_enumerationMutation(v16);
      v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v21);
      objc_msgSend(v20[480], "validKindsForPersistence");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "kind");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "containsObject:", v24) & 1) != 0)
        goto LABEL_12;
      +[PLManagedAlbum validKindsForPersistence](PLManagedAlbum, "validKindsForPersistence");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "kind");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "containsObject:", v26) & 1) != 0)
        goto LABEL_11;
      +[PLFetchingAlbum validKindsForPersistence](PLFetchingAlbum, "validKindsForPersistence");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "kind");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "containsObject:", v28) & 1) != 0)
      {

        v19 = v45;
        v20 = &off_1E3659000;
LABEL_11:

        v18 = v46;
LABEL_12:

LABEL_13:
        objc_msgSend(v22, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v29);

        goto LABEL_14;
      }
      +[PLProjectAlbum validKindsForPersistence](PLProjectAlbum, "validKindsForPersistence");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "kind");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v30, "containsObject:", v31);

      v15 = v43;
      v16 = v42;

      v19 = v45;
      v18 = v46;
      v20 = &off_1E3659000;
      if ((v44 & 1) != 0)
        goto LABEL_13;
LABEL_14:
      ++v21;
    }
    while (v18 != v21);
    v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    v18 = v32;
  }
  while (v32);
LABEL_19:

  -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringOrderedSet:](v37, "encodedDataForUUIDStringOrderedSet:", v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v40;
  v10 = v41;
  v13 = v38;
  -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](v37, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v41, v40, v38, v33);

  v34 = 1;
  v12 = v39;
LABEL_21:

  return v34;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("childCollections")))
  {
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)PLFolderJournalEntryPayload;
    -[PLGenericAlbumJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v9);
    v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLFolderJournalEntryPayload;
    -[PLGenericAlbumJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v10, v9);
  }

}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("childCollections")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLFolderJournalEntryPayload;
    -[PLGenericAlbumJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v12, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSOrderedSet)childCollectionUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("childCollections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (BOOL)isRootFolder
{
  void *v2;
  BOOL v3;

  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 3999;

  return v3;
}

- (BOOL)isProjectAlbumRootFolder
{
  void *v2;
  BOOL v3;

  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 3998;

  return v3;
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if ((v6 - 3998) < 2)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Can't replace singleton root folder from payload", (uint8_t *)&v18, 2u);
    }
    goto LABEL_11;
  }
  if (v6 == 1553)
  {
    -[PLGenericAlbumJournalEntryPayload title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = 1553;
    goto LABEL_8;
  }
  if (v6 != 4000)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unknown Folder Kind %@ for uuid %@", (uint8_t *)&v18, 0x16u);

    }
LABEL_11:

    v12 = 0;
    goto LABEL_12;
  }
  -[PLGenericAlbumJournalEntryPayload title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = 4000;
LABEL_8:
  +[PLManagedFolder insertNewFolderWithTitle:kind:intoLibrary:](PLManagedFolder, "insertNewFolderWithTitle:kind:intoLibrary:", v9, v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payloadIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUuid:", v16);

  return v12;
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PLFolderJournalEntryPayload;
  v6 = a3;
  -[PLGenericAlbumJournalEntryPayload updateAlbum:includePendingChanges:](&v9, sel_updateAlbum_includePendingChanges_, v6, v4);
  v7 = (void *)objc_opt_class();
  -[PLFolderJournalEntryPayload childCollectionUUIDs](self, "childCollectionUUIDs", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateChildrenOrderingInFolder:usingChildCollectionUUIDs:includePendingChanges:", v6, v8, v4);

}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  unsigned __int8 v21;
  id v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("childCollections")))
  {
    v23 = v10;
    v11 = v9;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (+[PLFolderJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLFolderJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0)|| +[PLAlbumJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLAlbumJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0)|| +[PLFetchingAlbumJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLFetchingAlbumJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0)|| +[PLProjectAlbumJournalEntryPayload isValidForPersistenceWithObjectDictionary:additionalEntityName:](PLProjectAlbumJournalEntryPayload, "isValidForPersistenceWithObjectDictionary:additionalEntityName:", v18, 0))
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("uuid"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    v20 = objc_msgSend(v12, "count");
    if (v8 || v20)
      v21 = objc_msgSend(v12, "isEqualToOrderedSet:", v8);
    else
      v21 = 1;
    v10 = v23;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PLFolderJournalEntryPayload;
    v21 = -[PLGenericAlbumJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v24, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
  }

  return v21;
}

@end
