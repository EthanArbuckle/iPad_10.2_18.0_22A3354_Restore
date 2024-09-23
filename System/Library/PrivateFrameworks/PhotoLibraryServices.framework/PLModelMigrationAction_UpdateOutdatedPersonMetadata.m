@implementation PLModelMigrationAction_UpdateOutdatedPersonMetadata

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __objc2_class **v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  __objc2_class *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  _OWORD *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  PLModelMigrationAction_UpdateOutdatedPersonMetadata *v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _OWORD v50[32];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = self;
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPersistedPersonMetadata urlsForPersistedPersonsInMetadataDirectoryWithPathManager:](PLPersistedPersonMetadata, "urlsForPersistedPersonsInMetadataDirectoryWithPathManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v8)
  {
    v9 = v8;
    v38 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v43;
    v12 = off_1E365A000;
    do
    {
      v13 = 0;
      v40 = v9;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19AEC1554]();
        v16 = (void *)objc_msgSend(objc_alloc(v12[189]), "initWithPersistedDataAtURL:cplEnabled:", v14, 0);
        if ((objc_msgSend(v16, "matchesEntityInLibraryBackedByManagedObjectContext:diff:", v5, 0) & 1) == 0)
        {
          v17 = v11;
          objc_msgSend(v16, "personUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v18, v5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 && objc_msgSend(v19, "verifiedType"))
          {
            v20 = objc_alloc(v12[189]);
            -[PLModelMigrationActionCore pathManager](v39, "pathManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v20, "initWithPLPerson:pathManager:", v19, v21);

            objc_msgSend(v22, "writePersistedData");
            ++v38;

          }
          else
          {
            v23 = v12[189];
            objc_msgSend(v16, "personUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLModelMigrationActionCore pathManager](v39, "pathManager");
            v25 = v5;
            v26 = v10;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[__objc2_class deleteMetadataFileForPersonUUID:pathManager:](v23, "deleteMetadataFileForPersonUUID:pathManager:", v24, v27);

            v28 = v26;
            v5 = v25;
            v12 = off_1E365A000;

            v10 = v28 + 1;
          }

          v11 = v17;
          v9 = v40;
        }

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v9);
  }
  else
  {
    v38 = 0;
    v10 = 0;
  }

  -[PLModelMigrationActionCore logger](v39, "logger");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    PLMigrationGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

    if (v32)
    {
      memset(v50, 0, sizeof(v50));
      PLMigrationGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
      v46 = 134218240;
      v47 = v38;
      v48 = 2048;
      v49 = v10;
      LODWORD(v37) = 22;
      v34 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](v39, "logger", &v46, v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLModelMigrationActions_18000.m", 1702, 1);

      if (v34 != v50)
        free(v34);
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](v39, "finalizeProgress");

  return 1;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end
