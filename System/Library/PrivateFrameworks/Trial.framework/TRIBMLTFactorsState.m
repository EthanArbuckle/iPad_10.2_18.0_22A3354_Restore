@implementation TRIBMLTFactorsState

- (TRIBMLTFactorsState)initWithDeployment:(id)a3
{
  id v6;
  TRIBMLTFactorsState *v7;
  TRIBMLTFactorsState *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  }
  v12.receiver = self;
  v12.super_class = (Class)TRIBMLTFactorsState;
  v7 = -[TRIBMLTFactorsState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_deployment, a3);
    if ((-[TRIBMLTFactorsState conformsToProtocol:](v8, "conformsToProtocol:", &unk_1EE402D28) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("TRIFactorsState.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self conformsToProtocol:@protocol(NSSecureCoding)]"));

    }
  }

  return v8;
}

- (id)bmltIdentifiers
{
  TRIFactorsStateBMLTIdentifiers *v3;
  void *v4;
  TRIFactorsStateBMLTIdentifiers *v5;

  v3 = [TRIFactorsStateBMLTIdentifiers alloc];
  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRIFactorsStateBMLTIdentifiers initWithBMLTId:deploymentId:](v3, "initWithBMLTId:deploymentId:", v4, -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"));

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
  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bmlt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBmltId:", v4);

  v6 = -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId");
  objc_msgSend(v3, "bmlt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeploymentId:", v6);

  return v3;
}

- (BOOL)_isEqualToState:(id)a3
{
  TRIBMLTDeployment *deployment;
  void *v4;

  deployment = self->_deployment;
  objc_msgSend(a3, "deployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deployment) = -[TRIBMLTDeployment isEqualToDeployment:](deployment, "isEqualToDeployment:", v4);

  return (char)deployment;
}

- (BOOL)isEqual:(id)a3
{
  TRIBMLTFactorsState *v4;
  TRIBMLTFactorsState *v5;
  BOOL v6;

  v4 = (TRIBMLTFactorsState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && -[TRIBMLTFactorsState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && -[TRIBMLTFactorsState _isEqualToState:](self, "_isEqualToState:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[TRIBMLTDeployment hash](self->_deployment, "hash");
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
  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(deployment: %@.%d)"), v5, v6, -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"));

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
  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bmlt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBmltId:", v6);

  v8 = -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId");
  objc_msgSend(v5, "bmlt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeploymentId:", v8);

  objc_msgSend(v5, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsState.m"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("data"));

}

- (TRIBMLTDeployment)deployment
{
  return self->_deployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
