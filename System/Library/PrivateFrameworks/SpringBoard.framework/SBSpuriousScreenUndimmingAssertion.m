@implementation SBSpuriousScreenUndimmingAssertion

+ (void)_accessListWithBlock:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    if (_accessListWithBlock__onceToken != -1)
      dispatch_once(&_accessListWithBlock__onceToken, &__block_literal_global_366);
    v4 = _accessListWithBlock__queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SBSpuriousScreenUndimmingAssertion__accessListWithBlock___block_invoke_2;
    block[3] = &unk_1E8E9E8D0;
    v7 = v5;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

void __59__SBSpuriousScreenUndimmingAssertion__accessListWithBlock___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = BSDispatchQueueCreateWithQualityOfService();
  v1 = (void *)_accessListWithBlock__queue;
  _accessListWithBlock__queue = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0x10000, 2);
  v3 = (void *)_accessListWithBlock__weakPointerToIdentifierMap;
  _accessListWithBlock__weakPointerToIdentifierMap = v2;

}

uint64_t __59__SBSpuriousScreenUndimmingAssertion__accessListWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isAnyActive
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SBSpuriousScreenUndimmingAssertion_isAnyActive__block_invoke;
  v4[3] = &unk_1E8EBE7E0;
  v4[4] = &v5;
  +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:](SBSpuriousScreenUndimmingAssertion, "_accessListWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__SBSpuriousScreenUndimmingAssertion_isAnyActive__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

+ (id)debugDescription
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __54__SBSpuriousScreenUndimmingAssertion_debugDescription__block_invoke;
  v9 = &unk_1E8EBE808;
  v10 = v2;
  v3 = v2;
  +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:](SBSpuriousScreenUndimmingAssertion, "_accessListWithBlock:", &v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), v3, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __54__SBSpuriousScreenUndimmingAssertion_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "length"))
          objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("<%p:%@>"), v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (SBSpuriousScreenUndimmingAssertion)initWithIdentifier:(id)a3
{
  id v4;
  SBSpuriousScreenUndimmingAssertion *v5;
  uint64_t v6;
  NSString *identifier;
  _QWORD v9[4];
  SBSpuriousScreenUndimmingAssertion *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSpuriousScreenUndimmingAssertion;
  v5 = -[SBSpuriousScreenUndimmingAssertion init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SBSpuriousScreenUndimmingAssertion_initWithIdentifier___block_invoke;
    v9[3] = &unk_1E8EBE808;
    v10 = v5;
    +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:](SBSpuriousScreenUndimmingAssertion, "_accessListWithBlock:", v9);

  }
  return v5;
}

void __57__SBSpuriousScreenUndimmingAssertion_initWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 8);
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Adding spurious screen undimming assertion <%p:%{public}@>", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)dealloc
{
  objc_super v3;

  -[SBSpuriousScreenUndimmingAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSpuriousScreenUndimmingAssertion;
  -[SBSpuriousScreenUndimmingAssertion dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__SBSpuriousScreenUndimmingAssertion_invalidate__block_invoke;
  v2[3] = &unk_1E8EBE808;
  v2[4] = self;
  +[SBSpuriousScreenUndimmingAssertion _accessListWithBlock:](SBSpuriousScreenUndimmingAssertion, "_accessListWithBlock:", v2);
}

void __48__SBSpuriousScreenUndimmingAssertion_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 8);
    v7 = 134218242;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Removing spurious screen undimming assertion <%p:%{public}@>", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
