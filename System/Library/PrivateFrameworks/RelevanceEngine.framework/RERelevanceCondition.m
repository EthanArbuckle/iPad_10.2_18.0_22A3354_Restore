@implementation RERelevanceCondition

+ (id)conditionWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCondtionBlock:", v4);

  return v5;
}

- (RERelevanceCondition)initWithCondtionBlock:(id)a3
{
  id v4;
  RERelevanceCondition *v5;
  uint64_t v6;
  id condition;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RERelevanceCondition;
  v5 = -[RERelevanceCondition init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    condition = v5->_condition;
    v5->_condition = (id)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RERelevanceCondition initWithCondtionBlock:](+[RERelevanceCondition allocWithZone:](RERelevanceCondition, "allocWithZone:", a3), "initWithCondtionBlock:", self->_condition);
}

- (unint64_t)_hash
{
  return objc_msgSend(self->_condition, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceCondition *v4;
  RERelevanceCondition *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (RERelevanceCondition *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x2199B2434](self->_condition);
      v7 = (void *)MEMORY[0x2199B2434](v5->_condition);
      if (v6 == v7)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (float)_evaluateRelevanceWithEnvironment:(id)a3
{
  void (**condition)(id, id);
  float result;

  condition = (void (**)(id, id))self->_condition;
  if (!condition)
    return 0.0;
  condition[2](condition, a3);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_condition, 0);
}

@end
