@implementation ICScrollViewDelegateMultiplexer

- (ICScrollViewDelegateMultiplexer)initWithForwardingTargets:(id)a3
{
  NSArray *v4;
  NSArray *wrappedForwardingTargets;

  objc_msgSend(a3, "ic_map:", &__block_literal_global_15);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  wrappedForwardingTargets = self->_wrappedForwardingTargets;
  self->_wrappedForwardingTargets = v4;

  return self;
}

id __61__ICScrollViewDelegateMultiplexer_initWithForwardingTargets___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D64298];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithObject:", v3);

  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICScrollViewDelegateMultiplexer wrappedForwardingTargets](self, "wrappedForwardingTargets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "object");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICScrollViewDelegateMultiplexer wrappedForwardingTargets](self, "wrappedForwardingTargets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "object");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICScrollViewDelegateMultiplexer wrappedForwardingTargets](self, "wrappedForwardingTargets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_respondsToSelector();

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "object");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "methodSignatureForSelector:", a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICScrollViewDelegateMultiplexer wrappedForwardingTargets](self, "wrappedForwardingTargets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "selector");
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "object");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "invokeWithTarget:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (NSArray)forwardingTargets
{
  void *v2;
  void *v3;

  -[ICScrollViewDelegateMultiplexer wrappedForwardingTargets](self, "wrappedForwardingTargets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __52__ICScrollViewDelegateMultiplexer_forwardingTargets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)wrappedForwardingTargets
{
  return self->_wrappedForwardingTargets;
}

- (void)setWrappedForwardingTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedForwardingTargets, 0);
}

@end
