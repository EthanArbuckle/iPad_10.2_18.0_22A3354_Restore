@implementation TRIClient

- (id)_rampIdForRolloutDeployment:(id)a3
{
  TRIPaths *paths;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  paths = self->_paths;
  v4 = a3;
  -[TRIPaths namespaceDescriptorsDir](paths, "namespaceDescriptorsDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "rolloutId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "deploymentId");

  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("v2/rolloutV2/%@/%d/%@"), v7, v8, CFSTR("rampId"));
  objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v10, 4, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  v13 = v12;
  if (!v11)
  {
    if (v12)
    {
      objc_msgSend(v12, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v16 = objc_msgSend(v13, "code");

        if (v16 == 260)
        {
          TRILogCategory_ClientFramework();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v21 = v10;
            _os_log_debug_impl(&dword_19B89C000, v17, OS_LOG_TYPE_DEBUG, "No ramp ID file found at path %{public}@", buf, 0xCu);
          }
LABEL_11:

          v14 = 0;
          goto LABEL_12;
        }
      }
      else
      {

      }
    }
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_19B89C000, v17, OS_LOG_TYPE_ERROR, "Unable to read ramp ID from file at path %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  TRIValidateRampId(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v14;
}

+ (TRIClient)clientWithIdentifier:(int)a3 unit:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  TRIClient *v8;
  void *v9;
  TRILogger *v10;
  void *v11;
  TRILogger *v12;
  _QWORD v14[2];

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TRIClient initWithClientIdentifier:paths:unit:staleFactorsUsageGracePeriod:logger:]([TRIClient alloc], "initWithClientIdentifier:paths:unit:staleFactorsUsageGracePeriod:logger:", v5, v7, v4, 0, 86400.0);
  if (objc_msgSend(a1, "requiresLogging"))
  {
    v9 = (void *)objc_opt_new();
    v10 = [TRILogger alloc];
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRILogger initWithClient:projectId:logHandlers:](v10, "initWithClient:projectId:logHandlers:", v8, v5, v11);

    -[TRIClient setLogger:](v8, "setLogger:", v12);
  }

  return v8;
}

+ (BOOL)isPlatformBinary
{
  if (qword_1ECED7FC8 != -1)
    dispatch_once(&qword_1ECED7FC8, &__block_literal_global_25);
  return _MergedGlobals_20;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (TRIClient)initWithClientIdentifier:(int)a3 paths:(id)a4 unit:(int)a5 staleFactorsUsageGracePeriod:(double)a6 logger:(id)a7
{
  TRIClient *v8;
  void *v10;

  v8 = -[TRIClient initWithClientIdentifier:paths:unit:factorsState:staleFactorsUsageGracePeriod:logger:](self, "initWithClientIdentifier:paths:unit:factorsState:staleFactorsUsageGracePeriod:logger:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5, 0, a7, a6);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("TRIClient.m"), 205, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[self initWithClientIdentifier:projectId paths:paths unit:unit factorsState:nil staleFactorsUsageGracePeriod:staleFactorsUsageGracePeriod logger:logger]"));

  }
  return v8;
}

- (TRIClient)initWithClientIdentifier:(int)a3 paths:(id)a4 unit:(int)a5 factorsState:(id)a6 staleFactorsUsageGracePeriod:(double)a7 logger:(id)a8
{
  id v14;
  id v15;
  id v16;
  TRIClient *v17;
  NSObject *v18;
  TRIDefaultFactorProvider *v19;
  TRIDefaultFactorProvider *defaultFactorProvider;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _PASLock *lock;
  uint64_t v28;
  OS_dispatch_queue *notificationQueue;
  TRIClient *v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v16 = a8;
  v33.receiver = self;
  v33.super_class = (Class)TRIClient;
  v17 = -[TRIClient init](&v33, sel_init);
  if (!v17)
    goto LABEL_6;
  TRILogCategory_ClientFramework();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = CFSTR("TrialXP-429");
    _os_log_impl(&dword_19B89C000, v18, OS_LOG_TYPE_DEFAULT, "Initializing TRIClient. Trial version: %@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v17->_paths, a4);
  v19 = -[TRIDefaultFactorProvider initWithPaths:factorsState:]([TRIDefaultFactorProvider alloc], "initWithPaths:factorsState:", v14, v15);
  defaultFactorProvider = v17->_defaultFactorProvider;
  v17->_defaultFactorProvider = v19;

  if (v17->_defaultFactorProvider)
  {
    v17->_projectId = a3;
    objc_storeStrong((id *)&v17->_logger, a8);
    v17->_staleFactorsUsageGracePeriod = a7;
    v21 = objc_opt_new();
    v22 = objc_opt_new();
    v23 = *(void **)(v21 + 16);
    *(_QWORD *)(v21 + 16) = v22;

    v24 = objc_opt_new();
    v25 = *(void **)(v21 + 24);
    *(_QWORD *)(v21 + 24) = v24;

    *(_BYTE *)(v21 + 40) = 0;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v21);
    lock = v17->_lock;
    v17->_lock = (_PASLock *)v26;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.Trial.notificationQueue", 17);
    v28 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v17->_notificationQueue;
    v17->_notificationQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v17->_factorsState, a6);
LABEL_6:
    v30 = v17;
    goto LABEL_10;
  }
  TRILogCategory_ClientFramework();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v31, OS_LOG_TYPE_ERROR, "Initializing TRIClient with factor state failed. No default factor provider found", buf, 2u);
  }

  v30 = 0;
LABEL_10:

  return v30;
}

void __22__TRIClient__refresh___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned int *)(v5 + 24);
  v7 = *(_QWORD *)(v5 + 8);
  if (*(_BYTE *)(a1 + 48))
  {
    +[TRITrackingId trackingIdWithProjectId:paths:](TRITrackingId, "trackingIdWithProjectId:paths:", *(unsigned int *)(v5 + 24), *(_QWORD *)(v5 + 8));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v4[1];
    v4[1] = (id)v8;

    objc_msgSend(*(id *)(a1 + 32), "_invalidateFactors");
  }
  else
  {
    objc_msgSend(v3[1], "treatments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITrackingId trackingIdWithProjectId:paths:treatments:](TRITrackingId, "trackingIdWithProjectId:paths:treatments:", v6, v7, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v4[1];
    v4[1] = (id)v11;

  }
  TRILogCategory_ClientFramework();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4[1], "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "subject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_19B89C000, v13, OS_LOG_TYPE_DEBUG, "Generated new tracking id %@ for subject with device id %@", (uint8_t *)&v17, 0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4[1]);

}

- (void)_invalidateFactors
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_246);
  -[TRIDefaultFactorProvider invalidateAllFactorProviders](self->_defaultFactorProvider, "invalidateAllFactorProviders");
}

- (void)_checkEntitlements
{
  int v3;
  id v4;
  const char *v5;
  void *v6;
  TRILogger *logger;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "requiresTrialDataVaultAccess");
  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");

  *__error() = 0;
  if (v3 && access(v5, 4) && *__error() == 1)
  {
    if (self->_logger)
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", CFSTR("triclient_missing_datavault"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      logger = self->_logger;
      -[TRIClient trackingId](self, "trackingId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRILogger logWithProjectNameAndTrackingId:metrics:dimensions:trialSystemTelemetry:](logger, "logWithProjectNameAndTrackingId:metrics:dimensions:trialSystemTelemetry:", v8, v9, 0, 0);

    }
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = v5;
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "Cannot access \"%s\" - Please ensure you have set the entitlement <key>com.apple.trial.client</key> to the right value(s)", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (id)experimentIdentifiersWithNamespaceName:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  TRIExperimentIdentifiers *v15;
  uint64_t v16;
  void *v17;
  TRIExperimentIdentifiers *v18;
  NSObject *v19;
  void *v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v6 = objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceIdFromName:", v5);
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_ClientFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v23 = v5;
    v24 = 1024;
    LODWORD(v25) = v6;
    _os_log_debug_impl(&dword_19B89C000, v11, OS_LOG_TYPE_DEBUG, "Looking for experiment identifiers for namespace name: %{private}@ and namespace id: %d", buf, 0x12u);
  }

  v12 = objc_retainAutorelease(v9);
  if (access((const char *)-[NSObject fileSystemRepresentation](v12, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
LABEL_22:
      _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v14 = objc_retainAutorelease(v10);
  if (access((const char *)-[NSObject fileSystemRepresentation](v14, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      goto LABEL_22;
    }
LABEL_12:
    v15 = 0;
    goto LABEL_20;
  }
  -[TRIDefaultFactorProvider experimentDeploymentWithNamespaceName:](self->_defaultFactorProvider, "experimentDeploymentWithNamespaceName:", v5);
  v13 = objc_claimAutoreleasedReturnValue();
  -[TRIDefaultFactorProvider treatmentIdWithNamespaceName:](self->_defaultFactorProvider, "treatmentIdWithNamespaceName:", v5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v13 && v16)
  {
    v18 = [TRIExperimentIdentifiers alloc];
    -[NSObject experimentId](v13, "experimentId");
    v19 = objc_claimAutoreleasedReturnValue();
    v15 = -[TRIExperimentIdentifiers initWithExperimentId:deploymentId:treatmentId:](v18, "initWithExperimentId:deploymentId:treatmentId:", v19, -[NSObject deploymentId](v13, "deploymentId"), v17);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      v23 = v13;
      v24 = 2113;
      v25 = v17;
      _os_log_debug_impl(&dword_19B89C000, v19, OS_LOG_TYPE_DEBUG, "Either of ExperimentDeployment %{private}@ or Treatment %{private}@ is nil", buf, 0x16u);
    }
    v15 = 0;
  }

LABEL_20:
  return v15;
}

- (id)rolloutIdentifiersWithNamespaceName:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  TRIRolloutIdentifiers *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TRIRolloutIdentifiers *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v6 = objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceIdFromName:", v5);
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  if (access((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
LABEL_17:
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v13 = objc_retainAutorelease(v10);
  if (access((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      goto LABEL_17;
    }
LABEL_10:

    v14 = 0;
    goto LABEL_15;
  }
  -[TRIDefaultFactorProvider rolloutDeploymentWithNamespaceName:](self->_defaultFactorProvider, "rolloutDeploymentWithNamespaceName:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDefaultFactorProvider factorPackIdForRolloutWithNamespaceName:](self->_defaultFactorProvider, "factorPackIdForRolloutWithNamespaceName:", v5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v14 = 0;
  if (v15 && v16)
  {
    -[TRIClient _rampIdForRolloutDeployment:](self, "_rampIdForRolloutDeployment:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [TRIRolloutIdentifiers alloc];
    objc_msgSend(v15, "rolloutId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TRIRolloutIdentifiers initWithRolloutId:deploymentId:factorPackId:rampId:](v19, "initWithRolloutId:deploymentId:factorPackId:rampId:", v20, objc_msgSend(v15, "deploymentId"), v17, v18);

  }
LABEL_15:

  return v14;
}

void __22__TRIClient__lazyInit__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t v4[16];

  if (!*(_BYTE *)(a2 + 40))
  {
    *(_BYTE *)(a2 + 40) = 1;
    objc_msgSend(*(id *)(a1 + 32), "refresh");
    objc_msgSend(*(id *)(a1 + 32), "_checkEntitlements");
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19B89C000, v3, OS_LOG_TYPE_DEFAULT, "Finished lazy initialization of TRIClient", v4, 2u);
    }

  }
}

- (void)refresh
{
  id v2;

  v2 = -[TRIClient _refresh:](self, "_refresh:", 1);
}

- (id)_refresh:(BOOL)a3
{
  _PASLock *lock;
  id v6;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[TRIClient _lazyInit](self, "_lazyInit");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__13;
  v14 = __Block_byref_object_dispose__13;
  v15 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __22__TRIClient__refresh___block_invoke;
  v8[3] = &unk_1E3C00178;
  v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v7, 0, "-[TRIClient levelForFactor:withNamespaceName:]", v4);
  -[TRIDefaultFactorProvider levelForFactor:withNamespaceName:](self->_defaultFactorProvider, "levelForFactor:withNamespaceName:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_registerUpdateHandlerForNamespaceName:(id)a3 notificationCallback:(id)a4 clientMethodNameForLogging:(const char *)a5 callingFunctionReturnAddressForLogging:(void *)a6
{
  id v10;
  id v11;
  _PASLock *lock;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  TRIClient *v18;
  const char *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke;
  v15[3] = &unk_1E3C00240;
  v16 = v11;
  v17 = v10;
  v18 = self;
  v19 = a5;
  v20 = a6;
  v13 = v10;
  v14 = v11;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);

}

- (void)_lazyInit
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__TRIClient__lazyInit__block_invoke;
  v3[3] = &unk_1E3C00150;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    TRILogCategory_ClientFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "id");
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v24 = v5;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_19B89C000, v4, OS_LOG_TYPE_DEFAULT, "adding update handler %lu for namespace %@", buf, 0x16u);
    }

    objc_msgSend(v3[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v3[3], "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
    }
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 32));
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "id");
      v14 = *(_QWORD *)(a1 + 40);
      v15 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218498;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2048;
      v28 = v15;
      _os_log_debug_impl(&dword_19B89C000, v8, OS_LOG_TYPE_DEBUG, "added update handler %lu for namespace %@ -- now %lu handlers for this namespace", buf, 0x20u);
    }

  }
  objc_msgSend(v3[2], "objectForKey:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 48));
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_175;
    v19 = &unk_1E3C00268;
    v20 = *(id *)(a1 + 40);
    objc_copyWeak(&v21, (id *)buf);
    v22 = *(_OWORD *)(a1 + 56);
    v11 = (void *)MEMORY[0x1A1AC6D30](&v16);
    +[TRINamespaceUpdateNotification registerUpdateForNamespaceName:queue:usingBlock:](TRINamespaceUpdateNotification, "registerUpdateForNamespaceName:queue:usingBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), v11, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v3[2], "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

}

+ (TRIClient)clientWithIdentifier:(int)a3
{
  return +[TRIClient clientWithIdentifier:unit:](TRIClient, "clientWithIdentifier:unit:", *(_QWORD *)&a3, 2);
}

void __20__TRIClient_dealloc__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  id v5;

  v3 = (void *)a2[2];
  v4 = a2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_153);
  v5 = (id)a2[2];
  a2[2] = 0;

}

