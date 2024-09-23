@implementation SBChainableModifier

- (void)enumerateChildModifiersWithBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, char *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  SBChainableModifier *v8;
  void *v9;
  char v10;

  v4 = (void (**)(id, void *, uint64_t, char *))a3;
  -[SBChainableModifier nextQueryModifier](self, "nextQueryModifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    do
    {
      objc_msgSend(v6, "parentModifier");
      v8 = (SBChainableModifier *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        v4[2](v4, v6, v7++, &v10);
      objc_msgSend(v6, "nextQueryModifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        break;
      v6 = v9;
    }
    while (!v10);

  }
}

- (SBChainableModifier)nextQueryModifier
{
  return self->_nextQueryModifier;
}

- (SBChainableModifier)parentModifier
{
  return self->_parentModifier;
}

void __65__SBChainableModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (objc_msgSend(a2, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBChainableModifier.m"), 395, CFSTR("Should not have any completed modifiers"));

  }
}

void __35__SBChainableModifier_handleEvent___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (int64_t)state
{
  return self->_state;
}

void __35__SBChainableModifier_handleEvent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_forwardEvent:toChildModifier:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = v4;
  }

}

- (id)_forwardEvent:(id)a3 toChildModifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "handleEvent:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](self, "responseForProposedChildResponse:childModifier:event:", v8, v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __35__SBChainableModifier_handleEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __83__SBChainableModifier__addChildModifier_atLevel_key_queryResponse_contextResponse___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isEqualToString:", a1[4]))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[9], a1[6], a1[4], a1[5], v10);

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v6 = a1[10];
    v7 = objc_msgSend(v10, "modifierLevel");
    v8 = *(_QWORD *)(a1[7] + 8);
    if (v6 <= v7)
    {
      *(_BYTE *)(v8 + 24) = 1;
    }
    else if (!*(_BYTE *)(v8 + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a2);
    }
  }

}

void __42__SBChainableModifier_childModifierByKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)didMoveToParentModifier:(id)a3
{
  if (a3)
    -[SBChainableModifier _notifyChildrenDidMoveToParentIfNeeded](self, "_notifyChildrenDidMoveToParentIfNeeded");
}

- (int64_t)modifierLevel
{
  return self->_modifierLevel;
}

void __45__SBChainableModifier__lastDeepChildModifier__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __63__SBChainableModifier__anyDescendentImplementsAnyContextMethod__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "_anyDescendentImplementsAnyContextMethod");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)_addChildModifier:(id)a3 atLevel:(int64_t)a4 key:(id)a5 queryResponse:(unint64_t)a6 contextResponse:(unint64_t)a7
{
  id v13;
  id v14;
  SBChainableModifier *v15;
  id v16;
  id v17;
  SBChainableModifier *v18;
  SBChainableModifier *v19;
  SBChainableModifier *v20;
  id WeakRetained;
  _QWORD v22[4];
  id v23;
  SBChainableModifier *v24;
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  SEL v28;
  int64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  SBChainableModifier *v35;
  _QWORD v36[3];
  char v37;

  v13 = a3;
  v14 = a5;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__105;
  v34 = __Block_byref_object_dispose__105;
  v15 = self;
  v35 = v15;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__SBChainableModifier__addChildModifier_atLevel_key_queryResponse_contextResponse___block_invoke;
  v22[3] = &unk_1E8EBD058;
  v16 = v14;
  v28 = a2;
  v23 = v16;
  v24 = v15;
  v17 = v13;
  v25 = v17;
  v26 = v36;
  v29 = a4;
  v27 = &v30;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](v15, "enumerateChildModifiersWithBlock:", v22);
  objc_msgSend(v17, "setKey:", v16);
  objc_msgSend(v17, "setParentModifier:", v15);
  objc_msgSend(v17, "setModifierLevel:", a4);
  v18 = (SBChainableModifier *)v31[5];
  if (v18 == v15)
  {
    v19 = v15;
  }
  else
  {
    -[SBChainableModifier _lastDeepChildModifier](v18, "_lastDeepChildModifier");
    v19 = (SBChainableModifier *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  -[SBChainableModifier _insertModifier:afterModifier:queryResponse:contextResponse:](v15, "_insertModifier:afterModifier:queryResponse:contextResponse:", v17, v19, a6, a7);
  if (v15->_parentModifier
    || (WeakRetained = objc_loadWeakRetained((id *)&v15->_delegate), WeakRetained, WeakRetained))
  {
    objc_msgSend(v17, "didMoveToParentModifier:", v15);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(v36, 8);

}

- (void)setParentModifier:(id)a3
{
  self->_parentModifier = (SBChainableModifier *)a3;
}

- (void)setModifierLevel:(int64_t)a3
{
  self->_modifierLevel = a3;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)_notifyChildrenDidMoveToParentIfNeeded
{
  uint64_t v2;
  _QWORD v3[5];

  if (!self->_hasNotifiedChildrenDidMoveToParent)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_hasNotifiedChildrenDidMoveToParent = 1;
    v3[0] = v2;
    v3[1] = 3221225472;
    v3[2] = __61__SBChainableModifier__notifyChildrenDidMoveToParentIfNeeded__block_invoke;
    v3[3] = &unk_1E8EBCF90;
    v3[4] = self;
    -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v3);
  }
}

