@implementation TRIEvaluationStatus

- (TRIEvaluationStatus)initWithType:(unsigned __int8)a3 evaluationId:(id)a4 date:(id)a5 evalState:(id)a6
{
  int v9;
  id v12;
  id v13;
  id v14;
  TRIEvaluationStatus *v15;
  TRIEvaluationStatus *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIEvaluationStatusProvider.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("evaluationId"));

    if (v13)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIEvaluationStatusProvider.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_10;
LABEL_3:
  if (v9 == 1 && !v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21.receiver = self;
  v21.super_class = (Class)TRIEvaluationStatus;
  v15 = -[TRIEvaluationStatus init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = v9;
    objc_storeStrong((id *)&v15->_evaluationId, a4);
    objc_storeStrong((id *)&v16->_date, a5);
    objc_storeStrong((id *)&v16->_evalState, a6);
  }

  return v16;
}

+ (id)freshProvider
{
  return (id)objc_opt_new();
}

+ (id)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__TRIEvaluationStatus_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECED7D80 != -1)
    dispatch_once(&qword_1ECED7D80, block);
  return (id)_MergedGlobals_5;
}

void __38__TRIEvaluationStatus_defaultProvider__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(*(id *)(a1 + 32), "freshProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v3;

  objc_autoreleasePoolPop(v2);
}

- (BOOL)isEqual:(id)a3
{
  TRIEvaluationStatus *v4;
  TRIEvaluationStatus *v5;
  TRIEvaluationStatus *v6;
  int type;
  NSDate *date;
  void *v9;
  void *evaluationId;
  void *v11;
  TRIFactorsState *evalState;
  TRIFactorsState *v13;
  void *v14;
  char v15;

  v4 = (TRIEvaluationStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    if (v4 && -[TRIEvaluationStatus isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      type = self->_type;
      if (type != -[TRIEvaluationStatus type](v6, "type"))
      {
        v15 = 0;
LABEL_21:

        goto LABEL_22;
      }
      date = self->_date;
      -[TRIEvaluationStatus date](v6, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSDate isEqualToDate:](date, "isEqualToDate:", v9))
      {
        v15 = 0;
LABEL_20:

        goto LABEL_21;
      }
      evaluationId = self->_evaluationId;
      -[TRIEvaluationStatus evaluationId](v6, "evaluationId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(evaluationId, "isEqualToString:", v11))
      {
        evalState = self->_evalState;
        v13 = evalState;
        if (!evalState)
        {
          -[TRIEvaluationStatus evalState](v6, "evalState");
          evaluationId = (void *)objc_claimAutoreleasedReturnValue();
          if (!evaluationId)
          {
            v15 = 1;
LABEL_18:

            goto LABEL_19;
          }
          v13 = self->_evalState;
        }
        -[TRIEvaluationStatus evalState](v6, "evalState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[TRIFactorsState isEqual:](v13, "isEqual:", v14);

        if (!evalState)
          goto LABEL_18;
      }
      else
      {
        v15 = 0;
      }
LABEL_19:

      goto LABEL_20;
    }
    v15 = 0;
  }
LABEL_22:

  return v15;
}

- (unint64_t)hash
{
  unsigned int type;
  NSUInteger v4;
  uint64_t v5;

  type = self->_type;
  v4 = -[NSString hash](self->_evaluationId, "hash") + 37 * type;
  v5 = -[NSDate hash](self->_date, "hash") + 37 * v4;
  return -[TRIFactorsState hash](self->_evalState, "hash") + 37 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  TRIFactorsState *evalState;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setType:", self->_type);
  objc_msgSend(v5, "setEvaluationId:", self->_evaluationId);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F50]), "initWithDate:", self->_date);
  objc_msgSend(v5, "setTimestamp:", v6);

  evalState = self->_evalState;
  if (evalState)
  {
    -[TRIFactorsState persisted](evalState, "persisted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEvalState:", v8);

  }
  objc_msgSend(v5, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIEvaluationStatusProvider.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("data"));

}

- (TRIEvaluationStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  TRIFactorsState *v8;
  void *v9;
  TRIFactorsState *v10;
  TRIEvaluationStatus *v11;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v17 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedEvaluationStatus, "parseFromData:error:", v5, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v6)
    {
      if (objc_msgSend(v6, "hasType")
        && objc_msgSend(v6, "hasEvaluationId")
        && objc_msgSend(v6, "hasTimestamp"))
      {
        if (objc_msgSend(v6, "hasEvalState"))
        {
          v8 = [TRIFactorsState alloc];
          objc_msgSend(v6, "evalState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[TRIFactorsState initWithPersisted:](v8, "initWithPersisted:", v9);

        }
        else
        {
          v10 = 0;
        }
        if (objc_msgSend(v6, "type") != 1 || v10)
        {
          v13 = objc_msgSend(v6, "type");
          objc_msgSend(v6, "evaluationId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "timestamp");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[TRIEvaluationStatus initWithType:evaluationId:date:evalState:](self, "initWithType:evaluationId:date:evalState:", v13, v14, v16, v10);

          v11 = self;
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v7);
    }
    v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)evaluationId
{
  return self->_evaluationId;
}

- (NSDate)date
{
  return self->_date;
}

- (TRIFactorsState)evalState
{
  return self->_evalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evalState, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_evaluationId, 0);
}

@end
