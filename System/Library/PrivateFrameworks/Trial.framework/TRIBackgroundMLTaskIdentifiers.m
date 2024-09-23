@implementation TRIBackgroundMLTaskIdentifiers

- (TRIBackgroundMLTaskIdentifiers)initWithBMLTTaskId:(id)a3 deploymentId:(int)a4 treatmentId:(id)a5
{
  id v9;
  id v10;
  TRIBackgroundMLTaskIdentifiers *v11;
  TRIBackgroundMLTaskIdentifiers *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRIBackgroundMLTaskIdentifiers;
  v11 = -[TRIBackgroundMLTaskIdentifiers init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bmltTaskId, a3);
    v12->_deploymentId = a4;
    objc_storeStrong((id *)&v12->_treatmentId, a5);
  }

  return v12;
}

- (TRIBackgroundMLTaskIdentifiers)initWithBMLTaskId:(id)a3 deploymentId:(int)a4 factorPackId:(id)a5
{
  id v9;
  id v10;
  TRIBackgroundMLTaskIdentifiers *v11;
  TRIBackgroundMLTaskIdentifiers *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRIBackgroundMLTaskIdentifiers;
  v11 = -[TRIBackgroundMLTaskIdentifiers init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bmltTaskId, a3);
    v12->_deploymentId = a4;
    objc_storeStrong((id *)&v12->_factorPackId, a5);
  }

  return v12;
}

- (BOOL)isEqualToBMLTTaskIdentifiers:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *bmltTaskId;
  void *v10;
  int v11;
  int deploymentId;
  int v13;
  void *v14;
  int v15;
  NSString *treatmentId;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  NSString *factorPackId;
  void *v23;
  char v24;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = self->_bmltTaskId != 0;
  objc_msgSend(v4, "bmltTaskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_12;
  bmltTaskId = self->_bmltTaskId;
  if (bmltTaskId)
  {
    objc_msgSend(v5, "bmltTaskId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](bmltTaskId, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId"))
    goto LABEL_12;
  v13 = self->_treatmentId != 0;
  objc_msgSend(v5, "treatmentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_12;
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    objc_msgSend(v5, "treatmentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](treatmentId, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = self->_factorPackId != 0;
  objc_msgSend(v5, "factorPackId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    v24 = 0;
  }
  else
  {
    factorPackId = self->_factorPackId;
    if (factorPackId)
    {
      objc_msgSend(v5, "factorPackId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[NSString isEqual:](factorPackId, "isEqual:", v23);

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
  TRIBackgroundMLTaskIdentifiers *v4;
  TRIBackgroundMLTaskIdentifiers *v5;
  BOOL v6;

  v4 = (TRIBackgroundMLTaskIdentifiers *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIBackgroundMLTaskIdentifiers isEqualToBMLTTaskIdentifiers:](self, "isEqualToBMLTTaskIdentifiers:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_bmltTaskId, "hash");
  v4 = self->_deploymentId - v3 + 32 * v3;
  return -[NSString hash](self->_treatmentId, "hash") - v4 + 32 * v4;
}

- (id)description
{
  NSString *treatmentId;
  id v4;
  NSString *bmltTaskId;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;

  treatmentId = self->_treatmentId;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  bmltTaskId = self->_bmltTaskId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 24;
  if (treatmentId)
  {
    v9 = CFSTR("<TRIBackgroundMLTaskIdentifiers | bmltTaskId:%@ deploymentId:%@ treatmentId:%@>");
  }
  else
  {
    v8 = 32;
    v9 = CFSTR("<TRIBackgroundMLTaskIdentifiers | bmltTaskId:%@ deploymentId:%@ factorPackId:%@>");
  }
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", v9, bmltTaskId, v6, *(Class *)((char *)&self->super.isa + v8));

  return v10;
}

- (NSString)bmltTaskId
{
  return self->_bmltTaskId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_bmltTaskId, 0);
}

@end
