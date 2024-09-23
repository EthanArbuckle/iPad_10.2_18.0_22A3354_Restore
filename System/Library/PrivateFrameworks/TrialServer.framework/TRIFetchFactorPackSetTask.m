@implementation TRIFetchFactorPackSetTask

- (int)taskType
{
  return 20;
}

- (NSArray)tags
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[TRIRolloutTaskSupport tags](self->_rolloutSupport, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TRIBMLTTaskSupport tags](self->_bmltSupport, "tags");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttribution, v8);

  return (NSArray *)v8;
}

- (NSArray)dependencies
{
  TRIExperimentDeployment *experimentDeployment;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    return (NSArray *)MEMORY[0x1E0C9AA60];
  experimentDeployment = self->_experimentDeployment;
  if (!experimentDeployment)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  +[TRIFetchExperimentTask taskWithExperimentDeployment:taskAttributing:](TRIFetchExperimentTask, "taskWithExperimentDeployment:taskAttributing:", experimentDeployment, self->_taskAttribution);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 rolloutDeployment:(id)a5 capabilityModifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIFetchFactorPackSetTask *v16;
  TRIFetchFactorPackSetTask *v17;
  TRIRolloutTaskSupport *v18;
  TRIRolloutTaskSupport *rolloutSupport;
  NSDictionary *factorRecordsByAssetId;
  id v21;
  void *v22;
  uint64_t v23;
  _PASLock *guardedDownloadableRecord;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  TRIRolloutTaskSupport *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

    if (v14)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  if (!v13)
    goto LABEL_10;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutDeployment"));

LABEL_4:
  v43.receiver = self;
  v43.super_class = (Class)TRIFetchFactorPackSetTask;
  v16 = -[TRIFetchFactorPackSetTask init](&v43, sel_init);
  v17 = v16;
  if (v16)
  {
    v39 = v15;
    objc_storeStrong((id *)&v16->_factorPackSetId, a3);
    objc_storeStrong((id *)&v17->_taskAttribution, a4);
    v17->_construct = 0;
    objc_storeStrong((id *)&v17->_rolloutDeployment, a5);
    v18 = -[TRIRolloutTaskSupport initWithRolloutDeployment:]([TRIRolloutTaskSupport alloc], "initWithRolloutDeployment:", v17->_rolloutDeployment);
    rolloutSupport = v17->_rolloutSupport;
    v17->_rolloutSupport = v18;

    objc_storeStrong((id *)&v17->_capabilityModifier, a6);
    factorRecordsByAssetId = v17->_factorRecordsByAssetId;
    v17->_factorRecordsByAssetId = 0;

    v21 = objc_alloc(MEMORY[0x1E0D815F0]);
    v22 = (void *)objc_opt_new();
    v23 = objc_msgSend(v21, "initWithGuardedData:", v22);
    guardedDownloadableRecord = v17->_guardedDownloadableRecord;
    v17->_guardedDownloadableRecord = (_PASLock *)v23;

    v25 = (void *)objc_opt_new();
    -[TRIRolloutDeployment rolloutId](v17->_rolloutDeployment, "rolloutId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ensureRolloutFields");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClientRolloutId:", v26);

    loggableFactorPackSetIdFromFactorPackSetId(v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ensureRolloutFields");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setClientFactorPackSetId:", v28);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRIRolloutDeployment deploymentId](v17->_rolloutDeployment, "deploymentId"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClientDeploymentId:", v31);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIRolloutTaskSupport mergeTelemetry:](v17->_rolloutSupport, "mergeTelemetry:", v25);
    -[TRIRolloutTaskSupport mergeTelemetry:](v17->_rolloutSupport, "mergeTelemetry:", v32);
    objc_msgSend(v13, "networkOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v33, "allowsCellularAccess");

    if ((_DWORD)v29)
    {
      v34 = v17->_rolloutSupport;
      v35 = (void *)MEMORY[0x1E0DC0F08];
      objc_msgSend(v13, "networkOptions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v36, "allowsCellularAccess"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIRolloutTaskSupport addMetric:](v34, "addMetric:", v37);

    }
    v15 = v39;
  }

  return v17;
}

+ (id)taskWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 rolloutDeployment:(id)a5 capabilityModifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorPackSetId:taskAttribution:rolloutDeployment:capabilityModifier:", v13, v12, v11, v10);

  return v14;
}

- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 bmltDeployment:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRIFetchFactorPackSetTask *v13;
  TRIFetchFactorPackSetTask *v14;
  TRIBMLTTaskSupport *v15;
  TRIBMLTTaskSupport *bmltSupport;
  uint64_t v17;
  TRITaskCapabilityModifier *capabilityModifier;
  NSDictionary *factorRecordsByAssetId;
  id v20;
  void *v21;
  uint64_t v22;
  _PASLock *guardedDownloadableRecord;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

LABEL_4:
  v36.receiver = self;
  v36.super_class = (Class)TRIFetchFactorPackSetTask;
  v13 = -[TRIFetchFactorPackSetTask init](&v36, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_factorPackSetId, a3);
    objc_storeStrong((id *)&v14->_taskAttribution, a4);
    v14->_construct = 1;
    objc_storeStrong((id *)&v14->_bmltDeployment, a5);
    v15 = -[TRIBMLTTaskSupport initWithBMLTDeployment:]([TRIBMLTTaskSupport alloc], "initWithBMLTDeployment:", v14->_bmltDeployment);
    bmltSupport = v14->_bmltSupport;
    v14->_bmltSupport = v15;

    v17 = objc_opt_new();
    capabilityModifier = v14->_capabilityModifier;
    v14->_capabilityModifier = (TRITaskCapabilityModifier *)v17;

    factorRecordsByAssetId = v14->_factorRecordsByAssetId;
    v14->_factorRecordsByAssetId = 0;

    v20 = objc_alloc(MEMORY[0x1E0D815F0]);
    v21 = (void *)objc_opt_new();
    v22 = objc_msgSend(v20, "initWithGuardedData:", v21);
    guardedDownloadableRecord = v14->_guardedDownloadableRecord;
    v14->_guardedDownloadableRecord = (_PASLock *)v22;

    v24 = (void *)objc_opt_new();
    -[TRIBMLTDeployment backgroundMLTaskId](v14->_bmltDeployment, "backgroundMLTaskId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ensureBMLTFields");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClientBmltId:", v25);

    loggableFactorPackSetIdFromFactorPackSetId(v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ensureBMLTFields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setClientBmltFactorPackSetId:", v27);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRIBMLTDeployment deploymentId](v14->_bmltDeployment, "deploymentId"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClientDeploymentId:", v30);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIBMLTTaskSupport mergeTelemetry:](v14->_bmltSupport, "mergeTelemetry:", v24);
    -[TRIBMLTTaskSupport mergeTelemetry:](v14->_bmltSupport, "mergeTelemetry:", v31);

  }
  return v14;
}

+ (id)taskWithFactorPackSetId:(id)a3 taskAttribution:(id)a4 bmltDeployment:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorPackSetId:taskAttribution:bmltDeployment:", v10, v9, v8);

  return v11;
}

- (TRIFetchFactorPackSetTask)initWithFactorPackSetId:(id)a3 treatmentId:(id)a4 taskAttribution:(id)a5 experimentDeployment:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIFetchFactorPackSetTask *v16;
  TRIFetchFactorPackSetTask *v17;
  TRIExperimentTaskSupport *v18;
  TRIExperimentTaskSupport *experimentSupport;
  uint64_t v20;
  TRITaskCapabilityModifier *capabilityModifier;
  NSDictionary *factorRecordsByAssetId;
  id v23;
  void *v24;
  uint64_t v25;
  _PASLock *guardedDownloadableRecord;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

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
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

LABEL_4:
  v38.receiver = self;
  v38.super_class = (Class)TRIFetchFactorPackSetTask;
  v16 = -[TRIFetchFactorPackSetTask init](&v38, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_factorPackSetId, a3);
    objc_storeStrong((id *)&v17->_treatmentId, a4);
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    v17->_construct = 2;
    objc_storeStrong((id *)&v17->_experimentDeployment, a6);
    v18 = -[TRIExperimentTaskSupport initWithExperimentDeployment:]([TRIExperimentTaskSupport alloc], "initWithExperimentDeployment:", v15);
    experimentSupport = v17->_experimentSupport;
    v17->_experimentSupport = v18;

    v20 = objc_opt_new();
    capabilityModifier = v17->_capabilityModifier;
    v17->_capabilityModifier = (TRITaskCapabilityModifier *)v20;

    factorRecordsByAssetId = v17->_factorRecordsByAssetId;
    v17->_factorRecordsByAssetId = 0;

    v23 = objc_alloc(MEMORY[0x1E0D815F0]);
    v24 = (void *)objc_opt_new();
    v25 = objc_msgSend(v23, "initWithGuardedData:", v24);
    guardedDownloadableRecord = v17->_guardedDownloadableRecord;
    v17->_guardedDownloadableRecord = (_PASLock *)v25;

    v27 = (void *)objc_opt_new();
    -[TRIExperimentDeployment experimentId](v17->_experimentDeployment, "experimentId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ensureExperimentFields");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setClientExperimentId:", v28);

    objc_msgSend(v27, "ensureExperimentFields");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setClientTreatmentId:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRIExperimentDeployment deploymentId](v17->_experimentDeployment, "deploymentId"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClientDeploymentId:", v32);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentTaskSupport mergeTelemetry:](v17->_experimentSupport, "mergeTelemetry:", v27);
    -[TRIExperimentTaskSupport mergeTelemetry:](v17->_experimentSupport, "mergeTelemetry:", v33);

  }
  return v17;
}

+ (id)taskWithFactorPackSetId:(id)a3 treatmentId:(id)a4 taskAttribution:(id)a5 experimentDeployment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorPackSetId:treatmentId:taskAttribution:experimentDeployment:", v13, v12, v11, v10);

  return v14;
}

- (void)_recordExperimentFetchFailedWithTaskError:(int)a3 context:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  fetchTaskErrorAsString(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithReason:context:](self, "_recordExperimentFetchFailedWithReason:context:", v7, v6);

}

- (void)_recordExperimentFetchFailedWithReason:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v7 = a4;
  if (self->_construct != 2)
    goto LABEL_10;
  v23 = v7;
  v8 = a3;
  -[TRIFetchFactorPackSetTask experimentDeployment](self, "experimentDeployment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.experimentDeployment"));

  }
  v10 = v23;
  if (self->_treatmentId)
  {
    if (v8)
      goto LABEL_6;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("failureReason"));

    if (v23)
      goto LABEL_7;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_treatmentId"));

  v10 = v23;
  if (!v8)
    goto LABEL_12;
LABEL_6:
  if (!v10)
    goto LABEL_13;
LABEL_7:
  +[TRIExperimentPostLaunchRecorder recorderFromContext:](TRIExperimentPostLaunchRecorder, "recorderFromContext:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFetchFactorPackSetTask experimentDeployment](self, "experimentDeployment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "experimentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFetchFactorPackSetTask experimentDeployment](self, "experimentDeployment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v13, objc_msgSend(v14, "deploymentId"), self->_treatmentId);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRIExperimentPostLaunchEvent failureEventWithEventType:treatmentTriple:failureReason:](TRIExperimentPostLaunchEvent, "failureEventWithEventType:treatmentTriple:failureReason:", 7, v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 279, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("failureEvent"));

  }
  objc_msgSend(v11, "recordEvent:", v17);

  v7 = v23;
LABEL_10:

}

- (id)_taskResultForStatus:(int)a3 reportResultToServer:(BOOL)a4 earliestRetryDate:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  TRITaskRunResult *v14;
  void *v15;
  TRITaskRunResult *v16;
  TRITaskRunResult *v17;
  uint64_t v18;
  uint64_t v19;
  TRIFactorPackSetId *v21;
  void *v22;
  TRIFactorPackSetId *factorPackSetId;
  void *v24;
  void *v25;
  uint8_t buf[4];
  TRIFactorPackSetId *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if ((v6 - 3) > 1 || !self->_experimentDeployment)
  {
    v17 = [TRITaskRunResult alloc];
    v18 = MEMORY[0x1E0C9AA60];
    v19 = v6;
LABEL_11:
    v16 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v17, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v19, v5, v18, v8);
    goto LABEL_12;
  }
  v9 = _os_feature_enabled_impl();
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (!v9)
  {
    if (v11)
    {
      factorPackSetId = self->_factorPackSetId;
      -[TRIExperimentDeployment experimentId](self->_experimentDeployment, "experimentId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = factorPackSetId;
      v28 = 2112;
      v29 = v24;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch factor pack set (with id:%@) for experiment (with id:%@).", buf, 0x16u);

    }
    v17 = [TRITaskRunResult alloc];
    v18 = MEMORY[0x1E0C9AA60];
    v19 = 2;
    goto LABEL_11;
  }
  if (v11)
  {
    v21 = self->_factorPackSetId;
    -[TRIExperimentDeployment experimentId](self->_experimentDeployment, "experimentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v21;
    v28 = 2112;
    v29 = v22;
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch factor pack set (with id:%@) for experiment (with id:%@). Deactivating experiment.", buf, 0x16u);

  }
  -[TRIExperimentDeployment experimentId](self->_experimentDeployment, "experimentId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v12, -[TRIExperimentDeployment deploymentId](self->_experimentDeployment, "deploymentId"), 0, 14, self->_taskAttribution);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [TRITaskRunResult alloc];
  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v14, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v6, v5, v15, v8);

LABEL_12:
  return v16;
}

- (void)_removeDownloadableRecord:(id)a3
{
  id v4;
  _PASLock *guardedDownloadableRecord;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  guardedDownloadableRecord = self->_guardedDownloadableRecord;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TRIFetchFactorPackSetTask__removeDownloadableRecord___block_invoke;
  v7[3] = &unk_1E9333F08;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](guardedDownloadableRecord, "runWithLockAcquired:", v7);

}

void __55__TRIFetchFactorPackSetTask__removeDownloadableRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Missing %@ in _guardedDownloadableRecord", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (id)_downloadSetArtifactWithProvider:(id)a3 downloadOptions:(id)a4 downloadNotificationKey:(id)a5 errorResult:(id *)a6 setArtifactFetchError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  TRIFactorPackSet *v16;
  TRIFactorPackSet *v17;
  dispatch_semaphore_t v18;
  uint64_t v19;
  TRIFetchOptions *v20;
  void *v21;
  TRIFetchOptions *v22;
  TRIFactorPackSetId *factorPackSetId;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  _QWORD v28[5];
  id v29;
  NSObject *v30;
  uint64_t *v31;
  uint8_t *v32;
  id *v33;
  id *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(CFSTR("empty-fp-set"), "isEqualToString:", self->_factorPackSetId))
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Factor pack set is empty by definition; skipping CloudKit fetch.",
        buf,
        2u);
    }

    v16 = [TRIFactorPackSet alloc];
    v17 = -[TRIFactorPackSet initWithIdent:packs:](v16, "initWithIdent:packs:", CFSTR("empty-fp-set"), MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v27 = v12;
    v18 = dispatch_semaphore_create(0);
    if (self->_rolloutDeployment)
      v19 = 3;
    else
      v19 = 1;
    v20 = [TRIFetchOptions alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:](v20, "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v13, v21);

    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__32;
    v43 = __Block_byref_object_dispose__32;
    v44 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    factorPackSetId = self->_factorPackSetId;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __136__TRIFetchFactorPackSetTask__downloadSetArtifactWithProvider_downloadOptions_downloadNotificationKey_errorResult_setArtifactFetchError___block_invoke;
    v28[3] = &unk_1E9333F30;
    v28[4] = self;
    v31 = &v35;
    v33 = a6;
    v34 = a7;
    v29 = v14;
    v32 = buf;
    v24 = v18;
    v12 = v27;
    v25 = v24;
    v30 = v24;
    objc_msgSend(v27, "fetchFactorPackSetWithId:options:completion:", factorPackSetId, v22, v28);
    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v36 + 6))
      -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](self, "_addMetricForFetchFactorPackSetTaskError:");
    v17 = (TRIFactorPackSet *)*((id *)v40 + 5);

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(buf, 8);

  }
  return v17;
}

