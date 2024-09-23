@implementation SSVBarrierOperationQueue

- (void)addOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  unsigned int v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = -[SSVBarrierOperationQueue isSuspended](self, "isSuspended");
  -[SSVBarrierOperationQueue setSuspended:](self, "setSuspended:", 1);
  -[SSVBarrierOperationQueue operations](self, "operations");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reverseObjectEnumerator");
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
        objc_getAssociatedObject(v10, (const void *)_SSVBarrierOperationQueueAssociatedObjectKeyIsBarrierOperation);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
          objc_msgSend(v4, "addDependency:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)SSVBarrierOperationQueue;
  -[SSVBarrierOperationQueue addOperation:](&v15, sel_addOperation_, v4);
  -[SSVBarrierOperationQueue setSuspended:](self, "setSuspended:", v14);

}

- (void)addOperationWithBlock:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSVBarrierOperationQueue addOperation:](self, "addOperation:", v4);

}

- (void)addOperations:(id)a3 waitUntilFinished:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  unsigned int v19;
  _BOOL4 v20;
  SSVBarrierOperationQueue *v21;
  id v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v20 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v19 = -[SSVBarrierOperationQueue isSuspended](self, "isSuspended");
  -[SSVBarrierOperationQueue setSuspended:](self, "setSuspended:", 1);
  v21 = self;
  -[SSVBarrierOperationQueue operations](self, "operations");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_getAssociatedObject(v10, (const void *)_SSVBarrierOperationQueueAssociatedObjectKeyIsBarrierOperation);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = v22;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "addDependency:", v10);
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  v23.receiver = v21;
  v23.super_class = (Class)SSVBarrierOperationQueue;
  -[SSVBarrierOperationQueue addOperations:waitUntilFinished:](&v23, sel_addOperations_waitUntilFinished_, v22, v20);
  -[SSVBarrierOperationQueue setSuspended:](v21, "setSuspended:", v19);

}

- (void)addBarrierOperation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SSVBarrierOperationQueue isSuspended](self, "isSuspended");
  -[SSVBarrierOperationQueue setSuspended:](self, "setSuspended:", 1);
  -[SSVBarrierOperationQueue operations](self, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "addDependency:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  objc_setAssociatedObject(v4, (const void *)_SSVBarrierOperationQueueAssociatedObjectKeyIsBarrierOperation, MEMORY[0x1E0C9AAB0], (void *)1);
  v11.receiver = self;
  v11.super_class = (Class)SSVBarrierOperationQueue;
  -[SSVBarrierOperationQueue addOperation:](&v11, sel_addOperation_, v4);
  -[SSVBarrierOperationQueue setSuspended:](self, "setSuspended:", v5);

}

@end
