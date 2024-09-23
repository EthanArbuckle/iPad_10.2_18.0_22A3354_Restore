@implementation PLBackgroundModelMigration

- (id)initBackgroundMigrationWithPhotoLibraryBundle:(id)a3 logger:(id)a4 continuationHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PLDatabaseContext *v12;
  id v13;
  PLBackgroundMigrationContext *v14;
  void *v15;
  PLBackgroundMigrationContext *v16;
  PLBackgroundModelMigration *v17;
  PLBackgroundModelMigration *v18;
  uint64_t v19;
  id continuationHandler;
  void *v21;
  uint64_t v22;
  NSString *migrationUUID;
  uint64_t v24;
  NSProgress *progress;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *actionsBackground;
  id v29;
  id v30;
  uint64_t v31;
  PLLazyObject *lazyAppPrivateData;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id from;
  _QWORD v41[4];
  id v42;
  id location;
  objc_super v44;

  v9 = a3;
  v37 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundModelMigration.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"), v37);

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundModelMigration.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("continuationHandler"));

LABEL_3:
  v12 = -[PLDatabaseContext initWithLibraryBundle:]([PLDatabaseContext alloc], "initWithLibraryBundle:", v9);
  v13 = objc_alloc_init(MEMORY[0x1E0D731C0]);
  v14 = [PLBackgroundMigrationContext alloc];
  objc_msgSend(v9, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLBackgroundMigrationContext initWithPathManager:databaseContext:analyticsEventManager:](v14, "initWithPathManager:databaseContext:analyticsEventManager:", v15, v12, v13);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundModelMigration.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[ctx isKindOfClass:PLBackgroundMigrationContext.class]"));

  }
  v44.receiver = self;
  v44.super_class = (Class)PLBackgroundModelMigration;
  v17 = -[PLBackgroundModelMigration init](&v44, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, a4);
    v19 = MEMORY[0x19AEC174C](v11);
    continuationHandler = v18->_continuationHandler;
    v18->_continuationHandler = (id)v19;

    objc_storeStrong((id *)&v18->_internalMigrationContext, v16);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = objc_claimAutoreleasedReturnValue();
    migrationUUID = v18->_migrationUUID;
    v18->_migrationUUID = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v24 = objc_claimAutoreleasedReturnValue();
    progress = v18->_progress;
    v18->_progress = (NSProgress *)v24;

    -[NSProgress setCancellable:](v18->_progress, "setCancellable:", 1);
    objc_initWeak(&location, v18);
    v26 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke;
    v41[3] = &unk_1E3677D48;
    objc_copyWeak(&v42, &location);
    -[NSProgress setCancellationHandler:](v18->_progress, "setCancellationHandler:", v41);
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actionsBackground = v18->_actionsBackground;
    v18->_actionsBackground = v27;

    v18->_actionProgressPortionBackground = 0;
    v29 = objc_initWeak(&from, v18);

    v30 = objc_alloc(MEMORY[0x1E0D73248]);
    v38[0] = v26;
    v38[1] = 3221225472;
    v38[2] = __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke_51;
    v38[3] = &unk_1E36759D8;
    objc_copyWeak(&v39, &from);
    v31 = objc_msgSend(v30, "initWithBlock:", v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&from);
    lazyAppPrivateData = v18->_lazyAppPrivateData;
    v18->_lazyAppPrivateData = (PLLazyObject *)v31;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (id)analyticsEventManager
{
  return (id)-[PLModelMigrationContext analyticsEventManager](self->_internalMigrationContext, "analyticsEventManager");
}

- (id)pathManager
{
  return (id)-[PLModelMigrationContext pathManager](self->_internalMigrationContext, "pathManager");
}

- (int64_t)libraryIdentifier
{
  return -[PLModelMigrationContext libraryIdentifier](self->_internalMigrationContext, "libraryIdentifier");
}

- (id)migrationContext
{
  return self->_internalMigrationContext;
}

- (id)databaseContext
{
  return (id)-[PLModelMigrationContext databaseContext](self->_internalMigrationContext, "databaseContext");
}

- (id)appPrivateData
{
  return (id)-[PLLazyObject objectValue](self->_lazyAppPrivateData, "objectValue");
}

