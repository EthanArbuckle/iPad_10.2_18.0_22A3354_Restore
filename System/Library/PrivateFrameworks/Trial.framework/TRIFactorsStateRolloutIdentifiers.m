@implementation TRIFactorsStateRolloutIdentifiers

- (TRIFactorsStateRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4
{
  id v8;
  TRIFactorsStateRolloutIdentifiers *v9;
  TRIFactorsStateRolloutIdentifiers *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFactorsStateIdentifiers.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRIFactorsStateRolloutIdentifiers;
  v9 = -[TRIFactorsStateRolloutIdentifiers init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutId, a3);
    v10->_deploymentId = a4;
  }

  return v10;
}

- (BOOL)isEqualToIdentifiers:(id)a3
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
  TRIFactorsStateRolloutIdentifiers *v4;
  TRIFactorsStateRolloutIdentifiers *v5;
  BOOL v6;

  v4 = (TRIFactorsStateRolloutIdentifiers *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFactorsStateRolloutIdentifiers isEqualToIdentifiers:](self, "isEqualToIdentifiers:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_rolloutId, "hash");
  return self->_deploymentId - v3 + 32 * v3;
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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIFactorsStateRolloutIdentifiers | rolloutId:%@ deploymentId:%@>"), rolloutId, v5);

  return v6;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end
