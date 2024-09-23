@implementation PLModelMigration

+ (int)currentModelVersion
{
  return 18212;
}

- (PLModelMigration)initWithMigrationContext:(id)a3 logger:(id)a4
{
  id v8;
  id v9;
  PLModelMigration *v10;
  PLModelMigration *v11;
  void *v12;
  uint64_t v13;
  NSString *migrationUUID;
  uint64_t v15;
  NSProgress *progress;
  NSMutableArray *v17;
  NSMutableArray *actions;
  NSMutableArray *v19;
  NSMutableArray *actionsPreRepair;
  NSMutableArray *v21;
  NSMutableArray *actionsPostRepair;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("migrationContext"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[migrationContext isKindOfClass:PLMigrationContext.class]"));

  }
  v29.receiver = self;
  v29.super_class = (Class)PLModelMigration;
  v10 = -[PLModelMigration init](&v29, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_logger, a4);
    objc_storeStrong((id *)&v11->_internalMigrationContext, a3);
    v11->_didCreateSqliteErrorIndicator = 0;
    v11->_allowRebuild = (objc_msgSend(v8, "policy") & 2) != 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    migrationUUID = v11->_migrationUUID;
    v11->_migrationUUID = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v15 = objc_claimAutoreleasedReturnValue();
    progress = v11->_progress;
    v11->_progress = (NSProgress *)v15;

    -[NSProgress setCancellable:](v11->_progress, "setCancellable:", 1);
    objc_initWeak(&location, v11);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__PLModelMigration_initWithMigrationContext_logger___block_invoke;
    v26[3] = &unk_1E3677D48;
    objc_copyWeak(&v27, &location);
    -[NSProgress setCancellationHandler:](v11->_progress, "setCancellationHandler:", v26);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v11->_actions;
    v11->_actions = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actionsPreRepair = v11->_actionsPreRepair;
    v11->_actionsPreRepair = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actionsPostRepair = v11->_actionsPostRepair;
    v11->_actionsPostRepair = v21;

    v11->_actionProgressPortion = 0;
    v11->_actionProgressPortionPreRepair = 0;
    v11->_actionProgressPortionPostRepair = 0;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (id)analyticsEventManager
{
  return (id)-[PLModelMigrationContext analyticsEventManager](self->_internalMigrationContext, "analyticsEventManager");
}

- (id)pathManager
{
  return (id)-[PLModelMigrationContext pathManager](self->_internalMigrationContext, "pathManager");
}

- (id)graphCache
{
  return (id)-[PLModelMigrationContext graphCache](self->_internalMigrationContext, "graphCache");
}

- (id)migrationContext
{
  return self->_internalMigrationContext;
}

- (void)actionRegistration
{
  PLModelMigrationActionRegistration_Repairs(self);
  PLModelMigrationActionRegistration_15000(self);
  PLModelMigrationActionRegistration_16000(self);
  PLModelMigrationActionRegistration_17000(self);
  PLModelMigrationActionRegistration_18000(self);
}

- (void)registerActionClass:(Class)a3 onCondition:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  _OWORD *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _OWORD v20[32];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (v4)
    {
LABEL_3:
      -[PLModelMigration _registerActionClass:actionsContainer:progressPortion:](self, "_registerActionClass:actionsContainer:progressPortion:", a3, self->_actions, &self->_actionProgressPortion);
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationAction.class]"));

    if (v4)
      goto LABEL_3;
  }
  -[PLModelMigration logger](self, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      memset(v20, 0, sizeof(v20));
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      LODWORD(v17) = 12;
      v15 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v18, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 201, 0);

      if (v15 != v20)
        free(v15);
    }
  }
}

- (void)registerStagedActionClass:(Class)a3 onCondition:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  _OWORD *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _OWORD v20[32];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (v4)
    {
LABEL_3:
      -[PLModelMigration _registerActionClass:actionsContainer:progressPortion:](self, "_registerActionClass:actionsContainer:progressPortion:", a3, self->_actionsStaged, 0);
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationActionStaged.class]"));

    if (v4)
      goto LABEL_3;
  }
  -[PLModelMigration logger](self, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      memset(v20, 0, sizeof(v20));
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      LODWORD(v17) = 12;
      v15 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v18, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 211, 0);

      if (v15 != v20)
        free(v15);
    }
  }
}

- (void)registerPreRepairActionClass:(Class)a3 onCondition:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  _OWORD *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _OWORD v20[32];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (v4)
    {
LABEL_3:
      -[PLModelMigration _registerActionClass:actionsContainer:progressPortion:](self, "_registerActionClass:actionsContainer:progressPortion:", a3, self->_actionsPreRepair, &self->_actionProgressPortionPreRepair);
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationActionPreRepair.class]"));

    if (v4)
      goto LABEL_3;
  }
  -[PLModelMigration logger](self, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      memset(v20, 0, sizeof(v20));
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      LODWORD(v17) = 12;
      v15 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v18, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 221, 0);

      if (v15 != v20)
        free(v15);
    }
  }
}

- (void)registerPostRepairActionClass:(Class)a3 onCondition:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  _OWORD *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _OWORD v20[32];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (v4)
    {
LABEL_3:
      -[PLModelMigration _registerActionClass:actionsContainer:progressPortion:](self, "_registerActionClass:actionsContainer:progressPortion:", a3, self->_actionsPostRepair, &self->_actionProgressPortionPostRepair);
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[(Class)actionClass isSubclassOfClass:PLModelMigrationActionPostRepair.class]"));

    if (v4)
      goto LABEL_3;
  }
  -[PLModelMigration logger](self, "logger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      memset(v20, 0, sizeof(v20));
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      LODWORD(v17) = 12;
      v15 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v18, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigration.m", 231, 0);

      if (v15 != v20)
        free(v15);
    }
  }
}

- (void)_registerActionClass:(Class)a3 actionsContainer:(id)a4 progressPortion:(unint64_t *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions"));

  }
  v10 = [a3 alloc];
  -[PLModelMigration migrationContext](self, "migrationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration logger](self, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -[objc_class actionProgressWeight](a3, "actionProgressWeight"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithMigrationContext:logger:progress:", v11, v12, v13);

  if (a5)
    *a5 += -[objc_class actionProgressWeight](a3, "actionProgressWeight");
  objc_msgSend(v9, "addObject:", v14);
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v17;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Registering action: %{public}@", buf, 0xCu);

  }
}

