@implementation RCSavedRecordingsModel

- (id)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unencryptedTitleDateFormatter, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)eraseRecordingsDeletedBeforeDate:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  _QWORD v7[4];
  id v8;
  RCSavedRecordingsModel *v9;

  v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke;
  v7[3] = &unk_1E769BEE0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v7);

}

- (void)enumerateExistingRecordingsWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[RCQueryManager defaultFetchedProperties](RCQueryManager, "defaultFetchedProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel enumerateExistingRecordingsWithProperties:sortDescriptors:block:](self, "enumerateExistingRecordingsWithProperties:sortDescriptors:block:", v5, 0, v4);

}

- (void)enumerateExistingRecordingsWithProperties:(id)a3 sortDescriptors:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSManagedObjectContext *context;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  RCSavedRecordingsModel *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  context = self->_context;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke;
  v15[3] = &unk_1E769BFD0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v15);

}

- (RCSavedRecordingsModel)initWithContext:(id)a3
{
  id v5;
  RCSavedRecordingsModel *v6;
  RCSavedRecordingsModel *v7;
  void *v8;
  NSManagedObjectContext *context;
  id v10;
  _QWORD v12[4];
  RCSavedRecordingsModel *v13;
  id v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RCSavedRecordingsModel;
  v6 = -[RCSavedRecordingsModel init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    +[RCWeakReferenceWrapper withReference:](RCWeakReferenceWrapper, "withReference:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    context = v7->_context;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__RCSavedRecordingsModel_initWithContext___block_invoke;
    v12[3] = &unk_1E769BEE0;
    v13 = v7;
    v14 = v8;
    v10 = v8;
    -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v12);

  }
  return v7;
}

void __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudRecording"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1[4])
  {
    objc_msgSend(v2, "setPropertiesToFetch:");
  }
  else
  {
    +[RCQueryManager defaultFetchedProperties](RCQueryManager, "defaultFetchedProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPropertiesToFetch:", v4);

  }
  if (a1[5])
  {
    objc_msgSend(v3, "setSortDescriptors:");
  }
  else
  {
    +[RCQueryManager defaultSortDescriptors](RCQueryManager, "defaultSortDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSortDescriptors:", v5);

  }
  v6 = *(void **)(a1[6] + 8);
  v23 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v3, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  if (v7)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (!v10)
      goto LABEL_24;
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        if (a1[4])
        {
          v15 = v14;
          if (!v15)
            goto LABEL_16;
LABEL_15:
          (*(void (**)(void))(a1[7] + 16))();
          goto LABEL_16;
        }
        v16 = *(void **)(a1[6] + 8);
        objc_msgSend(v14, "objectID", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "existingObjectWithID:error:", v17, 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_15;
LABEL_16:

        ++v13;
      }
      while (v11 != v13);
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v11 = v18;
      if (!v18)
        goto LABEL_24;
    }
  }
  OSLogForCategory(CFSTR("Default"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke_cold_1();
LABEL_24:

}

void __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[RCQueryManager evictionDateBeforeFetchRequest:](RCQueryManager, "evictionDateBeforeFetchRequest:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "executeFetchRequest:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[RCComposition deleteFromFilesystem:](RCComposition, "deleteFromFilesystem:", v9);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "deleteObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v10 = *(void **)(a1 + 40);
  v14 = 0;
  v11 = objc_msgSend(v10, "saveIfNecessary:", &v14);
  v12 = v14;
  if ((v11 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke_cold_1();

  }
}

- (BOOL)saveIfNecessary:(id *)a3
{
  return !self->_isSavingDisabledCount
      && -[NSManagedObjectContext hasChanges](self->_context, "hasChanges")
      && -[RCSavedRecordingsModel __saveManagedObjectContext:](self, "__saveManagedObjectContext:", a3);
}

- (void)performBlock:(id)a3
{
  -[NSManagedObjectContext performBlock:](self->_context, "performBlock:", a3);
}

void __42__RCSavedRecordingsModel_initWithContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "userInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, CFSTR("RCAssociatedRecordingsModel"));

}

void __41__RCSavedRecordingsModel_audioProperties__block_invoke(uint64_t a1)
{
  void *v1;
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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "persistentStoreCoordinator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "entitiesByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CloudRecording"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertiesByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("audioDigest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)audioProperties_audioProperties;
  audioProperties_audioProperties = v10;

}

- (void)performBlockAndWait:(id)a3
{
  -[NSManagedObjectContext performBlockAndWait:](self->_context, "performBlockAndWait:", a3);
}

+ (id)savedRecordingsDirectory
{
  void *v2;
  void *v3;

  RCRecordingsDirectoryURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;

  v3 = a1 + 5;
  v2 = a1[5];
  v4 = *(void **)(a1[4] + 8);
  v8 = 0;
  v5 = objc_msgSend(v4, "countForFetchRequest:error:", v2, &v8);
  v6 = v8;
  *(_QWORD *)(*(_QWORD *)(v3[1] + 8) + 24) = v5;
  if (*(_QWORD *)(*(_QWORD *)(v3[1] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    OSLogForCategory(CFSTR("Default"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke_cold_1();

    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

- (unint64_t)fetchPlayableRecordingsCount
{
  void *v3;
  unint64_t v4;

  +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:](RCQueryManager, "playableRecordingsFetchRequestWithSubPredicate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RCSavedRecordingsModel _countForFetchRequest:](self, "_countForFetchRequest:", v3);

  return v4;
}

- (unint64_t)_countForFetchRequest:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke;
  v9[3] = &unk_1E769BF58;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)recordingWithUniqueID:(id)a3
{
  void *v3;
  void *v4;

  -[RCSavedRecordingsModel _recordingsWithUniqueID:](self, "_recordingsWithUniqueID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recordingsWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *context;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    +[RCQueryManager recordingsWithUniqueIDFetchRequest:](RCQueryManager, "recordingsWithUniqueIDFetchRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    context = self->_context;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__RCSavedRecordingsModel__recordingsWithUniqueID___block_invoke;
    v10[3] = &unk_1E769BF58;
    v12 = &v13;
    v10[4] = self;
    v7 = v5;
    v11 = v7;
    -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v10);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSSet)audioProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RCSavedRecordingsModel_audioProperties__block_invoke;
  block[3] = &unk_1E769BF30;
  block[4] = self;
  if (audioProperties_onceToken != -1)
    dispatch_once(&audioProperties_onceToken, block);
  return (NSSet *)(id)audioProperties_audioProperties;
}

- (RCSavedRecordingsModel)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("RCSavedRecordingsModelInitException"), CFSTR("-init is not supported, use +sharedInstance"));

  return 0;
}

+ (id)recordingsModelForContext:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__RCSavedRecordingsModel_recordingsModelForContext___block_invoke;
  v7[3] = &unk_1E769BF08;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__RCSavedRecordingsModel_recordingsModelForContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RCAssociatedRecordingsModel"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "weakReference");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)_dateFormatterComponentFormatting
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v2, "setLocale:", v3);

  return v2;
}

+ (id)standardPathForRecording:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "standardPathForRecordingWithCreationDate:uniqueID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)standardNameForRecordingWithCreationDate:(id)a3 uniqueID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_dateFormatterComponentFormatting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDateFormat:", CFSTR("YMMdd HHmmss"));
  objc_msgSend(v8, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "substringToIndex:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)standardPathForRecordingWithCreationDate:(id)a3 uniqueID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  +[RCCaptureFormat fileExtensionForIntermediateAssetCapture](RCCaptureFormat, "fileExtensionForIntermediateAssetCapture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "standardNameForRecordingWithCreationDate:uniqueID:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RCSavedRecordingsModel savedRecordingsDirectory](RCSavedRecordingsModel, "savedRecordingsDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)standardURLForRecordingWithCreationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "_dateFormatterComponentFormatting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateFormat:", CFSTR("YMMdd HHmmss"));
  +[RCCaptureFormat fileExtensionForIntermediateAssetCapture](RCCaptureFormat, "fileExtensionForIntermediateAssetCapture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[RCSavedRecordingsModel savedRecordingsDirectory](RCSavedRecordingsModel, "savedRecordingsDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unencryptedTitleDateFormatter
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__RCSavedRecordingsModel_unencryptedTitleDateFormatter__block_invoke;
  v4[3] = &unk_1E769BF30;
  v4[4] = self;
  -[RCSavedRecordingsModel performBlockAndWait:](self, "performBlockAndWait:", v4);
  return self->_unencryptedTitleDateFormatter;
}

void __55__RCSavedRecordingsModel_unencryptedTitleDateFormatter__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
}

- (id)unencryptedTitleDateStringFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__RCSavedRecordingsModel_unencryptedTitleDateStringFromDate___block_invoke;
    v9[3] = &unk_1E769BF58;
    v11 = &v12;
    v9[4] = self;
    v10 = v4;
    -[RCSavedRecordingsModel performBlockAndWait:](self, "performBlockAndWait:", v9);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__RCSavedRecordingsModel_unencryptedTitleDateStringFromDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "unencryptedTitleDateFormatter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)allRecordings
{
  NSManagedObjectContext *context;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__RCSavedRecordingsModel_allRecordings__block_invoke;
  v5[3] = &unk_1E769BF80;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __39__RCSavedRecordingsModel_allRecordings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudRecording"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[RCQueryManager defaultFetchedProperties](RCQueryManager, "defaultFetchedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v2);

  +[RCQueryManager defaultSortDescriptors](RCQueryManager, "defaultSortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeFetchRequest:error:", v7, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)recordingWithID:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  if (v4)
  {
    context = self->_context;
    v11 = 0;
    -[NSManagedObjectContext existingObjectWithID:error:](context, "existingObjectWithID:error:", v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v7;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
    }
    else if (v7)
    {
      OSLogForCategory(CFSTR("Default"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RCSavedRecordingsModel recordingWithID:].cold.1();

    }
    v6 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)recordingWithURIRepresentation:(id)a3
{
  NSManagedObjectContext *context;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    context = self->_context;
    v5 = a3;
    -[NSManagedObjectContext persistentStoreCoordinator](context, "persistentStoreCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectIDForURIRepresentation:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[RCSavedRecordingsModel recordingWithID:](self, "recordingWithID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)recordingWithFileName:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *context;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  +[RCQueryManager recordingsForFileNameFetchRequest:](RCQueryManager, "recordingsForFileNameFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__RCSavedRecordingsModel_recordingWithFileName___block_invoke;
  v10[3] = &unk_1E769BF58;
  v12 = &v13;
  v10[4] = self;
  v7 = v5;
  v11 = v7;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v10);
  objc_msgSend((id)v14[5], "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __48__RCSavedRecordingsModel_recordingWithFileName___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "executeFetchRequest:error:", a1[5], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__RCSavedRecordingsModel__recordingsWithUniqueID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "executeFetchRequest:error:", a1[5], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)recordingsWithUniqueIDs:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *context;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  +[RCQueryManager recordingsWithUniqueIDsFetchRequest:](RCQueryManager, "recordingsWithUniqueIDsFetchRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__RCSavedRecordingsModel_recordingsWithUniqueIDs___block_invoke;
  v10[3] = &unk_1E769BF58;
  v12 = &v13;
  v10[4] = self;
  v7 = v5;
  v11 = v7;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __50__RCSavedRecordingsModel_recordingsWithUniqueIDs___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "executeFetchRequest:error:", a1[5], 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)cacheDeletedRecordings
{
  void *v3;
  void *v4;

  +[RCQueryManager cacheDeletedOnWatchPredicate](RCQueryManager, "cacheDeletedOnWatchPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel recordingsWithPredicate:](self, "recordingsWithPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recordingsWithPredicate:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__RCSavedRecordingsModel_recordingsWithPredicate___block_invoke;
  v9[3] = &unk_1E769BFA8;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __50__RCSavedRecordingsModel_recordingsWithPredicate___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("CloudRecording"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", a1[4]);
  +[RCQueryManager defaultFetchedProperties](RCQueryManager, "defaultFetchedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v2);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1[5] + 8), "executeFetchRequest:error:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_allTitles
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__RCSavedRecordingsModel__allTitles__block_invoke;
  v6[3] = &unk_1E769BFF8;
  v4 = v3;
  v7 = v4;
  -[RCSavedRecordingsModel _enumerateFetchedRecordingTitles:](self, "_enumerateFetchedRecordingTitles:", v6);

  return v4;
}

void __36__RCSavedRecordingsModel__allTitles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "deletionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7 && !v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v6 = v7;
  }

}

- (void)_enumerateFetchedRecordingTitles:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *context;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  +[RCQueryManager allCustomLabelsFetchRequest](RCQueryManager, "allCustomLabelsFetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__RCSavedRecordingsModel__enumerateFetchedRecordingTitles___block_invoke;
  v9[3] = &unk_1E769C020;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);

}

void __59__RCSavedRecordingsModel__enumerateFetchedRecordingTitles___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "executeFetchRequest:error:", a1[5], 0);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          (*(void (**)(void))(a1[6] + 16))();

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (id)_transactionHistorySinceToken:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  RCSavedRecordingsModel *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  context = self->_context;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__RCSavedRecordingsModel__transactionHistorySinceToken_forStore___block_invoke;
  v13[3] = &unk_1E769C048;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v16 = self;
  v17 = &v18;
  v15 = v10;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __65__RCSavedRecordingsModel__transactionHistorySinceToken_forStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultType:", 5);
  objc_msgSend(v5, "rc_setAffectedStore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 48), "_transactionsAndChangesWithRequest:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)enumerateChangeHistorySinceToken:(id)a3 forStore:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSManagedObjectContext *context;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = v8;
  context = self->_context;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__RCSavedRecordingsModel_enumerateChangeHistorySinceToken_forStore_usingBlock___block_invoke;
  v17[3] = &unk_1E769C070;
  v17[4] = self;
  v12 = v27;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  v21 = &v22;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v17);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __79__RCSavedRecordingsModel_enumerateChangeHistorySinceToken_forStore_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_transactionHistorySinceToken:forStore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    v17 = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
        objc_msgSend(v9, "token", (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        if (v17)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          if (v6)
            goto LABEL_5;
          break;
        }
      }
    }

  }
}

- (id)transactionForToken:(id)a3 forStore:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  RCSavedRecordingsModel *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  context = self->_context;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__RCSavedRecordingsModel_transactionForToken_forStore___block_invoke;
  v13[3] = &unk_1E769C048;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v16 = self;
  v17 = &v18;
  v15 = v10;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __55__RCSavedRecordingsModel_transactionForToken_forStore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryTransactionForToken:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultType:", 5);
  objc_msgSend(v6, "rc_setAffectedStore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 48), "_transactionsAndChangesWithRequest:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)transactionsAndChangesForObjectID:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("changedObjectID"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel _transactionsAndChangesWithPredicate:](self, "_transactionsAndChangesWithPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_transactionsAndChangesForObjectIDs:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("changedObjectID"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel _transactionsAndChangesWithPredicate:](self, "_transactionsAndChangesWithPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_transactionsAndChangesWithPredicate:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__RCSavedRecordingsModel__transactionsAndChangesWithPredicate___block_invoke;
  v9[3] = &unk_1E769BFA8;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __63__RCSavedRecordingsModel__transactionsAndChangesWithPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C97BD0], "fetchRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryWithFetchRequest:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setResultType:", 5);
  objc_msgSend(*(id *)(a1 + 40), "_transactionsAndChangesWithRequest:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_transactionsAndChangesWithRequest:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke;
  v10[3] = &unk_1E769C098;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v10);
  v7 = (void *)v14[5];
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v10 = 0;
  objc_msgSend(v3, "executeRequest:error:", v2, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4 && objc_msgSend(v4, "resultType") == 5)
  {
    objc_msgSend(v4, "result");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(_QWORD *)(a1[6] + 8);
      v8 = v6;
      v9 = *(NSObject **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v8;
    }
    else
    {
      OSLogForCategory(CFSTR("Default"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_2();
    }

  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_1();
  }

}

- (id)nextRecordingDefaultLabelWithCustomTitleBase:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke;
  v9[3] = &unk_1E769C098;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = *(id *)(a1 + 32);
  }
  else
  {
    RCLocalizedFrameworkString(CFSTR("UNTITLED_NEW_RECORDING_LABEL"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke_2;
  v13[3] = &unk_1E769C0C0;
  v3 = v2;
  v14 = v3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3B76918](v13);
  objc_msgSend(*(id *)(a1 + 40), "_allTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    v9 = 2;
    do
    {
      v4[2](v4, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      ++v9;
    }
    while ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) & 1) != 0);
  }

}

id __71__RCSavedRecordingsModel_nextRecordingDefaultLabelWithCustomTitleBase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a2 == 1)
  {
    v2 = *(id *)(a1 + 32);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = *(_QWORD *)(a1 + 32);
    RCLocalizedInteger(a2, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customLabelBase:(id)a6
{
  return -[RCSavedRecordingsModel insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:](self, "insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:", a3, a5, a6, 0, a4);
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5 customTitleBase:(id)a6 uniqueID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  NSManagedObjectContext *context;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  double v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "stringByStandardizingPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    RCRecordingsDirectoryURL();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "rc_path:isSubpathOf:", v17, v19);

    if ((v20 & 1) == 0)
    {
      v21 = objc_msgSend((id)objc_opt_class(), "_copyFileIntoRecordingsDirectory:", v12);

      v17 = (void *)v21;
    }
  }
  if (a4 == -1.0)
  {
    a4 = -1.0;
    if (objc_msgSend(v16, "fileExistsAtPath:", v17))
    {
      v22 = (void *)MEMORY[0x1E0C8B3C0];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rc_preciseTimingAssetWithURL:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "rc_durationInSeconds");
      a4 = v25;

    }
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  v45 = 0;
  context = self->_context;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __94__RCSavedRecordingsModel_insertRecordingWithAudioFile_duration_date_customTitleBase_uniqueID___block_invoke;
  v33[3] = &unk_1E769C0E8;
  v33[4] = self;
  v38 = &v40;
  v27 = v13;
  v34 = v27;
  v28 = v17;
  v35 = v28;
  v39 = a4;
  v29 = v14;
  v36 = v29;
  v30 = v15;
  v37 = v30;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v33);
  v31 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  return v31;
}

uint64_t __94__RCSavedRecordingsModel_insertRecordingWithAudioFile_duration_date_customTitleBase_uniqueID___block_invoke(uint64_t a1)
{
  RCCloudRecording *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasChanges"))
    objc_msgSend(*(id *)(a1 + 32), "saveIfNecessary");
  v2 = -[RCCloudRecording initWithContext:andCreationDate:]([RCCloudRecording alloc], "initWithContext:andCreationDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 48), "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFileName:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLength:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "nextRecordingDefaultLabelWithCustomTitleBase:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setTitle:", v6);

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setUuid:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setUuid:", v8);

  }
  if (*(double *)(a1 + 80) > 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPlayable:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "synchronizeRecordingMetadata");
  }
  return objc_msgSend(*(id *)(a1 + 32), "saveIfNecessary");
}

