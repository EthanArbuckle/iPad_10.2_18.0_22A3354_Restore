@implementation _DASPolicyResponseRationale

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

- (_DASPolicyResponseRationale)initWithPolicyName:(id)a3
{
  id v5;
  _DASPolicyResponseRationale *v6;
  _DASPolicyResponseRationale *v7;
  uint64_t v8;
  NSMutableArray *reasons;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASPolicyResponseRationale;
  v6 = -[_DASPolicyResponseRationale init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_policyName, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    reasons = v7->_reasons;
    v7->_reasons = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)addRationaleWithCondition:(id)a3
{
  id v5;
  void *v6;
  NSPredicate *v7;
  id *p_condition;
  NSPredicate *condition;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[2];

  v5 = a3;
  v6 = v5;
  condition = self->_condition;
  p_condition = (id *)&self->_condition;
  v7 = condition;
  if (condition)
  {
    v13[0] = v7;
    v13[1] = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
    v11 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));
    v12 = *p_condition;
    *p_condition = (id)v11;

  }
  else
  {
    objc_storeStrong(p_condition, a3);
  }

}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSPredicate *condition;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!-[NSMutableArray count](self->_reasons, "count") && !self->_condition)
    return &stru_1001617C8;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_reasons;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), "description"));
        objc_msgSend(v3, "appendFormat:", CFSTR("{%@},"), v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  condition = self->_condition;
  if (condition)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPredicate description](condition, "description"));
    objc_msgSend(v3, "appendFormat:", CFSTR("{%@}"), v11);

  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (void)addRationaleForCondition:(id)a3 withRequiredValue:(double)a4 withCurrentValue:(double)a5
{
  id v8;
  _DASPolicyRequiredValueRationale *v9;

  v8 = a3;
  v9 = -[_DASPolicyRequiredValueRationale initWithCondition:withRequiredValue:withCurrentValue:]([_DASPolicyRequiredValueRationale alloc], "initWithCondition:withRequiredValue:withCurrentValue:", v8, a4, a5);

  -[NSMutableArray addObject:](self->_reasons, "addObject:", v9);
}

- (int64_t)responseOptions
{
  return self->_responseOptions;
}

- (void)setResponseOptions:(int64_t)a3
{
  self->_responseOptions = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (NSMutableArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_storeStrong((id *)&self->_reasons, a3);
}

@end
