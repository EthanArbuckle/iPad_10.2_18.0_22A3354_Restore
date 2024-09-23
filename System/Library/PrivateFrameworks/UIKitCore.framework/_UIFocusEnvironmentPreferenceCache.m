@implementation _UIFocusEnvironmentPreferenceCache

- (_UIFocusEnvironmentPreferenceCache)init
{
  _UIFocusEnvironmentPreferenceCache *v2;
  uint64_t v3;
  NSMapTable *environmentsMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFocusEnvironmentPreferenceCache;
  v2 = -[_UIFocusEnvironmentPreferenceCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 514, 512);
    v3 = objc_claimAutoreleasedReturnValue();
    environmentsMap = v2->_environmentsMap;
    v2->_environmentsMap = (NSMapTable *)v3;

  }
  return v2;
}

- (id)preferredEnvironmentsForEnvironment:(id)a3 isFinal:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UIFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isResolved"))
    {
      if (a4)
        *a4 = 1;
      objc_msgSend(v8, "resolvedEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "resolvedEnvironment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C9AA60];
      }
    }
    else
    {
      if (a4)
        *a4 = 0;
      objc_msgSend(v8, "childNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bs_map:", &__block_literal_global_513);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setResolvedPreference:(id)a3 forEnvironment:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[_UIFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceCache.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node != nil"));

  }
  objc_msgSend(v9, "resolve:", v11);

}

- (void)setPreferredEnvironments:(id)a3 forEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UIFocusEnvironmentPreferenceCacheNode *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _UIFocusEnvironmentPreferenceCacheNode *(*v34)(uint64_t, void *);
  void *v35;
  id v36;
  _UIFocusEnvironmentPreferenceCache *v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (_UIFocusEnvironmentPreferenceCacheNode *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = -[_UIFocusEnvironmentPreferenceCacheNode initWithEnvironment:]([_UIFocusEnvironmentPreferenceCacheNode alloc], "initWithEnvironment:", v7);
    -[_UIFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v7);

  }
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __78___UIFocusEnvironmentPreferenceCache_setPreferredEnvironments_forEnvironment___block_invoke;
  v35 = &unk_1E16E3620;
  v11 = v7;
  v36 = v11;
  v37 = self;
  objc_msgSend(v6, "bs_compactMap:", &v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_UIFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToArray:", v12);

    if ((v16 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          -[_UIFocusEnvironmentPreferenceCacheNode environment](v9, "environment");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v28 = (void *)MEMORY[0x1E0CB3940];
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v26, v32, v33, v34, v35);
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v27 = CFSTR("(nil)");
          }
          -[_UIFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v39 = v27;
          v40 = 2112;
          v41 = v31;
          v42 = 2112;
          v43 = v12;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Modifying preferred environments for an environment. This indicates an unstable PFE chain. Results might be unreliable. Environment %@ had these childs before:\n%@\nnow has:\n%@", buf, 0x20u);

        }
      }
      else
      {
        v17 = setPreferredEnvironments_forEnvironment____s_category;
        if (!setPreferredEnvironments_forEnvironment____s_category)
        {
          v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v17, (unint64_t *)&setPreferredEnvironments_forEnvironment____s_category);
        }
        v18 = *(id *)(v17 + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          -[_UIFocusEnvironmentPreferenceCacheNode environment](v9, "environment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)MEMORY[0x1E0CB3940];
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v19, v32, v33, v34, v35);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v23 = CFSTR("(nil)");
          }
          v24 = v23;
          -[_UIFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v39 = v23;
          v40 = 2112;
          v41 = v25;
          v42 = 2112;
          v43 = v12;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Modifying preferred environments for an environment. This indicates an unstable PFE chain. Results might be unreliable. Environment %@ had these childs before:\n%@\nnow has:\n%@", buf, 0x20u);

        }
      }

    }
  }
  -[_UIFocusEnvironmentPreferenceCacheNode setChildNodes:](v9, "setChildNodes:", v12);

}

- (id)deepestPrimaryPreferredEnvironmentForEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[_UIFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "childNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    do
    {
      objc_msgSend(v6, "childNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "childNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v6 = v10;
    }
    while (v12);
  }
  else
  {
    v10 = v6;
  }
  objc_msgSend(v10, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSMapTable)environmentsMap
{
  return self->_environmentsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentsMap, 0);
}

@end