- (void)resetBackgroundActionClass:(Class)a3 onCondition:(BOOL)a4
{
  void *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  __int128 *v15;
  void *v16;
  void *v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[PLModelMigration pathManager](self, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v7 = +[PLBackgroundModelMigration resetBackgroundActionClass:pathManager:error:](PLBackgroundModelMigration, "resetBackgroundActionClass:pathManager:error:", a3, v6, &v34);
    v8 = v34;

    -[PLModelMigration logger](self, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (!v9)
        goto LABEL_15;
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (!v12)
        goto LABEL_15;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v14;
      LODWORD(v33) = 12;
      v15 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v35, v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = v15;
      v19 = 254;
      v20 = 0;
    }
    else
    {
      if (!v9)
        goto LABEL_15;
      PLMigrationGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (!v30)
        goto LABEL_15;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      PLMigrationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
      NSStringFromClass(a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v32;
      v37 = 2114;
      v38 = v8;
      LODWORD(v33) = 22;
      v15 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v35, v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = v15;
      v19 = 256;
      v20 = 16;
    }
    objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v18, "PLModelMigration.m", v19, v20);

    if (v15 != &v39)
      free(v15);
LABEL_15:

    return;
  }
  -[PLModelMigration logger](self, "logger");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (v24)
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      NSStringFromClass(a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v26;
      LODWORD(v33) = 12;
      v27 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v35, v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigration.m", 259, 0);

      if (v27 != &v39)
        free(v27);
    }
  }
}

- (int64_t)migrateWithError:(id *)a3
{
  double Current;
  void *v6;
  uint64_t v7;
  id v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  __int128 *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  uint64_t v57;
  __int128 *v58;
  void *v59;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  int v68;
  id v69;
  __int16 v70;
  double v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  double v75;
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
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0D73300], "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v7 = -[PLModelMigration setupWithError:](self, "setupWithError:", &v67);
  v8 = v67;
  -[PLModelMigration migrationContext](self, "migrationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    if (v7 != 1)
      goto LABEL_9;
    -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[PLModelMigration migrationContext](self, "migrationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedShort:", objc_msgSend(v13, "previousStoreVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D737A8];
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v15, *MEMORY[0x1E0D737B8], *MEMORY[0x1E0D737A8]);

    -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPayloadValue:forKey:onEventWithName:", v19, *MEMORY[0x1E0D737F0], v16);

    v64 = v8;
    v7 = -[PLModelMigration migratePostProcessingWithProgressUnitCount:error:](self, "migratePostProcessingWithProgressUnitCount:error:", 100, &v64);
    v20 = v64;
    v21 = v8;
  }
  else
  {

    if (v7 != 1)
      goto LABEL_9;
    v62 = v6;
    -[PLModelMigration migrationContext](self, "migrationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "options");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v23, "mutableCopy");

    v24 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C978D0]);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0C97868]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0C97918]);

    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[PLModelMigration migrationContext](self, "migrationContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedShort:", objc_msgSend(v28, "previousStoreVersion"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0D737A8];
    objc_msgSend(v30, "setPayloadValue:forKey:onEventWithName:", v31, *MEMORY[0x1E0D737B8], *MEMORY[0x1E0D737A8]);

    -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "description");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPayloadValue:forKey:onEventWithName:", v35, *MEMORY[0x1E0D737F0], v32);

    v66 = v8;
    v7 = -[PLModelMigration migrateStagedMigrationWithAutoMigrationOptions:currentStoreVersion:error:](self, "migrateStagedMigrationWithAutoMigrationOptions:currentStoreVersion:error:", v21, v29, &v66);
    v20 = v66;

    if (v7 == 1)
    {
      v65 = v20;
      v7 = -[PLModelMigration migrateSchemaMigrationWithAutoMigrationOptions:currentStoreVersion:error:](self, "migrateSchemaMigrationWithAutoMigrationOptions:currentStoreVersion:error:", v21, v29, &v65);
      v36 = v65;

      v20 = v36;
    }

    v6 = v62;
  }

  v8 = v20;
LABEL_9:
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (v7 != 1)
  {
    -[PLModelMigration logger](self, "logger");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      PLMigrationGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);

      if (v40)
      {
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
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
        PLMigrationGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        v68 = 138412290;
        v69 = v8;
        LODWORD(v61) = 12;
        v42 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigration logger](self, "logger", &v68, v61);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logWithMessage:fromCodeLocation:type:", v42, "PLModelMigration.m", 300, 16);

        if (v42 != &v76)
          free(v42);
      }
    }
  }
  v44 = CFAbsoluteTimeGetCurrent() - Current;
  if (Current <= 0.0)
    v45 = 0.0;
  else
    v45 = v44;
  objc_msgSend(v6, "stop");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration logger](self, "logger");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    PLMigrationGetLog();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);

    if (v50)
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
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
      PLMigrationGetLog();
      v51 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
      PLStringFromModelMigrationActionResultShort(v7);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v6;
      objc_msgSend(v6, "perfCheckLogStringWithPerfCheckInfo:", v46);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLModelMigration progress](self, "progress");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (double)objc_msgSend(v54, "completedUnitCount") * 100.0;
      -[PLModelMigration progress](self, "progress");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "totalUnitCount");
      v68 = 138544130;
      v69 = v52;
      v70 = 2048;
      v71 = v45;
      v72 = 2114;
      v73 = v53;
      v74 = 2048;
      v75 = v55 / (double)v57;
      LODWORD(v61) = 42;
      v58 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v68, v61);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "logWithMessage:fromCodeLocation:type:", v58, "PLModelMigration.m", 305, 0);

      if (v58 != &v76)
        free(v58);
      v6 = v63;
    }
  }

  return v7;
}

