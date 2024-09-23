@implementation PXAutoloopVideoTask

- (PXAutoloopVideoTask)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXAutoloopVideoTask;
  v2 = -[PXAutoloopVideoTask init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.PXAutoloopVideoTask.perform", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_queue_create("com.apple.PXAutoloopVideoTask.ivars", MEMORY[0x1E0C80D50]);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = (void *)MEMORY[0x1E0CB37E8];
    do
      v8 = __ldaxr((unsigned int *)&init_ivarQueueCounter);
    while (__stlxr(v8 + 1, (unsigned int *)&init_ivarQueueCounter));
    v9 = (void *)objc_msgSend(v7, "numberWithInt:");
    *((_QWORD *)v2 + 3) = v9;
    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), (const void *)PXAutoloopVideoTaskIvarQueueContext, v9, 0);
    objc_storeWeak((id *)v2 + 4, 0);
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 6) = 0;
  }
  return (PXAutoloopVideoTask *)v2;
}

- (void)_reset
{
  -[PXAutoloopVideoTask setStatus:](self, "setStatus:", 0);
  -[PXAutoloopVideoTask setProgress:](self, "setProgress:", 0.0);
  -[PXAutoloopVideoTask setError:](self, "setError:", 0);
}

- (void)runWithInput:(id)a3
{
  id v4;
  NSObject *performQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (-[PXAutoloopVideoTask _isRunning](self, "_isRunning"))
    -[PXAutoloopVideoTask cancel](self, "cancel");
  -[PXAutoloopVideoTask _reset](self, "_reset");
  -[PXAutoloopVideoTask setStatus:](self, "setStatus:", 2);
  objc_initWeak(&location, self);
  performQueue = self->_performQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PXAutoloopVideoTask_runWithInput___block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(performQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)performTaskWithInput:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAutoloopVideoTask.m"), 72, CFSTR("The method %@ in %@ must be overridden."), v5, v7);

}

- (void)cancel
{
  -[PXAutoloopVideoTask setStatus:](self, "setStatus:", 3);
}

- (PXAutoloopVideoTaskDelegate)delegate
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
  v8 = __Block_byref_object_copy__49186;
  v9 = __Block_byref_object_dispose__49187;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__PXAutoloopVideoTask_delegate__block_invoke;
  v4[3] = &unk_1E5148AA8;
  v4[4] = self;
  v4[5] = &v5;
  -[PXAutoloopVideoTask _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PXAutoloopVideoTaskDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PXAutoloopVideoTask delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__PXAutoloopVideoTask_setDelegate___block_invoke;
    v6[3] = &unk_1E5148D08;
    v6[4] = self;
    v7 = v4;
    -[PXAutoloopVideoTask _performIvarWrite:](self, "_performIvarWrite:", v6);

  }
}

- (void)setTemporaryFilesDirectory:(id)a3
{
  NSString *v4;
  NSString *temporaryFilesDirectory;
  BOOL v6;
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_temporaryFilesDirectory;
  temporaryFilesDirectory = v8;
  if (v4 == v8)
    goto LABEL_4;
  v6 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

  if (!v6)
  {
    v7 = (NSString *)-[NSString copy](v8, "copy");
    temporaryFilesDirectory = self->_temporaryFilesDirectory;
    self->_temporaryFilesDirectory = v7;
LABEL_4:

  }
}

- (NSError)error
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
  v8 = __Block_byref_object_copy__49186;
  v9 = __Block_byref_object_dispose__49187;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PXAutoloopVideoTask_error__block_invoke;
  v4[3] = &unk_1E5148AA8;
  v4[4] = self;
  v4[5] = &v5;
  -[PXAutoloopVideoTask _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

- (void)setError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[PXAutoloopVideoTask error](self, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__PXAutoloopVideoTask_setError___block_invoke;
    v6[3] = &unk_1E5148D08;
    v6[4] = self;
    v7 = v4;
    -[PXAutoloopVideoTask _performIvarWrite:](self, "_performIvarWrite:", v6);

  }
}