- (void)registerBackgroundActionClass:(Class)a3 onCondition:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  uint8_t *v17;
  void *v18;
  void *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  id v28;
  PLModelMigrationContext *internalMigrationContext;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableArray *actionsBackground;
  NSObject *v36;
  id v37;
  PLModelMigrationContext *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  void *v47;
  uint8_t *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  int v52;
  void *v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v4 = a4;
  v86 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundModelMigration.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationActionBackground.class]"));

  }
  v8 = (void *)objc_opt_class();
  -[PLBackgroundModelMigration appPrivateData](self, "appPrivateData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isCompletedBackgroundActionClass:appPrivateData:", a3, v9);

  if (v4)
  {
    if ((v10 & 1) != 0)
    {
      -[PLBackgroundModelMigration logger](self, "logger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

        if (v14)
        {
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          *(_OWORD *)buf = 0u;
          v55 = 0u;
          PLMigrationGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          NSStringFromClass(a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138543362;
          v53 = v16;
          LODWORD(v51) = 12;
          v17 = (uint8_t *)_os_log_send_and_compose_impl();

          -[PLBackgroundModelMigration logger](self, "logger", &v52, v51);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          v20 = v17;
          v21 = 175;
          goto LABEL_12;
        }
      }
      return;
    }
    v28 = [a3 alloc];
    internalMigrationContext = self->_internalMigrationContext;
    -[PLBackgroundModelMigration logger](self, "logger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -[objc_class actionProgressWeight](a3, "actionProgressWeight"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundModelMigration continuationHandler](self, "continuationHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v28, "initWithMigrationContext:logger:progress:continuationHandler:", internalMigrationContext, v30, v31, v32);

    v34 = -[objc_class actionProgressWeight](a3, "actionProgressWeight");
    actionsBackground = self->_actionsBackground;
    self->_actionProgressPortionBackground += v34;
    -[NSMutableArray addObject:](actionsBackground, "addObject:", v33);
    PLMigrationGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEBUG, "Registering background action: %{public}@", buf, 0xCu);
    }

LABEL_21:
    return;
  }
  if ((v10 & 1) == 0)
  {
    v37 = [a3 alloc];
    v38 = self->_internalMigrationContext;
    -[PLBackgroundModelMigration logger](self, "logger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -[objc_class actionProgressWeight](a3, "actionProgressWeight"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundModelMigration continuationHandler](self, "continuationHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v37, "initWithMigrationContext:logger:progress:continuationHandler:", v38, v39, v40, v41);

    -[PLBackgroundModelMigration setMarkerForBackgroundAction:marker:](self, "setMarkerForBackgroundAction:marker:", v33, 3);
    -[PLBackgroundModelMigration logger](self, "logger");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v43 = (void *)v42;
      PLMigrationGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);

      if (v45)
      {
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        *(_OWORD *)buf = 0u;
        v55 = 0u;
        PLMigrationGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        NSStringFromClass(a3);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = v47;
        LODWORD(v51) = 12;
        v48 = (uint8_t *)_os_log_send_and_compose_impl();

        -[PLBackgroundModelMigration logger](self, "logger", &v52, v51);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logWithMessage:fromCodeLocation:type:", v48, "PLBackgroundModelMigration.m", 183, 0);

        if (v48 != buf)
          free(v48);
      }
    }
    goto LABEL_21;
  }
  -[PLBackgroundModelMigration logger](self, "logger");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    PLMigrationGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      *(_OWORD *)buf = 0u;
      v55 = 0u;
      PLMigrationGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543362;
      v53 = v27;
      LODWORD(v51) = 12;
      v17 = (uint8_t *)_os_log_send_and_compose_impl();

      -[PLBackgroundModelMigration logger](self, "logger", &v52, v51);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = v17;
      v21 = 185;
LABEL_12:
      objc_msgSend(v18, "logWithMessage:fromCodeLocation:type:", v20, "PLBackgroundModelMigration.m", v21, 0);

      if (v17 != buf)
        free(v17);
    }
  }
}