- (int64_t)setupWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  __int128 *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  _BOOL4 allowRebuild;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  int v23;
  int v24;
  __int128 *v25;
  void *v26;
  void *v27;
  __int128 *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  int v38;
  __int128 *v39;
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
  int64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  _BOOL4 v58;
  NSObject *v59;
  __int128 *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  _BOOL4 v68;
  NSObject *v69;
  __int128 *v70;
  void *v71;
  NSObject *v72;
  _BOOL4 v73;
  NSObject *v74;
  void *v75;
  int v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id *v90;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  int v95;
  int v96;
  __int16 v97;
  int v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  -[PLModelMigration logger](self, "logger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

    if (v8)
    {
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      -[PLModelMigration migrationContext](self, "migrationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 67109376;
      v96 = objc_msgSend(v10, "previousStoreVersion");
      v97 = 1024;
      v98 = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
      LODWORD(v84) = 14;
      v11 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v95, v84);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logWithMessage:fromCodeLocation:type:", v11, "PLModelMigration.m", 315, 1);

      if (v11 != &v99)
        free(v11);
    }
  }
  v13 = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
  -[PLModelMigration migrationContext](self, "migrationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "previousStoreVersion");

  if (v13 < v15)
  {
    allowRebuild = self->_allowRebuild;
    -[PLModelMigration logger](self, "logger");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (allowRebuild)
    {
      if (!v17)
        goto LABEL_33;
      PLMigrationGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (!v20)
        goto LABEL_33;
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      -[PLModelMigration migrationContext](self, "migrationContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "previousStoreVersion");
      v24 = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
      v95 = 67109376;
      v96 = v23;
      v97 = 1024;
      v98 = v24;
      LODWORD(v84) = 14;
      v25 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v95, v84);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = v25;
      v29 = 322;
    }
    else
    {
      if (!v17)
        goto LABEL_33;
      PLMigrationGetLog();
      v72 = objc_claimAutoreleasedReturnValue();
      v73 = os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);

      if (!v73)
        goto LABEL_33;
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      PLMigrationGetLog();
      v74 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
      -[PLModelMigration migrationContext](self, "migrationContext");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "previousStoreVersion");
      v77 = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
      v95 = 67109376;
      v96 = v76;
      v97 = 1024;
      v98 = v77;
      LODWORD(v84) = 14;
      v25 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v95, v84);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = v25;
      v29 = 324;
    }
    objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigration.m", v29, 16);

    if (v25 != &v99)
      free(v25);
LABEL_33:
    if (a3)
    {
      v86 = (void *)MEMORY[0x1E0CB35C8];
      v88 = *MEMORY[0x1E0D74498];
      v93[0] = *MEMORY[0x1E0CB2AA0];
      -[PLModelMigration migrationContext](self, "migrationContext");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "storeURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v90 = a3;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v42;
      v93[1] = *MEMORY[0x1E0CB3308];
      -[PLModelMigration migrationContext](self, "migrationContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "storeURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLByDeletingLastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "URLByDeletingLastPathComponent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v46;
      v93[2] = *MEMORY[0x1E0CB2938];
      v78 = (void *)MEMORY[0x1E0CB3940];
      -[PLModelMigration migrationContext](self, "migrationContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "stringWithFormat:", CFSTR("Database schema version %d is newer than the current schema version %d. A newer version of Photos needs to be installed."), objc_msgSend(v48, "previousStoreVersion"), +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v94[2] = v49;
      v50 = 3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v86;
      v53 = v88;
      v54 = 46006;
      goto LABEL_35;
    }
    return 3;
  }
  -[PLModelMigration migrationContext](self, "migrationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "previousStoreVersion") >> 1;

  if (v31 <= 0xBBA)
  {
    -[PLModelMigration logger](self, "logger");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      PLMigrationGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

      if (v35)
      {
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        PLMigrationGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
        -[PLModelMigration migrationContext](self, "migrationContext");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "previousStoreVersion");
        v95 = 67109376;
        v96 = v38;
        v97 = 1024;
        v98 = 6006;
        LODWORD(v84) = 14;
        v39 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigration logger](self, "logger", &v95, v84);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigration.m", 331, 16);

        if (v39 != &v99)
          free(v39);
      }
    }
    if (a3)
    {
      v85 = (void *)MEMORY[0x1E0CB35C8];
      v87 = *MEMORY[0x1E0D74498];
      v91[0] = *MEMORY[0x1E0CB2AA0];
      -[PLModelMigration migrationContext](self, "migrationContext");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "storeURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v90 = a3;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = v42;
      v91[1] = *MEMORY[0x1E0CB3308];
      -[PLModelMigration migrationContext](self, "migrationContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "storeURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLByDeletingLastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "URLByDeletingLastPathComponent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v46;
      v91[2] = *MEMORY[0x1E0CB2D50];
      v47 = (void *)MEMORY[0x1E0CB3940];
      -[PLModelMigration migrationContext](self, "migrationContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("Store version %d is unsupported for migration (older than %d)."), objc_msgSend(v48, "previousStoreVersion"), 6006);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v49;
      v50 = 3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v85;
      v53 = v87;
      v54 = 46011;
LABEL_35:
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", v53, v54, v51);
      *v90 = (id)objc_claimAutoreleasedReturnValue();

      return v50;
    }
    return 3;
  }
  if (!self->_allowRebuild)
  {
    -[PLModelMigration migrationContext](self, "migrationContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v79, "policy") & 4) == 0)
    {

      return 1;
    }
    v80 = (void *)MEMORY[0x1E0D73280];
    -[PLModelMigration pathManager](self, "pathManager");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "libraryURL");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v80) = objc_msgSend(v80, "isSystemPhotoLibraryURL:", v82);

    if (!(_DWORD)v80)
      return 1;
  }
  if (self->_didCreateSqliteErrorIndicator)
    return 1;
  -[PLModelMigration logger](self, "logger");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    PLMigrationGetLog();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);

    if (v58)
    {
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      PLMigrationGetLog();
      v59 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      LOWORD(v95) = 0;
      LODWORD(v84) = 2;
      v60 = (__int128 *)_os_log_send_and_compose_impl();

      -[PLModelMigration logger](self, "logger", &v95, v84);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "logWithMessage:fromCodeLocation:type:", v60, "PLModelMigration.m", 339, 0);

      if (v60 != &v99)
        free(v60);
    }
  }
  v50 = 1;
  self->_didCreateSqliteErrorIndicator = 1;
  -[PLModelMigration pathManager](self, "pathManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setSqliteErrorForRebuildReason:allowsExit:", 4, 0);

  -[PLModelMigration pathManager](self, "pathManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "sqliteErrorIndicatorFileExists");

  if ((v64 & 1) == 0)
  {
    -[PLModelMigration logger](self, "logger");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      v66 = (void *)v65;
      PLMigrationGetLog();
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);

      if (v68)
      {
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        PLMigrationGetLog();
        v69 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v69, OS_LOG_TYPE_ERROR);
        LOWORD(v95) = 0;
        LODWORD(v84) = 2;
        v70 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigration logger](self, "logger", &v95, v84);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "logWithMessage:fromCodeLocation:type:", v70, "PLModelMigration.m", 344, 16);

        if (v70 != &v99)
          free(v70);
      }
    }
    return 3;
  }
  return v50;
}

