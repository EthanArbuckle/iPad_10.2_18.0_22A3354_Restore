@implementation WFCoreDataWorkflow

- (id)descriptor
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  WFWorkflowReference *v23;
  WFWorkflowReference *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v23 = [WFWorkflowReference alloc];
  -[WFCoreDataWorkflow workflowID](self, "workflowID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow name](self, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow icon](self, "icon");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v28, "backgroundColorValue");
  -[WFCoreDataWorkflow icon](self, "icon");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v27, "glyphNumber");
  -[WFCoreDataWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow subtitle](self, "subtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow actionsDescription](self, "actionsDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WFCoreDataWorkflow actionCount](self, "actionCount");
  v17 = -[WFCoreDataWorkflow syncHash](self, "syncHash");
  v16 = -[WFCoreDataWorkflow tombstoned](self, "tombstoned");
  v15 = -[WFCoreDataWorkflow hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync");
  -[WFCoreDataWorkflow creationDate](self, "creationDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow modificationDate](self, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFCoreDataWorkflow lastRunEventDate](self, "lastRunEventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCoreDataWorkflow remoteQuarantineStatus](self, "remoteQuarantineStatus");
  -[WFCoreDataWorkflow remoteQuarantineHash](self, "remoteQuarantineHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFCoreDataWorkflow hasShortcutInputVariables](self, "hasShortcutInputVariables");
  v9 = -[WFCoreDataWorkflow disabledOnLockScreen](self, "disabledOnLockScreen");
  -[WFCoreDataWorkflow source](self, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[WFCoreDataWorkflow runEventsCount](self, "runEventsCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v14) = v9;
  LOBYTE(v14) = v8;
  BYTE1(v13) = v15;
  LOBYTE(v13) = v16;
  v24 = -[WFWorkflowReference initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:](v23, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:", v26, v25, v20, v19, v22, v21, v3, v18, v17, v13, v30, v29, v5, v6, v7,
          v14,
          v10,
          v11);

  if (!v4)
  return v24;
}

- (NSString)subtitle
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[WFCoreDataWorkflow actionCount](self, "actionCount");
  -[WFCoreDataWorkflow workflowSubtitle](self, "workflowSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflowRecord workflowSubtitleForActionCount:savedSubtitle:](WFWorkflowRecord, "workflowSubtitleForActionCount:savedSubtitle:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (int64_t)remoteQuarantineStatus
{
  return (int)-[WFCoreDataWorkflow remoteQuarantineStatusValue](self, "remoteQuarantineStatusValue");
}

- (NSArray)deserializedActions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataWorkflow actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      getWFDatabaseLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[WFCoreDataWorkflow(RecordStorage) deserializedActions]";
        v11 = 2114;
        v12 = v5;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize actions from plist data: %{public}@", buf, 0x16u);
      }

      v4 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

+ (id)descriptorFetchRequest
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[18];

  v7[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v7[0] = CFSTR("workflowID");
  v7[1] = CFSTR("name");
  v7[2] = CFSTR("workflowSubtitle");
  v7[3] = CFSTR("actionsDescription");
  v7[4] = CFSTR("actionCount");
  v7[5] = CFSTR("associatedAppBundleIdentifier");
  v7[6] = CFSTR("icon");
  v7[7] = CFSTR("tombstoned");
  v7[8] = CFSTR("triggerCount");
  v7[9] = CFSTR("modificationDate");
  v7[10] = CFSTR("lastRunEventDate");
  v7[11] = CFSTR("remoteQuarantineStatusValue");
  v7[12] = CFSTR("hasShortcutInputVariables");
  v7[13] = CFSTR("disabledOnLockScreen");
  v7[14] = CFSTR("hiddenFromLibraryAndSync");
  v7[15] = CFSTR("wantedEncryptedSchemaVersion");
  v7[16] = CFSTR("lastSyncedEncryptedSchemaVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  v6[0] = CFSTR("icon");
  v6[1] = CFSTR("triggers");
  v6[2] = CFSTR("runEvents");
  v6[3] = CFSTR("parents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v4);

  return v2;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Shortcut"));
}

- (void)didUpdateProperties:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[WFCoreDataWorkflow syncHash](self, "syncHash");
    v6 = -[WFCoreDataWorkflow computedSyncHash](self, "computedSyncHash");
    getWFDatabaseLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[WFCoreDataWorkflow workflowID](self, "workflowID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 136315906;
        v12 = "-[WFCoreDataWorkflow(RecordStorage) didUpdateProperties:]";
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = (uint64_t)v9;
        v17 = 2048;
        v18 = v5;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Properties %@ changed of workflow %@, but sync hash %lld stayed stable", (uint8_t *)&v11, 0x2Au);

      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[WFCoreDataWorkflow workflowID](self, "workflowID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 136316162;
        v12 = "-[WFCoreDataWorkflow(RecordStorage) didUpdateProperties:]";
        v13 = 2112;
        v14 = v10;
        v15 = 2048;
        v16 = v5;
        v17 = 2048;
        v18 = v6;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating syncHash of workflow: %@ from %lld -> %lld. (Because %@ updated)", (uint8_t *)&v11, 0x34u);

      }
      -[WFCoreDataWorkflow setSyncHash:](self, "setSyncHash:", v6);
    }
  }

}

- (WFWorkflowIcon)workflowIcon
{
  void *v2;
  void *v3;

  -[WFCoreDataWorkflow icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v2, "backgroundColorValue"), (unsigned __int16)objc_msgSend(v2, "glyphNumber"), 0);

  return (WFWorkflowIcon *)v3;
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
  -[WFCoreDataWorkflow icon](self, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C97B20];
    -[WFCoreDataWorkflow managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ShortcutIcon"), v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    objc_msgSend(v6, "setBackgroundColorValue:", objc_msgSend(v9, "backgroundColorValue"));
    objc_msgSend(v6, "setGlyphNumber:", objc_msgSend(v9, "glyphCharacter"));
  }
  -[WFCoreDataWorkflow setIcon:](self, "setIcon:", v6);

}

- (WFWorkflowQuarantine)workflowQuarantine
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  WFWorkflowQuarantine *v6;

  -[WFCoreDataWorkflow quarantine](self, "quarantine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceAppIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v2 && v3 && v4)
    v6 = -[WFWorkflowQuarantine initWithSourceAppIdentifier:importDate:]([WFWorkflowQuarantine alloc], "initWithSourceAppIdentifier:importDate:", v3, v4);

  return v6;
}

- (void)setWorkflowQuarantine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    -[WFCoreDataWorkflow quarantine](self, "quarantine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFCoreDataWorkflow setQuarantine:](self, "setQuarantine:", v4);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C97B20];
      -[WFCoreDataWorkflow managedObjectContext](self, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("ShortcutQuarantine"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCoreDataWorkflow setQuarantine:](self, "setQuarantine:", v7);

    }
    objc_msgSend(v12, "sourceAppIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataWorkflow quarantine](self, "quarantine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceAppIdentifier:", v8);

    objc_msgSend(v12, "importDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDataWorkflow quarantine](self, "quarantine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImportDate:", v10);

  }
  else
  {
    -[WFCoreDataWorkflow setQuarantine:](self, "setQuarantine:", 0);
  }

}

- (NSArray)workflowTypes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    -[WFCoreDataWorkflow managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v13 = v5;

    objc_msgSend(v13, "database");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v14 = (void *)v6[15];
    else
      v14 = 0;
    v15 = v14;
    -[WFCoreDataWorkflow identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v15, "collectionAndFolderIdentifiersContainingShortcut:error:", v16, &v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v35;

    if (v18)
    {
      getWFCoherenceLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFCoreDataWorkflow(RecordStorage) workflowTypes]";
        v40 = 2114;
        v41 = v18;
        _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_ERROR, "%s Failed to get collection and folder identifiers: %{public}@", buf, 0x16u);
      }

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v17;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          WFWorkflowTypeForCollectionIdentifier(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v3, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v22);
    }

  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[WFCoreDataWorkflow parents](self, "parents", 0);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          WFWorkflowTypeForCollectionIdentifier(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v8);
    }
  }

  if ((-[WFCoreDataWorkflow hiddenFromWidget](self, "hiddenFromWidget") & 1) == 0)
    objc_msgSend(v3, "addObject:", CFSTR("NCWidget"));
  if (-[WFCoreDataWorkflow receivesOnScreenContent](self, "receivesOnScreenContent"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0DC84F8]);
  return (NSArray *)v3;
}

