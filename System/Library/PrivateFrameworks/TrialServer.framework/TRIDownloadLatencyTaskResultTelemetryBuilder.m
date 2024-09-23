@implementation TRIDownloadLatencyTaskResultTelemetryBuilder

- (TRIDownloadLatencyTaskResultTelemetryBuilder)initWithTelemetryValidator:(id)a3
{
  id v5;
  TRIDownloadLatencyTaskResultTelemetryBuilder *v6;
  TRIDownloadLatencyTaskResultTelemetryBuilder *v7;
  uint64_t v8;
  NSMutableDictionary *telemetryForDeployment;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIDownloadLatencyTaskResultTelemetryBuilder;
  v6 = -[TRIDownloadLatencyTaskResultTelemetryBuilder init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_validator, a3);
    v8 = objc_opt_new();
    telemetryForDeployment = v7->_telemetryForDeployment;
    v7->_telemetryForDeployment = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)updateWithTask:(id)a3 runResult:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TRIDownloadLatencyTaskResultTelemetryBuilder _handleActivationTask:runResult:](self, "_handleActivationTask:runResult:", v7, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TRIDownloadLatencyTaskResultTelemetryBuilder _handleFetchTask:runResult:](self, "_handleFetchTask:runResult:", v7, v6);
  }

}

- (void)_handleActivationTask:(id)a3 runResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TRILatencyMetricTelemetryValidating *validator;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  validator = self->_validator;
  objc_msgSend(v6, "deployment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "factorPackSetId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILatencyMetricTelemetryValidating validateAndReturnTelemetryForDeployment:factorPackSetId:](validator, "validateAndReturnTelemetryForDeployment:factorPackSetId:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v7, "reportResultToServer"))
      v13 = 1;
    else
      v13 = 2;
    -[TRIDownloadLatencyTaskResultTelemetryBuilder _updateBuiltTelemetryWithDeployment:rolloutFields:downloadStatus:](self, "_updateBuiltTelemetryWithDeployment:rolloutFields:downloadStatus:", v8, v12, v13);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_INFO, "Skipping immediate download telemetry for task %{public}@ (likely because the namespace descriptor has not opted in)", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)_handleFetchTask:(id)a3 runResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TRILatencyMetricTelemetryValidating *validator;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rolloutDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    validator = self->_validator;
    objc_msgSend(v6, "rolloutDeployment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "factorPackSetId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRILatencyMetricTelemetryValidating validateAndReturnTelemetryForDeployment:factorPackSetId:](validator, "validateAndReturnTelemetryForDeployment:factorPackSetId:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (objc_msgSend(v7, "runStatus") == 2)
        v13 = 0;
      else
        v13 = 3;
      -[TRIDownloadLatencyTaskResultTelemetryBuilder _updateBuiltTelemetryWithDeployment:rolloutFields:downloadStatus:](self, "_updateBuiltTelemetryWithDeployment:rolloutFields:downloadStatus:", v8, v12, v13);
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 138543362;
        v16 = v6;
        _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_INFO, "Skipping immediate download telemetry for task %{public}@ (likely because the namespace descriptor has not opted in)", (uint8_t *)&v15, 0xCu);
      }

    }
  }

}

- (void)_updateBuiltTelemetryWithDeployment:(id)a3 rolloutFields:(id)a4 downloadStatus:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = *(_QWORD *)&a5;
  v17 = a3;
  v8 = a4;
  -[TRIDownloadLatencyTaskResultTelemetryBuilder telemetryForDeployment](self, "telemetryForDeployment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    -[TRIDownloadLatencyTaskResultTelemetryBuilder telemetryForDeployment](self, "telemetryForDeployment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v17);

  }
  -[TRIDownloadLatencyTaskResultTelemetryBuilder telemetryForDeployment](self, "telemetryForDeployment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  objc_msgSend(v14, "setDownloadStatusFields:", v15);

  objc_msgSend(v14, "downloadStatusFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStatus:", v5);

  objc_msgSend(v14, "setRolloutFields:", v8);
}

- (id)builtTelemetry
{
  void *v2;
  void *v3;

  -[TRIDownloadLatencyTaskResultTelemetryBuilder telemetryForDeployment](self, "telemetryForDeployment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TRILatencyMetricTelemetryValidating)validator
{
  return self->_validator;
}

- (NSMutableDictionary)telemetryForDeployment
{
  return self->_telemetryForDeployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryForDeployment, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
