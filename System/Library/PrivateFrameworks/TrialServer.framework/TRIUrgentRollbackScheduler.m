@implementation TRIUrgentRollbackScheduler

- (TRIUrgentRollbackScheduler)initWithExperimentDatabase:(id)a3 taskQueue:(id)a4
{
  id v7;
  id v8;
  TRIUrgentRollbackScheduler *v9;
  TRIUrgentRollbackScheduler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIUrgentRollbackScheduler;
  v9 = -[TRIUrgentRollbackScheduler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_experimentDatabase, a3);
  }

  return v10;
}

- (id)_validRollbackDeploymentsForRollbackExperiment:(id)a3 deploymentIds:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__TRIUrgentRollbackScheduler__validRollbackDeploymentsForRollbackExperiment_deploymentIds___block_invoke;
  v16[3] = &unk_1E9332EF8;
  v17 = v6;
  v18 = v7;
  v19 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  v12 = (void *)MEMORY[0x1D8232C48](v16);
  -[TRIUrgentRollbackScheduler experimentDatabase](self, "experimentDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumerateActiveExperimentRecordsWithVisibility:block:", 3, v12);

  v14 = (void *)objc_msgSend(v9, "copy");
  return v14;
}

void __91__TRIUrgentRollbackScheduler__validRollbackDeploymentsForRollbackExperiment_deploymentIds___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "experimentDeployment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", a1[4]);

  v6 = (void *)a1[5];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15, "experimentDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "deploymentId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "containsObject:", v9);

  if (v5 && v10)
  {
    v11 = (void *)a1[6];
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "experimentDeployment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "deploymentId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

  }
}

- (void)scheduleUrgentRollbackForExperiment:(id)a3 deploymentIds:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIUrgentRollbackScheduler.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIUrgentRollbackScheduler.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentIds"));

LABEL_3:
  -[TRIUrgentRollbackScheduler _validRollbackDeploymentsForRollbackExperiment:deploymentIds:](self, "_validRollbackDeploymentsForRollbackExperiment:deploymentIds:", v7, v9);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v7, objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "intValue"), 0, 0, 1, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIUrgentRollbackScheduler queue](self, "queue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRITaskQueuingOptions optionsWithDuplicateTaskResolution:](TRITaskQueuingOptions, "optionsWithDuplicateTaskResolution:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTask:options:", v14, v16);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

}

- (TRITaskQueuing)queue
{
  return self->_queue;
}

- (TRIExperimentDatabase)experimentDatabase
{
  return self->_experimentDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentDatabase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
