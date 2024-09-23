@implementation TRILatencyMetricTelemetryValidator

- (TRILatencyMetricTelemetryValidator)initWithRolloutDatabase:(id)a3 paths:(id)a4
{
  id v7;
  id v8;
  TRILatencyMetricTelemetryValidator *v9;
  TRILatencyMetricTelemetryValidator *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *namespacesAllowedForLogging;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TRILatencyMetricTelemetryValidator;
  v9 = -[TRILatencyMetricTelemetryValidator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutDb, a3);
    +[TRISetupAssistantFetchUtils getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:](TRISetupAssistantFetchUtils, "getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (NSSet *)objc_opt_new();
    namespacesAllowedForLogging = v10->_namespacesAllowedForLogging;
    v10->_namespacesAllowedForLogging = v13;

  }
  return v10;
}

- (BOOL)_isRecordContainingAllowedLoggingNamespace:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a3, "artifact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "namespaceNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[TRILatencyMetricTelemetryValidator namespacesAllowedForLogging](self, "namespacesAllowedForLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Intersecting artifact namespaces: %@ with relevant namespaces: %@ for telemetry", (uint8_t *)&v12, 0x16u);

  }
  -[TRILatencyMetricTelemetryValidator namespacesAllowedForLogging](self, "namespacesAllowedForLogging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intersectSet:", v10);

  LOBYTE(v10) = objc_msgSend(v7, "count") != 0;
  return (char)v10;
}

- (id)createRolloutFieldForDeployment:(id)a3 factorPackSetId:(id)a4 record:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "rolloutId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setClientRolloutId:", v11);
  loggableFactorPackSetIdFromFactorPackSetId(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClientFactorPackSetId:", v12);

  objc_msgSend(v8, "rampId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v8, "rampId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClientRampId:", v14);

  }
  objc_msgSend(v8, "activeFactorPackSetId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", v15))
    goto LABEL_6;
  objc_msgSend(v8, "activeTargetingRuleIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v8, "targetedTargetingRuleIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClientTargetingRuleGroupOrdinal:", objc_msgSend(v15, "intValue"));
LABEL_6:

  }
  return v10;
}

- (id)validateAndReturnTelemetryForDeployment:(id)a3 factorPackSetId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TRILatencyMetricTelemetryValidator rolloutDb](self, "rolloutDb");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordWithDeployment:usingTransaction:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v6;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unexpected failure to find record for rollout deployment %{public}@.", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_7;
  }
  if (!-[TRILatencyMetricTelemetryValidator _isRecordContainingAllowedLoggingNamespace:](self, "_isRecordContainingAllowedLoggingNamespace:", v9))
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  -[TRILatencyMetricTelemetryValidator createRolloutFieldForDeployment:factorPackSetId:record:](self, "createRolloutFieldForDeployment:factorPackSetId:record:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

- (TRIRolloutDatabase)rolloutDb
{
  return self->_rolloutDb;
}

- (NSSet)namespacesAllowedForLogging
{
  return self->_namespacesAllowedForLogging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespacesAllowedForLogging, 0);
  objc_storeStrong((id *)&self->_rolloutDb, 0);
}

@end
