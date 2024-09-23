@implementation PLManagedObjectContextList

- (void)addContext:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (PLManagedObjectContextList)init
{
  PLManagedObjectContextList *v2;
  PLManagedObjectContextList *v3;
  uint64_t v4;
  NSHashTable *contexts;
  PLManagedObjectContextList *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLManagedObjectContextList;
  v2 = -[PLManagedObjectContextList init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    contexts = v3->_contexts;
    v3->_contexts = (NSHashTable *)v4;

    v6 = v3;
  }

  return v3;
}

void __41__PLManagedObjectContextList_addContext___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (id)allContextsNotIdenticalTo:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = v3;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  PLRunWithUnfairLock();
  v5 = v8;

  return v5;
}

- (id)allContexts
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
}

id __41__PLManagedObjectContextList_allContexts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v3;
}

void __56__PLManagedObjectContextList_allContextsNotIdenticalTo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (v8 && v8 != *(_QWORD *)(a1 + 40))
          objc_msgSend(*(id *)(a1 + 48), "addObject:", (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(v2);
}

@end