- (int64_t)migrateBackgroundPostProcessingWithError:(id *)a3
{
  _BOOL4 v4;
  uint64_t v5;
  PLModelMigrationActionProcessor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLModelMigrationActionProcessor *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id *v25;
  _BOOL4 v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  _OWORD *v34;
  void *v35;
  int64_t v36;
  uint64_t v38;
  NSMutableArray *v40;
  uint64_t v41;
  id v42;
  _QWORD v43[6];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id obj;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  int v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  _OWORD v66[32];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__39452;
  v60 = __Block_byref_object_dispose__39453;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  obj = 0;
  v4 = -[PLBackgroundModelMigration isMigrationCancelledWithError:](self, "isMigrationCancelledWithError:", &obj);
  objc_storeStrong(&v61, obj);
  v5 = 1;
  if (v4)
    v5 = 2;
  v55 = v5;
  if (-[NSMutableArray count](self->_actionsBackground, "count") && v53[3] == 1)
  {
    v6 = [PLModelMigrationActionProcessor alloc];
    -[PLBackgroundModelMigration migrationUUID](self, "migrationUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundModelMigration pathManager](self, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundModelMigration analyticsEventManager](self, "analyticsEventManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundModelMigration logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLModelMigrationActionProcessor initWithUUID:pathManager:migrationActionType:analyticsEventManager:logger:progressUnitCount:](v6, "initWithUUID:pathManager:migrationActionType:analyticsEventManager:logger:progressUnitCount:", v7, v8, 5, v9, v10, self->_actionProgressPortionBackground);

    -[PLModelMigrationActionProcessor setIgnoreProgressUpdates:](v11, "setIgnoreProgressUpdates:", 1);
    -[PLModelMigrationActionProcessor progress](v11, "progress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PLBackgroundModelMigration progress](self, "progress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLModelMigrationActionProcessor progress](v11, "progress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addChild:withPendingUnitCount:", v14, self->_actionProgressPortionBackground);

    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = self->_actionsBackground;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
    if (v15)
    {
      v41 = *(_QWORD *)v48;
LABEL_9:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v40);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v17, "progress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLModelMigrationActionProcessor progress](v11, "progress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addChild:withPendingUnitCount:", v19, objc_msgSend((id)objc_opt_class(), "actionProgressWeight"));

        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "actionDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __71__PLBackgroundModelMigration_migrateBackgroundPostProcessingWithError___block_invoke;
        v43[3] = &unk_1E36698A8;
        v43[4] = self;
        v43[5] = v17;
        v45 = &v52;
        v46 = &v56;
        v24 = v19;
        v44 = v24;
        -[PLModelMigrationActionProcessor performActionWithName:ifRequired:block:](v11, "performActionWithName:ifRequired:block:", v23, 1, v43);

        if (-[PLModelMigrationActionProcessor isSuccess](v11, "isSuccess"))
        {
          v25 = (id *)(v57 + 5);
          v42 = (id)v57[5];
          v26 = -[PLBackgroundModelMigration isMigrationCancelledWithError:](self, "isMigrationCancelledWithError:", &v42);
          objc_storeStrong(v25, v42);
          if (v26)
          {
            LODWORD(v27) = 0;
            v53[3] = 2;
          }
          else
          {
            LODWORD(v27) = 1;
          }
        }
        else
        {
          -[PLBackgroundModelMigration logger](self, "logger");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            PLMigrationGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

            if (v29)
            {
              memset(v66, 0, sizeof(v66));
              PLMigrationGetLog();
              v30 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
              v31 = (objc_class *)objc_opt_class();
              NSStringFromClass(v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v57[5];
              v62 = 138543618;
              v63 = v32;
              v64 = 2114;
              v65 = v33;
              LODWORD(v38) = 22;
              v34 = (_OWORD *)_os_log_send_and_compose_impl();

              -[PLBackgroundModelMigration logger](self, "logger", &v62, v38);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "logWithMessage:fromCodeLocation:type:", v34, "PLBackgroundModelMigration.m", 283, 16);

              if (v34 != v66)
                free(v34);
            }
            LODWORD(v27) = 0;
          }
        }

        objc_autoreleasePoolPop(v18);
        if (!(_DWORD)v27)
          break;
        if (v15 == ++v16)
        {
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
          if (v15)
            goto LABEL_9;
          break;
        }
      }
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v57[5]);
  v36 = v53[3];
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v36;
}