- (int64_t)migrateStagedMigrationWithAutoMigrationOptions:(id)a3 currentStoreVersion:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  int v48;
  NSMutableArray *v49;
  NSMutableArray *actionsStaged;
  void *v51;
  NSMutableArray *v52;
  int64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  __int128 *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  _BOOL4 v75;
  NSObject *v76;
  __int128 *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  uint64_t v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  const __CFString *v108;
  int v109;
  id v110;
  __int16 v111;
  id v112;
  __int16 v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLModelMigration migrationContext](self, "migrationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedShort:", objc_msgSend(v10, "previousStoreVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration _nextRequiredStagedMigrationVersionAfterVersion:](self, "_nextRequiredStagedMigrationVersionAfterVersion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB38A8];
  v14 = &unk_1E3763D40;
  objc_msgSend(v13, "discreteProgressWithTotalUnitCount:", 5 * objc_msgSend(&unk_1E3763D40, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  self->_hadStagedMigration = v12 != 0;
  if (v12)
  {
    v85 = a5;
    -[PLModelMigration progress](self, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v15;
    objc_msgSend(v16, "addChild:withPendingUnitCount:", v15, 10);

    v17 = 0;
    v89 = *MEMORY[0x1E0D737D8];
    v92 = *MEMORY[0x1E0D737A8];
    v94 = *MEMORY[0x1E0D74498];
    v93 = *MEMORY[0x1E0CB2D68];
    v88 = *MEMORY[0x1E0D737E0];
    v86 = *MEMORY[0x1E0CB3388];
    while (1)
    {
      v102 = v17;
      v18 = -[PLModelMigration isMigrationCancelledWithError:](self, "isMigrationCancelledWithError:", &v102);
      v19 = v102;

      if (v18)
      {
        v53 = 2;
        goto LABEL_35;
      }
      v20 = (void *)MEMORY[0x19AEC1554]();
      -[PLModelMigration _stagedManagedObjectModelURLWithStageVersion:](self, "_stagedManagedObjectModelURLWithStageVersion:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLModelMigration logger](self, "logger");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (v25)
        {
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          PLMigrationGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v21, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 138543874;
          v110 = v8;
          v111 = 2114;
          v112 = v12;
          v113 = 2112;
          v114 = v27;
          LODWORD(v84) = 32;
          v28 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigration logger](self, "logger", &v109, v84);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigration.m", 375, 0);

          if (v28 != &v115)
            free(v28);
        }
      }
      -[PLModelMigration _managedObjectModelForLightweightMigrationStageWithURL:](self, "_managedObjectModelForLightweightMigrationStageWithURL:", v21);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v21;
      if (v30)
      {
        v97 = v20;
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v30);
        -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "startRecordingTimedEventToken");
        v34 = v33;

        -[PLModelMigration migrationUUID](self, "migrationUUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLModelMigration migrationContext](self, "migrationContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "storeURL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v8, "intValue");
        v39 = objc_msgSend(v12, "intValue");
        v101 = v19;
        LODWORD(v83) = v39;
        v96 = (void *)v31;
        -[PLModelMigration addStoreWithCoordinator:migrationUUID:storeURL:options:description:fromVersion:toVersion:progress:progressUnitCount:error:](self, "addStoreWithCoordinator:migrationUUID:storeURL:options:description:fromVersion:toVersion:progress:progressUnitCount:error:", v31, v35, v37, v95, CFSTR("Adding staged migration store"), v38, v83, v91, 1, &v101);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v101;

        v98 = v8;
        if (v40)
        {
          -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addRecordingTimedEventSnippetWithToken:forKey:onEventWithName:", v89, v92, v34);

          -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "startRecordingTimedEventToken");
          v45 = v44;

          -[PLModelMigration legacyMigrationDelegate](self, "legacyMigrationDelegate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLModelMigration migrationUUID](self, "migrationUUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v46, "processWelterweightMigrationStageOnStore:migrationUUID:fromVersion:toVersion:migrationContext:progress:progressUnitCount:", v40, v47, objc_msgSend(v8, "intValue"), objc_msgSend(v12, "intValue"), v90, v91, 2);

          if (v48)
          {
            v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            actionsStaged = self->_actionsStaged;
            self->_actionsStaged = v49;

            PLModelMigrationActionRegistration_Staged(self, (unsigned __int16)objc_msgSend(v8, "intValue"), (unsigned __int16)objc_msgSend(v12, "intValue"));
            -[PLModelMigration migrationContext](self, "migrationContext");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setStore:", v40);

            v52 = self->_actionsStaged;
            v100 = v41;
            v53 = -[PLModelMigration migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:](self, "migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:", v52, 4, v91, 2, &v100);
            v17 = v100;
          }
          else
          {
            v79 = (void *)MEMORY[0x1E0CB35C8];
            v107 = v93;
            v108 = CFSTR("Legacy Staged migration failed");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
            v80 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "errorWithDomain:code:userInfo:", v94, 46013, v80);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            v41 = (id)v80;
            v53 = 3;
          }

          -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addRecordingTimedEventSnippetWithToken:forKey:onEventWithName:", v88, v92, v45);
          v56 = v96;
        }
        else
        {
          v67 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v99, "path");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "stringWithFormat:", CFSTR("Failed to open store for staged migration from version %@ to %@, with model %@"), v8, v12, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          v105 = v93;
          v106 = v69;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (void *)objc_msgSend(v70, "mutableCopy");

          if (v41)
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v41, v86);
          v87 = v71;
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v94, 46013, v71);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          -[PLModelMigration logger](self, "logger");
          v72 = objc_claimAutoreleasedReturnValue();
          v56 = v96;
          if (v72)
          {
            v73 = (void *)v72;
            PLMigrationGetLog();
            v74 = objc_claimAutoreleasedReturnValue();
            v75 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);

            if (v75)
            {
              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              v141 = 0u;
              v142 = 0u;
              v139 = 0u;
              v140 = 0u;
              v137 = 0u;
              v138 = 0u;
              v135 = 0u;
              v136 = 0u;
              v133 = 0u;
              v134 = 0u;
              v131 = 0u;
              v132 = 0u;
              v129 = 0u;
              v130 = 0u;
              v127 = 0u;
              v128 = 0u;
              v125 = 0u;
              v126 = 0u;
              v123 = 0u;
              v124 = 0u;
              v121 = 0u;
              v122 = 0u;
              v119 = 0u;
              v120 = 0u;
              v117 = 0u;
              v118 = 0u;
              v115 = 0u;
              v116 = 0u;
              PLMigrationGetLog();
              v76 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);
              v109 = 138543618;
              v110 = v69;
              v111 = 2114;
              v112 = v17;
              LODWORD(v84) = 22;
              v77 = (__int128 *)_os_log_send_and_compose_impl();

              -[PLModelMigration logger](self, "logger", &v109, v84);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "logWithMessage:fromCodeLocation:type:", v77, "PLModelMigration.m", 414, 16);

              if (v77 != &v115)
                free(v77);
            }
          }

          v53 = 3;
        }

        v20 = v97;
        v8 = v98;
      }
      else
      {
        v54 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v21, "path");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("Failed to open model for staged migration from version %@ to %@, with model path %@"), v8, v12, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = (void *)MEMORY[0x1E0CB35C8];
        v103 = v93;
        v104 = v56;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "errorWithDomain:code:userInfo:", v94, 46013, v58);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        -[PLModelMigration logger](self, "logger");
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          v60 = (void *)v59;
          v61 = v20;
          PLMigrationGetLog();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);

          if (v63)
          {
            v145 = 0u;
            v146 = 0u;
            v143 = 0u;
            v144 = 0u;
            v141 = 0u;
            v142 = 0u;
            v139 = 0u;
            v140 = 0u;
            v137 = 0u;
            v138 = 0u;
            v135 = 0u;
            v136 = 0u;
            v133 = 0u;
            v134 = 0u;
            v131 = 0u;
            v132 = 0u;
            v129 = 0u;
            v130 = 0u;
            v127 = 0u;
            v128 = 0u;
            v125 = 0u;
            v126 = 0u;
            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            v119 = 0u;
            v120 = 0u;
            v117 = 0u;
            v118 = 0u;
            v115 = 0u;
            v116 = 0u;
            PLMigrationGetLog();
            v64 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
            v109 = 138543362;
            v110 = v56;
            LODWORD(v84) = 12;
            v65 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigration logger](self, "logger", &v109, v84);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "logWithMessage:fromCodeLocation:type:", v65, "PLModelMigration.m", 420, 16);

            if (v65 != &v115)
              free(v65);
            v53 = 3;
            v20 = v61;
          }
          else
          {
            v53 = 3;
            v20 = v61;
          }
        }
        else
        {
          v53 = 3;
        }
      }

      objc_autoreleasePoolPop(v20);
      if (v53 != 1)
        break;
      v81 = v12;

      -[PLModelMigration _nextRequiredStagedMigrationVersionAfterVersion:](self, "_nextRequiredStagedMigrationVersionAfterVersion:", v81);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v81;
      if (!v12)
      {
        v8 = v81;
        v19 = v17;
        v53 = 1;
        goto LABEL_35;
      }
    }
    v19 = v17;