uint64_t __30__SBChainableModifier_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setParentModifier:", 0);
}

uint64_t __61__SBChainableModifier__notifyChildrenDidMoveToParentIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didMoveToParentModifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__SBChainableModifier_setContextCacheCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContextCacheCoordinator:", *(_QWORD *)(a1 + 32));
}

uint64_t __48__SBChainableModifier_setQueryCacheCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setQueryCacheCoordinator:", *(_QWORD *)(a1 + 32));
}

- (void)_removeChildModifier:(id)a3 queryResponse:(unint64_t)a4 contextResponse:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBChainableModifier *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "setState:", 1);
  objc_msgSend(v14, "_lastDeepChildModifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previousContextModifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextQueryModifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNextQueryModifier:", v10);
  objc_msgSend(v10, "setPreviousContextModifier:", v9);
  objc_msgSend(v14, "setPreviousContextModifier:", 0);
  objc_msgSend(v8, "setNextQueryModifier:", 0);
  -[SBChainableModifier queryCacheCoordinator](self, "queryCacheCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performResponse:", a4);

  -[SBChainableModifier contextCacheCoordinator](self, "contextCacheCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performResponse:", a5);

  objc_msgSend(v14, "parentModifier");
  v13 = (SBChainableModifier *)objc_claimAutoreleasedReturnValue();

  if (v13 == self)
  {
    objc_msgSend(v14, "setParentModifier:", 0);
    objc_msgSend(v14, "didMoveToParentModifier:", 0);
  }

}

- (void)_insertModifier:(id)a3 afterModifier:(id)a4 queryResponse:(unint64_t)a5 contextResponse:(unint64_t)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v11 = a4;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBChainableModifier.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifierToInsert"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBChainableModifier.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("afterModifier"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  -[SBChainableModifier queryCacheCoordinator](self, "queryCacheCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setQueryCacheCoordinator:", v12);

  -[SBChainableModifier contextCacheCoordinator](self, "contextCacheCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContextCacheCoordinator:", v13);

  objc_msgSend(v11, "nextQueryModifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_lastDeepChildModifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNextQueryModifier:", v20);
  objc_msgSend(v20, "setPreviousContextModifier:", v11);
  objc_msgSend(v15, "setNextQueryModifier:", v14);
  objc_msgSend(v14, "setPreviousContextModifier:", v15);
  -[SBChainableModifier queryCacheCoordinator](self, "queryCacheCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performResponse:", a5);

  -[SBChainableModifier contextCacheCoordinator](self, "contextCacheCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performResponse:", a6);

}

- (void)setNextQueryModifier:(id)a3
{
  objc_storeStrong((id *)&self->_nextQueryModifier, a3);
}

- (void)setPreviousContextModifier:(id)a3
{
  self->_previousContextModifier = (SBChainableModifier *)a3;
}

- (SBModifierCacheCoordinator)queryCacheCoordinator
{
  return -[SBChainableModifierMethodCache cacheCoordinator](self->_queryCache, "cacheCoordinator");
}

- (SBModifierCacheCoordinator)contextCacheCoordinator
{
  return -[SBChainableModifierMethodCache cacheCoordinator](self->_contextCache, "cacheCoordinator");
}

- (id)_lastDeepChildModifier
{
  SBChainableModifier *v2;
  SBChainableModifier *v3;
  SBChainableModifier *v4;
  SBChainableModifier *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  SBChainableModifier *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__105;
  v12 = __Block_byref_object_dispose__105;
  v2 = self;
  v13 = v2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SBChainableModifier__lastDeepChildModifier__block_invoke;
  v7[3] = &unk_1E8EBD008;
  v7[4] = &v8;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](v2, "enumerateChildModifiersWithBlock:", v7);
  v3 = (SBChainableModifier *)v9[5];
  if (v3 == v2)
  {
    v4 = v2;
  }
  else
  {
    -[SBChainableModifier _lastDeepChildModifier](v3, "_lastDeepChildModifier");
    v4 = (SBChainableModifier *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)setContextCacheCoordinator:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  -[SBChainableModifierMethodCache cacheCoordinator](self->_contextCache, "cacheCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[SBChainableModifierMethodCache setCacheCoordinator:](self->_contextCache, "setCacheCoordinator:", v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__SBChainableModifier_setContextCacheCoordinator___block_invoke;
    v6[3] = &unk_1E8EBCF90;
    v7 = v5;
    -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v6);

  }
}

