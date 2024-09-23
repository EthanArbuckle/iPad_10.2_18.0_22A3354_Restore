@implementation PPSSQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  _BYTE *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  if (objc_msgSend(v16, "count") != 1)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    v3[16] = 0;
    v3[17] = 1;
    v4 = (void *)*((_QWORD *)v3 + 3);
    v15 = v3;
    *((_QWORD *)v3 + 3) = CFSTR(" AND ");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v16;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v7)
      goto LABEL_15;
    v8 = *(_QWORD *)v18;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (objc_msgSend(*((id *)v11 + 3), "isEqualToString:", CFSTR(" AND ")))
          {
            objc_msgSend(v5, "addObjectsFromArray:", *((_QWORD *)v11 + 4));

            goto LABEL_13;
          }

        }
        objc_msgSend(v5, "addObject:", v10, v15);
LABEL_13:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v7)
      {
LABEL_15:

        v12 = objc_msgSend(v5, "copy");
        v13 = (void *)v15[4];
        v15[4] = v12;

        goto LABEL_16;
      }
    }
  }
  objc_msgSend(v16, "firstObject");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v15;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  _BYTE *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  if (objc_msgSend(v16, "count") != 1)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    v3[16] = 0;
    v3[17] = 0;
    v4 = (void *)*((_QWORD *)v3 + 3);
    v15 = v3;
    *((_QWORD *)v3 + 3) = CFSTR(" OR ");

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v16;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v7)
      goto LABEL_15;
    v8 = *(_QWORD *)v18;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (objc_msgSend(*((id *)v11 + 3), "isEqualToString:", CFSTR(" OR ")))
          {
            objc_msgSend(v5, "addObjectsFromArray:", *((_QWORD *)v11 + 4));

            goto LABEL_13;
          }

        }
        objc_msgSend(v5, "addObject:", v10, v15);
LABEL_13:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v7)
      {
LABEL_15:

        v12 = objc_msgSend(v5, "copy");
        v13 = (void *)v15[4];
        v15[4] = v12;

        goto LABEL_16;
      }
    }
  }
  objc_msgSend(v16, "firstObject");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v15;
}

+ (id)negatedPredicate:(id)a3
{
  id v3;
  _BYTE *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)objc_opt_class());
    v4[16] = 1;
    v5 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = CFSTR("NOT ");

    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v6;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v17 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v17;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        +[PPSSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](PPSSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "predicateMatchingAnyPredicates:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4
{
  objc_msgSend(a1, "predicateWithProperty:values:comparisonType:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateWithProperty:equalToValues:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "negatedPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  id v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPSSQLiteCompoundPredicate;
  v3 = -[PPSSQLitePropertyPredicate hash](&v8, sel_hash);
  v4 = -[NSString hash](self->_combineOperator, "hash");
  -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)v3 + v4 + objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *combineOperator;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSSQLiteCompoundPredicate;
  if (-[PPSSQLitePropertyPredicate isEqual:](&v12, sel_isEqual_, v4)
    && ((combineOperator = self->_combineOperator, combineOperator == (NSString *)v4[3])
     || -[NSString isEqual:](combineOperator, "isEqual:")))
  {
    -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predicates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  -[PPSSQLiteCompoundPredicate predicates](self, "predicates", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "bindToStatement:bindingIndex:", a3, a4);
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_unary)
    {
      objc_msgSend(v7, "appendString:", self->_combineOperator);
      -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "sqlForEntity:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v11);

    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[PPSSQLiteCompoundPredicate predicates](self, "predicates", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sqlForEntity:", v4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              if ((unint64_t)objc_msgSend(v8, "length") >= 2)
                objc_msgSend(v8, "appendString:", self->_combineOperator);
              objc_msgSend(v8, "appendString:", v17);
            }

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v14);
      }

    }
    objc_msgSend(v8, "appendString:", CFSTR(")"));
  }
  else
  {
    if (self->_trueIfNoPredicates)
      v12 = CFSTR("1");
    else
      v12 = CFSTR("0");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)sqlJoinClausesForEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PPSSQLiteCompoundPredicate predicates](self, "predicates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "sqlJoinClausesForEntity:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "unionSet:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v6;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PPSSQLiteCompoundPredicate predicates](self, "predicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@:\n\t%@\n}"), self->_combineOperator, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_combineOperator, 0);
}

@end
