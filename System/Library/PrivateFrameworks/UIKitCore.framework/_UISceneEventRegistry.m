@implementation _UISceneEventRegistry

- (id)eventForType:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setEvent:(uint64_t)a3 forType:
{
  uint64_t v6;
  void *v7;
  void *v8;
  int has_internal_diagnostics;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_setEvent_forType_, a1, CFSTR("UIEventEnvironment.m"), 1262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

    }
    if (!*(_QWORD *)(a1 + 8))
    {
      v6 = objc_opt_new();
      v7 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v6;

    }
    -[_UISceneEventRegistry eventForType:](a1, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (a2)
      v10 = v8 == 0;
    else
      v10 = 0;
    v11 = v10;
    if (has_internal_diagnostics)
    {
      if ((v11 & 1) == 0)
      {
        __UIFaultDebugAssertLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v19 = a3;
          _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Adding an event of type %lu when we already have one", buf, 0xCu);
        }

        goto LABEL_15;
      }
    }
    else if ((v11 & 1) == 0)
    {
      v16 = setEvent_forType____s_category;
      if (!setEvent_forType____s_category)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&setEvent_forType____s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v19 = a3;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Adding an event of type %lu when we already have one", buf, 0xCu);
      }
      goto LABEL_15;
    }
    v12 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", a2, v13);

LABEL_15:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByType, 0);
}

@end
