@implementation TRIPurgeableAsset

- (TRIPurgeableAsset)initWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6 treatmentId:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TRIPurgeableAsset *v17;
  TRIPurgeableAsset *v18;
  void *v20;
  void *v21;
  id v23;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v23 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetId != nil"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)TRIPurgeableAsset;
  v17 = -[TRIPurgeableAsset init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_factorName, a3);
    objc_storeStrong((id *)&v18->_assetId, a4);
    objc_storeStrong((id *)&v18->_filePath, a5);
    objc_storeStrong((id *)&v18->_factorPackId, a6);
    objc_storeStrong((id *)&v18->_treatmentId, a7);
  }

  return v18;
}

+ (id)assetWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6 treatmentId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", v16, v15, v14, v13, v12);

  return v17;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", v4, self->_assetId, self->_filePath, self->_factorPackId, self->_treatmentId);

  return v5;
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", self->_factorName, v4, self->_filePath, self->_factorPackId, self->_treatmentId);

  return v5;
}

- (id)copyWithReplacementFilePath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", self->_factorName, self->_assetId, v4, self->_factorPackId, self->_treatmentId);

  return v5;
}

- (id)copyWithReplacementFactorPackId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", self->_factorName, self->_assetId, self->_filePath, v4, self->_treatmentId);

  return v5;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:treatmentId:", self->_factorName, self->_assetId, self->_filePath, self->_factorPackId, v4);

  return v5;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *factorName;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRIAssetId *assetId;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *filePath;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  TRIFactorPackId *factorPackId;
  void *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  NSString *treatmentId;
  void *v34;
  char v35;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_17;
  v6 = self->_factorName != 0;
  objc_msgSend(v4, "factorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_17;
  factorName = self->_factorName;
  if (factorName)
  {
    objc_msgSend(v5, "factorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](factorName, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  v12 = self->_assetId != 0;
  objc_msgSend(v5, "assetId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_17;
  assetId = self->_assetId;
  if (assetId)
  {
    objc_msgSend(v5, "assetId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TRIAssetId isEqual:](assetId, "isEqual:", v16);

    if (!v17)
      goto LABEL_17;
  }
  v18 = self->_filePath != 0;
  objc_msgSend(v5, "filePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_17;
  filePath = self->_filePath;
  if (filePath)
  {
    objc_msgSend(v5, "filePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](filePath, "isEqual:", v22);

    if (!v23)
      goto LABEL_17;
  }
  v24 = self->_factorPackId != 0;
  objc_msgSend(v5, "factorPackId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_17;
  factorPackId = self->_factorPackId;
  if (factorPackId)
  {
    objc_msgSend(v5, "factorPackId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[TRIFactorPackId isEqual:](factorPackId, "isEqual:", v28);

    if (!v29)
      goto LABEL_17;
  }
  v30 = self->_treatmentId != 0;
  objc_msgSend(v5, "treatmentId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (v30 == v32)
  {
LABEL_17:
    v35 = 0;
  }
  else
  {
    treatmentId = self->_treatmentId;
    if (treatmentId)
    {
      objc_msgSend(v5, "treatmentId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[NSString isEqual:](treatmentId, "isEqual:", v34);

    }
    else
    {
      v35 = 1;
    }
  }

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  TRIPurgeableAsset *v4;
  TRIPurgeableAsset *v5;
  BOOL v6;

  v4 = (TRIPurgeableAsset *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIPurgeableAsset isEqualToAsset:](self, "isEqualToAsset:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_factorName, "hash");
  v4 = -[TRIAssetId hash](self->_assetId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_filePath, "hash") - v4 + 32 * v4;
  v6 = -[TRIFactorPackId hash](self->_factorPackId, "hash") - v5 + 32 * v5;
  return -[NSString hash](self->_treatmentId, "hash") - v6 + 32 * v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIPurgeableAsset | factorName:%@ assetId:%@ filePath:%@ factorPackId:%@ treatmentId:%@>"), self->_factorName, self->_assetId, self->_filePath, self->_factorPackId, self->_treatmentId);
}

- (NSString)factorName
{
  return self->_factorName;
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (TRIFactorPackId)factorPackId
{
  return self->_factorPackId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end
