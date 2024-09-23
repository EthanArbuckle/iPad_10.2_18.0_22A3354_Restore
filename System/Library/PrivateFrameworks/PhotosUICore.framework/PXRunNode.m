@implementation PXRunNode

- (PXRunNode)init
{
  return -[PXRunNode initWithDependencies:](self, "initWithDependencies:", 0);
}

- (PXRunNode)initWithDependencies:(id)a3
{
  id v4;
  PXRunNode *v5;
  NSLock *v6;
  NSLock *operationLock;
  uint64_t v8;
  NSArray *dependencies;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  NSSet *dependencySet;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXRunNode;
  v5 = -[PXRunNode init](&v15, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    operationLock = v5->__operationLock;
    v5->__operationLock = v6;

    if (v4)
    {
      v8 = objc_msgSend(v4, "copy");
      dependencies = v5->_dependencies;
      v5->_dependencies = (NSArray *)v8;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v5->_dependencies;
      v5->_dependencies = (NSArray *)v11;

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    }
    v10 = objc_claimAutoreleasedReturnValue();
    dependencySet = v5->__dependencySet;
    v5->__dependencySet = (NSSet *)v10;

  }
  return v5;
}

- (id)newOperation
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11277;
  v9 = __Block_byref_object_dispose__11278;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__PXRunNode_newOperation__block_invoke;
  v4[3] = &unk_1E51181A0;
  v4[4] = self;
  v4[5] = &v5;
  -[PXRunNode _performChangesToOperation:](self, "_performChangesToOperation:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_performChangesToOperation:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v4 = (void (**)(id, id))a3;
  -[PXRunNode _operationLock](self, "_operationLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  v4[2](v4, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_operation, v6);
  -[PXRunNode _operationLock](self, "_operationLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (unint64_t)state
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __18__PXRunNode_state__block_invoke;
  v4[3] = &unk_1E51181C8;
  v4[4] = &v5;
  -[PXRunNode _performChangesToOperation:](self, "_performChangesToOperation:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isWaiting
{
  return -[PXRunNode state](self, "state") == 0;
}

- (BOOL)isRunning
{
  return -[PXRunNode state](self, "state") == 1;
}

- (BOOL)isCanceled
{
  return -[PXRunNode state](self, "state") == 2;
}

- (BOOL)isComplete
{
  return -[PXRunNode state](self, "state") == 3;
}

- (void)complete
{
  -[PXRunNode completeWithError:](self, "completeWithError:", 0);
}

- (void)completeWithError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  -[PXRunNode delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__PXRunNode_completeWithError___block_invoke;
  v6[3] = &unk_1E51181C8;
  v6[4] = &v7;
  -[PXRunNode _performChangesToOperation:](self, "_performChangesToOperation:", v6);
  if (*((_BYTE *)v8 + 24) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "runNode:didCompleteWithError:", self, v4);
  _Block_object_dispose(&v7, 8);

}

- (void)run
{
  void *v4;

  if ((-[PXRunNode isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRunNode.m"), 153, CFSTR("%@ should override %s"), objc_opt_class(), "-[PXRunNode run]");

  }
  -[PXRunNode complete](self, "complete");
}

- (void)cancel
{
  -[PXRunNode cancelWithError:](self, "cancelWithError:", 0);
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  -[PXRunNode delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PXRunNode_cancelWithError___block_invoke;
  v7[3] = &unk_1E51181C8;
  v7[4] = &v8;
  -[PXRunNode _performChangesToOperation:](self, "_performChangesToOperation:", v7);
  if (*((_BYTE *)v9 + 24))
  {
    -[PXRunNode didCancel](self, "didCancel");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PXRunNode delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "runNode:didCancelWithError:", self, v4);

    }
  }
  _Block_object_dispose(&v8, 8);

}

- (NSArray)dependencies
{
  return self->_dependencies;
}

- (PXRunNodeDelegate)delegate
{
  return (PXRunNodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)_dependencySet
{
  return self->__dependencySet;
}

- (NSLock)_operationLock
{
  return self->__operationLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__operationLock, 0);
  objc_storeStrong((id *)&self->__dependencySet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_destroyWeak((id *)&self->_operation);
}

id __29__PXRunNode_cancelWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "cancelIfAble");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

id __31__PXRunNode_completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "completeIfAble");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

id __18__PXRunNode_state__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "state");
  return v4;
}

id __25__PXRunNode_newOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  PXRunNodeOperation *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (!v3 || (v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v5 = -[PXRunNodeOperation initWithRunNode:]([PXRunNodeOperation alloc], "initWithRunNode:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v3 = v8;
  }
  return v3;
}

+ (id)_defaultNodeRunnerWithQualityOfService:(int64_t)a3
{
  void *v4;
  void *v5;
  PXNodeRunner *v6;
  void *v7;
  void *v8;

  if (_defaultNodeRunnerWithQualityOfService__onceToken != -1)
    dispatch_once(&_defaultNodeRunnerWithQualityOfService__onceToken, &__block_literal_global_11290);
  v4 = (void *)_defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (PXNodeRunner *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(PXNodeRunner);
    -[PXNodeRunner setQualityOfService:](v6, "setQualityOfService:", a3);
    v7 = (void *)_defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  return v6;
}

+ (void)processGraphForRunNode:(id)a3
{
  objc_msgSend(a1, "processGraphForRunNode:withQualityOfService:", a3, -1);
}

+ (void)processGraphForRunNode:(id)a3 withQualityOfService:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_defaultNodeRunnerWithQualityOfService:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processGraphForRunNode:", v5);

}

void __52__PXRunNode__defaultNodeRunnerWithQualityOfService___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS;
  _defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS = (uint64_t)v0;

}

@end