void __31__TRIClient__invalidateFactors__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  id v5;

  v3 = (void *)a2[4];
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  v5 = (id)a2[4];
  a2[4] = 0;

}

- (id)addUpdateHandlerForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v5;
  id v9;
  OS_dispatch_queue *v10;
  id v11;
  void *v12;
  void *v13;
  OS_dispatch_queue *notificationQueue;

  v9 = a5;
  v10 = (OS_dispatch_queue *)a4;
  v11 = a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  v12 = (void *)objc_opt_new();
  v13 = v12;
  notificationQueue = v10;
  if (!v10)
    notificationQueue = self->_notificationQueue;
  objc_msgSend(v12, "setQueue:", notificationQueue);

  objc_msgSend(v13, "setHandler:", v9);
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v11, v13, "-[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]", v5);

  return v13;
}

- (id)addUpdateHandlerForNamespaceName:(id)a3 usingBlock:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setQueue:", self->_notificationQueue);
  objc_msgSend(v9, "setHandler:", v7);

  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v8, v9, "-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:]", v4);
  return v9;
}

- (id)factorLevelsWithNamespaceName:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v9;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v6, 0, "-[TRIClient factorLevelsWithNamespaceName:]", v3);
  -[TRIDefaultFactorProvider factorLevelsWithNamespaceName:](self->_defaultFactorProvider, "factorLevelsWithNamespaceName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_151);
  v3.receiver = self;
  v3.super_class = (Class)TRIClient;
  -[TRIClient dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_defaultFactorProvider, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

void __29__TRIClient_isPlatformBinary__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_20 = (SecTaskGetCodeSignStatus(v0) & 0xC000001) == 67108865;
    CFRelease(v1);
  }
}

- (BOOL)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  uint64_t v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1A1AC6B8C]();
          LOBYTE(v15) = -[TRIClient _hasAppropriatePermissionsForNamespaceName:](self, "_hasAppropriatePermissionsForNamespaceName:", v15);
          objc_autoreleasePoolPop(v16);
          if ((v15 & 1) == 0)
          {
            if (a5)
            {
              v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v29 = *MEMORY[0x1E0CB2D50];
              v30 = CFSTR("Process is not entitled for immediate download.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *a5 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v21);

            }
            v18 = 0;
            goto LABEL_20;
          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (v12)
          continue;
        break;
      }
    }

    v17 = (void *)objc_opt_new();
    v23 = 0;
    v18 = objc_msgSend(v17, "immediateDownloadForNamespaceNames:allowExpensiveNetworking:error:", v10, v6, &v23);
    v19 = v23;
    v10 = v19;
    if (a5)
      *a5 = objc_retainAutorelease(v19);

  }
  else
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B89C000, v10, OS_LOG_TYPE_DEFAULT, "Immediate download is not needed, namespace names are either nil or empty", buf, 2u);
    }
    v18 = 1;
  }
LABEL_20:

  return v18;
}

- (BOOL)_hasAppropriatePermissionsForNamespaceName:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceIdFromName:", a3);
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v7);
  if (access((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
LABEL_12:
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
    }
  }
  else
  {
    v11 = objc_retainAutorelease(v8);
    if (!access((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 4) || *__error() != 1)
    {
      v12 = 1;
      goto LABEL_10;
    }
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      goto LABEL_12;
    }
  }

  v12 = 0;
LABEL_10:

  return v12;
}

uint64_t __20__TRIClient_dealloc__block_invoke_2()
{
  return +[TRINamespaceUpdateNotification deregisterUpdateWithToken:](TRINamespaceUpdateNotification, "deregisterUpdateWithToken:");
}

- (id)levelForFactor:(id)a3 withNamespace:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](self, "levelForFactor:withNamespaceName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (TRIClient)clientWithProjectId:(int)a3 factorsState:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  TRIClient *v8;
  void *v9;
  TRILogger *v10;
  void *v11;
  TRILogger *v12;
  _QWORD v14[2];

  v4 = *(_QWORD *)&a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TRIClient initWithClientIdentifier:paths:unit:factorsState:staleFactorsUsageGracePeriod:logger:]([TRIClient alloc], "initWithClientIdentifier:paths:unit:factorsState:staleFactorsUsageGracePeriod:logger:", v4, v7, 2, v6, 0, 86400.0);

  if (objc_msgSend(a1, "requiresLogging"))
  {
    v9 = (void *)objc_opt_new();
    v10 = [TRILogger alloc];
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRILogger initWithClient:projectId:logHandlers:](v10, "initWithClient:projectId:logHandlers:", v8, v4, v11);

    -[TRIClient setLogger:](v8, "setLogger:", v12);
  }

  return v8;
}

- (TRIClient)initWithNonLoggingClientIdentifier:(int)a3 paths:(id)a4
{
  return -[TRIClient initWithClientIdentifier:paths:unit:staleFactorsUsageGracePeriod:logger:](self, "initWithClientIdentifier:paths:unit:staleFactorsUsageGracePeriod:logger:", *(_QWORD *)&a3, a4, 2, 0, 86400.0);
}

- (TRITrackingId)trackingId
{
  _PASLock *lock;
  id v5;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[TRIClient _lazyInit](self, "_lazyInit");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__TRIClient_trackingId__block_invoke;
  v8[3] = &unk_1E3C001A0;
  v8[4] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 329, CFSTR("trackingId unexpectedly not assigned"));

  }
  return (TRITrackingId *)v5;
}

void __23__TRIClient_trackingId__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 8));
}