- (void)setQueryCacheCoordinator:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  -[SBChainableModifierMethodCache cacheCoordinator](self->_queryCache, "cacheCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[SBChainableModifierMethodCache setCacheCoordinator:](self->_queryCache, "setCacheCoordinator:", v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SBChainableModifier_setQueryCacheCoordinator___block_invoke;
    v6[3] = &unk_1E8EBCF90;
    v7 = v5;
    -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v6);

  }
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SBChainableModifier)previousContextModifier
{
  return self->_previousContextModifier;
}

uint64_t __61__SBChainableModifier__anyDescendentImplementsAnyQueryMethod__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "_anyDescendentImplementsAnyQueryMethod");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (SBChainableModifier)init
{
  void *v4;
  SBChainableModifier *v5;
  uint64_t v6;
  SBChainableModifierMethodCache *queryCache;
  uint64_t v8;
  SBChainableModifierMethodCache *contextCache;
  void *v11;
  objc_super v12;

  v4 = (void *)objc_opt_class();
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBChainableModifier.m"), 50, CFSTR("SBChainableModifier is abstract. Make a subclass and define the query and context protocols."));

  }
  v12.receiver = self;
  v12.super_class = (Class)SBChainableModifier;
  v5 = -[SBChainableModifier init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "newQueryCache");
    queryCache = v5->_queryCache;
    v5->_queryCache = (SBChainableModifierMethodCache *)v6;

    -[SBChainableModifierMethodCache setModifier:](v5->_queryCache, "setModifier:", v5);
    v8 = objc_msgSend((id)objc_opt_class(), "newContextCache");
    contextCache = v5->_contextCache;
    v5->_contextCache = (SBChainableModifierMethodCache *)v8;

    -[SBChainableModifierMethodCache setModifier:](v5->_contextCache, "setModifier:", v5);
    v5->_state = 0;
  }
  return v5;
}

+ (id)newQueryCache
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "querySelectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(a1, "newCacheWithSelectorList:subsequentMethodCacheFunc:cachingDictionary:", v3, NextQueryMethodCacheForMethodCache, staticPrototypeQueryCacheForClass);

  return v4;
}

+ (id)newContextCache
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "contextSelectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(a1, "newCacheWithSelectorList:subsequentMethodCacheFunc:cachingDictionary:", v3, PreviousContextMethodCacheForMethodCache, staticPrototypeContextCacheForClass);

  return v4;
}

