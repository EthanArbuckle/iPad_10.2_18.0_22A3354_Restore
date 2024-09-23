@implementation TRIRequiredCloudKitAsset

- (TRIRequiredCloudKitAsset)initWithFactorName:(id)a3 isInstalled:(BOOL)a4 isOnDemand:(BOOL)a5 assetId:(id)a6 metadata:(id)a7
{
  id v14;
  id v15;
  id v16;
  TRIRequiredCloudKitAsset *v17;
  TRIRequiredCloudKitAsset *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetId != nil"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorName != nil"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata != nil"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)TRIRequiredCloudKitAsset;
  v17 = -[TRIRequiredCloudKitAsset init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_factorName, a3);
    v18->_isInstalled = a4;
    v18->_isOnDemand = a5;
    objc_storeStrong((id *)&v18->_assetId, a6);
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

+ (id)assetWithFactorName:(id)a3 isInstalled:(BOOL)a4 isOnDemand:(BOOL)a5 assetId:(id)a6 metadata:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", v14, v9, v8, v13, v12);

  return v15;
}

- (id)copyWithReplacementFactorName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", v4, self->_isInstalled, self->_isOnDemand, self->_assetId, self->_metadata);

  return v5;
}

- (id)copyWithReplacementIsInstalled:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", self->_factorName, a3, self->_isOnDemand, self->_assetId, self->_metadata);
}

- (id)copyWithReplacementIsOnDemand:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", self->_factorName, self->_isInstalled, a3, self->_assetId, self->_metadata);
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", self->_factorName, self->_isInstalled, self->_isOnDemand, v4, self->_metadata);

  return v5;
}

- (id)copyWithReplacementMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFactorName:isInstalled:isOnDemand:assetId:metadata:", self->_factorName, self->_isInstalled, self->_isOnDemand, self->_assetId, v4);

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
  int isInstalled;
  int isOnDemand;
  int v14;
  void *v15;
  int v16;
  TRIAssetId *assetId;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  TRICKAssetMetadata *metadata;
  void *v24;
  char v25;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_13;
  v6 = self->_factorName != 0;
  objc_msgSend(v4, "factorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_13;
  factorName = self->_factorName;
  if (factorName)
  {
    objc_msgSend(v5, "factorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](factorName, "isEqual:", v10);

    if (!v11)
      goto LABEL_13;
  }
  isInstalled = self->_isInstalled;
  if (isInstalled != objc_msgSend(v5, "isInstalled"))
    goto LABEL_13;
  isOnDemand = self->_isOnDemand;
  if (isOnDemand != objc_msgSend(v5, "isOnDemand"))
    goto LABEL_13;
  v14 = self->_assetId != 0;
  objc_msgSend(v5, "assetId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v14 == v16)
    goto LABEL_13;
  assetId = self->_assetId;
  if (assetId)
  {
    objc_msgSend(v5, "assetId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TRIAssetId isEqual:](assetId, "isEqual:", v18);

    if (!v19)
      goto LABEL_13;
  }
  v20 = self->_metadata != 0;
  objc_msgSend(v5, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v20 == v22)
  {
LABEL_13:
    v25 = 0;
  }
  else
  {
    metadata = self->_metadata;
    if (metadata)
    {
      objc_msgSend(v5, "metadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[TRICKAssetMetadata isEqual:](metadata, "isEqual:", v24);

    }
    else
    {
      v25 = 1;
    }
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  TRIRequiredCloudKitAsset *v4;
  TRIRequiredCloudKitAsset *v5;
  BOOL v6;

  v4 = (TRIRequiredCloudKitAsset *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIRequiredCloudKitAsset isEqualToAsset:](self, "isEqualToAsset:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_factorName, "hash");
  v4 = self->_isInstalled - v3 + 32 * v3;
  v5 = self->_isOnDemand - v4 + 32 * v4;
  v6 = -[TRIAssetId hash](self->_assetId, "hash") - v5 + 32 * v5;
  return -[TRICKAssetMetadata hash](self->_metadata, "hash") - v6 + 32 * v6;
}

- (id)description
{
  id v3;
  NSString *factorName;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  factorName = self->_factorName;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInstalled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOnDemand);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIRequiredCloudKitAsset | factorName:%@ isInstalled:%@ isOnDemand:%@ assetId:%@ metadata:%@>"), factorName, v5, v6, self->_assetId, self->_metadata);

  return v7;
}

- (NSString)factorName
{
  return self->_factorName;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isOnDemand
{
  return self->_isOnDemand;
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (TRICKAssetMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

@end
