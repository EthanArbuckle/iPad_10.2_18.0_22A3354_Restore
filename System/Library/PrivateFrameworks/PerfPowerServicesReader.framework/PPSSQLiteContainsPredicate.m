@implementation PPSSQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  objc_msgSend(a1, "_containsPredicateWithProperty:values:isNegative:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  objc_msgSend(a1, "_containsPredicateWithProperty:values:isNegative:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PPSSQLiteContainsPredicate)initWithProperty:(id)a3 values:(id)a4 isNegative:(BOOL)a5
{
  id v8;
  id v9;
  PPSSQLiteContainsPredicate *v10;
  uint64_t v11;
  NSString *property;
  uint64_t v13;
  NSArray *values;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPSSQLiteContainsPredicate;
  v10 = -[PPSSQLiteContainsPredicate init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    property = v10->super._property;
    v10->super._property = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    values = v10->_values;
    v10->_values = (NSArray *)v13;

    v10->_isNegative = a5;
  }

  return v10;
}

+ (id)_containsPredicateWithProperty:(id)a3 values:(id)a4 isNegative:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PPSSQLiteContainsPredicate *v12;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a1, "_arrayFromValues:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v11 = 2;
    else
      v11 = 1;
    +[PPSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](PPSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, v10, v11);
    v12 = (PPSSQLiteContainsPredicate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = -[PPSSQLiteContainsPredicate initWithProperty:values:isNegative:]([PPSSQLiteContainsPredicate alloc], "initWithProperty:values:isNegative:", v8, v9, v5);
  }

  return v12;
}

+ (id)_arrayFromValues:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "allObjects");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

LABEL_14:
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSSQLiteContainsPredicate;
  if (-[PPSSQLitePropertyPredicate isEqual:](&v12, sel_isEqual_, v4)
    && (v5 = -[PPSSQLiteContainsPredicate isNegative](self, "isNegative"),
        v5 == objc_msgSend(v4, "isNegative")))
  {
    -[PPSSQLiteContainsPredicate values](self, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      v6 = 1;
    }
    else
    {
      -[PPSSQLiteContainsPredicate values](self, "values");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "values");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqual:", v10);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PPSSQLiteContainsPredicate values](self, "values", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        PPSSQLiteBindFoundationValueToStatement(a3, *a4, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++*a4;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)sqlForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLitePropertyPredicate property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disambiguatedSQLForProperty:shouldEscape:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  if (-[PPSSQLiteContainsPredicate isNegative](self, "isNegative"))
    v8 = CFSTR(" NOT IN (");
  else
    v8 = CFSTR(" IN (");
  objc_msgSend(v5, "appendString:", v8);
  -[PPSSQLiteContainsPredicate values](self, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v5, "appendString:", CFSTR("?"));
    if (v10 >= 2)
    {
      v11 = v10 - 1;
      do
      {
        objc_msgSend(v5, "appendString:", CFSTR(", ?"));
        --v11;
      }
      while (v11);
    }
  }
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  objc_msgSend(v5, "appendString:", CFSTR(")"));

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[PPSSQLiteContainsPredicate values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PPSSQLiteContainsPredicate values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[PPSSQLitePropertyPredicate property](self, "property");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (self->_isNegative)
    v15 = "";
  else
    v15 = "NOT ";
  objc_msgSend(v12, "stringWithFormat:", CFSTR("'%@' %sIN (%@)"), v13, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isNegative
{
  return self->_isNegative;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
