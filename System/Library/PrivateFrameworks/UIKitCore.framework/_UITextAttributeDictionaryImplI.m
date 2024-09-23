@implementation _UITextAttributeDictionaryImplI

- (BOOL)isNSDictionary__
{
  return 1;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_storage, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (self->_fallback
      && !-[_UITextAttributeDictionaryImplI ignoresFallbackForKey:](self, "ignoresFallbackForKey:", v4))
    {
      -[_UITextAttributeDefaults _attributes](self->_fallback, "_attributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoring, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_fallback, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _UITextAttributeDictionaryImplM *v4;
  void *v5;
  _UITextAttributeDefaults *fallback;
  void *v7;
  id v8;

  v4 = [_UITextAttributeDictionaryImplM alloc];
  v5 = (void *)-[NSMutableDictionary mutableCopy](self->_storage, "mutableCopy");
  fallback = self->_fallback;
  v7 = (void *)-[NSMutableSet mutableCopy](self->_ignoring, "mutableCopy");
  v8 = -[_UITextAttributeDictionaryImplI _initWithStorage:fallback:ignoring:](v4, "_initWithStorage:fallback:ignoring:", v5, fallback, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UITextAttributeDictionaryImplI *v4;
  void *v5;
  _UITextAttributeDefaults *fallback;
  void *v7;
  id v8;

  v4 = [_UITextAttributeDictionaryImplI alloc];
  v5 = (void *)-[NSMutableDictionary copy](self->_storage, "copy");
  fallback = self->_fallback;
  v7 = (void *)-[NSMutableSet copy](self->_ignoring, "copy");
  v8 = -[_UITextAttributeDictionaryImplI _initWithStorage:fallback:ignoring:](v4, "_initWithStorage:fallback:ignoring:", v5, fallback, v7);

  return v8;
}

- (id)_initWithStorage:(id)a3 fallback:(id)a4 ignoring:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UITextAttributeDictionaryImplI *v11;
  int has_internal_diagnostics;
  NSMutableDictionary *storage;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_UITextAttributeDictionaryImplI;
  v11 = -[_UITextAttributeDictionaryImplI init](&v23, sel_init);
  if (!v11)
    goto LABEL_8;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  storage = v11->_storage;
  if (!has_internal_diagnostics)
  {
    if (!storage)
      goto LABEL_4;
    v20 = _initWithStorage_fallback_ignoring____s_category;
    if (!_initWithStorage_fallback_ignoring____s_category)
    {
      v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&_initWithStorage_fallback_ignoring____s_category);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v18 = v21;
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v25 = v22;
    _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "%@ initialized with nil storage", buf, 0xCu);
    goto LABEL_16;
  }
  if (storage)
  {
    __UIFaultDebugAssertLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "%@ initialized with nil storage", buf, 0xCu);
    }
LABEL_16:

  }
LABEL_4:
  if (v8)
  {
    v14 = (NSMutableDictionary *)v8;
    v15 = v11->_storage;
    v11->_storage = v14;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_storageClass");
    v15 = (NSMutableDictionary *)(id)objc_opt_new();
    v16 = v11->_storage;
    v11->_storage = v15;

  }
  objc_storeStrong((id *)&v11->_fallback, a4);
  objc_storeStrong((id *)&v11->_ignoring, a5);
  -[_UITextAttributeDictionaryImplI _removeFallbackFromStorage](v11, "_removeFallbackFromStorage");
LABEL_8:

  return v11;
}

