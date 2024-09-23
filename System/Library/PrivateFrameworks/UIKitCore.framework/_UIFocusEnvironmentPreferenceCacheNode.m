@implementation _UIFocusEnvironmentPreferenceCacheNode

- (_UIFocusEnvironmentPreferenceCacheNode)initWithEnvironment:(id)a3
{
  id v5;
  _UIFocusEnvironmentPreferenceCacheNode *v6;
  _UIFocusEnvironmentPreferenceCacheNode *v7;
  uint64_t v8;
  NSHashTable *parentNodes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusEnvironmentPreferenceCacheNode;
  v6 = -[_UIFocusEnvironmentPreferenceCacheNode init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 514);
    v8 = objc_claimAutoreleasedReturnValue();
    parentNodes = v7->_parentNodes;
    v7->_parentNodes = (NSHashTable *)v8;

  }
  return v7;
}

- (void)_reevaluateResolution
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    -[_UIFocusEnvironmentPreferenceCacheNode childNodes](self, "childNodes");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      && (v4 = (void *)v3,
          -[_UIFocusEnvironmentPreferenceCacheNode childNodes](self, "childNodes"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "count"),
          v5,
          v4,
          v6))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[_UIFocusEnvironmentPreferenceCacheNode childNodes](self, "childNodes", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (!objc_msgSend(v12, "isResolved"))
            {
              -[_UIFocusEnvironmentPreferenceCacheNode _unresolve](self, "_unresolve");
              goto LABEL_18;
            }
            objc_msgSend(v12, "resolvedEnvironment");
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)v13;
              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            continue;
          break;
        }
      }
      v14 = 0;
LABEL_17:

      -[_UIFocusEnvironmentPreferenceCacheNode _resolve:explicitly:](self, "_resolve:explicitly:", v14, 0);
      v7 = v14;
LABEL_18:

    }
    else
    {
      -[_UIFocusEnvironmentPreferenceCacheNode _unresolve](self, "_unresolve");
    }
  }
}

- (void)_resolve:(id)a3 explicitly:(BOOL)a4
{
  _BOOL4 v4;
  UIFocusEnvironment *v7;
  UIFocusEnvironment *v8;
  char flags;
  char v10;
  char v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = (UIFocusEnvironment *)a3;
  v8 = v7;
  flags = (char)self->_flags;
  if ((flags & 2) == 0 || v4)
  {
    if ((*(_BYTE *)&self->_flags & 1) != 0 && self->_resolvedEnvironment == v7)
    {
      if (v4 | ((flags & 2) >> 1))
        v17 = 2;
      else
        v17 = 0;
      *(_BYTE *)&self->_flags = v17 | flags & 0xFD;
    }
    else
    {
      v10 = flags & 0xFC;
      if (v4)
        v11 = 3;
      else
        v11 = 1;
      *(_BYTE *)&self->_flags = v10 | v11;
      objc_storeStrong((id *)&self->_resolvedEnvironment, a3);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v12 = self->_parentNodes;
      v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_reevaluateResolution", (_QWORD)v18);
          }
          v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v14);
      }

    }
  }

}

- (void)resolve:(id)a3
{
  -[_UIFocusEnvironmentPreferenceCacheNode _resolve:explicitly:](self, "_resolve:explicitly:", a3, 1);
}

- (void)_unresolve
{
  char flags;
  UIFocusEnvironment *resolvedEnvironment;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  flags = (char)self->_flags;
  if ((flags & 3) == 1)
  {
    *(_BYTE *)&self->_flags = flags & 0xFE;
    resolvedEnvironment = self->_resolvedEnvironment;
    self->_resolvedEnvironment = 0;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_parentNodes;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_reevaluateResolution", (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setChildNodes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *childNodes;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_UIFocusEnvironmentPreferenceCacheNode childNodes](self, "childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9++) + 8), "removeObject:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = (NSArray *)objc_msgSend(v4, "copy");
  childNodes = self->_childNodes;
  self->_childNodes = v10;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++) + 8), "addObject:", self, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  -[_UIFocusEnvironmentPreferenceCacheNode _reevaluateResolution](self, "_reevaluateResolution");
}

- (BOOL)isResolved
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)description
{
  void *v3;
  UIFocusEnvironment *environment;
  void *v5;
  UIFocusEnvironment *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01748]), "initWithObject:", self);
  environment = self->_environment;
  if (environment)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = environment;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("environment"));

  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSHashTable count](self->_parentNodes, "count"), CFSTR("parentNodes"));
  v12 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSArray count](self->_childNodes, "count"), CFSTR("childNodes"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)debugDescription
{
  void *v3;
  UIFocusEnvironment *environment;
  void *v5;
  UIFocusEnvironment *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01748]), "initWithObject:", self);
  environment = self->_environment;
  if (environment)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = environment;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("environment"));

  v11 = (id)objc_msgSend(v3, "appendObject:withName:", self->_parentNodes, CFSTR("parentNodes"));
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", self->_childNodes, CFSTR("childNodes"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIFocusEnvironment)environment
{
  return self->_environment;
}

- (UIFocusEnvironment)resolvedEnvironment
{
  return self->_resolvedEnvironment;
}

- (NSArray)childNodes
{
  return self->_childNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_storeStrong((id *)&self->_resolvedEnvironment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_parentNodes, 0);
}

@end
