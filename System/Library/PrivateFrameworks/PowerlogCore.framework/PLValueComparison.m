@implementation PLValueComparison

- (NSString)comparisonOperationString
{
  if (comparisonOperationString_onceToken != -1)
    dispatch_once(&comparisonOperationString_onceToken, &__block_literal_global_11);
  return (NSString *)objc_msgSend((id)comparisonOperationString_comparisonOperationStrings, "objectAtIndexedSubscript:", -[PLValueComparison comparisonOperation](self, "comparisonOperation"));
}

- (NSString)sqlWhereClause
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PLValueComparison comparisonOperation](self, "comparisonOperation") == 6
    || -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 7)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[PLValueComparison key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValueComparison comparisonOperationString](self, "comparisonOperationString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("\"%@\" %@"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[PLValueComparison key](self, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValueComparison comparisonOperationString](self, "comparisonOperationString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValueComparison value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("\"%@\"%@\"%@\"), v4, v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (signed)comparisonOperation
{
  return self->_comparisonOperation;
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (PLValueComparison)initWithKey:(id)a3 withValue:(id)a4 withComparisonOperation:(signed __int16)a5
{
  id v9;
  id v10;
  PLValueComparison *v11;
  PLValueComparison *v12;
  __int16 v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLValueComparison;
  v11 = -[PLValueComparison init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    objc_storeStrong(&v12->_value, a4);
    v12->_comparisonOperation = a5;
    if (!v10 && !-[PLValueComparison hasNilComparisonComponent](v12, "hasNilComparisonComponent"))
    {
      if (-[PLValueComparison hasEqualComparisonComponent](v12, "hasEqualComparisonComponent"))
        v13 = 6;
      else
        v13 = 7;
      v12->_comparisonOperation = v13;
    }
  }

  return v12;
}

- (BOOL)hasNilComparisonComponent
{
  return -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 6
      || -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 7;
}

- (BOOL)hasEqualComparisonComponent
{
  return !-[PLValueComparison comparisonOperation](self, "comparisonOperation")
      || -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 3
      || -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 5;
}

- (BOOL)hasGreaterThanComparisonComponent
{
  return -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 2
      || -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 3;
}

- (BOOL)hasLessThanComparisonComponent
{
  return -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 4
      || -[PLValueComparison comparisonOperation](self, "comparisonOperation") == 5;
}

void __46__PLValueComparison_comparisonOperationString__block_invoke()
{
  void *v0;

  v0 = (void *)comparisonOperationString_comparisonOperationStrings;
  comparisonOperationString_comparisonOperationStrings = (uint64_t)&unk_1E6AF5E88;

}

@end