void __136__TRIFetchFactorPackSetTask__downloadSetArtifactWithProvider_downloadOptions_downloadNotificationKey_errorResult_setArtifactFetchError___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void **v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a2 != 4)
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v25 = 138543618;
      v26 = v17;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Unable to fetch factor pack set %{public}@: %{public}@", (uint8_t *)&v25, 0x16u);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 32;
    v18 = *(void **)(a1 + 32);
    v19 = 1;
    goto LABEL_10;
  }
  if (!v11)
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
      v25 = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "No valid factor set could be downloaded for %{public}@.", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withCloudKitError:", *(_QWORD *)(a1 + 40), v13);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 31;
    v18 = *(void **)(a1 + 32);
    v19 = 3;
LABEL_10:
    objc_msgSend(v18, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", v19, 1, v12);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(void ***)(a1 + 72);
    v24 = *v23;
    *v23 = (void *)v22;

    v14 = *(id **)(a1 + 80);
    v15 = a6;
    goto LABEL_11;
  }
  v14 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v15 = a3;
LABEL_11:
  objc_storeStrong(v14, v15);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (id)_requiredAssetsForFactorPackSet:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  TRIAssetStore *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  TRIAssetStore *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [TRIAssetStore alloc];
  objc_msgSend(v6, "paths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[TRIAssetStore initWithPaths:](v7, "initWithPaths:", v8);

  v41 = (void *)objc_opt_new();
  v37 = v6;
  objc_msgSend(v6, "keyValueStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v38 = v5;
  objc_msgSend(v5, "packs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0x1E932D000uLL;
    v14 = MEMORY[0x1E0C809B0];
    v15 = *(_QWORD *)v46;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v17, "selectedNamespace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasName");

        if (v20)
        {
          v21 = *(void **)(v13 + 3384);
          objc_msgSend(v17, "selectedNamespace");
          v22 = objc_claimAutoreleasedReturnValue();
          -[NSObject name](v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "aliasesInNamespace:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = 0x1E932D000;
        }
        else
        {
          TRILogCategory_Server();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "factorPackId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v50 = v31;
            _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", buf, 0xCu);

          }
          v24 = 0;
        }

        objc_msgSend(*(id *)(v13 + 3384), "requiredAssetsForInstallationWithFactorPack:assetStore:maProvider:subscriptionSettings:aliasToUnaliasMap:", v17, v42, v41, v40, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {

          objc_autoreleasePoolPop(v18);
          v33 = 0;
          goto LABEL_18;
        }
        v26 = v25;
        objc_msgSend(v25, "cloudKit");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v14;
        v44[1] = 3221225472;
        v44[2] = __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke;
        v44[3] = &unk_1E9332380;
        v44[4] = v17;
        objc_msgSend(v27, "enumerateObjectsUsingBlock:", v44);

        objc_msgSend(v26, "mobileAsset");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v14;
        v43[1] = 3221225472;
        v43[2] = __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke_253;
        v43[3] = &unk_1E93318B8;
        v43[4] = v17;
        objc_msgSend(v28, "enumerateObjectsUsingBlock:", v43);

        objc_msgSend(v17, "factorPackId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateFactorPackId();
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 432, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("TRIValidateFactorPackId(pack.factorPackId)"));

        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, v30);

        objc_autoreleasePoolPop(v18);
        ++v16;
        v13 = 0x1E932D000;
      }
      while (v12 != v16);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v12)
        continue;
      break;
    }
  }

  v33 = v10;
LABEL_18:

  return v33;
}

void __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isInstalled") & 1) == 0)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "factorPackId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "assetId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ requires Trial-CK asset %{public}@ which is not already on disk; will be downloaded.",
        (uint8_t *)&v7,
        0x16u);

    }
  }

}

void __69__TRIFetchFactorPackSetTask__requiredAssetsForFactorPackSet_context___block_invoke_253(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isInstalled") & 1) == 0)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "factorPackId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fullAssetId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fullAssetId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "specifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fullAssetId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "version");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v5;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ requires MAAsset %{public}@.%{public}@.%{public}@ which is not already on disk; will be downloaded.",
        (uint8_t *)&v12,
        0x2Au);

    }
  }

}

- (id)_uniqueUninstalledAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  TRIGenericUniqueRequiredAssets *v8;
  TRIGenericUniqueRequiredAssets *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke;
  v14 = &unk_1E9333F58;
  v15 = v4;
  v16 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v11);

  v8 = [TRIGenericUniqueRequiredAssets alloc];
  v9 = -[TRIGenericUniqueRequiredAssets initWithCloudKit:mobileAsset:](v8, "initWithCloudKit:mobileAsset:", v7, v6, v11, v12, v13, v14);

  return v9;
}

void __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "cloudKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_2;
  v10[3] = &unk_1E9332380;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend(v4, "mobileAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_3;
  v8[3] = &unk_1E93318B8;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isInstalled") & 1) == 0)
  {
    objc_msgSend(v6, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "assetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

void __54__TRIFetchFactorPackSetTask__uniqueUninstalledAssets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "fullAssetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

- (id)_subscribedOnDemandFactorsForAssets:(id)a3 factorPackSet:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id obj;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v7 = a4;
  objc_msgSend(a5, "keyValueStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (id)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = v7;
  objc_msgSend(v7, "packs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (!objc_msgSend(v14, "hasSelectedNamespace")
          || (objc_msgSend(v14, "selectedNamespace"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "hasName"),
              v15,
              (v16 & 1) == 0))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 471, CFSTR("factor pack is missing namespace"));

        }
        objc_msgSend(v14, "selectedNamespace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "subscribedFactorsForNamespaceName:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "hasFactorPackId") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 475, CFSTR("factor pack is missing factor pack identifier"));

        }
        objc_msgSend(v14, "factorPackId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateFactorPackId();
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 476, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("TRIValidateFactorPackId(pack.factorPackId)"));

        }
        objc_msgSend(v36, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 477, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assets[factorPackId]"));

        }
        objc_msgSend(v23, "cloudKit");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __87__TRIFetchFactorPackSetTask__subscribedOnDemandFactorsForAssets_factorPackSet_context___block_invoke;
        v37[3] = &unk_1E9333F80;
        v38 = v20;
        v39 = v19;
        v40 = v14;
        v41 = v35;
        v25 = v19;
        v26 = v20;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v37);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v11);
  }

  return v35;
}

void __87__TRIFetchFactorPackSetTask__subscribedOnDemandFactorsForAssets_factorPackSet_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  TRIFactorNamespaceRecord *v6;
  void *v7;
  TRIFactorNamespaceRecord *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isOnDemand"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "factorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((_DWORD)v4)
    {
      v6 = [TRIFactorNamespaceRecord alloc];
      objc_msgSend(v3, "factorName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TRIFactorNamespaceRecord initWithFactorName:namespaceName:](v6, "initWithFactorName:namespaceName:", v7, *(_QWORD *)(a1 + 40));

      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "factorPackId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "assetId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "factorName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v10;
        v24 = 2114;
        v25 = v11;
        v26 = 2114;
        v27 = v12;
        _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ has asset %{public}@ associated with on-demand factor name %{public}@", (uint8_t *)&v22, 0x20u);

      }
      v13 = *(void **)(a1 + 56);
      objc_msgSend(v3, "assetId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && (objc_msgSend(v15, "isEqualToFactorRecord:", v8) & 1) == 0)
      {
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "assetId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "factorName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "factorName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543874;
          v23 = v17;
          v24 = 2114;
          v25 = v18;
          v26 = 2114;
          v27 = v19;
          _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Warning:same assetId %{public}@ with different on-demand factor names %{public}@ and %{public}@; ; ignoring the former",
            (uint8_t *)&v22,
            0x20u);

        }
      }
      v20 = *(void **)(a1 + 56);
      objc_msgSend(v3, "assetId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v21);

    }
  }

}

- (BOOL)_downloadAndSaveCKAssetsWithMetadata:(id)a3 artifactProvider:(id)a4 options:(id)a5 downloadNotificationKey:(id)a6 context:(id)a7 assetsDownloadSize:(unint64_t *)a8 errorResult:(id *)a9 fetchError:(id *)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  dispatch_semaphore_t v25;
  TRIFetchFactorPackSetTask *v26;
  id v27;
  SEL v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  TRIFetchFactorPackSetTask *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  id v44;
  TRIAssetStore *v45;
  void *v46;
  void *v47;
  void *v48;
  TRIAssetStore *v49;
  void *v50;
  TRIAssetStore *v51;
  void *v52;
  BOOL v53;
  void *v55;
  unint64_t *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  _QWORD v64[3];
  char v65;
  _QWORD v66[4];
  id v67;
  TRIFetchFactorPackSetTask *v68;
  TRIAssetStore *v69;
  id v70;
  uint64_t *v71;
  SEL v72;
  id *v73;
  unint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  _QWORD v79[5];
  id v80;
  id v81;
  NSObject *v82;
  uint64_t *v83;
  id *v84;
  SEL v85;
  _QWORD v86[4];
  id v87;
  TRIFetchFactorPackSetTask *v88;
  id v89;
  _QWORD v90[4];
  id v91;
  TRIFetchFactorPackSetTask *v92;
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _QWORD v100[4];
  id v101;
  TRIFetchFactorPackSetTask *v102;
  id v103;
  SEL v104;
  _QWORD v105[5];
  id v106;
  id v107;
  NSObject *v108;
  uint64_t *v109;
  id *v110;
  id *v111;
  SEL v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  _QWORD v119[4];
  id v120;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v62 = v20;
  if (objc_msgSend(v17, "count"))
  {
    v59 = v21;
    v60 = v19;
    v22 = (void *)objc_opt_new();
    v23 = MEMORY[0x1E0C809B0];
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke;
    v119[3] = &unk_1E9333FA8;
    v24 = v22;
    v120 = v24;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v119);
    v25 = dispatch_semaphore_create(0);
    v61 = v18;
    v113 = 0;
    v114 = &v113;
    v115 = 0x3032000000;
    v116 = __Block_byref_object_copy__32;
    v117 = __Block_byref_object_dispose__32;
    v118 = 0;
    v56 = a8;
    *a8 = 0;
    v105[0] = v23;
    v105[1] = 3221225472;
    v105[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2;
    v105[3] = &unk_1E9333FD0;
    v26 = self;
    v105[4] = self;
    v27 = v20;
    v106 = v27;
    v110 = a9;
    v28 = a2;
    v111 = a10;
    v19 = v60;
    v29 = v17;
    v107 = v29;
    v109 = &v113;
    v112 = a2;
    v108 = v25;
    v58 = v24;
    v30 = v24;
    v31 = v108;
    v32 = (id)objc_msgSend(v18, "fetchRecordIdsForAssetsWithIds:options:completion:", v30, v60, v105);
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v31);
    if (v114[5])
    {
      v55 = v27;
      v57 = v31;
      v33 = objc_alloc(MEMORY[0x1E0C99E08]);
      v34 = v26;
      v35 = (void *)objc_msgSend(v33, "initWithCapacity:", objc_msgSend((id)v114[5], "count"));
      v36 = (void *)v114[5];
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_271;
      v100[3] = &unk_1E9333FF8;
      v37 = v29;
      v104 = v28;
      v101 = v37;
      v102 = v26;
      v38 = v35;
      v103 = v38;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v100);
      v94 = 0;
      v95 = &v94;
      v96 = 0x3032000000;
      v97 = __Block_byref_object_copy__32;
      v98 = __Block_byref_object_dispose__32;
      v99 = 0;
      v39 = MEMORY[0x1E0C809B0];
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_276;
      v90[3] = &unk_1E9332848;
      v91 = v38;
      v92 = v26;
      v93 = v59;
      v86[0] = v39;
      v86[1] = 3221225472;
      v86[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_4;
      v86[3] = &unk_1E9332898;
      v87 = v91;
      v88 = v26;
      v40 = v93;
      v89 = v40;
      v79[0] = v39;
      v41 = v87;
      v79[1] = 3221225472;
      v79[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_6;
      v79[3] = &unk_1E9334020;
      v79[4] = v26;
      v84 = a9;
      v80 = v55;
      v42 = v37;
      v81 = v42;
      v83 = &v94;
      v85 = v28;
      v43 = v57;
      v82 = v43;
      v19 = v60;
      v18 = v61;
      v44 = (id)objc_msgSend(v61, "fetchAssetsWithRecordIds:options:perRecordProgress:perRecordCompletionBlockOnSuccess:perRecordCompletionBlockOnError:completion:", v87, v60, 0, v90, v86, v79);
      objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v43);
      if (v95[5])
      {
        v75 = 0;
        v76 = &v75;
        v77 = 0x2020000000;
        v78 = 1;
        v45 = [TRIAssetStore alloc];
        objc_msgSend(v40, "paths");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "downloadOptions");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "activity");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[TRIAssetStore initWithPaths:monitoredActivity:](v45, "initWithPaths:monitoredActivity:", v46, v48);

        v50 = (void *)v95[5];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_280;
        v66[3] = &unk_1E9334048;
        v72 = v28;
        v67 = v42;
        v68 = v34;
        v51 = v49;
        v69 = v51;
        v71 = &v75;
        v70 = v60;
        v73 = a9;
        v74 = v56;
        objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v66);
        v64[0] = 0;
        v64[1] = v64;
        v64[2] = 0x2020000000;
        v65 = 1;
        v52 = (void *)v95[5];
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_283;
        v63[3] = &unk_1E9332938;
        v63[4] = v64;
        objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v63);
        v21 = v59;
        v31 = v57;
        v53 = *((_BYTE *)v76 + 24) != 0;
        _Block_object_dispose(v64, 8);

        _Block_object_dispose(&v75, 8);
        v18 = v61;
      }
      else
      {
        v53 = 0;
        v21 = v59;
        v31 = v57;
      }

      _Block_object_dispose(&v94, 8);
    }
    else
    {
      v53 = 0;
      v21 = v59;
    }

    _Block_object_dispose(&v113, 8);
  }
  else
  {
    v53 = 1;
  }

  return v53;
}

uint64_t __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void **v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void **v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  switch(a2)
  {
    case 0:
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543618;
        v39 = v14;
        v40 = 2114;
        v41 = (uint64_t)v12;
        _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Unable to fetch CKRecordIDs for factor pack set %{public}@, will not retry: %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withCloudKitError:", *(_QWORD *)(a1 + 40), v12);
      v15 = *(void **)(a1 + 32);
      v16 = 3;
      goto LABEL_8;
    case 1:
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543362;
        v39 = v18;
        _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Fetch of factor pack set %{public}@ was canceled.", buf, 0xCu);
      }

      v15 = *(void **)(a1 + 32);
      v16 = 4;
