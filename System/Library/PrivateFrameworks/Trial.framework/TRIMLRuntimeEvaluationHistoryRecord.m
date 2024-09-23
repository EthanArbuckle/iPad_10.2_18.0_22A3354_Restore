@implementation TRIMLRuntimeEvaluationHistoryRecord

- (TRIMLRuntimeEvaluationHistoryRecord)initWithEvaluation:(id)a3 status:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIMLRuntimeEvaluationHistoryRecord *v11;
  TRIMLRuntimeEvaluationHistoryRecord *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1981, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("evaluation != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1982, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIMLRuntimeEvaluationHistoryRecord;
  v11 = -[TRIMLRuntimeEvaluationHistoryRecord init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_evaluation, a3);
    objc_storeStrong((id *)&v12->_status, a4);
  }

  return v12;
}

+ (id)recordWithEvaluation:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEvaluation:status:", v7, v6);

  return v8;
}

- (id)copyWithReplacementEvaluation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEvaluation:status:", v4, self->_status);

  return v5;
}

- (id)copyWithReplacementStatus:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEvaluation:status:", self->_evaluation, v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIMLRuntimeEvaluation *evaluation;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRIEvaluationStatus *status;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_evaluation != 0;
  objc_msgSend(v4, "evaluation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  evaluation = self->_evaluation;
  if (evaluation)
  {
    objc_msgSend(v5, "evaluation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIMLRuntimeEvaluation isEqual:](evaluation, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_status != 0;
  objc_msgSend(v5, "status");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    status = self->_status;
    if (status)
    {
      objc_msgSend(v5, "status");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TRIEvaluationStatus isEqual:](status, "isEqual:", v16);

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
  TRIMLRuntimeEvaluationHistoryRecord *v4;
  TRIMLRuntimeEvaluationHistoryRecord *v5;
  BOOL v6;

  v4 = (TRIMLRuntimeEvaluationHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIMLRuntimeEvaluationHistoryRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIMLRuntimeEvaluation hash](self->_evaluation, "hash");
  return -[TRIEvaluationStatus hash](self->_status, "hash") - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMLRuntimeEvaluationHistoryRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TRIMLRuntimeEvaluationHistoryRecord *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("evaluation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      self = -[TRIMLRuntimeEvaluationHistoryRecord initWithEvaluation:status:](self, "initWithEvaluation:status:", v5, v6);
      v8 = self;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("Retrieved nil serialized value for nonnull TRIMLRuntimeEvaluationHistoryRecord.status");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIMLRuntimeEvaluationHistoryRecordOCNTErrorDomain"), 2, v11);
      objc_msgSend(v4, "failWithError:", v12);

    }
    v7 = 0;
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("Retrieved nil serialized value for nonnull TRIMLRuntimeEvaluationHistoryRecord.evaluation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIMLRuntimeEvaluationHistoryRecordOCNTErrorDomain"), 2, v7);
    objc_msgSend(v4, "failWithError:", v13);

    goto LABEL_10;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TRIMLRuntimeEvaluation *evaluation;
  TRIEvaluationStatus *status;
  id v7;

  v4 = a3;
  evaluation = self->_evaluation;
  v7 = v4;
  if (evaluation)
  {
    objc_msgSend(v4, "encodeObject:forKey:", evaluation, CFSTR("evaluation"));
    v4 = v7;
  }
  status = self->_status;
  if (status)
  {
    objc_msgSend(v7, "encodeObject:forKey:", status, CFSTR("status"));
    v4 = v7;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIMLRuntimeEvaluationHistoryRecord | evaluation:%@ status:%@>"), self->_evaluation, self->_status);
}

- (TRIMLRuntimeEvaluation)evaluation
{
  return self->_evaluation;
}

- (TRIEvaluationStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
}

@end