- (id)newTrackingId
{
  -[TRIClient _refresh:](self, "_refresh:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newTrackingIdWithTreatmentRefresh:(BOOL)a3
{
  -[TRIClient _refresh:](self, "_refresh:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cacheFactorLevelsWithNamespaceName:(id)a3
{
  uint64_t v3;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v7, 0, "-[TRIClient cacheFactorLevelsWithNamespaceName:]", v3);
  -[TRIDefaultFactorProvider cacheFactorLevelsWithNamespaceName:](self->_defaultFactorProvider, "cacheFactorLevelsWithNamespaceName:", v7);

}

- (void)removeUpdateHandlerForToken:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
    if (v4)
    {
      lock = self->_lock;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __41__TRIClient_removeUpdateHandlerForToken___block_invoke;
      v7[3] = &unk_1E3C00150;
      v8 = v4;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

    }
  }

}

void __41__TRIClient_removeUpdateHandlerForToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = *(void **)(a2 + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__TRIClient_removeUpdateHandlerForToken___block_invoke_2;
  v3[3] = &unk_1E3C001C8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __41__TRIClient_removeUpdateHandlerForToken___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
  v8 = objc_msgSend(v6, "count");

  if (v8 < v7)
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "id");
      v11 = 134218242;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_DEFAULT, "removed update handler %lu for namespace %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

- (void)_setupExcessiveStaleFactorsUsageTimerWithGuardedData:(id)a3 namespace:(id)a4 clientMethodNameForLogging:(const char *)a5 callingFunctionReturnAddressForLogging:(void *)a6
{
  _QWORD *v10;
  id v11;
  void *v12;
  TRIExcessiveStaleFactorsUsageTimer *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20[3];
  id location;

  v10 = a3;
  v11 = a4;
  if (!v10[4])
  {
    objc_initWeak(&location, self);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke;
    v19 = &unk_1E3C00218;
    objc_copyWeak(v20, &location);
    v20[1] = a6;
    v20[2] = (id)a5;
    v12 = (void *)MEMORY[0x1A1AC6D30](&v16);
    v13 = [TRIExcessiveStaleFactorsUsageTimer alloc];
    v14 = -[TRIExcessiveStaleFactorsUsageTimer initWithNamespaceName:delayTimeInSeconds:block:](v13, "initWithNamespaceName:delayTimeInSeconds:block:", v11, v12, self->_staleFactorsUsageGracePeriod, v16, v17, v18, v19);
    v15 = (void *)v10[4];
    v10[4] = v14;

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

void __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_2;
    v9[3] = &unk_1E3C001F0;
    v11 = *(_QWORD *)(a1 + 40);
    v6 = v8;
    v7 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    v12 = v7;
    objc_msgSend(v5, "runWithLockAcquired:", v9);

  }
}

void __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1[5])
  {
    +[TRIMisc bestEffortSymbolicateAddress:](TRIMisc, "bestEffortSymbolicateAddress:");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(not recorded)");
  }
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = a1[4];
    v7 = a1[6];
    v8 = 138413058;
    v9 = v6;
    v10 = 1024;
    v11 = 24;
    v12 = 2080;
    v13 = v7;
    v14 = 2112;
    v15 = v4;
    _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "TRIClient MISUSE: Factor levels for namespace %@ have been stale for %u hours.\n    Factor levels were pinned by TRIClient method call: %s\n    Calling function: %@\nPinning stale factor levels increases disk space requirements.  Use -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:] to detect factor level updates and respond to them (e.g. with -[TRIClient refresh]).", (uint8_t *)&v8, 0x26u);
  }

}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_19B89C000, v4, OS_LOG_TYPE_DEFAULT, "handling namespace update for %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_176;
    v9[3] = &unk_1E3C00240;
    v9[4] = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v12 = *(_OWORD *)(a1 + 48);
    v11 = v3;
    objc_msgSend(v8, "runWithLockAcquired:", v9);

  }
}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_176(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id *v19;
  _QWORD block[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setupExcessiveStaleFactorsUsageTimerWithGuardedData:namespace:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v19 = v3;
  objc_msgSend(v3[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_ClientFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_19B89C000, v5, OS_LOG_TYPE_DEFAULT, "dispatching updates to %tu callbacks", buf, 0xCu);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        TRILogCategory_ClientFramework();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_msgSend(v12, "id");
          v16 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          v27 = v15;
          v28 = 2112;
          v29 = v16;
          _os_log_debug_impl(&dword_19B89C000, v13, OS_LOG_TYPE_DEBUG, "calling update handler %lu for namespace %@", buf, 0x16u);
        }

        objc_msgSend(v12, "queue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_177;
        block[3] = &unk_1E3BFEA18;
        block[4] = v12;
        v21 = *(id *)(a1 + 48);
        dispatch_async(v14, block);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

  TRILogCategory_ClientFramework();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v27 = v18;
    _os_log_impl(&dword_19B89C000, v17, OS_LOG_TYPE_DEFAULT, "handled namespace update for %@", buf, 0xCu);
  }

}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_177(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (id)rolloutIdWithNamespaceName:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v9;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 504, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v6, 0, "-[TRIClient rolloutIdWithNamespaceName:]", v3);
  -[TRIDefaultFactorProvider factorPackIdForRolloutWithNamespaceName:](self->_defaultFactorProvider, "factorPackIdForRolloutWithNamespaceName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)treatmentIdWithNamespaceName:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v9;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 514, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v6, 0, "-[TRIClient treatmentIdWithNamespaceName:]", v3);
  -[TRIDefaultFactorProvider treatmentIdWithNamespaceName:](self->_defaultFactorProvider, "treatmentIdWithNamespaceName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)trialIdentifiersWithNamespaceName:(id)a3 experimentId:(id *)a4 deploymentId:(int *)a5 treatmentId:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v10 = a3;
  if (-[TRIClient _hasAppropriatePermissionsForNamespaceName:](self, "_hasAppropriatePermissionsForNamespaceName:", v10))
  {
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = -1;
    if (a6)
      *a6 = 0;
    -[TRIClient treatmentIdWithNamespaceName:](self, "treatmentIdWithNamespaceName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v11);
      -[TRIDefaultFactorProvider experimentDeploymentWithNamespaceName:](self->_defaultFactorProvider, "experimentDeploymentWithNamespaceName:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v13 != 0;
      if (v13)
      {
        if (a4)
        {
          objc_msgSend(v13, "experimentId");
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a5)
          *a5 = objc_msgSend(v14, "deploymentId");
      }

    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)backgroundMLTaskIdentifiersWithNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TRIBackgroundMLTaskIdentifiers *v7;
  void *v8;
  TRIBackgroundMLTaskIdentifiers *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  -[TRIClient _bmltIdentifiersWithNamespaceName:](self, "_bmltIdentifiersWithNamespaceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[TRIClient experimentIdentifiersWithNamespaceName:](self, "experimentIdentifiersWithNamespaceName:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [TRIBackgroundMLTaskIdentifiers alloc];
      objc_msgSend(v8, "experimentId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "deploymentId");
      objc_msgSend(v8, "treatmentId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[TRIBackgroundMLTaskIdentifiers initWithBMLTTaskId:deploymentId:treatmentId:](v9, "initWithBMLTTaskId:deploymentId:treatmentId:", v10, v11, v12);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_bmltIdentifiersWithNamespaceName:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  TRIBackgroundMLTaskIdentifiers *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  TRIBackgroundMLTaskIdentifiers *v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 661, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v6 = objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceIdFromName:", v5);
  -[TRIPaths treatmentsDir](self->_paths, "treatmentsDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  if (access((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
LABEL_17:
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v13 = objc_retainAutorelease(v10);
  if (access((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 4) && *__error() == 1)
  {
    TRILogCategory_ClientFramework();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      goto LABEL_17;
    }
LABEL_10:

    v14 = 0;
    goto LABEL_15;
  }
  -[TRIDefaultFactorProvider bmltDeploymentWithNamespaceName:](self->_defaultFactorProvider, "bmltDeploymentWithNamespaceName:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDefaultFactorProvider factorPackIdForBmltWithNamespaceName:](self->_defaultFactorProvider, "factorPackIdForBmltWithNamespaceName:", v5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v14 = 0;
  if (v15 && v16)
  {
    v18 = [TRIBackgroundMLTaskIdentifiers alloc];
    objc_msgSend(v15, "backgroundMLTaskId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TRIBackgroundMLTaskIdentifiers initWithBMLTaskId:deploymentId:factorPackId:](v18, "initWithBMLTaskId:deploymentId:factorPackId:", v19, objc_msgSend(v15, "deploymentId"), v17);

  }
LABEL_15:

  return v14;
}

- (id)experimentIdWithNamespaceName:(id)a3
{
  id v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 696, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v12 = 0;
  v6 = -[TRIClient trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:](self, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:", v5, &v12, 0, 0);
  v7 = v12;
  v8 = v7;
  if (!v6)
    v7 = 0;
  v9 = v7;

  return v9;
}

- (int64_t)_appContainerType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  if (v3
    && (v4 = (void *)MEMORY[0x1E0D815A8],
        TRILogCategory_ClientFramework(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = objc_msgSend(v4, "hasTrueBooleanEntitlement:logHandle:", CFSTR("application-identifier"), v5),
        v5,
        (_DWORD)v4))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v3, "isEqualToString:", v7))
        v8 = 2;
      else
        v8 = 3;
    }
    else
    {
      v8 = 2;
    }

  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (BOOL)hasRegisteredNamespaceWithName:(id)a3
{
  return -[TRIDefaultFactorProvider hasRegisteredNamespaceWithName:](self->_defaultFactorProvider, "hasRegisteredNamespaceWithName:", a3);
}

- (unsigned)compatibilityVersionWithNamespaceName:(id)a3
{
  return -[TRIDefaultFactorProvider compatibilityVersionWithNamespaceName:](self->_defaultFactorProvider, "compatibilityVersionWithNamespaceName:", a3);
}

- (BOOL)registerNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 error:(id *)a8
{
  uint64_t v9;
  uint64_t v12;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  const __CFString **v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSObject *v29;
  int v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  _QWORD v36[2];

  v9 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a4;
  v36[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = (unint64_t)a6;
  -[TRIClient _lazyInit](self, "_lazyInit");
  if ((_DWORD)v12)
  {
    if (!-[TRIClient hasRegisteredNamespaceWithName:](self, "hasRegisteredNamespaceWithName:", v14))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();

      if (v16 | v17)
      {
        v24 = (void *)objc_opt_new();
        v18 = objc_msgSend(v24, "registerNamespaceWithNamespaceName:compatibilityVersion:defaultsFileURL:applicationGroup:cloudKitContainerId:error:", v14, v12, v15, v16, v9, a8);
        if (v18)
        {
          if (v16)
            v25 = (void *)v16;
          else
            v25 = (void *)v17;
          if (v16)
            v26 = 3;
          else
            v26 = 2;
          v27 = v25;
          +[TRIAppContainer containerWithIdentifier:type:](TRIAppContainer, "containerWithIdentifier:type:", v27, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIDefaultFactorProvider setContainer:forNamespaceName:](self->_defaultFactorProvider, "setContainer:forNamespaceName:", v28, v14);
          -[TRIClient _invalidateFactors](self, "_invalidateFactors");

        }
      }
      else
      {
        TRILogCategory_ClientFramework();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v31) = 0;
          _os_log_error_impl(&dword_19B89C000, v29, OS_LOG_TYPE_ERROR, "No application group provided and application bundle identifier could not be identified.", (uint8_t *)&v31, 2u);
        }

        v17 = 0;
        LOBYTE(v18) = 0;
      }
      goto LABEL_26;
    }
    if (-[TRIClient compatibilityVersionWithNamespaceName:](self, "compatibilityVersionWithNamespaceName:", v14) == (_DWORD)v12)
    {
      TRILogCategory_ClientFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
      {
        v31 = 138412290;
        v32 = v14;
        _os_log_debug_impl(&dword_19B89C000, (os_log_t)v17, OS_LOG_TYPE_DEBUG, "Namespace %@ is already registered", (uint8_t *)&v31, 0xCu);
      }
      LOBYTE(v18) = 1;
      goto LABEL_26;
    }
    if (a8)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Namespace is already registered with different compatibility version");
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = &v34;
      v22 = &v33;
      goto LABEL_21;
    }
  }
  else if (a8)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = CFSTR("compatibility version must be greater than 0");
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = (const __CFString **)v36;
    v22 = &v35;
LABEL_21:
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v17);
    LOBYTE(v18) = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(v18) = 0;
LABEL_27:

  return v18;
}

- (BOOL)deregisterNamespaceName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;

  v6 = a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v7, "deregisterNamespaceWithNamespaceName:error:", v6, a4);
  if (v8)
    -[TRIDefaultFactorProvider setContainer:forNamespaceName:](self->_defaultFactorProvider, "setContainer:forNamespaceName:", 0, v6);

  return v8;
}

- (BOOL)hasDownloadedNamespaceWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  TRINamespaceStatusProvider *v8;
  void *v9;
  unsigned int v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC6B8C]();
  if (_os_feature_enabled_impl())
    v6 = 54;
  else
    v6 = 22;
  if (-[TRIDefaultFactorProvider hasTreatmentInAnyOfLayers:withNamespaceName:](self->_defaultFactorProvider, "hasTreatmentInAnyOfLayers:withNamespaceName:", v6, v4))
  {
    v7 = 1;
  }
  else
  {
    v8 = -[TRINamespaceStatusProvider initWithPaths:]([TRINamespaceStatusProvider alloc], "initWithPaths:", self->_paths);
    -[TRINamespaceStatusProvider statusForNamespaceWithName:](v8, "statusForNamespaceWithName:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TRIClient compatibilityVersionWithNamespaceName:](self, "compatibilityVersionWithNamespaceName:", v4);
    if (v9 && objc_msgSend(v9, "compatibilityVersion") == v10)
    {
      objc_msgSend(v9, "lastFetchAttempt");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v7 = objc_msgSend(v9, "lastFetchWasSuccess");
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }

  }
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (void)downloadNamespaceWithName:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void (**v22)(id, uint64_t, _QWORD);
  void *v23;
  id v24;
  void (**v25)(id, uint64_t, _QWORD);
  NSObject *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  TRIClient *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  -[TRIClient _lazyInit](self, "_lazyInit");
  if (-[TRIClient hasRegisteredNamespaceWithName:](self, "hasRegisteredNamespaceWithName:", v10))
  {
    if (-[TRIClient hasDownloadedNamespaceWithName:](self, "hasDownloadedNamespaceWithName:", v10))
    {
      TRILogCategory_ClientFramework();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v10;
        _os_log_debug_impl(&dword_19B89C000, v14, OS_LOG_TYPE_DEBUG, "namespace %@ already has downloaded treatment", buf, 0xCu);
      }

      if (v13)
        v13[2](v13, 1, 0);
    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke;
      v42[3] = &unk_1E3C00290;
      v21 = v10;
      v43 = v21;
      v22 = v13;
      v44 = v22;
      v32 = (void *)MEMORY[0x1A1AC6D30](v42);
      -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](self, "addUpdateHandlerForNamespaceName:usingBlock:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v20;
      v36[1] = 3221225472;
      v36[2] = __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke_205;
      v36[3] = &unk_1E3C002B8;
      v24 = v21;
      v37 = v24;
      v40 = v12;
      v25 = v22;
      v41 = v25;
      v38 = self;
      v34 = v23;
      v39 = v34;
      v31 = (void *)MEMORY[0x1A1AC6D30](v36);
      +[TRIDownloadNotification registerDownloadNotificationForKey:queue:usingBlock:](TRIDownloadNotification, "registerDownloadNotificationForKey:queue:usingBlock:", v24, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      TRILogCategory_ClientFramework();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v24;
        _os_log_debug_impl(&dword_19B89C000, v26, OS_LOG_TYPE_DEBUG, "requesting treatment download for namespace %@", buf, 0xCu);
      }

      v27 = (void *)objc_opt_new();
      v35 = 0;
      v28 = objc_msgSend(v27, "startNamespaceDownloadWithName:options:error:", v24, v11, &v35);
      v29 = v35;
      if ((v28 & 1) == 0)
      {
        TRILogCategory_ClientFramework();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v24;
          _os_log_debug_impl(&dword_19B89C000, v30, OS_LOG_TYPE_DEBUG, "failed to request treatment download for namespace %@", buf, 0xCu);
        }

        if (v33)
          +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:");
        -[TRIClient removeUpdateHandlerForToken:](self, "removeUpdateHandlerForToken:", v34);
        if (v25)
          ((void (**)(id, uint64_t, id))v25)[2](v25, 0, v29);
      }

    }
  }
  else
  {
    TRILogCategory_ClientFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v10;
      _os_log_debug_impl(&dword_19B89C000, v15, OS_LOG_TYPE_DEBUG, "cannot download treatment because namespace %@ is not registered", buf, 0xCu);
    }

    if (v13)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("namespace is not registered: %@"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v19);
    }
  }

}