LABEL_8:
      v19 = 0;
      goto LABEL_12;
    case 2:
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543874;
        v39 = v21;
        v40 = 2114;
        v41 = (uint64_t)v11;
        v42 = 2114;
        v43 = (uint64_t)v12;
        _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Unable to fetch CKRecordIDs for factor pack set %{public}@, will retry after %{public}@: %{public}@", buf, 0x20u);
      }

      v15 = *(void **)(a1 + 32);
      v16 = 1;
      v19 = v11;
LABEL_12:
      objc_msgSend(v15, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", v16, 1, v19);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void ***)(a1 + 72);
      v24 = *v23;
      *v23 = (void *)v22;

      v25 = *(id **)(a1 + 80);
      v26 = a5;
      goto LABEL_13;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchFactorPackSetTask.m"), 569, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      goto LABEL_23;
    case 4:
      if (v10 && (v28 = objc_msgSend(v10, "count"), v28 == objc_msgSend(*(id *)(a1 + 48), "count")))
      {
        TRILogCategory_Server();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_msgSend(*(id *)(a1 + 48), "count");
          v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
          *(_DWORD *)buf = 134218242;
          v39 = v30;
          v40 = 2114;
          v41 = v31;
          _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Retrieved %tu CKRecordIDs for assets in factor pack set %{public}@.", buf, 0x16u);
        }

        v25 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v26 = a3;
LABEL_13:
        objc_storeStrong(v25, v26);
      }
      else
      {
        TRILogCategory_Server();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
          v37 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 138543874;
          v39 = v36;
          v40 = 2048;
          v41 = v37;
          v42 = 2048;
          v43 = objc_msgSend(v10, "count");
          _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Retrieved wrong number of CKRecordIDs for assets in factor pack set %{public}@ (exp %tu, act %tu).", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 3, 1, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(void ***)(a1 + 72);
        v35 = *v34;
        *v34 = (void *)v33;

      }
LABEL_23:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

      return;
    default:
      goto LABEL_23;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  TRISizedCKRecordID *v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("TRIFetchFactorPackSetTask.m"), 584, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetMetadata[assetId]"));

  }
  v9 = objc_msgSend(v8, "downloadSize");

  v11 = -[TRISizedCKRecordID initWithRecordId:downloadSize:]([TRISizedCKRecordID alloc], "initWithRecordId:downloadSize:", v6, v9);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v7);

}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_276(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_3;
  v8[3] = &unk_1E9332820;
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  v9 = v16;
  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKeyedSubscript:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v10, "factorName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "namespaceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_logOnDemandFactor:metricName:namespaceName:client:error:", v13, CFSTR("on_demand_factor_downloaded_by_subscription"), v14, v15, 0);

      objc_msgSend(*(id *)(a1 + 40), "_removeDownloadableRecord:", v11);
    }
    *a4 = 1;

    v9 = v16;
  }

}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_5;
  v12[3] = &unk_1E9332870;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_5(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  v9 = v16;
  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKeyedSubscript:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v10, "factorName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "namespaceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_logOnDemandFactor:metricName:namespaceName:client:error:", v13, CFSTR("on_demand_factor_failed_to_download_by_subscription"), v14, v15, *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 40), "_removeDownloadableRecord:", v11);
    }
    *a4 = 1;

    v9 = v16;
  }

}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void **v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  switch(a2)
  {
    case 0:
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543618;
        v35 = v14;
        v36 = 2114;
        v37 = (uint64_t)v12;
        _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Unable to fetch all assets for factor pack set %{public}@, will not retry: %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withCloudKitError:", *(_QWORD *)(a1 + 40), v12);
      goto LABEL_19;
    case 1:
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543362;
        v35 = v16;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Fetch of factor pack set %{public}@ was canceled.", buf, 0xCu);
      }

      v17 = *(void **)(a1 + 32);
      v18 = 4;
      goto LABEL_20;
    case 2:
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138543874;
        v35 = v20;
        v36 = 2114;
        v37 = (uint64_t)v11;
        v38 = 2114;
        v39 = (uint64_t)v12;
        _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Unable to fetch all assets for factor pack set %{public}@, will retry after %{public}@: %{public}@", buf, 0x20u);
      }

      v17 = *(void **)(a1 + 32);
      v18 = 1;
      v21 = v11;
      goto LABEL_21;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchFactorPackSetTask.m"), 666, CFSTR("Unexpected TRIFetchStatus %tu"), 3);

      goto LABEL_22;
    case 4:
      v23 = objc_msgSend(v10, "count");
      v24 = objc_msgSend(*(id *)(a1 + 48), "count");
      TRILogCategory_Server();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v23 == v24)
      {
        if (v26)
        {
          v27 = objc_msgSend(*(id *)(a1 + 48), "count");
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
          *(_DWORD *)buf = 134218242;
          v35 = v27;
          v36 = 2114;
          v37 = v28;
          _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Finished downloading %tu assets for factor pack set %{public}@.", buf, 0x16u);
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
      }
      else
      {
        if (v26)
        {
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
          v30 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 138543874;
          v35 = v29;
          v36 = 2048;
          v37 = v30;
          v38 = 2048;
          v39 = objc_msgSend(v10, "count");
          _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Downloaded wrong number of assets for factor pack set %{public}@ (exp %tu, act %tu).", buf, 0x20u);
        }

LABEL_19:
        v17 = *(void **)(a1 + 32);
        v18 = 3;
LABEL_20:
        v21 = 0;
LABEL_21:
        objc_msgSend(v17, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", v18, 1, v21);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(void ***)(a1 + 72);
        v33 = *v32;
        *v32 = (void *)v31;

      }
LABEL_22:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

      return;
    default:
      goto LABEL_22;
  }
}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_280(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  void *v19;
  uint64_t v20;
  void **v21;
  void *v22;
  void *v23;
  id v24;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("TRIFetchFactorPackSetTask.m"), 683, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetMetadata[assetId]"));

  }
  v11 = *(void **)(a1 + 48);
  v24 = 0;
  v12 = objc_msgSend(v11, "saveAssetWithIdentifier:assetURL:metadata:error:", v9, v8, v10, &v24);

  v13 = v24;
  if (v12 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 40), "setWasDeferred:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 1, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void ***)(a1 + 80);
    v22 = *v21;
    *v21 = (void *)v20;

    *a4 = 1;
  }
  else if (v12)
  {
    **(_QWORD **)(a1 + 88) += objc_msgSend(v10, "downloadSize");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 56), "downloadOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = 1;
    else
      v16 = 3;
    objc_msgSend(*(id *)(a1 + 40), "_taskResultForStatus:reportResultToServer:earliestRetryDate:", v16, 1, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void ***)(a1 + 80);
    v19 = *v18;
    *v18 = (void *)v17;

    *a4 = 1;
  }

}

void __165__TRIFetchFactorPackSetTask__downloadAndSaveCKAssetsWithMetadata_artifactProvider_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke_2_283(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v14);
  v7 = v14;

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 != (void *)*MEMORY[0x1E0CB28A8])
    {

      goto LABEL_5;
    }
    v10 = objc_msgSend(v7, "code");

    if (v10 != 4)
    {
LABEL_5:
      v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v13)
          goto LABEL_11;
      }
      else if (v13)
      {
LABEL_11:
        *(_DWORD *)buf = 138543618;
        v16 = v4;
        v17 = 2114;
        v18 = v7;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %{public}@: %{public}@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }

}

- (BOOL)_downloadAndSaveMAAssets:(id)a3 options:(id)a4 downloadNotificationKey:(id)a5 context:(id)a6 assetsDownloadSize:(unint64_t *)a7 errorResult:(id *)a8 fetchError:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *rolloutSupport;
  dispatch_semaphore_t v21;
  void *v22;
  TRITaskAttributing *taskAttribution;
  NSObject *v24;
  id v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, int, void *, void *);
  void *v31;
  TRIFetchFactorPackSetTask *v32;
  NSObject *v33;
  uint64_t *v34;
  id *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (objc_msgSend(v14, "count"))
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "ensureMobileAssetOriginFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsMobileAsset:", 1);

    rolloutSupport = self->_rolloutSupport;
    if (rolloutSupport
      || (rolloutSupport = self->_bmltSupport) != 0
      || _os_feature_enabled_impl() && (rolloutSupport = self->_experimentSupport) != 0)
    {
      objc_msgSend(rolloutSupport, "mergeTelemetry:", v18);
    }

    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__32;
    v40 = __Block_byref_object_dispose__32;
    v41 = 0;
    v21 = dispatch_semaphore_create(0);
    v22 = (void *)objc_opt_new();
    taskAttribution = self->_taskAttribution;
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __136__TRIFetchFactorPackSetTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke;
    v31 = &unk_1E93318E0;
    v34 = &v36;
    v35 = a9;
    v32 = self;
    v24 = v21;
    v33 = v24;
    v25 = (id)objc_msgSend(v22, "downloadAssets:attribution:aggregateProgress:group:completion:", v14, taskAttribution, 0, 0, &v28);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    if (a8)
      objc_storeStrong(a8, (id)v37[5]);
    v26 = objc_msgSend((id)v37[5], "runStatus", v28, v29, v30, v31, v32) == 2;

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v26 = 1;
  }

  return v26;
}

void __136__TRIFetchFactorPackSetTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_assetsDownloadSize_errorResult_fetchError___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v9;
  void **v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a4;
  v9 = a5;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setWasDeferred:", 1);
  v10 = *(void ***)(a1 + 56);
  v11 = *v10;
  *v10 = v9;
  v12 = v9;

  objc_msgSend(*(id *)(a1 + 32), "_taskResultForStatus:reportResultToServer:earliestRetryDate:", a2, 1, v16);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_saveFactorPackSet:(id)a3 requiredAssetMap:(id)a4 context:(id)a5
{
  id v7;
  TRIFactorPackStorage *v8;
  void *v9;
  TRIFBFactorPackStorage *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  TRIFactorPackSetStorage *v47;
  void *v48;
  BOOL v49;
  id v51;
  TRIFBFactorPackStorage *v52;
  TRIFactorPackSetStorage *obj;
  void *v54;
  int v55;
  uint64_t v56;
  id v59;
  uint64_t v60;
  void *context;
  uint64_t v62;
  void *v63;
  TRIFactorPackStorage *v64;
  id v65;
  void *v66;
  __CFString *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  __int128 *v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  __int128 v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v59 = a4;
  v7 = a5;
  v55 = _os_feature_enabled_impl();
  v8 = [TRIFactorPackStorage alloc];
  v54 = v7;
  objc_msgSend(v7, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[TRIFactorPackStorage initWithPaths:](v8, "initWithPaths:", v9);

  v10 = [TRIFBFactorPackStorage alloc];
  objc_msgSend(v54, "paths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[TRIFBFactorPackStorage initWithPaths:](v10, "initWithPaths:", v11);

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v51, "packs");
  obj = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
  v60 = -[TRIFactorPackSetStorage countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (!v60)
    goto LABEL_34;
  v56 = *(_QWORD *)v78;
  while (2)
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v78 != v56)
      {
        v13 = v12;
        objc_enumerationMutation(obj);
        v12 = v13;
      }
      v62 = v12;
      v14 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v12);
      v63 = (void *)MEMORY[0x1D8232A5C]();
      v67 = &stru_1E9336E60;
      if (objc_msgSend(v14, "hasFactorPackId"))
      {
        objc_msgSend(v14, "factorPackId");
        v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (!objc_msgSend(v14, "hasFactorPackId")
        || (TRIValidateFactorPackId(), (v68 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 793, CFSTR("Unexpected failure to validate factor pack set id: %@"), v67);

        v68 = 0;
      }
      if (!objc_msgSend(v14, "hasSelectedNamespace")
        || (objc_msgSend(v14, "selectedNamespace"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "hasName"),
            v16,
            (v17 & 1) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 795, CFSTR("Factor pack %@ has unexpectedly-empty namespace name"), v67);

      }
      v19 = (void *)objc_opt_new();
      objc_msgSend(v59, "objectForKeyedSubscript:", v68);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 799, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("requiredAssetMap[factorPackId]"));

      }
      objc_msgSend(v20, "cloudKit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke;
      v75[3] = &unk_1E9332380;
      v22 = v19;
      v76 = v22;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v75);

      objc_msgSend(v20, "mobileAsset");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_2;
      v73[3] = &unk_1E93318B8;
      v65 = v22;
      v74 = v65;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v73);

      objc_msgSend(v14, "selectedNamespace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v24, "hasName");

      if ((_DWORD)v22)
      {
        objc_msgSend(v14, "selectedNamespace");
        v25 = objc_claimAutoreleasedReturnValue();
        -[NSObject name](v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", v26);
        v66 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        TRILogCategory_Server();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "factorPackId");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v85) = 138543362;
          *(_QWORD *)((char *)&v85 + 4) = v45;
          _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Factor pack %{public}@ has missing namespace name.", (uint8_t *)&v85, 0xCu);

        }
        v66 = 0;
      }

      objc_msgSend(v14, "selectedNamespace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](v64, "pathForFactorPackWithId:namespaceName:", v68, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = objc_msgSend(v30, "fileExistsAtPath:", v31);
        if (v29)
          goto LABEL_23;
      }
      else
      {
        v32 = 0;
        if (v29)
        {
LABEL_23:
          context = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v54, "keyValueStore");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "selectedNamespace");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "subscribedFactorsForNamespaceName:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)&v85 = 0;
          *((_QWORD *)&v85 + 1) = &v85;
          v86 = 0x3032000000;
          v87 = __Block_byref_object_copy__32;
          v88 = __Block_byref_object_dispose__32;
          v89 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_299;
          v69[3] = &unk_1E9334070;
          v38 = v66;
          v70 = v38;
          v39 = v37;
          v71 = v39;
          v72 = &v85;
          objc_msgSend(v14, "enumerateFactorLevelsWithBlock:", v69);
          objc_msgSend(v14, "selectedNamespace");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "name");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIFactorPackStorage updateSavedFactorPackWithId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:](v64, "updateSavedFactorPackWithId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:", v68, v41, *(_QWORD *)(*((_QWORD *)&v85 + 1) + 40), v38);

          if ((v32 & v55) == 1)
          {
            objc_msgSend(v14, "selectedNamespace");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "name");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIFBFactorPackStorage updateSavedFactorLevelsWithFactorPackId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:](v52, "updateSavedFactorLevelsWithFactorPackId:namespaceName:populatingAssetsForFactorNames:aliasToUnaliasMap:", v68, v43, *(_QWORD *)(*((_QWORD *)&v85 + 1) + 40), v38);

          }
          TRILogCategory_Server();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v82 = v68;
            v83 = 2114;
            v84 = v29;
            _os_log_impl(&dword_1D207F000, v44, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ is already on disk (path: %{public}@), updating on-demand assets", buf, 0x16u);
          }

          _Block_object_dispose(&v85, 8);
          objc_autoreleasePoolPop(context);
          goto LABEL_32;
        }
      }
      if (!-[TRIFactorPackStorage saveFactorPack:populatingAssetsForFactorNames:aliasToUnaliasMap:factorPackByNamePath:factorPackByIdPath:](v64, "saveFactorPack:populatingAssetsForFactorNames:aliasToUnaliasMap:factorPackByNamePath:factorPackByIdPath:", v14, v65, v66, 0, 0)|| v55&& !-[TRIFBFactorPackStorage saveFactorLevelsForFactorPack:populatingAssetsForFactorNames:aliasToUnaliasMap:factorLevelsByNamePath:factorLevelsByIdPath:](v52, "saveFactorLevelsForFactorPack:populatingAssetsForFactorNames:aliasToUnaliasMap:factorLevelsByNamePath:factorLevelsByIdPath:", v14, v65, v66, 0, 0))
      {
        -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](self, "_addMetricForFetchFactorPackSetTaskError:", 16);

        objc_autoreleasePoolPop(v63);
        goto LABEL_38;
      }
