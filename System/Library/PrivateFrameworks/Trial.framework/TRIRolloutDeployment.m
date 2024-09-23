@implementation TRIRolloutDeployment

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (TRIRolloutDeployment)initWithRolloutId:(id)a3 deploymentId:(int)a4
{
  id v8;
  TRIRolloutDeployment *v9;
  TRIRolloutDeployment *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1570, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRIRolloutDeployment;
  v9 = -[TRIRolloutDeployment init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutId, a3);
    v10->_deploymentId = a4;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

- (NSString)shortDesc
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[TRIRolloutDeployment rolloutId](self, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%d"), v4, -[TRIRolloutDeployment deploymentId](self, "deploymentId"));

  return (NSString *)v5;
}

- (id)taskTag
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[TRIRolloutDeployment rolloutId](self, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TRIRolloutDeployment deploymentId](self, "deploymentId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%@"), v4, v5);

  return v6;
}

+ (TRIRolloutDeployment)deploymentWithRolloutId:(id)a3 deploymentId:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRolloutId:deploymentId:", v6, v4);

  return (TRIRolloutDeployment *)v7;
}

- (id)copyWithReplacementRolloutId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRolloutId:deploymentId:", v4, self->_deploymentId);

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRolloutId:deploymentId:", self->_rolloutId, *(_QWORD *)&a3);
}

- (BOOL)isEqualToDeployment:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *rolloutId;
  void *v10;
  int v11;
  int deploymentId;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_rolloutId != 0;
  objc_msgSend(v4, "rolloutId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (rolloutId = self->_rolloutId) != 0
    && (objc_msgSend(v5, "rolloutId"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSString isEqual:](rolloutId, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    deploymentId = self->_deploymentId;
    v13 = deploymentId == objc_msgSend(v5, "deploymentId");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRIRolloutDeployment *v4;
  TRIRolloutDeployment *v5;
  BOOL v6;

  v4 = (TRIRolloutDeployment *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIRolloutDeployment isEqualToDeployment:](self, "isEqualToDeployment:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_rolloutId, "hash");
  return self->_deploymentId - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRolloutDeployment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  TRIRolloutDeployment *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rolloutId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("Retrieved nil serialized value for nonnull TRIRolloutDeployment.rolloutId");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = 2;
LABEL_9:
      v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("TRIRolloutDeploymentOCNTErrorDomain"), v11, v9);
      objc_msgSend(v4, "failWithError:", v13);

    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deploymentId"));
  if (!(_DWORD)v6)
  {
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("deploymentId")) & 1) != 0)
        goto LABEL_3;
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("Missing serialized value for TRIRolloutDeployment.deploymentId");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_3:
  self = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](self, "initWithRolloutId:deploymentId:", v5, v6);
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *rolloutId;
  id v6;

  v4 = a3;
  rolloutId = self->_rolloutId;
  v6 = v4;
  if (rolloutId)
  {
    objc_msgSend(v4, "encodeObject:forKey:", rolloutId, CFSTR("rolloutId"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_deploymentId, CFSTR("deploymentId"));

}

- (id)description
{
  id v3;
  NSString *rolloutId;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  rolloutId = self->_rolloutId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIRolloutDeployment | rolloutId:%@ deploymentId:%@>"), rolloutId, v5);

  return v6;
}

@end
