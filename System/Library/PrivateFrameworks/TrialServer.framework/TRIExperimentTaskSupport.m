@implementation TRIExperimentTaskSupport

- (TRIExperimentTaskSupport)initWithExperimentDeployment:(id)a3
{
  id v5;
  TRIExperimentTaskSupport *v6;
  TRIExperimentTaskSupport *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _PASLock *lock;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIExperimentTaskSupport;
  v6 = -[TRIExperimentTaskSupport init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_experimentDeployment, a3);
    v8 = objc_opt_new();
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = 0;

    v10 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = 0;

    *(_BYTE *)(v8 + 32) = 0;
    v11 = objc_opt_new();
    v12 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v13;

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
  -[TRIExperimentDeployment taskTag](self->_experimentDeployment, "taskTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[TRIExperimentDeployment experimentId](self->_experimentDeployment, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setIdentifyTelemetryAsV1Rollout:(BOOL)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__TRIExperimentTaskSupport_setIdentifyTelemetryAsV1Rollout___block_invoke;
  v4[3] = &__block_descriptor_33_e45_v16__0__TRIExperimentTaskSupportGuardedData_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

uint64_t __60__TRIExperimentTaskSupport_setIdentifyTelemetryAsV1Rollout___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 32) = *(_BYTE *)(result + 32);
  return result;
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
  v7[2] = __38__TRIExperimentTaskSupport_addMetric___block_invoke;
  v7[3] = &unk_1E932FEC0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __38__TRIExperimentTaskSupport_addMetric___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __41__TRIExperimentTaskSupport_addDimension___block_invoke;
  v7[3] = &unk_1E932FEC0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __41__TRIExperimentTaskSupport_addDimension___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __43__TRIExperimentTaskSupport_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E932FEC0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __43__TRIExperimentTaskSupport_mergeTelemetry___block_invoke(uint64_t a1, id *location)
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
  v5[2] = __35__TRIExperimentTaskSupport_metrics__block_invoke;
  v5[3] = &unk_1E932FEE8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__TRIExperimentTaskSupport_metrics__block_invoke(uint64_t a1, uint64_t a2)
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
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  v4 = (void *)objc_opt_new();
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__TRIExperimentTaskSupport_dimensions__block_invoke;
  v10[3] = &unk_1E932FEC0;
  v11 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_autoreleasePoolPop(v3);
  return v8;
}

uint64_t __38__TRIExperimentTaskSupport_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:");
  return result;
}

- (id)trialSystemTelemetry
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
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
  v5[2] = __48__TRIExperimentTaskSupport_trialSystemTelemetry__block_invoke;
  v5[3] = &unk_1E932FF10;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__TRIExperimentTaskSupport_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  v10 = a2;
  v3 = (void *)v10[3];
  if (v3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasDeploymentId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deploymentId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setClientDeploymentId:", v5);

  }
  v6 = *((unsigned __int8 *)v10 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v8, "ensureRolloutFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientRolloutId:", v7);
  }
  else
  {
    objc_msgSend(v8, "ensureExperimentFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientExperimentId:", v7);
  }

}

- (TRIExperimentDeployment)experimentDeployment
{
  return self->_experimentDeployment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDeployment, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