void __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_debug_impl(&dword_19B89C000, v4, OS_LOG_TYPE_DEBUG, "received downloaded treatment activated notification for namespace %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v3, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRINamespaceUpdateNotification deregisterUpdateWithToken:](TRINamespaceUpdateNotification, "deregisterUpdateWithToken:", v5);
}

void __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  _BYTE v20[18];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  switch(objc_msgSend(v6, "type"))
  {
    case 0:
    case 3:
      TRILogCategory_ClientFramework();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(v6, "progress");
        v15 = *(_QWORD *)(a1 + 32);
        v19 = 67109378;
        *(_DWORD *)v20 = v14;
        *(_WORD *)&v20[4] = 2112;
        *(_QWORD *)&v20[6] = v15;
        _os_log_debug_impl(&dword_19B89C000, v7, OS_LOG_TYPE_DEBUG, "received download progress %u for namespace %@", (uint8_t *)&v19, 0x12u);
      }

      v8 = *(_QWORD *)(a1 + 56);
      if (v8)
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, objc_msgSend(v6, "progress"));
      break;
    case 1:
      TRILogCategory_ClientFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        *(_QWORD *)v20 = v16;
        _os_log_debug_impl(&dword_19B89C000, v9, OS_LOG_TYPE_DEBUG, "received download completed notification for namespace %@", (uint8_t *)&v19, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 56);
      if (v10)
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, objc_msgSend(v6, "progressMaxValue"));
      +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:", v5);
      break;
    case 2:
      TRILogCategory_ClientFramework();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "error");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        *(_QWORD *)v20 = v17;
        *(_WORD *)&v20[8] = 2112;
        *(_QWORD *)&v20[10] = v18;
        _os_log_debug_impl(&dword_19B89C000, v11, OS_LOG_TYPE_DEBUG, "received download failed notification for namespace %@, error: %@", (uint8_t *)&v19, 0x16u);

      }
      v12 = *(_QWORD *)(a1 + 64);
      if (v12)
      {
        objc_msgSend(v6, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      }
      +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:", v5);
      objc_msgSend(*(id *)(a1 + 40), "removeUpdateHandlerForToken:", *(_QWORD *)(a1 + 48));
      break;
    default:
      break;
  }

}

- (id)sizesForFactors:(id)a3 withNamespaceName:(id)a4 forMetric:(unint64_t)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v53;
  void *v54;
  id *v55;
  id v56;
  unint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  TRIClient *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  id v71;
  id v72;
  _QWORD block[4];
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint8_t v85[128];
  uint8_t buf[4];
  id v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 932, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factors"));

    if (v13)
      goto LABEL_3;
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 933, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_53;
LABEL_3:
  if (qword_1ECED7FD0 != -1)
    dispatch_once(&qword_1ECED7FD0, &__block_literal_global_215);
  v14 = byte_1ECED7FB9;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke_2;
  block[3] = &unk_1E3C00320;
  v74 = &__block_literal_global_211;
  v59 = v13;
  if (qword_1ECED7FD8 == -1)
  {
    v15 = &__block_literal_global_211;
  }
  else
  {
    dispatch_once(&qword_1ECED7FD8, block);
    v15 = v74;
  }
  v16 = byte_1ECED7FBA;

  if (!(v16 | v14))
  {
    v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v92 = *MEMORY[0x1E0CB2D50];
    v93[0] = CFSTR("Process is not entitled for on-demand factor download, please see logs for details.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v42, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v43);

    v17 = v59;
    if (a6)
      *a6 = objc_retainAutorelease(v44);

    v45 = 0;
    goto LABEL_50;
  }
  v71 = 0;
  v72 = 0;
  v70 = 0;
  -[TRIClient _lazyInit](self, "_lazyInit");
  v17 = v59;
  if (!+[TRIFactorDownloadValidator validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:](TRIFactorDownloadValidator, "validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:", v11, v59, self->_paths, 0, self->_factorsState, &v71, 0, &v70, 0, 0, &v72))
  {
    TRILogCategory_ClientFramework();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v87 = v11;
      v88 = 2112;
      v89 = v59;
      v90 = 2112;
      v91 = v72;
      _os_log_impl(&dword_19B89C000, v46, OS_LOG_TYPE_INFO, "Download not allowed for factors:%@, namespace:%@. Error: %@", buf, 0x20u);
    }

    v45 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v72);
    goto LABEL_49;
  }
  v18 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v19 = v11;
  v64 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (!v64)
  {

LABEL_47:
    v45 = v18;
    v51 = 0;
    goto LABEL_48;
  }
  v57 = a5;
  v58 = v18;
  v55 = a6;
  v56 = v11;
  v65 = 0;
  v63 = *(_QWORD *)v67;
  v60 = *MEMORY[0x1E0CB2D50];
  v61 = self;
  v62 = v19;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v67 != v63)
        objc_enumerationMutation(v19);
      v21 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v20);
      v22 = (void *)MEMORY[0x1A1AC6B8C]();
      if (!-[TRIClient hasDownloadedNamespaceWithName:](self, "hasDownloadedNamespaceWithName:", v17))
      {
        v47 = (void *)MEMORY[0x1E0CB35C8];
        v83 = v60;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No active rollout or experiment found for factor %@"), v21);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v49);
        v50 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v22);
        v65 = (id)v50;
        goto LABEL_44;
      }
      +[TRINamespaceFactorProviderChain factorProviderWithPaths:namespaceName:excludingTreatmentLayers:](TRINamespaceFactorProviderChain, "factorProviderWithPaths:namespaceName:excludingTreatmentLayers:", self->_paths, v17, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "levelForFactor:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "fileOrDirectoryLevelWithIsDir:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v79 = v60;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Factor %@ is not file / directory typed"), v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v31);
          v33 = objc_claimAutoreleasedReturnValue();

          v27 = 0;
          v29 = 6;
          v65 = (id)v33;
          goto LABEL_26;
        }
        v27 = v26;
        if ((objc_msgSend(v26, "hasAsset") & 1) == 0)
        {
          v34 = (void *)MEMORY[0x1E0CB35C8];
          v77 = v60;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No asset metadata found for factor %@"), v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v31);
          v35 = objc_claimAutoreleasedReturnValue();

LABEL_25:
          v29 = 6;
          v65 = (id)v35;
          v17 = v59;
          goto LABEL_26;
        }
        objc_msgSend(v27, "asset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "hasSize") & 1) == 0)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v75 = v60;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No size found for asset of factor %@"), v21);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v37);
          v35 = objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        if (v57)
        {
          v29 = 0;
          goto LABEL_27;
        }
        v38 = (void *)MEMORY[0x1E0CB37E8];
        v39 = objc_msgSend(v28, "size");
        v40 = v38;
        v17 = v59;
        objc_msgSend(v40, "numberWithUnsignedLongLong:", v39);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v31, v21);
        v29 = 0;
      }
      else
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v81 = v60;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No level found for factor %@"), v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v28);
        v31 = v65;
        v29 = 6;
        v65 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_26:

      self = v61;
