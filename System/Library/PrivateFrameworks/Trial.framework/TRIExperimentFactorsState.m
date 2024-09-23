@implementation TRIExperimentFactorsState

- (TRIExperimentFactorsState)initWithDeployment:(id)a3 treatmentId:(id)a4
{
  id v8;
  id v9;
  TRIExperimentFactorsState *v10;
  TRIExperimentFactorsState *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v15.receiver = self;
  v15.super_class = (Class)TRIExperimentFactorsState;
  v10 = -[TRIExperimentFactorsState init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_deployment, a3);
    objc_storeStrong((id *)&v11->_treatmentId, a4);
    if ((-[TRIExperimentFactorsState conformsToProtocol:](v11, "conformsToProtocol:", &unk_1EE402D28) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("TRIFactorsState.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self conformsToProtocol:@protocol(NSSecureCoding)]"));

    }
  }

  return v11;
}

- (id)experimentIdentifiers
{
  TRIFactorsStateExperimentIdentifiers *v3;
  void *v4;
  TRIFactorsStateExperimentIdentifiers *v5;

  v3 = [TRIFactorsStateExperimentIdentifiers alloc];
  -[TRIExperimentDeployment experimentId](self->_deployment, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRIFactorsStateExperimentIdentifiers initWithExperimentId:deploymentId:treatmentId:](v3, "initWithExperimentId:deploymentId:treatmentId:", v4, -[TRIExperimentDeployment deploymentId](self->_deployment, "deploymentId"), self->_treatmentId);

  return v5;
}

- (id)persisted
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *treatmentId;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[TRIExperimentDeployment experimentId](self->_deployment, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExperimentId:", v4);

  v6 = -[TRIExperimentDeployment deploymentId](self->_deployment, "deploymentId");
  objc_msgSend(v3, "experiment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeploymentId:", v6);

  treatmentId = self->_treatmentId;
  objc_msgSend(v3, "experiment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTreatmentId:", treatmentId);

  return v3;
}

- (BOOL)_isEqualToState:(id)a3
{
  TRIExperimentDeployment *deployment;
  void *v4;

  deployment = self->_deployment;
  objc_msgSend(a3, "deployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deployment) = -[TRIExperimentDeployment isEqualToDeployment:](deployment, "isEqualToDeployment:", v4);

  return (char)deployment;
}

- (BOOL)isEqual:(id)a3
{
  TRIExperimentFactorsState *v4;
  TRIExperimentFactorsState *v5;
  BOOL v6;

  v4 = (TRIExperimentFactorsState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && -[TRIExperimentFactorsState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && -[TRIExperimentFactorsState _isEqualToState:](self, "_isEqualToState:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[TRIExperimentDeployment hash](self->_deployment, "hash");
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentDeployment experimentId](self->_deployment, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(deployment: %@.%d.%@)"), v5, v6, -[TRIExperimentDeployment deploymentId](self->_deployment, "deploymentId"), self->_treatmentId);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *treatmentId;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = (void *)objc_opt_new();
  -[TRIExperimentDeployment experimentId](self->_deployment, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experiment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExperimentId:", v6);

  v8 = -[TRIExperimentDeployment deploymentId](self->_deployment, "deploymentId");
  objc_msgSend(v5, "experiment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeploymentId:", v8);

  treatmentId = self->_treatmentId;
  objc_msgSend(v5, "experiment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTreatmentId:", treatmentId);

  objc_msgSend(v5, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("data"));

}

- (TRIExperimentDeployment)deployment
{
  return self->_deployment;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
