@implementation PLModelMigrationActionBackground

- (PLModelMigrationActionBackground)initWithMigrationContext:(id)a3 logger:(id)a4 progress:(id)a5 continuationHandler:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PLModelMigrationActionBackground *v16;
  PLModelMigrationActionBackground *v17;
  uint64_t v18;
  id continuationHandler;
  void *v20;
  uint64_t v21;
  NSString *resumeMarkerKeyPath;
  id v23;
  id v24;
  uint64_t v25;
  PLLazyObject *lazyAppPrivateData;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationAction.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationAction.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("migrationContext"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationAction.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("continuationHandler"));

LABEL_4:
  v34.receiver = self;
  v34.super_class = (Class)PLModelMigrationActionBackground;
  v16 = -[PLModelMigrationActionBackground init](&v34, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_logger, a4);
    objc_storeStrong((id *)&v17->_progress, a5);
    v18 = MEMORY[0x19AEC174C](v15);
    continuationHandler = v17->_continuationHandler;
    v17->_continuationHandler = (id)v18;

    v20 = (void *)objc_opt_class();
    objc_msgSend(v20, "_resumeMakerKeyPathForActionClass:", objc_opt_class());
    v21 = objc_claimAutoreleasedReturnValue();
    resumeMarkerKeyPath = v17->_resumeMarkerKeyPath;
    v17->_resumeMarkerKeyPath = (NSString *)v21;

    v23 = objc_initWeak(&location, v17);
    v24 = objc_alloc(MEMORY[0x1E0D73248]);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __97__PLModelMigrationActionBackground_initWithMigrationContext_logger_progress_continuationHandler___block_invoke;
    v31[3] = &unk_1E36759D8;
    objc_copyWeak(&v32, &location);
    v25 = objc_msgSend(v24, "initWithBlock:", v31);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    lazyAppPrivateData = v17->_lazyAppPrivateData;
    v17->_lazyAppPrivateData = (PLLazyObject *)v25;

    objc_storeStrong((id *)&v17->_migrationContext, a3);
    -[PLModelMigrationActionBackground setup](v17, "setup");
  }

  return v17;
}

- (id)appPrivateData
{
  return (id)-[PLLazyObject objectValue](self->_lazyAppPrivateData, "objectValue");
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)-[PLModelMigrationContext pathManager](self->_migrationContext, "pathManager");
}

- (PLModelMigrationHistory)migrationHistory
{
  return (PLModelMigrationHistory *)-[PLModelMigrationContext modelMigrationHistory](self->_migrationContext, "modelMigrationHistory");
}

- (void)setResumeMarkerValue:(id)a3
{
  id v4;
  void *v5;
  NSString *resumeMarkerKeyPath;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _OWORD *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  id v19;
  _OWORD v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLModelMigrationActionBackground appPrivateData](self, "appPrivateData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  resumeMarkerKeyPath = self->_resumeMarkerKeyPath;
  v17 = 0;
  v7 = objc_msgSend(v5, "setValue:forKeyPath:error:", v4, resumeMarkerKeyPath, &v17);

  v8 = v17;
  if ((v7 & 1) == 0)
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (v12)
      {
        memset(v20, 0, sizeof(v20));
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        v18 = 138412290;
        v19 = v8;
        LODWORD(v16) = 12;
        v14 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v18, v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logWithMessage:fromCodeLocation:type:", v14, "PLModelMigrationAction.m", 351, 16);

        if (v14 != v20)
          free(v14);
      }
    }
  }

}

- (id)resumeMarker
{
  void *v3;
  void *v4;

  -[PLModelMigrationActionBackground appPrivateData](self, "appPrivateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", self->_resumeMarkerKeyPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cancellableDiscreteProgressWithTotalUnitCount:(int64_t)a3 pendingParentUnitCount:(int64_t)a4
{
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__PLModelMigrationActionBackground_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke;
  v14[3] = &unk_1E3671200;
  v15 = v8;
  v11 = v8;
  PLCancellableDiscreteProgress(v9, v10, a3, a4, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)finalizeProgress
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PLModelMigrationActionBackground progress](self, "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "totalUnitCount");
  -[PLModelMigrationActionBackground progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedUnitCount:", v3);

}

- (BOOL)isCancelled
{
  void *v3;
  uint64_t (**v4)(void);
  char v5;
  void *v6;
  void *v7;
  char v8;

  -[PLModelMigrationActionBackground continuationHandler](self, "continuationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLModelMigrationActionBackground continuationHandler](self, "continuationHandler");
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v5 = v4[2]();

    if ((v5 & 1) == 0)
    {
      -[PLModelMigrationActionBackground progress](self, "progress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancel");

    }
  }
  -[PLModelMigrationActionBackground progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCancelled");

  return v8;
}

- (BOOL)isCancelledWithResumeMarker:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PLModelMigrationActionBackground isCancelled](self, "isCancelled");
  if (v7)
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D74498];
      v15 = *MEMORY[0x1E0CB2D68];
      v16[0] = CFSTR("Migration was cancelled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 46014, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v6)
    {
      v11 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "URIRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v13;
      }
      -[PLModelMigrationActionBackground setResumeMarkerValue:](self, "setResumeMarkerValue:", v11);

    }
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLModelMigrationActionBackground;
  -[PLModelMigrationActionBackground description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground actionName](self, "actionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "actionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionBackground progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": [%@] description: %@, progress: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)actionName
{
  return (NSString *)CFSTR("MigrationActionBackground");
}

- (id)databaseContext
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLModelMigrationContext databaseContext](self->_migrationContext, "databaseContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (PLFileBackedLogger)logger
{
  return (PLFileBackedLogger *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)continuationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setContinuationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (PLModelMigrationContext)migrationContext
{
  return (PLModelMigrationContext *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationContext, 0);
  objc_storeStrong(&self->_continuationHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_resumeMarkerKeyPath, 0);
}

void __105__PLModelMigrationActionBackground_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _OWORD v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      memset(v12, 0, sizeof(v12));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v7;
      LODWORD(v9) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(v3, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationAction.m", 362, 16, &v10, v9);
      if (v8 != v12)
        free(v8);
    }
  }

}

id __97__PLModelMigrationActionBackground_initWithMigrationContext_logger_progress_continuationHandler___block_invoke(uint64_t a1)
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

+ (id)_resumeMakerKeyPathForActionClass:(Class)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortenedMigrationActionClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.ResumeMaker.%@"), CFSTR("MigrationAction"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)resetResumeMarkerForActionClass:(Class)a3 pathManager:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v17;

  v8 = a4;
  objc_msgSend(a1, "_resumeMakerKeyPathForActionClass:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D73158];
  objc_msgSend(v8, "libraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appPrivateDataForLibraryURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v13 = objc_msgSend(v12, "setValue:forKeyPath:error:", 0, v9, &v17);
  v14 = v17;
  v15 = v14;
  if ((v13 & 1) == 0 && a5)
    *a5 = objc_retainAutorelease(v14);

  return v13;
}

+ (BOOL)isResetAfterRebuildRequiredWithLibrary:(id)a3
{
  return 0;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

+ (id)actionDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLStringShortener(v4, objc_msgSend(CFSTR("PLModelMigrationAction_"), "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)shortenedMigrationActionClassName
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v2 = (void *)objc_opt_class();
  if (objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class()))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("unknown");
  }
  return v6;
}

@end