+ (void)_determineImportabilityOfRecordingWithAudioFile:(id)a3 preferredFormat:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v6 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    OSLogForCategory(CFSTR("Default"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v26 = "+[RCSavedRecordingsModel _determineImportabilityOfRecordingWithAudioFile:preferredFormat:completionHandler:]";
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1BD830000, v13, OS_LOG_TYPE_INFO, "%s -- NOTE: import disallowed because audioURL '%@' has no extension", buf, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v7, "rc_durationInSeconds");
  if (v12 == 0.0)
  {
    OSLogForCategory(CFSTR("Default"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[RCSavedRecordingsModel _determineImportabilityOfRecordingWithAudioFile:preferredFormat:completionHandler:].cold.1(v9, v13);
LABEL_7:

    (*((void (**)(id, uint64_t, void *, _QWORD, _QWORD))v8 + 2))(v8, -1, v10, 0, 0);
    goto LABEL_8;
  }
  +[RCCaptureFormat fileFormatsDirectlyImportable](RCCaptureFormat, "fileFormatsDirectlyImportable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v11);

  if (v16)
  {
    (*((void (**)(id, uint64_t, void *, _QWORD, _QWORD))v8 + 2))(v8, 1, v10, 0, 0);
  }
  else
  {
    +[RCCaptureFormat fileExtensionForAssetExport](RCCaptureFormat, "fileExtensionForAssetExport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v7, "rc_audioFormat");
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __108__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioFile_preferredFormat_completionHandler___block_invoke;
    v20[3] = &unk_1E769C110;
    v21 = v17;
    v22 = v9;
    v24 = v8;
    v23 = v10;
    v19 = v17;
    +[RCCaptureFormat AVAssetExportDetermineSettingsForExportingAsset:inputFormat:preferredOutputExtension:preferredFormat:completionHandler:](RCCaptureFormat, "AVAssetExportDetermineSettingsForExportingAsset:inputFormat:preferredOutputExtension:preferredFormat:completionHandler:", v23, v18, v19, v6, v20);

  }
LABEL_8:

}

void __108__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioFile_preferredFormat_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (*v9)(void);
  NSObject *v10;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __108__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioFile_preferredFormat_completionHandler___block_invoke_cold_1(a1, v10);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v9();

}

+ (void)determineImportabilityOfRecordingWithAudioURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C89A98];
  v8 = a3;
  v20 = 0;
  v9 = (void *)objc_msgSend([v7 alloc], "initForReading:error:", v8, &v20);

  v10 = v20;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "voiceMemosUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "rc_audioQuality") == 1)
      v12 = 1634492771;
    else
      v12 = 1633772320;

    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __90__RCSavedRecordingsModel_determineImportabilityOfRecordingWithAudioURL_completionHandler___block_invoke;
    v18 = &unk_1E769C138;
    v19 = v6;
    v13 = (void *)MEMORY[0x1C3B76918](&v15);
    objc_msgSend(a1, "_determineImportabilityOfRecordingWithAudioFile:preferredFormat:completionHandler:", v9, v12, v13, v15, v16, v17, v18);

  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[RCSavedRecordingsModel determineImportabilityOfRecordingWithAudioURL:completionHandler:].cold.1();

    (*((void (**)(id, uint64_t))v6 + 2))(v6, -1);
  }

}

uint64_t __90__RCSavedRecordingsModel_determineImportabilityOfRecordingWithAudioURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 xpcConnection:(id)a6 userInfo:(id)a7 completionHandler:(id)a8
{
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  RCSavedRecordingsModel *v27;
  int v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  char v40;
  _QWORD v41[4];
  RCSavedRecordingsModel *v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  v13 = 1634492771;
  v34 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "voiceMemosUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "rc_audioQuality") == 1)
    v21 = 1634492771;
  else
    v21 = 1633772320;

  objc_msgSend(v16, "rcs_applicationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(CFSTR("F3LWYJ7GM7.com.apple.musicmemos"), "isEqualToString:", v22);

  v24 = MEMORY[0x1E0C809B0];
  v25 = &unk_1BD873000;
  if (!v23)
  {
    v13 = v21;
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    v30 = v34;
    goto LABEL_13;
  }
  v26 = v19;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v41[0] = v24;
  v41[1] = 3221225472;
  v41[2] = __isUniqueMusicMemo_block_invoke;
  v41[3] = &unk_1E769C098;
  v27 = self;
  v42 = v27;
  v19 = v26;
  v43 = v19;
  v44 = &v45;
  -[RCSavedRecordingsModel performBlockAndWait:](v27, "performBlockAndWait:", v41);
  v28 = *((unsigned __int8 *)v46 + 24);

  _Block_object_dispose(&v45, 8);
  if (!v28)
  {
    OSLogForCategory(CFSTR("Service"));
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[RCSavedRecordingsModel importRecordingWithSourceAudioURL:name:date:xpcConnection:userInfo:completionHandler:].cold.1();

    v19 = 0;
  }
  v30 = v34;
  v24 = MEMORY[0x1E0C809B0];
  v25 = (_QWORD *)&unk_1BD873000;
LABEL_13:
  v36[0] = v24;
  v36[1] = v25[479];
  v36[2] = __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke;
  v36[3] = &unk_1E769C188;
  v40 = v23;
  v36[4] = self;
  v37 = v14;
  v38 = v17;
  v39 = v18;
  v31 = v18;
  v32 = v17;
  v33 = v14;
  -[RCSavedRecordingsModel _importRecordingWithSourceAudioURL:name:date:uniqueID:preferredFormat:completionHandler:](self, "_importRecordingWithSourceAudioURL:name:date:uniqueID:preferredFormat:completionHandler:", v30, v33, v15, v19, v13, v36);

}

void __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2;
  v11[3] = &unk_1E769C160;
  v18 = *(_BYTE *)(a1 + 64);
  v7 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v16 = v6;
  v17 = v8;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v12, "performBlockAndWait:", v11);

}

void __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "recordingWithID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && *(_BYTE *)(a1 + 80))
  {
    v3 = *(void **)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    v6 = v3;
    v7 = v4;
    objc_msgSend(v2, "setMusicMemo:", 1);
    objc_msgSend(v2, "setTitle:", v5);
    objc_msgSend(v7, "saveIfNecessary");
    RCLocalizedFrameworkString(CFSTR("MUSIC_MEMOS_FOLDER_NAME"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "folderWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addRecording:toFolder:", v2, v9);
    objc_msgSend(v2, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:musicMemoMetadata:](RCCaptureFormat, "AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:musicMemoMetadata:", v11, v5, v10, v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C8AF90];
    objc_msgSend(v2, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v36 = (void *)v12;
    LOBYTE(v13) = objc_msgSend(v13, "rc_updateMetadataInFile:withMetadata:error:", v14, v12, &v41);
    v15 = v41;

    if ((v13 & 1) == 0)
    {
      OSLogForCategory(CFSTR("Service"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2_cold_1();

    }
    v35 = v15;
    objc_msgSend(v2, "objectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordingsWithUniqueID:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
    {
      v30 = v10;
      v31 = v9;
      v32 = v6;
      v33 = v5;
      v34 = v2;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v29 = v18;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v24, "objectID", v29, v30, v31, v32, v33, v34);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v25, "isEqual:", v17) & 1) != 0)
            {

            }
            else
            {
              v26 = objc_msgSend(v24, "musicMemo");

              if (v26)
                objc_msgSend(v7, "eraseRecording:", v24);
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v21);
      }

      v5 = v33;
      v2 = v34;
      v9 = v31;
      v6 = v32;
      v18 = v29;
      v10 = v30;
    }

  }
  v27 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "URIRepresentation", v29, v30, v31, v32, v33, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v27 + 16))(v27, v28, *(_QWORD *)(a1 + 64));

}

+ (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 completionHandler:(id)a6
{
  objc_msgSend(a1, "importRecordingWithSourceAudioURL:name:date:userInfo:completionHandler:", a3, a4, a5, MEMORY[0x1E0C9AA70], a6);
}

+ (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_retainAutorelease(a3);
  v15 = a7;
  v16 = v14;
  objc_msgSend(v16, "fileSystemRepresentation");
  v17 = (const char *)sandbox_extension_issue_file();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v17, strlen(v17) + 1, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:scope:", v16, 1, v18);
    +[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "importRecordingWithSourceAudioURL:name:date:userInfo:importCompletionBlock:", v19, v11, v12, v13, v15);
  }
  else
  {
    v21 = *MEMORY[0x1E0CB3308];
    v22[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), 200, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v19);
  }

}

