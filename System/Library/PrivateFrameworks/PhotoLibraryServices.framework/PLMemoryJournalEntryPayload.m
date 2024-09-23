@implementation PLMemoryJournalEntryPayload

- (id)insertMemoryFromDataInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PLManagedObject insertInManagedObjectContext:](PLMemory, "insertInManagedObjectContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v6);

  -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v4, 0);
  return v4;
}

- (PLMemoryJournalEntryPayload)initWithUserFeedback:(id)a3 changedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PLMemoryJournalEntryPayload *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "modelProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("userFeedbacks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subRelationshipProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "intersectsSet:", v13))
    {
      objc_msgSend(v6, "memory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "payloadID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend((id)objc_opt_class(), "payloadVersion");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("userFeedbacks"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "modelProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21.receiver = self;
      v21.super_class = (Class)PLMemoryJournalEntryPayload;
      v19 = -[PLManagedObjectJournalEntryPayload initWithPayloadID:payloadVersion:managedObject:changedKeys:modelProperties:](&v21, sel_initWithPayloadID_payloadVersion_managedObject_changedKeys_modelProperties_, v15, v16, v14, v17, v18);

    }
    else
    {

      v19 = 0;
    }

  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (BOOL)updateAssetsInMemory:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  BOOL v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  _QWORD v73[6];

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLMemoryJournalEntryPayload curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  -[PLMemoryJournalEntryPayload extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v9);

  -[PLMemoryJournalEntryPayload movieCuratedAssetUUIDs](self, "movieCuratedAssetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v10);

  -[PLMemoryJournalEntryPayload userCuratedAssetUUIDs](self, "userCuratedAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v11);

  -[PLMemoryJournalEntryPayload userRemovedAssetUUIDs](self, "userRemovedAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v12);

  -[PLMemoryJournalEntryPayload representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v13);

  -[PLMemoryJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PLMemoryJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v15);

  }
  if (v4)
    v16 = 3;
  else
    v16 = 0;
  objc_msgSend(v7, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v16;
  +[PLManagedAsset assetsWithUUIDs:options:inManagedObjectContext:](PLManagedAsset, "assetsWithUUIDs:options:inManagedObjectContext:", v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "count");
  v68 = v20 == objc_msgSend(v7, "count");
  v21 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryJournalEntryPayload curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v24;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCuratedAssets:", v25);

  v26 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryJournalEntryPayload extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  v65 = (void *)v29;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtendedCuratedAssets:", v30);

  v31 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryJournalEntryPayload movieCuratedAssetUUIDs](self, "movieCuratedAssetUUIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v33);
  v34 = objc_claimAutoreleasedReturnValue();

  v64 = (void *)v34;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMovieCuratedAssets:", v35);

  v36 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryJournalEntryPayload userCuratedAssetUUIDs](self, "userCuratedAssetUUIDs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v63 = (void *)v39;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserCuratedAssets:", v40);

  v41 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryJournalEntryPayload representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v43);
  v44 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v44;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRepresentativeAssets:", v45);

  v46 = (void *)MEMORY[0x1E0CB3880];
  -[PLMemoryJournalEntryPayload userRemovedAssetUUIDs](self, "userRemovedAssetUUIDs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserRemovedAssets:", v50);

  -[PLMemoryJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = MEMORY[0x1E0C809B0];
  if (v51)
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke;
    v73[3] = &unk_1E366BAE8;
    v73[4] = self;
    v53 = objc_msgSend(v19, "indexOfObjectPassingTest:", v73);
    if (v53 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v68 = 0;
    }
    else
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setKeyAsset:", v54);

    }
  }
  -[PLMemoryJournalEntryPayload customUserAssetUUIDs](self, "customUserAssetUUIDs");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_opt_class();
  v69[0] = v52;
  v69[1] = 3221225472;
  v69[2] = __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke_2;
  v69[3] = &unk_1E366BB10;
  v57 = v55;
  v70 = v57;
  v72 = v66;
  v58 = v6;
  v71 = v58;
  objc_msgSend(v56, "sortedObjectsToAddWithUUIDs:uuidKey:andExistingObjects:fetchBlock:", v57, CFSTR("uuid"), 0, v69);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCustomUserAssets:", v60);

  }
  return v68;
}

