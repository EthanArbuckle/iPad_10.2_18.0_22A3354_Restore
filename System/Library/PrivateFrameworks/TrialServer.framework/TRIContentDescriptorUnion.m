@implementation TRIContentDescriptorUnion

- (TRIContentDescriptorUnion)initWithType:(unsigned __int8)a3 experiment:(id)a4 treatment:(id)a5 rollout:(id)a6 factorPackSet:(id)a7 bmlt:(id)a8
{
  id v15;
  id v16;
  id v17;
  TRIContentDescriptorUnion *v18;
  TRIContentDescriptorUnion *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)TRIContentDescriptorUnion;
  v18 = -[TRIContentDescriptorUnion init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_experiment, a4);
    objc_storeStrong((id *)&v19->_treatment, a5);
    objc_storeStrong((id *)&v19->_rollout, a6);
    objc_storeStrong((id *)&v19->_factorPackSet, a7);
    objc_storeStrong((id *)&v19->_bmlt, a8);
  }

  return v19;
}

+ (id)unionWithType:(unsigned __int8)a3 experiment:(id)a4 treatment:(id)a5 rollout:(id)a6 factorPackSet:(id)a7 bmlt:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v12 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", v12, v18, v17, v16, v15, v14);

  return v19;
}

- (id)copyWithReplacementType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", a3, self->_experiment, self->_treatment, self->_rollout, self->_factorPackSet, self->_bmlt);
}

- (id)copyWithReplacementExperiment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", self->_type, v4, self->_treatment, self->_rollout, self->_factorPackSet, self->_bmlt);

  return v5;
}

- (id)copyWithReplacementTreatment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", self->_type, self->_experiment, v4, self->_rollout, self->_factorPackSet, self->_bmlt);

  return v5;
}

- (id)copyWithReplacementRollout:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", self->_type, self->_experiment, self->_treatment, v4, self->_factorPackSet, self->_bmlt);

  return v5;
}

- (id)copyWithReplacementFactorPackSet:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", self->_type, self->_experiment, self->_treatment, self->_rollout, v4, self->_bmlt);

  return v5;
}

- (id)copyWithReplacementBmlt:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:experiment:treatment:rollout:factorPackSet:bmlt:", self->_type, self->_experiment, self->_treatment, self->_rollout, self->_factorPackSet, v4);

  return v5;
}

- (BOOL)isEqualToUnion:(id)a3
{
  id v4;
  void *v5;
  int type;
  int v7;
  void *v8;
  int v9;
  TRIExperimentDeployment *experiment;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  TRITreatmentContentDescriptor *treatment;
  void *v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  int v21;
  TRIRolloutDeployment *rollout;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  TRIFactorPackSetId *factorPackSet;
  void *v29;
  int v30;
  int v31;
  void *v32;
  int v33;
  TRIBMLTDeployment *bmlt;
  void *v35;
  char v36;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_18;
  v7 = self->_experiment != 0;
  objc_msgSend(v5, "experiment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v7 == v9)
    goto LABEL_18;
  experiment = self->_experiment;
  if (experiment)
  {
    objc_msgSend(v5, "experiment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TRIExperimentDeployment isEqual:](experiment, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  v13 = self->_treatment != 0;
  objc_msgSend(v5, "treatment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_18;
  treatment = self->_treatment;
  if (treatment)
  {
    objc_msgSend(v5, "treatment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRITreatmentContentDescriptor isEqual:](treatment, "isEqual:", v17);

    if (!v18)
      goto LABEL_18;
  }
  v19 = self->_rollout != 0;
  objc_msgSend(v5, "rollout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
    goto LABEL_18;
  rollout = self->_rollout;
  if (rollout)
  {
    objc_msgSend(v5, "rollout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[TRIRolloutDeployment isEqual:](rollout, "isEqual:", v23);

    if (!v24)
      goto LABEL_18;
  }
  v25 = self->_factorPackSet != 0;
  objc_msgSend(v5, "factorPackSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (v25 == v27)
    goto LABEL_18;
  factorPackSet = self->_factorPackSet;
  if (factorPackSet)
  {
    objc_msgSend(v5, "factorPackSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[TRIFactorPackSetId isEqual:](factorPackSet, "isEqual:", v29);

    if (!v30)
      goto LABEL_18;
  }
  v31 = self->_bmlt != 0;
  objc_msgSend(v5, "bmlt");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (v31 == v33)
  {
LABEL_18:
    v36 = 0;
  }
  else
  {
    bmlt = self->_bmlt;
    if (bmlt)
    {
      objc_msgSend(v5, "bmlt");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[TRIBMLTDeployment isEqual:](bmlt, "isEqual:", v35);

    }
    else
    {
      v36 = 1;
    }
  }

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  TRIContentDescriptorUnion *v4;
  TRIContentDescriptorUnion *v5;
  BOOL v6;

  v4 = (TRIContentDescriptorUnion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIContentDescriptorUnion isEqualToUnion:](self, "isEqualToUnion:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t type;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type = self->_type;
  v4 = -[TRIExperimentDeployment hash](self->_experiment, "hash") - type + 32 * type;
  v5 = -[TRITreatmentContentDescriptor hash](self->_treatment, "hash") - v4 + 32 * v4;
  v6 = -[TRIRolloutDeployment hash](self->_rollout, "hash") - v5 + 32 * v5;
  v7 = -[TRIFactorPackSetId hash](self->_factorPackSet, "hash") - v6 + 32 * v6;
  return -[TRIBMLTDeployment hash](self->_bmlt, "hash") - v7 + 32 * v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIContentDescriptorUnion | type:%@ experiment:%@ treatment:%@ rollout:%@ factorPackSet:%@ bmlt:%@>"), v4, self->_experiment, self->_treatment, self->_rollout, self->_factorPackSet, self->_bmlt);

  return v5;
}

- (unsigned)type
{
  return self->_type;
}

- (TRIExperimentDeployment)experiment
{
  return self->_experiment;
}

- (TRITreatmentContentDescriptor)treatment
{
  return self->_treatment;
}

- (TRIRolloutDeployment)rollout
{
  return self->_rollout;
}

- (TRIFactorPackSetId)factorPackSet
{
  return self->_factorPackSet;
}

- (TRIBMLTDeployment)bmlt
{
  return self->_bmlt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmlt, 0);
  objc_storeStrong((id *)&self->_factorPackSet, 0);
  objc_storeStrong((id *)&self->_rollout, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
}

@end
