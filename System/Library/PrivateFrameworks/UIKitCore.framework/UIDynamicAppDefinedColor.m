@implementation UIDynamicAppDefinedColor

- (BOOL)isEqual:(id)a3
{
  UIDynamicAppDefinedColor *v4;
  char v5;

  v4 = (UIDynamicAppDefinedColor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSDictionary isEqual:](v4->_colorsByThemeKey, "isEqual:", self->_colorsByThemeKey);
    else
      v5 = 0;
  }

  return v5;
}

void __62__UIDynamicAppDefinedColor__resolvedColorWithTraitCollection___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
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

void __60__UIDynamicAppDefinedColor_initWithColorsByTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v8 = a2;
  v5 = a3;
  -[UITraitCollection _themeKey](v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Dynamic color dictionary contains a redundant trait collection: %@"), v8);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsByThemeKey, 0);
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_colorsByThemeKey, "hash");
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  _QWORD *v4;
  int has_internal_diagnostics;
  uint64_t v6;
  id v7;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  UIDynamicAppDefinedColor *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__105;
  v17 = __Block_byref_object_dispose__105;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__UIDynamicAppDefinedColor__resolvedColorWithTraitCollection___block_invoke;
  v12[3] = &unk_1E16CA2D0;
  v12[4] = self;
  v12[5] = &v13;
  -[UITraitCollection _enumerateThemeKeysForLookup:](v4, (uint64_t)v12);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = v14[5];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = self;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
      }

    }
  }
  else if (!v6)
  {
    v10 = _resolvedColorWithTraitCollection____s_category_1430;
    if (!_resolvedColorWithTraitCollection____s_category_1430)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_resolvedColorWithTraitCollection____s_category_1430);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Dynamic color couldn't be resolved: %@", buf, 0xCu);
    }
  }
  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __60__UIDynamicAppDefinedColor__generateColorsByTraitCollection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_opt_self();
  _UITraitCollectionFromThemeKey(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

- (id)initWithColorsByTraitCollection:(id *)a1
{
  id *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id *v9;
  id *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  objc_super v18;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    if (!objc_msgSend(v3, "count"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Requires one or more colors"));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __60__UIDynamicAppDefinedColor_initWithColorsByTraitCollection___block_invoke;
    v16 = &unk_1E16CA318;
    v5 = v4;
    v17 = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v13);

    _UIThemeKeyLeastSpecific();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Dynamic color dictionary must specify a fallback color with unspecified idiom, unspecified style, and unspecified or SRGB gamut"));
    v8 = v5;
    if (!objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithColorsByThemeKey_, v2, CFSTR("UIColor.m"), 4915, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorsByThemeKey.count > 0"), v13, v14, v15, v16);

    }
    v18.receiver = v2;
    v18.super_class = (Class)UIDynamicAppDefinedColor;
    v9 = (id *)objc_msgSendSuper2(&v18, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong(v9 + 3, v4);

    v2 = v10;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UIDynamicAppDefinedColor _generateColorsByTraitCollection]((id *)&self->super.super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIDynamicAppDefinedColorsByTraitCollection"));

  v6.receiver = self;
  v6.super_class = (Class)UIDynamicAppDefinedColor;
  -[UIColor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);

}

- (id)_generateColorsByTraitCollection
{
  id *v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id *v6;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1[3], "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v1[3];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__UIDynamicAppDefinedColor__generateColorsByTraitCollection__block_invoke;
    v5[3] = &unk_1E16CA340;
    v1 = v2;
    v6 = v1;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  -[UIDynamicAppDefinedColor _generateColorsByTraitCollection]((id *)&self->super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; colors = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
