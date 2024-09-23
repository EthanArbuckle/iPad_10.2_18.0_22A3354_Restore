@implementation SSSQLiteContainsPredicate

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  id values;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_query)
  {
    -[SSSQLiteQuery bindToSelectStatement:bindingIndex:](self->_query, "bindToSelectStatement:bindingIndex:", a3, a4);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    values = self->_values;
    v7 = objc_msgSend(values, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(values);
          SSSQLiteBindFoundationValueToStatement(a3, *a4, *(void **)(*((_QWORD *)&v11 + 1) + 8 * i));
          ++*a4;
        }
        v8 = objc_msgSend(values, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  SSSQLiteQuery *query;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", -[SSSQLitePropertyPredicate property](self, "property"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v4);
  v6 = v5;
  if (self->_negative)
    v7 = CFSTR(" NOT IN (");
  else
    v7 = CFSTR(" IN (");
  objc_msgSend(v5, "appendString:", v7);
  query = self->_query;
  if (query)
  {
    v15[0] = self->_queryProperty;
    v9 = -[SSSQLiteQuery copySelectSQLWithProperties:count:](query, "copySelectSQLWithProperties:count:", v15, 1);
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "appendString:", v9);

    }
  }
  else
  {
    v11 = objc_msgSend(self->_values, "count");
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v6, "appendString:", CFSTR("?"));
      v13 = v12 - 1;
      if (v12 != 1)
      {
        do
        {
          objc_msgSend(v6, "appendString:", CFSTR(", ?"));
          --v13;
        }
        while (v13);
      }
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteContainsPredicate;
  -[SSSQLitePropertyPredicate dealloc](&v3, sel_dealloc);
}

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = objc_msgSend(a3, "copy");
  *((_BYTE *)v6 + 16) = 0;
  v6[5] = objc_msgSend(a4, "copy");
  return v6;
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)objc_opt_class());
  v6[1] = objc_msgSend(a3, "copy");
  *((_BYTE *)v6 + 16) = 1;
  v6[5] = objc_msgSend(a4, "copy");
  return v6;
}

+ (id)containsPredicateWithProperty:(id)a3 query:(id)a4 queryProperty:(id)a5
{
  _QWORD *v8;

  v8 = objc_alloc_init((Class)objc_opt_class());
  v8[1] = objc_msgSend(a3, "copy");
  *((_BYTE *)v8 + 16) = 0;
  v8[3] = a4;
  v8[4] = objc_msgSend(a5, "copy");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  NSArray *v7;
  SSSQLiteQuery *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSSQLiteContainsPredicate;
  v5 = -[SSSQLitePropertyPredicate isEqual:](&v10, sel_isEqual_);
  if (v5)
  {
    v6 = -[SSSQLiteContainsPredicate isNegative](self, "isNegative");
    if (v6 == objc_msgSend(a3, "isNegative"))
    {
      v7 = -[SSSQLiteContainsPredicate values](self, "values");
      if (v7 == (NSArray *)objc_msgSend(a3, "values")
        || (v5 = -[NSArray isEqual:](-[SSSQLiteContainsPredicate values](self, "values"), "isEqual:", objc_msgSend(a3, "values"))) != 0)
      {
        v8 = -[SSSQLiteContainsPredicate query](self, "query");
        if (v8 == (SSSQLiteQuery *)objc_msgSend(a3, "query"))
          LOBYTE(v5) = 1;
        else
          LOBYTE(v5) = -[SSSQLiteQuery isEqual:](-[SSSQLiteContainsPredicate query](self, "query"), "isEqual:", objc_msgSend(a3, "query"));
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (SSSQLiteQuery)query
{
  return self->_query;
}

- (NSString)queryProperty
{
  return self->_queryProperty;
}

- (NSArray)values
{
  return (NSArray *)self->_values;
}

@end
