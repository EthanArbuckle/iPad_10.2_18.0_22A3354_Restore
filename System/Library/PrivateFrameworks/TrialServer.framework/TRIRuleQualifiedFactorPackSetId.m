@implementation TRIRuleQualifiedFactorPackSetId

- (TRIRuleQualifiedFactorPackSetId)initWithIdent:(id)a3 targetingRuleIndex:(int)a4
{
  id v8;
  TRIRuleQualifiedFactorPackSetId *v9;
  TRIRuleQualifiedFactorPackSetId *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4720, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ident != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRIRuleQualifiedFactorPackSetId;
  v9 = -[TRIRuleQualifiedFactorPackSetId init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ident, a3);
    v10->_targetingRuleIndex = a4;
  }

  return v10;
}

+ (id)factorPackSetIdWithIdent:(id)a3 targetingRuleIndex:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdent:targetingRuleIndex:", v6, v4);

  return v7;
}

- (id)copyWithReplacementIdent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdent:targetingRuleIndex:", v4, self->_targetingRuleIndex);

  return v5;
}

- (id)copyWithReplacementTargetingRuleIndex:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdent:targetingRuleIndex:", self->_ident, *(_QWORD *)&a3);
}

- (BOOL)isEqualToFactorPackSetId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIFactorPackSetId *ident;
  void *v10;
  int v11;
  int targetingRuleIndex;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_ident != 0;
  objc_msgSend(v4, "ident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (ident = self->_ident) != 0
    && (objc_msgSend(v5, "ident"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[TRIFactorPackSetId isEqual:](ident, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    targetingRuleIndex = self->_targetingRuleIndex;
    v13 = targetingRuleIndex == objc_msgSend(v5, "targetingRuleIndex");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRIRuleQualifiedFactorPackSetId *v4;
  TRIRuleQualifiedFactorPackSetId *v5;
  BOOL v6;

  v4 = (TRIRuleQualifiedFactorPackSetId *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIRuleQualifiedFactorPackSetId isEqualToFactorPackSetId:](self, "isEqualToFactorPackSetId:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIFactorPackSetId hash](self->_ident, "hash");
  return self->_targetingRuleIndex - v3 + 32 * v3;
}

- (id)description
{
  id v3;
  TRIFactorPackSetId *ident;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  ident = self->_ident;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_targetingRuleIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIRuleQualifiedFactorPackSetId | ident:%@ targetingRuleIndex:%@>"), ident, v5);

  return v6;
}

- (TRIFactorPackSetId)ident
{
  return self->_ident;
}

- (int)targetingRuleIndex
{
  return self->_targetingRuleIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ident, 0);
}

@end