+ (id)newCacheWithSelectorList:(id)a3 subsequentMethodCacheFunc:(void *)a4 cachingDictionary:(id)a5
{
  size_t *v8;
  id v9;
  SBChainableModifierMethodCache *v10;
  void *v11;
  _QWORD *v12;
  int64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  char v20;

  v8 = (size_t *)a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", a1);
  v10 = (SBChainableModifierMethodCache *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend((id)objc_opt_class(), "baseClassForQueryProtocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = malloc_type_calloc(v8[1], 8uLL, 0x80040B8603338uLL);
    if ((uint64_t)v8[1] >= 1)
    {
      v19 = a4;
      v13 = 0;
      v14 = 1;
LABEL_4:
      v20 = v14;
      do
      {
        v15 = *(_QWORD *)(v8[2] + 8 * v13);
        v16 = objc_msgSend(a1, "instanceMethodForSelector:", v15, v19);
        if (v16 != objc_msgSend(v11, "instanceMethodForSelector:", v15))
        {
          v14 = 0;
          v12[v13++] = v16;
          if (v13 < (uint64_t)v8[1])
            goto LABEL_4;
          a4 = v19;
          goto LABEL_12;
        }
        ++v13;
      }
      while (v13 < (uint64_t)v8[1]);
      a4 = v19;
      if ((v20 & 1) == 0)
        goto LABEL_12;
    }
    free(v12);
    v12 = 0;
LABEL_12:
    v10 = -[SBChainableModifierMethodCache initWithIMPs:selectorList:subsequentMethodCacheFunc:]([SBChainableModifierMethodCache alloc], "initWithIMPs:selectorList:subsequentMethodCacheFunc:", v12, v8, a4);
    objc_msgSend(v9, "setObject:forKey:", v10, a1);

  }
  v17 = (void *)-[SBChainableModifierMethodCache copy](v10, "copy");

  return v17;
}

+ (id)contextSelectors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)staticContextSelectorsForBaseClass;
  objc_msgSend(a1, "baseClassForQueryProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)querySelectors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)staticQuerySelectorsForBaseClass;
  objc_msgSend(a1, "baseClassForQueryProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)baseClassForQueryProtocol
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a1;
  if ((id)objc_opt_class() == v2)
  {
    v5 = 0;
  }
  else
  {
    while (1)
    {
      v3 = objc_msgSend(v2, "methodForSelector:", sel_queryProtocol);
      if (v3 != objc_msgSend((id)objc_msgSend(v2, "superclass"), "methodForSelector:", sel_queryProtocol))
        break;
      objc_msgSend(v2, "superclass");
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v4;
      if (v4 == objc_opt_class())
      {
        v5 = 0;
        v2 = (id)v4;
        goto LABEL_7;
      }
    }
    v2 = v2;
    v5 = v2;
  }
LABEL_7:

  return v5;
}

- (SBChainableModifierDelegate)delegate
{
  return (SBChainableModifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)handleEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  void *v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  SBChainableModifier *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[7];
  _QWORD v60[3];
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__105;
  v66 = __Block_byref_object_dispose__105;
  v67 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v61 = 0;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __35__SBChainableModifier_handleEvent___block_invoke;
  v59[3] = &unk_1E8EBCF68;
  v59[5] = &v62;
  v59[6] = v60;
  v59[4] = self;
  v5 = (void *)MEMORY[0x1D17E5550](v59);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __35__SBChainableModifier_handleEvent___block_invoke_2;
  v57[3] = &unk_1E8EBCF90;
  v7 = v6;
  v58 = v7;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v57);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __35__SBChainableModifier_handleEvent___block_invoke_3;
  v54[3] = &unk_1E8EBCFB8;
  v54[4] = self;
  v33 = v4;
  v55 = v33;
  v31 = v5;
  v56 = v31;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v54);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __35__SBChainableModifier_handleEvent___block_invoke_4;
  v52[3] = &unk_1E8EBCF90;
  v9 = v8;
  v53 = v9;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v52);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v73, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[SBChainableModifier loggingCategory](self, "loggingCategory");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "succinctDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v70 = v16;
          v71 = 2112;
          v72 = v17;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "[%@] Removing child modifier %@ because its state is Completed.", buf, 0x16u);

        }
        -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v13);
        objc_msgSend(v7, "removeObject:", v13);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v73, 16);
    }
    while (v10);
  }

  -[SBChainableModifier _handleEvent:](self, "_handleEvent:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    (*((void (**)(id, void *, _QWORD))v31 + 2))(v31, v35, 0);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __35__SBChainableModifier_handleEvent___block_invoke_14;
  v43[3] = &unk_1E8EBCFE0;
  v30 = v7;
  v44 = v30;
  v45 = self;
  v34 = v33;
  v46 = v34;
  v32 = v31;
  v47 = v32;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v43);
  objc_msgSend(obj, "removeAllObjects");
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __35__SBChainableModifier_handleEvent___block_invoke_2_15;
  v41[3] = &unk_1E8EBCF90;
  v18 = obj;
  v42 = v18;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v41);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v68, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        -[SBChainableModifier loggingCategory](self, "loggingCategory");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "succinctDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v70 = v26;
          v71 = 2112;
          v72 = v27;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_INFO, "[%@] Removing child modifier %@ because its state is Completed.", buf, 0x16u);

        }
        -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", v23);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v68, 16);
    }
    while (v20);
  }

  if (-[SBChainableModifier completesWhenChildrenComplete](self, "completesWhenChildrenComplete")
    && !-[SBChainableModifier childModifierCount](self, "childModifierCount"))
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  if (-[SBChainableModifier runsInternalVerificationAfterEventDispatch](self, "runsInternalVerificationAfterEventDispatch"))
  {
    -[SBChainableModifier verifyInternalIntegrityAfterHandlingEvent:](self, "verifyInternalIntegrityAfterHandlingEvent:", v34);
  }
  v28 = (id)v63[5];

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v62, 8);

  return v28;
}

- (BOOL)completesWhenChildrenComplete
{
  return 0;
}

- (id)_handleEvent:(id)a3
{
  return 0;
}