LABEL_32:

      objc_autoreleasePoolPop(v63);
      v12 = v62 + 1;
    }
    while (v60 != v62 + 1);
    v60 = -[TRIFactorPackSetStorage countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    if (v60)
      continue;
    break;
  }
LABEL_34:

  v47 = [TRIFactorPackSetStorage alloc];
  objc_msgSend(v54, "paths");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  obj = -[TRIFactorPackSetStorage initWithPaths:](v47, "initWithPaths:", v48);

  if (-[TRIFactorPackSetStorage saveFactorPackSet:](obj, "saveFactorPackSet:", v51))
  {
    v49 = 1;
  }
  else
  {
    -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](self, "_addMetricForFetchFactorPackSetTaskError:", 16);
LABEL_38:
    v49 = 0;
  }

  return v49;
}

void __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "factorName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "factorName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __73__TRIFetchFactorPackSetTask__saveFactorPackSet_requiredAssetMap_context___block_invoke_299(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "hasLevel"))
  {
    objc_msgSend(v12, "level");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFactorOnDemand");

    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v12, "factor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(v12, "factor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);

    }
  }

}

- (BOOL)incompatibleNamespaceNameForBMLT:(id)a3 namespaceDescriptorProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  int v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v5, "selectedNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptorWithNamespaceName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "compatibilityVersionArray_Count"));
    objc_msgSend(v8, "compatibilityVersionArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __90__TRIFetchFactorPackSetTask_incompatibleNamespaceNameForBMLT_namespaceDescriptorProvider___block_invoke;
    v28[3] = &unk_1E9333E90;
    v13 = v10;
    v29 = v13;
    v31 = &v32;
    v14 = v11;
    v30 = v14;
    objc_msgSend(v12, "enumerateValuesWithBlock:", v28);

    v15 = *((_BYTE *)v33 + 24) != 0;
    if (!*((_BYTE *)v33 + 24))
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "taskId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v5, "deploymentId");
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v13, "downloadNCV");
        objc_msgSend(v5, "taskId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v37 = v26;
        v38 = 1024;
        v39 = v17;
        v40 = 2114;
        v41 = v27;
        v42 = 2114;
        v43 = v25;
        v44 = 1024;
        v45 = v24;
        v46 = 2114;
        v47 = v18;
        _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@.%u supports namespace compatibility versions {%{public}@} for namespace \"%{public}@\", but the namespace descriptor declares download compatibility with version %u. (This is unlikely to be an issue, unless you're REALLY sure BMLT %{public}@ should be available on this device.)", buf, 0x36u);

      }
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "taskId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v5, "deploymentId");
      objc_msgSend(v8, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v20;
      v38 = 1024;
      v39 = v21;
      v40 = 2114;
      v41 = v22;
      _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Note: BMLT %{public}@.%u involves namespace %{public}@ but it is not registered with Trial. Factor packs for this namespace shall not be downloaded.", buf, 0x1Cu);

    }
    v15 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v15;
}

void __90__TRIFetchFactorPackSetTask_incompatibleNamespaceNameForBMLT_namespaceDescriptorProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "downloadNCV") == (_DWORD)a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v4 = *(void **)(a1 + 40);
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), a2);
  objc_msgSend(v4, "addObject:", v5);

}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  TRIFetchFactorPackSetTask *v7;
  NSObject *v8;
  unint64_t construct;
  void *v10;
  TRIFactorPackSetStorage *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  TRIFactorPackSetId *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  TRIFactorPackSetId *v24;
  void *v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v30;
  TRIFactorPackSetStorage *v31;
  void *v32;
  TRIFactorPackSetStorage *v33;
  NSObject *v34;
  TRIFactorPackSetId *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  TRIFactorPackSetStorage *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  TRIFactorPackSetId *v51;
  id v52;
  void *v53;
  TRIFactorPackSetId *v54;
  id v55;
  _BOOL4 v56;
  NSObject *v57;
  TRIFactorPackSetId *v58;
  int v59;
  void *v60;
  TRIFactorPackSetStorage *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  TRIFactorPackSetId *v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  _BOOL4 v78;
  NSObject *v79;
  TRIFactorPackSetId *v80;
  int v81;
  id v82;
  TRIFactorPackSetId *factorPackSetId;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  _BOOL4 v87;
  NSObject *v88;
  TRIFactorPackSetId *v89;
  NSObject *v90;
  TRIFactorPackSetId *v91;
  NSObject *v92;
  TRIFactorPackSetId *v93;
  int v94;
  NSObject *v95;
  TRIFactorPackSetId *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i;
  uint64_t v116;
  unint64_t v117;
  id *p_rolloutSupport;
  int v119;
  int *v120;
  unint64_t j;
  void *v122;
  BOOL v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  char v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  NSObject *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  NSDictionary *factorRecordsByAssetId;
  _PASLock *guardedDownloadableRecord;
  uint64_t v162;
  BOOL v163;
  int v164;
  TRIFetchOptions *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  int v178;
  int v179;
  int v180;
  unint64_t v181;
  void *v182;
  const __CFString *v183;
  NSObject *v184;
  TRIFactorPackSetId *v185;
  void *v186;
  int v187;
  const __CFString *v188;
  uint64_t v189;
  uint64_t v190;
  TRIFetchOptions *v191;
  unint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  NSObject *v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  id v207;
  uint64_t v208;
  NSObject *v209;
  void *v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t ii;
  uint64_t v215;
  unint64_t v216;
  id *v217;
  int v218;
  int *v219;
  void *v220;
  void *v221;
  NSObject *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  id v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t k;
  uint64_t v231;
  unint64_t v232;
  id *v233;
  int v234;
  int *v235;
  void *v236;
  void *v237;
  void *v238;
  id v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t m;
  uint64_t v243;
  unint64_t v244;
  id *v245;
  int v246;
  int *v247;
  TRIFactorPackSetStorage *v248;
  uint64_t v249;
  void *v250;
  char v251;
  TRIFactorPackSetStorage *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t n;
  uint64_t v256;
  NSObject *v257;
  uint64_t v258;
  int v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  id v265;
  void *v266;
  id v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  TRIFactorPackSetId *v273;
  void *v274;
  TRIFactorPackSetId *v275;
  void *v276;
  int v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  NSObject *v283;
  NSString *treatmentId;
  void *v285;
  void *v286;
  uint64_t v287;
  _BOOL4 v288;
  void *v290;
  void *v291;
  TRIFactorPackSetStorage *v292;
  TRIFactorPackSetStorage *v293;
  void *v294;
  void *v295;
  TRIFactorPackSetStorage *v296;
  id v297;
  void *v298;
  void (**v299)(_QWORD);
  id v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  id v305;
  TRIFactorPackSetStorage *v306;
  TRIFetchOptions *obj;
  void *v308;
  uint64_t v309;
  BOOL v310;
  BOOL v311;
  int v312;
  id v313;
  void *v314;
  void *v315;
  void *v316;
  id v317;
  TRIFetchFactorPackSetTask *v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  _QWORD v331[5];
  _QWORD v332[5];
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  _QWORD v337[4];
  id v338;
  _QWORD v339[5];
  id v340;
  _QWORD v341[5];
  id v342;
  uint64_t v343;
  void *v344;
  _QWORD v345[4];
  id v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  _QWORD v351[5];
  _QWORD v352[4];
  id v353;
  _BYTE *v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  void *v359;
  id v360;
  _QWORD v361[4];
  id v362;
  TRIFetchFactorPackSetTask *v363;
  id v364;
  _QWORD v365[4];
  id v366;
  _QWORD v367[5];
  id v368;
  SEL v369;
  _QWORD v370[5];
  id v371;
  _BYTE v372[128];
  _BYTE v373[128];
  _BYTE v374[128];
  uint8_t v375[128];
  _BYTE buf[24];
  const __CFString *v377;
  __int16 v378;
  void *v379;
  __int16 v380;
  void *v381;
  __int16 v382;
  const __CFString *v383;
  _BYTE v384[128];
  _BYTE v385[12];
  __int16 v386;
  void *v387;
  __int16 v388;
  int v389;
  _BYTE v390[128];
  _QWORD v391[4];

  v391[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v297 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v318 = v7;
  v298 = (void *)os_transaction_create();
  v370[0] = MEMORY[0x1E0C809B0];
  v370[1] = 3221225472;
  v370[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke;
  v370[3] = &unk_1E932F8C8;
  v370[4] = v7;
  v317 = v6;
  v371 = v317;
  v299 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v370);
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v82 = (id)objc_opt_class();
    factorPackSetId = v318->_factorPackSetId;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v82;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = factorPackSetId;
    _os_log_debug_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEBUG, "starting %{public}@ with factor pack set id %{public}@", buf, 0x16u);

  }
  construct = v318->_construct;
  if (construct != 2)
  {
    if (construct != 1)
    {
      if (!construct)
      {
        objc_msgSend(v317, "rolloutDatabase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "recordWithDeployment:usingTransaction:", v318->_rolloutDeployment, 0);
        v11 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          TRILogCategory_Server();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            -[TRIRolloutDeployment shortDesc](v318->_rolloutDeployment, "shortDesc");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v60;
            _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: record for Rollout deployment %{public}@ not available; issuing incomplete telemetry.",
              buf,
              0xCu);

          }
LABEL_42:

          v61 = [TRIFactorPackSetStorage alloc];
          objc_msgSend(v317, "paths");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[TRIFactorPackSetStorage initWithPaths:](v61, "initWithPaths:", v62);

          *(_QWORD *)v385 = 0;
          if (-[TRIFactorPackSetStorage hasFactorPackSetWithId:path:](v33, "hasFactorPackSetWithId:path:", v318->_factorPackSetId, v385))
          {
            objc_msgSend(v317, "namespaceDatabase");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v317, "paths");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "namespaceDescriptorsDefaultDir");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v63, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              -[TRIFactorPackSetStorage artifact](v11, "artifact");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "rollout");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              +[TRISetupAssistantFetchUtils getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:](TRISetupAssistantFetchUtils, "getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:", v68, v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              v70 = objc_msgSend(v69, "count");
              v71 = (void *)objc_opt_new();
              v72 = v318->_factorPackSetId;
              v367[0] = MEMORY[0x1E0C809B0];
              v367[1] = 3221225472;
              v367[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_315;
              v367[3] = &unk_1E9331540;
              v369 = a2;
              v367[4] = v318;
              v73 = v71;
              v368 = v73;
              -[TRIFactorPackSetStorage enumerateCompatibleFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:](v33, "enumerateCompatibleFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v72, 0, v367);
              -[TRIFactorPackSetStorage artifact](v11, "artifact");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "rollout");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v75, "selectedNamespaceArray_Count");
              v78 = v76 != objc_msgSend(v73, "count") && v70 == 0;

              if (v78)
              {
                TRILogCategory_Server();
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  v80 = v318->_factorPackSetId;
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)&buf[4] = v80;
                  _os_log_impl(&dword_1D207F000, v79, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ contains ineligible factor pack. Re-fetching factor pack to find replacement.", buf, 0xCu);
                }

                v81 = 1;
              }
              else
              {
                TRILogCategory_Server();
                v90 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  v91 = v318->_factorPackSetId;
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v91;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = *(_QWORD *)v385;
                  _os_log_impl(&dword_1D207F000, v90, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
                    buf,
                    0x16u);
                }

                -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 2, 0, 0);
                v305 = (id)objc_claimAutoreleasedReturnValue();
                v81 = 0;
              }

              if (v78)
                goto LABEL_76;
            }
            else
            {
              TRILogCategory_Server();
              v86 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
              {
                v275 = v318->_factorPackSetId;
                -[TRIRolloutDeployment shortDesc](v318->_rolloutDeployment, "shortDesc");
                v276 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v275;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v276;
                _os_log_error_impl(&dword_1D207F000, v86, OS_LOG_TYPE_ERROR, "Unable to update preexisting factor pack set %{public}@ for %{public}@: record not found in database.", buf, 0x16u);

              }
              -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 29);
              -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, 0, v317);
              -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 3, 1, 0);
              v305 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_326;
          }
          v81 = 0;
LABEL_76:

          -[TRIFactorPackSetStorage namespaces](v11, "namespaces");
          v296 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0DC0A00], "immediateDownloadNotificationKeyForNamespaceNames:", v296);
            v288 = v81 != 0;
            v300 = (id)objc_claimAutoreleasedReturnValue();

            v292 = 0;
            v306 = 0;
          }
          else
          {
            v300 = 0;
            v292 = 0;
            v306 = 0;
            v11 = 0;
            v288 = v81 != 0;
          }
