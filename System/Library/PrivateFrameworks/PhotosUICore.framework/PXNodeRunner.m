@implementation PXNodeRunner

- (PXNodeRunner)init
{
  PXNodeRunner *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXNodeRunner;
  v2 = -[PXNodeRunner init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
  }
  return v2;
}

- (int64_t)maxConcurrentRunNodeCount
{
  return -[NSOperationQueue maxConcurrentOperationCount](self->_operationQueue, "maxConcurrentOperationCount");
}

- (void)setMaxConcurrentRunNodeCount:(int64_t)a3
{
  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", a3);
}

- (void)setQualityOfService:(int64_t)a3
{
  -[NSOperationQueue setQualityOfService:](self->_operationQueue, "setQualityOfService:", a3);
}

- (int64_t)qualityOfService
{
  return -[NSOperationQueue qualityOfService](self->_operationQueue, "qualityOfService");
}

- (void)_processRunGraph:(id)a3
{
  id v4;
  PXRunNodeOperationMap *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(PXRunNodeOperationMap);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[PXRunNodeOperationMap objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[NSOperationQueue addOperations:waitUntilFinished:](self->_operationQueue, "addOperations:waitUntilFinished:", v6, 0);
}

- (void)processGraphForRunNode:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v6, "dependencies", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

      ++v5;
    }
    while (objc_msgSend(v4, "count") > v5);
  }
  objc_msgSend(v4, "reversedOrderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXNodeRunner _processRunGraph:](self, "_processRunGraph:", v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
