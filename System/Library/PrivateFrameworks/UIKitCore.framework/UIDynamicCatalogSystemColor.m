@implementation UIDynamicCatalogSystemColor

- (BOOL)isEqual:(id)a3
{
  UIDynamicCatalogSystemColor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (UIDynamicCatalogSystemColor *)a3;
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
  _QWORD *v4;
  unint64_t v5;
  UIColor *cachedColor;
  UIColor *v7;
  int64_t cuiColorName;
  _QWORD *v9;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  id v16;
  objc_class *v17;
  UIColor **p_cachedColor;
  int *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v23;
  objc_class *v24;
  id v25;
  _BYTE buf[24];
  _BOOL8 v27;
  _BOOL8 v28;
  _BOOL8 v29;
  _BOOL8 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  _UITraitCollectionReplacingStyleForBackgroundColorIfNeccessary(a3, self);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = _UIThemeKeyValueFromTraitCollection(v4);
  os_unfair_lock_lock(&self->_colorCacheLock);
  cachedColor = self->_cachedColor;
  if (cachedColor && self->_cachedThemeKey == v5)
  {
    v7 = cachedColor;
  }
  else
  {
    v24 = (objc_class *)v5;
    os_unfair_lock_unlock(&self->_colorCacheLock);
    cuiColorName = self->_cuiColorName;
    v9 = v4;
    v10 = 4 * (objc_msgSend(v9, "userInterfaceIdiom") == 3);
    v11 = objc_msgSend(v9, "userInterfaceStyle") == 2;
    v12 = objc_msgSend(v9, "accessibilityContrast") == 1;
    v13 = objc_msgSend(v9, "_vibrancy") == 2;
    v14 = objc_msgSend(v9, "displayGamut");

    v25 = 0;
    *(_QWORD *)buf = cuiColorName;
    *(_QWORD *)&buf[8] = v10;
    *(_QWORD *)&buf[16] = 0;
    v27 = v11;
    v28 = v12;
    v29 = v13;
    v30 = v14 == 1;
    objc_msgSend(MEMORY[0x1E0D1A6B0], "colorWithTraits:error:", buf, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;
    if (v15)
    {
      v7 = -[UIColor initWithCGColor:]([UIColor alloc], "initWithCGColor:", objc_msgSend(v15, "cgColor"));
      p_cachedColor = &self->_cachedColor;
      v17 = v24;
      v19 = &OBJC_IVAR___UIFieldBehavior__fieldFlags;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v23 = objc_claimAutoreleasedReturnValue();
        p_cachedColor = &self->_cachedColor;
        v17 = v24;
        v19 = &OBJC_IVAR___UIFieldBehavior__fieldFlags;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = cuiColorName;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Unable to lookup color %tu in CoreUI: %@", buf, 0x16u);
        }

      }
      else
      {
        v20 = _UIColorFromCoreUI___s_category;
        p_cachedColor = &self->_cachedColor;
        v17 = v24;
        v19 = &OBJC_IVAR___UIFieldBehavior__fieldFlags;
        if (!_UIColorFromCoreUI___s_category)
        {
          v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&_UIColorFromCoreUI___s_category);
        }
        v21 = *(NSObject **)(v20 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = cuiColorName;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Unable to lookup color %tu in CoreUI: %@", buf, 0x16u);
        }
      }
      +[UIColor clearColor](UIColor, "clearColor");
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }

    os_unfair_lock_lock(&self->_colorCacheLock);
    objc_storeStrong((id *)p_cachedColor, v7);
    *(Class *)((char *)&self->super.super.super.isa + v19[995]) = v17;
  }
  os_unfair_lock_unlock(&self->_colorCacheLock);

  return v7;
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

- (void)initWithName:(uint64_t)a3 coreUIColorName:
{
  id v5;
  int has_internal_diagnostics;
  uint64_t v7;
  id v8;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[16];

  v5 = a2;
  if (a1)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v7 = objc_msgSend(v5, "length");
    if (has_internal_diagnostics)
    {
      if (!v7)
      {
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "bad color name", buf, 2u);
        }

      }
    }
    else if (!v7)
    {
      v11 = initWithName_coreUIColorName____s_category;
      if (!initWithName_coreUIColorName____s_category)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&initWithName_coreUIColorName____s_category);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "bad color name", buf, 2u);
      }
    }
    v13.receiver = a1;
    v13.super_class = (Class)UIDynamicCatalogSystemColor;
    v8 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 8) = 0;
      *((_QWORD *)v8 + 3) = a3;
      objc_msgSend(v8, "_setSystemColorName:", v5);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedColor, 0);
}

@end