- (void)_importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 preferredFormat:(unsigned int)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  RCSavedRecordingsModel *v48;
  id v49;
  id v50;
  id v51;
  void (**v52)(_QWORD, _QWORD, _QWORD);
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  void (**v57)(id, _QWORD, void *);
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v44 = a4;
  v45 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, void *))a8;
  v15 = v12;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = v15;
  if (!objc_msgSend(v15, "startAccessingSecurityScopedResource"))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "standardNameForRecordingWithCreationDate:uniqueID:", v45, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingPathExtension:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fileURLWithPath:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URLByAppendingPathComponent:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "rc_uniqueFileSystemURLWithPreferredURL:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v27 = objc_msgSend(v18, "copyItemAtURL:toURL:error:", v15, v26, &v58);
  v28 = v58;
  objc_msgSend(v15, "stopAccessingSecurityScopedResource");
  if ((v27 & 1) != 0)
  {
    v17 = v26;
    v29 = v15;
  }
  else
  {
    v61 = *MEMORY[0x1E0CB3388];
    v62[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), 200, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v30);

    v17 = v15;
  }

  if (v27)
  {
LABEL_8:
    v31 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke;
    v54[3] = &unk_1E769C1B0;
    v32 = v15;
    v55 = v32;
    v17 = v17;
    v56 = v17;
    v57 = v14;
    v33 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B76918](v54);
    v53 = 0;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A98]), "initForReading:error:", v17, &v53);
    v35 = v53;
    v36 = v35;
    if (v34)
    {
      v37 = objc_opt_class();
      v38 = v31;
      v39 = (void *)v37;
      v46[0] = v38;
      v46[1] = 3221225472;
      v46[2] = __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_77;
      v46[3] = &unk_1E769C1D8;
      v47 = v32;
      v52 = v33;
      v48 = self;
      v49 = v44;
      v50 = v45;
      v51 = v13;
      objc_msgSend(v39, "_determineImportabilityOfRecordingWithAudioFile:preferredFormat:completionHandler:", v34, a7, v46);

      v40 = v47;
    }
    else
    {
      v59 = *MEMORY[0x1E0CB3388];
      v60 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), 200, v41);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v33)[2](v33, 0, v40);

      v36 = (void *)v41;
    }

  }
}

void __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v12);
    v10 = v12;

    if ((v9 & 1) == 0)
    {
      OSLogForCategory(CFSTR("Default"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_cold_1();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_77(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 != 0 && a2 < 0xFFFFFFFFFFFFFFFELL)
  {
    objc_msgSend(*(id *)(a1 + 40), "_importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName:outputFileType:completionHandler:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v10, v11, *(_QWORD *)(a1 + 72));
  }
  else
  {
    v12 = qword_1BD873F58[a2 + 2];
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *(_QWORD *)(a1 + 32);
    v17 = *MEMORY[0x1E0CB3308];
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

- (void)_importImportableRecordingWithAudioAsset:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 presetName:(id)a7 outputFileType:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  RCSavedRecordingsModel *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _BYTE v52[32];
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v40 = a4;
  v41 = a5;
  v42 = a6;
  v38 = a7;
  v37 = a8;
  v15 = a9;
  objc_msgSend(v14, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pathExtension");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39
    && (+[RCCaptureFormat fileFormatsDirectlyImportable](RCCaptureFormat, "fileFormatsDirectlyImportable"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "pathExtension"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v17, "containsObject:", v18),
        v18,
        v17,
        v19))
  {
    -[RCSavedRecordingsModel _insertRecordingWithImportableAudioURL:name:date:uniqueID:completionHandler:](self, "_insertRecordingWithImportableAudioURL:name:date:uniqueID:completionHandler:", v16, v40, v41, v42, v15);
  }
  else
  {
    RCRecordingsDirectoryURL();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByDeletingPathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[RCCaptureFormat fileExtensionForAssetExport](RCCaptureFormat, "fileExtensionForAssetExport");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathExtension:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rc_uniqueFileSystemURLWithPreferredURL:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC0]), "initWithAsset:presetName:", v14, v38);
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "setOutputFileType:", v37);
      objc_msgSend(v29, "setOutputURL:", v27);
      +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:](RCCaptureFormat, "AVAssetAuthoringMetadataWithCreationDate:title:uniqueID:", v41, v40, v42);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setMetadata:", v30);

      OSLogForCategory(CFSTR("Default"));
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v16, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCSavedRecordingsModel _importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName:outputFileType:completionHandler:].cold.1(v32, (uint64_t)v27, (uint64_t)v52, v31);
      }

      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke;
      v43[3] = &unk_1E769C200;
      v44 = v16;
      v45 = v27;
      v46 = v29;
      v47 = self;
      v48 = v40;
      v49 = v41;
      v50 = v42;
      v51 = v15;
      objc_msgSend(v46, "exportAsynchronouslyWithCompletionHandler:", v43);

    }
    else
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D68];
      v54[0] = CFSTR("unsupported format");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), 300, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v35);

    }
  }

}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  OSLogForCategory(CFSTR("Default"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_2(a1, v2);

  v3 = (id *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 48), "status") == 3)
  {
    objc_msgSend(*(id *)(a1 + 56), "_insertRecordingWithImportableAudioURL:name:date:uniqueID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  }
  else
  {
    objc_msgSend(*v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = *MEMORY[0x1E0CB3388];
      objc_msgSend(*v3, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

    OSLogForCategory(CFSTR("Default"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_1((id *)(a1 + 48), (uint64_t)v6, v7);

    v8 = *(_QWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), 300, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_81(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSavedRecordingsImportErrorDomain"), 300, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_insertRecordingWithImportableAudioURL:(id)a3 name:(id)a4 date:(id)a5 uniqueID:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  objc_msgSend((id)objc_opt_class(), "savedRecordingsDirectory");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByStandardizingPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "rc_path:isSubpathOf:", v18, v27);

    if ((v20 & 1) == 0)
    {
      v21 = objc_msgSend((id)objc_opt_class(), "_copyFileIntoRecordingsDirectory:", v17);

      v18 = (void *)v21;
    }
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __102__RCSavedRecordingsModel__insertRecordingWithImportableAudioURL_name_date_uniqueID_completionHandler___block_invoke;
  v28[3] = &unk_1E769C250;
  v28[4] = self;
  v29 = v18;
  v30 = v13;
  v31 = v12;
  v32 = v14;
  v33 = v15;
  v22 = v15;
  v23 = v14;
  v24 = v12;
  v25 = v13;
  v26 = v18;
  -[RCSavedRecordingsModel performBlockAndWait:](self, "performBlockAndWait:", v28);

}

void __102__RCSavedRecordingsModel__insertRecordingWithImportableAudioURL_name_date_uniqueID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), -1.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v4, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, 0);

}

- (void)setTitle:(id)a3 ofRecording:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  RCSavedRecordingsModel *v14;

  v6 = a3;
  v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__RCSavedRecordingsModel_setTitle_ofRecording___block_invoke;
  v11[3] = &unk_1E769C278;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v11);

}

uint64_t __47__RCSavedRecordingsModel_setTitle_ofRecording___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setManuallyRenamed:", 1);
  return objc_msgSend(*(id *)(a1 + 48), "saveIfNecessary");
}

- (void)setFavorite:(BOOL)a3 ofRecording:(id)a4
{
  id v6;
  NSManagedObjectContext *context;
  id v8;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  BOOL v12;

  v6 = a4;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__RCSavedRecordingsModel_setFavorite_ofRecording___block_invoke;
  v9[3] = &unk_1E769C2A0;
  v12 = a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);

}

uint64_t __50__RCSavedRecordingsModel_setFavorite_ofRecording___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFavorite:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "saveIfNecessary");
}

- (void)setEnhanced:(BOOL)a3 ofRecording:(id)a4
{
  id v6;
  NSManagedObjectContext *context;
  id v8;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  BOOL v12;

  v6 = a4;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__RCSavedRecordingsModel_setEnhanced_ofRecording___block_invoke;
  v9[3] = &unk_1E769C2A0;
  v12 = a3;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);

}

uint64_t __50__RCSavedRecordingsModel_setEnhanced_ofRecording___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnhanced:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "saveIfNecessary");
}