- (id)keyEnumerator
{
  void *v3;
  void *v4;
  void *v5;

  -[_UITextAttributeDictionaryImplI _keysIfThereIsFallback](self, "_keysIfThereIsFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "objectEnumerator");
  else
    -[NSMutableDictionary keyEnumerator](self->_storage, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)count
{
  void *storage;
  void *v4;
  unint64_t v5;

  -[_UITextAttributeDictionaryImplI _keysIfThereIsFallback](self, "_keysIfThereIsFallback");
  storage = (void *)objc_claimAutoreleasedReturnValue();
  v4 = storage;
  if (!storage)
    storage = self->_storage;
  v5 = objc_msgSend(storage, "count");

  return v5;
}

- (id)_keysIfThereIsFallback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UITextAttributeDefaults _attributes](self->_fallback, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](self->_storage, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  _UITextAttributeDictionaryImplI *v4;
  _UITextAttributeDictionaryImplI *v5;
  _UITextAttributeDictionaryImplI *v6;
  void *v7;
  void *v8;
  _UITextAttributeDictionaryImplI *v9;
  _UITextAttributeDictionaryImplI *v10;
  _UITextAttributeDictionaryImplI *v11;
  char v12;

  v4 = (_UITextAttributeDictionaryImplI *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[_UITextAttributeDictionaryImplI _fullDictionary](self, "_fullDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextAttributeDictionaryImplI _fullDictionary](v6, "_fullDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        v11 = v10;
        if (v9 == v10)
        {
          v12 = 1;
        }
        else
        {
          v12 = 0;
          if (v9 && v10)
            v12 = -[_UITextAttributeDictionaryImplI isEqual:](v9, "isEqual:", v10);
        }

        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_UITextAttributeDictionaryImplI _fullDictionary](self, "_fullDictionary");
        v9 = (_UITextAttributeDictionaryImplI *)(id)objc_claimAutoreleasedReturnValue();
        v11 = v5;
        if (v9 == v11)
        {
          v12 = 1;
        }
        else if (v9)
        {
          v12 = -[_UITextAttributeDictionaryImplI isEqual:](v9, "isEqual:", v11);
        }
        else
        {
          v12 = 0;
        }
        v6 = v9;
LABEL_19:

        goto LABEL_20;
      }
    }
    v12 = 0;
  }
LABEL_20:

  return v12;
}

- (id)_fullDictionary
{
  uint64_t v3;
  _UITextAttributeDefaults *fallback;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *storage;

  if (!self->_fallback)
    goto LABEL_6;
  v3 = -[NSMutableDictionary count](self->_storage, "count");
  fallback = self->_fallback;
  if (!v3)
  {
    if (fallback)
    {
      -[_UITextAttributeDefaults _attributes](fallback, "_attributes");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = v8;
      return v7;
    }
LABEL_6:
    storage = self->_storage;
    if (!storage)
      storage = (NSMutableDictionary *)MEMORY[0x1E0C9AA70];
    v8 = storage;
    goto LABEL_9;
  }
  -[_UITextAttributeDefaults _attributes](fallback, "_attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", self->_storage);
  v7 = (NSMutableDictionary *)objc_msgSend(v6, "copy");

  return v7;
}

- (_UITextAttributeDictionaryImplI)init
{
  void *v3;
  _UITextAttributeDictionaryImplI *v4;

  objc_msgSend((id)objc_opt_class(), "_storageClass");
  v3 = (void *)objc_opt_new();
  v4 = -[_UITextAttributeDictionaryImplI _initWithStorage:fallback:ignoring:](self, "_initWithStorage:fallback:ignoring:", v3, 0, 0);

  return v4;
}

+ (BOOL)_isMutable
{
  return 0;
}

+ (Class)_storageClass
{
  return (Class)objc_opt_class();
}

+ (Class)_ignoringClass
{
  return (Class)objc_opt_class();
}

- (_UITextAttributeDictionaryImplI)initWithDictionary:(id)a3 fallback:(id)a4
{
  return (_UITextAttributeDictionaryImplI *)-[_UITextAttributeDictionaryImplI _initWithDictionary:copyItems:fallback:](self, "_initWithDictionary:copyItems:fallback:", a3, 0, a4);
}

- (_UITextAttributeDictionaryImplI)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  return (_UITextAttributeDictionaryImplI *)-[_UITextAttributeDictionaryImplI _initWithDictionary:copyItems:fallback:](self, "_initWithDictionary:copyItems:fallback:", a3, a4, 0);
}