LABEL_93:
          -[TRITaskAttributing applicationBundleIdentifier](v318->_taskAttribution, "applicationBundleIdentifier");
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          v293 = v11;
          objc_msgSend(v317, "keyValueStore");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v317, "namespaceDatabase");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v317, "paths");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "namespaceDescriptorsDefaultDir");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v103, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = -[TRITaskAttributing triCloudKitContainer](v318->_taskAttribution, "triCloudKitContainer");
          -[TRITaskAttributing teamIdentifier](v318->_taskAttribution, "teamIdentifier");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v107, v108, v308, v102, v106, v317);
          v301 = (void *)objc_claimAutoreleasedReturnValue();

          -[TRITaskAttributing networkOptions](v318->_taskAttribution, "networkOptions");
          v314 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIBaseTask stateProvider](v318, "stateProvider");
          v302 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v314, "discretionaryBehavior"))
          {
            objc_msgSend(v302, "activeActivityGrantingCapability:", 16);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v109)
            {
              TRILogCategory_Server();
              v209 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v209, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D207F000, v209, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
              }

              -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 3);
              -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v317);
              -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 1, 0);
              v305 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_325;
            }
            objc_msgSend(v314, "setActivity:", v109);

          }
          v360 = 0;
          v359 = 0;
          -[TRIFetchFactorPackSetTask _downloadSetArtifactWithProvider:downloadOptions:downloadNotificationKey:errorResult:setArtifactFetchError:](v318, "_downloadSetArtifactWithProvider:downloadOptions:downloadNotificationKey:errorResult:setArtifactFetchError:", v301, v314, v300, &v360, &v359);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v360, "runStatus") != 2)
          {
            v318->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:", v359);
            if (v359)
            {
              TRIFetchErrorParseToMetrics(v359);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v111, "count")
                && (v318->_rolloutSupport || v318->_bmltSupport || v318->_experimentSupport))
              {
                v315 = v110;
                v358 = 0u;
                v356 = 0u;
                v357 = 0u;
                v355 = 0u;
                v112 = v111;
                v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v355, v390, 16);
                if (!v113)
                  goto LABEL_117;
                v114 = *(_QWORD *)v356;
                while (1)
                {
                  for (i = 0; i != v113; ++i)
                  {
                    if (*(_QWORD *)v356 != v114)
                      objc_enumerationMutation(v112);
                    v116 = *(_QWORD *)(*((_QWORD *)&v355 + 1) + 8 * i);
                    v117 = v318->_construct;
                    p_rolloutSupport = (id *)&v318->_rolloutSupport;
                    switch(v117)
                    {
                      case 0uLL:
                        goto LABEL_114;
                      case 1uLL:
                        v120 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_113:
                        p_rolloutSupport = (id *)((char *)&v318->super.super.isa + *v120);
LABEL_114:
                        objc_msgSend(*p_rolloutSupport, "addMetric:", v116);
                        continue;
                      case 2uLL:
                        v119 = _os_feature_enabled_impl();
                        v120 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                        if (v119)
                          goto LABEL_113;
                        break;
                    }
                  }
                  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v355, v390, 16);
                  if (!v113)
                  {
LABEL_117:

                    v110 = v315;
                    break;
                  }
                }
              }

            }
          }
          if (!v110)
          {
            -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", objc_msgSend(v360, "runStatus") == 2, v306, v317);
            if (objc_msgSend(v360, "runStatus") == 3)
              -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithReason:context:](v318, "_recordExperimentFetchFailedWithReason:context:", CFSTR("FactorPackNotFound"), v317);
            v305 = v360;
            if (!v305)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v295 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v295, "handleFailureInMethod:object:file:lineNumber:description:", a2, v318, CFSTR("TRIFetchFactorPackSetTask.m"), 1265, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("taskResult"));
              v305 = 0;

            }
            goto LABEL_324;
          }
          v316 = (void *)objc_opt_new();
          for (j = 0; ; ++j)
          {
            objc_msgSend(v110, "packs");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = j < objc_msgSend(v122, "count");

            if (!v123)
              break;
            v124 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v110, "packs");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "objectAtIndexedSubscript:", j);
            v126 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v126, "hasFactorPackId") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "ident");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v147, "handleFailureInMethod:object:file:lineNumber:description:", a2, v318, CFSTR("TRIFetchFactorPackSetTask.m"), 1274, CFSTR("Factor pack set %@ has factor pack with missing id"), v148);

            }
            objc_msgSend(v126, "selectedNamespace");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            v128 = objc_msgSend(v127, "hasName");

            if ((v128 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "factorPackId");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v149, "handleFailureInMethod:object:file:lineNumber:description:", a2, v318, CFSTR("TRIFetchFactorPackSetTask.m"), 1275, CFSTR("No namespace name on factor pack %@"), v150);

            }
            v129 = (void *)MEMORY[0x1E0DC0AD8];
            objc_msgSend(v126, "selectedNamespace");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "name");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v317, "paths");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "namespaceDescriptorsDefaultDir");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "loadWithNamespaceName:fromDirectory:", v131, v133);
            v134 = (void *)objc_claimAutoreleasedReturnValue();

            if (v134)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              LOBYTE(v377) = 0;
              objc_msgSend(v126, "selectedNamespace");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "compatibilityVersionArray");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v352[0] = MEMORY[0x1E0C809B0];
              v352[1] = 3221225472;
              v352[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_334;
              v352[3] = &unk_1E9334138;
              v137 = v134;
              v353 = v137;
              v354 = buf;
              objc_msgSend(v136, "enumerateValuesWithBlock:", v352);

              if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
              {
                TRILogCategory_Server();
                v138 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v126, "factorPackId");
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v126, "selectedNamespace");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v140, "name");
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  v142 = objc_msgSend(v137, "downloadNCV");
                  *(_DWORD *)v385 = 138543874;
                  *(_QWORD *)&v385[4] = v139;
                  v386 = 2114;
                  v387 = v141;
                  v388 = 1024;
                  v389 = v142;
                  _os_log_impl(&dword_1D207F000, v138, OS_LOG_TYPE_DEFAULT, "Factor pack %{public}@ does not declare compatibility with NCV (%{public}@, %u); will be omitted from installation.",
                    v385,
                    0x1Cu);

                }
                objc_msgSend(v316, "addIndex:", j);
              }

              _Block_object_dispose(buf, 8);
            }
            else
            {
              TRILogCategory_Server();
              v143 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v126, "selectedNamespace");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v144, "name");
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "ident");
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v145;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v146;
                _os_log_impl(&dword_1D207F000, v143, OS_LOG_TYPE_DEFAULT, "Could not load namespace descriptor for namespace %{public}@ found in factor pack set %{public}@. Skipping download of factor pack for that namespace.", buf, 0x16u);

              }
              objc_msgSend(v316, "addIndex:", j);
            }

            objc_autoreleasePoolPop(v124);
          }
          objc_msgSend(v110, "packs");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = (void *)objc_msgSend(v151, "mutableCopy");

          objc_msgSend(v152, "removeObjectsAtIndexes:", v316);
          v294 = (void *)objc_msgSend(v110, "copyWithReplacementPacks:", v152);

          -[TRIFetchFactorPackSetTask _requiredAssetsForFactorPackSet:context:](v318, "_requiredAssetsForFactorPackSet:context:", v294, v317);
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v291)
          {
            -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 5);
            -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v317);
            -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithTaskError:context:](v318, "_recordExperimentFetchFailedWithTaskError:context:", 5, v317);
            -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 3, 1, 0);
            v305 = (id)objc_claimAutoreleasedReturnValue();
LABEL_323:

LABEL_324:
LABEL_325:

            v33 = v293;
            v11 = v296;
            goto LABEL_326;
          }
          -[TRIFetchFactorPackSetTask _uniqueUninstalledAssets:](v318, "_uniqueUninstalledAssets:");
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          TRILogCategory_Server();
          v153 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v294, "ident");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v290, "cloudKit");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = objc_msgSend(v155, "count");
            objc_msgSend(v290, "mobileAsset");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = objc_msgSend(v157, "count");
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v154;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v158 + v156;
            _os_log_impl(&dword_1D207F000, v153, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ references %tu assets which are required for enrollment and are not already on disk.", buf, 0x16u);

          }
          -[TRIFetchFactorPackSetTask _subscribedOnDemandFactorsForAssets:factorPackSet:context:](v318, "_subscribedOnDemandFactorsForAssets:factorPackSet:context:", v291, v294, v317);
          v159 = objc_claimAutoreleasedReturnValue();
          factorRecordsByAssetId = v318->_factorRecordsByAssetId;
          v318->_factorRecordsByAssetId = (NSDictionary *)v159;

          guardedDownloadableRecord = v318->_guardedDownloadableRecord;
          v351[0] = MEMORY[0x1E0C809B0];
          v351[1] = 3221225472;
          v351[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_335;
          v351[3] = &unk_1E9333F08;
          v351[4] = v318;
          -[_PASLock runWithLockAcquired:](guardedDownloadableRecord, "runWithLockAcquired:", v351);
          objc_msgSend(v302, "activeActivityDescriptorGrantingCapability:", 1);
          v303 = (void *)objc_claimAutoreleasedReturnValue();

          v162 = objc_msgSend(v314, "discretionaryBehavior");
          if (v318->_experimentDeployment)
            v163 = v162 == 0;
          else
            v163 = 0;
          v164 = !v163;
          v312 = v164;
          v347 = 0u;
          v348 = 0u;
          v349 = 0u;
          v350 = 0u;
          objc_msgSend(v294, "packs");
          v165 = (TRIFetchOptions *)objc_claimAutoreleasedReturnValue();
          v166 = -[TRIFetchOptions countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v347, v384, 16);
          obj = v165;
          v167 = 0;
          if (v166)
          {
            v309 = *(_QWORD *)v348;
            do
            {
              v168 = 0;
              do
              {
                if (*(_QWORD *)v348 != v309)
                  objc_enumerationMutation(obj);
                v169 = *(void **)(*((_QWORD *)&v347 + 1) + 8 * v168);
                v170 = (void *)MEMORY[0x1D8232A5C]();
                v171 = (void *)MEMORY[0x1E0DC0AD8];
                objc_msgSend(v169, "selectedNamespace");
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "name");
                v173 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v317, "paths");
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "namespaceDescriptorsDefaultDir");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v171, "loadWithNamespaceName:fromDirectory:", v173, v175);
                v176 = (void *)objc_claimAutoreleasedReturnValue();

                v177 = objc_msgSend(v176, "purgeabilityLevel");
                if ((int)v167 <= v177)
                  v167 = v177;
                else
                  v167 = v167;
                if (!v312
                  || ((v178 = objc_msgSend(v314, "allowsCellularAccess"), !v303) ? (v179 = v178) : (v179 = 0),
                      v179 != 1
                   || v308
                   && objc_msgSend(v308, "length")
                   && (objc_msgSend(v176, "expensiveNetworkingAllowed") & 1) != 0))
                {
                  v180 = 1;
                }
                else
                {
                  v181 = v318->_construct;
                  if (v181)
                  {
                    if (v181 == 1)
                    {
                      -[TRIBMLTDeployment backgroundMLTaskId](v318->_bmltDeployment, "backgroundMLTaskId");
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      v183 = CFSTR("BMLT");
                    }
                    else if (v181 == 2 && _os_feature_enabled_impl())
                    {
                      -[TRIExperimentDeployment experimentId](v318->_experimentDeployment, "experimentId");
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      v183 = CFSTR("Experiment");
                    }
                    else
                    {
                      v183 = 0;
                      v182 = 0;
                    }
                  }
                  else
                  {
                    -[TRIRolloutDeployment rolloutId](v318->_rolloutDeployment, "rolloutId");
                    v182 = (void *)objc_claimAutoreleasedReturnValue();
                    v183 = CFSTR("Rollout");
                  }
                  TRILogCategory_Server();
                  v184 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                  {
                    v185 = v318->_factorPackSetId;
                    -[TRIFactorPackSetStorage firstObject](v296, "firstObject");
                    v186 = (void *)objc_claimAutoreleasedReturnValue();
                    v187 = objc_msgSend(v176, "expensiveNetworkingAllowed");
                    *(_DWORD *)buf = 138413570;
                    v188 = CFSTR("NO");
                    if (v187)
                      v188 = CFSTR("YES");
                    *(_QWORD *)&buf[4] = v185;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v186;
                    *(_WORD *)&buf[22] = 2112;
                    v377 = v183;
                    v378 = 2112;
                    v379 = v182;
                    v380 = 2112;
                    v381 = v308;
                    v382 = 2112;
                    v383 = v188;
                    _os_log_error_impl(&dword_1D207F000, v184, OS_LOG_TYPE_ERROR, "preventing fetch of factor pack set %@ on cellular for namespace %@ of %@ %@, resourceAttributionBundleIdentifier: %@ expensiveNetworkingAllowed: %@", buf, 0x3Eu);

                  }
                  -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 23);
                  -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v317);
                  -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 0, 0);
                  v305 = (id)objc_claimAutoreleasedReturnValue();

                  v180 = 0;
                }

                objc_autoreleasePoolPop(v170);
                if (!v180)
                  goto LABEL_322;
                ++v168;
              }
              while (v166 != v168);
              v189 = -[TRIFetchOptions countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v347, v384, 16);
              v166 = v189;
            }
            while (v189);
          }

          v190 = objc_msgSend(MEMORY[0x1E0DC0B48], "availableSpaceClassFromPurgeabilityLevel:", v167);
          v191 = [TRIFetchOptions alloc];
          v192 = 0x1E0CB3000uLL;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v190);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          obj = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:](v191, "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v314, v193);

          v194 = (void *)objc_opt_new();
          objc_msgSend(v290, "cloudKit");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v345[0] = MEMORY[0x1E0C809B0];
          v345[1] = 3221225472;
          v345[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_347;
          v345[3] = &unk_1E9333FA8;
          v196 = v194;
          v346 = v196;
          objc_msgSend(v195, "enumerateKeysAndObjectsUsingBlock:", v345);

          *(_QWORD *)v385 = 0;
          v344 = 0;
          v343 = 0;
          objc_msgSend(v290, "cloudKit");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v317, "paths");
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = MEMORY[0x1E0C809B0];
          v341[0] = MEMORY[0x1E0C809B0];
          v341[1] = 3221225472;
          v341[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_349;
          v341[3] = &unk_1E9334160;
          v341[4] = v318;
          v342 = v317;
          v339[0] = v199;
          v339[1] = 3221225472;
          v339[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_3;
          v339[3] = &unk_1E9334188;
          v339[4] = v318;
          v313 = v342;
          v340 = v313;
          +[TRIDiffableAssetBuilder buildAndSaveDiffableAssetsWithAssetIds:metadataForAssetId:artifactProvider:options:paths:assetsDownloadSize:perAssetIdCompletionBlockOnSuccess:perAssetIdCompletionBlockOnError:retryAfter:error:](TRIDiffableAssetBuilder, "buildAndSaveDiffableAssetsWithAssetIds:metadataForAssetId:artifactProvider:options:paths:assetsDownloadSize:perAssetIdCompletionBlockOnSuccess:perAssetIdCompletionBlockOnError:retryAfter:error:", v196, v197, v301, obj, v198, &v343, v341, v339, v385, &v344);
          v200 = (void *)objc_claimAutoreleasedReturnValue();

          if (v200)
          {
            if (objc_msgSend(v200, "count"))
            {
              TRILogCategory_Server();
              v201 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
              {
                v202 = objc_msgSend(v200, "count");
                objc_msgSend(v290, "cloudKit");
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                v204 = objc_msgSend(v203, "count");
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v202;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v204;
                _os_log_impl(&dword_1D207F000, v201, OS_LOG_TYPE_DEFAULT, "%tu of %tu required assets are being handled by patching preexisting assets.", buf, 0x16u);

              }
            }
            objc_msgSend(v290, "cloudKit");
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            v206 = (void *)objc_msgSend(v205, "mutableCopy");

            v337[0] = MEMORY[0x1E0C809B0];
            v337[1] = 3221225472;
            v337[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_352;
            v337[3] = &unk_1E93341B0;
            v207 = v206;
            v338 = v207;
            objc_msgSend(v200, "enumerateObjectsUsingBlock:", v337);
            v208 = objc_msgSend(v290, "copyWithReplacementCloudKit:", v207);

            v290 = (void *)v208;
LABEL_220:

            if (v200)
            {
              -[TRIFetchOptions downloadOptions](obj, "downloadOptions");
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v220, "activity");
              v221 = (void *)objc_claimAutoreleasedReturnValue();

              if (v221 && xpc_activity_should_defer((xpc_activity_t)v221))
              {
                TRILogCategory_Server();
                v222 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D207F000, v222, OS_LOG_TYPE_DEFAULT, "XPC activity was deferred before asset download.", buf, 2u);
                }

                -[TRIFetchFactorPackSetTask setWasDeferred:](v318, "setWasDeferred:", 1);
                -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 1);
                -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v313);
                -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 1, 0);
                v305 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_322;
              }

              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v377 = 0;
              objc_msgSend(v290, "cloudKit");
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              v332[0] = MEMORY[0x1E0C809B0];
              v332[1] = 3221225472;
              v332[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_354;
              v332[3] = &unk_1E93341D8;
              v332[4] = buf;
              objc_msgSend(v223, "enumerateKeysAndObjectsUsingBlock:", v332);

              objc_msgSend(v290, "mobileAsset");
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              v331[0] = MEMORY[0x1E0C809B0];
              v331[1] = 3221225472;
              v331[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_355;
              v331[3] = &unk_1E9334200;
              v331[4] = buf;
              objc_msgSend(v224, "enumerateKeysAndObjectsUsingBlock:", v331);

              if (+[TRICacheDeleteUtils hasSufficientDiskSpaceForDownload:](TRICacheDeleteUtils, "hasSufficientDiskSpaceForDownload:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24)))
              {
                _Block_object_dispose(buf, 8);
                *(_QWORD *)v385 = 0;
                v344 = 0;
                objc_msgSend(v290, "cloudKit");
                v225 = (void *)objc_claimAutoreleasedReturnValue();
                v310 = -[TRIFetchFactorPackSetTask _downloadAndSaveCKAssetsWithMetadata:artifactProvider:options:downloadNotificationKey:context:assetsDownloadSize:errorResult:fetchError:](v318, "_downloadAndSaveCKAssetsWithMetadata:artifactProvider:options:downloadNotificationKey:context:assetsDownloadSize:errorResult:fetchError:", v225, v301, obj, v300, v313, &v344, &v360, v385);

                if (objc_msgSend(v360, "runStatus") != 2 && *(_QWORD *)v385)
                {
                  TRIFetchErrorParseToMetrics(*(void **)v385);
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v226, "count")
                    && (v318->_rolloutSupport || v318->_bmltSupport || v318->_experimentSupport))
                  {
                    v329 = 0u;
                    v330 = 0u;
                    v327 = 0u;
                    v328 = 0u;
                    v227 = v226;
                    v228 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v327, v374, 16);
                    if (!v228)
                      goto LABEL_248;
                    v229 = *(_QWORD *)v328;
                    while (1)
                    {
                      for (k = 0; k != v228; ++k)
                      {
                        if (*(_QWORD *)v328 != v229)
                          objc_enumerationMutation(v227);
                        v231 = *(_QWORD *)(*((_QWORD *)&v327 + 1) + 8 * k);
                        v232 = v318->_construct;
                        v233 = (id *)&v318->_rolloutSupport;
                        switch(v232)
                        {
                          case 0uLL:
                            goto LABEL_245;
                          case 1uLL:
                            v235 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_244:
                            v233 = (id *)((char *)&v318->super.super.isa + *v235);
LABEL_245:
                            objc_msgSend(*v233, "addMetric:", v231);
                            continue;
                          case 2uLL:
                            v234 = _os_feature_enabled_impl();
                            v235 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                            if (v234)
                              goto LABEL_244;
                            break;
                        }
                      }
                      v228 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v327, v374, 16);
                      if (!v228)
                      {
LABEL_248:

                        v192 = 0x1E0CB3000;
                        break;
                      }
                    }
                  }

                }
                if (v310)
                {
                  v236 = *(void **)v385;
                  *(_QWORD *)v385 = 0;

                  v344 = 0;
                  objc_msgSend(v290, "mobileAsset");
                  v237 = (void *)objc_claimAutoreleasedReturnValue();
                  v311 = -[TRIFetchFactorPackSetTask _downloadAndSaveMAAssets:options:downloadNotificationKey:context:assetsDownloadSize:errorResult:fetchError:](v318, "_downloadAndSaveMAAssets:options:downloadNotificationKey:context:assetsDownloadSize:errorResult:fetchError:", v237, obj, v300, v313, &v344, &v360, v385);

                  if (objc_msgSend(v360, "runStatus") != 2 && *(_QWORD *)v385)
                  {
                    TRIFetchErrorParseToMetrics(*(void **)v385);
                    v238 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v238, "count") && (v318->_rolloutSupport || v318->_bmltSupport))
                    {
                      v325 = 0u;
                      v326 = 0u;
                      v323 = 0u;
                      v324 = 0u;
                      v239 = v238;
                      v240 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v323, v373, 16);
                      if (!v240)
                        goto LABEL_271;
                      v241 = *(_QWORD *)v324;
                      while (1)
                      {
                        for (m = 0; m != v240; ++m)
                        {
                          if (*(_QWORD *)v324 != v241)
                            objc_enumerationMutation(v239);
                          v243 = *(_QWORD *)(*((_QWORD *)&v323 + 1) + 8 * m);
                          v244 = v318->_construct;
                          v245 = (id *)&v318->_rolloutSupport;
                          switch(v244)
                          {
                            case 0uLL:
                              goto LABEL_268;
                            case 1uLL:
                              v247 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_267:
                              v245 = (id *)((char *)&v318->super.super.isa + *v247);
LABEL_268:
                              objc_msgSend(*v245, "addMetric:", v243);
                              continue;
                            case 2uLL:
                              v246 = _os_feature_enabled_impl();
                              v247 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                              if (v246)
                                goto LABEL_267;
                              break;
                          }
                        }
                        v240 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v323, v373, 16);
                        if (!v240)
                        {
LABEL_271:

                          v192 = 0x1E0CB3000uLL;
                          break;
                        }
                      }
                    }

                  }
                  if (v311)
                  {
                    v248 = v293;
                    v249 = -[TRIFetchFactorPackSetTask _saveFactorPackSet:requiredAssetMap:context:](v318, "_saveFactorPackSet:requiredAssetMap:context:", v294, v291, v313);
                    if ((_DWORD)v249)
                    {
                      if (v318->_experimentDeployment)
                      {
                        if (v318->_treatmentId)
                        {
                          objc_msgSend(v313, "experimentDatabase");
                          v250 = (void *)objc_claimAutoreleasedReturnValue();
                          v251 = objc_msgSend(v250, "setTreatmentId:factorPackSetId:forExperimentDeployment:usingTransaction:", v318->_treatmentId, v318->_factorPackSetId, v318->_experimentDeployment, 0);

                          v248 = v293;
                          if ((v251 & 1) == 0)
                          {
                            TRILogCategory_Server();
                            v283 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v283, OS_LOG_TYPE_ERROR))
                            {
                              treatmentId = v318->_treatmentId;
                              -[TRIExperimentDeployment experimentId](v318->_experimentDeployment, "experimentId");
                              v285 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412546;
                              *(_QWORD *)&buf[4] = treatmentId;
                              *(_WORD *)&buf[12] = 2114;
                              *(_QWORD *)&buf[14] = v285;
                              _os_log_error_impl(&dword_1D207F000, v283, OS_LOG_TYPE_ERROR, "failed to save treatment id %@ to database for experiment %{public}@", buf, 0x16u);

                            }
                            -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 0, 0);
                            v305 = (id)objc_claimAutoreleasedReturnValue();
                            goto LABEL_321;
                          }
                        }
                      }
                      if (v288)
                      {
                        v321 = 0u;
                        v322 = 0u;
                        v319 = 0u;
                        v320 = 0u;
                        v252 = v296;
                        v253 = -[TRIFactorPackSetStorage countByEnumeratingWithState:objects:count:](v252, "countByEnumeratingWithState:objects:count:", &v319, v372, 16);
                        if (v253)
                        {
                          v254 = *(_QWORD *)v320;
                          do
                          {
                            for (n = 0; n != v253; ++n)
                            {
                              if (*(_QWORD *)v320 != v254)
                                objc_enumerationMutation(v252);
                              v256 = *(_QWORD *)(*((_QWORD *)&v319 + 1) + 8 * n);
                              TRILogCategory_Server();
                              v257 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v257, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138543362;
                                *(_QWORD *)&buf[4] = v256;
                                _os_log_impl(&dword_1D207F000, v257, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@", buf, 0xCu);
                              }

                              objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", v256);
                            }
                            v253 = -[TRIFactorPackSetStorage countByEnumeratingWithState:objects:count:](v252, "countByEnumeratingWithState:objects:count:", &v319, v372, 16);
                          }
                          while (v253);
                        }

                        v248 = v293;
                      }
                    }
                    -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", v249, v306, v313);
                    if ((_DWORD)v249)
                      v258 = 2;
                    else
                      v258 = 3;
                    if (v248)
                      v259 = v249;
                    else
                      v259 = 0;
                    if (v259 == 1)
                    {
                      -[TRIFactorPackSetStorage deployment](v248, "deployment");
                      v260 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v260, "rolloutId");
                      v261 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIFactorPackSetStorage rampId](v293, "rampId");
                      v262 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIFactorPackSetStorage deployment](v293, "deployment");
                      v263 = (void *)objc_claimAutoreleasedReturnValue();
                      LOBYTE(v287) = 0;
                      +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 2, v261, v262, objc_msgSend(v263, "deploymentId"), v318->_factorPackSetId, 0, 0, v293, v287, v313);
                    }
                    else
                    {
                      if ((v249 & 1) != 0 || !v293)
                        goto LABEL_311;
                      -[TRIFactorPackSetStorage deployment](v293, "deployment");
                      v260 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v260, "rolloutId");
                      v261 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIFactorPackSetStorage rampId](v293, "rampId");
                      v262 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIFactorPackSetStorage deployment](v293, "deployment");
                      v263 = (void *)objc_claimAutoreleasedReturnValue();
                      LOBYTE(v287) = 0;
                      +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 6, v261, v262, objc_msgSend(v263, "deploymentId"), v318->_factorPackSetId, 0, 0, v293, v287, v313);
                    }