- (id)_userDefinedFolders:(id)a3 searchOption:(int)a4
{
  void *v5;
  void *v6;

  if (a3)
  {
    +[RCQueryManager foldersWithNameFetchRequest:searchOption:](RCQueryManager, "foldersWithNameFetchRequest:searchOption:", a3, *(_QWORD *)&a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSManagedObjectContext executeFetchRequest:error:](self->_context, "executeFetchRequest:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)existingRecordingsWithName:(id)a3 searchOption:(int)a4 error:(id *)a5
{
  void *v7;
  void *v8;

  +[RCQueryManager recordingWithNameFetchRequest:searchOption:](RCQueryManager, "recordingWithNameFetchRequest:searchOption:", a3, *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext executeFetchRequest:error:](self->_context, "executeFetchRequest:error:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_foldersWithUUID:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
  {
    +[RCQueryManager foldersWithUUIDFetchRequest:](RCQueryManager, "foldersWithUUIDFetchRequest:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSManagedObjectContext executeFetchRequest:error:](self->_context, "executeFetchRequest:error:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v3;
    v3 = v8;

  }
  return v3;
}

- (id)folderWithName:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__RCSavedRecordingsModel_folderWithName___block_invoke;
  v9[3] = &unk_1E769C098;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__RCSavedRecordingsModel_folderWithName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  RCRecordingsFolder *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_userDefinedFolders:searchOption:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = -[RCRecordingsFolder initWithContext:name:rank:uuid:]([RCRecordingsFolder alloc], "initWithContext:name:rank:uuid:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_rankForFolderInsert"), 0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v15[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v11 = objc_msgSend(v9, "obtainPermanentIDsForObjects:error:", v10, &v14);
    v12 = v14;

    if ((v11 & 1) == 0)
    {
      OSLogForCategory(CFSTR("Default"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __41__RCSavedRecordingsModel_folderWithName___block_invoke_cold_1();

    }
    objc_msgSend(*(id *)(a1 + 32), "saveIfNecessary");

  }
}

- (id)_recordingsFetchRequestForFolder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  switch(objc_msgSend(v3, "folderType"))
  {
    case 0:
      +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:](RCQueryManager, "playableRecordingsFetchRequestWithSubPredicate:", 0);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      +[RCQueryManager favoritePredicate](RCQueryManager, "favoritePredicate");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      +[RCQueryManager watchOSPredicate](RCQueryManager, "watchOSPredicate");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v6;
      +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:](RCQueryManager, "playableRecordingsFetchRequestWithSubPredicate:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      +[RCQueryManager deletedRecordingsFetchRequest](RCQueryManager, "deletedRecordingsFetchRequest");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v5 = (void *)v4;
      break;
    case 4:
      objc_msgSend(v3, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RCQueryManager recordingsInFolderPredicate:](RCQueryManager, "recordingsInFolderPredicate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[RCQueryManager playableRecordingsFetchRequestWithSubPredicate:](RCQueryManager, "playableRecordingsFetchRequestWithSubPredicate:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (id)_userFolderFetchRequest
{
  return +[RCQueryManager userDefinedFoldersFetchRequest](RCQueryManager, "userDefinedFoldersFetchRequest");
}

- (unint64_t)userFolderCount
{
  void *v3;
  unint64_t v4;

  -[RCSavedRecordingsModel _userFolderFetchRequest](self, "_userFolderFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RCSavedRecordingsModel _countForFetchRequest:](self, "_countForFetchRequest:", v3);

  return v4;
}

- (id)userFolders
{
  NSManagedObjectContext *context;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  context = self->_context;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__RCSavedRecordingsModel_userFolders__block_invoke;
  v5[3] = &unk_1E769BF08;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__RCSavedRecordingsModel_userFolders__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  objc_msgSend(v2, "_userFolderFetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (!v5)
  {
    OSLogForCategory(CFSTR("Default"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __37__RCSavedRecordingsModel_userFolders__block_invoke_cold_1();

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = MEMORY[0x1E0C9AA60];

  }
}

- (unint64_t)playableCountForFolder:(id)a3
{
  void *v4;
  unint64_t v5;

  -[RCSavedRecordingsModel _recordingsFetchRequestForFolder:](self, "_recordingsFetchRequestForFolder:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RCSavedRecordingsModel _countForFetchRequest:](self, "_countForFetchRequest:", v4);

  return v5;
}

- (id)existingFolderWithName:(id)a3
{
  void *v3;
  void *v4;

  -[RCSavedRecordingsModel existingFoldersWithName:searchOption:](self, "existingFoldersWithName:searchOption:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)existingFoldersWithName:(id)a3 searchOption:(int)a4
{
  id v6;
  NSManagedObjectContext *context;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  context = self->_context;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__RCSavedRecordingsModel_existingFoldersWithName_searchOption___block_invoke;
  v11[3] = &unk_1E769C2C8;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = a4;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __63__RCSavedRecordingsModel_existingFoldersWithName_searchOption___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_userDefinedFolders:searchOption:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)existingFolderWithUUID:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  context = self->_context;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke;
  v9[3] = &unk_1E769C098;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  +[RCQueryManager foldersWithUUIDFetchRequest:](RCQueryManager, "foldersWithUUIDFetchRequest:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 8), "executeFetchRequest:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    OSLogForCategory(CFSTR("Default"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  objc_msgSend(v3, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (void)deleteFolder:(id)a3
{
  id v5;
  NSManagedObjectContext *context;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  RCSavedRecordingsModel *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecordingsModel.m"), 995, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("folder != nil"));

  }
  if (objc_msgSend(v5, "folderType") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecordingsModel.m"), 996, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("folder.folderType == RCFolderTypeUserDefined"));

  }
  context = self->_context;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__RCSavedRecordingsModel_deleteFolder___block_invoke;
  v10[3] = &unk_1E769BEE0;
  v11 = v5;
  v12 = self;
  v9 = v5;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v10);

}

void __39__RCSavedRecordingsModel_deleteFolder___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;

  OSLogForCategory(CFSTR("Default"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "userFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "rank");
  v5 = objc_msgSend(v3, "count");
  v6 = v4 + 1;
  if (v6 < v5)
  {
    v7 = v5;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRank:", objc_msgSend(v8, "rank") - 1);

      ++v6;
    }
    while (v7 != v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "deleteObject:", *(_QWORD *)(a1 + 32));
  v9 = *(void **)(a1 + 40);
  v13 = 0;
  v10 = objc_msgSend(v9, "saveIfNecessary:", &v13);
  v11 = v13;
  if ((v10 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_1();

  }
}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  RCSavedRecordingsModel *v14;

  v6 = a3;
  v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__RCSavedRecordingsModel_renameFolder_toName___block_invoke;
  v11[3] = &unk_1E769C278;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v11);

}

void __46__RCSavedRecordingsModel_renameFolder_toName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setName:", v2);
  objc_msgSend(*(id *)(a1 + 48), "saveIfNecessary");

}

- (void)addRecordings:(id)a3 toFolder:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  RCSavedRecordingsModel *v14;

  v6 = a3;
  v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__RCSavedRecordingsModel_addRecordings_toFolder___block_invoke;
  v11[3] = &unk_1E769C278;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v11);

}

void __49__RCSavedRecordingsModel_addRecordings_toFolder___block_invoke(id *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a1[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v2, "containsRecording:", v8, (_QWORD)v9) & 1) == 0)
          objc_msgSend(v2, "addRecording:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(a1[6], "saveIfNecessary");
}

- (void)addRecording:(id)a3 toFolder:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RCSavedRecordingsModel addRecordings:toFolder:](self, "addRecordings:toFolder:", v9, v7, v10, v11);
}

- (void)removeRecording:(id)a3 fromFolder:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  RCSavedRecordingsModel *v14;

  v6 = a3;
  v7 = a4;
  context = self->_context;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__RCSavedRecordingsModel_removeRecording_fromFolder___block_invoke;
  v11[3] = &unk_1E769C278;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v11);

}

void __53__RCSavedRecordingsModel_removeRecording_fromFolder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v3, "removeRecording:", v2);
  objc_msgSend(*(id *)(a1 + 48), "saveIfNecessary");

}

- (void)eraseRecording:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecordingsModel.m"), 1051, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recording != nil"));

  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel eraseRecordings:](self, "eraseRecordings:", v6);

}

- (void)eraseRecordings:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  _QWORD v7[4];
  id v8;
  RCSavedRecordingsModel *v9;

  v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__RCSavedRecordingsModel_eraseRecordings___block_invoke;
  v7[3] = &unk_1E769BEE0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v7);

}

void __42__RCSavedRecordingsModel_eraseRecordings___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        OSLogForCategory(CFSTR("Default"));
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[RCSavedRecordingsModel eraseRecordings:]_block_invoke";
          v21 = 2112;
          v22 = v7;
          _os_log_debug_impl(&dword_1BD830000, v8, OS_LOG_TYPE_DEBUG, "%s -- erasing recording: %@", buf, 0x16u);
        }

        objc_msgSend(v7, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[RCComposition deleteFromFilesystem:](RCComposition, "deleteFromFilesystem:", v9);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "deleteObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }

  v10 = *(void **)(a1 + 40);
  v14 = 0;
  v11 = objc_msgSend(v10, "saveIfNecessary:", &v14);
  v12 = v14;
  if ((v11 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __42__RCSavedRecordingsModel_eraseRecordings___block_invoke_cold_1();

  }
}

- (void)deleteRecording:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecordingsModel.m"), 1071, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recording != nil"));

  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel deleteRecordings:](self, "deleteRecordings:", v6);

}

- (void)deleteRecordings:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  _QWORD v7[4];
  id v8;
  RCSavedRecordingsModel *v9;

  v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__RCSavedRecordingsModel_deleteRecordings___block_invoke;
  v7[3] = &unk_1E769BEE0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v7);

}

void __43__RCSavedRecordingsModel_deleteRecordings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        OSLogForCategory(CFSTR("Default"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "-[RCSavedRecordingsModel deleteRecordings:]_block_invoke";
          v22 = 2112;
          v23 = v8;
          _os_log_debug_impl(&dword_1BD830000, v9, OS_LOG_TYPE_DEBUG, "%s -- deleting recording: %@", buf, 0x16u);
        }

        objc_msgSend(v8, "setDeletionDate:", v2);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

  v10 = *(void **)(v14 + 40);
  v15 = 0;
  v11 = objc_msgSend(v10, "saveIfNecessary:", &v15);
  v12 = v15;
  if ((v11 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __43__RCSavedRecordingsModel_deleteRecordings___block_invoke_cold_1();

  }
}

- (void)restoreDeletedRecording:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecordingsModel.m"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recording != nil"));

  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel restoreDeletedRecordings:](self, "restoreDeletedRecordings:", v6);

}

- (void)restoreDeletedRecordings:(id)a3
{
  id v4;
  NSManagedObjectContext *context;
  id v6;
  _QWORD v7[4];
  id v8;
  RCSavedRecordingsModel *v9;

  v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke;
  v7[3] = &unk_1E769BEE0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v7);

}

