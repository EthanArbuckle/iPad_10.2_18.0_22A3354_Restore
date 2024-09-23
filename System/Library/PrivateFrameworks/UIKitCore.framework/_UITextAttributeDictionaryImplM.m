@implementation _UITextAttributeDictionaryImplM

- (void)_removeFallbackFromStorage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UITextAttributeDefaults _attributes](self->super._fallback, "_attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_UITextAttributeDefaults _attributes](self->super._fallback, "_attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->super._storage, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          -[NSMutableDictionary removeObjectForKey:](self->super._storage, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

+ (Class)_storageClass
{
  return (Class)objc_opt_class();
}

- (void)removeObjectForKey:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isMutable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDictionary.m"), 356, CFSTR("%@ is not a mutable impl."), objc_opt_class());

  }
  -[NSMutableDictionary removeObjectForKey:](self->super._storage, "removeObjectForKey:", v6);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *storage;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "_isMutable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDictionary.m"), 334, CFSTR("%@ is not a mutable impl."), objc_opt_class());

  }
  if (self->super._fallback
    && !-[_UITextAttributeDictionaryImplI ignoresFallbackForKey:](self, "ignoresFallbackForKey:", v7))
  {
    -[_UITextAttributeDefaults _attributes](self->super._fallback, "_attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    v12 = v11;
    if (v10 == v11)
    {
      v8 = 1;
    }
    else
    {
      v8 = 0;
      if (v11 && v10)
        v8 = objc_msgSend(v10, "isEqual:", v11);
    }

  }
  else
  {
    v8 = 0;
  }
  if (!v7 || (v13 = self->super._storage) == 0 || !CFDictionaryContainsKey((CFDictionaryRef)v13, v7))
  {
    if ((v8 & 1) != 0)
      goto LABEL_20;
    storage = self->super._storage;
LABEL_19:
    -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v16, v7);
    goto LABEL_20;
  }
  storage = self->super._storage;
  if (!v8)
    goto LABEL_19;
  -[NSMutableDictionary removeObjectForKey:](storage, "removeObjectForKey:", v7);
LABEL_20:

}

+ (BOOL)_isMutable
{
  return 1;
}

+ (Class)_ignoringClass
{
  return (Class)objc_opt_class();
}

- (void)removeAllObjects
{
  void *v4;

  if ((objc_msgSend((id)objc_opt_class(), "_isMutable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDictionary.m"), 363, CFSTR("%@ is not a mutable impl."), objc_opt_class());

  }
  -[NSMutableDictionary removeAllObjects](self->super._storage, "removeAllObjects");
}

- (void)setFallback:(id)a3
{
  _UITextAttributeDefaults *v5;
  _UITextAttributeDefaults *fallback;
  void *v7;

  v5 = (_UITextAttributeDefaults *)a3;
  if ((objc_msgSend((id)objc_opt_class(), "_isMutable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDictionary.m"), 372, CFSTR("%@ is not a mutable impl."), objc_opt_class());

  }
  fallback = self->super._fallback;
  self->super._fallback = v5;

  -[_UITextAttributeDictionaryImplM _removeFallbackFromStorage](self, "_removeFallbackFromStorage");
}

- (void)setIgnoresFallback:(BOOL)a3 forKey:(id)a4
{
  _BOOL4 v4;
  void *v7;
  NSMutableSet *ignoring;
  uint64_t v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "_isMutable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAttributeDictionary.m"), 379, CFSTR("%@ is not a mutable impl."), objc_opt_class());

  }
  v7 = v13;
  if (v13)
  {
    ignoring = self->super._ignoring;
    if (v4)
    {
      if (ignoring)
      {
        -[NSMutableSet addObject:](ignoring, "addObject:", v13);
LABEL_11:
        v7 = v13;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v13);
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v10 = self->super._ignoring;
      self->super._ignoring = v11;
LABEL_10:

      goto LABEL_11;
    }
    -[NSMutableSet removeObject:](ignoring, "removeObject:", v13);
    v9 = -[NSMutableSet count](self->super._ignoring, "count");
    v7 = v13;
    if (!v9)
    {
      v10 = self->super._ignoring;
      self->super._ignoring = 0;
      goto LABEL_10;
    }
  }
LABEL_12:

}

@end
