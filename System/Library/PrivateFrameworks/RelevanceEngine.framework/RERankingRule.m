@implementation RERankingRule

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RERankingRule;
  v3 = -[RERule hash](&v7, sel_hash);
  v4 = -[RECondition hash](self->_leftCondition, "hash") ^ v3;
  v5 = -[RECondition hash](self->_rightCondition, "hash");
  return v4 ^ v5 ^ -[REComparisonCondition hash](self->_comparison, "hash") ^ self->_order;
}

- (RECondition)rightCondition
{
  return self->_rightCondition;
}

- (RECondition)leftCondition
{
  return self->_leftCondition;
}

- (REComparisonCondition)comparison
{
  return self->_comparison;
}

- (REConditionEvaluator)rightConditionEvaluator
{
  REConditionEvaluator *v3;
  REConditionEvaluator *rightConditionEvaluator;

  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_rightConditionEvaluator)
  {
    v3 = -[REConditionEvaluator initWithCondition:]([REConditionEvaluator alloc], "initWithCondition:", self->_rightCondition);
    rightConditionEvaluator = self->_rightConditionEvaluator;
    self->_rightConditionEvaluator = v3;

  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  return self->_rightConditionEvaluator;
}

- (REConditionEvaluator)leftConditionEvaluator
{
  REConditionEvaluator *v3;
  REConditionEvaluator *leftConditionEvaluator;

  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_leftConditionEvaluator)
  {
    v3 = -[REConditionEvaluator initWithCondition:]([REConditionEvaluator alloc], "initWithCondition:", self->_leftCondition);
    leftConditionEvaluator = self->_leftConditionEvaluator;
    self->_leftConditionEvaluator = v3;

  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  return self->_leftConditionEvaluator;
}

- (REConditionEvaluator)comparisonConditionEvaluator
{
  REConditionEvaluator *v3;
  REConditionEvaluator *comparisonConditionEvaluator;

  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_comparisonConditionEvaluator)
  {
    v3 = -[REConditionEvaluator initWithCondition:]([REConditionEvaluator alloc], "initWithCondition:", self->_comparison);
    comparisonConditionEvaluator = self->_comparisonConditionEvaluator;
    self->_comparisonConditionEvaluator = v3;

  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  return self->_comparisonConditionEvaluator;
}

- (RERankingRule)initWithLeftCondition:(id)a3 rightCondition:(id)a4 comparisonCondition:(id)a5 order:(int64_t)a6
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void **v20;
  RERankingRule *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v41;

  v11 = a3;
  v12 = a4;
  v19 = a5;
  v20 = (void **)MEMORY[0x24BDBCAB8];
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Condition must be non-nil"), v13, v14, v15, v16, v17, v18, (uint64_t)v41.receiver);
    if (v12)
    {
LABEL_3:
      if (v19)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  RERaiseInternalException(*v20, CFSTR("Condition must be non-nil"), v13, v14, v15, v16, v17, v18, (uint64_t)v41.receiver);
  if (!v19)
LABEL_4:
    RERaiseInternalException(*v20, CFSTR("Condition must be non-nil"), v13, v14, v15, v16, v17, v18, (uint64_t)v41.receiver);
LABEL_5:
  v41.receiver = self;
  v41.super_class = (Class)RERankingRule;
  v21 = -[RERule init](&v41, sel_init);
  if (v21)
  {
    if (objc_msgSend(v11, "_validForRanking"))
      RERaiseInternalException(*v20, CFSTR("REComparisonCondition cannot be used for the left condition"), v22, v23, v24, v25, v26, v27, (uint64_t)v41.receiver);
    if (objc_msgSend(v12, "_validForRanking"))
      RERaiseInternalException(*v20, CFSTR("REComparisonCondition cannot be used for the right condition"), v28, v29, v30, v31, v32, v33, (uint64_t)v41.receiver);
    if ((objc_msgSend(v19, "_validForRanking") & 1) == 0)
      RERaiseInternalException(*v20, CFSTR("REComparisonCondition must be used for the comparison condition"), v34, v35, v36, v37, v38, v39, (uint64_t)v41.receiver);
    objc_storeStrong((id *)&v21->_leftCondition, a3);
    objc_storeStrong((id *)&v21->_rightCondition, a4);
    objc_storeStrong((id *)&v21->_comparison, a5);
    v21->_order = a6;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  RERankingRule *v4;
  RERankingRule *v5;
  RECondition *leftCondition;
  RECondition *v7;
  RECondition *v8;
  RECondition *v9;
  int v10;
  BOOL v11;
  RECondition *rightCondition;
  RECondition *v13;
  RECondition *v14;
  RECondition *v15;
  int v16;
  REComparisonCondition *comparison;
  REComparisonCondition *v18;
  REComparisonCondition *v19;
  REComparisonCondition *v20;
  int v21;
  objc_super v23;

  v4 = (RERankingRule *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23.receiver = self;
      v23.super_class = (Class)RERankingRule;
      if (-[RERule isEqual:](&v23, sel_isEqual_, v4))
      {
        v5 = v4;
        leftCondition = self->_leftCondition;
        v7 = v5->_leftCondition;
        if (leftCondition == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = leftCondition;
          v10 = -[RECondition isEqual:](v9, "isEqual:", v8);

          if (!v10)
            goto LABEL_16;
        }
        rightCondition = self->_rightCondition;
        v13 = v5->_rightCondition;
        if (rightCondition == v13)
        {

        }
        else
        {
          v14 = v13;
          v15 = rightCondition;
          v16 = -[RECondition isEqual:](v15, "isEqual:", v14);

          if (!v16)
            goto LABEL_16;
        }
        comparison = self->_comparison;
        v18 = v5->_comparison;
        if (comparison == v18)
        {

        }
        else
        {
          v19 = v18;
          v20 = comparison;
          v21 = -[REComparisonCondition isEqual:](v20, "isEqual:", v19);

          if (!v21)
          {
LABEL_16:
            v11 = 0;
LABEL_19:

            goto LABEL_20;
          }
        }
        v11 = self->_order == v5->_order;
        goto LABEL_19;
      }
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparison, 0);
  objc_storeStrong((id *)&self->_rightCondition, 0);
  objc_storeStrong((id *)&self->_leftCondition, 0);
  objc_storeStrong((id *)&self->_comparisonConditionEvaluator, 0);
  objc_storeStrong((id *)&self->_rightConditionEvaluator, 0);
  objc_storeStrong((id *)&self->_leftConditionEvaluator, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLeftCondition:rightCondition:comparisonCondition:order:", self->_leftCondition, self->_rightCondition, self->_comparison, self->_order);
  -[RERule priority](self, "priority");
  objc_msgSend(v4, "setPriority:");
  return v4;
}

- (int64_t)order
{
  return self->_order;
}

@end
