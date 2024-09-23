@implementation PETAggregateStateStorage

- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4
{
  id v4;

  v4 = a4;
  __break(1u);
}

- (void)runWithLock:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PETAggregateStateStorage.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PETAggregateStateStorage_runWithLock___block_invoke;
  v8[3] = &unk_1E2A410A8;
  v9 = v5;
  v6 = v5;
  -[PETAggregateStateStorage expand:andRunWithLock:](self, "expand:andRunWithLock:", 0, v8);

}

uint64_t __40__PETAggregateStateStorage_runWithLock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

+ (id)storageInMemory
{
  return (id)objc_opt_new();
}

+ (id)storageOnDisk:(id)a3
{
  id v5;
  PETAggregateStateStorageOnDisk *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PETAggregateStateStorage.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v6 = -[PETAggregateStateStorageOnDisk initWithPath:]([PETAggregateStateStorageOnDisk alloc], "initWithPath:", v5);

  return v6;
}

@end
