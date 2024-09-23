@implementation SBHIconLayoutHidingCompoundAssertion

- (SBHIconLayoutHidingCompoundAssertion)initWithInvalidationHandler:(id)a3 icons:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SBHIconLayoutHidingCompoundAssertion *v14;
  uint64_t v15;
  NSMutableArray *icons;
  uint64_t v17;
  NSString *reason;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBHIconLayoutHidingCompoundAssertion;
  v14 = -[SBHIconLayoutHidingCompoundAssertion init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "mutableCopy");
    icons = v14->_icons;
    v14->_icons = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_invalidationHandler, a3);
    v17 = objc_msgSend(v13, "copy");
    reason = v14->_reason;
    v14->_reason = (NSString *)v17;

    v14->_options = a6;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_FAULT, "SBHIconLayoutHidingCompoundAssertion deallocated but not invalidated! Reason: %@", (uint8_t *)&v3, 0xCu);
}

- (void)addAssertion:(id)a3 forChild:(id)a4
{
  id v6;
  NSMapTable *childAssertions;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  childAssertions = self->_childAssertions;
  if (!childAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_childAssertions;
    self->_childAssertions = v8;

    childAssertions = self->_childAssertions;
  }
  -[NSMapTable objectForKey:](childAssertions, "objectForKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[NSMapTable setObject:forKey:](self->_childAssertions, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v11);

}

- (void)addAssertionFromChild:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBHIconLayoutHidingCompoundAssertion icons](self, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLayoutHidingCompoundAssertion reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginHidingIconsFromLayout:reason:options:", v4, v5, -[SBHIconLayoutHidingCompoundAssertion options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SBHIconLayoutHidingCompoundAssertion addAssertion:forChild:](self, "addAssertion:forChild:", v6, v7);

}

- (void)removeAndInvalidateAssertionsForChild:(id)a3
{
  id v4;
  void *v5;
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
  v4 = a3;
  -[NSMapTable objectForKey:](self->_childAssertions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "invalidate");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[NSMapTable removeObjectForKey:](self->_childAssertions, "removeObjectForKey:", v4);

}

- (void)addIcon:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableArray addObject:](self->_icons, "addObject:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_childAssertions;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_childAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "addIcon:", v4);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

}

- (NSArray)icons
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_icons, "copy");
}

- (void)setOptions:(unint64_t)a3
{
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_options != a3)
  {
    self->_options = a3;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = self->_childAssertions;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          -[NSMapTable objectForKey:](self->_childAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setOptions:", a3);
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

  }
}

- (NSString)description
{
  return (NSString *)-[SBHIconLayoutHidingCompoundAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)invalidate
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[SBHIconLayoutHidingCompoundAssertion isInvalidated](self, "isInvalidated"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = self->_childAssertions;
    v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          -[NSMapTable objectForKey:](self->_childAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v15;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v15 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "invalidate");
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
            }
            while (v10);
          }

          ++v7;
        }
        while (v7 != v5);
        v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

    -[SBHIconLayoutHidingCompoundAssertion invalidationHandler](self, "invalidationHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutHidingCompoundAssertionDidInvalidate:", self);

    -[SBHIconLayoutHidingCompoundAssertion setInvalidated:](self, "setInvalidated:", 1);
  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconLayoutHidingCompoundAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIconLayoutHidingCompoundAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  -[SBHIconLayoutHidingCompoundAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_childAssertions, CFSTR("childAssertions"));
  -[SBHIconLayoutHidingCompoundAssertion reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("reason"));

  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBHIconLayoutHidingCompoundAssertion options](self, "options"), CFSTR("options"), 1);
  -[SBHIconLayoutHidingCompoundAssertion invalidationHandler](self, "invalidationHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendPointer:withName:", v9, CFSTR("invalidationHandler"));

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (SBHIconLayoutHidingCompoundAssertionInvalidationHandler)invalidationHandler
{
  return self->_invalidationHandler;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_childAssertions, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end