LABEL_27:

      objc_autoreleasePoolPop(v22);
      if (v29)
      {
        v19 = v62;
        goto LABEL_44;
      }
      ++v20;
      v19 = v62;
    }
    while (v64 != v20);
    v41 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    v64 = v41;
  }
  while (v41);
LABEL_44:

  v11 = v56;
  v18 = v58;
  v51 = v65;
  if (!v65)
    goto LABEL_47;
  if (v55)
  {
    v51 = objc_retainAutorelease(v65);
    v45 = 0;
    *v55 = v51;
  }
  else
  {
    v45 = 0;
  }
LABEL_48:

LABEL_49:
LABEL_50:

  return v45;
}

uint64_t __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v8;
  __CFString *v9;
  objc_class *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[TRIEntitlement objectForCurrentProcessEntitlement:](TRIEntitlement, "objectForCurrentProcessEntitlement:", CFSTR("com.apple.trial.client"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    TRILogCategory_ClientFramework();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = CFSTR("com.apple.trial.client");
      _os_log_error_impl(&dword_19B89C000, v1, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor download: <key>%@</key><array>    <string>...</string></array>", buf, 0xCu);
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    TRILogCategory_ClientFramework();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "processName");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v9;
      v18 = 2112;
      v19 = CFSTR("com.apple.trial.client");
      v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_19B89C000, v1, OS_LOG_TYPE_ERROR, "Process \"%@\" has incorrectly-typed entitlement \"%@\" (expected array of string, decoded %@)", buf, 0x20u);

    }
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = v0;
  v2 = -[NSObject countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_15;
        }
      }
      v3 = -[NSObject countByEnumeratingWithState:objects:count:](v1, "countByEnumeratingWithState:objects:count:", &v12, v22, 16);
      v6 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v6 = 1;
  }
LABEL_18:

  return v6;
}

void __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke_214()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_ClientFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECED7FB9 = objc_msgSend(v1, "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.private.security.storage.triald"), v2);

  objc_autoreleasePoolPop(v0);
}

void __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A1AC6B8C]();
  byte_1ECED7FBA = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)downloadLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 options:(id)a6 progress:(id)a7 completion:(id)a8
{
  __CFString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD, id);
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v15 = (__CFString *)a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = (void (**)(id, _QWORD, id))a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1077, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factors"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1078, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (qword_1ECED7FE0 != -1)
    dispatch_once(&qword_1ECED7FE0, &__block_literal_global_232);
  if (dword_1ECED7FBC)
  {
    v30 = 0;
    v31 = 0;
    v29 = 0;
    -[TRIClient _lazyInit](self, "_lazyInit");
    if (+[TRIFactorDownloadValidator validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:](TRIFactorDownloadValidator, "validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:", v15, v16, self->_paths, 0, self->_factorsState, &v30, 0, &v29, 0, 0, &v31))
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend(v21, "downloadLevelsForFactors:withNamespace:queue:factorsState:options:progress:completion:", v15, v16, v17, self->_factorsState, v18, v19, v20);

    }
    else
    {
      TRILogCategory_ClientFramework();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v33 = v15;
        v34 = 2112;
        v35 = v16;
        v36 = 2112;
        v37 = v31;
        _os_log_impl(&dword_19B89C000, v26, OS_LOG_TYPE_DEFAULT, "Download not allowed for factors:%@, namespace:%@. Error: %@", buf, 0x20u);
      }

      if (v20)
        v20[2](v20, 0, v31);
    }

  }
  else
  {
    TRILogCategory_ClientFramework();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = CFSTR("com.apple.trial.client");
      _os_log_error_impl(&dword_19B89C000, v22, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor download: <key>%@</key><array>...</array>", buf, 0xCu);
    }

    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Process is not entitled for on-demand factor download.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v24);

    if (v20)
      v20[2](v20, 0, v25);

  }
}

void __86__TRIClient_downloadLevelsForFactors_withNamespace_queue_options_progress_completion___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_ClientFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.private.security.storage.triald"), v2))
  {
    dword_1ECED7FBC = 1;
  }
  else
  {
    +[TRIEntitlement objectForCurrentProcessEntitlement:](TRIEntitlement, "objectForCurrentProcessEntitlement:", CFSTR("com.apple.trial.client"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dword_1ECED7FBC = v3 != 0;

  }
  objc_autoreleasePoolPop(v0);
}

- (void)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  TRIFactorsState *factorsState;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  char v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v14)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factors"));

  if (!v12)
    goto LABEL_10;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  -[TRIClient _lazyInit](self, "_lazyInit");
  v15 = (void *)objc_opt_new();
  factorsState = self->_factorsState;
  v26 = 0;
  v17 = objc_msgSend(v15, "removeLevelsForFactors:withNamespace:factorsState:removeImmediately:error:", v11, v12, factorsState, 0, &v26);
  v18 = v26;
  if (v14)
  {
    if (v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__TRIClient_removeLevelsForFactors_withNamespace_queue_completion___block_invoke;
      block[3] = &unk_1E3C00368;
      v24 = v14;
      v25 = v17;
      v23 = v18;
      dispatch_async(v13, block);

    }
    else
    {
      (*((void (**)(id, uint64_t, id))v14 + 2))(v14, v17, v18);
    }
  }

}

uint64_t __67__TRIClient_removeLevelsForFactors_withNamespace_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeLevelsForFactorsImmediately:(id)a3 withNamespace:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  TRIFactorsState *factorsState;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  char v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v14)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factors"));

  if (!v12)
    goto LABEL_10;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  -[TRIClient _lazyInit](self, "_lazyInit");
  v15 = (void *)objc_opt_new();
  factorsState = self->_factorsState;
  v26 = 0;
  v17 = objc_msgSend(v15, "removeLevelsForFactors:withNamespace:factorsState:removeImmediately:error:", v11, v12, factorsState, 1, &v26);
  v18 = v26;
  if (v14)
  {
    if (v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__TRIClient_removeLevelsForFactorsImmediately_withNamespace_queue_completion___block_invoke;
      block[3] = &unk_1E3C00368;
      v24 = v14;
      v25 = v17;
      v23 = v18;
      dispatch_async(v13, block);

    }
    else
    {
      (*((void (**)(id, uint64_t, id))v14 + 2))(v14, v17, v18);
    }
  }

}

uint64_t __78__TRIClient_removeLevelsForFactorsImmediately_withNamespace_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)setPurgeabilityLevelsForFactors:(id)a3 withNamespaceName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorsWithPurgeabilityLevels"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  if (-[TRIClient _hasAppropriatePermissionsForNamespaceName:](self, "_hasAppropriatePermissionsForNamespaceName:", v9))
  {
    v10 = (void *)objc_opt_new();
    v17 = 0;
    v11 = objc_msgSend(v10, "setPurgeabilityLevelsForFactors:forNamespaceName:error:", v7, v9, &v17);
    v12 = v17;
    if ((v11 & 1) == 0)
    {
      TRILogCategory_ClientFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v9;
        v20 = 2112;
        v21 = v12;
        _os_log_error_impl(&dword_19B89C000, v13, OS_LOG_TYPE_ERROR, "Failed to save purgeability levels for namespace %@ : %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)purgeabilityLevelsForFactorsWithNamespaceName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TRIClient _hasAppropriatePermissionsForNamespaceName:](self, "_hasAppropriatePermissionsForNamespaceName:", v5))
  {
    v7 = (void *)objc_opt_new();
    v19 = 0;
    objc_msgSend(v7, "loadNamespaceMetadataForNamespaceName:error:", v5, &v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    if (!v8)
    {
      TRILogCategory_ClientFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v5;
        v22 = 2112;
        v23 = v9;
        _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "Failed to save purgeability levels for namespace %@ : %@", buf, 0x16u);
      }

    }
    objc_msgSend(v8, "factorNamePurgeabilityLevels");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__TRIClient_purgeabilityLevelsForFactorsWithNamespaceName___block_invoke;
    v17[3] = &unk_1E3C00390;
    v12 = v6;
    v18 = v12;
    objc_msgSend(v11, "enumerateKeysAndEnumsUsingBlock:", v17);

    v13 = v18;
    v14 = v12;

  }
  return v6;
}

void __59__TRIClient_purgeabilityLevelsForFactorsWithNamespaceName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithInt:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (BOOL)setFactorsProvisionalForNamespace:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v13;
  id v14;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIDefaultFactorProvider promotableFactorPackIdForNamespaceName:](self->_defaultFactorProvider, "promotableFactorPackIdForNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v11 = 0;
    v10 = 1;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = (void *)objc_opt_new();
  v14 = 0;
  v10 = objc_msgSend(v9, "setProvisionalFactorPackId:forNamespaceName:error:", v8, v7, &v14);
  v11 = v14;

  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v11);
LABEL_6:

  return v10;
}

