@implementation UIDynamicSystemColor

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UIColor _systemColorName](self, "_systemColorName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  id v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  UIColor *cachedColor;
  int has_internal_diagnostics;
  id v10;
  id v11;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  _QWORD v16[6];
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  UIDynamicSystemColor *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__105;
  v21 = __Block_byref_object_dispose__105;
  v22 = 0;
  _UITraitCollectionReplacingStyleForBackgroundColorIfNeccessary(v4, self);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_cachedColorLock);
  v6 = _UIThemeKeyValueFromTraitCollection(v5);
  v7 = v6;
  cachedColor = self->_cachedColor;
  if (cachedColor && self->_cachedThemeKey == v6)
  {
    objc_storeStrong(v18 + 5, cachedColor);
  }
  else
  {
    os_unfair_lock_unlock(&self->_cachedColorLock);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__UIDynamicSystemColor__resolvedColorWithTraitCollection___block_invoke;
    v16[3] = &unk_1E16CA2D0;
    v16[4] = self;
    v16[5] = &v17;
    -[UITraitCollection _enumerateThemeKeysForLookup:](v5, (uint64_t)v16);
    os_unfair_lock_lock(&self->_cachedColorLock);
    objc_storeStrong((id *)&self->_cachedColor, v18[5]);
    self->_cachedThemeKey = v7;
  }
  os_unfair_lock_unlock(&self->_cachedColorLock);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v10 = v18[5];
  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = self;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
      }

    }
  }
  else if (!v10)
  {
    v14 = _resolvedColorWithTraitCollection____s_category;
    if (!_resolvedColorWithTraitCollection____s_category)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_resolvedColorWithTraitCollection____s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
    }
  }
  v11 = v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __58__UIDynamicSystemColor__resolvedColorWithTraitCollection___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a3 = 1;
}

- (BOOL)isEqual:(id)a3
{
  UIDynamicSystemColor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (UIDynamicSystemColor *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UIColor _systemColorName](v4, "_systemColorName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIColor _systemColorName](self, "_systemColorName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)initWithName:(void *)a3 colorsByThemeKey:
{
  id v5;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  objc_super v21;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v8 = objc_msgSend(v5, "length");
    if (has_internal_diagnostics)
    {
      if (!v8)
      {
        __UIFaultDebugAssertLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "bad color name", buf, 2u);
        }

      }
    }
    else if (!v8)
    {
      v17 = qword_1ECD7BF28;
      if (!qword_1ECD7BF28)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7BF28);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "bad color name", buf, 2u);
      }
    }
    v9 = os_variant_has_internal_diagnostics();
    _UIThemeKeyLeastSpecific();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v11)
      {
        __UIFaultDebugAssertLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "must specify an 'any' fallback color", buf, 2u);
        }

      }
    }
    else if (!v11)
    {
      v19 = qword_1ECD7BF30;
      if (!qword_1ECD7BF30)
      {
        v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&qword_1ECD7BF30);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "must specify an 'any' fallback color", buf, 2u);
      }
    }
    v21.receiver = a1;
    v21.super_class = (Class)UIDynamicSystemColor;
    a1 = objc_msgSendSuper2(&v21, sel_init);
    if (a1)
    {
      v12 = objc_msgSend(v6, "copy");
      v13 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v12;

      objc_msgSend(a1, "_setSystemColorName:", v5);
      *((_DWORD *)a1 + 8) = 0;
    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor _systemColorName](self, "_systemColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
  objc_storeStrong((id *)&self->_colorsByThemeKey, 0);
}

@end
