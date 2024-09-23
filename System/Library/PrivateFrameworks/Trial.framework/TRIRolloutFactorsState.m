@implementation TRIRolloutFactorsState

- (TRIRolloutFactorsState)initWithDeployment:(id)a3
{
  id v6;
  TRIRolloutFactorsState *v7;
  TRIRolloutFactorsState *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v12.receiver = self;
  v12.super_class = (Class)TRIRolloutFactorsState;
  v7 = -[TRIRolloutFactorsState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_deployment, a3);
    if ((-[TRIRolloutFactorsState conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EE402D28) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("TRIFactorsState.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self conformsToProtocol:@protocol(NSSecureCoding)]"));

    }
  }

  return v8;
}

- (id)rolloutIdentifiers
{
  TRIFactorsStateRolloutIdentifiers *v3;
  void *v4;
  TRIFactorsStateRolloutIdentifiers *v5;

  v3 = [TRIFactorsStateRolloutIdentifiers alloc];
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRIFactorsStateRolloutIdentifiers initWithRolloutId:deploymentId:](v3, "initWithRolloutId:deploymentId:", v4, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));

  return v5;
}

- (id)persisted
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rollout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRolloutId:", v4);

  v6 = -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId");
  objc_msgSend(v3, "rollout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeploymentId:", v6);

  return v3;
}

- (BOOL)_isEqualToState:(id)a3
{
  TRIRolloutDeployment *deployment;
  void *v4;

  deployment = self->_deployment;
  objc_msgSend(a3, "deployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deployment) = -[TRIRolloutDeployment isEqualToDeployment:](deployment, "isEqualToDeployment:", v4);

  return (char)deployment;
}

- (BOOL)isEqual:(id)a3
{
  TRIRolloutFactorsState *v4;
  TRIRolloutFactorsState *v5;
  BOOL v6;

  v4 = (TRIRolloutFactorsState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && -[TRIRolloutFactorsState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && -[TRIRolloutFactorsState _isEqualToState:](self, "_isEqualToState:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[TRIRolloutDeployment hash](self->_deployment, "hash");
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
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(deployment: %@.%d)"), v5, v6, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));

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
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_opt_new();
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rollout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRolloutId:", v6);

  v8 = -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId");
  objc_msgSend(v5, "rollout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeploymentId:", v8);

  objc_msgSend(v5, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("data"));

}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