- (BOOL)promoteFactorsForNamespace:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v17;
  id v18;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRIClient _lazyInit](self, "_lazyInit");
  -[TRIDefaultFactorProvider promotableFactorPackIdForNamespaceName:](self->_defaultFactorProvider, "promotableFactorPackIdForNamespaceName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v13 = 0;
    v14 = 1;
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[TRIClient rolloutIdentifiersWithNamespaceName:](self, "rolloutIdentifiersWithNamespaceName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "rolloutId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIRolloutDeployment deploymentWithRolloutId:deploymentId:](TRIRolloutDeployment, "deploymentWithRolloutId:deploymentId:", v11, objc_msgSend(v10, "deploymentId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v15 = (void *)objc_opt_new();
  v18 = 0;
  v14 = objc_msgSend(v15, "promoteFactorPackId:forNamespaceName:rolloutDeployment:error:", v8, v7, v12, &v18);
  v13 = v18;

  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v13);
LABEL_11:

  return v14;
}

- (unint64_t)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 token:(id *)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _BYTE v64[128];
  _BYTE buf[12];
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;
  _QWORD v71[4];

  v71[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (a5)
    *a5 = 0;
  if (v15)
  {
    if (v16)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factors"));

    if (v16)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClient.m"), 1307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_5:
  v20 = MEMORY[0x1E0C809B0];
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke;
  v61[3] = &unk_1E3C003B8;
  v49 = v19;
  v63 = v49;
  v21 = v17;
  v62 = v21;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AC6D30](v61);
  if (qword_1ECED7FE8 != -1)
    dispatch_once(&qword_1ECED7FE8, &__block_literal_global_242);
  if (dword_1ECED7FC0)
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    -[TRIClient _lazyInit](self, "_lazyInit");
    if (+[TRIFactorDownloadValidator validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:](TRIFactorDownloadValidator, "validateDownloadForFactors:withNamespace:paths:container:factorsState:assetIndexesByTreatment:experimentIds:assetIdsByFactorPack:rolloutFactorNames:rolloutDeployments:error:", v15, v16, self->_paths, 0, self->_factorsState, &v59, 0, &v58, 0, 0, &v60))
    {
      if (objc_msgSend(v59, "count") || objc_msgSend(v58, "count"))
      {
        v51[0] = v20;
        v51[1] = 3221225472;
        v51[2] = __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_245;
        v51[3] = &unk_1E3BFE7B0;
        v23 = v18;
        v52 = v18;
        v53 = v49;
        v24 = (void *)MEMORY[0x1A1AC6D30](v51);
        *(_QWORD *)buf = 0;
        v50 = 0;
        v25 = (void *)objc_opt_new();
        v26 = objc_msgSend(v25, "statusOfDownloadForFactors:withNamespace:factorsState:notificationKey:error:", v15, v16, self->_factorsState, buf, &v50);
        v27 = v26;
        if ((unint64_t)(v26 - 2) < 2)
        {
          if (*(_QWORD *)buf)
          {
            +[TRIDownloadNotification registerDownloadNotificationForKey:queue:usingBlock:](TRIDownloadNotification, "registerDownloadNotificationForKey:queue:usingBlock:", *(_QWORD *)buf, v21, v24);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (a5)
              *a5 = objc_retainAutorelease(v33);

          }
        }
        else if (v26)
        {
          if (v26 == 1)
            v22[2](v22, 0, 0);
        }
        else
        {
          ((void (**)(_QWORD, _QWORD, id))v22)[2](v22, 0, v50);
        }

        v18 = v23;
      }
      else
      {
        v47 = v21;
        v48 = v18;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v36 = v15;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v55;
          while (2)
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v55 != v39)
                objc_enumerationMutation(v36);
              -[TRIDefaultFactorProvider levelForFactor:withNamespaceName:](self->_defaultFactorProvider, "levelForFactor:withNamespaceName:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), v16);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                v42 = v41;
                objc_msgSend(v41, "fileOrDirectoryLevelWithIsDir:", 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v43;
                if (v43 && !objc_msgSend(v43, "hasAsset"))
                {
                  v22[2](v22, 0, 0);

                  v27 = 1;
                  goto LABEL_42;
                }

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
            if (v38)
              continue;
            break;
          }
        }

        v22[2](v22, 1, 0);
        v27 = 4;
LABEL_42:
        v21 = v47;
        v18 = v48;
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v15;
        v66 = 2112;
        v67 = v16;
        v68 = 2112;
        v69 = v60;
        _os_log_impl(&dword_19B89C000, v32, OS_LOG_TYPE_INFO, "Download not allowed for factors:%@, namespace:%@. Error: %@", buf, 0x20u);
      }

      ((void (**)(_QWORD, _QWORD, id))v22)[2](v22, 0, v60);
      v27 = 0;
    }

  }
  else
  {
    TRILogCategory_ClientFramework();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("com.apple.trial.client");
      _os_log_error_impl(&dword_19B89C000, v28, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor status: <key>%@</key><array>...</array>", buf, 0xCu);
    }

    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v70 = *MEMORY[0x1E0CB2D50];
    v71[0] = CFSTR("Process is not entitled for on-demand factor status.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v30);

    ((void (**)(_QWORD, _QWORD, void *))v22)[2](v22, 0, v31);
    v27 = 0;
  }

  return v27;
}

void __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  _QWORD block[4];
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  char v11;

  v5 = a3;
  v6 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_2;
      block[3] = &unk_1E3C00368;
      v10 = v6;
      v11 = a2;
      v9 = v5;
      dispatch_async(v7, block);

    }
    else
    {
      ((void (**)(_QWORD, uint64_t, id))v6)[2](v6, a2, v5);
    }
  }

}

uint64_t __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = (void *)MEMORY[0x1E0D815A8];
  TRILogCategory_ClientFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasTrueBooleanEntitlement:logHandle:", CFSTR("com.apple.private.security.storage.triald"), v2))
  {
    dword_1ECED7FC0 = 1;
  }
  else
  {
    +[TRIEntitlement objectForCurrentProcessEntitlement:](TRIEntitlement, "objectForCurrentProcessEntitlement:", CFSTR("com.apple.trial.client"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dword_1ECED7FC0 = v3 != 0;

  }
  objc_autoreleasePoolPop(v0);
}

void __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_245(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __n128 v14;
  id v15;

  v15 = a2;
  v5 = a3;
  switch(objc_msgSend(v5, "type"))
  {
    case 0:
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v7.n128_f64[0] = (double)(unint64_t)objc_msgSend(v5, "progress") / 100.0;
        (*(void (**)(uint64_t, uint64_t, __n128))(v6 + 16))(v6, 2, v7);
      }
      break;
    case 1:
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        (*(void (**)(uint64_t, uint64_t, double))(v8 + 16))(v8, 4, 1.0);
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, 1, 0);
      goto LABEL_12;
    case 2:
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        (*(void (**)(uint64_t, uint64_t, double))(v10 + 16))(v10, 1, (double)(unint64_t)objc_msgSend(v5, "progress") / 100.0);
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
        objc_msgSend(v5, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

      }
LABEL_12:
      +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:", v15);
      break;
    case 3:
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
      {
        v14.n128_f64[0] = (double)(unint64_t)objc_msgSend(v5, "progress") / 100.0;
        (*(void (**)(uint64_t, uint64_t, __n128))(v13 + 16))(v13, 3, v14);
      }
      break;
    default:
      break;
  }

}

- (void)removeDownloadStatusHandlersWithToken:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[TRIClient _lazyInit](self, "_lazyInit");
    +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:", v4);

  }
}

- (id)factorLevelsWithNamespace:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient factorLevelsWithNamespaceName:](self, "factorLevelsWithNamespaceName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addUpdateHandlerForNamespaceId:(unsigned int)a3 usingBlock:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0DC0F18];
  v7 = a4;
  objc_msgSend(v6, "namespaceNameFromId:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:](self, "addUpdateHandlerForNamespaceName:queue:usingBlock:", v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)addUpdateHandlerForNamespaceId:(unsigned int)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = *(_QWORD *)&a3;
  v8 = (void *)MEMORY[0x1E0DC0F18];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "namespaceNameFromId:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:](self, "addUpdateHandlerForNamespaceName:queue:usingBlock:", v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)treatmentIdWithNamespace:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient treatmentIdWithNamespaceName:](self, "treatmentIdWithNamespaceName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)experimentIdWithNamespace:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[TRIClient _lazyInit](self, "_lazyInit");
  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient experimentIdWithNamespaceName:](self, "experimentIdWithNamespaceName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)downloadNamespaceWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  -[TRIClient downloadNamespaceWithName:options:progress:completion:](self, "downloadNamespaceWithName:options:progress:completion:", a3, a4, 0, a5);
}

+ (id)activeRolloutInformation:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "activeRolloutInformation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)printedRolloutInformation:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *context;
  uint64_t v71;
  _QWORD v73[4];
  id v74;
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
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIClient activeRolloutInformation:](TRIClient, "activeRolloutInformation:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("unable to get rollout info"), 0);
LABEL_35:
    v57 = (id)v58;
    goto LABEL_36;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("no rollouts"), 0);
    goto LABEL_35;
  }
  objc_msgSend(v4, "addObject:", CFSTR("rollouts:"));
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v60 = v6;
  obj = v6;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  if (!v63)
    goto LABEL_32;
  v62 = *(_QWORD *)v84;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v84 != v62)
        objc_enumerationMutation(obj);
      v65 = v7;
      v8 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v7);
      objc_msgSend(v8, "objectForKey:", CFSTR("deploymentId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "objectForKey:", CFSTR("rolloutId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v9;
      v12 = objc_msgSend(v9, "intValue");
      if (v12)
        v13 = v12;
      else
        v13 = 0xFFFFFFFFLL;
      v14 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("    - rollout: %@.%d"), v11, v13);
      objc_msgSend(v4, "addObject:", v14);

      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "objectForKey:", CFSTR("rampId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("      rampId: %@"), v16);
      objc_msgSend(v4, "addObject:", v17);

      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "objectForKey:", CFSTR("status"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("      status: %@"), v19);
      objc_msgSend(v4, "addObject:", v20);

      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "objectForKey:", CFSTR("activeFactorPackSetId"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("      activeFactorPackSetid: %@"), v22);
      objc_msgSend(v4, "addObject:", v23);

      objc_msgSend(v4, "addObject:", CFSTR("      namespaces:"));
      objc_msgSend(v8, "objectForKey:", CFSTR("namespaces"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v66 = v24;
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      if (v68)
      {
        v67 = *(_QWORD *)v80;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v80 != v67)
              objc_enumerationMutation(v66);
            v71 = v25;
            v26 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v25);
            context = (void *)MEMORY[0x1A1AC6B8C]();
            objc_msgSend(v26, "objectForKey:", CFSTR("name"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("       - namespace: %@"), v69);
            objc_msgSend(v4, "addObject:", v27);

            v28 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v26, "objectForKey:", CFSTR("ncvs"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("         NCVs: [%@]"), v30);
            objc_msgSend(v4, "addObject:", v31);

            v32 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v26, "objectForKey:", CFSTR("factorPackId"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("         factorPackId: %@"), v33);
            objc_msgSend(v4, "addObject:", v34);

            objc_msgSend(v4, "addObject:", CFSTR("         factors:"));
            objc_msgSend(v26, "objectForKey:", CFSTR("factors"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = 0u;
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v36 = v35;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v76;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v76 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
                  v42 = (void *)MEMORY[0x1A1AC6B8C]();
                  v43 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v41, "objectForKey:", CFSTR("name"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("          - factor: %@"), v44);
                  objc_msgSend(v4, "addObject:", v45);

                  v46 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v41, "objectForKey:", CFSTR("type"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("            type: %@"), v47);
                  objc_msgSend(v4, "addObject:", v48);

                  LODWORD(v47) = objc_msgSend(a1, "_isFactorRecordFileType:", v41);
                  v49 = objc_alloc(MEMORY[0x1E0CB3940]);
                  if ((_DWORD)v47)
                  {
                    objc_msgSend(v41, "objectForKey:", CFSTR("assetReference"));
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("            assetReference: %@"), v50);
                    objc_msgSend(v4, "addObject:", v51);

                    v52 = objc_alloc(MEMORY[0x1E0CB3940]);
                    objc_msgSend(v41, "objectForKey:", CFSTR("path"));
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v54 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("            path: %@"), v53);
                    objc_msgSend(v4, "addObject:", v54);

                    objc_msgSend(v4, "addObject:", CFSTR("            metadata:"));
                    objc_msgSend(v41, "objectForKey:", CFSTR("metadata"));
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v55)
                      goto LABEL_26;
                    v73[0] = MEMORY[0x1E0C809B0];
                    v73[1] = 3221225472;
                    v73[2] = __39__TRIClient_printedRolloutInformation___block_invoke;
                    v73[3] = &unk_1E3BFFAB8;
                    v74 = v4;
                    objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v73);
                    v56 = v74;
                  }
                  else
                  {
                    objc_msgSend(v41, "objectForKey:", CFSTR("levelValue"));
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("            levelValue: %@"), v55);
                    objc_msgSend(v4, "addObject:", v56);
                  }

LABEL_26:
                  objc_autoreleasePoolPop(v42);
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
              }
              while (v38);
            }

            objc_autoreleasePoolPop(context);
            v25 = v71 + 1;
          }
          while (v71 + 1 != v68);
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        }
        while (v68);
      }

      v7 = v65 + 1;
    }
    while (v65 + 1 != v63);
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  }
  while (v63);
