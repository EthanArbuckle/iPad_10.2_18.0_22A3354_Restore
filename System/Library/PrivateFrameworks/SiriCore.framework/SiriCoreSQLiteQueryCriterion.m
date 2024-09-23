@implementation SiriCoreSQLiteQueryCriterion

- (SiriCoreSQLiteQueryCriterion)initWithColumnName:(id)a3 comparisonOperator:(int64_t)a4 logicalOperator:(int64_t)a5 value:(id)a6 values:(id)a7 subcriteria:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SiriCoreSQLiteQueryCriterion *v18;
  uint64_t v19;
  NSString *columnName;
  uint64_t v21;
  SiriCoreSQLiteValue *value;
  uint64_t v23;
  NSArray *values;
  uint64_t v25;
  NSArray *subcriteria;
  objc_super v28;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)SiriCoreSQLiteQueryCriterion;
  v18 = -[SiriCoreSQLiteQueryCriterion init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    columnName = v18->_columnName;
    v18->_columnName = (NSString *)v19;

    v18->_comparisonOperator = a4;
    v18->_logicalOperator = a5;
    v21 = objc_msgSend(v15, "copy");
    value = v18->_value;
    v18->_value = (SiriCoreSQLiteValue *)v21;

    v23 = objc_msgSend(v16, "copy");
    values = v18->_values;
    v18->_values = (NSArray *)v23;

    v25 = objc_msgSend(v17, "copy");
    subcriteria = v18->_subcriteria;
    v18->_subcriteria = (NSArray *)v25;

  }
  return v18;
}

- (SiriCoreSQLiteQueryCriterion)initWithColumnName:(id)a3 comparisonOperator:(int64_t)a4 logicalOperator:(int64_t)a5 value:(id)a6 values:(id)a7 subcriteriaProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  SiriCoreSQLiteQueryCriterion *v17;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (a8)
  {
    (*((void (**)(id))a8 + 2))(a8);
    a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:](self, "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v14, a4, a5, v15, v16, a8);

  return v17;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (int64_t)comparisonOperator
{
  return self->_comparisonOperator;
}

- (int64_t)logicalOperator
{
  return self->_logicalOperator;
}

- (SiriCoreSQLiteValue)value
{
  return self->_value;
}

- (NSArray)values
{
  return self->_values;
}

- (NSArray)subcriteria
{
  return self->_subcriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcriteria, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

+ (id)equalToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteQueryCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v6, 1, 0, v5, 0, 0);

  return v7;
}

+ (id)greaterThanQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteQueryCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v6, 2, 0, v5, 0, 0);

  return v7;
}

+ (id)greaterThanOrEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteQueryCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v6, 3, 0, v5, 0, 0);

  return v7;
}

+ (id)lessThanQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteQueryCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v6, 4, 0, v5, 0, 0);

  return v7;
}

+ (id)lessThanOrEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteQueryCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v6, 5, 0, v5, 0, 0);

  return v7;
}

+ (id)notEqualToQueryCriterionWithColumnName:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  SiriCoreSQLiteQueryCriterion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v6, 6, 0, v5, 0, 0);

  return v7;
}

+ (id)andQueryCriterionWithSubcriteria:(id)a3
{
  id v3;
  SiriCoreSQLiteQueryCriterion *v4;

  v3 = a3;
  v4 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", 0, 0, 1, 0, 0, v3);

  return v4;
}

+ (id)andQueryCriterionWithSubcriteriaProvider:(id)a3
{
  id v3;
  SiriCoreSQLiteQueryCriterion *v4;

  v3 = a3;
  v4 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteriaProvider:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteriaProvider:", 0, 0, 1, 0, 0, v3);

  return v4;
}

+ (id)orQueryCriterionWithSubcriteria:(id)a3
{
  id v3;
  SiriCoreSQLiteQueryCriterion *v4;

  v3 = a3;
  v4 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", 0, 0, 12, 0, 0, v3);

  return v4;
}

+ (id)orQueryCriterionWithSubcriteriaProvider:(id)a3
{
  id v3;
  SiriCoreSQLiteQueryCriterion *v4;

  v3 = a3;
  v4 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteriaProvider:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteriaProvider:", 0, 0, 12, 0, 0, v3);

  return v4;
}

+ (id)betweenQueryCriterionWithColumnName:(id)a3 fromValue:(id)a4 toValue:(id)a5 negation:(BOOL)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  SiriCoreSQLiteQueryCriterion *v12;
  void *v13;
  SiriCoreSQLiteQueryCriterion *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (a6)
    v8 = 8;
  else
    v8 = 2;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [SiriCoreSQLiteQueryCriterion alloc];
  v16[0] = v10;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:](v12, "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v11, 0, v8, 0, v13, 0);
  return v14;
}

+ (id)inQueryCriterionWithColumnName:(id)a3 values:(id)a4 negation:(BOOL)a5
{
  uint64_t v6;
  id v7;
  id v8;
  SiriCoreSQLiteQueryCriterion *v9;

  if (a5)
    v6 = 9;
  else
    v6 = 3;
  v7 = a4;
  v8 = a3;
  v9 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v8, 0, v6, 0, v7, 0);

  return v9;
}

+ (id)isQueryCriterionWithColumnName:(id)a3 value:(id)a4 negation:(BOOL)a5
{
  uint64_t v6;
  id v7;
  id v8;
  SiriCoreSQLiteQueryCriterion *v9;

  if (a5)
    v6 = 5;
  else
    v6 = 4;
  v7 = a4;
  v8 = a3;
  v9 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v8, 0, v6, v7, 0, 0);

  return v9;
}

+ (id)isNullQueryCriterionWithColumnName:(id)a3 negation:(BOOL)a4
{
  uint64_t v4;
  id v5;
  SiriCoreSQLiteQueryCriterion *v6;

  if (a4)
    v4 = 11;
  else
    v4 = 6;
  v5 = a3;
  v6 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v5, 0, v4, 0, 0, 0);

  return v6;
}

+ (id)likeQueryCriterionWithColumnName:(id)a3 value:(id)a4 negation:(BOOL)a5
{
  uint64_t v6;
  id v7;
  id v8;
  SiriCoreSQLiteQueryCriterion *v9;

  if (a5)
    v6 = 10;
  else
    v6 = 7;
  v7 = a4;
  v8 = a3;
  v9 = -[SiriCoreSQLiteQueryCriterion initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:]([SiriCoreSQLiteQueryCriterion alloc], "initWithColumnName:comparisonOperator:logicalOperator:value:values:subcriteria:", v8, 0, v6, v7, 0, 0);

  return v9;
}

@end