- (void)verifyInternalIntegrityAfterHandlingEvent:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__SBChainableModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke;
  v3[3] = &unk_1E8EBD080;
  v3[4] = self;
  v3[5] = a2;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_nextQueryModifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextCache, 0);
  objc_storeStrong((id *)&self->_queryCache, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", &__block_literal_global_346);
  -[SBChainableModifier nextQueryModifier](self, "nextQueryModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviousContextModifier:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SBChainableModifier;
  -[SBChainableModifier dealloc](&v4, sel_dealloc);
}

- (id)childModifierByKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__105;
  v15 = __Block_byref_object_dispose__105;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SBChainableModifier_childModifierByKey___block_invoke;
  v8[3] = &unk_1E8EBD030;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)removeChildModifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "_anyDescendentImplementsAnyQueryMethod"))
    v4 = 0;
  else
    v4 = 3;
  if (objc_msgSend(v6, "_anyDescendentImplementsAnyContextMethod"))
    v5 = 0;
  else
    v5 = 3;
  -[SBChainableModifier _removeChildModifier:queryResponse:contextResponse:](self, "_removeChildModifier:queryResponse:contextResponse:", v6, v4, v5);

}

- (void)performTransactionWithTemporaryChildModifier:(id)a3 usingBlock:(id)a4
{
  void (**v6)(_QWORD);
  int v7;
  int v8;
  SBChainableModifier *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = objc_msgSend(v16, "_anyDescendentImplementsAnyQueryMethod");
  v8 = objc_msgSend(v16, "_anyDescendentImplementsAnyContextMethod");
  objc_msgSend(v16, "parentModifier");
  v9 = (SBChainableModifier *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
  {
    v6[2](v6);
  }
  else
  {
    v10 = v8 == 0;
    if (v8)
      v11 = 2;
    else
      v11 = 3;
    if (v10)
      v12 = 3;
    else
      v12 = 1;
    v13 = v7 == 0;
    if (v7)
      v14 = 2;
    else
      v14 = 3;
    if (v13)
      v15 = 3;
    else
      v15 = 1;
    -[SBChainableModifier _addChildModifier:atLevel:key:queryResponse:contextResponse:](self, "_addChildModifier:atLevel:key:queryResponse:contextResponse:", v16, 0, 0, v15, v12);
    v6[2](v6);
    -[SBChainableModifier _removeChildModifier:queryResponse:contextResponse:](self, "_removeChildModifier:queryResponse:contextResponse:", v16, v14, v11);
  }

}

- (void)addChildModifier:(id)a3 atLevel:(int64_t)a4 key:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v8 = a5;
  v11 = a3;
  if (objc_msgSend(v11, "_anyDescendentImplementsAnyQueryMethod"))
    v9 = 0;
  else
    v9 = 3;
  if (objc_msgSend(v11, "_anyDescendentImplementsAnyContextMethod"))
    v10 = 0;
  else
    v10 = 3;
  -[SBChainableModifier _addChildModifier:atLevel:key:queryResponse:contextResponse:](self, "_addChildModifier:atLevel:key:queryResponse:contextResponse:", v11, a4, v8, v9, v10);

}

