@implementation TRIServerContext

- (TRIRolloutDatabase)rolloutDatabase
{
  return self->_rolloutDatabase;
}

- (TRIExperimentDatabase)experimentDatabase
{
  return self->_experimentDatabase;
}

- (TRIExperimentHistoryDatabase)experimentHistoryDatabase
{
  return self->_experimentHistoryDatabase;
}

- (void)logErrorMetric:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("server_error"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIServerContext client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIServerContext client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackingId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v8, v9, 0, 0);

}

- (void)_logInitErrorWithClient:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
  }

  v9 = objc_msgSend(v7, "shouldLogAtLevel:withPrivacyRadar:", 50, 54260918);
  if (v9)
    -[TRIServerContext logErrorMetric:](self, "logErrorMetric:", v6);

}

- (TRIServerContext)initWithPaths:(id)a3 client:(id)a4 storageManagement:(id)a5
{
  return -[TRIServerContext initWithPaths:client:storageManagement:xpcActivityManagement:](self, "initWithPaths:client:storageManagement:xpcActivityManagement:", a3, a4, a5, 0);
}

- (TRIServerContext)initWithPaths:(id)a3 client:(id)a4 storageManagement:(id)a5 xpcActivityManagement:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIServerContext *v16;
  TRIServerContext *v17;
  TRIDatabase *v18;
  TRIDatabase *underlyingDatabase;
  TRIDatabase *v20;
  TRIExperimentDatabase *v21;
  TRIExperimentDatabase *experimentDatabase;
  TRIExperimentHistoryDatabase *v23;
  TRIExperimentHistoryDatabase *experimentHistoryDatabase;
  TRINamespaceDatabase *v25;
  TRINamespaceDatabase *namespaceDatabase;
  TRIActivationEventDatabase *v27;
  TRIActivationEventDatabase *activationEventDatabase;
  TRIRolloutDatabase *v29;
  TRIRolloutDatabase *rolloutDatabase;
  TRIRolloutHistoryDatabase *v31;
  TRIRolloutHistoryDatabase *rolloutHistoryDatabase;
  TRIMLRuntimeEvaluationHistoryDatabase *v33;
  TRIMLRuntimeEvaluationHistoryDatabase *evaluationHistoryDatabase;
  TRITaskDatabase *v35;
  TRIDatabase *v36;
  void *v37;
  uint64_t v38;
  TRITaskDatabase *taskDatabase;
  TRIBackgroundMLTaskDatabase *v40;
  TRIBackgroundMLTaskDatabase *bmltDatabase;
  TRIBackgroundMLTaskHistoryDatabase *v42;
  TRIBackgroundMLTaskHistoryDatabase *bmltHistoryDatabase;
  TRIKVStore *v44;
  TRIKVStore *keyValueStore;
  TRIContentTracker *v46;
  TRIContentTracker *contentTracker;
  NSObject *v48;
  TRIServerContext *v49;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[16];
  objc_super v55;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v14)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paths"));

  if (!v13)
    goto LABEL_13;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storageManagement"));