LABEL_35:
    a5 = v85;
    v15 = v91;
  }
  else
  {
    v19 = 0;
    v53 = 1;
  }
  objc_msgSend(v15, "setCompletedUnitCount:", objc_msgSend(v15, "totalUnitCount"));
  if (a5)
    *a5 = objc_retainAutorelease(v19);

  return v53;
}

- (int64_t)migrateSchemaMigrationWithAutoMigrationOptions:(id)a3 currentStoreVersion:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int64_t v43;
  id v44;
  id *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  _BOOL4 v52;
  NSObject *v53;
  __int128 *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  _BOOL4 v64;
  NSObject *v65;
  int v66;
  __int128 *v67;
  void *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  int v81;
  id v82;
  __int16 v83;
  _QWORD v84[2];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  -[PLModelMigration migrationContext](self, "migrationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedShort:", objc_msgSend(v10, "previousStoreVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v7);

  if ((v12 & 1) == 0)
  {
    -[PLModelMigration logger](self, "logger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

      if (v16)
      {
        v17 = v7;
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        v19 = (void *)MEMORY[0x1E0CB37E8];
        -[PLModelMigration migrationContext](self, "migrationContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "numberWithUnsignedShort:", objc_msgSend(v20, "previousStoreVersion"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 138543618;
        v82 = v21;
        v83 = 1024;
        LODWORD(v84[0]) = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
        LODWORD(v71) = 18;
        v22 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigration logger](self, "logger", &v81, v71);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigration.m", 442, 1);

        if (v22 != &v85)
          free(v22);
        v7 = v17;
      }
    }
  }
  v74 = v7;
  -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "startRecordingTimedEventToken");
  v26 = v25;

  -[PLModelMigration migrationContext](self, "migrationContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "coordinator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration migrationUUID](self, "migrationUUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration migrationContext](self, "migrationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "storeURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v7, "intValue");
  v33 = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
  -[PLModelMigration progress](self, "progress");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  LODWORD(v70) = v33;
  -[PLModelMigration addStoreWithCoordinator:migrationUUID:storeURL:options:description:fromVersion:toVersion:progress:progressUnitCount:error:](self, "addStoreWithCoordinator:migrationUUID:storeURL:options:description:fromVersion:toVersion:progress:progressUnitCount:error:", v28, v29, v31, v9, CFSTR("Adding lightweight migration store"), v32, v70, v34, 10, &v78);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v78;
  -[PLModelMigration migrationContext](self, "migrationContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setStore:", v35);

  -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addRecordingTimedEventSnippetWithToken:forKey:onEventWithName:", *MEMORY[0x1E0D737D8], *MEMORY[0x1E0D737A8], v26);

  -[PLModelMigration migrationContext](self, "migrationContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "store");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = v74;
    if (self->_hadStagedMigration)
      v42 = 80;
    else
      v42 = 90;
    v77 = v36;
    v43 = -[PLModelMigration migratePostProcessingWithProgressUnitCount:error:](self, "migratePostProcessingWithProgressUnitCount:error:", v42, &v77);
    v44 = v77;

    if (v43 == 1)
    {
      v45 = a5;
      if (!a5)
        goto LABEL_28;
      goto LABEL_27;
    }
    -[PLModelMigration migrationContext](self, "migrationContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "coordinator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration migrationContext](self, "migrationContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "store");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    v60 = objc_msgSend(v57, "removePersistentStore:error:", v59, &v76);
    v46 = v76;

    if ((v60 & 1) == 0)
    {
      -[PLModelMigration logger](self, "logger");
      v61 = objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        v62 = (void *)v61;
        PLMigrationGetLog();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

        if (v64)
        {
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          PLMigrationGetLog();
          v65 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
          v66 = +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion");
          v81 = 138543874;
          v82 = v74;
          v83 = 1024;
          LODWORD(v84[0]) = v66;
          WORD2(v84[0]) = 2114;
          *(_QWORD *)((char *)v84 + 6) = v46;
          LODWORD(v72) = 28;
          v67 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigration logger](self, "logger", &v81, v72);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "logWithMessage:fromCodeLocation:type:", v67, "PLModelMigration.m", 452, 16);

          if (v67 != &v85)
            free(v67);
        }
      }
    }
  }
  else
  {
    v41 = v74;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open and lightweight migrate store from schema version based on %@ to %d"), v74, +[PLModelMigration currentModelVersion](PLModelMigration, "currentModelVersion"));
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v79 = *MEMORY[0x1E0CB2D68];
    v80 = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "mutableCopy");

    if (v36)
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46008, v48);
    v44 = (id)objc_claimAutoreleasedReturnValue();

    -[PLModelMigration logger](self, "logger");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = (void *)v49;
      PLMigrationGetLog();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

      if (v52)
      {
        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        PLMigrationGetLog();
        v53 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);
        v81 = 138543618;
        v82 = v46;
        v83 = 2114;
        v84[0] = v44;
        LODWORD(v73) = 22;
        v54 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigration logger](self, "logger", &v81, v73);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "logWithMessage:fromCodeLocation:type:", v54, "PLModelMigration.m", 463, 16);

        if (v54 != &v85)
          free(v54);
      }
    }

    v43 = 3;
  }
  v45 = a5;

  if (a5)
