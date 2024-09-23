@implementation SBChainableModifierEventResponse

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validator, 0);
  objc_storeStrong((id *)&self->_childResponses, 0);
}

- (NSString)description
{
  return (NSString *)-[SBChainableModifierEventResponse descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)isValid
{
  uint64_t (**validator)(void);

  if (self->_consumed)
    return 0;
  validator = (uint64_t (**)(void))self->_validator;
  if (validator)
    return validator[2]();
  else
    return 1;
}

- (void)enumerateChildResponsesUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_childResponses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (!v14)
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), &v14);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBChainableModifierEventResponse *v11;
  id v12;

  v4 = a3;
  -[SBChainableModifierEventResponse succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", self->_consumed, CFSTR("consumed"), 1);
  if ((BSFloatIsZero() & 1) == 0)
    v7 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("delay"), self->_delay);
  if (-[NSMutableArray count](self->_childResponses, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__SBChainableModifierEventResponse_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E8E9E270;
    v10 = v4;
    v11 = self;
    v12 = v5;
    objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", 0, v10, v9);

  }
  return v5;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __74__SBChainableModifierEventResponse_descriptionBuilderWithMultilinePrefix___block_invoke(_QWORD *a1)
{
  void *v2;
  __CFString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("\t"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("\t");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1[5] + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)a1[6];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "descriptionWithMultilinePrefix:", v3, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, &stru_1E8EC7EC0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)responseByAppendingResponse:(id)a3 toResponse:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if (v6 | v7)
  {
    if (v6 || !v7)
    {
      if (!v6 || v7)
      {
        v10 = (void *)objc_msgSend(a1, "newEventResponse");
        objc_msgSend(v10, "addChildResponse:", v8);
        objc_msgSend(v10, "addChildResponse:", v6);
        goto LABEL_11;
      }
      v9 = (id)v6;
    }
    else
    {
      v9 = (id)v7;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_11:

  return v10;
}

- (void)addChildResponse:(id)a3
{
  -[NSMutableArray addObject:](self->_childResponses, "addObject:", a3);
}

- (id)_initWithChildResponses:(id)a3
{
  id v4;
  SBChainableModifierEventResponse *v5;
  SBChainableModifierEventResponse *v6;
  NSMutableArray *v7;
  NSMutableArray *childResponses;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBChainableModifierEventResponse;
  v5 = -[SBChainableModifierEventResponse init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_delay = 0.0;
    v5->_consumed = 0;
    if (v4)
      v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    else
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    childResponses = v6->_childResponses;
    v6->_childResponses = v7;

  }
  return v6;
}

- (SBChainableModifierEventResponse)init
{
  return (SBChainableModifierEventResponse *)-[SBChainableModifierEventResponse _initWithChildResponses:](self, "_initWithChildResponses:", 0);
}

- (void)setDelay:(double)a3 withValidator:(id)a4
{
  void *v5;
  id validator;

  self->_delay = a3;
  v5 = (void *)MEMORY[0x1D17E5550](a4, a2);
  validator = self->_validator;
  self->_validator = v5;

}

- (id)responseByTransformingResponseWithTransformer:(id)a3
{
  void (**v4)(id, SBChainableModifierEventResponse *);
  NSMutableArray *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *childResponses;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, SBChainableModifierEventResponse *))a3;
  v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_childResponses, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_childResponses;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "responseByTransformingResponseWithTransformer:", v4, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[NSMutableArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  childResponses = self->_childResponses;
  self->_childResponses = v5;

  v4[2](v4, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)insertChildResponse:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](self->_childResponses, "insertObject:atIndex:", a3, a4);
}

- (void)addChildResponses:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_childResponses, "addObjectsFromArray:", a3);
}

- (void)consumeWithReason:(id)a3
{
  id v5;
  id validator;
  NSObject *v7;
  void *v8;

  v5 = a3;
  if (self->_consumed)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBChainableModifierEventResponse.m"), 103, CFSTR("Can't consume an response that has already been consumed."));

  }
  self->_consumed = 1;
  validator = self->_validator;
  self->_validator = 0;

  -[SBChainableModifierEventResponse loggingCategory](self, "loggingCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBChainableModifierEventResponse consumeWithReason:].cold.1(self, (uint64_t)v5, v7);

}

- (void)enumerateResponseTreeUsingBlock:(id)a3
{
  char v3;

  v3 = 0;
  -[SBChainableModifierEventResponse enumerateResponseTreeUsingBlock:stop:](self, "enumerateResponseTreeUsingBlock:stop:", a3, &v3);
}

- (void)enumerateResponseTreeUsingBlock:(id)a3 stop:(BOOL *)a4
{
  void (**v6)(id, SBChainableModifierEventResponse *, BOOL *);
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, SBChainableModifierEventResponse *, BOOL *))a3;
  v6[2](v6, self, a4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_childResponses;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if (!*a4)
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "enumerateResponseTreeUsingBlock:stop:", v6, a4, (_QWORD)v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (id)newEventResponse
{
  return objc_alloc_init(SBChainableModifierEventResponse);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBChainableModifierEventResponse succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isConsumed
{
  if (result)
    return *(_BYTE *)(result + 16) != 0;
  return result;
}

- (uint64_t)setConsumed:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 16) = a2;
  return result;
}

- (void)consumeWithReason:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Consuming response: %@ for reason: %@", (uint8_t *)&v6, 0x16u);

}

@end