LABEL_311:
                    if (_os_feature_enabled_impl())
                    {
                      if (v292)
                        v277 = v249;
                      else
                        v277 = 0;
                      if (v277 == 1)
                      {
                        -[TRIFactorPackSetStorage experimentDeployment](v292, "experimentDeployment");
                        v278 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v278, "experimentId");
                        v279 = (void *)objc_claimAutoreleasedReturnValue();
                        -[TRIFactorPackSetStorage treatmentId](v292, "treatmentId");
                        v280 = (void *)objc_claimAutoreleasedReturnValue();
                        -[TRIFactorPackSetStorage experimentDeployment](v292, "experimentDeployment");
                        v281 = (void *)objc_claimAutoreleasedReturnValue();
                        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 4, v279, v280, objc_msgSend(v281, "deploymentId"), v292, 0, v313);

                      }
                      else if ((v249 & 1) == 0 && v292)
                      {
                        -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithReason:context:](v318, "_recordExperimentFetchFailedWithReason:context:", CFSTR("FailedToSaveFactorPack"), v313);
                      }
                    }
                    -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", v258, 1, 0);
                    v305 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_321;
                  }
                  -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v313);
                  if (objc_msgSend(v360, "runStatus") == 3)
                  {
                    v267 = objc_alloc(MEMORY[0x1E0CB3940]);
                    objc_msgSend(*(id *)v385, "domain");
                    v268 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v192 + 2024), "numberWithInteger:", objc_msgSend(*(id *)v385, "code"));
                    v269 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v269, "stringValue");
                    v270 = (void *)objc_claimAutoreleasedReturnValue();
                    v271 = (void *)objc_msgSend(v267, "initWithFormat:", CFSTR("MAError: %@ %@"), v268, v270);

                    -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithReason:context:](v318, "_recordExperimentFetchFailedWithReason:context:", v271, v313);
                  }
                  v265 = v360;
                  if (!v265)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v286 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v286, "handleFailureInMethod:object:file:lineNumber:description:", a2, v318, CFSTR("TRIFetchFactorPackSetTask.m"), 1606, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("taskResult"));

                  }
                }
                else
                {
                  -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v313);
                  if (objc_msgSend(v360, "runStatus") == 3)
                  {
                    TRIFetchErrorParseToPostLaunchMetric(*(void **)v385);
                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithReason:context:](v318, "_recordExperimentFetchFailedWithReason:context:", v264, v313);

                  }
                  v265 = v360;
                  if (!v265)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v266 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v266, "handleFailureInMethod:object:file:lineNumber:description:", a2, v318, CFSTR("TRIFetchFactorPackSetTask.m"), 1560, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("taskResult"));

                  }
                }
                v305 = v265;

LABEL_321:
                goto LABEL_322;
              }
              objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", v300, 4);
              -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 24);
              -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v313);
              -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithTaskError:context:](v318, "_recordExperimentFetchFailedWithTaskError:context:", 24, v313);
              -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 3, 1, 0);
              v305 = (id)objc_claimAutoreleasedReturnValue();
              _Block_object_dispose(buf, 8);
            }
LABEL_322:

            goto LABEL_323;
          }
          if (v344)
          {
            TRIFetchErrorParseToMetrics(v344);
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v210, "count")
              && (v318->_rolloutSupport || v318->_bmltSupport || v318->_experimentSupport))
            {
              v335 = 0u;
              v336 = 0u;
              v333 = 0u;
              v334 = 0u;
              v211 = v210;
              v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v333, v375, 16);
              v304 = v210;
              if (!v212)
                goto LABEL_214;
              v213 = *(_QWORD *)v334;
              while (1)
              {
                for (ii = 0; ii != v212; ++ii)
                {
                  if (*(_QWORD *)v334 != v213)
                    objc_enumerationMutation(v211);
                  v215 = *(_QWORD *)(*((_QWORD *)&v333 + 1) + 8 * ii);
                  v216 = v318->_construct;
                  v217 = (id *)&v318->_rolloutSupport;
                  switch(v216)
                  {
                    case 0uLL:
                      goto LABEL_211;
                    case 1uLL:
                      v219 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
LABEL_210:
                      v217 = (id *)((char *)&v318->super.super.isa + *v219);
LABEL_211:
                      objc_msgSend(*v217, "addMetric:", v215);
                      continue;
                    case 2uLL:
                      v218 = _os_feature_enabled_impl();
                      v219 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
                      if (v218)
                        goto LABEL_210;
                      break;
                  }
                }
                v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v333, v375, 16);
                if (!v212)
                {
LABEL_214:

                  v192 = 0x1E0CB3000;
                  v210 = v304;
                  break;
                }
              }
            }

          }
          -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 15);
          -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, v306, v313);
          if (*(_QWORD *)v385)
          {
            -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 1, 1);
          }
          else
          {
            -[TRIFetchFactorPackSetTask _recordExperimentFetchFailedWithTaskError:context:](v318, "_recordExperimentFetchFailedWithTaskError:context:", 15, v313);
            objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withCloudKitError:", v300, v344);
            -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 3, 1, 0);
          }
          v305 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_220;
        }
        v12 = objc_opt_new();
        -[TRIFactorPackSetStorage rampId](v11, "rampId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[TRIFactorPackSetStorage rampId](v11, "rampId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject ensureRolloutFields](v12, "ensureRolloutFields");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setClientRampId:", v14);

        }
        v16 = v318->_factorPackSetId;
        -[TRIFactorPackSetStorage targetedFactorPackSetId](v11, "targetedFactorPackSetId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[TRIFactorPackSetId isEqual:](v16, "isEqual:", v17))
        {
          -[TRIFactorPackSetStorage targetedTargetingRuleIndex](v11, "targetedTargetingRuleIndex");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (v19)
          {
LABEL_13:
            -[TRIRolloutTaskSupport mergeTelemetry:](v318->_rolloutSupport, "mergeTelemetry:", v12);
            goto LABEL_42;
          }
          -[TRIFactorPackSetStorage targetedTargetingRuleIndex](v11, "targetedTargetingRuleIndex");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "intValue");
          -[NSObject ensureRolloutFields](v12, "ensureRolloutFields");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setClientTargetingRuleGroupOrdinal:", v20);

        }
        goto LABEL_13;
      }