- (BOOL)hasAllAssetsAvailableInManagedObjectContext:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
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
  void *v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  id v24;
  uint8_t buf[4];
  PLMemoryJournalEntryPayload *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMemoryJournalEntryPayload representativeAssetUUIDs](self, "representativeAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);

  -[PLMemoryJournalEntryPayload curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v10);

  -[PLMemoryJournalEntryPayload extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v11);

  -[PLMemoryJournalEntryPayload movieCuratedAssetUUIDs](self, "movieCuratedAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v12);

  -[PLMemoryJournalEntryPayload userCuratedAssetUUIDs](self, "userCuratedAssetUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v13);

  -[PLMemoryJournalEntryPayload userRemovedAssetUUIDs](self, "userRemovedAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v14);

  -[PLMemoryJournalEntryPayload customUserAssetUUIDs](self, "customUserAssetUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v16);

  -[PLMemoryJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v8, "addObject:", v17);
  objc_msgSend(v8, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v19 = +[PLManagedAsset countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:](PLManagedAsset, "countForAssetsWithUUIDs:includePendingChanges:inManagedObjectContext:error:", v18, v4, v7, &v24);

  v20 = v24;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch count for assets in memory metadata %@, %@", buf, 0x16u);
    }

  }
  v22 = v19 == objc_msgSend(v8, "count");

  return v22;
}

- (NSSet)curatedAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("curatedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)extendedCuratedAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("extendedCuratedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSString)keyAssetUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSSet)movieCuratedAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("movieCuratedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)userCuratedAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("userCuratedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)userRemovedAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("userRemovedAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)representativeAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("representativeAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSOrderedSet)customUserAssetUUIDs
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("customUserAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v4;
}

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("movieAssetState")))
  {
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("keyAsset")))
    {
      objc_msgSend(v14, "keyAsset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "key");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

      goto LABEL_21;
    }
    if (objc_msgSend(v13, "isEqualToKey:", CFSTR("curatedAssets")))
    {
      objc_msgSend(v14, "curatedAssets");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v13, "isEqualToKey:", CFSTR("extendedCuratedAssets")))
    {
      objc_msgSend(v14, "extendedCuratedAssets");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v13, "isEqualToKey:", CFSTR("movieCuratedAssets")))
    {
      objc_msgSend(v14, "movieCuratedAssets");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v13, "isEqualToKey:", CFSTR("userCuratedAssets")))
    {
      objc_msgSend(v14, "userCuratedAssets");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v13, "isEqualToKey:", CFSTR("representativeAssets")))
    {
      objc_msgSend(v14, "representativeAssets");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v13, "isEqualToKey:", CFSTR("customUserAssets")))
      {
        objc_msgSend(v14, "customUserAssets");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "relatedEntityPropertyNames");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "anyObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "valueForKey:", v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringOrderedSet:](self, "encodedDataForUUIDStringOrderedSet:", v15);
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v16 = (void *)v23;
        -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:](self, "updatePayloadAttributes:andNilAttributes:forPayloadProperty:withUUIDStringData:", v10, v11, v13, v23);
        goto LABEL_21;
      }
      if (!objc_msgSend(v13, "isEqualToKey:", CFSTR("userRemovedAssets")))
      {
        v27 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v14, "userRemovedAssets");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v19;
    objc_msgSend(v13, "relatedEntityPropertyNames");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "anyObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLManagedObjectJournalEntryPayload encodedDataForUUIDStringSet:](self, "encodedDataForUUIDStringSet:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(v14, "movieAssetState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);
LABEL_21:

  v27 = 1;
LABEL_22:

  return v27;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("keyAsset")))
  {
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)PLMemoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v15, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("curatedAssets")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("extendedCuratedAssets")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("movieCuratedAssets")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("userCuratedAssets")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("userRemovedAssets")) & 1) != 0
         || objc_msgSend(v8, "isEqualToString:", CFSTR("representativeAssets")))
  {
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)PLMemoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v14, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("customUserAssets")))
    {
      v12.receiver = self;
      v12.super_class = (Class)PLMemoryJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v9, v10);
      goto LABEL_11;
    }
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PLMemoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v10);
  }

