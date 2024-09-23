@implementation TRIExperimentBaseTask

- (void)logAsRollout:(BOOL)a3
{
  _PASLock *lock;
  _QWORD v4[4];
  BOOL v5;

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__TRIExperimentBaseTask_logAsRollout___block_invoke;
  v4[3] = &__block_descriptor_33_e42_v16__0__TRIExperimentBaseTaskGuardedData_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

uint64_t __38__TRIExperimentBaseTask_logAsRollout___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 32) = *(_BYTE *)(result + 32);
  return result;
}

- (TRIExperimentBaseTask)initWithExperiment:(id)a3
{
  id v5;
  TRIExperimentBaseTask *v6;
  uint64_t v7;
  TRIExperimentDeployment *experiment;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _PASLock *lock;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExperimentBaseTask.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

  }
  v17.receiver = self;
  v17.super_class = (Class)TRIExperimentBaseTask;
  v6 = -[TRIExperimentBaseTask init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    experiment = v6->_experiment;
    v6->_experiment = (TRIExperimentDeployment *)v7;

    v9 = objc_opt_new();
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

    v11 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = 0;

    v12 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = 0;

    *(_BYTE *)(v9 + 32) = 0;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v9);
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v13;

  }
  return v6;
}

- (id)tags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nextTasksForRunStatus:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 3)
    return 0;
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v5, objc_msgSend(v6, "deploymentId"), 0, 23, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)containerForFirstNamespaceInExperimentWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "experimentDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentRecordWithExperimentDeployment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "namespaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "namespaceDatabase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dynamicNamespaceRecordWithNamespaceName:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "appContainer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRIExperimentBaseTask *v4;
  TRIExperimentBaseTask *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (TRIExperimentBaseTask *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TRIExperimentBaseTask;
    if (-[TRIBaseTask isEqual:](&v10, sel_isEqual_, v4))
    {
      v5 = v4;
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](v5, "experiment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToDeployment:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TRIExperimentBaseTask;
  v3 = -[TRIBaseTask hash](&v13, sel_hash);
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = 0;
  }

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasDeploymentId"))
  {
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (int)objc_msgSend(v10, "deploymentId");

  }
  else
  {
    v11 = -2;
  }

  return v11 + 37 * (v8 + 37 * v3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v7[2] = __35__TRIExperimentBaseTask_addMetric___block_invoke;
  v7[3] = &unk_1E9330188;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __35__TRIExperimentBaseTask_addMetric___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __38__TRIExperimentBaseTask_addDimension___block_invoke;
  v7[3] = &unk_1E9330188;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __38__TRIExperimentBaseTask_addDimension___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __40__TRIExperimentBaseTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E9330188;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __40__TRIExperimentBaseTask_mergeTelemetry___block_invoke(uint64_t a1, id *location)
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__TRIExperimentBaseTask_metrics__block_invoke;
  v5[3] = &unk_1E93301B0;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__TRIExperimentBaseTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
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
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__3;
    v13 = __Block_byref_object_dispose__3;
    lock = self->_lock;
    v14 = (id)MEMORY[0x1E0C9AA60];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__TRIExperimentBaseTask_dimensions__block_invoke;
    v8[3] = &unk_1E93301B0;
    v8[4] = &v9;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __35__TRIExperimentBaseTask_dimensions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(a2 + 16))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "arrayByAddingObjectsFromArray:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)trialSystemTelemetry
{
  void *v3;
  void *v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  lock = self->_lock;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__TRIExperimentBaseTask_trialSystemTelemetry__block_invoke;
  v9[3] = &unk_1E93301D8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  objc_autoreleasePoolPop(v3);
  return v7;
}

void __45__TRIExperimentBaseTask_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;

  v13 = a2;
  v3 = (void *)v13[3];
  if (v3)
    v4 = objc_msgSend(v3, "copy");
  else
    v4 = objc_opt_new();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (objc_msgSend(*(id *)(a1 + 32), "hasDeploymentId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "deploymentId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setClientDeploymentId:", v8);

  }
  v9 = *((unsigned __int8 *)v13 + 32);
  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v9)
  {
    objc_msgSend(v11, "ensureRolloutFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClientRolloutId:", v10);
  }
  else
  {
    objc_msgSend(v11, "ensureExperimentFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClientExperimentId:", v10);
  }

}

- (TRIExperimentDeployment)experiment
{
  return self->_experiment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
