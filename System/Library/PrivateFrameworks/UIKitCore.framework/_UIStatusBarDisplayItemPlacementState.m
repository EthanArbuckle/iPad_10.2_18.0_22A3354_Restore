@implementation _UIStatusBarDisplayItemPlacementState

+ (id)stateForDisplayItemPlacement:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v9;

  v11 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v6;

  objc_storeWeak((id *)v8 + 2, v7);
  return v8;
}

- (int64_t)priority
{
  return -[_UIStatusBarDisplayItemPlacement priority](self->_placement, "priority");
}

- (BOOL)areRelationsFulfilled
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_relations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isFulfilled", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)canBeEnabled
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  v4 = objc_msgSend(WeakRetained, "isEnabled");

  return v4 && -[_UIStatusBarDisplayItemPlacement isEnabled](self->_placement, "isEnabled");
}

- (BOOL)isEnabled
{
  _BOOL4 v3;

  v3 = -[_UIStatusBarDisplayItemPlacementState canBeEnabled](self, "canBeEnabled");
  if (v3)
    LOBYTE(v3) = -[_UIStatusBarDisplayItemPlacementState areRelationsFulfilled](self, "areRelationsFulfilled");
  return v3;
}

- (id)description
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("region");
  WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  objc_msgSend(WeakRetained, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UIStatusBarDisplayItemPlacementState isEnabled](self, "isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = CFSTR("relationsFulfilled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_UIStatusBarDisplayItemPlacementState areRelationsFulfilled](self, "areRelationsFulfilled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = CFSTR("relations");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIStatusBarDisplayItemPlacementState relations](self, "relations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:namesAndObjects:](UIDescriptionBuilder, "descriptionForObject:namesAndObjects:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_UIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (_UIStatusBarRegion)region
{
  return (_UIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_region);
}

- (NSMutableArray)relations
{
  return self->_relations;
}

- (void)setRelations:(id)a3
{
  objc_storeStrong((id *)&self->_relations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
  objc_destroyWeak((id *)&self->_region);
  objc_storeStrong((id *)&self->_placement, 0);
}

@end
