@implementation PLLibraryScopeCondition

- (unsigned)type
{
  PLLibraryScopeCondition *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PLLibraryScopeCondition)initWithCriteria:(unsigned __int8)a3
{
  PLLibraryScopeCondition *result;
  objc_super v6;

  objc_msgSend((id)objc_opt_class(), "_abortIfCalledOnBaseClass");
  v6.receiver = self;
  v6.super_class = (Class)PLLibraryScopeCondition;
  result = -[PLLibraryScopeCondition init](&v6, sel_init);
  if (result)
    result->_criteria = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  -[PLLibraryScopeCondition conditionQuery](self, "conditionQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "singleQueries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionWithSingleQueries:criteria:", v6, -[PLLibraryScopeCondition criteria](self, "criteria"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)query
{
  void *v3;
  id v4;
  void *v5;

  -[PLLibraryScopeCondition conditionQuery](self, "conditionQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLLibraryScopeCondition criteria](self, "criteria") == 1)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732A8], "notQuery:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)conditionQuery
{
  PLLibraryScopeCondition *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)description
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PLLibraryScopeCondition;
  -[PLLibraryScopeCondition description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLLibraryScopeCondition type](self, "type");
  v6 = CFSTR("Date Range");
  if (v5 != 1)
    v6 = CFSTR("Unknown");
  if (v5 == 2)
    v6 = CFSTR("Person");
  v7 = v6;
  v8 = -[PLLibraryScopeCondition criteria](self, "criteria");
  v9 = CFSTR("Exclusive");
  if (v8 != 2)
    v9 = CFSTR("Unknown");
  if (v8 == 1)
    v9 = CFSTR("Inclusive");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@, %@"), v4, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unsigned)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(unsigned __int8)a3
{
  self->_criteria = a3;
}

+ (void)_abortIfCalledOnBaseClass
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = a1;
    PLAbstractMethodException();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
}

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a1;
  PLAbstractMethodException();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

+ (BOOL)supportsQueryKey:(int)a3
{
  objc_msgSend(a1, "_abortIfCalledOnBaseClass", *(_QWORD *)&a3);
  return 0;
}

@end