LABEL_27:
    *v45 = objc_retainAutorelease(v44);
LABEL_28:

  return v43;
}

- (int64_t)migratePostProcessingWithProgressUnitCount:(unint64_t)a3 error:(id *)a4
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableArray *actionsPreRepair;
  unint64_t actionProgressPortionPreRepair;
  int64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSMutableArray *actions;
  unint64_t actionProgressPortion;
  id v23;
  NSMutableArray *actionsPostRepair;
  unint64_t actionProgressPortionPostRepair;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[PLModelMigration actionRegistration](self, "actionRegistration");
  v7 = self->_actionProgressPortionPreRepair + self->_actionProgressPortion + self->_actionProgressPortionPostRepair;
  v8 = (uint64_t)((double)v7 * 0.5);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", v7 + v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChild:withPendingUnitCount:", v9, a3);

  actionsPreRepair = self->_actionsPreRepair;
  actionProgressPortionPreRepair = self->_actionProgressPortionPreRepair;
  v32 = 0;
  v13 = -[PLModelMigration migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:](self, "migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:", actionsPreRepair, 2, v9, actionProgressPortionPreRepair, &v32);
  v14 = v32;
  if (v13 == 1)
  {
    -[PLModelMigration legacyMigrationDelegate](self, "legacyMigrationDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration migrationContext](self, "migrationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "store");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration migrationUUID](self, "migrationUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration migrationContext](self, "migrationContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "postProcessMigratedStore:migrationUUID:fromVersion:progress:progressUnitCount:", v17, v18, objc_msgSend(v19, "previousStoreVersion"), v9, v8);

    if ((v20 & 1) != 0)
    {
      actions = self->_actions;
      actionProgressPortion = self->_actionProgressPortion;
      v31 = v14;
      v13 = -[PLModelMigration migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:](self, "migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:", actions, 1, v9, actionProgressPortion, &v31);
      v23 = v31;

      if (v13 != 1)
      {
        v14 = v23;
        if (!a4)
          goto LABEL_9;
        goto LABEL_8;
      }
      actionsPostRepair = self->_actionsPostRepair;
      actionProgressPortionPostRepair = self->_actionProgressPortionPostRepair;
      v30 = v23;
      v13 = -[PLModelMigration migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:](self, "migratePostProcessingWithActions:migrationActionType:progress:progressUnitCount:error:", actionsPostRepair, 3, v9, actionProgressPortionPostRepair, &v30);
      v14 = v30;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0D74498];
      v33 = *MEMORY[0x1E0CB2D68];
      v34[0] = CFSTR("Legacy post migration failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 46008, v23);
      v28 = objc_claimAutoreleasedReturnValue();

      v13 = 3;
      v14 = (id)v28;
    }

  }
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v14);
LABEL_9:

  return v13;
}

