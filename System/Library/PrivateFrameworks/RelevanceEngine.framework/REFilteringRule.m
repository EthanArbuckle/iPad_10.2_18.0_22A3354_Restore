@implementation REFilteringRule

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REFilteringRule;
  v3 = -[RERule hash](&v5, sel_hash);
  return -[RECondition hash](self->_condition, "hash") ^ v3;
}

- (REConditionEvaluator)conditionEvaluator
{
  REConditionEvaluator *v3;
  REConditionEvaluator *conditionEvaluator;

  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_conditionEvaluator)
  {
    v3 = -[REConditionEvaluator initWithCondition:]([REConditionEvaluator alloc], "initWithCondition:", self->_condition);
    conditionEvaluator = self->_conditionEvaluator;
    self->_conditionEvaluator = v3;

  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  return self->_conditionEvaluator;
}

- (RECondition)condition
{
  return self->_condition;
}

- (REFilteringRule)initWithCondition:(id)a3 type:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  REFilteringRule *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v13 = a3;
  if (!v13)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Condition must be non-nil"), v7, v8, v9, v10, v11, v12, (uint64_t)v22.receiver);
  v22.receiver = self;
  v22.super_class = (Class)REFilteringRule;
  v14 = -[RERule init](&v22, sel_init);
  if (v14)
  {
    if (objc_msgSend(v13, "_validForRanking"))
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("REComparisonCondition cannot be used for a filtering rule"), v15, v16, v17, v18, v19, v20, (uint64_t)v22.receiver);
    objc_storeStrong((id *)&v14->_condition, a3);
    v14->_type = a4;
  }

  return v14;
}

- (REFilteringRule)initWithCondition:(id)a3
{
  return -[REFilteringRule initWithCondition:type:](self, "initWithCondition:type:", a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  REFilteringRule *v4;
  REFilteringRule *v5;
  RECondition *condition;
  RECondition *v7;
  RECondition *v8;
  RECondition *v9;
  int v10;
  BOOL v11;
  objc_super v13;

  v4 = (REFilteringRule *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13.receiver = self;
      v13.super_class = (Class)REFilteringRule;
      if (-[RERule isEqual:](&v13, sel_isEqual_, v4))
      {
        v5 = v4;
        condition = self->_condition;
        v7 = v5->_condition;
        if (condition == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = condition;
          v10 = -[RECondition isEqual:](v9, "isEqual:", v8);

          if (!v10)
          {
            v11 = 0;
LABEL_11:

            goto LABEL_12;
          }
        }
        v11 = self->_type == v5->_type;
        goto LABEL_11;
      }
    }
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_conditionEvaluator, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCondition:type:", self->_condition, self->_type);
  -[RERule priority](self, "priority");
  objc_msgSend(v4, "setPriority:");
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

@end
