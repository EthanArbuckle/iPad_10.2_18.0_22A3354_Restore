@implementation PLLibraryScopeConditionPerson

- (unsigned)type
{
  return 2;
}

- (id)conditionQuery
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732A8]), "initWithConjunction:", 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PLLibraryScopeConditionPerson personUUIDs](self, "personUUIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addPersonUUIDInMomentQuery:comparator:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), 22);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(&stru_1E36789C0, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_personUUIDs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PLLibraryScopeConditionPerson;
  -[PLLibraryScopeCondition description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@, Persons: %@"), v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)replaceTombstonePersonUUID:(id)a3 withPersonUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PLLibraryScopeConditionPerson personUUIDs](self, "personUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    if (objc_msgSend(v8, "containsObject:", v6))
      objc_msgSend(v10, "removeObjectAtIndex:", v9);
    else
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v6);
    -[PLLibraryScopeConditionPerson setPersonUUIDs:](self, "setPersonUUIDs:", v10);

  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)removePersonUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PLLibraryScopeConditionPerson personUUIDs](self, "personUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "removeObjectAtIndex:", v6);
    -[PLLibraryScopeConditionPerson setPersonUUIDs:](self, "setPersonUUIDs:", v7);

  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSArray)personUUIDs
{
  return self->_personUUIDs;
}

- (void)setPersonUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUIDs, 0);
}

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCriteria:", v4);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "stringValue", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v9, "addObject:", v15);
          objc_msgSend(v8, "addObject:", v15);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "setPersonUUIDs:", v8);
  return v7;
}

+ (BOOL)supportsQueryKey:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 552;
}

@end