- (int64_t)migratePostProcessingWithActions:(id)a3 migrationActionType:(int64_t)a4 progress:(id)a5 progressUnitCount:(unint64_t)a6 error:(id *)a7
{
  _BOOL4 v12;
  uint64_t v13;
  PLModelMigrationActionProcessor *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  PLModelMigrationActionProcessor *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id *v35;
  _BOOL4 v36;
  void *v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  uint64_t v43;
  _BYTE *v44;
  void *v45;
  int64_t v46;
  void *v48;
  uint64_t v49;
  id v50;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  PLModelMigration *v56;
  id v57;
  _QWORD v58[6];
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id obj;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  int v78;
  void *v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[512];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v50 = a5;
  if (a4 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigration.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != PLMigrationActionTypeBackground"));

  }
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__49479;
  v76 = __Block_byref_object_dispose__49480;
  v77 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  obj = 0;
  v56 = self;
  v12 = -[PLModelMigration isMigrationCancelledWithError:](self, "isMigrationCancelledWithError:", &obj);
  objc_storeStrong(&v77, obj);
  v13 = 1;
  if (v12)
    v13 = 2;
  v71 = v13;
  if (objc_msgSend(v52, "count") && v69[3] == 1)
  {
    v14 = [PLModelMigrationActionProcessor alloc];
    -[PLModelMigration migrationUUID](self, "migrationUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration pathManager](self, "pathManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration logger](self, "logger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 4)
      v19 = 0;
    else
      v19 = a6;
    v20 = -[PLModelMigrationActionProcessor initWithUUID:pathManager:migrationActionType:analyticsEventManager:logger:progressUnitCount:](v14, "initWithUUID:pathManager:migrationActionType:analyticsEventManager:logger:progressUnitCount:", v15, v16, a4, v17, v18, v19);

    -[PLModelMigrationActionProcessor setIgnoreProgressUpdates:](v20, "setIgnoreProgressUpdates:", 1);
    -[PLModelMigrationActionProcessor progress](v20, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[PLModelMigrationActionProcessor progress](v20, "progress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addChild:withPendingUnitCount:", v22, a6);

    }
    -[PLModelMigration migrationContext](self, "migrationContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "store");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "persistentStoreCoordinator");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v64 = 0u;
    v65 = 0u;
    v63 = 0u;
    v53 = v52;
    v25 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
    if (v25)
    {
      v54 = *(_QWORD *)v64;
LABEL_14:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v64 != v54)
          objc_enumerationMutation(v53);
        v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v26);
        v28 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v27, "progress");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLModelMigrationActionProcessor progress](v20, "progress");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addChild:withPendingUnitCount:", v29, objc_msgSend((id)objc_opt_class(), "actionProgressWeight"));

        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "actionDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __106__PLModelMigration_migratePostProcessingWithActions_migrationActionType_progress_progressUnitCount_error___block_invoke;
        v58[3] = &unk_1E366B590;
        v61 = &v68;
        v58[4] = v56;
        v58[5] = v27;
        v59 = v55;
        v62 = &v72;
        v34 = v29;
        v60 = v34;
        -[PLModelMigrationActionProcessor performActionWithName:ifRequired:block:](v20, "performActionWithName:ifRequired:block:", v33, 1, v58);

        if (-[PLModelMigrationActionProcessor isSuccess](v20, "isSuccess"))
        {
          v35 = (id *)(v73 + 5);
          v57 = (id)v73[5];
          v36 = -[PLModelMigration isMigrationCancelledWithError:](v56, "isMigrationCancelledWithError:", &v57);
          objc_storeStrong(v35, v57);
          if (v36)
          {
            LODWORD(v37) = 0;
            v69[3] = 2;
          }
          else
          {
            LODWORD(v37) = 1;
          }
        }
        else
        {
          -[PLModelMigration logger](v56, "logger");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            PLMigrationGetLog();
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);

            if (v39)
            {
              memset(v82, 0, sizeof(v82));
              PLMigrationGetLog();
              v40 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
              v41 = (objc_class *)objc_opt_class();
              NSStringFromClass(v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v73[5];
              v78 = 138543618;
              v79 = v42;
              v80 = 2114;
              v81 = v43;
              LODWORD(v49) = 22;
              v44 = (_BYTE *)_os_log_send_and_compose_impl();

              -[PLModelMigration logger](v56, "logger", &v78, v49);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "logWithMessage:fromCodeLocation:type:", v44, "PLModelMigration.m", 550, 16);

              if (v44 != v82)
                free(v44);
            }
            LODWORD(v37) = 0;
          }
        }

        objc_autoreleasePoolPop(v28);
        if (!(_DWORD)v37)
          break;
        if (v25 == ++v26)
        {
          v25 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
          if (v25)
            goto LABEL_14;
          break;
        }
      }
    }

  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v73[5]);
  v46 = v69[3];
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v46;
}