LABEL_32:

  v57 = v4;
  v6 = v60;
LABEL_36:

  return v57;
}

void __39__TRIClient_printedRolloutInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("              %@: %@"), v7, v6);

  objc_msgSend(v4, "addObject:", v8);
}

+ (id)activeExperimentInformation:(id *)a3
{
  return +[TRIAllocationStatus activeExperimentInformationWithError:](TRIAllocationStatus, "activeExperimentInformationWithError:", a3);
}

+ (id)printedExperimentInformation:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *context;
  uint64_t v59;
  _QWORD v61[4];
  id v62;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activeExperimentInformation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("unable to get experiment info"), 0);
LABEL_38:
    v5 = (void *)v46;
    goto LABEL_39;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("no experiments"), 0);
    goto LABEL_38;
  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", CFSTR("experiments:"));
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v48 = v4;
  obj = v4;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (!v51)
    goto LABEL_35;
  v50 = *(_QWORD *)v72;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v72 != v50)
        objc_enumerationMutation(obj);
      v53 = v6;
      v7 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v6);
      objc_msgSend(v7, "objectForKey:", CFSTR("deploymentId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v7, "objectForKey:", CFSTR("experiment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v8;
      v11 = objc_msgSend(v8, "intValue");
      if (v11)
        v12 = v11;
      else
        v12 = 0xFFFFFFFFLL;
      v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("    - experiment: %@.%d"), v10, v12);
      objc_msgSend(v5, "addObject:", v13);

      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v7, "objectForKey:", CFSTR("treatmentId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("      treatment : %@"), v15);
      objc_msgSend(v5, "addObject:", v16);

      objc_msgSend(v5, "addObject:", CFSTR("      namespaces:"));
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v7, "objectForKey:", CFSTR("namespaces"));
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      if (v56)
      {
        v55 = *(_QWORD *)v68;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v68 != v55)
              objc_enumerationMutation(v54);
            v59 = v17;
            v18 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v17);
            context = (void *)MEMORY[0x1A1AC6B8C]();
            objc_msgSend(v18, "objectForKey:", CFSTR("compatibility"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v18, "objectForKey:", CFSTR("name"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v19;
            v22 = objc_msgSend(v19, "intValue");
            if (v22)
              v23 = v22;
            else
              v23 = 0xFFFFFFFFLL;
            v24 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("       - namespace: %@.%d"), v21, v23);
            objc_msgSend(v5, "addObject:", v24);

            objc_msgSend(v5, "addObject:", CFSTR("         factors:"));
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v18, "objectForKey:", CFSTR("factors"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v64;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v64 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                  v31 = (void *)MEMORY[0x1A1AC6B8C]();
                  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v30, "objectForKey:", CFSTR("name"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("          - factor: %@"), v33);
                  objc_msgSend(v5, "addObject:", v34);

                  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v30, "objectForKey:", CFSTR("type"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("            type: %@"), v36);
                  objc_msgSend(v5, "addObject:", v37);

                  LODWORD(v37) = objc_msgSend(a1, "_isFactorRecordFileType:", v30);
                  v38 = objc_alloc(MEMORY[0x1E0CB3940]);
                  if ((_DWORD)v37)
                  {
                    objc_msgSend(v30, "objectForKey:", CFSTR("assetReference"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("            assetReference: %@"), v39);
                    objc_msgSend(v5, "addObject:", v40);

                    v41 = objc_alloc(MEMORY[0x1E0CB3940]);
                    objc_msgSend(v30, "objectForKey:", CFSTR("path"));
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = (void *)objc_msgSend(v41, "initWithFormat:", CFSTR("            path: %@"), v42);
                    objc_msgSend(v5, "addObject:", v43);

                    objc_msgSend(v5, "addObject:", CFSTR("            metadata:"));
                    objc_msgSend(v30, "objectForKey:", CFSTR("metadata"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v44)
                      goto LABEL_29;
                    v61[0] = MEMORY[0x1E0C809B0];
                    v61[1] = 3221225472;
                    v61[2] = __42__TRIClient_printedExperimentInformation___block_invoke;
                    v61[3] = &unk_1E3BFFAB8;
                    v62 = v5;
                    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v61);
                    v45 = v62;
                  }
                  else
                  {
                    objc_msgSend(v30, "objectForKey:", CFSTR("levelValue"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("            levelValue: %@"), v44);
                    objc_msgSend(v5, "addObject:", v45);
                  }

LABEL_29:
                  objc_autoreleasePoolPop(v31);
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
              }
              while (v27);
            }

            objc_autoreleasePoolPop(context);
            v17 = v59 + 1;
          }
          while (v59 + 1 != v56);
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        }
        while (v56);
      }

      v6 = v53 + 1;
    }
    while (v53 + 1 != v51);
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  }
  while (v51);
LABEL_35:

  v4 = v48;
LABEL_39:

  return v5;
}

void __42__TRIClient_printedExperimentInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("              %@: %@"), v7, v6);

  objc_msgSend(v4, "addObject:", v8);
}

+ (BOOL)_isFactorRecordFileType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("assetReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("type"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(CFSTR("file"), "isEqual:", v7);

    }
  }

  return v5;
}

+ (id)activeBMLTInformation:(id *)a3
{
  return +[TRIAllocationStatus activeBMLTInformationWithError:](TRIAllocationStatus, "activeBMLTInformationWithError:", a3);
}

+ (id)printedBMLTInformation:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *context;
  uint64_t v62;
  id v63;
  _QWORD v65[4];
  id v66;
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
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activeBMLTInformation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("unable to get BMLT info"), 0);
LABEL_37:
    v5 = (void *)v51;
    goto LABEL_38;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("no BMLTs"), 0);
    goto LABEL_37;
  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", CFSTR("BMLTs:"));
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v4;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (!v55)
    goto LABEL_34;
  v54 = *(_QWORD *)v76;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v76 != v54)
        objc_enumerationMutation(obj);
      v57 = v6;
      v7 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v6);
      objc_msgSend(v7, "objectForKey:", CFSTR("deploymentId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v7, "objectForKey:", CFSTR("bmltId"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v8;
      v11 = objc_msgSend(v8, "intValue");
      if (v11)
        v12 = v11;
      else
        v12 = 0xFFFFFFFFLL;
      v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("    - bmlt: %@.%d"), v10, v12);
      objc_msgSend(v5, "addObject:", v13);

      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v7, "objectForKey:", CFSTR("status"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("      status: %@"), v15);
      objc_msgSend(v5, "addObject:", v16);

      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v7, "objectForKey:", CFSTR("activeFactorPackSetId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("      activeFactorPackSetid: %@"), v18);
      objc_msgSend(v5, "addObject:", v19);

      objc_msgSend(v5, "addObject:", CFSTR("      namespaces:"));
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend(v7, "objectForKey:", CFSTR("namespaces"));
      v58 = (id)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (v60)
      {
        v59 = *(_QWORD *)v72;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v72 != v59)
              objc_enumerationMutation(v58);
            v62 = v20;
            v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v20);
            context = (void *)MEMORY[0x1A1AC6B8C]();
            v22 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v21, "objectForKey:", CFSTR("name"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("       - namespace: %@"), v23);
            objc_msgSend(v5, "addObject:", v24);

            v25 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v21, "objectForKey:", CFSTR("ncvs"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("         NCVs: [%@]"), v27);
            objc_msgSend(v5, "addObject:", v28);

            objc_msgSend(v5, "addObject:", CFSTR("         factors:"));
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            objc_msgSend(v21, "objectForKey:", CFSTR("factors"));
            v63 = (id)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v68;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v68 != v31)
                    objc_enumerationMutation(v63);
                  v33 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
                  v34 = (void *)MEMORY[0x1A1AC6B8C]();
                  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v33, "objectForKey:", CFSTR("name"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("          - factor: %@"), v36);
                  objc_msgSend(v5, "addObject:", v37);

                  v38 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v33, "objectForKey:", CFSTR("type"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("            type: %@"), v39);
                  objc_msgSend(v5, "addObject:", v40);

                  if (!objc_msgSend(a1, "_isFactorRecordFileType:", v33))
                  {
                    objc_msgSend(v33, "objectForKey:", CFSTR("name"));
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v49)
                      goto LABEL_28;
                    v50 = objc_alloc(MEMORY[0x1E0CB3940]);
                    objc_msgSend(v33, "objectForKey:", CFSTR("levelValue"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v48 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("            levelValue: %@"), v47);
                    objc_msgSend(v5, "addObject:", v48);
                    goto LABEL_26;
                  }
                  v41 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v33, "objectForKey:", CFSTR("assetReference"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = (void *)objc_msgSend(v41, "initWithFormat:", CFSTR("            assetReference: %@"), v42);
                  objc_msgSend(v5, "addObject:", v43);

                  v44 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v33, "objectForKey:", CFSTR("path"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("            path: %@"), v45);
                  objc_msgSend(v5, "addObject:", v46);

                  objc_msgSend(v5, "addObject:", CFSTR("            metadata:"));
                  objc_msgSend(v33, "objectForKey:", CFSTR("metadata"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
                  {
                    v65[0] = MEMORY[0x1E0C809B0];
                    v65[1] = 3221225472;
                    v65[2] = __36__TRIClient_printedBMLTInformation___block_invoke;
                    v65[3] = &unk_1E3BFFAB8;
                    v66 = v5;
                    objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v65);
                    v48 = v66;
LABEL_26:

                  }
LABEL_28:
                  objc_autoreleasePoolPop(v34);
                }
                v30 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
              }
              while (v30);
            }

            objc_autoreleasePoolPop(context);
            v20 = v62 + 1;
          }
          while (v62 + 1 != v60);
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        }
        while (v60);
      }

      v6 = v57 + 1;
    }
    while (v57 + 1 != v55);
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  }
  while (v55);
