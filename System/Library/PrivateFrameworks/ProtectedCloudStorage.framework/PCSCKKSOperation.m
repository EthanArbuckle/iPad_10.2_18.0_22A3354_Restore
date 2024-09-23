@implementation PCSCKKSOperation

+ (id)operation:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  PCSCKKSOperationBlock *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PCSCKKSOperationBlock);
  -[PCSCKKSOperationBlock setName:](v7, "setName:", v6);

  -[PCSCKKSOperationBlock setBlock:](v7, "setBlock:", v5);
  return v7;
}

- (void)addSuccessDependency:(id)a3
{
  PCSCKKSOperation *v4;
  NSMutableArray *successDependencies;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    successDependencies = v4->_successDependencies;
    if (!successDependencies)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v4->_successDependencies;
      v4->_successDependencies = (NSMutableArray *)v6;

      successDependencies = v4->_successDependencies;
    }
    -[NSMutableArray addObject:](successDependencies, "addObject:", v8);
    objc_sync_exit(v4);

  }
  -[PCSCKKSOperation addDependency:](self, "addDependency:", v8);

}

- (BOOL)checkDependencies
{
  PCSCKKSOperation *v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  NSMutableArray *obj;
  PCSCKKSOperation *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_successDependencies;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  v4 = v3 == 0;
  v28 = v3;
  if (!v3)
    goto LABEL_18;
  v5 = 0;
  v6 = 0;
  v26 = v2;
  v27 = *(_QWORD *)v31;
  v24 = *MEMORY[0x1E0CB3388];
  v7 = 1;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v31 != v27)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
      v10 = objc_msgSend(v9, "isFinished");
      v29 = objc_msgSend(v9, "isCancelled");
      objc_msgSend(v9, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 != 0;

      objc_msgSend(v9, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v9, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", PCSCKKSOperationErrorDomain);

        if (v16)
        {
          objc_msgSend(v9, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v26;
          -[PCSCKKSOperation setError:](v26, "setError:", v17);
        }
        else
        {
          v18 = (void *)MEMORY[0x1E0CB35C8];
          v19 = PCSCKKSOperationErrorDomain;
          v34 = v24;
          objc_msgSend(v9, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 1, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v26;
          -[PCSCKKSOperation setError:](v26, "setError:", v21);

        }
      }
      v7 &= v10;
      v5 |= v29;
      v6 |= v12;
      ++v8;
    }
    while (v28 != v8);
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  }
  while (v28);

  if (!(v5 & 1 | ((v7 & 1) == 0) | v6 & 1))
    return 1;
  -[PCSCKKSOperation error](v2, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PCSCKKSOperationErrorDomain, 2, 0);
    obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[PCSCKKSOperation setError:](v2, "setError:");
    v4 = 0;
LABEL_18:

    return v4;
  }
  return 0;
}

- (BOOL)startOperation
{
  _BOOL4 v3;
  int v4;
  const __CFString *v5;
  int *v6;

  v3 = -[PCSCKKSOperation checkDependencies](self, "checkDependencies");
  v4 = -[PCSCKKSOperation isCancelled](self, "isCancelled") || !v3;
  if (v4)
    v5 = CFSTR("isFinished");
  else
    v5 = CFSTR("isExecuting");
  if (v4)
    v6 = &OBJC_IVAR___PCSCKKSOperation_finished;
  else
    v6 = &OBJC_IVAR___PCSCKKSOperation_executing;
  -[PCSCKKSOperation willChangeValueForKey:](self, "willChangeValueForKey:", v5);
  *((_BYTE *)&self->super.super.isa + *v6) = 1;
  -[PCSCKKSOperation didChangeValueForKey:](self, "didChangeValueForKey:", v5);
  return v4 ^ 1;
}

- (void)completeOperation
{
  -[PCSCKKSOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[PCSCKKSOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->executing = 0;
  self->finished = 1;
  -[PCSCKKSOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[PCSCKKSOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isExecuting
{
  return self->executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->executing = a3;
}

- (BOOL)isFinished
{
  return self->finished;
}

- (void)setFinished:(BOOL)a3
{
  self->finished = a3;
}

- (BOOL)isCancelled
{
  return self->cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->cancelled = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSuccessDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successDependencies, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