- (void)setWorkflowTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  WFCoreDataWorkflow *v65;
  _QWORD v66[4];
  id v67;
  WFCoreDataWorkflow *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFCoreDataWorkflow setHiddenFromWidget:](self, "setHiddenFromWidget:", objc_msgSend(v4, "containsObject:", CFSTR("NCWidget")) ^ 1);
  -[WFCoreDataWorkflow setReceivesOnScreenContent:](self, "setReceivesOnScreenContent:", objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DC84F8]));
  v50 = v4;
  if (objc_msgSend(MEMORY[0x1E0C99EA0], "databaseCoherenceEnabled"))
  {
    -[WFCoreDataWorkflow managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    objc_msgSend(v7, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCoreDataWorkflow workflowTypes](self, "workflowTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minusSet:", v11);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minusSet:", v13);

    v14 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke;
    v66[3] = &unk_1E7AED970;
    v15 = v8;
    v67 = v15;
    v68 = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v66);
    v63[0] = v14;
    v4 = v50;
    v63[1] = 3221225472;
    v63[2] = __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke_198;
    v63[3] = &unk_1E7AED970;
    v64 = v15;
    v65 = self;
    v16 = v15;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v63);

  }
  v17 = (void *)MEMORY[0x1E0C99E60];
  -[WFCoreDataWorkflow workflowTypes](self, "workflowTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow parents](self, "parents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  v23 = v22;
  v49 = (void *)v19;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_opt_new();
  v25 = v24;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[WFCoreDataWorkflow parents](self, "parents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v31, "identifier", v49);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        WFWorkflowTypeForCollectionIdentifier(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33 && (objc_msgSend(v20, "containsObject:", v33) & 1) == 0)
          objc_msgSend(v25, "removeObject:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v28);
  }

  -[WFCoreDataWorkflow setParents:](self, "setParents:", v25);
  v34 = v49;
  objc_msgSend(v20, "minusSet:", v49);
  v35 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v36 = v20;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(v36);
        WFWorkflowCollectionIdentifierForWorkflowType(*(void **)(*((_QWORD *)&v55 + 1) + 8 * j));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
          objc_msgSend(v35, "addObject:", v41);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
    }
    while (v38);
  }

  -[WFCoreDataWorkflow managedObjectContext](self, "managedObjectContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  WFCoreDataCollectionsWithIdentifiers(v35, 1, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = v43;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v52 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * k), "insertObject:inShortcutsAtIndex:", self, 0, v49);
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    }
    while (v46);
  }

}