- (id)addStoreWithCoordinator:(id)a3 migrationUUID:(id)a4 storeURL:(id)a5 options:(id)a6 description:(id)a7 fromVersion:(int)a8 toVersion:(int)a9 progress:(id)a10 progressUnitCount:(unint64_t)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  PLModelMigrationActionProcessor *v20;
  void *v21;
  void *v22;
  void *v23;
  PLModelMigrationActionProcessor *v24;
  void *v25;
  PLModelMigrationActionProcessor *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint64_t v31;
  _BYTE *v32;
  void *v33;
  id v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  PLModelMigrationActionProcessor *v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  id obj;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _DWORD v62[2];
  __int16 v63;
  int v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[512];
  uint64_t v68;

  v38 = *(_QWORD *)&a8;
  v68 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v41 = a4;
  v40 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__49479;
  v60 = __Block_byref_object_dispose__49480;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__49479;
  v54 = __Block_byref_object_dispose__49480;
  v55 = 0;
  obj = 0;
  LOBYTE(a7) = -[PLModelMigration isMigrationCancelledWithError:](self, "isMigrationCancelledWithError:", &obj);
  objc_storeStrong(&v55, obj);
  if ((a7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (version: %d -> %d)"), v18, v38, a9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [PLModelMigrationActionProcessor alloc];
    -[PLModelMigration pathManager](self, "pathManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration analyticsEventManager](self, "analyticsEventManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigration logger](self, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PLModelMigrationActionProcessor initWithUUID:pathManager:migrationActionType:analyticsEventManager:logger:progressUnitCount:](v20, "initWithUUID:pathManager:migrationActionType:analyticsEventManager:logger:progressUnitCount:", v41, v21, 0, v22, v23, 1);

    -[PLModelMigrationActionProcessor setIgnoreProgressUpdates:](v24, "setIgnoreProgressUpdates:", 1);
    -[PLModelMigrationActionProcessor progress](v24, "progress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addChild:withPendingUnitCount:", v25, a11);

    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __142__PLModelMigration_addStoreWithCoordinator_migrationUUID_storeURL_options_description_fromVersion_toVersion_progress_progressUnitCount_error___block_invoke;
    v42[3] = &unk_1E366B590;
    v26 = v24;
    v43 = v26;
    v47 = &v56;
    v44 = v39;
    v45 = v40;
    v46 = v17;
    v48 = &v50;
    -[PLModelMigrationActionProcessor performActionWithName:ifRequired:block:](v26, "performActionWithName:ifRequired:block:", v37, 1, v42);
    if (!-[PLModelMigrationActionProcessor isSuccess](v26, "isSuccess"))
    {
      -[PLModelMigration logger](self, "logger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        PLMigrationGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

        if (v29)
        {
          memset(v67, 0, sizeof(v67));
          PLMigrationGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
          v31 = v51[5];
          v62[0] = 67109634;
          v62[1] = v38;
          v63 = 1024;
          v64 = a9;
          v65 = 2112;
          v66 = v31;
          LODWORD(v36) = 24;
          v32 = (_BYTE *)_os_log_send_and_compose_impl();

          -[PLModelMigration logger](self, "logger", v62, v36);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigration.m", 582, 16);

          if (v32 != v67)
            free(v32);
        }
      }
    }

  }
  if (a12)
    *a12 = objc_retainAutorelease((id)v51[5]);
  v34 = (id)v57[5];
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v34;
}

- (id)_nextRequiredStagedMigrationVersionAfterVersion:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a3, "integerValue");
  v4 = &unk_1E3763D40;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = &unk_1E3763D40;
  v6 = objc_msgSend(&unk_1E3763D40, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(&unk_1E3763D40);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v3 < (int)objc_msgSend(v10, "intValue", (_QWORD)v13))
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(&unk_1E3763D40, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_managedObjectModelForLightweightMigrationStageWithURL:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setManagedObjectClassName:", 0, (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_stagedManagedObjectModelURLWithStageVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos-%d-STAGED"), objc_msgSend(a3, "intValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("omo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", v3, CFSTR("mom"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)runMigrationAction:(id)a3 withCoordinator:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__49479;
  v29 = __Block_byref_object_dispose__49480;
  v30 = 0;
  v10 = (void *)MEMORY[0x19AEC1554]();
  pl_dispatch_once();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration pathManager](self, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigration graphCache](self, "graphCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLManagedObjectContextForMigrationActionWithCoordinator(v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLEnumerateAndSaveController disableConcurrencyLimiterForContext:](PLEnumerateAndSaveController, "disableConcurrencyLimiterForContext:", v15);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__PLModelMigration_runMigrationAction_withCoordinator_error___block_invoke;
  v20[3] = &unk_1E3676348;
  v23 = &v31;
  v16 = v8;
  v21 = v16;
  v17 = v15;
  v22 = v17;
  v24 = &v25;
  objc_msgSend(v17, "performBlockAndWait:", v20);

  objc_autoreleasePoolPop(v10);
  if (a5)
    *a5 = objc_retainAutorelease((id)v26[5]);
  v18 = v32[3];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v18;
}

- (BOOL)isMigrationCancelledWithError:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PLModelMigration progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("Migration was cancelled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 46008, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = 0;
  if (a3)
LABEL_5:
    *a3 = objc_retainAutorelease(v9);
LABEL_6:

  return v5;
}

- (BOOL)allowRebuild
{
  return self->_allowRebuild;
}

- (BOOL)didCreateSqliteErrorIndicator
{
  return self->_didCreateSqliteErrorIndicator;
}

- (id)legacyMigrationDelegate
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setLegacyMigrationDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_legacyMigrationDelegate, 0);
  objc_storeStrong((id *)&self->_internalMigrationContext, 0);
  objc_storeStrong((id *)&self->_actionsPostRepair, 0);
  objc_storeStrong((id *)&self->_actionsPreRepair, 0);
  objc_storeStrong((id *)&self->_actionsStaged, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

uint64_t __61__PLModelMigration_runMigrationAction_withCoordinator_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "performActionWithManagedObjectContext:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  return objc_msgSend((id)a1[5], "reset");
}

BOOL __142__PLModelMigration_addStoreWithCoordinator_migrationUUID_storeURL_options_description_fromVersion_toVersion_progress_progressUnitCount_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeCurrentWithPendingUnitCount:", 1);

  v3 = *MEMORY[0x1E0C979E8];
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v4, "addPersistentStoreWithType:configuration:URL:options:error:", v3, 0, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resignCurrent");

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
}

BOOL __106__PLModelMigration_migratePostProcessingWithActions_migrationActionType_progress_progressUnitCount_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  id v14;
  uint64_t v15;
  _QWORD v16[73];

  v16[72] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v14 = 0;
  v5 = objc_msgSend(v2, "runMigrationAction:withCoordinator:error:", v3, v4, &v14);
  v6 = v14;
  v7 = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v5;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 1
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    if (v6)
    {
      v15 = *MEMORY[0x1E0CB3388];
      v16[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46008, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount"));
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 1;

  return v12;
}

void __52__PLModelMigration_initWithMigrationContext_logger___block_invoke(uint64_t a1)
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
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigration.m", 153, 0);

      if (v7 != v13)
        free(v7);
    }
  }
  else
  {

  }
}

@end
