@implementation TRIFactorPackAsset

- (TRIFactorPackAsset)initWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIFactorPackAsset *v16;
  TRIFactorPackAsset *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4003, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetId != nil"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4002, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName != nil"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4004, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackId != nil"));

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)TRIFactorPackAsset;
  v16 = -[TRIFactorPackAsset init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_factorName, a3);
    objc_storeStrong((id *)&v17->_assetId, a4);
    objc_storeStrong((id *)&v17->_filePath, a5);
    objc_storeStrong((id *)&v17->_factorPackId, a6);
  }

  return v17;
}

+ (id)assetWithFactorName:(id)a3 assetId:(id)a4 filePath:(id)a5 factorPackId:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorName:assetId:filePath:factorPackId:", v13, v12, v11, v10);

  return v14;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:", v4, self->_assetId, self->_filePath, self->_factorPackId);

  return v5;
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:", self->_factorName, v4, self->_filePath, self->_factorPackId);

  return v5;
}

- (id)copyWithReplacementFilePath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:", self->_factorName, self->_assetId, v4, self->_factorPackId);

  return v5;
}

- (id)copyWithReplacementFactorPackId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:assetId:filePath:factorPackId:", self->_factorName, self->_assetId, self->_filePath, v4);

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
  char v29;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  v6 = self->_factorName != 0;
  objc_msgSend(v4, "factorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_14;
  factorName = self->_factorName;
  if (factorName)
  {
    objc_msgSend(v5, "factorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](factorName, "isEqual:", v10);

    if (!v11)
      goto LABEL_14;
  }
  v12 = self->_assetId != 0;
  objc_msgSend(v5, "assetId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_14;
  assetId = self->_assetId;
  if (assetId)
  {
    objc_msgSend(v5, "assetId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TRIAssetId isEqual:](assetId, "isEqual:", v16);

    if (!v17)
      goto LABEL_14;
  }
  v18 = self->_filePath != 0;
  objc_msgSend(v5, "filePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_14;
  filePath = self->_filePath;
  if (filePath)
  {
    objc_msgSend(v5, "filePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](filePath, "isEqual:", v22);

    if (!v23)
      goto LABEL_14;
  }
  v24 = self->_factorPackId != 0;
  objc_msgSend(v5, "factorPackId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
  {
LABEL_14:
    v29 = 0;
  }
  else
  {
    factorPackId = self->_factorPackId;
    if (factorPackId)
    {
      objc_msgSend(v5, "factorPackId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[TRIFactorPackId isEqual:](factorPackId, "isEqual:", v28);

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
  TRIFactorPackAsset *v4;
  TRIFactorPackAsset *v5;
  BOOL v6;

  v4 = (TRIFactorPackAsset *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFactorPackAsset isEqualToAsset:](self, "isEqualToAsset:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_factorName, "hash");
  v4 = -[TRIAssetId hash](self->_assetId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_filePath, "hash") - v4 + 32 * v4;
  return -[TRIFactorPackId hash](self->_factorPackId, "hash") - v5 + 32 * v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIFactorPackAsset | factorName:%@ assetId:%@ filePath:%@ factorPackId:%@>"), self->_factorName, self->_assetId, self->_filePath, self->_factorPackId);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end