- (BOOL)_anyDescendentImplementsAnyQueryMethod
{
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  BOOL v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = -[SBChainableModifierMethodCache hasNonTrampolineIMPs](self->_queryCache, "hasNonTrampolineIMPs");
  if (*((_BYTE *)v7 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__SBChainableModifier__anyDescendentImplementsAnyQueryMethod__block_invoke;
    v5[3] = &unk_1E8EBD008;
    v5[4] = &v6;
    -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_anyDescendentImplementsAnyContextMethod
{
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  BOOL v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = -[SBChainableModifierMethodCache hasNonTrampolineIMPs](self->_contextCache, "hasNonTrampolineIMPs");
  if (*((_BYTE *)v7 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__SBChainableModifier__anyDescendentImplementsAnyContextMethod__block_invoke;
    v5[3] = &unk_1E8EBD008;
    v5[4] = &v6;
    -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)containsChildModifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SBChainableModifier_containsChildModifier___block_invoke;
  v7[3] = &unk_1E8EBD030;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)addChildModifier:(id)a3
{
  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", a3, 0, 0);
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  return a3;
}

void __35__SBChainableModifier_handleEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v14 = v6;
  if (v9)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v10 = (void *)objc_msgSend((id)objc_opt_class(), "newEventResponse");
      objc_msgSend(v10, "addChildResponse:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v13, "addChildResponse:", v14);
    else
      objc_msgSend(v13, "insertChildResponse:atIndex:", v14, a3);
  }
  else
  {
    objc_storeStrong(v8, a2);
  }

}

- (void)provideNextQueryImplementation:(id)a3 forSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v7, "queryProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_msgSend(v7, "makeDynamicSubclassWithDescriptor:implementation:forSelector:ofProtocol:", CFSTR("NextQuery"), v6, a4, v8);

  v10 = objc_alloc_init(v9);
  -[SBChainableModifier _insertModifier:afterModifier:queryResponse:contextResponse:](self, "_insertModifier:afterModifier:queryResponse:contextResponse:", v10, self, 0, 0);

}

- (void)providePreviousContextImplementation:(id)a3 forSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v7, "contextProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_msgSend(v7, "makeDynamicSubclassWithDescriptor:implementation:forSelector:ofProtocol:", CFSTR("PreviousContext"), v6, a4, v8);

  v11 = objc_alloc_init(v9);
  -[SBChainableModifier previousContextModifier](self, "previousContextModifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifier _insertModifier:afterModifier:queryResponse:contextResponse:](self, "_insertModifier:afterModifier:queryResponse:contextResponse:", v11, v10, 0, 0);

}

+ (Class)makeDynamicSubclassWithDescriptor:(id)a3 implementation:(id)a4 forSelector:(SEL)a5 ofProtocol:(id)a6
{
  Protocol *v11;
  id v12;
  id v13;
  objc_method_description MethodDescription;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_class *ClassPair;
  void (*v24)(void);
  objc_class *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SEL v32;
  Protocol *v33;

  v11 = (Protocol *)a6;
  v12 = a4;
  v13 = a3;
  MethodDescription = protocol_getMethodDescription(v11, a5, 1, 1);
  if (!MethodDescription.name)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol(v11);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBChainableModifier+RuntimeProviding.m"), 37, CFSTR("%@ does not exist in %@"), v28, v29);

  }
  v32 = a2;
  v33 = v11;
  v15 = (objc_class *)(id)objc_msgSend(a1, "baseClassForQueryProtocol");
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@-%@"), v18, v13, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_retainAutorelease(v21);
  ClassPair = objc_allocateClassPair(v15, (const char *)objc_msgSend(v22, "UTF8String"), 0);
  objc_registerClassPair(ClassPair);
  v24 = imp_implementationWithBlock(v12);
  LOBYTE(v20) = class_addMethod(ClassPair, a5, v24, MethodDescription.types);

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v32, a1, CFSTR("SBChainableModifier+RuntimeProviding.m"), 47, CFSTR("Implementation for %@ already exists in subclass %@"), v31, ClassPair);

  }
  v25 = ClassPair;

  return v25;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (obj)
    {
      -[SBChainableModifier _notifyChildrenDidMoveToParentIfNeeded](self, "_notifyChildrenDidMoveToParentIfNeeded");
      v5 = obj;
    }
  }

}

void __35__SBChainableModifier_handleEvent___block_invoke_14(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_forwardEvent:toChildModifier:", *(_QWORD *)(a1 + 48), v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    v4 = v6;
  }

}

void __35__SBChainableModifier_handleEvent___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (unint64_t)childModifierCount
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SBChainableModifier_childModifierCount__block_invoke;
  v4[3] = &unk_1E8EBD008;
  v4[4] = &v5;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__SBChainableModifier_childModifierCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __45__SBChainableModifier_containsChildModifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)debugPotentialChildModifiers
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBChainableModifier_debugPotentialChildModifiers__block_invoke;
  v6[3] = &unk_1E8EBCF90;
  v4 = v3;
  v7 = v4;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v6);

  return v4;
}

uint64_t __51__SBChainableModifier_debugPotentialChildModifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (void)verifyModifierImplements:(BOOL)a3 methodsOfProtocol:(id)a4
{
  _BOOL4 v4;
  Protocol *v5;
  char v6;
  objc_method_description *v7;
  objc_class *v8;
  Method *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  const char *name;
  uint64_t v14;
  objc_method_description *Description;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  unsigned int outCount[2];

  v4 = a3;
  v5 = (Protocol *)a4;
  *(_QWORD *)outCount = 0;
  v6 = 1;
  v7 = protocol_copyMethodDescriptionList(v5, 1, 1, &outCount[1]);
  v8 = (objc_class *)objc_opt_class();
  v9 = class_copyMethodList(v8, outCount);
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (!outCount[1])
  {
    v19 = 0;
    goto LABEL_17;
  }
  v11 = 0;
  v12 = 0;
  do
  {
    name = v7[v11].name;
    if (!outCount[0])
    {
LABEL_7:
      if (!v4)
        goto LABEL_9;
LABEL_8:
      ++v12;
      NSStringFromSelector(name);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR("%@, "), v16);

      goto LABEL_9;
    }
    v14 = 0;
    while (1)
    {
      Description = method_getDescription(v9[v14]);
      if (sel_isEqual(Description->name, name))
        break;
      if (++v14 >= (unint64_t)outCount[0])
        goto LABEL_7;
    }
    if (!v4)
      goto LABEL_8;
LABEL_9:
    ++v11;
  }
  while (v11 < outCount[1]);
  if (v12)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "substringWithRange:", 0, objc_msgSend(v10, "length") - 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Invalid %ld method(s): %@"), v12, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }
  else
  {
    v19 = 0;
    v6 = 1;
  }
