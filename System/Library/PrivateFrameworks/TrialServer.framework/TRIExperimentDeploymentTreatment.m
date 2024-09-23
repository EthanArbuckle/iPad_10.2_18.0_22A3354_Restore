@implementation TRIExperimentDeploymentTreatment

- (TRIExperimentDeploymentTreatment)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v10;
  id v11;
  void *v12;
  TRIExperimentDeploymentTreatment *v13;
  TRIExperimentDeploymentTreatment *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 5176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 5177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)TRIExperimentDeploymentTreatment;
  v13 = -[TRIExperimentDeploymentTreatment init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_experimentId, a3);
    v14->_deploymentId = a4;
    objc_storeStrong((id *)&v14->_treatmentId, a5);
  }

  return v14;
}

+ (id)treatmentTripleWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExperimentId:deploymentId:treatmentId:", v9, v5, v8);

  return v10;
}

- (id)copyWithReplacementExperimentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExperimentId:deploymentId:treatmentId:", v4, self->_deploymentId, self->_treatmentId);

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExperimentId:deploymentId:treatmentId:", self->_experimentId, *(_QWORD *)&a3, self->_treatmentId);
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExperimentId:deploymentId:treatmentId:", self->_experimentId, self->_deploymentId, v4);

  return v5;
}

- (BOOL)isEqualTotreatmentTriple:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *experimentId;
  void *v10;
  int v11;
  int deploymentId;
  int v13;
  void *v14;
  int v15;
  NSString *treatmentId;
  void *v17;
  char v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  v6 = self->_experimentId != 0;
  objc_msgSend(v4, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_9;
  experimentId = self->_experimentId;
  if (experimentId)
  {
    objc_msgSend(v5, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](experimentId, "isEqual:", v10);

    if (!v11)
      goto LABEL_9;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId")
    || (v13 = self->_treatmentId != 0,
        objc_msgSend(v5, "treatmentId"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v13 == v15))
  {
LABEL_9:
    v18 = 0;
  }
  else
  {
    treatmentId = self->_treatmentId;
    if (treatmentId)
    {
      objc_msgSend(v5, "treatmentId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NSString isEqual:](treatmentId, "isEqual:", v17);

    }
    else
    {
      v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  TRIExperimentDeploymentTreatment *v4;
  TRIExperimentDeploymentTreatment *v5;
  BOOL v6;

  v4 = (TRIExperimentDeploymentTreatment *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIExperimentDeploymentTreatment isEqualTotreatmentTriple:](self, "isEqualTotreatmentTriple:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_experimentId, "hash");
  v4 = self->_deploymentId - v3 + 32 * v3;
  return -[NSString hash](self->_treatmentId, "hash") - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIExperimentDeploymentTreatment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  TRIExperimentDeploymentTreatment *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_8;
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Retrieved nil serialized value for nonnull TRIExperimentDeploymentTreatment.experimentId");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = 2;
LABEL_14:
    v17 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("TRIExperimentDeploymentTreatmentOCNTErrorDomain"), v12, v8);
    objc_msgSend(v4, "failWithError:", v17);

    goto LABEL_15;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentId"));
  if ((_DWORD)v6)
  {
LABEL_3:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("treatmentId"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      self = -[TRIExperimentDeploymentTreatment initWithExperimentId:deploymentId:treatmentId:](self, "initWithExperimentId:deploymentId:treatmentId:", v5, v6, v7);
      v9 = self;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v4, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("Retrieved nil serialized value for nonnull TRIExperimentDeploymentTreatment.treatmentId");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIExperimentDeploymentTreatmentOCNTErrorDomain"), 2, v15);
      objc_msgSend(v4, "failWithError:", v16);

    }
    v8 = 0;
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentId")) & 1) != 0)
      goto LABEL_3;
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("Missing serialized value for TRIExperimentDeploymentTreatment.deploymentId");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = 1;
    goto LABEL_14;
  }
LABEL_8:
  v9 = 0;
LABEL_17:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *experimentId;
  NSString *treatmentId;
  id v6;

  v6 = a3;
  experimentId = self->_experimentId;
  if (experimentId)
    objc_msgSend(v6, "encodeObject:forKey:", experimentId, CFSTR("experimentId"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_deploymentId, CFSTR("deploymentId"));
  treatmentId = self->_treatmentId;
  if (treatmentId)
    objc_msgSend(v6, "encodeObject:forKey:", treatmentId, CFSTR("treatmentId"));

}

- (id)description
{
  id v3;
  NSString *experimentId;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  experimentId = self->_experimentId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIExperimentDeploymentTreatment | experimentId:%@ deploymentId:%@ treatmentId:%@>"), experimentId, v5, self->_treatmentId);

  return v6;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