LABEL_11:
}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("keyAsset")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v7, "isEqualToKey:", CFSTR("curatedAssets")) & 1) != 0
         || (objc_msgSend(v7, "isEqualToKey:", CFSTR("extendedCuratedAssets")) & 1) != 0
         || (objc_msgSend(v7, "isEqualToKey:", CFSTR("movieCuratedAssets")) & 1) != 0
         || (objc_msgSend(v7, "isEqualToKey:", CFSTR("userCuratedAssets")) & 1) != 0
         || (objc_msgSend(v7, "isEqualToKey:", CFSTR("userRemovedAssets")) & 1) != 0
         || objc_msgSend(v7, "isEqualToKey:", CFSTR("representativeAssets")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload setForUUIDEncodedData:](self, "setForUUIDEncodedData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToKey:", CFSTR("customUserAssets")))
    {
      v13.receiver = self;
      v13.super_class = (Class)PLMemoryJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v13, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload orderedSetForUUIDEncodedData:](self, "orderedSetForUUIDEncodedData:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

LABEL_11:
  return v11;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSMutableDictionary *payloadAttributes;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  PLMemoryJournalEntryPayload *v37;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;
  objc_super v42;
  _QWORD v43[5];
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40 = a6;
  if (objc_msgSend(v10, "requiresConversion"))
  {
    v13 = v11;
    objc_msgSend(v10, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("movieAssetState"));

    if (v15)
    {
      payloadAttributes = self->super._payloadAttributes;
      objc_msgSend(v10, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMovieAssetState:", v18);

    }
    else if (objc_msgSend(v10, "isEqualToKey:", CFSTR("userFeedbacks")))
    {
      v38 = v13;
      v39 = v10;
      v35 = v12;
      v36 = v11;
      v37 = self;
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("userFeedbacks"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v48 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("userFeedbackUUID"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(v38, "managedObjectContext");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLUserFeedback insertIntoManagedObjectContext:withUUID:](PLUserFeedback, "insertIntoManagedObjectContext:withUUID:", v31, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v39, "subRelationshipProperties");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __98__PLMemoryJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke;
              v43[3] = &unk_1E3670238;
              v43[4] = v37;
              v44 = v32;
              v45 = v40;
              v46 = v29;
              v34 = v32;
              objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v43);

              objc_msgSend(v23, "addObject:", v34);
            }

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v26);
      }

      v13 = v38;
      objc_msgSend(v38, "setUserFeedbacks:", v23);

      v10 = v39;
      v12 = v35;
      v11 = v36;
    }

  }
  else
  {
    objc_msgSend(v10, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("viewCount"));

    if (v20)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("viewCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42.receiver = self;
        v42.super_class = (Class)PLMemoryJournalEntryPayload;
        -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v42, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v40);
      }

    }
    else
    {
      v41.receiver = self;
      v41.super_class = (Class)PLMemoryJournalEntryPayload;
      -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v41, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v40);
    }
  }

}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  unsigned __int8 v13;
  void *v14;
  char v15;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("movieAssetState")))
  {
    if (objc_msgSend(v10, "isEqualToKey:", CFSTR("keyAsset")))
    {
      v13 = objc_msgSend(v9, "isEqualToString:", v8);
LABEL_6:
      v12 = v13;
      goto LABEL_17;
    }
    if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("curatedAssets")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("extendedCuratedAssets")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("movieCuratedAssets")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("userCuratedAssets")) & 1) != 0
      || (objc_msgSend(v10, "isEqualToKey:", CFSTR("userRemovedAssets")) & 1) != 0
      || objc_msgSend(v10, "isEqualToKey:", CFSTR("representativeAssets")))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToSet:", v8);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("customUserAssets")))
      {
        v17.receiver = self;
        v17.super_class = (Class)PLMemoryJournalEntryPayload;
        v13 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v17, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToOrderedSet:", v8);
    }
    v12 = v15;

    goto LABEL_17;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = objc_msgSend(v9, "count");
  v24 = v11 == objc_msgSend(v8, "count");
  if (*((_BYTE *)v22 + 24))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __94__PLMemoryJournalEntryPayload_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty___block_invoke;
    v18[3] = &unk_1E366BB38;
    v19 = v8;
    v20 = &v21;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v18);

    v12 = *((_BYTE *)v22 + 24) != 0;
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v21, 8);
LABEL_17:

  return v12;
}

