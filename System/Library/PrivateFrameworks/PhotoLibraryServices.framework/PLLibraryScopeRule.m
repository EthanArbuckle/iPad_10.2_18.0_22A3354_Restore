@implementation PLLibraryScopeRule

- (PLLibraryScopeRule)initWithQuery:(id)a3
{
  id v4;
  PLLibraryScopeRule *v5;
  NSMutableArray *v6;
  NSMutableArray *unknownConditions;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id obj;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PLLibraryScopeRule init](self, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unknownConditions = v5->_unknownConditions;
    v5->_unknownConditions = v6;

    v22 = v4;
    objc_msgSend((id)objc_opt_class(), "_dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:parentQuery:", v4, 0);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend((id)objc_opt_class(), "_knownConditionClasses");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                if (objc_msgSend(v12, "hasKey")
                  && objc_msgSend(v18, "supportsQueryKey:", objc_msgSend(v12, "key")))
                {
                  objc_msgSend(v24, "objectForKeyedSubscript:", v11);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "conditionWithSingleQueries:criteria:", v11, objc_msgSend(v19, "unsignedIntegerValue"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLLibraryScopeRule addCondition:](v5, "addCondition:", v20);

                  goto LABEL_18;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v15)
                continue;
              break;
            }
          }
LABEL_18:

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    v4 = v22;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PLLibraryScopeRule query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithQuery:", v5);

  return v6;
}

- (id)allConditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryScopeRule dateRangeCondition](self, "dateRangeCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pl_addNonNilObject:", v4);

  -[PLLibraryScopeRule personCondition](self, "personCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pl_addNonNilObject:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (void)addCondition:(id)a3
{
  id *p_dateRangeCondition;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_dateRangeCondition = (id *)&self->_dateRangeCondition;
LABEL_5:
    objc_storeStrong(p_dateRangeCondition, a3);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_dateRangeCondition = (id *)&self->_personCondition;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[NSMutableArray addObject:](self->_unknownConditions, "addObject:", v6);
LABEL_6:

}

- (void)removeConditionOfType:(Class)a3
{
  void *dateRangeCondition;
  NSMutableArray *v6;

  if ((Class)objc_opt_class() == a3)
  {
    dateRangeCondition = self->_dateRangeCondition;
    self->_dateRangeCondition = 0;
LABEL_8:

    return;
  }
  if ((Class)objc_opt_class() == a3)
  {
    dateRangeCondition = self->_personCondition;
    self->_personCondition = 0;
    goto LABEL_8;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dateRangeCondition = self->_unknownConditions;
    self->_unknownConditions = v6;
    goto LABEL_8;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[PLLibraryScopeRule allConditions](self, "allConditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PLLibraryScopeRule;
  -[PLLibraryScopeRule description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ - Containing %lu conditions"), v5, objc_msgSend(v3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)query
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLLibraryScopeRule allConditions](self, "allConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pl_map:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSMutableArray _pl_map:](self->_unknownConditions, "_pl_map:", &__block_literal_global_29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      v12 = (void *)MEMORY[0x1E0D732A8];
      objc_msgSend(v3, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0D732A0]);
      objc_msgSend(v12, "orCombineFirstQuery:secondQuery:", v13, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v11 = v7;
    }
    else
    {
      v8 = 1;
      do
      {
        v9 = (void *)MEMORY[0x1E0D732A8];
        objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "orCombineFirstQuery:secondQuery:", v7, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v7 = v11;
      }
      while (objc_msgSend(v3, "count") > v8);
    }
  }

  return v11;
}

- (id)backingPredicateInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PLLibraryScopeRule query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLLibraryScopeRule query](self, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    +[PLQueryHandler predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "predicateForQuery:inLibrary:changeDetectionCriteria:", v6, v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PLLibraryScopeConditionDateRange)dateRangeCondition
{
  return self->_dateRangeCondition;
}

- (PLLibraryScopeConditionPerson)personCondition
{
  return self->_personCondition;
}

- (NSMutableArray)unknownConditions
{
  return self->_unknownConditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownConditions, 0);
  objc_storeStrong((id *)&self->_personCondition, 0);
  objc_storeStrong((id *)&self->_dateRangeCondition, 0);
}

uint64_t __27__PLLibraryScopeRule_query__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "query");
}

uint64_t __27__PLLibraryScopeRule_query__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "query");
}

+ (id)_knownConditionClasses
{
  if (_knownConditionClasses_onceToken != -1)
    dispatch_once(&_knownConditionClasses_onceToken, &__block_literal_global_33720);
  return (id)_knownConditionClasses_knownClasses;
}

+ (id)_dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:(id)a3 parentQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  if (objc_msgSend(v6, "hasFirst")
    && objc_msgSend(v6, "hasConjunction")
    && (!objc_msgSend(v6, "conjunction") || objc_msgSend(v6, "conjunction") == 2))
  {
    objc_msgSend(v6, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:parentQuery:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v10);

  }
  if (objc_msgSend(v6, "hasSecond")
    && objc_msgSend(v6, "hasConjunction")
    && (!objc_msgSend(v6, "conjunction") || objc_msgSend(v6, "conjunction") == 2))
  {
    objc_msgSend(v6, "second");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dictionaryOfArrayOfSingleQueriesToCriteriaFromRuleQuery:parentQuery:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v12);

  }
  objc_msgSend(v6, "singleQueries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = 1;
    if (objc_msgSend(v7, "hasConjunction"))
    {
      if (objc_msgSend(v7, "conjunction") == 2)
        v15 = 2;
      else
        v15 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "singleQueries");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v16, v17);

  }
  return v8;
}

+ (id)libraryScopeRulesForLibraryScopeRulesData:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "_rulesFromQuery:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Empty query returned from library scope rules data", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)queryForLibraryScopeRules:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v10 = v5;
  }
  else
  {
    v6 = 1;
    do
    {
      v7 = (void *)MEMORY[0x1E0D732A8];
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "query");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "andCombineFirstQuery:secondQuery:", v5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      ++v6;
      v5 = v10;
    }
    while (objc_msgSend(v3, "count") > v6);
  }

  return v10;
}

+ (id)dataForLibraryScopeRules:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "queryForLibraryScopeRules:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLQueryHandler dataFromQuery:](PLQueryHandler, "dataFromQuery:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_rulesFromQuery:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PLLibraryScopeRule *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "hasFirst")
    && objc_msgSend(v4, "hasConjunction")
    && objc_msgSend(v4, "conjunction") == 1)
  {
    objc_msgSend(v4, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_rulesFromQuery:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  if (objc_msgSend(v4, "hasSecond")
    && objc_msgSend(v4, "hasConjunction")
    && objc_msgSend(v4, "conjunction") == 1)
  {
    objc_msgSend(v4, "second");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_rulesFromQuery:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

  }
  if (objc_msgSend(v4, "hasConjunction") && !objc_msgSend(v4, "conjunction"))
  {
    v10 = -[PLLibraryScopeRule initWithQuery:]([PLLibraryScopeRule alloc], "initWithQuery:", v4);
    objc_msgSend(v5, "addObject:", v10);

  }
  return v5;
}

void __44__PLLibraryScopeRule__knownConditionClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_knownConditionClasses_knownClasses;
  _knownConditionClasses_knownClasses = v0;

}

@end
