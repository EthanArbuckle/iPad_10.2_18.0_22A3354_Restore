@implementation TRIExperimentPostLaunchLogger

- (TRIExperimentPostLaunchLogger)initWithClient:(id)a3
{
  id v5;
  TRIExperimentPostLaunchLogger *v6;
  TRIExperimentPostLaunchLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIExperimentPostLaunchLogger;
  v6 = -[TRIExperimentPostLaunchLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_client, a3);

  return v7;
}

- (id)_metricForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "experimentStateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "errorOrDeactivationReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0DC0F08];
    if (v5)
    {
      objc_msgSend(v3, "errorOrDeactivationReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metricWithName:categoricalValue:", v4, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)logExperimentPostLaunchEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentPostLaunchLogger.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  -[TRIExperimentPostLaunchLogger _metricForEvent:](self, "_metricForEvent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v5, "treatmentTriple");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ensureExperimentFields");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "setClientExperimentId:", v9);

    objc_msgSend(v8, "treatmentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v11, "isEqual:", CFSTR("unspecified-or-default-treatment"));

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v8, "treatmentId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ensureExperimentFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClientTreatmentId:", v12);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "deploymentId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClientDeploymentId:", v15);

    TRIDeploymentEnvironment_EnumDescriptor();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textFormatNameForValue:", objc_msgSend(v5, "deploymentEnvironment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)objc_msgSend(v5, "deploymentEnvironment"));
    objc_msgSend(v7, "setClientDeploymentEnv:", v17);
    objc_msgSend(v5, "additionalTelemetry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v5, "additionalTelemetry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mergeFrom:", v19);

    }
    -[TRIExperimentPostLaunchLogger client](self, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentPostLaunchLogger client](self, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trackingId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v23, v24, 0, v7);

  }
}

- (TRIClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