LABEL_58:
      v288 = 0;
      v300 = 0;
      v292 = 0;
      v306 = 0;
      v11 = 0;
      v296 = 0;
      goto LABEL_93;
    }
    objc_msgSend(v317, "bmltDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "taskRecordWithTaskDeployment:", v318->_bmltDeployment);
    v11 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIBMLTDeployment shortDesc](v318->_bmltDeployment, "shortDesc");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v40;
        _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "Warning: record for BMLT deployment %{public}@ not available; issuing incomplete telemetry.",
          buf,
          0xCu);

      }
LABEL_28:

      v41 = [TRIFactorPackSetStorage alloc];
      objc_msgSend(v317, "paths");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[TRIFactorPackSetStorage initWithPaths:](v41, "initWithPaths:", v42);

      *(_QWORD *)v385 = 0;
      if (!-[TRIFactorPackSetStorage hasFactorPackSetWithId:path:](v33, "hasFactorPackSetWithId:path:", v318->_factorPackSetId, v385))
      {

        v59 = 0;
        if (!v11)
          goto LABEL_58;
        goto LABEL_91;
      }
      objc_msgSend(v317, "namespaceDatabase");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v317, "paths");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "namespaceDescriptorsDefaultDir");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v43, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        TRILogCategory_Server();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          v273 = v318->_factorPackSetId;
          -[TRIBMLTDeployment shortDesc](v318->_bmltDeployment, "shortDesc");
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v273;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v274;
          _os_log_error_impl(&dword_1D207F000, v85, OS_LOG_TYPE_ERROR, "Unable to update preexisting factor pack set %{public}@ for BMLT deployment %{public}@: record not found in database.", buf, 0x16u);

        }
        -[TRIFetchFactorPackSetTask _addMetricForFetchFactorPackSetTaskError:](v318, "_addMetricForFetchFactorPackSetTaskError:", 29);
        -[TRIFetchFactorPackSetTask _bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:](v318, "_bmltFetchTelemetryIfApplicableWithSuccess:bmltRecord:serverContext:", 0, 0, v317);
        -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 3, 1, 0);
        v305 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_193;
      }
      -[TRIFactorPackSetStorage artifact](v11, "artifact");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "backgroundTask");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[TRIFetchFactorPackSetTask incompatibleNamespaceNameForBMLT:namespaceDescriptorProvider:](v318, "incompatibleNamespaceNameForBMLT:namespaceDescriptorProvider:", v48, v46);

      v50 = (void *)objc_opt_new();
      v51 = v318->_factorPackSetId;
      v365[0] = MEMORY[0x1E0C809B0];
      v365[1] = 3221225472;
      v365[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_319;
      v365[3] = &unk_1E93340C0;
      v52 = v50;
      v366 = v52;
      -[TRIFactorPackSetStorage enumerateCompatibleFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:](v33, "enumerateCompatibleFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v51, 0, v365);
      LODWORD(v51) = _os_feature_enabled_impl();
      if ((v51 & _os_feature_enabled_impl()) == 1)
      {
        v53 = (void *)objc_opt_new();
        v54 = v318->_factorPackSetId;
        v361[0] = MEMORY[0x1E0C809B0];
        v361[1] = 3221225472;
        v361[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_321;
        v361[3] = &unk_1E9334110;
        v362 = v46;
        v363 = v318;
        v55 = v53;
        v364 = v55;
        -[TRIFactorPackSetStorage enumerateFBFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:](v33, "enumerateFBFactorPacksForFactorPackSet:usingLegacyPaths:withBlock:", v54, 0, v361);
        if (objc_msgSend(v55, "count"))
          v56 = 0;
        else
          v56 = v49;
        if (v56)
        {
          TRILogCategory_Server();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = v318->_factorPackSetId;
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v58;
            _os_log_impl(&dword_1D207F000, v57, OS_LOG_TYPE_DEFAULT, "Flatbuffer Storage: Factor pack set %{public}@ contains ineligible factor pack. Re-fetching factor pack to find replacement.", buf, 0xCu);
          }

          v59 = 1;
        }
        else
        {
          TRILogCategory_Server();
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            v96 = v318->_factorPackSetId;
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v96;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = *(_QWORD *)v385;
            _os_log_impl(&dword_1D207F000, v95, OS_LOG_TYPE_DEFAULT, "Flatbuffer Storage: Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
              buf,
              0x16u);
          }

          -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 2, 0, 0);
          v305 = (id)objc_claimAutoreleasedReturnValue();
          v59 = 0;
        }

        if (v56)
        {
LABEL_87:
          v94 = 1;
          goto LABEL_89;
        }
        v94 = 0;
      }
      else
      {
        if (objc_msgSend(v52, "count"))
          v87 = 0;
        else
          v87 = v49;
        if (v87)
        {
          TRILogCategory_Server();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            v89 = v318->_factorPackSetId;
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v89;
            _os_log_impl(&dword_1D207F000, v88, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ contains ineligible factor pack. Re-fetching factor pack to find replacement.", buf, 0xCu);
          }

          v59 = 1;
          goto LABEL_87;
        }
        TRILogCategory_Server();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          v93 = v318->_factorPackSetId;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v93;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = *(_QWORD *)v385;
          _os_log_impl(&dword_1D207F000, v92, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
            buf,
            0x16u);
        }

        -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 2, 0, 0);
        v305 = (id)objc_claimAutoreleasedReturnValue();
        v94 = 0;
        v59 = 0;
      }
LABEL_89:

      if (v94)
      {

LABEL_91:
        -[TRIFactorPackSetStorage artifact](v11, "artifact");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "backgroundTask");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "selectedNamespace");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "name");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v391[0] = v100;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v391, 1);
        v296 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC0A00], "immediateDownloadNotificationKeyForNamespaceNames:", v296);
        v288 = v59 != 0;
        v300 = (id)objc_claimAutoreleasedReturnValue();

        v292 = 0;
        v306 = v11;
        goto LABEL_92;
      }
LABEL_193:

      goto LABEL_326;
    }
    v23 = objc_opt_new();
    v24 = v318->_factorPackSetId;
    -[TRIFactorPackSetStorage targetedFactorPackSetId](v11, "targetedFactorPackSetId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TRIFactorPackSetId isEqual:](v24, "isEqual:", v25))
    {
      -[TRIFactorPackSetStorage targetedTargetingRuleIndex](v11, "targetedTargetingRuleIndex");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
LABEL_19:
        -[TRIBMLTTaskSupport mergeTelemetry:](v318->_bmltSupport, "mergeTelemetry:", v23);
        goto LABEL_28;
      }
      -[TRIFactorPackSetStorage targetedTargetingRuleIndex](v11, "targetedTargetingRuleIndex");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v25, "intValue");
      -[NSObject ensureBMLTFields](v23, "ensureBMLTFields");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setClientBmltTargetingRuleGroupOrdinal:", v28);

    }
    goto LABEL_19;
  }
  objc_msgSend(v317, "experimentDatabase");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "experimentRecordWithExperimentDeployment:", v318->_experimentDeployment);
  v11 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();

  v31 = [TRIFactorPackSetStorage alloc];
  objc_msgSend(v317, "paths");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[TRIFactorPackSetStorage initWithPaths:](v31, "initWithPaths:", v32);

  *(_QWORD *)v385 = 0;
  if (!-[TRIFactorPackSetStorage hasFactorPackSetWithId:path:](v33, "hasFactorPackSetWithId:path:", v318->_factorPackSetId, v385))
  {

    if (!v11)
    {
      TRILogCategory_Server();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        -[TRIExperimentDeployment shortDesc](v318->_experimentDeployment, "shortDesc");
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v272;
        _os_log_error_impl(&dword_1D207F000, v84, OS_LOG_TYPE_ERROR, "Warning: record for experiment deployment %{public}@ not available.", buf, 0xCu);

      }
      goto LABEL_58;
    }
    objc_msgSend((id)objc_opt_class(), "_namespaceNamesFromExperimentRecord:", v11);
    v296 = (TRIFactorPackSetStorage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0A00], "immediateDownloadNotificationKeyForNamespaceNames:", v296);
    v300 = (id)objc_claimAutoreleasedReturnValue();
    v288 = 0;
    v306 = 0;
    v292 = v11;
LABEL_92:
    v11 = 0;
    goto LABEL_93;
  }
  TRILogCategory_Server();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v318->_factorPackSetId;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = *(_QWORD *)v385;
    _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "Factor pack set %{public}@ is already present; skipping download of factor packs. Path: %@",
      buf,
      0x16u);
  }

  -[TRIFactorPackSetStorage experimentDeployment](v11, "experimentDeployment");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "experimentId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFactorPackSetStorage treatmentId](v11, "treatmentId");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFactorPackSetStorage experimentDeployment](v11, "experimentDeployment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 4, v37, v38, objc_msgSend(v39, "deploymentId"), v11, 0, v317);

  -[TRIFetchFactorPackSetTask _taskResultForStatus:reportResultToServer:earliestRetryDate:](v318, "_taskResultForStatus:reportResultToServer:earliestRetryDate:", 2, 0, 0);
  v305 = (id)objc_claimAutoreleasedReturnValue();

LABEL_326:
  if (v299)
    v299[2](v299);

  objc_sync_exit(v318);
  return v305;
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("on_demand_subscribed_factor_failed_to_download_without_asset_fetch");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v3);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(v5 + 88);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2;
  v9[3] = &unk_1E9334098;
  v9[4] = v5;
  v10 = v6;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "runWithLockAcquired:", v9);

}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 138412290;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "factorName", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v9, "factorName");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "namespaceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "client");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_logOnDemandFactor:metricName:namespaceName:client:error:", v12, CFSTR("on_demand_factor_failed_to_download_by_subscription"), v13, v14, *(_QWORD *)(a1 + 48));

        }
        else
        {
          TRILogCategory_Server();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            goto LABEL_11;
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v16;
          v22 = v13;
          _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Missing factorname in %@", buf, 0xCu);
        }

LABEL_11:
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_315(_QWORD *a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v12 = a2;
  v5 = a3;
  v6 = (void *)v12;
  if (!(v12 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIFetchFactorPackSetTask.m"), 1009, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pbFactorPack || fbFactorLevel"));

    v6 = (void *)v12;
    goto LABEL_5;
  }
  if (!v5)
  {
LABEL_5:
    v10 = (void *)a1[5];
    objc_msgSend(v6, "selectedNamespace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    goto LABEL_6;
  }
  v7 = (void *)a1[5];
  objc_msgSend((id)v5, "namespaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);
LABEL_6:

}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_319(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(a3, "namespaceName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    objc_msgSend(a2, "selectedNamespace");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_321(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "namespaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorWithNamespaceName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "ncvs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_322;
    v14[3] = &unk_1E93340E8;
    v15 = v9;
    v16 = *(id *)(a1 + 48);
    v17 = v5;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
      objc_msgSend(v5, "namespaceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "From Flatbuffer storage: Factor pack set %{public}@ requires namespace %{public}@ which is not registered in Trial.", buf, 0x16u);

    }
    *a3 = 1;
  }

  objc_autoreleasePoolPop(v6);
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_322(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  int v8;
  void *v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  LODWORD(v6) = objc_msgSend(v6, "downloadNCV");
  v8 = objc_msgSend(v7, "intValue");

  if ((_DWORD)v6 == v8)
  {
    *a4 = 1;
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "namespaceName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_334(uint64_t a1, int a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "downloadNCV");
  if ((_DWORD)result == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_335(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  objc_autoreleasePoolPop(v3);
}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_347(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "type") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_349(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v8 = v3;
    objc_msgSend(v3, "factorName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "namespaceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_logOnDemandFactor:metricName:namespaceName:client:error:", v5, CFSTR("on_demand_factor_downloaded_by_subscription"), v6, v7, 0);

    objc_msgSend(*(id *)(a1 + 32), "_removeDownloadableRecord:", v8);
    v3 = v8;
  }

}

void __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "factorName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "namespaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_logOnDemandFactor:metricName:namespaceName:client:error:", v8, CFSTR("on_demand_factor_failed_to_download_by_subscription"), v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 32), "_removeDownloadableRecord:", v6);
  }

}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_352(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, a2);
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_354(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "downloadSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __59__TRIFetchFactorPackSetTask_runUsingContext_withTaskQueue___block_invoke_2_355(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "downloadSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)_namespaceNamesFromExperimentRecord:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "namespaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__TRIFetchFactorPackSetTask__namespaceNamesFromExperimentRecord___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (void)_logOnDemandFactor:(id)a3 metricName:(id)a4 namespaceName:(id)a5 client:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *context;
  id v30;

  v30 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v14 && objc_msgSend(v14, "shouldLogAtLevel:", 20))
  {
    context = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v16, 0);
    if (v15)
    {
      TRIFetchErrorParseToMetrics(v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v17, "addObjectsFromArray:", v18);
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0DC0F08];
        objc_msgSend(v15, "localizedDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "metricWithName:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v21);

      }
    }
    -[TRIFetchFactorPackSetTask trialSystemTelemetry](self, "trialSystemTelemetry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");

    objc_msgSend(v23, "ensureOnDemandFactorFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFactorName:", v30);

    objc_msgSend(v23, "ensureOnDemandFactorFields");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNamespaceName:", v13);

    objc_msgSend(v14, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackingId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchFactorPackSetTask dimensions](self, "dimensions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v27, v17, v28, v23);

    objc_autoreleasePoolPop(context);
  }

}

- (void)_addMetricForFetchFactorPackSetTaskError:(int)a3
{
  TRIRolloutTaskSupport **p_rolloutSupport;
  void *v5;
  void *v6;
  int *v7;
  unint64_t construct;
  id v9;

  p_rolloutSupport = &self->_rolloutSupport;
  if (self->_rolloutSupport || self->_bmltSupport || self->_experimentSupport)
  {
    v5 = (void *)MEMORY[0x1E0DC0F08];
    fetchTaskErrorAsString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metricWithName:categoricalValue:", CFSTR("fetchfactorpacksettask_error"), v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = &OBJC_IVAR___TRIFetchFactorPackSetTask__bmltSupport;
    construct = self->_construct;
    if (construct)
    {
      if (construct != 1)
      {
        if (construct != 2 || !_os_feature_enabled_impl())
          goto LABEL_11;
        v7 = &OBJC_IVAR___TRIFetchFactorPackSetTask__experimentSupport;
      }
      p_rolloutSupport = (TRIRolloutTaskSupport **)((char *)self + *v7);
    }
    -[TRIRolloutTaskSupport addMetric:](*p_rolloutSupport, "addMetric:", v9);
LABEL_11:

  }
}

