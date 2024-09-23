@implementation TFMultiDelegate

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TFMultiDelegate;
  if (-[TFMultiDelegate conformsToProtocol:](&v8, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else if (v4)
  {
    -[TFMultiDelegate delegateProtocol](self, "delegateProtocol");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6 == v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (Protocol)delegateProtocol
{
  return self->_delegateProtocol;
}

- (TFMultiDelegate)initWithDelegate:(id)a3 delegateProtocol:(id)a4
{
  id v6;
  id v7;
  TFMultiDelegate *v8;
  uint64_t v9;
  NSHashTable *children;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TFMultiDelegate;
  v8 = -[TFMultiDelegate init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v9 = objc_claimAutoreleasedReturnValue();
    children = v8->_children;
    v8->_children = (NSHashTable *)v9;

    -[NSHashTable addObject:](v8->_children, "addObject:", v6);
    objc_storeStrong((id *)&v8->_delegateProtocol, a4);
  }

  return v8;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TFMultiDelegate children](self, "children");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (NSHashTable)children
{
  return self->_children;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TFMultiDelegate children](self, "children");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)replaceDelegate:(id)a3 withDelegate:(id)a4
{
  id v6;

  if (a3 != a4)
  {
    v6 = a4;
    -[TFMultiDelegate removeDelegate:](self, "removeDelegate:", a3);
    -[TFMultiDelegate addDelegate:](self, "addDelegate:", v6);

  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)TFMultiDelegate;
  if (-[TFMultiDelegate respondsToSelector:](&v15, sel_respondsToSelector_))
    return 1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TFMultiDelegate children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v4 = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v4 = 0;
LABEL_14:

  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)TFMultiDelegate;
  -[TFMultiDelegate methodSignatureForSelector:](&v16, sel_methodSignatureForSelector_);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[TFMultiDelegate children](self, "children", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (v9)
          {
            objc_msgSend(v9, "methodSignatureForSelector:", a3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v5 = v10;

              v6 = v5;
              goto LABEL_13;
            }
          }
        }
        v5 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TFMultiDelegate children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (v10)
        {
          objc_msgSend(v4, "selector");
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v4, "invokeWithTarget:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProtocol, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
