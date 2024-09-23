@implementation PLModelMigrationActionCore

- (PLModelMigrationActionCore)initWithMigrationContext:(id)a3 logger:(id)a4 progress:(id)a5
{
  id v10;
  id v11;
  id v12;
  PLModelMigrationActionCore *v13;
  PLModelMigrationActionCore *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLModelMigrationAction.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[migrationContext isKindOfClass:PLMigrationContext.class]"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PLModelMigrationActionCore;
  v13 = -[PLModelMigrationActionCore init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_migrationContext, a3);
    objc_storeStrong((id *)&v14->_logger, a4);
    objc_storeStrong((id *)&v14->_progress, a5);
    -[PLModelMigrationActionCore setup](v14, "setup");
  }

  return v14;
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
  -[PLModelMigrationActionCore progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__PLModelMigrationActionCore_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke;
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

  -[PLModelMigrationActionCore progress](self, "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "totalUnitCount");
  -[PLModelMigrationActionCore progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedUnitCount:", v3);

}

- (BOOL)isCancelledWithError:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PLModelMigrationActionCore progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  if (a3 && v5)
  {
    v6 = (void *)objc_opt_class();
    if (objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
      v7 = 46013;
    else
      v7 = 46008;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D74498];
    v12 = *MEMORY[0x1E0CB2D68];
    v13[0] = CFSTR("Migration was cancelled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v7, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return -[PLMigrationContext pathManager](self->_migrationContext, "pathManager");
}

- (id)graphCache
{
  return -[PLMigrationContext graphCache](self->_migrationContext, "graphCache");
}

- (PLModelMigrationHistory)migrationHistory
{
  return -[PLMigrationContext modelMigrationHistory](self->_migrationContext, "modelMigrationHistory");
}

- (unsigned)startingSchemaVersion
{
  return -[PLMigrationContext previousStoreVersion](self->_migrationContext, "previousStoreVersion");
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
  v9.super_class = (Class)PLModelMigrationActionCore;
  -[PLModelMigrationActionCore description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore actionName](self, "actionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "actionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": [%@] description: %@, progress: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)actionName
{
  PLModelMigrationActionCore *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLFileBackedLogger)logger
{
  return (PLFileBackedLogger *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLMigrationContext)migrationContext
{
  return (PLMigrationContext *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationContext, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __99__PLModelMigrationActionCore_cancellableDiscreteProgressWithTotalUnitCount_pendingParentUnitCount___block_invoke(uint64_t a1, void *a2)
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

      objc_msgSend(v3, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationAction.m", 207, 16, &v10, v9);
      if (v8 != v12)
        free(v8);
    }
  }

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