- (id)_initWithDictionary:(id)a3 copyItems:(BOOL)a4 fallback:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  Class *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_isMutable") & 1) != 0)
      v10 = objc_msgSend(v8, "mutableCopy");
    else
      v10 = objc_msgSend(v8, "copy");
    v16 = (void *)v10;
  }
  else
  {
    v11 = (void *)objc_opt_class();
    if (v8)
    {
      v12 = objc_msgSend(v11, "_isMutable");
      v13 = (Class *)0x1E0C99E08;
      if (!v12)
        v13 = (Class *)0x1E0C99D80;
      v14 = (void *)objc_msgSend(objc_alloc(*v13), "initWithDictionary:copyItems:", v8, v6);
      v15 = objc_alloc((Class)objc_opt_class());
    }
    else
    {
      v17 = objc_alloc((Class)v11);
      objc_msgSend((id)objc_opt_class(), "_storageClass");
      v14 = (void *)objc_opt_new();
      v15 = v17;
    }
    v16 = (void *)objc_msgSend(v15, "_initWithStorage:fallback:ignoring:", v14, v9, 0);

  }
  return v16;
}

- (_UITextAttributeDictionaryImplI)initWithCapacity:(unint64_t)a3
{
  void *v4;
  _UITextAttributeDictionaryImplI *v5;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_storageClass")), "initWithCapacity:", a3);
  v5 = -[_UITextAttributeDictionaryImplI _initWithStorage:fallback:ignoring:](self, "_initWithStorage:fallback:ignoring:", v4, 0, 0);

  return v5;
}

- (_UITextAttributeDictionaryImplI)initWithFallback:(id)a3
{
  id v4;
  void *v5;
  _UITextAttributeDictionaryImplI *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_storageClass");
  v5 = (void *)objc_opt_new();
  v6 = -[_UITextAttributeDictionaryImplI _initWithStorage:fallback:ignoring:](self, "_initWithStorage:fallback:ignoring:", v5, v4, 0);

  return v6;
}

- (id)allKeys
{
  void *v3;
  void *v4;
  void *v5;

  -[_UITextAttributeDictionaryImplI _keysIfThereIsFallback](self, "_keysIfThereIsFallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "allObjects");
  else
    -[NSMutableDictionary allKeys](self->_storage, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fallback
{
  return self->_fallback;
}

- (BOOL)usesFallbackForKey:(id)a3
{
  id v4;
  NSMutableDictionary *storage;
  BOOL v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;

  v4 = a3;
  if (v4 && (storage = self->_storage) != 0 && CFDictionaryContainsKey((CFDictionaryRef)storage, v4))
  {
    v6 = 0;
  }
  else
  {
    -[_UITextAttributeDefaults _attributes](self->_fallback, "_attributes");
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v6 = 0;
    if (v4 && v7)
      v6 = CFDictionaryContainsKey(v7, v4) != 0;

  }
  return v6;
}

- (BOOL)ignoresFallbackForKey:(id)a3
{
  return -[NSMutableSet containsObject:](self->_ignoring, "containsObject:", a3);
}

- (id)sparseDictionary
{
  char v3;
  NSMutableDictionary *storage;
  NSMutableDictionary *v5;

  v3 = objc_msgSend((id)objc_opt_class(), "_isMutable");
  storage = self->_storage;
  if ((v3 & 1) != 0)
    v5 = (NSMutableDictionary *)-[NSMutableDictionary copy](storage, "copy");
  else
    v5 = storage;
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableDictionary hash](self->_storage, "hash");
  v4 = -[NSMutableSet hash](self->_ignoring, "hash") ^ v3;
  return v4 ^ -[_UITextAttributeDefaults hash](self->_fallback, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  _UITextAttributeDictionaryImplI *v14;
  id v15;

  -[_UITextAttributeDefaults _attributes](self->_fallback, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_storage, "count") + objc_msgSend(v3, "count"));
    objc_msgSend(v4, "addEntriesFromDictionary:", self->_storage);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __46___UITextAttributeDictionaryImplI_description__block_invoke;
    v13 = &unk_1E16B1DF0;
    v14 = self;
    v15 = v4;
    v5 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v10);
    objc_msgSend(v5, "description", v10, v11, v12, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"\\U100000"), CFSTR("("));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\U100000\"), CFSTR(")"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSMutableDictionary description](self->_storage, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