- (void)setDeserializedActions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    -[WFCoreDataWorkflow actions](self, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v4;
  }
  else
  {
    getWFDatabaseLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedActions:]";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Failed to serialize actions into plist data: %{public}@", buf, 0x16u);
    }

    -[WFCoreDataWorkflow actions](self, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "setData:", v8);

}

- (NSArray)deserializedInputClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataWorkflow inputClassesData](self, "inputClassesData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataWorkflow inputClassesData](self, "inputClassesData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      getWFDatabaseLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataWorkflow(RecordStorage) deserializedInputClasses]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to deserialize input classes from plist data: %{public}@", buf, 0x16u);
      }

      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v6;
}

- (void)setDeserializedInputClasses:(id)a3
{
  void *v4;
  id v5;
  WFCoreDataWorkflow *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = self;
    v7 = v4;
  }
  else
  {
    getWFDatabaseLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedInputClasses:]";
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to serialize input classes into plist data: %{public}@", buf, 0x16u);
    }

    v6 = self;
    v7 = 0;
  }
  -[WFCoreDataWorkflow setInputClassesData:](v6, "setInputClassesData:", v7);

}

- (NSDictionary)deserializedNoInputBehavior
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataWorkflow noInputBehaviorData](self, "noInputBehaviorData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataWorkflow noInputBehaviorData](self, "noInputBehaviorData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;

    if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      getWFDatabaseLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[WFCoreDataWorkflow(RecordStorage) deserializedNoInputBehavior]";
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Failed to deserialize no input behavior from plist data: %{public}@", buf, 0x16u);
      }

      v3 = 0;
    }

  }
  return (NSDictionary *)v3;
}

