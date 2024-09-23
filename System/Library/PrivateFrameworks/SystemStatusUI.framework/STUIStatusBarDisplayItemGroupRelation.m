@implementation STUIStatusBarDisplayItemGroupRelation

- (void)setRelations:(id)a3
{
  objc_storeStrong((id *)&self->_relations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
}

- (BOOL)isFulfilled
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  v3 = self->_relations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFulfilled", (_QWORD)v11) && !self->_requiresAll)
        {
          v9 = 1;
LABEL_15:

          return v9;
        }
        if ((objc_msgSend(v8, "isFulfilled") & 1) == 0 && self->_requiresAll)
        {
          v9 = 0;
          goto LABEL_15;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  return self->_requiresAll;
}

- (id)itemStates
{
  void *v3;
  NSArray *v4;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_relations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "itemStates", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)type
{
  if (self->_requiresAll)
    return CFSTR("all");
  else
    return CFSTR("any");
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarDisplayItemGroupRelation;
  -[STUIStatusBarDisplayItemRelation _descriptionBuilderWithMultilinePrefix:forDebug:](&v8, sel__descriptionBuilderWithMultilinePrefix_forDebug_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarDisplayItemGroupRelation relations](self, "relations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("relations"), 1);

  return v5;
}

- (NSArray)relations
{
  return self->_relations;
}

- (BOOL)requiresAll
{
  return self->_requiresAll;
}

- (void)setRequiresAll:(BOOL)a3
{
  self->_requiresAll = a3;
}

@end
