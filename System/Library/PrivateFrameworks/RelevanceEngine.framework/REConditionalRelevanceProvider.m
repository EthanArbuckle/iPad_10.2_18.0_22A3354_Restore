@implementation REConditionalRelevanceProvider

- (REConditionalRelevanceProvider)initWithRelevanceCondition:(id)a3
{
  id v4;
  void *v5;
  REConditionalRelevanceProvider *v6;
  REConditionalRelevanceProvider *v7;
  uint64_t v8;
  RERelevanceCondition *condition;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REConditionalRelevanceProvider;
    v7 = -[RERelevanceProvider init](&v11, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v4, "copy");
      condition = v7->_condition;
      v7->_condition = (RERelevanceCondition *)v8;

    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REConditionalRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[RERelevanceCondition copy](self->_condition, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

- (unint64_t)_hash
{
  return -[RERelevanceCondition hash](self->_condition, "hash");
}

- (BOOL)isEqual:(id)a3
{
  REConditionalRelevanceProvider *v4;
  RERelevanceCondition *condition;
  RERelevanceCondition *v6;
  RERelevanceCondition *v7;
  RERelevanceCondition *v8;
  char v9;
  objc_super v11;

  v4 = (REConditionalRelevanceProvider *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)REConditionalRelevanceProvider,
          -[RERelevanceProvider isEqual:](&v11, sel_isEqual_, v4)))
    {
      condition = self->_condition;
      v6 = v4->_condition;
      v7 = condition;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[RERelevanceCondition isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (RERelevanceCondition)condition
{
  return self->_condition;
}

- (float)_evaluateCondition
{
  void *v3;
  float v4;
  float v5;

  -[RERelevanceProvider environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RERelevanceCondition _evaluateRelevanceWithEnvironment:](self->_condition, "_evaluateRelevanceWithEnvironment:", v3);
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
