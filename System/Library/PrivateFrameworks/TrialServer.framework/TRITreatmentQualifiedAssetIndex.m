@implementation TRITreatmentQualifiedAssetIndex

- (TRITreatmentQualifiedAssetIndex)initWithTreatmentId:(id)a3 index:(unsigned int)a4
{
  id v8;
  TRITreatmentQualifiedAssetIndex *v9;
  TRITreatmentQualifiedAssetIndex *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3020, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRITreatmentQualifiedAssetIndex;
  v9 = -[TRITreatmentQualifiedAssetIndex init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_treatmentId, a3);
    v10->_index = a4;
  }

  return v10;
}

+ (id)indexWithTreatmentId:(id)a3 index:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTreatmentId:index:", v6, v4);

  return v7;
}

- (id)copyWithReplacementTreatmentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTreatmentId:index:", v4, self->_index);

  return v5;
}

- (id)copyWithReplacementIndex:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTreatmentId:index:", self->_treatmentId, *(_QWORD *)&a3);
}

- (BOOL)isEqualToIndex:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *treatmentId;
  void *v10;
  int v11;
  unsigned int index;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_treatmentId != 0;
  objc_msgSend(v4, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (treatmentId = self->_treatmentId) != 0
    && (objc_msgSend(v5, "treatmentId"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSString isEqual:](treatmentId, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    index = self->_index;
    v13 = index == objc_msgSend(v5, "index");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRITreatmentQualifiedAssetIndex *v4;
  TRITreatmentQualifiedAssetIndex *v5;
  BOOL v6;

  v4 = (TRITreatmentQualifiedAssetIndex *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITreatmentQualifiedAssetIndex isEqualToIndex:](self, "isEqualToIndex:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_treatmentId, "hash");
  return self->_index - v3 + 32 * v3;
}

- (id)description
{
  id v3;
  NSString *treatmentId;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  treatmentId = self->_treatmentId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_index);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRITreatmentQualifiedAssetIndex | treatmentId:%@ index:%@>"), treatmentId, v5);

  return v6;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (unsigned)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
}

@end