- (int64_t)runBackgroundMigrationAction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  int64_t v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__39452;
  v24 = __Block_byref_object_dispose__39453;
  v25 = 0;
  -[PLBackgroundModelMigration databaseContext](self, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", objc_msgSend(v9, "UTF8String"));

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PLBackgroundModelMigration_runBackgroundMigrationAction_error___block_invoke;
  v15[3] = &unk_1E366F518;
  v15[4] = self;
  v11 = v6;
  v16 = v11;
  v18 = &v26;
  v12 = v10;
  v17 = v12;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v13 = v27[3];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)setMarkerForBackgroundAction:(id)a3 marker:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  _OWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  int v46;
  id v47;
  _OWORD v48[32];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundModelMigration.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundModelMigration.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("marker != PLModelMigrationActionBackgroundStatusNotStarted"));

LABEL_3:
  -[PLBackgroundModelMigration appPrivateData](self, "appPrivateData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("MigrationAction.Background"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = (objc_class *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    NSStringFromClass(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v15);

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("PLBackgroundMigrationStartDate"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("PLBackgroundMigrationStatus"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("PLBackgroundMigrationStatusDate"));
  if (a4 == 1)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBackgroundMigrationStatusAttempts"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    v22 = v21 + 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21 + 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("PLBackgroundMigrationStatusAttempts"));

    -[PLBackgroundModelMigration analyticsEventManager](self, "analyticsEventManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D736F8];
    objc_msgSend(v24, "setPayloadValue:forKey:onEventWithName:", v25, *MEMORY[0x1E0D73700], *MEMORY[0x1E0D736F8]);

  }
  else if (a4 == 2)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBackgroundMigrationStartDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:", v17);
      v19 = v18;
    }
    else
    {
      v19 = -1.0;
    }
    -[PLBackgroundModelMigration analyticsEventManager](self, "analyticsEventManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D736F8];
    objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v28, *MEMORY[0x1E0D73710], *MEMORY[0x1E0D736F8]);

  }
  else
  {
    v26 = *MEMORY[0x1E0D736F8];
  }
  -[PLBackgroundModelMigration analyticsEventManager](self, "analyticsEventManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "shortenedMigrationActionClassName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPayloadValue:forKey:onEventWithName:", v30, *MEMORY[0x1E0D73708], v26);

  -[PLBackgroundModelMigration analyticsEventManager](self, "analyticsEventManager");
  v31 = objc_claimAutoreleasedReturnValue();
  PLStringFromModelMigrationActionBackgroundStatusShort(a4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v31, "setPayloadValue:forKey:onEventWithName:", v32, *MEMORY[0x1E0D73720], v26);

  -[PLBackgroundModelMigration appPrivateData](self, "appPrivateData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  LOBYTE(v31) = objc_msgSend(v33, "setValue:forKeyPath:error:", v10, CFSTR("MigrationAction.Background"), &v45);
  v34 = v45;

  if ((v31 & 1) == 0)
  {
    -[PLBackgroundModelMigration logger](self, "logger");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      PLMigrationGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

      if (v38)
      {
        memset(v48, 0, sizeof(v48));
        PLMigrationGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        v46 = 138412290;
        v47 = v34;
        LODWORD(v44) = 12;
        v40 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLBackgroundModelMigration logger](self, "logger", &v46, v44);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLBackgroundModelMigration.m", 375, 16);

        if (v40 != v48)
          free(v40);
      }
    }
  }

}

- (BOOL)isMigrationCancelledWithError:(id *)a3
{
  void *v5;
  uint64_t (**v6)(void);
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[PLBackgroundModelMigration continuationHandler](self, "continuationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLBackgroundModelMigration continuationHandler](self, "continuationHandler");
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v7 = v6[2]();

    if ((v7 & 1) == 0)
    {
      -[PLBackgroundModelMigration progress](self, "progress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");

    }
  }
  -[PLBackgroundModelMigration progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCancelled");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D74498];
    v16 = *MEMORY[0x1E0CB2D68];
    v17[0] = CFSTR("Migration was cancelled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 46014, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = 0;
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v14);
LABEL_9:

  return v10;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (PLFileBackedLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (NSString)migrationUUID
{
  return self->_migrationUUID;
}

- (void)setMigrationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_migrationUUID, a3);
}

- (id)continuationHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setContinuationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continuationHandler, 0);
  objc_storeStrong((id *)&self->_migrationUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_actionsBackground, 0);
  objc_storeStrong((id *)&self->_internalMigrationContext, 0);
}