void __94__PLMemoryJournalEntryPayload_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
  else
    v8 = v7;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v9);

  if ((v11 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __98__PLMemoryJournalEntryPayload_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:payloadDictionary:info:", a3, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

uint64_t __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyAssetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __79__PLMemoryJournalEntryPayload_updateAssetsInMemory_includePendingAssetChanges___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetsWithUUIDs:options:inManagedObjectContext:](PLManagedAsset, "assetsWithUUIDs:options:inManagedObjectContext:", v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)modelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v32;
  void *v33;
  void *v34;
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
  void *v50;
  void *v51;
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[31];
  _QWORD v55[33];

  v55[31] = *MEMORY[0x1E0C80C00];
  v54[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v51;
  v54[1] = CFSTR("title");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v50;
  v54[2] = CFSTR("subtitle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v49;
  v54[3] = CFSTR("creationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v48;
  v54[4] = CFSTR("assetListPredicate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v47;
  v54[5] = CFSTR("blacklistedFeature");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v46;
  v54[6] = CFSTR("category");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v45;
  v54[7] = CFSTR("favorite");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v44;
  v54[8] = CFSTR("movieAssetState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v43;
  v54[9] = CFSTR("movieData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v42;
  v54[10] = CFSTR("notificationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v41;
  v54[11] = CFSTR("pendingState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("pending"), 100, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v40;
  v54[12] = CFSTR("creationType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("creationType"), 100, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v39;
  v54[13] = CFSTR("photosGraphData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v38;
  v54[14] = CFSTR("photosGraphVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v37;
  v54[15] = CFSTR("playCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v36;
  v54[16] = CFSTR("rejected");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v35;
  v54[17] = CFSTR("score");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v34;
  v54[18] = CFSTR("shareCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v33;
  v54[19] = CFSTR("subcategory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v32;
  v54[20] = CFSTR("userActionOptions");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userCreated"), 100, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[20] = v31;
  v54[21] = CFSTR("viewCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[21] = v30;
  v54[22] = CFSTR("keyAsset");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("keyAsset"), v2, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v55[22] = v29;
  v54[23] = CFSTR("curatedAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("curatedAssets"), v3, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v55[23] = v28;
  v54[24] = CFSTR("extendedCuratedAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("extendedCuratedAssets"), v4, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v55[24] = v27;
  v54[25] = CFSTR("movieCuratedAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("movieCuratedAssets"), v5, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v55[25] = v26;
  v54[26] = CFSTR("userCuratedAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("userCuratedAssets"), v6, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v55[26] = v25;
  v54[27] = CFSTR("representativeAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("representativeAssets"), v7, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v55[27] = v24;
  v54[28] = CFSTR("customUserAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("customUserAssets"), v8, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v55[28] = v23;
  v54[29] = CFSTR("userRemovedAssets");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("userRemovedAssets"), v9, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v55[29] = v22;
  v54[30] = CFSTR("userFeedbacks");
  +[PLUserFeedback entityName](PLUserFeedback, "entityName");
  v10 = objc_claimAutoreleasedReturnValue();
  v52[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackUUID"), 700, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v11;
  v52[1] = CFSTR("type");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackType"), 100, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v12;
  v52[2] = CFSTR("feature");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackFeature"), 100, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v13;
  v52[3] = CFSTR("creationType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackCreationType"), 100, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v14;
  v52[4] = CFSTR("context");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackContext"), 700, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v15;
  v52[5] = CFSTR("lastModifiedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("userFeedbackLastModifiedDate"), 900, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v10;
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", CFSTR("userFeedbacks"), v17, v10, 1, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[30] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)nonPersistedModelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[20];
  _QWORD v32[22];

  v32[20] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("graphMemoryIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  v31[1] = CFSTR("storyColorGradeKind");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v27;
  v31[2] = CFSTR("storySerializedTitleCategory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v26;
  v31[3] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v25;
  v31[4] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v24;
  v31[5] = CFSTR("lastMoviePlayedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v23;
  v31[6] = CFSTR("lastViewedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v22;
  v31[7] = CFSTR("lastEnrichmentDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v21;
  v31[8] = CFSTR("pendingPlayCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v20;
  v31[9] = CFSTR("pendingShareCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v19;
  v31[10] = CFSTR("pendingViewCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v18;
  v31[11] = CFSTR("featuredState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v17;
  v31[12] = CFSTR("syndicatedContentState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[12] = v16;
  v31[13] = CFSTR("sharingComposition");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[13] = v15;
  v31[14] = CFSTR("searchIndexRebuildState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[14] = v14;
  v31[15] = CFSTR("startDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[15] = v13;
  v31[16] = CFSTR("endDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32[16] = v2;
  v31[17] = CFSTR("sourceGeneratedMemory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[17] = v3;
  v31[18] = CFSTR("targetUserEditedMemory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[18] = v4;
  v31[19] = CFSTR("userFeedbacks");
  v29[0] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  v29[1] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v6;
  v29[2] = CFSTR("memory");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v7;
  v29[3] = CFSTR("person");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:subRelationshipProperties:subRelationshipEntityName:isToMany:isAdditionalEntityName:info:", 0, v9, 0, 1, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[19] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLMemoryJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_51639 != -1)
    dispatch_once(&modelProperties_onceToken_51639, block);
  return (id)modelProperties_modelProperties_51640;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PLMemoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_51637 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_51637, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_51638;
}

+ (id)payloadClassID
{
  return +[PLMemory entityName](PLMemory, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pendingState"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue") == 0;

  return v5;
}

void __67__PLMemoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_51638;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_51638 = v1;

}

uint64_t __46__PLMemoryJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_51640;
  modelProperties_modelProperties_51640 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_51640, 0);
}

@end
