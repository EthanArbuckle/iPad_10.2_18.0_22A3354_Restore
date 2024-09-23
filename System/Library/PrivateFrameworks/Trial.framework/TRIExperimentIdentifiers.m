@implementation TRIExperimentIdentifiers

- (TRIExperimentIdentifiers)initWithExperimentId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v9;
  id v10;
  TRIExperimentIdentifiers *v11;
  TRIExperimentIdentifiers *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRIExperimentIdentifiers;
  v11 = -[TRIExperimentIdentifiers init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_experimentId, a3);
    v12->_deploymentId = a4;
    objc_storeStrong((id *)&v12->_treatmentId, a5);
  }

  return v12;
}

- (BOOL)isEqualToExperimentIdentifiers:(id)a3
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
  TRIExperimentIdentifiers *v4;
  TRIExperimentIdentifiers *v5;
  BOOL v6;

  v4 = (TRIExperimentIdentifiers *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIExperimentIdentifiers isEqualToExperimentIdentifiers:](self, "isEqualToExperimentIdentifiers:", v5);

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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIExperimentIdentifiers | experimentId:%@ deploymentId:%@ treatmentId:%@>"), experimentId, v5, self->_treatmentId);

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
