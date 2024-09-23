@implementation TRIAssetIdFactorName

- (TRIAssetIdFactorName)initWithAssetId:(id)a3 factorName:(id)a4
{
  id v8;
  id v9;
  TRIAssetIdFactorName *v10;
  TRIAssetIdFactorName *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 3118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetId != nil"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TRIAssetIdFactorName;
  v10 = -[TRIAssetIdFactorName init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetId, a3);
    objc_storeStrong((id *)&v11->_factorName, a4);
  }

  return v11;
}

+ (id)nameWithAssetId:(id)a3 factorName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAssetId:factorName:", v7, v6);

  return v8;
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetId:factorName:", v4, self->_factorName);

  return v5;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetId:factorName:", self->_assetId, v4);

  return v5;
}

- (BOOL)isEqualToName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIAssetId *assetId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *factorName;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_assetId != 0;
  objc_msgSend(v4, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  assetId = self->_assetId;
  if (assetId)
  {
    objc_msgSend(v5, "assetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIAssetId isEqual:](assetId, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_factorName != 0;
  objc_msgSend(v5, "factorName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    factorName = self->_factorName;
    if (factorName)
    {
      objc_msgSend(v5, "factorName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSString isEqual:](factorName, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRIAssetIdFactorName *v4;
  TRIAssetIdFactorName *v5;
  BOOL v6;

  v4 = (TRIAssetIdFactorName *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIAssetIdFactorName isEqualToName:](self, "isEqualToName:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIAssetId hash](self->_assetId, "hash");
  return -[NSString hash](self->_factorName, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIAssetIdFactorName | assetId:%@ factorName:%@>"), self->_assetId, self->_factorName);
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (NSString)factorName
{
  return self->_factorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorName, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end
