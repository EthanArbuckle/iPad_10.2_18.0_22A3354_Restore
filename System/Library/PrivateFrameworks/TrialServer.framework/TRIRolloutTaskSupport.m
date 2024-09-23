@implementation TRIRolloutTaskSupport

- (TRIRolloutTaskSupport)initWithRolloutDeployment:(id)a3
{
  id v5;
  TRIRolloutTaskSupport *v6;
  TRIRolloutTaskSupport *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TRIRolloutTaskSupport;
  v6 = -[TRIRolloutTaskSupport init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rolloutDeployment, a3);
    v8 = (_QWORD *)objc_opt_new();
    v9 = (void *)v8[1];
    v8[1] = 0;

    v10 = (void *)v8[2];
    v8[2] = 0;

    v11 = (void *)v8[3];
    v8[3] = 0;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v12;

  }
  return v7;
}

- (id)tags
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[TRIRolloutDeployment taskTag](self->_rolloutDeployment, "taskTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[TRIRolloutDeployment rolloutId](self->_rolloutDeployment, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addMetric:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__TRIRolloutTaskSupport_addMetric___block_invoke;
  v7[3] = &unk_1E932FF38;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __35__TRIRolloutTaskSupport_addMetric___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)a2[1];
  if (!v3)
  {
    v5 = a2;
    v6 = objc_opt_new();
    v7 = (void *)a2[1];
    a2[1] = v6;

    v3 = (void *)a2[1];
  }
  return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)addDimension:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__TRIRolloutTaskSupport_addDimension___block_invoke;
  v7[3] = &unk_1E932FF38;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __38__TRIRolloutTaskSupport_addDimension___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)a2[2];
  if (!v3)
  {
    v5 = a2;
    v6 = objc_opt_new();
    v7 = (void *)a2[2];
    a2[2] = v6;

    v3 = (void *)a2[2];
  }
  return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)mergeTelemetry:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__TRIRolloutTaskSupport_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E932FF38;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __40__TRIRolloutTaskSupport_mergeTelemetry___block_invoke(uint64_t a1, id *location)
{
  void *v3;
  id *v4;
  id v5;

  v5 = location[3];
  v4 = location + 3;
  v3 = v5;
  if (v5)
    objc_msgSend(v3, "mergeFrom:", *(_QWORD *)(a1 + 32));
  else
    objc_storeStrong(v4, *(id *)(a1 + 32));
}

- (id)metrics
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__TRIRolloutTaskSupport_metrics__block_invoke;
  v5[3] = &unk_1E932FF60;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__TRIRolloutTaskSupport_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)dimensions
{
  void *v3;
  void *v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  v4 = (void *)objc_opt_new();
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__TRIRolloutTaskSupport_dimensions__block_invoke;
  v8[3] = &unk_1E932FF38;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

uint64_t __35__TRIRolloutTaskSupport_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:");
  return result;
}

- (id)trialSystemTelemetry
{
  _PASLock *lock;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(MEMORY[0x1E0DC0FA8]);
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__TRIRolloutTaskSupport_trialSystemTelemetry__block_invoke;
  v6[3] = &unk_1E932FF88;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__TRIRolloutTaskSupport_trialSystemTelemetry__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a2 + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mergeFrom:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "rolloutId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ensureRolloutFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientRolloutId:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deploymentId"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setClientDeploymentId:", v5);

}

- (TRIRolloutDeployment)rolloutDeployment
{
  return self->_rolloutDeployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutDeployment, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
