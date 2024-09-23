@implementation TRITreatmentRecordFetchPlan

- (TRITreatmentRecordFetchPlan)initWithRecordId:(id)a3 assetIndexes:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRITreatmentRecordFetchPlan *v11;
  TRITreatmentRecordFetchPlan *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4411, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIndexes != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRITreatmentRecordFetchPlan;
  v11 = -[TRITreatmentRecordFetchPlan init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordId, a3);
    objc_storeStrong((id *)&v12->_assetIndexes, a4);
  }

  return v12;
}

+ (id)planWithRecordId:(id)a3 assetIndexes:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRecordId:assetIndexes:", v7, v6);

  return v8;
}

- (id)copyWithReplacementRecordId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecordId:assetIndexes:", v4, self->_assetIndexes);

  return v5;
}

- (id)copyWithReplacementAssetIndexes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecordId:assetIndexes:", self->_recordId, v4);

  return v5;
}

- (BOOL)isEqualToPlan:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  CKRecordID *recordId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSIndexSet *assetIndexes;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_recordId != 0;
  objc_msgSend(v4, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  recordId = self->_recordId;
  if (recordId)
  {
    objc_msgSend(v5, "recordId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CKRecordID isEqual:](recordId, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_assetIndexes != 0;
  objc_msgSend(v5, "assetIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    assetIndexes = self->_assetIndexes;
    if (assetIndexes)
    {
      objc_msgSend(v5, "assetIndexes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSIndexSet isEqual:](assetIndexes, "isEqual:", v16);

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
  TRITreatmentRecordFetchPlan *v4;
  TRITreatmentRecordFetchPlan *v5;
  BOOL v6;

  v4 = (TRITreatmentRecordFetchPlan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITreatmentRecordFetchPlan isEqualToPlan:](self, "isEqualToPlan:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[CKRecordID hash](self->_recordId, "hash");
  return -[NSIndexSet hash](self->_assetIndexes, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRITreatmentRecordFetchPlan | recordId:%@ assetIndexes:%@>"), self->_recordId, self->_assetIndexes);
}

- (CKRecordID)recordId
{
  return self->_recordId;
}

- (NSIndexSet)assetIndexes
{
  return self->_assetIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIndexes, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

@end
