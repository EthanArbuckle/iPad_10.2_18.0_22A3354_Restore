@implementation TRIFactorPackAssetFetchPlan

- (TRIFactorPackAssetFetchPlan)initWithMetadataForRequestedUnlinkedAssets:(id)a3 recordIdsForDiffableAssetIds:(id)a4 recordIdsForNonDiffableAssetIds:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRIFactorPackAssetFetchPlan *v13;
  TRIFactorPackAssetFetchPlan *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4559, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordIdsForDiffableAssetIds != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataForRequestedUnlinkedAssets != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordIdsForNonDiffableAssetIds != nil"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIFactorPackAssetFetchPlan;
  v13 = -[TRIFactorPackAssetFetchPlan init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metadataForRequestedUnlinkedAssets, a3);
    objc_storeStrong((id *)&v14->_recordIdsForDiffableAssetIds, a4);
    objc_storeStrong((id *)&v14->_recordIdsForNonDiffableAssetIds, a5);
  }

  return v14;
}

+ (id)planWithMetadataForRequestedUnlinkedAssets:(id)a3 recordIdsForDiffableAssetIds:(id)a4 recordIdsForNonDiffableAssetIds:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetadataForRequestedUnlinkedAssets:recordIdsForDiffableAssetIds:recordIdsForNonDiffableAssetIds:", v10, v9, v8);

  return v11;
}

- (id)copyWithReplacementMetadataForRequestedUnlinkedAssets:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetadataForRequestedUnlinkedAssets:recordIdsForDiffableAssetIds:recordIdsForNonDiffableAssetIds:", v4, self->_recordIdsForDiffableAssetIds, self->_recordIdsForNonDiffableAssetIds);

  return v5;
}

- (id)copyWithReplacementRecordIdsForDiffableAssetIds:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetadataForRequestedUnlinkedAssets:recordIdsForDiffableAssetIds:recordIdsForNonDiffableAssetIds:", self->_metadataForRequestedUnlinkedAssets, v4, self->_recordIdsForNonDiffableAssetIds);

  return v5;
}

- (id)copyWithReplacementRecordIdsForNonDiffableAssetIds:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetadataForRequestedUnlinkedAssets:recordIdsForDiffableAssetIds:recordIdsForNonDiffableAssetIds:", self->_metadataForRequestedUnlinkedAssets, self->_recordIdsForDiffableAssetIds, v4);

  return v5;
}

- (BOOL)isEqualToPlan:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIGenericRequiredAssets *metadataForRequestedUnlinkedAssets;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  NSDictionary *recordIdsForDiffableAssetIds;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSDictionary *recordIdsForNonDiffableAssetIds;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_metadataForRequestedUnlinkedAssets != 0;
  objc_msgSend(v4, "metadataForRequestedUnlinkedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  metadataForRequestedUnlinkedAssets = self->_metadataForRequestedUnlinkedAssets;
  if (metadataForRequestedUnlinkedAssets)
  {
    objc_msgSend(v5, "metadataForRequestedUnlinkedAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIGenericRequiredAssets isEqual:](metadataForRequestedUnlinkedAssets, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_recordIdsForDiffableAssetIds != 0;
  objc_msgSend(v5, "recordIdsForDiffableAssetIds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  recordIdsForDiffableAssetIds = self->_recordIdsForDiffableAssetIds;
  if (recordIdsForDiffableAssetIds)
  {
    objc_msgSend(v5, "recordIdsForDiffableAssetIds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSDictionary isEqual:](recordIdsForDiffableAssetIds, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_recordIdsForNonDiffableAssetIds != 0;
  objc_msgSend(v5, "recordIdsForNonDiffableAssetIds");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    recordIdsForNonDiffableAssetIds = self->_recordIdsForNonDiffableAssetIds;
    if (recordIdsForNonDiffableAssetIds)
    {
      objc_msgSend(v5, "recordIdsForNonDiffableAssetIds");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSDictionary isEqual:](recordIdsForNonDiffableAssetIds, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  TRIFactorPackAssetFetchPlan *v4;
  TRIFactorPackAssetFetchPlan *v5;
  BOOL v6;

  v4 = (TRIFactorPackAssetFetchPlan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFactorPackAssetFetchPlan isEqualToPlan:](self, "isEqualToPlan:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[TRIGenericRequiredAssets hash](self->_metadataForRequestedUnlinkedAssets, "hash");
  v4 = -[NSDictionary hash](self->_recordIdsForDiffableAssetIds, "hash") - v3 + 32 * v3;
  return -[NSDictionary hash](self->_recordIdsForNonDiffableAssetIds, "hash") - v4 + 32 * v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIFactorPackAssetFetchPlan | metadataForRequestedUnlinkedAssets:%@ recordIdsForDiffableAssetIds:%@ recordIdsForNonDiffableAssetIds:%@>"), self->_metadataForRequestedUnlinkedAssets, self->_recordIdsForDiffableAssetIds, self->_recordIdsForNonDiffableAssetIds);
}

- (TRIGenericRequiredAssets)metadataForRequestedUnlinkedAssets
{
  return self->_metadataForRequestedUnlinkedAssets;
}

- (NSDictionary)recordIdsForDiffableAssetIds
{
  return self->_recordIdsForDiffableAssetIds;
}

- (NSDictionary)recordIdsForNonDiffableAssetIds
{
  return self->_recordIdsForNonDiffableAssetIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdsForNonDiffableAssetIds, 0);
  objc_storeStrong((id *)&self->_recordIdsForDiffableAssetIds, 0);
  objc_storeStrong((id *)&self->_metadataForRequestedUnlinkedAssets, 0);
}

@end
