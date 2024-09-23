@implementation _UIVisualStyleRegistry

- (Class)visualStyleClassForView:(id)a3
{
  return -[_UIVisualStyleRegistry visualStyleClassForStylableClass:](self, "visualStyleClassForStylableClass:", objc_opt_class());
}

+ (id)registryForTraitEnvironment:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registryForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)registryForIdiom:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)__idiomToRegistry;
  if (!__idiomToRegistry)
  {
    v5 = objc_opt_new();
    v6 = (void *)__idiomToRegistry;
    __idiomToRegistry = v5;

    v4 = (void *)__idiomToRegistry;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)__idiomToRegistry;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  return v8;
}

- (Class)visualStyleClassForStylableClass:(Class)a3
{
  int has_internal_diagnostics;
  char v6;
  _UIVisualStyleRegistry *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDE510C0);
  if (has_internal_diagnostics)
  {
    if ((v6 & 1) != 0)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    NSStringFromClass(a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v24;
    _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Cannot determine visual style class for class %@, since class does not conform to _UIVisualStyleStylable.", (uint8_t *)&v27, 0xCu);
LABEL_27:

LABEL_28:
    goto LABEL_3;
  }
  if ((v6 & 1) == 0)
  {
    v25 = _MergedGlobals_1255;
    if (!_MergedGlobals_1255)
    {
      v25 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v25, (unint64_t *)&_MergedGlobals_1255);
    }
    v26 = *(NSObject **)(v25 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v23 = v26;
      NSStringFromClass(a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v24;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Cannot determine visual style class for class %@, since class does not conform to _UIVisualStyleStylable.", (uint8_t *)&v27, 0xCu);
      goto LABEL_27;
    }
  }
LABEL_3:
  objc_msgSend((id)objc_opt_class(), "defaultRegistry");
  v7 = (_UIVisualStyleRegistry *)objc_claimAutoreleasedReturnValue();

  -[objc_class visualStyleRegistryIdentity](a3, "visualStyleRegistryIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->__classToVisualStyleClass, "objectForKeyedSubscript:", v8);
  -[NSMutableDictionary allKeys](self->__classToVisualStyleClass, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    v12 = qword_1ECD81B80;
    if (!qword_1ECD81B80)
    {
      v12 = __UILogCategoryGetNode("_UIVisualStyleRegistry", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD81B80);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Warning: no visual style classes have been registered at all.", (uint8_t *)&v27, 2u);
    }
  }
  if (v9)
  {
    v14 = v9;
LABEL_10:
    v15 = v14;
    goto LABEL_19;
  }
  if (v7 != self)
  {
    +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "visualStyleClassForStylableClass:", a3);

    if (v17)
    {
      v14 = v17;
      goto LABEL_10;
    }
  }
  v18 = qword_1ECD81B88;
  if (!qword_1ECD81B88)
  {
    v18 = __UILogCategoryGetNode("_UIVisualStyleRegistry", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v18, (unint64_t *)&qword_1ECD81B88);
  }
  v19 = *(NSObject **)(v18 + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    NSStringFromClass(a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412290;
    v28 = v21;
    _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Note: no default visual style class registered as fallback for stylable class %@", (uint8_t *)&v27, 0xCu);

  }
  v15 = 0;
LABEL_19:

  return (Class)v15;
}

+ (_UIVisualStyleRegistry)defaultRegistry
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)__defaultVisualStyleRegistry;
  if (!__defaultVisualStyleRegistry)
  {
    v3 = objc_opt_new();
    v4 = (void *)__defaultVisualStyleRegistry;
    __defaultVisualStyleRegistry = v3;

    v2 = (void *)__defaultVisualStyleRegistry;
  }
  return (_UIVisualStyleRegistry *)v2;
}

- (void)registerVisualStyleClass:(Class)a3 forStylableClass:(Class)a4
{
  char v7;
  int has_internal_diagnostics;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = -[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_1EDE510C0);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (a3)
    v9 = v7;
  else
    v9 = 1;
  if (has_internal_diagnostics)
  {
    if ((v9 & 1) == 0)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_15:

        goto LABEL_6;
      }
      NSStringFromClass(a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v12;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Cannot determine visual style class for class %@, since class does not conform to _UIVisualStyleStylable.", (uint8_t *)&v15, 0xCu);
LABEL_14:

      goto LABEL_15;
    }
  }
  else if ((v9 & 1) == 0)
  {
    v13 = registerVisualStyleClass_forStylableClass____s_category;
    if (!registerVisualStyleClass_forStylableClass____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&registerVisualStyleClass_forStylableClass____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v11 = v14;
      NSStringFromClass(a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Cannot determine visual style class for class %@, since class does not conform to _UIVisualStyleStylable.", (uint8_t *)&v15, 0xCu);
      goto LABEL_14;
    }
  }
LABEL_6:
  -[objc_class visualStyleRegistryIdentity](a4, "visualStyleRegistryIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->__classToVisualStyleClass, "setObject:forKeyedSubscript:", a3, v10);

}

- (_UIVisualStyleRegistry)init
{
  _UIVisualStyleRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *classToVisualStyleClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualStyleRegistry;
  v2 = -[_UIVisualStyleRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    classToVisualStyleClass = v2->__classToVisualStyleClass;
    v2->__classToVisualStyleClass = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__classToVisualStyleClass, 0);
}

@end