void __65__PLBackgroundModelMigration_runBackgroundMigrationAction_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  _OWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id obj;
  int v24;
  void *v25;
  _OWORD v26[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setMarkerForBackgroundAction:marker:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "performActionWithManagedObjectContext:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;

  v6 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
  {
    objc_msgSend(v6, "setMarkerForBackgroundAction:marker:", *(_QWORD *)(a1 + 40), 2);
  }
  else
  {
    objc_msgSend(v6, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        memset(v26, 0, sizeof(v26));
        PLMigrationGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v13;
        LODWORD(v22) = 12;
        v14 = (_OWORD *)_os_log_send_and_compose_impl();

        objc_msgSend(*(id *)(a1 + 32), "logger", &v24, v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logWithMessage:fromCodeLocation:type:", v14, "PLBackgroundModelMigration.m", 312, 0);

        if (v14 != v26)
          free(v14);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "analyticsEventManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "libraryIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", v17, *MEMORY[0x1E0D737A0], *MEMORY[0x1E0D737A8]);

  objc_msgSend(*(id *)(a1 + 32), "analyticsEventManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringFromModelMigrationActionResultShort(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0D736F8];
  objc_msgSend(v18, "setPayloadValue:forKey:onEventWithName:", v19, *MEMORY[0x1E0D73718], *MEMORY[0x1E0D736F8]);

  objc_msgSend(*(id *)(a1 + 32), "analyticsEventManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "publishEventWithName:", v20);

}

BOOL __71__PLBackgroundModelMigration_migrateBackgroundPostProcessingWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  id v8[73];

  v8[72] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8[0] = 0;
  v4 = objc_msgSend(v2, "runBackgroundMigrationAction:error:", v3, v8);
  v5 = v8[0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1;

  return v6;
}

void __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _OWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  _WORD v12[8];
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      v12[0] = 0;
      LODWORD(v10) = 2;
      v7 = (_OWORD *)_os_log_send_and_compose_impl();

      v8 = objc_loadWeakRetained(v1);
      objc_msgSend(v8, "logger", v12, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v7, "PLBackgroundModelMigration.m", 130, 0);

      if (v7 != v13)
        free(v7);
    }
  }
  else
  {

  }
}

id __103__PLBackgroundModelMigration_initBackgroundMigrationWithPhotoLibraryBundle_logger_continuationHandler___block_invoke_51(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(WeakRetained, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appPrivateDataForLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasCompletedBackgroundActionClass:(Class)a3 pathManager:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;

  v7 = a4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundModelMigration.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationActionBackground.class]"));

  }
  v8 = (void *)MEMORY[0x1E0D73158];
  objc_msgSend(v7, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appPrivateDataForLibraryURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(a1, "isCompletedBackgroundActionClass:appPrivateData:", a3, v10);
  return v11;
}

+ (BOOL)resetBackgroundActionClass:(Class)a3 pathManager:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  BOOL v18;
  id v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundModelMigration.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationActionBackground.class]"));

  }
  v10 = (void *)MEMORY[0x1E0D73158];
  objc_msgSend(v9, "libraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appPrivateDataForLibraryURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "valueForKeyPath:", CFSTR("MigrationAction.Background"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  NSStringFromClass(a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v15);

  v29 = 0;
  v16 = objc_msgSend(v12, "setValue:forKeyPath:error:", v14, CFSTR("MigrationAction.Background"), &v29);
  v17 = v29;
  if (v16)
  {
    v28 = v17;
    v18 = +[PLModelMigrationActionBackground resetResumeMarkerForActionClass:pathManager:error:](PLModelMigrationActionBackground, "resetResumeMarkerForActionClass:pathManager:error:", a3, v9, &v28);
    v19 = v28;

    if (v18)
    {
      v20 = v19;
      v21 = 1;
      goto LABEL_14;
    }
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v24;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to reset the resume marker id in private app data for class: %{public}@. Error: %@", buf, 0x16u);

    }
  }
  else
  {
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v17;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to reset marker in private app data for class: %{public}@. Error: %@", buf, 0x16u);

    }
    v19 = v17;
  }

  v25 = v19;
  v20 = v25;
  if (a5)
  {
    v20 = objc_retainAutorelease(v25);
    v21 = 0;
    *a5 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_14:

  return v21;
}