- (void)_bmltFetchTelemetryIfApplicableWithSuccess:(BOOL)a3 bmltRecord:(id)a4 serverContext:(id)a5
{
  TRIBMLTDeployment *bmltDeployment;
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  bmltDeployment = self->_bmltDeployment;
  if (bmltDeployment)
  {
    v7 = a3;
    v9 = a5;
    v10 = a4;
    -[TRIBMLTDeployment backgroundMLTaskId](bmltDeployment, "backgroundMLTaskId");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId");
    if (v7)
      v12 = 6;
    else
      v12 = 5;
    +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:](TRITaskUtils, "updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:", v12, v13, v11, self->_factorPackSetId, v10, v9);

  }
}

- (BOOL)isEqual:(id)a3
{
  TRIFetchFactorPackSetTask *v4;
  TRIFetchFactorPackSetTask *v5;
  char v6;
  objc_super v8;

  v4 = (TRIFetchFactorPackSetTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIFetchFactorPackSetTask;
    if (-[TRIBaseTask isEqual:](&v8, sel_isEqual_, v4)
      && -[TRIFetchFactorPackSetTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      if (-[TRIFactorPackSetId isEqualToString:](self->_factorPackSetId, "isEqualToString:", v5->_factorPackSetId))v6 = -[TRITaskAttributing isEqual:](self->_taskAttribution, "isEqual:", v5->_taskAttribution);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRIFetchFactorPackSetTask;
  v3 = -[TRIBaseTask hash](&v6, sel_hash);
  v4 = -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash") + 37 * v3;
  return -[TRITaskAttributing hash](self->_taskAttribution, "hash") + 37 * v4;
}

- (id)dimensions
{
  void *rolloutSupport;

  rolloutSupport = self->_rolloutSupport;
  if (!rolloutSupport)
  {
    rolloutSupport = self->_bmltSupport;
    if (!rolloutSupport)
    {
      if (!_os_feature_enabled_impl())
      {
        rolloutSupport = 0;
        return rolloutSupport;
      }
      rolloutSupport = self->_experimentSupport;
      if (!rolloutSupport)
        return rolloutSupport;
    }
  }
  objc_msgSend(rolloutSupport, "dimensions");
  rolloutSupport = (void *)objc_claimAutoreleasedReturnValue();
  return rolloutSupport;
}

- (id)metrics
{
  void *rolloutSupport;

  rolloutSupport = self->_rolloutSupport;
  if (!rolloutSupport)
  {
    rolloutSupport = self->_bmltSupport;
    if (!rolloutSupport)
    {
      if (!_os_feature_enabled_impl())
      {
        rolloutSupport = 0;
        return rolloutSupport;
      }
      rolloutSupport = self->_experimentSupport;
      if (!rolloutSupport)
        return rolloutSupport;
    }
  }
  objc_msgSend(rolloutSupport, "metrics");
  rolloutSupport = (void *)objc_claimAutoreleasedReturnValue();
  return rolloutSupport;
}

- (id)trialSystemTelemetry
{
  void *rolloutSupport;

  rolloutSupport = self->_rolloutSupport;
  if (!rolloutSupport)
  {
    rolloutSupport = self->_bmltSupport;
    if (!rolloutSupport)
    {
      if (!_os_feature_enabled_impl())
      {
        rolloutSupport = 0;
        return rolloutSupport;
      }
      rolloutSupport = self->_experimentSupport;
      if (!rolloutSupport)
        return rolloutSupport;
    }
  }
  objc_msgSend(rolloutSupport, "trialSystemTelemetry");
  rolloutSupport = (void *)objc_claimAutoreleasedReturnValue();
  return rolloutSupport;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  unint64_t construct;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setFactorPackSetId:", self->_factorPackSetId);
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v4);

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchFactorPackSetTask retryCount](self, "retryCount"));
  construct = self->_construct;
  switch(construct)
  {
    case 2uLL:
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v3, "setConstruct:", 3);
        -[TRIExperimentDeployment experimentId](self->_experimentDeployment, "experimentId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setExperimentId:", v9);

        objc_msgSend(v3, "setDeploymentId:", -[TRIExperimentDeployment deploymentId](self->_experimentDeployment, "deploymentId"));
        objc_msgSend(v3, "setTreatmentId:", self->_treatmentId);
      }
      break;
    case 1uLL:
      objc_msgSend(v3, "setConstruct:", 2);
      -[TRIBMLTDeployment backgroundMLTaskId](self->_bmltDeployment, "backgroundMLTaskId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBmltId:", v8);

      objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId"));
      break;
    case 0uLL:
      objc_msgSend(v3, "setConstruct:", 1);
      -[TRIRolloutDeployment rolloutId](self->_rolloutDeployment, "rolloutId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setRolloutId:", v6);

      objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_rolloutDeployment, "deploymentId"));
      -[TRITaskCapabilityModifier asPersistedModifier](self->_capabilityModifier, "asPersistedModifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCapabilityModifier:", v7);

      break;
  }
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchFactorPackSetTask _asPersistedTask](self, "_asPersistedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 1823, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  int v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  const char *v36;
  objc_class *v37;
  objc_class *v38;
  void *v39;
  uint64_t v40;
  TRIFetchFactorPackSetTask *v41;
  NSObject *v42;
  objc_class *v43;
  void *v44;
  const char *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  TRITaskCapabilityModifier *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  TRITaskCapabilityModifier *v57;
  objc_class *v58;
  objc_class *v59;
  objc_class *v61;
  void *v62;
  objc_class *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_class *v67;
  objc_class *v68;
  void *v69;
  objc_class *v70;
  void *v71;
  objc_class *v72;
  void *v73;
  TRIFetchFactorPackSetTask *v74;
  void *v75;
  void *v76;
  objc_class *v77;
  objc_class *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  id v82;
  uint8_t buf[4];
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v82 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchFactorPackSetPersistedTask, "parseFromData:error:", a3, &v82);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v82;
  if (!v3)
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v84 = v4;
      _os_log_fault_impl(&dword_1D207F000, v17, OS_LOG_TYPE_FAULT, "Unable to parse buffer as TRIFetchFactorPackSetPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_74;
  }
  if (!objc_msgSend(v3, "hasConstruct"))
    goto LABEL_13;
  v5 = objc_msgSend(v3, "construct");
  if (v5 != 2)
  {
    if (v5 == 3)
    {
      if ((objc_msgSend(v3, "hasExperimentId") & 1) != 0)
      {
        objc_msgSend(v3, "experimentId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length");

        if (v7)
        {
          if ((objc_msgSend(v3, "hasDeploymentId") & 1) != 0)
          {
            v8 = objc_msgSend(v3, "hasTreatmentId");
            if ((v8 & 1) == 0)
            {
              TRILogCategory_Server();
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                v80 = (objc_class *)objc_opt_class();
                NSStringFromClass(v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v84 = v81;
                _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);

              }
            }
            v10 = 0;
            v11 = 0;
            v12 = v8 ^ 1;
            goto LABEL_52;
          }
          TRILogCategory_Server();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v84 = v30;
          v31 = "Cannot decode message of type %@ with missing field: deploymentId";
        }
        else
        {
          TRILogCategory_Server();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
LABEL_50:

            v10 = 0;
            v11 = 0;
            goto LABEL_51;
          }
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v84 = v30;
          v31 = "Cannot decode message of type %@ with field of length 0: experimentId";
        }
      }
      else
      {
        TRILogCategory_Server();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v84 = v71;
          _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

        }
        TRILogCategory_Server();
        v28 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          goto LABEL_50;
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v84 = v30;
        v31 = "Cannot decode message of type %@ with missing field: experimentId";
      }
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);

      goto LABEL_50;
    }
LABEL_13:
    if ((objc_msgSend(v3, "hasRolloutId") & 1) != 0)
    {
      objc_msgSend(v3, "rolloutId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        v15 = objc_msgSend(v3, "hasDeploymentId");
        if ((v15 & 1) == 0)
        {
          TRILogCategory_Server();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v68 = (objc_class *)objc_opt_class();
            NSStringFromClass(v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v69;
            _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: deploymentId", buf, 0xCu);

          }
        }
        v10 = 0;
        v12 = v15 ^ 1;
        v11 = 1;
        goto LABEL_52;
      }
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v21;
      v22 = "Cannot decode message of type %@ with field of length 0: rolloutId";
    }
    else
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v84 = v64;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);

      }
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v21;
      v22 = "Cannot decode message of type %@ with missing field: rolloutId";
    }
    _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

LABEL_34:
    v10 = 0;
    v11 = 1;
LABEL_51:
    v12 = 1;
    goto LABEL_52;
  }
  if ((objc_msgSend(v3, "hasBmltId") & 1) == 0)
  {
    TRILogCategory_Server();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v72 = (objc_class *)objc_opt_class();
      NSStringFromClass(v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v73;
      _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: bmltId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v35;
    v36 = "Cannot decode message of type %@ with missing field: bmltId";
    goto LABEL_89;
  }
  objc_msgSend(v3, "bmltId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (!v24)
  {
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
LABEL_46:

      v11 = 0;
      v10 = 1;
      goto LABEL_51;
    }
    v77 = (objc_class *)objc_opt_class();
    NSStringFromClass(v77);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v35;
    v36 = "Cannot decode message of type %@ with field of length 0: bmltId";
LABEL_89:
    _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);

    goto LABEL_46;
  }
  v25 = objc_msgSend(v3, "hasDeploymentId");
  if ((v25 & 1) == 0)
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v78 = (objc_class *)objc_opt_class();
      NSStringFromClass(v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v79;
      _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: deploymentId", buf, 0xCu);

    }
  }
  v11 = 0;
  v12 = v25 ^ 1;
  v10 = 1;
LABEL_52:
  if ((objc_msgSend(v3, "hasFactorPackSetId") & 1) == 0)
  {
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v61 = (objc_class *)objc_opt_class();
      NSStringFromClass(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v62;
      _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: factorPackSetId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v44;
    v45 = "Cannot decode message of type %@ with missing field: factorPackSetId";
    goto LABEL_73;
  }
  objc_msgSend(v3, "factorPackSetId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "length");

  if (!v40)
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v44;
    v45 = "Cannot decode message of type %@ with field of length 0: factorPackSetId";
    goto LABEL_73;
  }
  if ((v12 & 1) == 0)
  {
    if ((objc_msgSend(v3, "hasTaskAttribution") & 1) != 0)
    {
      if ((objc_msgSend(v3, "hasRetryCount") & 1) != 0)
      {
        objc_msgSend(v3, "factorPackSetId");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateFactorPackSetId();
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v3, "taskAttribution");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v49)
          {
            v41 = 0;
LABEL_87:

            goto LABEL_75;
          }
          if (v11)
          {
            v50 = (void *)MEMORY[0x1E0DC0B60];
            objc_msgSend(v3, "rolloutId");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "deploymentWithRolloutId:deploymentId:", v51, objc_msgSend(v3, "deploymentId"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v3, "hasCapabilityModifier") & 1) != 0)
            {
              v53 = [TRITaskCapabilityModifier alloc];
              objc_msgSend(v3, "capabilityModifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "add");
              objc_msgSend(v3, "capabilityModifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = -[TRITaskCapabilityModifier initWithAdd:remove:](v53, "initWithAdd:remove:", v55, objc_msgSend(v56, "remove"));

            }
            else
            {
              v57 = (TRITaskCapabilityModifier *)objc_opt_new();
            }
            v74 = -[TRIFetchFactorPackSetTask initWithFactorPackSetId:taskAttribution:rolloutDeployment:capabilityModifier:]([TRIFetchFactorPackSetTask alloc], "initWithFactorPackSetId:taskAttribution:rolloutDeployment:capabilityModifier:", v17, v49, v52, v57);
          }
          else
          {
            if (v10)
            {
              v65 = (void *)MEMORY[0x1E0DC09A8];
              objc_msgSend(v3, "bmltId");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "deploymentWithBackgroundMLTaskId:deploymentId:", v66, objc_msgSend(v3, "deploymentId"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = -[TRIFetchFactorPackSetTask initWithFactorPackSetId:taskAttribution:bmltDeployment:]([TRIFetchFactorPackSetTask alloc], "initWithFactorPackSetId:taskAttribution:bmltDeployment:", v17, v49, v52);
LABEL_86:

              -[TRIFetchFactorPackSetTask setRetryCount:](v41, "setRetryCount:", objc_msgSend(v3, "retryCount"));
              goto LABEL_87;
            }
            v75 = (void *)MEMORY[0x1E0DC0A30];
            objc_msgSend(v3, "experimentId");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "deploymentWithExperimentId:deploymentId:", v76, objc_msgSend(v3, "deploymentId"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "treatmentId");
            v57 = (TRITaskCapabilityModifier *)objc_claimAutoreleasedReturnValue();
            v74 = -[TRIFetchFactorPackSetTask initWithFactorPackSetId:treatmentId:taskAttribution:experimentDeployment:]([TRIFetchFactorPackSetTask alloc], "initWithFactorPackSetId:treatmentId:taskAttribution:experimentDeployment:", v17, v57, v49, v52);
          }
          v41 = v74;

          goto LABEL_86;
        }
LABEL_74:
        v41 = 0;
LABEL_75:

        goto LABEL_76;
      }
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v44;
      v45 = "Cannot decode message of type %@ with missing field: retryCount";
    }
    else
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      v58 = (objc_class *)objc_opt_class();
      NSStringFromClass(v58);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v44;
      v45 = "Cannot decode message of type %@ with missing field: taskAttribution";
    }
LABEL_73:
    _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, v45, buf, 0xCu);

    goto LABEL_74;
  }
  v41 = 0;
LABEL_76:

  return v41;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  objc_super v8;

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");
  v8.receiver = self;
  v8.super_class = (Class)TRIFetchFactorPackSetTask;
  v5 = -[TRIBaseTask requiredCapabilities](&v8, sel_requiredCapabilities) | v4;
  v6 = v5 | (4 * (-[TRIFetchFactorPackSetTask retryCount](self, "retryCount") > 0));

  return -[TRITaskCapabilityModifier updateCapability:](self->_capabilityModifier, "updateCapability:", v6);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  TRIFactorPackSetId *factorPackSetId;
  void *v10;
  void *v11;

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "discretionaryBehavior");
  v5 = CFSTR("disc");
  if (!v4)
    v5 = CFSTR("non-disc");
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  factorPackSetId = self->_factorPackSetId;
  -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttribution, "applicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@:%@,a:%@,d:%@,r:%d>"), v8, factorPackSetId, v10, v6, -[TRIFetchFactorPackSetTask retryCount](self, "retryCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchFactorPackSetTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchFactorPackSetTask *v5;
  void *v6;
  TRIFetchFactorPackSetTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchFactorPackSetTask;
  v5 = -[TRIFetchFactorPackSetTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchFactorPackSetTask *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchFactorPackSetTask.m"), 1927, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchFactorPackSetTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (TRIRolloutDeployment)rolloutDeployment
{
  return self->_rolloutDeployment;
}

- (TRIBMLTDeployment)bmltDeployment
{
  return self->_bmltDeployment;
}

- (TRIExperimentDeployment)experimentDeployment
{
  return self->_experimentDeployment;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
  objc_storeStrong((id *)&self->_rolloutDeployment, 0);
  objc_storeStrong((id *)&self->_guardedDownloadableRecord, 0);
  objc_storeStrong((id *)&self->_factorRecordsByAssetId, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentSupport, 0);
  objc_storeStrong((id *)&self->_bmltSupport, 0);
  objc_storeStrong((id *)&self->_rolloutSupport, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end
