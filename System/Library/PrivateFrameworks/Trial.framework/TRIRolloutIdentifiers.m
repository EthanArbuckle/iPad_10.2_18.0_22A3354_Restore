@implementation TRIRolloutIdentifiers

- (TRIRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5 rampId:(id)a6
{
  id v11;
  id v12;
  id v13;
  TRIRolloutIdentifiers *v14;
  TRIRolloutIdentifiers *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TRIRolloutIdentifiers;
  v14 = -[TRIRolloutIdentifiers init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rolloutId, a3);
    v15->_deploymentId = a4;
    objc_storeStrong((id *)&v15->_factorPackId, a5);
    objc_storeStrong((id *)&v15->_rampId, a6);
  }

  return v15;
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

- (TRIRolloutIdentifiers)initWithRolloutId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5
{
  return -[TRIRolloutIdentifiers initWithRolloutId:deploymentId:factorPackId:rampId:](self, "initWithRolloutId:deploymentId:factorPackId:rampId:", a3, *(_QWORD *)&a4, a5, 0);
}

- (BOOL)isEqualToRolloutIdentifiers:(id)a3
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
  int v13;
  void *v14;
  int v15;
  NSString *factorPackId;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  NSString *rampId;
  void *v23;
  char v24;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = self->_rolloutId != 0;
  objc_msgSend(v4, "rolloutId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_12;
  rolloutId = self->_rolloutId;
  if (rolloutId)
  {
    objc_msgSend(v5, "rolloutId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](rolloutId, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId"))
    goto LABEL_12;
  v13 = self->_factorPackId != 0;
  objc_msgSend(v5, "factorPackId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_12;
  factorPackId = self->_factorPackId;
  if (factorPackId)
  {
    objc_msgSend(v5, "factorPackId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](factorPackId, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = self->_rampId != 0;
  objc_msgSend(v5, "rampId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    v24 = 0;
  }
  else
  {
    rampId = self->_rampId;
    if (rampId)
    {
      objc_msgSend(v5, "rampId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[NSString isEqual:](rampId, "isEqual:", v23);

    }
    else
    {
      v24 = 1;
    }
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  TRIRolloutIdentifiers *v4;
  TRIRolloutIdentifiers *v5;
  BOOL v6;

  v4 = (TRIRolloutIdentifiers *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIRolloutIdentifiers isEqualToRolloutIdentifiers:](self, "isEqualToRolloutIdentifiers:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_rolloutId, "hash");
  v4 = self->_deploymentId - v3 + 32 * v3;
  v5 = -[NSString hash](self->_factorPackId, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_rampId, "hash") - v5 + 32 * v5;
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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIRolloutIdentifiers | rolloutId:%@ deploymentId:%@ factorPackId:%@ rampId:%@>"), rolloutId, v5, self->_factorPackId, self->_rampId);

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

- (NSString)rampId
{
  return self->_rampId;
}

@end
