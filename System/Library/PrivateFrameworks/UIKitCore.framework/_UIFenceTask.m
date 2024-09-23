@implementation _UIFenceTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    os_unfair_lock_unlock(p_lock);
    -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");
  }
}

- (_UIFenceTask)init
{
  _UIFenceTask *v2;
  _UIFenceTask *v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BKSProcessAssertion *assertion;
  unint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  objc_super v14;
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UIFenceTask;
  v2 = -[_UIFenceTask init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    do
    {
      v4 = __ldaxr(&qword_1ECD826B8);
      v5 = v4 + 1;
    }
    while (__stlxr(v4 + 1, &qword_1ECD826B8));
    v2->_identifier = v5;
    if (os_variant_has_internal_diagnostics())
    {
      v11 = qword_1ECD826C0;
      if (!qword_1ECD826C0)
      {
        v11 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD826C0);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v12 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v16 = v5;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "_UIFenceTask:%llu created", buf, 0xCu);
        }
      }
    }
    v3->_lock._os_unfair_lock_opaque = 0;
    v3->_lock_invalidated = 0;
    if (+[_UIFenceTask _processRequiresFenceAssertions](_UIFenceTask, "_processRequiresFenceAssertions"))
    {
      v6 = objc_alloc(MEMORY[0x1E0CFE308]);
      v7 = getpid();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __20___UIFenceTask_init__block_invoke;
      v13[3] = &__block_descriptor_40_e8_v12__0B8l;
      v13[4] = v5;
      v8 = objc_msgSend(v6, "initWithPID:flags:reason:name:withHandler:", v7, 7, 4, CFSTR("systemAnimationFence"), v13);
      assertion = v3->_assertion;
      v3->_assertion = (BKSProcessAssertion *)v8;

    }
  }
  return v3;
}

+ (BOOL)_processRequiresFenceAssertions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&algn_1ECD826B2[2]);
  if ((_MergedGlobals_1333 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      _MergedGlobals_1333 = 1;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v3, "assertions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "domain");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.underlying"))
              && objc_msgSend(v9, "rangeOfString:", CFSTR("DarwinRoleUI")) != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (os_variant_has_internal_diagnostics())
              {
                v11 = qword_1ECD826C8;
                if (!qword_1ECD826C8)
                {
                  v11 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v11, (unint64_t *)&qword_1ECD826C8);
                }
                v12 = *(NSObject **)(v11 + 8);
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v13 = 0;
                  _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Found underlying UI assertion! Fence assertions are disabled for this process.", v13, 2u);
                }
              }
              byte_1ECD826B1 = 1;

              goto LABEL_15;
            }

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&algn_1ECD826B2[2]);
  return (byte_1ECD826B1 & 1) == 0;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t identifier;
  objc_super v9;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFenceTask.m"), 56, CFSTR("must invalidate _UIFenceTask:%llu before dealloc"), self->_identifier);

  }
  if (os_variant_has_internal_diagnostics())
  {
    v6 = dealloc___s_category_13;
    if (!dealloc___s_category_13)
    {
      v6 = __UILogCategoryGetNode("Fence", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&dealloc___s_category_13);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 134217984;
        v11 = identifier;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "_UIFenceTask:%llu destroyed", buf, 0xCu);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  v9.receiver = self;
  v9.super_class = (Class)_UIFenceTask;
  -[_UIFenceTask dealloc](&v9, sel_dealloc);
}

@end