- (double)progress
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__PXAutoloopVideoTask_progress__block_invoke;
  v4[3] = &unk_1E5148AA8;
  v4[4] = self;
  v4[5] = &v5;
  -[PXAutoloopVideoTask _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setProgress:(double)a3
{
  double v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[6];

  -[PXAutoloopVideoTask progress](self, "progress");
  if (v5 != a3)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__PXAutoloopVideoTask_setProgress___block_invoke;
    v13[3] = &unk_1E5144EB8;
    v13[4] = self;
    *(double *)&v13[5] = a3;
    -[PXAutoloopVideoTask _performIvarWrite:](self, "_performIvarWrite:", v13);
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __35__PXAutoloopVideoTask_setProgress___block_invoke_2;
    v8[3] = &unk_1E5148AA8;
    v8[4] = self;
    v8[5] = &v9;
    -[PXAutoloopVideoTask _performIvarRead:](self, "_performIvarRead:", v8);
    if (*((_BYTE *)v10 + 24))
    {
      -[PXAutoloopVideoTask delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "autoloopVideoTaskProgressDidChange:", self);

    }
    _Block_object_dispose(&v9, 8);
  }
}

- (int64_t)status
{
  int64_t v2;
  _QWORD v4[6];
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
  v4[2] = __29__PXAutoloopVideoTask_status__block_invoke;
  v4[3] = &unk_1E5148AA8;
  v4[4] = self;
  v4[5] = &v5;
  -[PXAutoloopVideoTask _performIvarRead:](self, "_performIvarRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setStatus:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[6];

  if (-[PXAutoloopVideoTask status](self, "status") != a3)
  {
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__PXAutoloopVideoTask_setStatus___block_invoke;
    v12[3] = &unk_1E5144EB8;
    v12[4] = self;
    v12[5] = a3;
    -[PXAutoloopVideoTask _performIvarWrite:](self, "_performIvarWrite:", v12);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __33__PXAutoloopVideoTask_setStatus___block_invoke_2;
    v7[3] = &unk_1E5148AA8;
    v7[4] = self;
    v7[5] = &v8;
    -[PXAutoloopVideoTask _performIvarRead:](self, "_performIvarRead:", v7);
    if (*((_BYTE *)v9 + 24))
    {
      -[PXAutoloopVideoTask delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "autoloopVideoTaskStatusDidChange:", self);

    }
    _Block_object_dispose(&v8, 8);
  }
}

- (BOOL)_isRunning
{
  return -[PXAutoloopVideoTask status](self, "status") == 2;
}

- (BOOL)_isOnIvarQueue
{
  return dispatch_get_specific((const void *)PXAutoloopVideoTaskIvarQueueContext) == self->_ivarQueueIdentifier;
}

- (void)_performIvarRead:(id)a3
{
  id v4;
  BOOL v5;
  dispatch_block_t block;

  v4 = a3;
  block = v4;
  if (self->_ivarQueue && (v5 = -[PXAutoloopVideoTask _isOnIvarQueue](self, "_isOnIvarQueue"), v4 = block, !v5))
    dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
  else
    (*((void (**)(id))v4 + 2))(v4);

}

- (void)_performIvarWrite:(id)a3
{
  NSObject *ivarQueue;

  ivarQueue = self->_ivarQueue;
  if (ivarQueue)
    dispatch_barrier_sync(ivarQueue, a3);
  else
    (*((void (**)(id))a3 + 2))(a3);
}

- (NSString)temporaryFilesDirectory
{
  return self->_temporaryFilesDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFilesDirectory, 0);
  objc_storeStrong((id *)&self->_ivarQueue_error, 0);
  objc_destroyWeak((id *)&self->_ivarQueue_delegate);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_performQueue, 0);
}

uint64_t __33__PXAutoloopVideoTask_setStatus___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __33__PXAutoloopVideoTask_setStatus___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 65);
  return result;
}

uint64_t __29__PXAutoloopVideoTask_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

double __35__PXAutoloopVideoTask_setProgress___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

uint64_t __35__PXAutoloopVideoTask_setProgress___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

double __31__PXAutoloopVideoTask_progress__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __32__PXAutoloopVideoTask_setError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

void __28__PXAutoloopVideoTask_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t __35__PXAutoloopVideoTask_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = objc_opt_respondsToSelector() & 1;
  result = objc_opt_respondsToSelector();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = result & 1;
  return result;
}

void __31__PXAutoloopVideoTask_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __36__PXAutoloopVideoTask_runWithInput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "performTaskWithInput:", *(_QWORD *)(a1 + 32));

}

@end