LABEL_4:
  v55.receiver = self;
  v55.super_class = (Class)TRIServerContext;
  v16 = -[TRIServerContext init](&v55, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_paths, a3);
    objc_storeStrong((id *)&v17->_client, a4);
    v18 = -[TRIDatabase initWithPaths:storageManagement:]([TRIDatabase alloc], "initWithPaths:storageManagement:", v17->_paths, v14);
    if (!v18)
    {
      -[TRIServerContext _logInitErrorWithClient:message:](v17, "_logInitErrorWithClient:message:", v17->_client, CFSTR("TRIDServer failed to initialize db"));
      v49 = 0;
      goto LABEL_11;
    }
    underlyingDatabase = v17->_underlyingDatabase;
    v17->_underlyingDatabase = v18;
    v20 = v18;

    v21 = -[TRIExperimentDatabase initWithDatabase:]([TRIExperimentDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    experimentDatabase = v17->_experimentDatabase;
    v17->_experimentDatabase = v21;

    v23 = -[TRIExperimentHistoryDatabase initWithDatabase:]([TRIExperimentHistoryDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    experimentHistoryDatabase = v17->_experimentHistoryDatabase;
    v17->_experimentHistoryDatabase = v23;

    v25 = -[TRINamespaceDatabase initWithDatabase:]([TRINamespaceDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    namespaceDatabase = v17->_namespaceDatabase;
    v17->_namespaceDatabase = v25;

    v27 = -[TRIActivationEventDatabase initWithDatabase:]([TRIActivationEventDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    activationEventDatabase = v17->_activationEventDatabase;
    v17->_activationEventDatabase = v27;

    v29 = -[TRIRolloutDatabase initWithDatabase:]([TRIRolloutDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    rolloutDatabase = v17->_rolloutDatabase;
    v17->_rolloutDatabase = v29;

    v31 = -[TRIRolloutHistoryDatabase initWithDatabase:]([TRIRolloutHistoryDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    rolloutHistoryDatabase = v17->_rolloutHistoryDatabase;
    v17->_rolloutHistoryDatabase = v31;

    v33 = -[TRIMLRuntimeEvaluationHistoryDatabase initWithDatabase:]([TRIMLRuntimeEvaluationHistoryDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    evaluationHistoryDatabase = v17->_evaluationHistoryDatabase;
    v17->_evaluationHistoryDatabase = v33;

    v35 = [TRITaskDatabase alloc];
    v36 = v17->_underlyingDatabase;
    +[TRITaskSupport sharedInstance](TRITaskSupport, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[TRITaskDatabase initWithDatabase:taskSetProvider:](v35, "initWithDatabase:taskSetProvider:", v36, v37);
    taskDatabase = v17->_taskDatabase;
    v17->_taskDatabase = (TRITaskDatabase *)v38;

    v40 = -[TRIBackgroundMLTaskDatabase initWithDatabase:]([TRIBackgroundMLTaskDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    bmltDatabase = v17->_bmltDatabase;
    v17->_bmltDatabase = v40;

    v42 = -[TRIBackgroundMLTaskHistoryDatabase initWithDatabase:]([TRIBackgroundMLTaskHistoryDatabase alloc], "initWithDatabase:", v17->_underlyingDatabase);
    bmltHistoryDatabase = v17->_bmltHistoryDatabase;
    v17->_bmltHistoryDatabase = v42;

    v44 = -[TRIKVStore initWithDatabase:]([TRIKVStore alloc], "initWithDatabase:", v17->_underlyingDatabase);
    keyValueStore = v17->_keyValueStore;
    v17->_keyValueStore = v44;

    v46 = -[TRIContentTracker initWithDatabase:]([TRIContentTracker alloc], "initWithDatabase:", v17->_underlyingDatabase);
    contentTracker = v17->_contentTracker;
    v17->_contentTracker = v46;

    objc_storeWeak((id *)&v17->_xpcActivityManager, v15);
    TRILogCategory_Server();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v48, OS_LOG_TYPE_DEFAULT, "Successfully initialized TRIServerContext", buf, 2u);
    }

  }
  v49 = v17;
LABEL_11:

  return v49;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeWeak((id *)&self->_xpcActivityManager, a3);
}

- (TRITaskQueuing)taskQueue
{
  TRITaskQueuing *taskQueue;
  void *v6;

  taskQueue = self->_taskQueue;
  if (!taskQueue)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 112, CFSTR("Task queue unexpectedly nil in server context"));

    taskQueue = self->_taskQueue;
  }
  return taskQueue;
}

- (TRIPushServiceConnectionMultiplexing)pushServiceMuxer
{
  TRIPushServiceConnectionMultiplexing *pushServiceMuxer;
  void *v6;

  pushServiceMuxer = self->_pushServiceMuxer;
  if (!pushServiceMuxer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 117, CFSTR("Push service muxer unexpectedly nil in server context"));

    pushServiceMuxer = self->_pushServiceMuxer;
  }
  return pushServiceMuxer;
}

- (id)ensureFakeCKDatabase
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TRISQLiteCKDatabase *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  -[TRIServerContext fakeCKDatabase](self, "fakeCKDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trialRootDir");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("CKSQLiteMock/Database"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "trialRootDir");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("CKSQLiteMock/AssetCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[TRISQLiteCKDatabase initWithParentDir:assetCacheDir:]([TRISQLiteCKDatabase alloc], "initWithParentDir:assetCacheDir:", v7, v9);
    -[TRIServerContext setFakeCKDatabase:](self, "setFakeCKDatabase:", v10);

    -[TRIServerContext fakeCKDatabase](self, "fakeCKDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 130, CFSTR("Failed to instantiate TRISQLiteCKDatabase"));

    }
  }
  -[TRIServerContext fakeCKDatabase](self, "fakeCKDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerContext.m"), 132, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("self.fakeCKDatabase"));

  }
  return v12;
}

- (TRIPaths)paths
{
  return self->_paths;
}

- (void)setExperimentDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_experimentDatabase, a3);
}

- (TRIActivationEventDatabase)activationEventDatabase
{
  return self->_activationEventDatabase;
}

- (TRINamespaceDatabase)namespaceDatabase
{
  return self->_namespaceDatabase;
}

- (TRIRolloutHistoryDatabase)rolloutHistoryDatabase
{
  return self->_rolloutHistoryDatabase;
}

- (TRIMLRuntimeEvaluationHistoryDatabase)evaluationHistoryDatabase
{
  return self->_evaluationHistoryDatabase;
}

- (TRITaskDatabase)taskDatabase
{
  return self->_taskDatabase;
}

- (TRIBackgroundMLTaskDatabase)bmltDatabase
{
  return self->_bmltDatabase;
}

- (TRIBackgroundMLTaskHistoryDatabase)bmltHistoryDatabase
{
  return self->_bmltHistoryDatabase;
}

- (TRIClient)client
{
  return self->_client;
}

- (TRIKVStore)keyValueStore
{
  return self->_keyValueStore;
}

- (TRIContentTracker)contentTracker
{
  return self->_contentTracker;
}

- (TRISQLiteCKDatabase)fakeCKDatabase
{
  return (TRISQLiteCKDatabase *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFakeCKDatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (TRISQLiteCKDatabaseFailureInjectionDelegate)failureInjectionDelegate
{
  return self->_failureInjectionDelegate;
}

- (void)setFailureInjectionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_failureInjectionDelegate, a3);
}

- (TRILimitedCarryProfileManager)limitedCarryManager
{
  return self->_limitedCarryManager;
}

- (void)setLimitedCarryManager:(id)a3
{
  objc_storeStrong((id *)&self->_limitedCarryManager, a3);
}

- (void)setTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskQueue, a3);
}

- (void)setPushServiceMuxer:(id)a3
{
  objc_storeStrong((id *)&self->_pushServiceMuxer, a3);
}

- (TRIXPCActivityManagementProtocol)xpcActivityManager
{
  return (TRIXPCActivityManagementProtocol *)objc_loadWeakRetained((id *)&self->_xpcActivityManager);
}

- (BOOL)useCKNative
{
  return self->_useCKNative;
}

- (void)setUseCKNative:(BOOL)a3
{
  self->_useCKNative = a3;
}

- (TRIDatabase)underlyingDatabase
{
  return self->_underlyingDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDatabase, 0);
  objc_destroyWeak((id *)&self->_xpcActivityManager);
  objc_storeStrong((id *)&self->_pushServiceMuxer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_limitedCarryManager, 0);
  objc_storeStrong((id *)&self->_failureInjectionDelegate, 0);
  objc_storeStrong((id *)&self->_fakeCKDatabase, 0);
  objc_storeStrong((id *)&self->_contentTracker, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_bmltHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_bmltDatabase, 0);
  objc_storeStrong((id *)&self->_taskDatabase, 0);
  objc_storeStrong((id *)&self->_evaluationHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_rolloutHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_rolloutDatabase, 0);
  objc_storeStrong((id *)&self->_namespaceDatabase, 0);
  objc_storeStrong((id *)&self->_experimentHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_activationEventDatabase, 0);
  objc_storeStrong((id *)&self->_experimentDatabase, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
