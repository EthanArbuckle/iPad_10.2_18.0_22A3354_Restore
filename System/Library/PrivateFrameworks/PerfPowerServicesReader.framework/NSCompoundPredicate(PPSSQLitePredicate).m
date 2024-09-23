@implementation NSCompoundPredicate(PPSSQLitePredicate)

- (id)pps_sqlPredicateForSelect
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "subpredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_msgSend(a1, "compoundPredicateType");
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_opt_new();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(a1, "subpredicates", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "pps_sqlPredicateForSelect");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v6, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      if (v5 == 2)
      {
        +[PPSSQLiteCompoundPredicate predicateMatchingAnyPredicates:](PPSSQLiteCompoundPredicate, "predicateMatchingAnyPredicates:", v6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 != 1)
        {

          v3 = 0;
          return v3;
        }
        +[PPSSQLiteCompoundPredicate predicateMatchingAllPredicates:](PPSSQLiteCompoundPredicate, "predicateMatchingAllPredicates:", v6);
        v13 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(a1, "subpredicates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pps_sqlPredicateForSelect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v3 = 0;
        goto LABEL_19;
      }
      +[PPSSQLiteCompoundPredicate negatedPredicate:](PPSSQLiteCompoundPredicate, "negatedPredicate:", v6);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v13;
LABEL_19:

  }
  return v3;
}

@end