void __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v5);
        OSLogForCategory(CFSTR("Default"));
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[RCSavedRecordingsModel restoreDeletedRecordings:]_block_invoke";
          v21 = 2112;
          v22 = v6;
          _os_log_debug_impl(&dword_1BD830000, v7, OS_LOG_TYPE_DEBUG, "%s -- restoring recording: %@", buf, 0x16u);
        }

        objc_msgSend(v6, "setDeletionDate:", 0);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v3);
  }

  v8 = *(void **)(a1 + 40);
  v14 = 0;
  v9 = objc_msgSend(v8, "saveIfNecessary:", &v14);
  v10 = v14;
  v11 = v10;
  if ((v9 & 1) == 0 && v10)
  {
    OSLogForCategory(CFSTR("Default"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke_cold_1();

  }
}

- (void)eraseAllDeleted
{
  NSManagedObjectContext *context;
  _QWORD v3[5];

  context = self->_context;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke;
  v3[3] = &unk_1E769BF30;
  v3[4] = self;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v3);
}

void __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[RCQueryManager allDeletedRecordingsFetchRequest](RCQueryManager, "allDeletedRecordingsFetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "executeFetchRequest:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[RCComposition deleteFromFilesystem:](RCComposition, "deleteFromFilesystem:", v9);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v10 = *(void **)(a1 + 32);
  v14 = 0;
  v11 = objc_msgSend(v10, "saveIfNecessary:", &v14);
  v12 = v14;
  if ((v11 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke_cold_1();

  }
}

- (void)_copyPropertiesFromOriginalRecording:(id)a3 newRecording:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "userFolderUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[RCSavedRecordingsModel existingFolderWithUUID:](self, "existingFolderWithUUID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[RCSavedRecordingsModel addRecording:toFolder:](self, "addRecording:toFolder:", v6, v8);

    }
  }
  objc_msgSend(v6, "copySharedFlagsFromOriginalRecording:", v10);

}

- (id)duplicateRecording:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel duplicateRecording:copyingResources:creationDate:error:](self, "duplicateRecording:copyingResources:creationDate:error:", v6, 1, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)duplicateRecording:(id)a3 copyingResources:(BOOL)a4 creationDate:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  NSManagedObjectContext *context;
  id v14;
  id v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  RCSavedRecordingsModel *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCSavedRecordingsModel.m"), 1157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recording != nil"));

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  context = self->_context;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke;
  v19[3] = &unk_1E769C318;
  v14 = v11;
  v25 = a4;
  v20 = v14;
  v21 = self;
  v23 = &v32;
  v24 = &v26;
  v15 = v12;
  v22 = v15;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v19);
  if (a6)
    *a6 = objc_retainAutorelease((id)v33[5]);
  v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  id obj;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "creationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RCSavedRecordingsModel standardPathForRecordingWithCreationDate:uniqueID:](RCSavedRecordingsModel, "standardPathForRecordingWithCreationDate:uniqueID:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    v9 = objc_retainAutorelease(v7);
    if (clonefile(v8, (const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0;
  }
  RCLocalizedFrameworkString(CFSTR("RECORDING_COPY_SUFFIX"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rangeOfString:", v13);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v14, "stringByAppendingString:", v13);
  else
    objc_msgSend(v14, "substringWithRange:", 0, v15 + v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_2;
  v25[3] = &unk_1E769C2F0;
  v31 = *(_QWORD *)(a1 + 64);
  v25[4] = v18;
  v9 = v9;
  v26 = v9;
  v27 = *(id *)(a1 + 32);
  v28 = *(id *)(a1 + 48);
  v19 = v17;
  v29 = v19;
  v30 = v5;
  objc_msgSend(v18, "performWithSavingDisabled:", v25);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setEnhanced:", objc_msgSend(*(id *)(a1 + 32), "enhanced"));
  objc_msgSend(*(id *)(a1 + 40), "_copyPropertiesFromOriginalRecording:newRecording:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v20 = *(void **)(a1 + 40);
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v21 + 40);
  v22 = objc_msgSend(v20, "saveIfNecessary:", &obj);
  objc_storeStrong((id *)(v21 + 40), obj);
  if ((v22 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_cold_1();

  }
LABEL_13:

}

void __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "length");
  objc_msgSend(v2, "insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)mergeRecordings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "na_map:", &__block_literal_global_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel _transactionsAndChangesForObjectIDs:](self, "_transactionsAndChangesForObjectIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v38 = v6;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;
  if (v7 < 0)
  {
    v33 = 0;
    v8 = 0;
  }
  else
  {
    v34 = v5;
    v35 = v4;
    v36 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v38, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "count");
      if (v11 - 1 >= 0)
      {
        v12 = v11;
        while (1)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", --v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "changedObjectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[RCSavedRecordingsModel recordingWithID:](self, "recordingWithID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "playable"))
          {
            objc_msgSend(v15, "url");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "path");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v39, "fileExistsAtPath:", v17);

            if (v18)
              break;
          }

          if (v12 <= 0)
            goto LABEL_10;
        }
        objc_msgSend(v15, "objectID");
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "url");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v21;
        v36 = (void *)v19;
      }
LABEL_10:

    }
    while (v7-- > 0);
    if (v36)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __42__RCSavedRecordingsModel_mergeRecordings___block_invoke_2;
      v44[3] = &unk_1E769C360;
      v37 = v36;
      v45 = v37;
      objc_msgSend(v35, "na_filter:", v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v41 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v28, "url");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "path");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v8, "isEqualToString:", v30);

            if ((v31 & 1) != 0)
            {
              -[RCSavedRecordingsModel context](self, "context");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "deleteObject:", v28);

              -[RCSavedRecordingsModel saveIfNecessary](self, "saveIfNecessary");
            }
            else
            {
              -[RCSavedRecordingsModel eraseRecording:](self, "eraseRecording:", v28);
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v25);
      }

      v5 = v34;
      v4 = v35;
      v33 = v37;
    }
    else
    {
      v33 = 0;
      v5 = v34;
      v4 = v35;
    }
  }

}

uint64_t __42__RCSavedRecordingsModel_mergeRecordings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

uint64_t __42__RCSavedRecordingsModel_mergeRecordings___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

- (id)_recordingsForFolderUUID:(id)a3
{
  void *v4;
  NSManagedObjectContext *context;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;

  +[RCQueryManager recordingsInFolderFetchRequest:](RCQueryManager, "recordingsInFolderFetchRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v11 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](context, "executeFetchRequest:error:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    OSLogForCategory(CFSTR("Service"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RCSavedRecordingsModel _recordingsForFolderUUID:].cold.1();

    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)_mergeFolders:(id)a3 intoTargetFolder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCSavedRecordingsModel _recordingsForFolderUUID:](self, "_recordingsForFolderUUID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
          -[RCSavedRecordingsModel addRecordings:toFolder:](self, "addRecordings:toFolder:", v14, v7);
        -[RCSavedRecordingsModel deleteFolder:](self, "deleteFolder:", v12);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (BOOL)_mergeDuplicateUUIDFolders:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v6 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v9);
    }

    v12 = objc_msgSend(v6, "count");
    v5 = v12 > 1;
    if (v12 >= 2)
    {
      objc_msgSend(v6, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      OSLogForCategory(CFSTR("Service"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "-[RCSavedRecordingsModel _mergeDuplicateUUIDFolders:]";
        v25 = 2112;
        v26 = v15;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_1BD830000, v14, OS_LOG_TYPE_DEFAULT, "%s -- merging duplicate uuid user folder %@ - uuid = %@", buf, 0x20u);

      }
      objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCSavedRecordingsModel _mergeFolders:intoTargetFolder:](self, "_mergeFolders:intoTargetFolder:", v17, v13);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_mergeDuplicateNameFoldersWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSManagedObjectContext *context;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  +[RCQueryManager foldersWithNameFetchRequest:searchOption:](RCQueryManager, "foldersWithNameFetchRequest:searchOption:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("countOfRecordings"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  context = self->_context;
  v16 = 0;
  -[NSManagedObjectContext executeFetchRequest:error:](context, "executeFetchRequest:error:", v4, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = objc_msgSend(v8, "count");
  if (v10 >= 2)
  {
    objc_msgSend(v8, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogForCategory(CFSTR("Service"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[RCSavedRecordingsModel _mergeDuplicateNameFoldersWithName:]";
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1BD830000, v12, OS_LOG_TYPE_DEFAULT, "%s -- merging duplicate named user folder %@", buf, 0x16u);

    }
    objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v8, "count") - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCSavedRecordingsModel _mergeFolders:intoTargetFolder:](self, "_mergeFolders:intoTargetFolder:", v14, v11);

  }
  return v10 > 1;
}

- (void)_rerankFolders
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- fetch request failed - error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)reconcileChangedFolder:(id)a3 change:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *v8;
  id v9;
  NSManagedObjectContext *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  NSManagedObjectContext *v14;
  id v15;
  RCSavedRecordingsModel *v16;

  v6 = a3;
  v7 = a4;
  v8 = self->_context;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke;
  v12[3] = &unk_1E769C388;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  -[NSManagedObjectContext performBlockAndWait:](v10, "performBlockAndWait:", v12);

}

