@implementation PPSPredicateUtilities

+ (id)constantValueForLeftExpression:(id)a3 inPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "subpredicateForPredicate:withLeftExpression:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v7, "rightExpression"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "expressionType"),
        v8,
        !v9))
  {
    objc_msgSend(v7, "rightExpression");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constantValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)constantValueForLeftKeyPath:(id)a3 inPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "constantValueForLeftExpression:inPredicate:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)keyPathsAndValuesForPredicate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "leftExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "expressionType") == 3)
    {
      objc_msgSend(v5, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "constantValueForLeftKeyPath:inPredicate:", v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_18;
    }
    v4 = v3;
    v9 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "subpredicates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v5);
          objc_msgSend((id)objc_opt_class(), "keyPathsAndValuesForPredicate:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v9, "addEntriesFromDictionary:", v14);

        }
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }
  }

LABEL_18:
  return v9;
}

+ (id)predicateByReplacingNilWithEmptyString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char isKindOfClass;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = v3;
    v8 = v10;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_28;
    v11 = objc_msgSend(v10, "compoundPredicateType");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v8, "subpredicates", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend((id)objc_opt_class(), "predicateByReplacingNilWithEmptyString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    if (v11)
    {
      if (v11 == 2)
      {
        objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v12);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 != 1)
        {
          v23 = 0;
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v12);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v23 = v19;
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD14C0];
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "notPredicateWithSubpredicate:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

    }
LABEL_27:

    v8 = (id)v23;
    goto LABEL_28;
  }
  v4 = v3;
  objc_msgSend(v4, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "expressionType") == 3)
  {
    objc_msgSend(v5, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "constantValueForLeftKeyPath:inPredicate:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", &stru_251431358);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14B8]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v20, objc_msgSend(v4, "comparisonPredicateModifier"), objc_msgSend(v4, "predicateOperatorType"), objc_msgSend(v4, "options"));

    }
  }
  else
  {
    v8 = 0;
  }

LABEL_28:
  return v8;
}

+ (id)predicateByRemovingSubpredicateWithLeftExpression:(id)a3 fromPredicate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v5))
      v9 = 0;
    else
      v9 = v7;
    v10 = v9;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v6;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v11, "subpredicates", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend((id)objc_opt_class(), "predicateByRemovingSubpredicateWithLeftExpression:fromPredicate:", v5, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v12, "addObject:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v15);
      }

      if (objc_msgSend(v12, "count"))
        v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v11, "compoundPredicateType"), v12);
      else
        v10 = 0;

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (id)predicateByRemovingSubpredicateWithLeftKeyPath:(id)a3 fromPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateByRemovingSubpredicateWithLeftExpression:fromPredicate:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForStartTimestamp:(double)a3 endTimestamp:(double)a4 withKeyPath:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1758];
  v8 = a5;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(%K >= %f)"), v8, *(_QWORD *)&a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K <= %f)"), v8, *(_QWORD *)&a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD14C0];
  v15[0] = v9;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)subpredicateForPredicate:(id)a3 withLeftExpression:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "subpredicatesForPredicate:withLeftExpression:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)subpredicateForPredicate:(id)a3 withLeftKeyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "subpredicateForPredicate:withLeftExpression:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)subpredicatesForPredicate:(id)a3 withLeftExpression:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v6);

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v5;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v12, "subpredicates", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend((id)objc_opt_class(), "subpredicatesForPredicate:withLeftExpression:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), v6);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObjectsFromArray:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v15);
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)subpredicatesForPredicate:(id)a3 withLeftKeyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "subpredicatesForPredicate:withLeftExpression:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
