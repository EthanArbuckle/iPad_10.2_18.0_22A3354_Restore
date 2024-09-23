@implementation STUIStatusBarDisplayItemPlacementState

- (BOOL)canBeEnabled
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  v4 = objc_msgSend(WeakRetained, "isEnabled");

  return v4 && -[STUIStatusBarDisplayItemPlacement isEnabled](self->_placement, "isEnabled");
}

- (STUIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (BOOL)isEnabled
{
  _BOOL4 v3;

  v3 = -[STUIStatusBarDisplayItemPlacementState canBeEnabled](self, "canBeEnabled");
  if (v3)
    LOBYTE(v3) = -[STUIStatusBarDisplayItemPlacementState areRelationsFulfilled](self, "areRelationsFulfilled");
  return v3;
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

- (NSMutableArray)relations
{
  return self->_relations;
}

- (STUIStatusBarRegion)region
{
  return (STUIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_region);
}

- (int64_t)priority
{
  return -[STUIStatusBarDisplayItemPlacement priority](self->_placement, "priority");
}

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
  objc_destroyWeak((id *)&self->_region);
  objc_storeStrong((id *)&self->_placement, 0);
}

- (id)description
{
  return -[STUIStatusBarDisplayItemPlacementState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)debugDescription
{
  return -[STUIStatusBarDisplayItemPlacementState debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarDisplayItemPlacementState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  objc_msgSend(WeakRetained, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("region"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemPlacementState isEnabled](self, "isEnabled"), CFSTR("enabled"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemPlacementState areRelationsFulfilled](self, "areRelationsFulfilled"), CFSTR("relationsFulfilled"));
  -[STUIStatusBarDisplayItemPlacementState relations](self, "relations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v8, "count"), CFSTR("relations.count"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemPlacementState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItemPlacementState _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarDisplayItemPlacementState _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;

  v4 = a4;
  -[STUIStatusBarDisplayItemPlacementState succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseDebugDescription:", v4);
  return v5;
}

- (void)setRelations:(id)a3
{
  objc_storeStrong((id *)&self->_relations, a3);
}

@end