LABEL_17:
  free(v7);
  free(v9);
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[SBChainableModifier verifyModifierImplements:methodsOfProtocol:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v24 = CFSTR("should implement all the methods");
    else
      v24 = CFSTR("shouldn't implement any of the methods");
    NSStringFromProtocol(v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SBChainableModifier.m"), 364, CFSTR("You declared %@ %@ in the %@ protocol. %@"), v23, v24, v25, v19);

  }
}

+ (id)contextProtocol
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("*** +[SBChainableModier %@]: method only defined for abstract class.  Define +[%@ %@]!"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (id)queryProtocol
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("*** +[SBChainableModier %@]: method only defined for abstract class.  Define +[%@ %@]!"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (BOOL)runsInternalVerificationAfterEventDispatch
{
  return 0;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBChainableModifierEventResponse);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (NSString)description
{
  return (NSString *)-[SBChainableModifier descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  const __CFString *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBChainableModifier *v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_key, CFSTR("key"));
  if (self->_state)
    v7 = CFSTR("Complete");
  else
    v7 = CFSTR("Active");
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("state"));
  if (-[SBChainableModifier childModifierCount](self, "childModifierCount"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke;
    v10[3] = &unk_1E8E9E270;
    v11 = v4;
    v12 = self;
    v13 = v5;
    objc_msgSend(v13, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("children"), v11, v10);

  }
  return v5;
}

void __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  _QWORD v6[4];
  id v7;
  __CFString *v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("\t"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("\t");
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E8EBBFE8;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateChildModifiersWithBlock:", v6);

}

void __61__SBChainableModifier_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:", v4, &stru_1E8EC7EC0);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBChainableModifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

+ (BOOL)modifierUnderTest:(id)a3 containsChildModifierKindOfClass:(Class)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SBChainableModifier_modifierUnderTest_containsChildModifierKindOfClass___block_invoke;
  v7[3] = &unk_1E8EBD0A8;
  v7[4] = &v8;
  v7[5] = a4;
  objc_msgSend(v5, "enumerateChildModifiersWithBlock:", v7);
  LOBYTE(a4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)a4;
}

uint64_t __74__SBChainableModifier_modifierUnderTest_containsChildModifierKindOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (void)_initalizeIMPCaching
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t *v9;
  id v10;
  void *v11;
  Protocol *v12;
  char **v13;
  void *v14;
  unsigned int v15;
  int v16;
  objc_method_description *v17;
  objc_method_description *v18;
  unint64_t v19;
  char **p_types;
  const char *v21;
  char *v22;
  void (*TrampolineForMethod)(void);
  void *v24;
  Protocol **v25;
  id *v26;
  Protocol *v27;
  void *v28;
  void *v29;
  __objc2_class **v30;
  SBModifierCacheSelectorList *v31;
  uint64_t *v32;
  id v33;
  void *v34;
  Protocol *v35;
  int v36;
  unsigned int v37;
  void *v38;
  objc_method_description *v39;
  objc_method_description *v40;
  unint64_t v41;
  char **v42;
  const char *v43;
  char *v44;
  void (*v45)(void);
  void *v46;
  Protocol **v47;
  id *v48;
  Protocol *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  unsigned int v56;
  SEL v57;
  unsigned int v58;
  unsigned int outCount;

  if (!staticPrototypeQueryCacheForClass)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)staticPrototypeQueryCacheForClass;
    staticPrototypeQueryCacheForClass = (uint64_t)v4;

  }
  if (!staticPrototypeContextCacheForClass)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)staticPrototypeContextCacheForClass;
    staticPrototypeContextCacheForClass = (uint64_t)v6;

  }
  objc_msgSend(a1, "baseClassForQueryProtocol");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == a1)
  {
    v9 = &SBCommonInitialize_onceToken;
    if (!staticQuerySelectorsForBaseClass)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = (void *)staticQuerySelectorsForBaseClass;
      staticQuerySelectorsForBaseClass = (uint64_t)v10;

    }
    v57 = a2;
    objc_msgSend(a1, "queryProtocol");
    v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
    v13 = &selRef__noteCoverSheetDidDismiss;
    if (v12)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      while (!protocol_isEqual(v12, (Protocol *)v13[445]))
      {
        outCount = 0;
        v17 = protocol_copyMethodDescriptionList(v12, 1, 1, &outCount);
        if (outCount)
        {
          v18 = v17;
          v15 += outCount;
          v14 = malloc_type_realloc(v14, 8 * v15, 0x80040B8603338uLL);
          if (outCount)
          {
            v55 = v15;
            v19 = 0;
            p_types = &v18->types;
            do
            {
              v21 = *(p_types - 1);
              v22 = *p_types;
              if (objc_msgSend(a1, "instancesRespondToSelector:", v21))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(v21);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v57, a1, CFSTR("SBChainableModifier.m"), 584, CFSTR("%@: Cannot implement %@ on an implementer of +queryProtocol - it messes up the caching implementation."), a1, v53);

              }
              TrampolineForMethod = (void (*)(void))SBChainableModifierMethodCacheQueryTrampolineForMethod(v21, v22, (v16 + v19));
              class_addMethod((Class)a1, v21, TrampolineForMethod, v22);
              *((_QWORD *)v14 + (v16 + v19++)) = v21;
              p_types += 2;
            }
            while (v19 < outCount);
            v16 += v19;
            v13 = &selRef__noteCoverSheetDidDismiss;
            v9 = &SBCommonInitialize_onceToken;
            v15 = v55;
          }
          free(v18);
        }
        v58 = 0;
        v25 = protocol_copyProtocolList(v12, &v58);
        if (!v58)
        {

          v12 = 0;
          break;
        }
        v26 = (id *)v25;
        if (v58 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v57, a1, CFSTR("SBChainableModifier.m"), 598, CFSTR("Multiple sub protocols not currently supported"));

        }
        v27 = (Protocol *)*v26;

        free(v26);
        v12 = v27;
        if (!v27)
          break;
      }
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    v29 = (void *)v9[388];
    v30 = off_1E8E97000;
    v31 = -[SBModifierCacheSelectorList initWithSelectors:count:]([SBModifierCacheSelectorList alloc], "initWithSelectors:count:", v14, v15);
    objc_msgSend(v29, "setObject:forKey:", v31, a1);

    v32 = &SBCommonInitialize_onceToken;
    if (!staticContextSelectorsForBaseClass)
    {
      v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v34 = (void *)staticContextSelectorsForBaseClass;
      staticContextSelectorsForBaseClass = (uint64_t)v33;

    }
    objc_msgSend(a1, "contextProtocol");
    v35 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = 0;
      v37 = 0;
      v38 = 0;
      while (!protocol_isEqual(v35, (Protocol *)v13[445]))
      {
        outCount = 0;
        v39 = protocol_copyMethodDescriptionList(v35, 1, 1, &outCount);
        if (outCount)
        {
          v40 = v39;
          v37 += outCount;
          v38 = malloc_type_realloc(v38, 8 * v37, 0x80040B8603338uLL);
          if (outCount)
          {
            v56 = v37;
            v41 = 0;
            v42 = &v40->types;
            do
            {
              v43 = *(v42 - 1);
              v44 = *v42;
              if (objc_msgSend(a1, "instancesRespondToSelector:", v43))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(v43);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v57, a1, CFSTR("SBChainableModifier.m"), 626, CFSTR("%@: Cannot implement %@ on an implementer of +contextProtocol - it messes up the caching implementation."), a1, v54);

              }
              v45 = (void (*)(void))SBChainableModifierMethodCacheContextTrampolineForMethod(v43, v44, (v36 + v41));
              class_addMethod((Class)a1, v43, v45, v44);
              *((_QWORD *)v38 + (v36 + v41++)) = v43;
              v42 += 2;
            }
            while (v41 < outCount);
            v36 += v41;
            v13 = &selRef__noteCoverSheetDidDismiss;
            v30 = off_1E8E97000;
            v32 = &SBCommonInitialize_onceToken;
            v37 = v56;
          }
          free(v40);
        }
        v58 = 0;
        v47 = protocol_copyProtocolList(v35, &v58);
        if (!v58)
        {

          v35 = 0;
          break;
        }
        v48 = (id *)v47;
        if (v58 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", v57, a1, CFSTR("SBChainableModifier.m"), 640, CFSTR("Multiple sub protocols not currently supported"));

        }
        v49 = (Protocol *)*v48;

        free(v48);
        v35 = v49;
        if (!v49)
          break;
      }
    }
    else
    {
      v38 = 0;
      v37 = 0;
    }
    v51 = (void *)v32[385];
    v52 = (void *)objc_msgSend(objc_alloc(v30[6]), "initWithSelectors:count:", v38, v37);
    objc_msgSend(v51, "setObject:forKey:", v52, a1);

  }
}

@end