void __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  id v14;
  NSObject *v15;
  id v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "changeType");
  if (v2 != 2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "existingObjectWithID:error:", *(_QWORD *)(a1 + 48), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (!v3)
      {
        v6 = *(void **)(a1 + 56);
        objc_msgSend(v4, "uuid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_foldersWithUUID:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 56), "_mergeDuplicateUUIDFolders:", v8))
          objc_msgSend(*(id *)(a1 + 56), "saveIfNecessary");

      }
      v9 = *(void **)(a1 + 56);
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v9, "_mergeDuplicateNameFoldersWithName:", v10);

      if ((_DWORD)v9)
      {
        objc_msgSend(*(id *)(a1 + 56), "_rerankFolders");
        objc_msgSend(*(id *)(a1 + 56), "saveIfNecessary");
      }
      else
      {
        +[RCQueryManager foldersWithhRankFetchRequest:](RCQueryManager, "foldersWithhRankFetchRequest:", objc_msgSend(v5, "rank"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 40);
        v16 = 0;
        objc_msgSend(v12, "executeFetchRequest:error:", v11, &v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        if (v13)
        {
          if ((unint64_t)objc_msgSend(v13, "count") >= 2)
          {
            objc_msgSend(*(id *)(a1 + 56), "_rerankFolders");
            objc_msgSend(*(id *)(a1 + 56), "saveIfNecessary");
          }
        }
        else
        {
          OSLogForCategory(CFSTR("Orphan-Handling"));
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke_cold_1();

        }
      }
    }

  }
}

- (void)saveIfNecessary
{
  -[RCSavedRecordingsModel saveIfNecessary:](self, "saveIfNecessary:", 0);
}

- (BOOL)__saveManagedObjectContext:(id *)a3
{
  BOOL v3;
  int64_t isSavingDisabledCount;
  NSManagedObjectContext *context;
  int v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  isSavingDisabledCount = self->_isSavingDisabledCount;
  if (isSavingDisabledCount <= 0)
  {
    self->_isSavingDisabledCount = isSavingDisabledCount + 1;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v16 = 0;
    context = self->_context;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke;
    v10[3] = &unk_1E769C3B0;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = &v11;
    -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v10);
    v8 = *((unsigned __int8 *)v18 + 24);
    if (a3 && !*((_BYTE *)v18 + 24))
    {
      *a3 = objc_retainAutorelease((id)v12[5]);
      v8 = *((unsigned __int8 *)v18 + 24);
    }
    --self->_isSavingDisabledCount;
    _Block_object_dispose(&v11, 8);

    v3 = v8 != 0;
  }
  _Block_object_dispose(&v17, 8);
  return v3;
}

void __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeRecordingsMetadata");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "processPendingChanges");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    OSLogForCategory(CFSTR("Default"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rollback");
  }
}

- (void)_synchronizeRecordingsMetadata
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSManagedObjectContext updatedObjects](self->_context, "updatedObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "entity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("CloudRecording"));

        if (v10)
        {
          objc_msgSend(v7, "changedValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("customLabelForSorting"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v7, "synchronizeRecordingMetadata");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)performWithSavingDisabled:(id)a3
{
  ++self->_isSavingDisabledCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_isSavingDisabledCount;
}

+ (id)_copyFileIntoRecordingsDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v14, *MEMORY[0x1E0C998E8], 0);
  v4 = v14;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCSavedRecordingsModel standardURLForRecordingWithCreationDate:](RCSavedRecordingsModel, "standardURLForRecordingWithCreationDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rc_uniqueFileSystemURLWithPreferredURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v8 = objc_msgSend(v5, "copyItemAtURL:toURL:error:", v3, v7, &v13);
  v9 = v13;
  if ((v8 & 1) == 0)
  {
    OSLogForCategory(CFSTR("Default"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[RCSavedRecordingsModel _copyFileIntoRecordingsDirectory:].cold.1();

    v7 = 0;
  }
  objc_msgSend(v7, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_moveFileIntoRecordingsDirectory:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;

  v14 = 0;
  v3 = *MEMORY[0x1E0C998E8];
  v4 = a3;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v14, v3, 0);
  v5 = v14;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCSavedRecordingsModel standardURLForRecordingWithCreationDate:](RCSavedRecordingsModel, "standardURLForRecordingWithCreationDate:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rc_uniqueFileSystemURLWithPreferredURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  LOBYTE(v7) = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v4, v8, &v13);

  v9 = v13;
  if ((v7 & 1) != 0)
  {
    v10 = v8;
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[RCSavedRecordingsModel _moveFileIntoRecordingsDirectory:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (BOOL)resetCloudForStore:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  context = self->_context;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke;
  v12[3] = &unk_1E769C468;
  v12[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v13 = v10;
  v15 = &v16;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0C97B10]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_2;
  v8[3] = &unk_1E769C440;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v8);
  objc_msgSend(v3, "rc_setAffectedStore:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = 0;
  objc_msgSend(v4, "executeRequest:error:", v3, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_3;
  v8[3] = &unk_1E769C418;
  v9 = v3;
  v10 = v4;
  v11 = v3;
  v12 = v5;
  v7 = v3;
  objc_msgSend(v6, "performBlock:", v8);

}

void __63__RCSavedRecordingsModel_resetCloudForStore_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "madeChanges"))
    objc_msgSend(*(id *)(a1 + 40), "enumerateExistingRecordingsWithBlock:", &__block_literal_global_105);
  v4 = a1 + 48;
  v2 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(v4 + 8);
  objc_msgSend(v2, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v2, v5);

}

- (BOOL)exportToCloudForStore:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  RCSavedRecordingsModel *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  context = self->_context;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke;
  v12[3] = &unk_1E769C4B8;
  v9 = v7;
  v15 = v9;
  v10 = v6;
  v13 = v10;
  v14 = self;
  v16 = &v17;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v12);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0C97AE8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke_2;
  v8[3] = &unk_1E769C490;
  v9 = *(id *)(a1 + 48);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v8);
  objc_msgSend(v3, "rc_setAffectedStore:", *(_QWORD *)(a1 + 32));
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v7 = 0;
  objc_msgSend(v4, "executeRequest:error:", v3, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __66__RCSavedRecordingsModel_exportToCloudForStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

}

- (BOOL)importFromCloudForStore:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *context;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  RCSavedRecordingsModel *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  context = self->_context;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke;
  v12[3] = &unk_1E769C4B8;
  v9 = v7;
  v15 = v9;
  v10 = v6;
  v13 = v10;
  v14 = self;
  v16 = &v17;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v12);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0C97AF8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke_2;
  v8[3] = &unk_1E769C490;
  v9 = *(id *)(a1 + 48);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v8);
  objc_msgSend(v3, "rc_setAffectedStore:", *(_QWORD *)(a1 + 32));
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v7 = 0;
  objc_msgSend(v4, "executeRequest:error:", v3, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (!v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __68__RCSavedRecordingsModel_importFromCloudForStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

}

- (BOOL)fetchObjectsFromCloud:(id)a3 entityToAttributesToFetch:(id)a4 forStore:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSManagedObjectContext *context;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  RCSavedRecordingsModel *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  context = self->_context;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke;
  v20[3] = &unk_1E769C4E0;
  v15 = v13;
  v25 = v15;
  v16 = v10;
  v21 = v16;
  v17 = v11;
  v22 = v17;
  v18 = v12;
  v23 = v18;
  v24 = self;
  v26 = &v27;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v20);
  LOBYTE(self) = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)self;
}

void __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = objc_alloc(MEMORY[0x1E0C97AF0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke_2;
  v9[3] = &unk_1E769C490;
  v10 = *(id *)(a1 + 64);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v9);
  objc_msgSend(v3, "setObjectIDsToFetch:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setEntityNameToAttributesToFetch:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "rc_setAffectedStore:", *(_QWORD *)(a1 + 48));
  v4 = *(void **)(*(_QWORD *)(a1 + 56) + 8);
  v8 = 0;
  objc_msgSend(v4, "executeRequest:error:", v3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
    v7 = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v7;

}

void __101__RCSavedRecordingsModel_fetchObjectsFromCloud_entityToAttributesToFetch_forStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

}

- (BOOL)fetchExportProgress:(id)a3 forStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSManagedObjectContext *context;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  RCSavedRecordingsModel *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  context = self->_context;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke;
  v16[3] = &unk_1E769C508;
  v12 = v10;
  v20 = v12;
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v19 = self;
  v21 = &v22;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v16);
  LOBYTE(self) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)self;
}

