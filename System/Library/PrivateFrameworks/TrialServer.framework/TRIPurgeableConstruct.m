@implementation TRIPurgeableConstruct

- (TRIPurgeableConstruct)initWithFactorPackId:(id)a3 treatmentId:(id)a4 namespaceName:(id)a5 purgeableAssetFactorNames:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  TRIPurgeableConstruct *v17;
  TRIPurgeableConstruct *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName != nil"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("purgeableAssetFactorNames != nil"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)TRIPurgeableConstruct;
  v17 = -[TRIPurgeableConstruct init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_factorPackId, a3);
    objc_storeStrong((id *)&v18->_treatmentId, a4);
    objc_storeStrong((id *)&v18->_namespaceName, a5);
    objc_storeStrong((id *)&v18->_purgeableAssetFactorNames, a6);
  }

  return v18;
}

+ (id)constructWithFactorPackId:(id)a3 treatmentId:(id)a4 namespaceName:(id)a5 purgeableAssetFactorNames:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", v13, v12, v11, v10);

  return v14;
}

- (id)copyWithReplacementFactorPackId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", v4, self->_treatmentId, self->_namespaceName, self->_purgeableAssetFactorNames);

  return v5;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", self->_factorPackId, v4, self->_namespaceName, self->_purgeableAssetFactorNames);

  return v5;
}

- (id)copyWithReplacementNamespaceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", self->_factorPackId, self->_treatmentId, v4, self->_purgeableAssetFactorNames);

  return v5;
}

- (id)copyWithReplacementPurgeableAssetFactorNames:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorPackId:treatmentId:namespaceName:purgeableAssetFactorNames:", self->_factorPackId, self->_treatmentId, self->_namespaceName, v4);

  return v5;
}

- (BOOL)isEqualToConstruct:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIFactorPackId *factorPackId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *treatmentId;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *namespaceName;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSSet *purgeableAssetFactorNames;
  void *v28;
  char v29;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  v6 = self->_factorPackId != 0;
  objc_msgSend(v4, "factorPackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_14;
  factorPackId = self->_factorPackId;
  if (factorPackId)
  {
    objc_msgSend(v5, "factorPackId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIFactorPackId isEqual:](factorPackId, "isEqual:", v10);

    if (!v11)
      goto LABEL_14;
  }
  v12 = self->_treatmentId != 0;
  objc_msgSend(v5, "treatmentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_14;
  treatmentId = self->_treatmentId;
  if (treatmentId)
  {
    objc_msgSend(v5, "treatmentId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](treatmentId, "isEqual:", v16);

    if (!v17)
      goto LABEL_14;
  }
  v18 = self->_namespaceName != 0;
  objc_msgSend(v5, "namespaceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_14;
  namespaceName = self->_namespaceName;
  if (namespaceName)
  {
    objc_msgSend(v5, "namespaceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](namespaceName, "isEqual:", v22);

    if (!v23)
      goto LABEL_14;
  }
  v24 = self->_purgeableAssetFactorNames != 0;
  objc_msgSend(v5, "purgeableAssetFactorNames");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
  {
LABEL_14:
    v29 = 0;
  }
  else
  {
    purgeableAssetFactorNames = self->_purgeableAssetFactorNames;
    if (purgeableAssetFactorNames)
    {
      objc_msgSend(v5, "purgeableAssetFactorNames");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[NSSet isEqual:](purgeableAssetFactorNames, "isEqual:", v28);

    }
    else
    {
      v29 = 1;
    }
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  TRIPurgeableConstruct *v4;
  TRIPurgeableConstruct *v5;
  BOOL v6;

  v4 = (TRIPurgeableConstruct *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIPurgeableConstruct isEqualToConstruct:](self, "isEqualToConstruct:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[TRIFactorPackId hash](self->_factorPackId, "hash");
  v4 = -[NSString hash](self->_treatmentId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_namespaceName, "hash") - v4 + 32 * v4;
  return -[NSSet hash](self->_purgeableAssetFactorNames, "hash") - v5 + 32 * v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIPurgeableConstruct | factorPackId:%@ treatmentId:%@ namespaceName:%@ purgeableAssetFactorNames:%@>"), self->_factorPackId, self->_treatmentId, self->_namespaceName, self->_purgeableAssetFactorNames);
}

- (TRIFactorPackId)factorPackId
{
  return self->_factorPackId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (NSSet)purgeableAssetFactorNames
{
  return self->_purgeableAssetFactorNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableAssetFactorNames, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
}

@end
