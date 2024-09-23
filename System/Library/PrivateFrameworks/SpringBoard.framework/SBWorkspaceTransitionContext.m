@implementation SBWorkspaceTransitionContext

- (id)entityForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", a3);
}

- (id)previousEntityForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_previousEntities, "objectForKey:", a3);
}

- (void)setPreviousEntity:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransitionContext.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  v10 = (id)objc_msgSend(v7, "copy");

  if (v10)
  {
    objc_msgSend(v10, "clearActivationSettings");
    -[NSMutableDictionary setObject:forKey:](self->_previousEntities, "setObject:forKey:", v10, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_previousEntities, "removeObjectForKey:", v8);
  }

}

- (SBWorkspaceTransitionContext)init
{
  SBWorkspaceTransitionContext *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *entities;
  NSMutableDictionary *v5;
  NSMutableDictionary *previousEntities;
  NSMutableArray *v7;
  NSMutableArray *finalizeBlocks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBWorkspaceTransitionContext;
  v2 = -[SBWorkspaceTransitionContext init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    entities = v2->_entities;
    v2->_entities = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    previousEntities = v2->_previousEntities;
    v2->_previousEntities = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    finalizeBlocks = v2->_finalizeBlocks;
    v2->_finalizeBlocks = v7;

  }
  return v2;
}

- (void)setRequest:(id)a3
{
  objc_storeWeak((id *)&self->_request, a3);
}

- (SBWorkspaceTransitionRequest)request
{
  return (SBWorkspaceTransitionRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (BOOL)animationDisabled
{
  return self->_animationDisabled;
}

- (void)setEntity:(id)a3 forKey:(id)a4
{
  id v7;
  NSMutableDictionary *entities;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransitionContext.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  entities = self->_entities;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](entities, "setObject:forKey:", v10, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](entities, "removeObjectForKey:", v7);

}

- (void)setAnimationDisabled:(BOOL)a3
{
  self->_animationDisabled = a3;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)finalize
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_finalized)
  {
    self->_finalized = 1;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_finalizeBlocks;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    -[NSMutableArray removeAllObjects](self->_finalizeBlocks, "removeAllObjects", (_QWORD)v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizeBlocks, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_previousEntities, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_destroyWeak((id *)&self->_request);
}

- (NSSet)previousEntities
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_previousEntities, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)entities
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_entities, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWorkspaceTransitionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBWorkspaceTransitionContext *v11;

  v4 = a3;
  -[SBWorkspaceTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBWorkspaceTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __77__SBWorkspaceTransitionContext_compactDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "succinctDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSMutableDictionary *entities;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  entities = self->_entities;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SBWorkspaceTransitionContext_compactDescriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8EAC530;
  v9[4] = self;
  objc_msgSend(v6, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", entities, CFSTR("entities"), v5, 1, v9);

  return v6;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_animationDisabled, CFSTR("animationDisabled"));
  return v3;
}

- (void)addFinalizeBlock:(id)a3
{
  NSMutableArray *finalizeBlocks;
  id v4;

  if (a3)
  {
    finalizeBlocks = self->_finalizeBlocks;
    v4 = (id)MEMORY[0x1D17E5550](a3, a2);
    -[NSMutableArray addObject:](finalizeBlocks, "addObject:", v4);

  }
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

uint64_t __70__SBWorkspaceTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("animationSettings"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("entities"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("previousEntities"), 1);
}

+ (id)context
{
  return objc_alloc_init((Class)a1);
}

- (NSString)description
{
  return (NSString *)-[SBWorkspaceTransitionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)entityForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_entities, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)previousEntityForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_previousEntities, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
