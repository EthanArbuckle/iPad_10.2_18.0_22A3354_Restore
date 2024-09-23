@implementation SSSQLiteCompoundPredicate

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  NSArray *predicates;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  predicates = self->_predicates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(predicates);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "bindToStatement:bindingIndex:", a3, a4);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  NSArray *predicates;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  predicates = self->_predicates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(predicates);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "SQLJoinClausesForEntityClass:", a3);
      if (v10)
      {
        v11 = v10;
        if (!v7)
          v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        objc_msgSend(v7, "unionSet:", v11);
      }
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);
  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  NSArray *predicates;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_predicates, "count"))
    return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("1"));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  predicates = self->_predicates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(predicates);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "SQLForEntityClass:", a3);
        if (v11)
        {
          v12 = v11;
          if ((unint64_t)objc_msgSend(v5, "length") >= 2)
            objc_msgSend(v5, "appendString:", self->_combinationOperation);
          objc_msgSend(v5, "appendString:", v12);
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteCompoundPredicate;
  -[SSSQLiteCompoundPredicate dealloc](&v3, sel_dealloc);
}

+ (id)predicateMatchingAllPredicates:(id)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = CFSTR(" AND ");
  v4[2] = objc_msgSend(a3, "copy");
  return v4;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = CFSTR(" OR ");
  v4[2] = objc_msgSend(a3, "copy");
  return v4;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(a4);
        objc_msgSend(v9, "addObject:", +[SSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](SSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", a3, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), a5));
      }
      while (v11 != v13);
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  v14 = (void *)objc_msgSend(a1, "predicateMatchingAnyPredicates:", v9);

  return v14;
}

- (unint64_t)hash
{
  id v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSQLiteCompoundPredicate;
  v3 = -[SSSQLitePredicate hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_combinationOperation, "hash");
  return (unint64_t)v3
       + -[NSArray hash](-[SSSQLiteCompoundPredicate predicates](self, "predicates"), "hash")
       + v4;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *combinationOperation;
  NSArray *predicates;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSSQLiteCompoundPredicate;
  v5 = -[SSSQLitePredicate isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    combinationOperation = self->_combinationOperation;
    if (combinationOperation == *((NSString **)a3 + 1)
      || (v5 = -[NSString isEqual:](combinationOperation, "isEqual:")) != 0)
    {
      predicates = self->_predicates;
      if (predicates == (NSArray *)objc_msgSend(a3, "predicates"))
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = -[NSArray isEqual:](self->_predicates, "isEqual:", objc_msgSend(a3, "predicates"));
    }
  }
  return v5;
}

- (NSArray)predicates
{
  return self->_predicates;
}

@end
