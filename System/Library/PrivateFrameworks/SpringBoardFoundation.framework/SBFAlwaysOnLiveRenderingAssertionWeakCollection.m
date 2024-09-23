@implementation SBFAlwaysOnLiveRenderingAssertionWeakCollection

- (SBFAlwaysOnLiveRenderingAssertionWeakCollection)init
{
  SBFAlwaysOnLiveRenderingAssertionWeakCollection *v2;
  uint64_t v3;
  NSHashTable *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionWeakCollection;
  v2 = -[SBFAlwaysOnLiveRenderingAssertionWeakCollection init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;

  }
  return v2;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[NSHashTable anyObject](self->_assertions, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[NSHashTable allObjects](self->_assertions, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addAssertion:(id)a3
{
  -[NSHashTable addObject:](self->_assertions, "addObject:", a3);
}

- (void)removeAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_assertions, "removeObject:", a3);
}

- (void)removeAll
{
  -[NSHashTable removeAllObjects](self->_assertions, "removeAllObjects");
}

- (id)mostRecentlyCreatedValidAssertion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSHashTable allObjects](self->_assertions, "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "isValid"))
        {
          objc_msgSend(v8, "createdAt");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeIntervalSince1970");
          v11 = v10;
          objc_msgSend(v5, "createdAt");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSince1970");
          v14 = v13;

          if (v11 > v14)
          {
            v15 = v8;

            v5 = v15;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)invalidateAll
{
  id v2;

  -[NSHashTable allObjects](self->_assertions, "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_6);

}

uint64_t __64__SBFAlwaysOnLiveRenderingAssertionWeakCollection_invalidateAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