LABEL_34:

LABEL_38:
  return v5;
}

void __36__TRIClient_printedBMLTInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("              %@: %@"), v7, v6);

  objc_msgSend(v4, "addObject:", v8);
}

+ (id)printedNCVInformation
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "addObject:", CFSTR("NCVs:"));
  +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namespaceDescriptorsDefaultDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptor descriptorsForDirectory:filterBlock:](TRINamespaceDescriptor, "descriptorsForDirectory:filterBlock:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_350);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A1AC6B8C]();
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v11, "namespaceName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("    - %@"), v14);
        objc_msgSend(v2, "addObject:", v15);

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("       downloadNCV: %u"), objc_msgSend(v11, "downloadNCV"));
        objc_msgSend(v2, "addObject:", v16);

        objc_msgSend(v11, "upgradeNCVs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v11, "upgradeNCVs");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "allObjects");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("       upgradeNCVs: [%@]"), v21);
          objc_msgSend(v2, "addObject:", v22);

        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v2;
}

uint64_t __34__TRIClient_printedNCVInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "namespaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)printedOnDemandReferenceCountsPerUserInformationWithError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_opt_new();
  +[TRIStandardPaths sharedSystemPaths](TRIStandardPaths, "sharedSystemPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "treatmentsDirUsingGlobal:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getOnDemandReferenceCountsPerUserAtGlobalPath:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a3)
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*a3, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Could not get the on-demand references: %@", buf, 0xCu);

    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("unable to get on-demand reference counts per user"), 0);
  }
  else
  {
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v4, "addObject:", CFSTR("on-demand reference per user:"));
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke;
      v15[3] = &unk_1E3C00488;
      v12 = v4;
      v16 = v12;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
      v11 = v12;

      goto LABEL_8;
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("no on-demand references"), 0);
  }
  v11 = (id)v10;
LABEL_8:

  return v11;
}

void __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("    - %@"), v8);

  objc_msgSend(v5, "addObject:", v9);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_2;
  v10[3] = &unk_1E3C00488;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a2;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("       factorPackId: %@"), v7);

  objc_msgSend(v5, "addObject:", v8);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("       factors:"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_3;
    v10[3] = &unk_1E3C00460;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("       - %@: [%@]"), v7, v10);
  objc_msgSend(v4, "addObject:", v9);

}

+ (id)sysdiagnoseInfoWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "printedNCVInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  +[TRIClient printedRolloutInformation:](TRIClient, "printedRolloutInformation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  +[TRIClient printedExperimentInformation:](TRIClient, "printedExperimentInformation:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObjectsFromArray:", v7);
  +[TRIClient printedBMLTInformation:](TRIClient, "printedBMLTInformation:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addObjectsFromArray:", v8);
  +[TRIClient logSystemCovariates](TRIClient, "logSystemCovariates");
  +[TRIClient printCurrentSettings](TRIClient, "printCurrentSettings");
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_sysdiagnoseLogProviders
{
  TRIBlockBasedSysdiagnoseInfoProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  TRIBlockBasedSysdiagnoseInfoProvider *v6;
  TRIBlockBasedSysdiagnoseInfoProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = -[TRIBlockBasedSysdiagnoseInfoProvider initWithOutputFilename:block:]([TRIBlockBasedSysdiagnoseInfoProvider alloc], "initWithOutputFilename:block:", CFSTR("trial-namespace-compatibility-versions.log"), &__block_literal_global_377);
  v13[0] = v2;
  v3 = (void *)objc_opt_new();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = -[TRIBlockBasedSysdiagnoseInfoProvider initWithOutputFilename:block:]([TRIBlockBasedSysdiagnoseInfoProvider alloc], "initWithOutputFilename:block:", CFSTR("trial-rollout-info.log"), &__block_literal_global_381);
  v7 = -[TRIBlockBasedSysdiagnoseInfoProvider initWithOutputFilename:block:]([TRIBlockBasedSysdiagnoseInfoProvider alloc], "initWithOutputFilename:block:", CFSTR("trial-experiment-info.log"), &__block_literal_global_384, v6);
  v12[1] = v7;
  +[TRIExperimentHistorySysdiagnoseProvider defaultProvider](TRIExperimentHistorySysdiagnoseProvider, "defaultProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v9);
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

id __37__TRIClient__sysdiagnoseLogProviders__block_invoke()
{
  return +[TRIClient printedNCVInformation](TRIClient, "printedNCVInformation");
}

id __37__TRIClient__sysdiagnoseLogProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TRIClient printedRolloutInformation:](TRIClient, "printedRolloutInformation:", a2);
}

id __37__TRIClient__sysdiagnoseLogProviders__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[TRIClient printedExperimentInformation:](TRIClient, "printedExperimentInformation:", a2);
}

+ (BOOL)sysdiagnoseInfoToDir:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  TRISysdiagnoseLogWriter *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  BOOL v16;
  id v17;
  BOOL v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_sysdiagnoseLogProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TRISysdiagnoseLogWriter initWithDirectory:]([TRISysdiagnoseLogWriter alloc], "initWithDirectory:", v6);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1A1AC6B8C]();
        v20 = 0;
        v16 = -[TRISysdiagnoseLogWriter writeSysdiagnoseInfoForProvider:error:](v8, "writeSysdiagnoseInfoForProvider:error:", v14, &v20);
        v17 = v20;
        objc_autoreleasePoolPop(v15);
        if (!v16)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v17);

          v18 = 0;
          goto LABEL_13;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }

  +[TRIClient logSystemCovariates](TRIClient, "logSystemCovariates");
  +[TRIClient printCurrentSettings](TRIClient, "printCurrentSettings");
  v18 = 1;
LABEL_13:

  return v18;
}

+ (void)printCurrentSettings
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  __CFString *v5;
  int64_t v6;
  NSObject *v7;
  __CFString *v8;
  uint8_t buf[4];
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[TRISystemConfiguration sharedInstance](TRISystemConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "populationType");

  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E3C00528[(int)v3];
    }
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_19B89C000, v4, OS_LOG_TYPE_DEFAULT, "Current population is %@", buf, 0xCu);

  }
  v6 = +[TRICEnvironmentManager currentEnv](TRICEnvironmentManager, "currentEnv");
  TRILogCategory_ClientFramework();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[TRICEnvironmentManager envToString:](TRICEnvironmentManager, "envToString:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_impl(&dword_19B89C000, v7, OS_LOG_TYPE_DEFAULT, "Current CloudKit environment is %@", buf, 0xCu);

  }
}

- (BOOL)evaluateBMLTTargetingExpression:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "nsexpressionLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasAssignmentExpression") & 1) != 0)
  {
    objc_msgSend(v7, "nsexpressionLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assignmentExpression");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v7, "nsexpressionLanguage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "assignmentExpression");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1A1AC6B8C]();
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v15);
      v17 = (void *)MEMORY[0x1A1AC6B8C]();
      objc_msgSend(v16, "expressionValueWithObject:context:", v8, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v17);
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("enroll"));
      if ((_DWORD)v19)
      {
        TRILogCategory_ClientFramework();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          v21 = "successfully parsed BMLT assignment string %@ to ENROLL";
LABEL_13:
          _os_log_impl(&dword_19B89C000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
        }
      }
      else
      {
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("ignore")))
        {
LABEL_15:

          -[TRIClient _logBMLTCustomTargetingWithResult:](self, "_logBMLTCustomTargetingWithResult:", v19);
          goto LABEL_16;
        }
        TRILogCategory_ClientFramework();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v14;
          v21 = "successfully parsed BMLT assignment string %@ to IGNORE";
          goto LABEL_13;
        }
      }

      goto LABEL_15;
    }
  }
  else
  {

  }
  TRILogCategory_ClientFramework();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B89C000, v22, OS_LOG_TYPE_DEFAULT, "assignment string is missing or empty", buf, 2u);
  }

  -[TRIClient _logBMLTCustomTargetingWithResult:](self, "_logBMLTCustomTargetingWithResult:", 0);
  LOBYTE(v19) = 0;
LABEL_16:

  return v19;
}

- (void)_logBMLTCustomTargetingWithResult:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  TRILogger *logger;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_logger)
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("bmlt_custom_targeting"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

    logger = self->_logger;
    -[TRIClient trackingId](self, "trackingId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRILogger logWithTrackingId:metrics:dimensions:trialSystemTelemetry:](logger, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v9, v7, 0, 0);

  }
}

+ (void)logSystemCovariates
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "logSystemCovariatesWithError:", &v4);
  if (v4)
  {
    TRILogCategory_ClientFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v4;
      _os_log_impl(&dword_19B89C000, v3, OS_LOG_TYPE_DEFAULT, "Could not log covariates -- %@", buf, 0xCu);
    }

  }
}

+ (id)getSandboxExtensionTokensForIdentifierQueryWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (+[TRIProcessInfo hostingProcessIsCoreAnalytics](TRIProcessInfo, "hostingProcessIsCoreAnalytics"))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "getSandboxExtensionTokensForIdentifierQueryWithError:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = CFSTR("Process is not allowlisted to access getSandboxExtensionTokensForIdentifierQueryWithError, please contact Trial team to request access if necessary.");
      _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, "Error generating sandbox tokens: %@", buf, 0xCu);
    }

    if (a3)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v10 = *MEMORY[0x1E0CB2D50];
      v11 = CFSTR("Process is not allowlisted to access getSandboxExtensionTokensForIdentifierQueryWithError, please contact Trial team to request access if necessary.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 16, v8);

    }
    v5 = (void *)objc_opt_new();
  }
  return v5;
}

- (TRILogger)logger
{
  return self->_logger;
}

@end