void __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = objc_alloc(MEMORY[0x1E0C97AD8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke_2;
  v10[3] = &unk_1E769C490;
  v11 = *(id *)(a1 + 56);
  v3 = (void *)objc_msgSend(v2, "initWithOptions:completionBlock:", 0, v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObjectIDsToFetch:", v4);

  objc_msgSend(v3, "rc_setAffectedStore:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
  v9 = 0;
  objc_msgSend(v5, "executeRequest:error:", v3, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v6)
  {
    v8 = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v8 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v8;

}

void __73__RCSavedRecordingsModel_fetchExportProgress_forStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

}

- (id)objectIDsForRecordingsNeedingAssetExport
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  +[RCQueryManager recordingsNeedingAssetExportFetchRequest](RCQueryManager, "recordingsNeedingAssetExportFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultType:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke;
  v7[3] = &unk_1E769BF58;
  v9 = &v10;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  -[RCSavedRecordingsModel performBlockAndWait:](self, "performBlockAndWait:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v11 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    OSLogForCategory(CFSTR("Service"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke_cold_1();

    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = MEMORY[0x1E0C9AA60];

  }
}

- (id)createEncryptedFieldsMigration:(int)a3
{
  NSManagedObjectContext *context;
  id v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  context = self->_context;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__RCSavedRecordingsModel_createEncryptedFieldsMigration___block_invoke;
  v6[3] = &unk_1E769C530;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __57__RCSavedRecordingsModel_createEncryptedFieldsMigration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[RCMigration createEncryptedFieldsMigration:context:](RCMigration, "createEncryptedFieldsMigration:context:", *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)encryptedFieldsMigrationExists
{
  void *v3;

  +[RCQueryManager encryptedFieldsMigrationsFetchRequest](RCQueryManager, "encryptedFieldsMigrationsFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 1);
  LOBYTE(self) = -[RCSavedRecordingsModel _countForFetchRequest:](self, "_countForFetchRequest:", v3) != 0;

  return (char)self;
}

- (id)encryptedFieldMigrations
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke;
  v4[3] = &unk_1E769BF80;
  v4[4] = self;
  v4[5] = &v5;
  -[RCSavedRecordingsModel performBlockAndWait:](self, "performBlockAndWait:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;

  +[RCQueryManager encryptedFieldsMigrationsFetchRequest](RCQueryManager, "encryptedFieldsMigrationsFetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    OSLogForCategory(CFSTR("Default"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke_cold_1();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = MEMORY[0x1E0C9AA60];

  }
}

- (id)recordingsWithNilEncryptedTitleOrCustomLabel
{
  void *v3;
  void *v4;

  +[RCQueryManager recordingsWithNilEncryptedTitleOrCustomLabelFetchRequest](RCQueryManager, "recordingsWithNilEncryptedTitleOrCustomLabelFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel _recordingsWithFetchRequest:](self, "_recordingsWithFetchRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recordingsWithNilAudioFutures
{
  void *v3;
  void *v4;

  +[RCQueryManager recordingsWithNilAudioFuturesFetchRequest](RCQueryManager, "recordingsWithNilAudioFuturesFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSavedRecordingsModel _recordingsWithFetchRequest:](self, "_recordingsWithFetchRequest:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recordingsWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSManagedObjectContext *context;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  context = self->_context;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__RCSavedRecordingsModel__recordingsWithFetchRequest_error___block_invoke;
  v12[3] = &unk_1E769C558;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v12);
  v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = (void *)v23[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __60__RCSavedRecordingsModel__recordingsWithFetchRequest_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_recordingsWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v11;

  v4 = a3;
  v11 = 0;
  -[RCSavedRecordingsModel _recordingsWithFetchRequest:error:](self, "_recordingsWithFetchRequest:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v5;
  if (!v5)
  {
    OSLogForCategory(CFSTR("Default"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RCSavedRecordingsModel _recordingsWithFetchRequest:].cold.1();

    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  v9 = v7;

  return v9;
}

- (id)recordingsWithTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  RCSavedRecordingsModel *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke;
  v9[3] = &unk_1E769BFA8;
  v5 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v5;
  -[RCSavedRecordingsModel performBlockAndWait:](self, "performBlockAndWait:", v9);
  v6 = (void *)v14[5];
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;

  +[RCQueryManager recordingsWithTitleFetchRequest:](RCQueryManager, "recordingsWithTitleFetchRequest:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[5] + 8);
  v9 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    OSLogForCategory(CFSTR("Default"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke_cold_1();

  }
}

- (id)visibleRecordingsFetchedResultsController
{
  void *v3;
  void *v4;

  +[RCQueryManager visibleRecordingsFetchRequest](RCQueryManager, "visibleRecordingsFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v3, self->_context, 0, 0);

  return v4;
}

- (id)userFoldersFetchedResultsController
{
  void *v3;
  void *v4;

  -[RCSavedRecordingsModel _userFolderFetchRequest](self, "_userFolderFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B68]), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v3, self->_context, 0, 0);

  return v4;
}

- (id)insertRecordingWithAudioFile:(id)a3 duration:(double)a4 date:(id)a5
{
  return -[RCSavedRecordingsModel insertRecordingWithAudioFile:duration:date:customLabelBase:](self, "insertRecordingWithAudioFile:duration:date:customLabelBase:", a3, a5, 0, a4);
}

- (int64_t)isSavingDisabledCount
{
  return self->_isSavingDisabledCount;
}

- (void)setIsSavingDisabledCount:(int64_t)a3
{
  self->_isSavingDisabledCount = a3;
}

- (void)recordingWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- ERROR: Unable to fetch recording (%@.)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __90__RCSavedRecordingsModel_enumerateExistingRecordingsWithProperties_sortDescriptors_block___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- ERROR: Unable to fetch recordings (%@.)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD830000, v0, v1, "%s -- ERROR: Unable to fetch change history (%@.), request = %@", v2);
  OUTLINED_FUNCTION_8();
}

void __61__RCSavedRecordingsModel__transactionsAndChangesWithRequest___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD830000, v0, v1, "%s -- ERROR: Unexpected result type - result = %@, request = %@", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)_determineImportabilityOfRecordingWithAudioFile:(void *)a1 preferredFormat:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BD830000, a2, v4, "%s -- ERROR: import disallowed because audioURL '%@' duration is 0.0", (uint8_t *)v5);

  OUTLINED_FUNCTION_8();
}

void __108__RCSavedRecordingsModel__determineImportabilityOfRecordingWithAudioFile_preferredFormat_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BD830000, a2, v4, "%s -- ERROR: import disallowed because audioURL '%@' can not be exported by AVFoundation.", (uint8_t *)v5);

  OUTLINED_FUNCTION_8();
}

+ (void)determineImportabilityOfRecordingWithAudioURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- readError = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)importRecordingWithSourceAudioURL:name:date:xpcConnection:userInfo:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- could not import Music Memo with conflicting uniqueID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __111__RCSavedRecordingsModel_importRecordingWithSourceAudioURL_name_date_xpcConnection_userInfo_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- updateError = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __114__RCSavedRecordingsModel__importRecordingWithSourceAudioURL_name_date_uniqueID_preferredFormat_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- removeError = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_importImportableRecordingWithAudioAsset:(uint64_t)a3 name:(NSObject *)a4 date:uniqueID:presetName:outputFileType:completionHandler:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315650;
  *(_QWORD *)(a3 + 4) = "-[RCSavedRecordingsModel _importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName:"
                        "outputFileType:completionHandler:]";
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_10(&dword_1BD830000, a4, a3, "%s -- Preparing asset %@ (exporting to %@) for import...", (uint8_t *)a3);

}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  v6 = objc_msgSend(*a1, "status");
  v7 = 136315906;
  v8 = "-[RCSavedRecordingsModel _importImportableRecordingWithAudioAsset:name:date:uniqueID:presetName:outputFileType:co"
       "mpletionHandler:]_block_invoke";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = a2;
  v13 = 1024;
  v14 = v6;
  _os_log_error_impl(&dword_1BD830000, a3, OS_LOG_TYPE_ERROR, "%s -- ERROR: Unable to prepare asset %@ for import with underlying error = %@, exportSession.status = %d", (uint8_t *)&v7, 0x26u);
  OUTLINED_FUNCTION_9();
}

void __130__RCSavedRecordingsModel__importImportableRecordingWithAudioAsset_name_date_uniqueID_presetName_outputFileType_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_1BD830000, a2, v4, "%s -- Finished preparing asset %@ (exported to %@) for import...", (uint8_t *)v5);

  OUTLINED_FUNCTION_9();
}

void __41__RCSavedRecordingsModel_folderWithName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- obtainPermanentIDsForObjects failed %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __48__RCSavedRecordingsModel__countForFetchRequest___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD830000, v0, v1, "%s -- countForFetchRequest failed with error = %@, fetchRequest = %@", v2);
  OUTLINED_FUNCTION_8();
}

void __37__RCSavedRecordingsModel_userFolders__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- executeFetchRequest error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __49__RCSavedRecordingsModel_existingFolderWithUUID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, a1, a3, "%s -- executeFetchRequest failed %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- Error deleting folder: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __39__RCSavedRecordingsModel_deleteFolder___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- deleting folder: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __42__RCSavedRecordingsModel_eraseRecordings___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- Error erasing recordings: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __43__RCSavedRecordingsModel_deleteRecordings___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- Error deleting recordings: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __51__RCSavedRecordingsModel_restoreDeletedRecordings___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- Error restoring recordings: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __59__RCSavedRecordingsModel_eraseRecordingsDeletedBeforeDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- Error restoring recording: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __41__RCSavedRecordingsModel_eraseAllDeleted__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1BD830000, v0, v1, "%s -- Error deleting all recordings: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __81__RCSavedRecordingsModel_duplicateRecording_copyingResources_creationDate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Error duplicating recording: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_recordingsForFolderUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- fetch request failed - error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __56__RCSavedRecordingsModel_reconcileChangedFolder_change___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- fetchError = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __53__RCSavedRecordingsModel___saveManagedObjectContext___block_invoke_cold_1()
{
  os_log_t v0;
  int v1[6];

  OUTLINED_FUNCTION_11(*MEMORY[0x1E0C80C00]);
  v1[0] = 136315394;
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1BD830000, v0, OS_LOG_TYPE_FAULT, "%s -- ERROR: Attempt to save database failed, possibly due to an entity with an invalid value.  Core Data error = %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

+ (void)_copyFileIntoRecordingsDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Warning: Could not copy audio file to recordings directory. %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

+ (void)_moveFileIntoRecordingsDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Warning: Could not copy audio file to recordings directory. %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __66__RCSavedRecordingsModel_objectIDsForRecordingsNeedingAssetExport__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- fetch request failed - error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __50__RCSavedRecordingsModel_encryptedFieldMigrations__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Failed to fetch migrations, error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_recordingsWithFetchRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1BD830000, v0, v1, "%s -- Recordings fetch request failed - error = %@, fetch request = %@", v2);
  OUTLINED_FUNCTION_8();
}

void __46__RCSavedRecordingsModel_recordingsWithTitle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- Failed to executeFetchRequest %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

@end