- (void)setDeserializedNoInputBehavior:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
LABEL_7:
    -[WFCoreDataWorkflow setNoInputBehaviorData:](self, "setNoInputBehaviorData:", v5);

    goto LABEL_8;
  }
  getWFDatabaseLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedNoInputBehavior:]";
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Failed to serialize no input behavior into plist data: %{public}@", buf, 0x16u);
  }

  -[WFCoreDataWorkflow setNoInputBehaviorData:](self, "setNoInputBehaviorData:", 0);
LABEL_8:

}

- (NSArray)deserializedOutputClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataWorkflow outputClassesData](self, "outputClassesData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataWorkflow outputClassesData](self, "outputClassesData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      getWFDatabaseLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataWorkflow(RecordStorage) deserializedOutputClasses]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to deserialize output classes from plist data: %{public}@", buf, 0x16u);
      }

      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v6;
}

- (void)setDeserializedOutputClasses:(id)a3
{
  void *v4;
  id v5;
  WFCoreDataWorkflow *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = self;
    v7 = v4;
  }
  else
  {
    getWFDatabaseLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedOutputClasses:]";
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to serialize output classes into plist data: %{public}@", buf, 0x16u);
    }

    v6 = self;
    v7 = 0;
  }
  -[WFCoreDataWorkflow setOutputClassesData:](v6, "setOutputClassesData:", v7);

}

- (NSArray)deserializedImportQuestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDataWorkflow importQuestionsData](self, "importQuestionsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[WFCoreDataWorkflow importQuestionsData](self, "importQuestionsData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      getWFDatabaseLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFCoreDataWorkflow(RecordStorage) deserializedImportQuestions]";
        v13 = 2114;
        v14 = v7;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to deserialize import questions from plist data: %{public}@", buf, 0x16u);
      }

      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v6;
}

- (void)setDeserializedImportQuestions:(id)a3
{
  void *v4;
  id v5;
  WFCoreDataWorkflow *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = self;
    v7 = v4;
  }
  else
  {
    getWFDatabaseLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedImportQuestions:]";
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to serialize import questions into plist data: %{public}@", buf, 0x16u);
    }

    v6 = self;
    v7 = 0;
  }
  -[WFCoreDataWorkflow setImportQuestionsData:](v6, "setImportQuestionsData:", v7);

}

