@implementation ICStorePlatformResponseGroup

- (ICStorePlatformResponseGroup)initWithResponses:(id)a3
{
  id v4;
  ICStorePlatformResponseGroup *v5;
  uint64_t v6;
  NSArray *childResponses;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStorePlatformResponseGroup;
  v5 = -[ICStorePlatformResponseGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    childResponses = v5->_childResponses;
    v5->_childResponses = (NSArray *)v6;

  }
  return v5;
}

- (NSNumber)accountIdentifier
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_childResponses;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "accountIdentifier", (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSNumber *)v8;
}

- (NSArray)allItems
{
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ICStorePlatformResponseGroup_allItems__block_invoke;
  v5[3] = &unk_1E438F178;
  v5[4] = v3;
  -[ICStorePlatformResponseGroup enumerateItemsUsingBlock:](self, "enumerateItemsUsingBlock:", v5);
  return (NSArray *)v3;
}

- (NSNumber)enqueuerAccountIdentifier
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_childResponses;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "enqueuerAccountIdentifier", (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSNumber *)v8;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4;
  NSArray *childResponses;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  childResponses = self->_childResponses;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E438DFE8;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](childResponses, "enumerateObjectsUsingBlock:", v7);

}

- (NSDate)expirationDate
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
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
  v2 = self->_childResponses;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "expirationDate", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            objc_msgSend(v5, "earlierDate:", v8);
            v10 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v10;
          }
          else
          {
            v5 = v8;
          }
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (id)itemForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_childResponses;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "itemForIdentifier:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)storefrontIdentifier
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_childResponses;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "storefrontIdentifier", (_QWORD)v10);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (NSString *)v8;
}

- (id)rawResponse
{
  return (id)-[NSArray valueForKeyPath:](self->_childResponses, "valueForKeyPath:", CFSTR("rawResponse"));
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICURLAggregatedPerformanceMetrics *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_childResponses, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_childResponses;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "performanceMetrics", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "performanceMetrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "urlMetrics");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v13 = -[ICURLAggregatedPerformanceMetrics initWithURLMetrics:]([ICURLAggregatedPerformanceMetrics alloc], "initWithURLMetrics:", v3);
  else
    v13 = 0;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childResponses, 0);
}

void __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke_2;
  v6[3] = &unk_1E438DFC0;
  v7 = *(id *)(a1 + 32);
  v8 = a4;
  objc_msgSend(a2, "enumerateItemsUsingBlock:", v6);

}

uint64_t __57__ICStorePlatformResponseGroup_enumerateItemsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  char v6;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = v7;
  *a3 = v7;
  **(_BYTE **)(a1 + 40) = v6;
  return result;
}

uint64_t __40__ICStorePlatformResponseGroup_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
