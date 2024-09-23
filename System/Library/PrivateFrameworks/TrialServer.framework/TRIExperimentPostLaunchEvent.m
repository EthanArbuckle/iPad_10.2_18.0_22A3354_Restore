@implementation TRIExperimentPostLaunchEvent

- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 treatmentTriple:(id)a5 errorOrDeactivationReason:(id)a6 deploymentEnvironment:(int)a7 versionedNamespaces:(id)a8 telemetry:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  TRIExperimentPostLaunchEvent *v18;
  TRIExperimentPostLaunchEvent *v19;
  void *v21;
  id v25;
  objc_super v26;

  v25 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentPostLaunchEvent.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentTriple"));

  }
  v26.receiver = self;
  v26.super_class = (Class)TRIExperimentPostLaunchEvent;
  v18 = -[TRIExperimentPostLaunchEvent init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_eventType = a3;
    objc_storeStrong((id *)&v18->_experimentStateName, a4);
    objc_storeStrong((id *)&v19->_treatmentTriple, a5);
    objc_storeStrong((id *)&v19->_errorOrDeactivationReason, a6);
    v19->_deploymentEnvironment = a7;
    objc_storeStrong((id *)&v19->_versionedNamespaces, a8);
    objc_storeStrong((id *)&v19->_additionalTelemetry, a9);
  }

  return v19;
}

- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 experimentRecord:(id)a5 errorOrDeactivationReason:(id)a6
{
  return -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:telemetry:](self, "initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:telemetry:", a3, a4, a5, a6, 0);
}

- (TRIExperimentPostLaunchEvent)initWithEventType:(unsigned __int8)a3 experimentStateName:(id)a4 experimentRecord:(id)a5 errorOrDeactivationReason:(id)a6 telemetry:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  TRIExperimentPostLaunchEvent *v25;
  unsigned int v27;

  v27 = a3;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v13, "treatmentId");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("unspecified-or-default-treatment");
  if (v15)
    v17 = (__CFString *)v15;
  v18 = v17;

  objc_msgSend(v13, "experimentDeployment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "experimentId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "experimentDeployment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v20, objc_msgSend(v21, "deploymentId"), v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v13, "deploymentEnvironment");
  objc_msgSend(v13, "versionedNamespaces");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:treatmentTriple:errorOrDeactivationReason:deploymentEnvironment:versionedNamespaces:telemetry:](self, "initWithEventType:experimentStateName:treatmentTriple:errorOrDeactivationReason:deploymentEnvironment:versionedNamespaces:telemetry:", v27, v14, v22, v12, v23, v24, v11);
  return v25;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (NSString)experimentStateName
{
  return self->_experimentStateName;
}

- (TRIExperimentDeploymentTreatment)treatmentTriple
{
  return self->_treatmentTriple;
}

- (NSString)errorOrDeactivationReason
{
  return self->_errorOrDeactivationReason;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (NSArray)versionedNamespaces
{
  return self->_versionedNamespaces;
}

- (TRITrialSystemTelemetry)additionalTelemetry
{
  return self->_additionalTelemetry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTelemetry, 0);
  objc_storeStrong((id *)&self->_versionedNamespaces, 0);
  objc_storeStrong((id *)&self->_errorOrDeactivationReason, 0);
  objc_storeStrong((id *)&self->_treatmentTriple, 0);
  objc_storeStrong((id *)&self->_experimentStateName, 0);
}