- (NSSet)accessResourcePerWorkflowStates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WFSerializedAccessResourcePerWorkflowState *v10;
  void *v11;
  void *v12;
  WFSerializedAccessResourcePerWorkflowState *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFCoreDataWorkflow accessResourcePermissions](self, "accessResourcePermissions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = [WFSerializedAccessResourcePerWorkflowState alloc];
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[WFSerializedAccessResourcePerWorkflowState initWithIdentifier:data:](v10, "initWithIdentifier:data:", v11, v12);
        objc_msgSend(v3, "addObject:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setAccessResourcePerWorkflowStates:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__WFCoreDataWorkflow_RecordStorage__setAccessResourcePerWorkflowStates___block_invoke;
  v5[3] = &unk_1E7AED998;
  v5[4] = self;
  objc_msgSend(a3, "if_map:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow setAccessResourcePermissions:](self, "setAccessResourcePermissions:", v4);

}

- (NSSet)smartPromptPerWorkflowStates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  WFSerializedSmartPromptPerWorkflowState *v12;
  void *v13;
  void *v14;
  WFSerializedSmartPromptPerWorkflowState *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[WFCoreDataWorkflow smartPromptPermissions](self, "smartPromptPermissions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          v12 = [WFSerializedSmartPromptPerWorkflowState alloc];
          objc_msgSend(v9, "data");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "actionUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[WFSerializedSmartPromptPerWorkflowState initWithData:actionUUID:](v12, "initWithData:actionUUID:", v13, v14);
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setSmartPromptPerWorkflowStates:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__WFCoreDataWorkflow_RecordStorage__setSmartPromptPerWorkflowStates___block_invoke;
  v5[3] = &unk_1E7AED9C0;
  v5[4] = self;
  objc_msgSend(a3, "if_map:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataWorkflow setSmartPromptPermissions:](self, "setSmartPromptPermissions:", v4);

}

- (BOOL)isConflictOfOtherWorkflow
{
  void *v2;
  BOOL v3;

  -[WFCoreDataWorkflow conflictOf](self, "conflictOf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)estimatedSize
{
  return 0;
}

- (int64_t)computedSyncHash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int64_t v62;
  void *v64;
  void *v65;
  void *v66;
  void *context;
  __int16 v68;

  context = (void *)MEMORY[0x1C3BB3598](self, a2);
  v3 = (void *)objc_opt_new();
  -[WFCoreDataWorkflow name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFCoreDataWorkflow name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  }
  -[WFCoreDataWorkflow workflowIcon](self, "workflowIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v7, "glyphCharacter");
  v8 = (id)objc_msgSend(v3, "combineBytes:size:", &v68, 2);
  v66 = v7;
  v9 = (id)objc_msgSend(v3, "combineInteger:", objc_msgSend(v7, "backgroundColorValue"));
  -[WFCoreDataWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFCoreDataWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v11);

  }
  -[WFCoreDataWorkflow workflowTypes](self, "workflowTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFCoreDataWorkflow workflowTypes](self, "workflowTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v15);

  }
  -[WFCoreDataWorkflow deserializedInputClasses](self, "deserializedInputClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v19);

  }
  -[WFCoreDataWorkflow deserializedOutputClasses](self, "deserializedOutputClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v23);

  }
  v64 = v22;
  -[WFCoreDataWorkflow deserializedNoInputBehavior](self, "deserializedNoInputBehavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    v26 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v25);
  -[WFCoreDataWorkflow deserializedActions](self, "deserializedActions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v28 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v27);
  v65 = v18;
  -[WFCoreDataWorkflow deserializedImportQuestions](self, "deserializedImportQuestions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    v30 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v29);
  v31 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"));
  v32 = (id)objc_msgSend(v3, "combineBool:", 0);
  v33 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow tombstoned](self, "tombstoned"));
  v34 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow hasShortcutInputVariables](self, "hasShortcutInputVariables"));
  v35 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow hasOutputFallback](self, "hasOutputFallback"));
  v36 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow disabledOnLockScreen](self, "disabledOnLockScreen"));
  -[WFCoreDataWorkflow quarantine](self, "quarantine");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[WFCoreDataWorkflow quarantine](self, "quarantine");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sourceAppIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v39);

    -[WFCoreDataWorkflow quarantine](self, "quarantine");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "importDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v42);

  }
  -[WFCoreDataWorkflow accessResourcePerWorkflowStates](self, "accessResourcePerWorkflowStates");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[WFCoreDataWorkflow accessResourcePerWorkflowStates](self, "accessResourcePerWorkflowStates");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allObjects");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sortedArrayUsingSelector:", sel_compare_);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "valueForKey:", CFSTR("dictionaryRepresentation"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v48);

  }
  -[WFCoreDataWorkflow smartPromptPerWorkflowStates](self, "smartPromptPerWorkflowStates");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[WFCoreDataWorkflow smartPromptPerWorkflowStates](self, "smartPromptPerWorkflowStates");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "allObjects");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "if_map:", &__block_literal_global_13239);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "if_map:", &__block_literal_global_214);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v54, v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "keysSortedByValueUsingSelector:", &selRef_createdAt);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v56);

  }
  v58 = (id)objc_msgSend(v3, "combineInteger:", -[WFCoreDataWorkflow remoteQuarantineStatus](self, "remoteQuarantineStatus"));
  -[WFCoreDataWorkflow source](self, "source");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceUnknown")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceOnDevice")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceGallery")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceAddToSiri")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceCloudLink")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceDefaultShortcut")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceSiriTopLevelShortcut")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceAutomatorMigration")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceFilePublic")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceFileKnownContacts")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceFilePersonal")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceEditorDocumentMenu")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceAppShortcut")) & 1) != 0
    || (objc_msgSend(v59, "isEqualToString:", CFSTR("ShortcutSourceActiveStarterShortcut")) & 1) == 0)
  {

  }
  else
  {

    -[WFCoreDataWorkflow source](self, "source");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    v60 = (id)objc_msgSend(v3, "combine:", v59);
  }

  if (-[WFCoreDataWorkflow wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion") >= 1)
    v61 = (id)objc_msgSend(v3, "combineInteger:", -[WFCoreDataWorkflow wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion"));
  v62 = objc_msgSend(v3, "finalize");

  objc_autoreleasePoolPop(context);
  return v62;
}

id __53__WFCoreDataWorkflow_RecordStorage__computedSyncHash__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "finalize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __53__WFCoreDataWorkflow_RecordStorage__computedSyncHash__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFSmartPromptState stateFromDatabaseData:](WFSmartPromptState, "stateFromDatabaseData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfSerializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

WFCoreDataSmartPromptPermission *__69__WFCoreDataWorkflow_RecordStorage__setSmartPromptPerWorkflowStates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFCoreDataSmartPromptPermission *v4;
  void *v5;
  WFCoreDataSmartPromptPermission *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = [WFCoreDataSmartPromptPermission alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCoreDataSmartPromptPermission initWithContext:](v4, "initWithContext:", v5);

  objc_msgSend(v3, "actionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataSmartPromptPermission setActionUUID:](v6, "setActionUUID:", v7);

  objc_msgSend(v3, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCoreDataSmartPromptPermission setData:](v6, "setData:", v8);
  return v6;
}

WFCoreDataAccessResourcePermission *__72__WFCoreDataWorkflow_RecordStorage__setAccessResourcePerWorkflowStates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFCoreDataAccessResourcePermission *v4;
  void *v5;
  WFCoreDataAccessResourcePermission *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = [WFCoreDataAccessResourcePermission alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFCoreDataAccessResourcePermission initWithContext:](v4, "initWithContext:", v5);

  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataAccessResourcePermission setIdentifier:](v6, "setIdentifier:", v7);

  objc_msgSend(v3, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCoreDataAccessResourcePermission setData:](v6, "setData:", v8);
  return v6;
}

void __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WFWorkflowCollectionIdentifierForWorkflowType(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[15];
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "insertShortcutWithIdentifier:atIndex:toCollection:error:", v6, 0, v3, &v11);
  v7 = v11;

  if (v7)
  {
    getWFCoherenceLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFCoreDataWorkflow(RecordStorage) setWorkflowTypes:]_block_invoke";
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to add workflow to a collection. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v10 = (void *)v9[15];
    else
      v10 = 0;
    v8 = v10;
    objc_msgSend(v9, "saveLibraryToDatabase:", v8);
  }

}

