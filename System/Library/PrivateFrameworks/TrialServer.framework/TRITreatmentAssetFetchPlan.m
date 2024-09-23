@implementation TRITreatmentAssetFetchPlan

- (TRITreatmentAssetFetchPlan)initWithMetadataForRequestedUnlinkedAssets:(id)a3 fetchPlansForTreatmentIds:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRITreatmentAssetFetchPlan *v11;
  TRITreatmentAssetFetchPlan *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataForRequestedUnlinkedAssets != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchPlansForTreatmentIds != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRITreatmentAssetFetchPlan;
  v11 = -[TRITreatmentAssetFetchPlan init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metadataForRequestedUnlinkedAssets, a3);
    objc_storeStrong((id *)&v12->_fetchPlansForTreatmentIds, a4);
  }

  return v12;
}

+ (id)planWithMetadataForRequestedUnlinkedAssets:(id)a3 fetchPlansForTreatmentIds:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetadataForRequestedUnlinkedAssets:fetchPlansForTreatmentIds:", v7, v6);

  return v8;
}

- (id)copyWithReplacementMetadataForRequestedUnlinkedAssets:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetadataForRequestedUnlinkedAssets:fetchPlansForTreatmentIds:", v4, self->_fetchPlansForTreatmentIds);

  return v5;
}

- (id)copyWithReplacementFetchPlansForTreatmentIds:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMetadataForRequestedUnlinkedAssets:fetchPlansForTreatmentIds:", self->_metadataForRequestedUnlinkedAssets, v4);

  return v5;
}

- (BOOL)isEqualToPlan:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIGenericUniqueRequiredAssets *metadataForRequestedUnlinkedAssets;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  NSDictionary *fetchPlansForTreatmentIds;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_metadataForRequestedUnlinkedAssets != 0;
  objc_msgSend(v4, "metadataForRequestedUnlinkedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  metadataForRequestedUnlinkedAssets = self->_metadataForRequestedUnlinkedAssets;
  if (metadataForRequestedUnlinkedAssets)
  {
    objc_msgSend(v5, "metadataForRequestedUnlinkedAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIGenericUniqueRequiredAssets isEqual:](metadataForRequestedUnlinkedAssets, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_fetchPlansForTreatmentIds != 0;
  objc_msgSend(v5, "fetchPlansForTreatmentIds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    fetchPlansForTreatmentIds = self->_fetchPlansForTreatmentIds;
    if (fetchPlansForTreatmentIds)
    {
      objc_msgSend(v5, "fetchPlansForTreatmentIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSDictionary isEqual:](fetchPlansForTreatmentIds, "isEqual:", v16);

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
  TRITreatmentAssetFetchPlan *v4;
  TRITreatmentAssetFetchPlan *v5;
  BOOL v6;

  v4 = (TRITreatmentAssetFetchPlan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITreatmentAssetFetchPlan isEqualToPlan:](self, "isEqualToPlan:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[TRIGenericUniqueRequiredAssets hash](self->_metadataForRequestedUnlinkedAssets, "hash");
  return -[NSDictionary hash](self->_fetchPlansForTreatmentIds, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRITreatmentAssetFetchPlan | metadataForRequestedUnlinkedAssets:%@ fetchPlansForTreatmentIds:%@>"), self->_metadataForRequestedUnlinkedAssets, self->_fetchPlansForTreatmentIds);
}

- (TRIGenericUniqueRequiredAssets)metadataForRequestedUnlinkedAssets
{
  return self->_metadataForRequestedUnlinkedAssets;
}

- (NSDictionary)fetchPlansForTreatmentIds
{
  return self->_fetchPlansForTreatmentIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchPlansForTreatmentIds, 0);
  objc_storeStrong((id *)&self->_metadataForRequestedUnlinkedAssets, 0);
}

@end