+ (id)eventWithEventType:(unsigned __int8)a3 experimentRecord:(id)a4
{
  uint64_t v4;
  id v7;
  TRIExperimentPostLaunchEvent *v8;
  TRIExperimentPostLaunchEvent *v9;
  void *v10;
  void *v12;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  if (+[TRIExperimentPostLaunchEvent _isCategoricalLoggingEventType:](TRIExperimentPostLaunchEvent, "_isCategoricalLoggingEventType:", v4))
  {
    v8 = 0;
  }
  else
  {
    v9 = [TRIExperimentPostLaunchEvent alloc];
    +[TRIExperimentPostLaunchEvent _experimentStateNameForType:](TRIExperimentPostLaunchEvent, "_experimentStateNameForType:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:](v9, "initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:", v4, v10, v7, 0);

  }
  return v8;
}

+ (id)eventWithEventType:(unsigned __int8)a3 treatmentTriple:(id)a4
{
  uint64_t v4;
  id v7;
  TRIExperimentPostLaunchEvent *v8;
  TRIExperimentPostLaunchEvent *v9;
  void *v10;
  void *v12;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentTriple"));

  }
  if (+[TRIExperimentPostLaunchEvent _isCategoricalLoggingEventType:](TRIExperimentPostLaunchEvent, "_isCategoricalLoggingEventType:", v4))
  {
    v8 = 0;
  }
  else
  {
    v9 = [TRIExperimentPostLaunchEvent alloc];
    +[TRIExperimentPostLaunchEvent _experimentStateNameForType:](TRIExperimentPostLaunchEvent, "_experimentStateNameForType:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:treatmentTriple:errorOrDeactivationReason:deploymentEnvironment:versionedNamespaces:telemetry:](v9, "initWithEventType:experimentStateName:treatmentTriple:errorOrDeactivationReason:deploymentEnvironment:versionedNamespaces:telemetry:", v4, v10, v7, 0, 0, 0, 0);

  }
  return v8;
}

+ (BOOL)_isCategoricalLoggingEventType:(unsigned __int8)a3
{
  return (a3 < 0xAu) & (0x3C8u >> a3);
}

+ (id)deactivationEventWithTriggerEvent:(unint64_t)a3 experimentRecord:(id)a4 additionalTelemetry:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  TRIExperimentPostLaunchEvent *v13;
  void *v14;
  TRIExperimentPostLaunchEvent *v15;
  void *v17;
  void *v18;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("telemetry"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  +[TRIDeactivationTriggerEventString categoricalValueForTriggerEvent:](TRIDeactivationTriggerEventString, "categoricalValueForTriggerEvent:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [TRIExperimentPostLaunchEvent alloc];
  +[TRIExperimentPostLaunchEvent _experimentStateNameForType:](TRIExperimentPostLaunchEvent, "_experimentStateNameForType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:telemetry:](v13, "initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:telemetry:", 3, v14, v9, v12, v11);

  return v15;
}

+ (id)failureEventWithEventType:(unsigned __int8)a3 treatmentTriple:(id)a4 failureReason:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  TRIExperimentPostLaunchEvent *v10;
  void *v11;
  TRIExperimentPostLaunchEvent *v12;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a1, "_isErrorType:", v6))
  {
    v10 = [TRIExperimentPostLaunchEvent alloc];
    +[TRIExperimentPostLaunchEvent _experimentStateNameForType:](TRIExperimentPostLaunchEvent, "_experimentStateNameForType:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:treatmentTriple:errorOrDeactivationReason:deploymentEnvironment:versionedNamespaces:telemetry:](v10, "initWithEventType:experimentStateName:treatmentTriple:errorOrDeactivationReason:deploymentEnvironment:versionedNamespaces:telemetry:", v6, v11, v8, v9, 0, 0, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)obsoletionOrDeactivationEventWithTriggerEvent:(unint64_t)a3 previousStateProvider:(id)a4 experimentRecord:(id)a5 additionalTelemetry:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  TRIExperimentPostLaunchEvent *v25;
  __CFString *v26;
  TRIExperimentPostLaunchEvent *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v11 = a5;
  v12 = a6;
  v13 = a4;
  if (objc_msgSend(v11, "status") == 2)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 199, CFSTR("Cannot attempt to obsolete for a record not in enrollment"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prevProvider"));

LABEL_3:
  objc_msgSend(v11, "treatmentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v12)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record.treatmentId"));

    if (v12)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExperimentPostLaunchEvent.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("telemetry"));

LABEL_5:
  objc_msgSend(v11, "experimentDeployment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "experimentId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "experimentDeployment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "deploymentId");
  objc_msgSend(v11, "treatmentId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v16, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v13, "previousExperimentStateForTriple:", v20);
  if (v21 == 1)
    v22 = 9;
  else
    v22 = 4;
  if (v21 == 4)
    v23 = 10;
  else
    v23 = v22;

  +[TRIDeactivationTriggerEventString categoricalValueForTriggerEvent:](TRIDeactivationTriggerEventString, "categoricalValueForTriggerEvent:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [TRIExperimentPostLaunchEvent alloc];
  if ((v23 - 4) >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E9330350[v23 - 4];
  }
  v27 = -[TRIExperimentPostLaunchEvent initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:telemetry:](v25, "initWithEventType:experimentStateName:experimentRecord:errorOrDeactivationReason:telemetry:", 3, v26, v11, v24, v12);

  return v27;
}

+ (BOOL)_isErrorType:(unsigned __int8)a3
{
  return (a3 - 6) < 4;
}

+ (id)_experimentStateNameForType:(unsigned __int8)a3
{
  uint64_t v3;
  id result;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  result = 0;
  v5 = CFSTR("exp_st_AL");
  switch(a3)
  {
    case 0u:
    case 5u:
      return result;
    case 1u:
      goto LABEL_12;
    case 2u:
      v5 = CFSTR("exp_st_AC");
      goto LABEL_12;
    case 3u:
      v5 = CFSTR("exp_st_DE");
      goto LABEL_12;
    case 4u:
      v5 = CFSTR("exp_st_FE");
      goto LABEL_12;
    case 6u:
      v5 = CFSTR("exp_st_AL_F");
      goto LABEL_12;
    case 7u:
      v5 = CFSTR("exp_st_FE_F");
      goto LABEL_12;
    case 8u:
      v5 = CFSTR("exp_st_AC_F");
      goto LABEL_12;
    case 9u:
      v5 = CFSTR("exp_st_DE_F");
LABEL_12:
      result = v5;
      break;
    default:
      TRILogCategory_Server();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unexpected eventType %@ encountered", (uint8_t *)&v8, 0xCu);

      }
      result = 0;
      break;
  }
  return result;
}

- (id)experimentRecord
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  -[TRIExperimentPostLaunchEvent treatmentTriple](self, "treatmentTriple");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIExperimentPostLaunchEvent treatmentTriple](self, "treatmentTriple");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deploymentId");

  -[TRIExperimentPostLaunchEvent treatmentTriple](self, "treatmentTriple");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "treatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC0A40];
  v10 = (void *)objc_opt_new();
  v11 = -[TRIExperimentPostLaunchEvent eventType](self, "eventType");
  v12 = -[TRIExperimentPostLaunchEvent deploymentEnvironment](self, "deploymentEnvironment");
  -[TRIExperimentPostLaunchEvent errorOrDeactivationReason](self, "errorOrDeactivationReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentPostLaunchEvent versionedNamespaces](self, "versionedNamespaces");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", v10, v11, v12, v4, v6, v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
