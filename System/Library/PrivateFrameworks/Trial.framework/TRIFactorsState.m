@implementation TRIFactorsState

- (unint64_t)hash
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFactorsState)initWithPersisted:(id)a3
{
  id v5;
  int v6;
  TRIRolloutDeployment *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  TRIRolloutDeployment *v12;
  void *v13;
  void *v14;
  void *v15;
  __objc2_class *v16;
  void *v17;
  int v18;
  TRIBMLTDeployment *v19;
  void *v20;
  void *v21;
  void *v22;
  TRIFactorsState *v23;
  void *v24;
  int v25;
  TRIExperimentDeployment *v26;
  void *v27;
  void *v28;
  void *v29;
  TRIExperimentFactorsState *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persisted"));

  }
  v6 = objc_msgSend(v5, "stateOneOfCase");
  if (v6 != 3)
  {
    if (v6 != 2)
    {
      if (v6 != 1)
        goto LABEL_20;
      objc_msgSend(v5, "rollout");
      v7 = (TRIRolloutDeployment *)objc_claimAutoreleasedReturnValue();
      if (-[TRIRolloutDeployment hasRolloutId](v7, "hasRolloutId"))
      {
        objc_msgSend(v5, "rollout");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "rolloutId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v5, "rollout");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasDeploymentId");

          if (v11)
          {
            v12 = [TRIRolloutDeployment alloc];
            objc_msgSend(v5, "rollout");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "rolloutId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "rollout");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](v12, "initWithRolloutId:deploymentId:", v14, objc_msgSend(v15, "deploymentId"));

            v16 = TRIRolloutFactorsState;
LABEL_14:
            v23 = (TRIFactorsState *)objc_msgSend([v16 alloc], "initWithDeployment:", v7);
LABEL_23:

            goto LABEL_24;
          }
          goto LABEL_20;
        }
        goto LABEL_21;
      }
LABEL_22:
      v23 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v5, "experiment");
    v7 = (TRIRolloutDeployment *)objc_claimAutoreleasedReturnValue();
    if (!-[TRIRolloutDeployment hasExperimentId](v7, "hasExperimentId"))
      goto LABEL_22;
    objc_msgSend(v5, "experiment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v5, "experiment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "hasDeploymentId");

      if (v25)
      {
        v26 = [TRIExperimentDeployment alloc];
        objc_msgSend(v5, "experiment");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "experimentId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "experiment");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:](v26, "initWithExperimentId:deploymentId:", v28, objc_msgSend(v29, "deploymentId"));

        v30 = [TRIExperimentFactorsState alloc];
        objc_msgSend(v5, "experiment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "hasTreatmentId") & 1) != 0)
        {
          objc_msgSend(v5, "experiment");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "treatmentId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[TRIExperimentFactorsState initWithDeployment:treatmentId:](v30, "initWithDeployment:treatmentId:", v7, v33);

        }
        else
        {
          v23 = -[TRIExperimentFactorsState initWithDeployment:treatmentId:](v30, "initWithDeployment:treatmentId:", v7, 0);
        }

        goto LABEL_23;
      }
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v5, "bmlt");
  v7 = (TRIRolloutDeployment *)objc_claimAutoreleasedReturnValue();
  if (!-[TRIRolloutDeployment hasBmltId](v7, "hasBmltId"))
    goto LABEL_22;
  objc_msgSend(v5, "bmlt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bmltId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
    goto LABEL_21;
  objc_msgSend(v5, "bmlt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasDeploymentId");

  if (v18)
  {
    v19 = [TRIBMLTDeployment alloc];
    objc_msgSend(v5, "bmlt");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bmltId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bmlt");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TRIBMLTDeployment initWithBackgroundMLTaskId:deploymentId:](v19, "initWithBackgroundMLTaskId:deploymentId:", v21, objc_msgSend(v22, "deploymentId"));

    v16 = TRIBMLTFactorsState;
    goto LABEL_14;
  }
LABEL_20:
  v23 = 0;
LABEL_24:

  return v23;
}

- (id)persisted
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 88, CFSTR("not implemented"));

  return 0;
}

- (TRIFactorsState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  TRIFactorsState *v8;
  void *v9;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedFactorsState, "parseFromData:error:", v5, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v6)
    {
      self = -[TRIFactorsState initWithPersisted:](self, "initWithPersisted:", v6);
      v8 = self;
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v7);
      v8 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = 0;
    else
      v8 = (TRIFactorsState *)objc_opt_new();

  }
  return v8;
}

- (TRIFactorsStateExperimentIdentifiers)experimentIdentifiers
{
  return 0;
}

- (TRIFactorsStateRolloutIdentifiers)rolloutIdentifiers
{
  return 0;
}

- (TRIFactorsStateBMLTIdentifiers)bmltIdentifiers
{
  return 0;
}

@end
