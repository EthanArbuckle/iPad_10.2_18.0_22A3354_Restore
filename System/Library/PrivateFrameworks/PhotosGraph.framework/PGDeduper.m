@implementation PGDeduper

- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)itemIsRequired:(id)a3
{
  NSSet *identifiersOfRequiredItems;
  void *v4;
  BOOL v5;

  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (!identifiersOfRequiredItems)
    return 0;
  objc_msgSend(a3, "clsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSSet containsObject:](identifiersOfRequiredItems, "containsObject:", v4);

  return v5;
}

- (id)requiredItemsInItems:(id)a3
{
  id v4;
  NSSet *identifiersOfRequiredItems;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSSet *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (identifiersOfRequiredItems && -[NSSet count](identifiersOfRequiredItems, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = self->_identifiersOfRequiredItems;
          objc_msgSend(v12, "clsIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v13) = -[NSSet containsObject:](v13, "containsObject:", v14);

          if ((_DWORD)v13)
          {
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v9, "addObject:", v12);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v4 = v16;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)identifiersOfRequiredItems
{
  return self->_identifiersOfRequiredItems;
}

- (void)setIdentifiersOfRequiredItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfRequiredItems, 0);
}

@end
