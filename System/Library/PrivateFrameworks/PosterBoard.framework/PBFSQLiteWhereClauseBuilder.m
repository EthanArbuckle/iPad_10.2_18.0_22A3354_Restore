@implementation PBFSQLiteWhereClauseBuilder

- (PBFSQLiteWhereClauseBuilder)init
{
  PBFSQLiteWhereClauseBuilder *v2;
  uint64_t v3;
  NSMutableString *components;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteWhereClauseBuilder;
  v2 = -[PBFSQLiteWhereClauseBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    components = v2->_components;
    v2->_components = (NSMutableString *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBFSQLiteWhereClauseBuilder *v4;
  uint64_t v5;
  NSMutableString *components;
  uint64_t v7;
  NSMutableArray *componentStack;

  v4 = objc_alloc_init(PBFSQLiteWhereClauseBuilder);
  v5 = -[NSMutableString mutableCopy](self->_components, "mutableCopy");
  components = v4->_components;
  v4->_components = (NSMutableString *)v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_componentStack, 1);
  componentStack = v4->_componentStack;
  v4->_componentStack = (NSMutableArray *)v7;

  return v4;
}

- (id)currentComponent
{
  void *components;
  void *v4;
  id v5;

  -[NSMutableArray lastObject](self->_componentStack, "lastObject");
  components = (void *)objc_claimAutoreleasedReturnValue();
  v4 = components;
  if (!components)
    components = self->_components;
  v5 = components;

  return v5;
}

- (id)appendEqualsDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  PBFSQLiteWhereClauseBuilder *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PBFSQLiteWhereClauseBuilder_appendEqualsDictionary___block_invoke;
  v8[3] = &unk_1E86F6E38;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[PBFSQLiteWhereClauseBuilder appendExpression:combinator:](self, "appendExpression:combinator:", v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __54__PBFSQLiteWhereClauseBuilder_appendEqualsDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keyEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendColumn:comparison:toValue:combinator:", v7, 0, v8, 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)appendColumn:(id)a3 comparison:(unint64_t)a4 toValue:(id)a5 combinator:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("columnName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteWhereClauseBuilder appendColumn:comparison:toValue:combinator:].cold.1(a2);
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBABACB0);
  }
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("value"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteWhereClauseBuilder appendColumn:comparison:toValue:combinator:].cold.2(a2);
    goto LABEL_16;
  }
  -[PBFSQLiteWhereClauseBuilder currentComponent](self, "currentComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  _NSStringFromPBFSQLiteWhereClauseComparison(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("%@ %@"), v10, v15);

  if (_WhereClauseComparisonRequiresValue(a4))
  {
    _NSStringFromPBFSQLiteObjectParameter(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" %@"), v16);

  }
  if (v14)
  {
    _NSStringFromPBFSQLiteWhereClauseComparison(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_WhereClauseComparisonRequiresValue(a4) & 1) != 0)
    {
      _NSStringFromPBFSQLiteObjectParameter(v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendFormat:", CFSTR(" %@ %@"), v17, v18);

    }
    else
    {
      objc_msgSend(v13, "appendFormat:", CFSTR(" %@ %@"), v17, &stru_1E86FC5B8);
    }

  }
  return self;
}

- (id)appendExpression:(id)a3 combinator:(unint64_t)a4
{
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSMutableArray *componentStack;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableString *components;
  void *v17;
  id result;
  void *v19;

  v7 = a3;
  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD))v7;
    componentStack = self->_componentStack;
    if (!componentStack)
    {
      v10 = (NSMutableArray *)objc_opt_new();
      v11 = self->_componentStack;
      self->_componentStack = v10;

      componentStack = self->_componentStack;
    }
    v12 = (void *)objc_opt_new();
    -[NSMutableArray addObject:](componentStack, "addObject:", v12);

    v13 = -[NSMutableString length](self->_components, "length");
    ((void (**)(_QWORD, PBFSQLiteWhereClauseBuilder *))v8)[2](v8, self);
    -[NSMutableArray lastObject](self->_componentStack, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_componentStack, "removeLastObject");
    if (!-[NSMutableArray count](self->_componentStack, "count"))
    {
      v15 = self->_componentStack;
      self->_componentStack = 0;

    }
    components = self->_components;
    if (v13)
    {
      _NSStringFromPBFSQLiteWhereClauseCombinator(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendFormat:](components, "appendFormat:", CFSTR("%@ (%@)"), v17, v14);

    }
    else
    {
      -[NSMutableString appendFormat:](components, "appendFormat:", CFSTR("(%@)"), v14);
    }

    return self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expressionBlock"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFSQLiteWhereClauseBuilder appendExpression:combinator:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)build
{
  return (id)-[NSMutableString copy](self->_components, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentStack, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

- (void)appendColumn:(const char *)a1 comparison:toValue:combinator:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)appendColumn:(const char *)a1 comparison:toValue:combinator:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)appendExpression:(const char *)a1 combinator:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