void __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke_198(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WFWorkflowCollectionIdentifierForWorkflowType(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[15];
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "removeShortcutWithIdentifier:fromCollectionWithIdentifier:error:", v6, v3, &v11);
  v7 = v11;

  if (v7)
  {
    getWFCoherenceLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFCoreDataWorkflow(RecordStorage) setWorkflowTypes:]_block_invoke";
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to remove workflow from a collection. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v10 = (void *)v9[15];
    else
      v10 = 0;
    v8 = v10;
    objc_msgSend(v9, "saveLibraryToDatabase:", v8);
  }

}

+ (id)recordPropertyMap
{
  _QWORD v3[11];
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("icon");
  v3[1] = CFSTR("quarantine");
  v4[0] = CFSTR("workflowIcon");
  v4[1] = CFSTR("workflowQuarantine");
  v3[2] = CFSTR("deleted");
  v3[3] = CFSTR("workflowSubtitle");
  v4[2] = CFSTR("tombstoned");
  v4[3] = CFSTR("subtitle");
  v3[4] = CFSTR("actions");
  v3[5] = CFSTR("importQuestions");
  v4[4] = CFSTR("deserializedActions");
  v4[5] = CFSTR("deserializedImportQuestions");
  v3[6] = CFSTR("inputClasses");
  v3[7] = CFSTR("noInputBehavior");
  v4[6] = CFSTR("deserializedInputClasses");
  v4[7] = CFSTR("deserializedNoInputBehavior");
  v3[8] = CFSTR("outputClasses");
  v3[9] = CFSTR("wantedEncryptedSchemaVersion");
  v4[8] = CFSTR("deserializedOutputClasses");
  v4[9] = CFSTR("wantedEncryptedSchemaVersion");
  v3[10] = CFSTR("lastSyncedEncryptedSchemaVersion");
  v4[10] = CFSTR("lastSyncedEncryptedSchemaVersion");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
