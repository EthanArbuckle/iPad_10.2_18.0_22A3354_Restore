@implementation TRIMLRuntimeActiveEvaluationTuple

- (TRIMLRuntimeActiveEvaluationTuple)initWithEval:(id)a3 factorsState:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIMLRuntimeActiveEvaluationTuple *v11;
  TRIMLRuntimeActiveEvaluationTuple *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1872, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eval != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1873, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorsState != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIMLRuntimeActiveEvaluationTuple;
  v11 = -[TRIMLRuntimeActiveEvaluationTuple init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eval, a3);
    objc_storeStrong((id *)&v12->_factorsState, a4);
  }

  return v12;
}

+ (id)tupleWithEval:(id)a3 factorsState:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEval:factorsState:", v7, v6);

  return v8;
}

- (id)copyWithReplacementEval:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEval:factorsState:", v4, self->_factorsState);

  return v5;
}

- (id)copyWithReplacementFactorsState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEval:factorsState:", self->_eval, v4);

  return v5;
}

- (BOOL)isEqualToTuple:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIMLRuntimeEvaluation *eval;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRIFactorsState *factorsState;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_eval != 0;
  objc_msgSend(v4, "eval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  eval = self->_eval;
  if (eval)
  {
    objc_msgSend(v5, "eval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIMLRuntimeEvaluation isEqual:](eval, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_factorsState != 0;
  objc_msgSend(v5, "factorsState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    factorsState = self->_factorsState;
    if (factorsState)
    {
      objc_msgSend(v5, "factorsState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TRIFactorsState isEqual:](factorsState, "isEqual:", v16);

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
  TRIMLRuntimeActiveEvaluationTuple *v4;
  TRIMLRuntimeActiveEvaluationTuple *v5;
  BOOL v6;

  v4 = (TRIMLRuntimeActiveEvaluationTuple *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIMLRuntimeActiveEvaluationTuple isEqualToTuple:](self, "isEqualToTuple:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIMLRuntimeEvaluation hash](self->_eval, "hash");
  return -[TRIFactorsState hash](self->_factorsState, "hash") - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMLRuntimeActiveEvaluationTuple)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TRIMLRuntimeActiveEvaluationTuple *v8;
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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("factorsState"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      self = -[TRIMLRuntimeActiveEvaluationTuple initWithEval:factorsState:](self, "initWithEval:factorsState:", v5, v6);
      v8 = self;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("Retrieved nil serialized value for nonnull TRIMLRuntimeActiveEvaluationTuple.factorsState");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIMLRuntimeActiveEvaluationTupleOCNTErrorDomain"), 2, v11);
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
    v18[0] = CFSTR("Retrieved nil serialized value for nonnull TRIMLRuntimeActiveEvaluationTuple.eval");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIMLRuntimeActiveEvaluationTupleOCNTErrorDomain"), 2, v7);
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
  TRIMLRuntimeEvaluation *eval;
  TRIFactorsState *factorsState;
  id v7;

  v4 = a3;
  eval = self->_eval;
  v7 = v4;
  if (eval)
  {
    objc_msgSend(v4, "encodeObject:forKey:", eval, CFSTR("eval"));
    v4 = v7;
  }
  factorsState = self->_factorsState;
  if (factorsState)
  {
    objc_msgSend(v7, "encodeObject:forKey:", factorsState, CFSTR("factorsState"));
    v4 = v7;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIMLRuntimeActiveEvaluationTuple | eval:%@ factorsState:%@>"), self->_eval, self->_factorsState);
}

- (TRIMLRuntimeEvaluation)eval
{
  return self->_eval;
}

- (TRIFactorsState)factorsState
{
  return self->_factorsState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_eval, 0);
}

@end