+ (int64_t)migrateBackgroundActionsWithPhotoLibraryBundle:(id)a3 logger:(id)a4 error:(id *)a5 continuationHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  int64_t v16;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  PLBackgroundMigrationActionQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PLBackgroundModelMigration_migrateBackgroundActionsWithPhotoLibraryBundle_logger_error_continuationHandler___block_invoke;
  block[3] = &unk_1E3672020;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = &v24;
  v23 = a5;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_sync(v12, block);

  v16 = v25[3];
  _Block_object_dispose(&v24, 8);
  return v16;
}

+ (BOOL)isCompletedBackgroundActionClass:(Class)a3 appPrivateData:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = v7;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundModelMigration.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionClass"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundModelMigration.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appPrivateData"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "valueForKeyPath:", CFSTR("MigrationAction.Background"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBackgroundMigrationStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  return (v13 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (BOOL)isBackgroundMigrationRegistrationAfterRebuildRequiredWithLibrary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  char v26;
  char v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    PLModelMigrationSubclassesForClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v11, "isResetAfterRebuildRequiredWithLibrary:", v3))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v8);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v13)
    {
      v14 = v13;
      v28 = 0;
      v15 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v3, "pathManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v17) = +[PLBackgroundModelMigration hasCompletedBackgroundActionClass:pathManager:](PLBackgroundModelMigration, "hasCompletedBackgroundActionClass:pathManager:", v17, v18);

          if ((_DWORD)v17)
          {
            v19 = objc_opt_class();
            objc_msgSend(v3, "pathManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            v21 = +[PLBackgroundModelMigration resetBackgroundActionClass:pathManager:error:](PLBackgroundModelMigration, "resetBackgroundActionClass:pathManager:error:", v19, v20, &v29);
            v22 = v29;

            PLMigrationGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v21)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Requesting background migration after rebuild", buf, 2u);
              }
              v28 = 1;
            }
            else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v22;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to reset: PLModelMigrationAction_UpdateAssetAdjustmentsState. Error: %@", buf, 0xCu);
            }

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v14);
    }
    else
    {
      v28 = 0;
    }

    v25 = v6;
    v26 = v28;
  }
  else
  {
    PLMigrationGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Unable to check background migration action reset after rebuild due to missing library", buf, 2u);
    }
    v26 = 0;
  }

  return v26 & 1;
}

void __110__PLBackgroundModelMigration_migrateBackgroundActionsWithPhotoLibraryBundle_logger_error_continuationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  _OWORD *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v22;
  id v23;
  int v24;
  id v25;
  _OWORD v26[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  v3 = -[PLBackgroundModelMigration initBackgroundMigrationWithPhotoLibraryBundle:logger:continuationHandler:]([PLBackgroundModelMigration alloc], "initBackgroundMigrationWithPhotoLibraryBundle:logger:continuationHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  PLModelMigrationActionRegistration_Background(v3);
  v23 = 0;
  v4 = objc_msgSend(v3, "migrateBackgroundPostProcessingWithError:", &v23);
  v5 = v23;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v6 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PLBumpBackgroundMigrationLibraryURL(v8);

    if (v9 >= 4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(v3, "logger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        PLMigrationGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

        if (v13)
        {
          memset(v26, 0, sizeof(v26));
          PLMigrationGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
          v24 = 138412290;
          v25 = v5;
          LODWORD(v22) = 12;
          v15 = (_OWORD *)_os_log_send_and_compose_impl();

          objc_msgSend(v3, "logger", &v24, v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLBackgroundModelMigration.m", 238, 16);

          if (v15 != v26)
            free(v15);
        }
      }
    }
  }
  else if (v6 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLDeregisterBackgroundMigrationLibraryURL(v7);

  }
  objc_autoreleasePoolPop(v2);
  v17 = *(_QWORD **)(a1 + 64);
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v19 = v5;
  v20 = v19;
  if (v18 != 1 && v17 != 0)
    *v17 = objc_retainAutorelease(v19);

}

@end
