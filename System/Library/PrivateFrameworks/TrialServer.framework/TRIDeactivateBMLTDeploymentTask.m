@implementation TRIDeactivateBMLTDeploymentTask

- (TRIDeactivateBMLTDeploymentTask)initWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v10;
  id v11;
  TRIDeactivateBMLTDeploymentTask *v12;
  TRIDeactivateBMLTDeploymentTask *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _PASLock *lock;
  const __CFString *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateBMLTDeploymentTask.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

  }
  v23.receiver = self;
  v23.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
  v12 = -[TRIDeactivateBMLTDeploymentTask init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bmltDeployment, a3);
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (a4 - 1 > 5)
        v21 = CFSTR("unknown");
      else
        v21 = *(&off_1E9336CD0 + a4 - 1);
      *(_DWORD *)buf = 138412290;
      v25 = v21;
      _os_log_debug_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEBUG, "Initializing TRIDeactivateBMLTDeploymentTask with trigger event: %@", buf, 0xCu);
    }

    v13->_triggerEvent = a4;
    objc_storeStrong((id *)&v13->_bmltBatchNotificationIdentifier, a5);
    v15 = (_QWORD *)objc_opt_new();
    v16 = (void *)v15[1];
    v15[1] = 0;

    v17 = (void *)v15[2];
    v15[2] = 0;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v15);
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v18;

  }
  return v13;
}

+ (id)taskWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v6, a4, 0);

  return v7;
}

+ (id)taskWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v9, a4, v8);

  return v10;
}

- (int)taskType
{
  return 32;
}

- (NSArray)tags
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[TRIBMLTDeployment taskTag](self->_bmltDeployment, "taskTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSString *bmltBatchNotificationIdentifier;
  _BOOL8 v12;
  TRITaskRunResult *v13;
  uint64_t v14;
  TRITaskRunResult *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  TRIDeactivateBMLTDeploymentTask *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v6 = a3;
  v7 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__61;
  v47 = __Block_byref_object_dispose__61;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__61;
  v41 = __Block_byref_object_dispose__61;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__61;
  v35 = __Block_byref_object_dispose__61;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __65__TRIDeactivateBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke;
  v20 = &unk_1E9336C38;
  v21 = self;
  v23 = &v27;
  v8 = v6;
  v22 = v8;
  v24 = &v37;
  v25 = &v43;
  v26 = &v31;
  v9 = (void *)MEMORY[0x1D8232C48](&v17);
  objc_msgSend(v8, "bmltDatabase", v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeTransactionWithFailableBlock:", v9);

  bmltBatchNotificationIdentifier = self->_bmltBatchNotificationIdentifier;
  if (bmltBatchNotificationIdentifier)
    notify_post(-[NSString UTF8String](bmltBatchNotificationIdentifier, "UTF8String"));
  if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", v32[5]);
    v12 = *((_BYTE *)v28 + 24) != 0;
  }
  else
  {
    v12 = 0;
  }
  -[TRIDeactivateBMLTDeploymentTask _deactivationTelemetryWithSuccess:bmltRecord:deactivatedFactorPackSetId:serverContext:](self, "_deactivationTelemetryWithSuccess:bmltRecord:deactivatedFactorPackSetId:serverContext:", v12, v44[5], v38[5], v8);
  v13 = [TRITaskRunResult alloc];
  if (*((_BYTE *)v28 + 24))
    v14 = 2;
  else
    v14 = 3;
  v15 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v13, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v14, 1, MEMORY[0x1E0C9AA60], 0);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v15;
}

uint64_t __65__TRIDeactivateBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  TRINamespaceResolverStorage *v33;
  void *v34;
  TRINamespaceResolverStorage *v35;
  unsigned __int8 *v36;
  unsigned __int8 *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v46;
  int v47;
  objc_class *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "bmltDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "deactivateTaskDeployment:deactivatedFactorPackSetId:usingTransaction:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40, v3);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "bmltDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taskRecordWithTaskDeployment:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (v4)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "status") == 1)
      {
        +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForBMLTArtifactWithDeployment:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "contentTracker");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "dropRefWithContentIdentifier:", v10);

        if ((v12 & 1) == 0)
        {
          TRILogCategory_Server();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v4, "backgroundMLTaskId");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v4, "deploymentId");
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v52 = v46;
            v53 = 1024;
            v54 = v47;
            v55 = 2114;
            v56 = v49;
            _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to decrement ref for BMLT deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

          }
        }

      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 40), "activationEventDatabase");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "backgroundMLTaskId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend(v4, "deploymentId"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend(v16, "osBuild");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrevOsBuild:", v18);

          objc_msgSend(v16, "regionCode");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrevRegionCode:", v19);

          objc_msgSend(v16, "languageCode");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrevLanguageCode:", v20);

          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v16, "languageCode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "regionCode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v16, "regionCode");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-%@"), v22, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-%@"), v22, &stru_1E9336E60);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v17, "setPrevBcp47DeviceLocale:", v25);
          objc_msgSend(v16, "carrierBundleIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrevCarrierBundleIdentifier:", v27);

          objc_msgSend(v16, "carrierCountryIsoCode");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrevCarrierCountryIsoCode:", v28);

          objc_msgSend(*(id *)(a1 + 32), "mergeTelemetry:", v17);
          objc_msgSend(*(id *)(a1 + 40), "activationEventDatabase");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "backgroundMLTaskId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v30, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), objc_msgSend(v4, "deploymentId"));

          if (!v31)
          {
            TRILogCategory_Server();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v4, "backgroundMLTaskId");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v52 = v50;
              _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Unable to clear record for deactivated BMLT: %{public}@", buf, 0xCu);

            }
          }

        }
      }
    }
    v33 = [TRINamespaceResolverStorage alloc];
    objc_msgSend(*(id *)(a1 + 40), "paths");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TRINamespaceResolverStorage initWithPaths:](v33, "initWithPaths:", v34);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[TRINamespaceResolverStorage overwriteActiveFactorProvidersUsingTransaction:fromContext:](v35, "overwriteActiveFactorProvidersUsingTransaction:fromContext:", v3, *(_QWORD *)(a1 + 40));
    v36 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v37 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    else
      v37 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    if (v4)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v37 = (unsigned __int8 *)MEMORY[0x1E0D81678];
        if (v38)
        {
          objc_msgSend(v38, "artifact");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "backgroundTask");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "selectedNamespace");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "name");
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v44 = *(void **)(v43 + 40);
          *(_QWORD *)(v43 + 40) = v42;

          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            v37 = v36;
        }
      }
    }
    v26 = *v37;

  }
  else
  {
    v26 = *MEMORY[0x1E0D81680];
  }

  return v26;
}

- (void)_deactivationTelemetryWithSuccess:(BOOL)a3 bmltRecord:(id)a4 deactivatedFactorPackSetId:(id)a5 serverContext:(id)a6
{
  _BOOL8 v8;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v8 = a3;
  v10 = (void *)MEMORY[0x1E0DC0F08];
  v11 = self->_triggerEvent - 1;
  if (v11 > 5)
    v12 = CFSTR("unknown");
  else
    v12 = *(&off_1E9336CD0 + v11);
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(v10, "metricWithName:categoricalValue:", CFSTR("trigger_event"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDeactivateBMLTDeploymentTask addMetric:](self, "addMetric:", v16);

  -[TRIBMLTDeployment backgroundMLTaskId](self->_bmltDeployment, "backgroundMLTaskId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v17, -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId"), 2, v8);

  -[TRIBMLTDeployment backgroundMLTaskId](self->_bmltDeployment, "backgroundMLTaskId");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId");
  if (v8)
    v19 = 10;
  else
    v19 = 9;
  +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:](TRITaskUtils, "updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:", v19, v20, v18, v14, v15, v13);

}

- (BOOL)isEqual:(id)a3
{
  TRIDeactivateBMLTDeploymentTask *v4;
  char v5;
  objc_super v7;

  v4 = (TRIDeactivateBMLTDeploymentTask *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
    if (-[TRIBaseTask isEqual:](&v7, sel_isEqual_, v4)
      && -[TRIDeactivateBMLTDeploymentTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = -[TRIBMLTDeployment isEqualToDeployment:](self->_bmltDeployment, "isEqualToDeployment:", v4->_bmltDeployment);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
  v3 = -[TRIBaseTask hash](&v5, sel_hash);
  return -[TRIBMLTDeployment hash](self->_bmltDeployment, "hash") + 37 * v3;
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
  v7[2] = __45__TRIDeactivateBMLTDeploymentTask_addMetric___block_invoke;
  v7[3] = &unk_1E9336C60;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __45__TRIDeactivateBMLTDeploymentTask_addMetric___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __50__TRIDeactivateBMLTDeploymentTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E9336C60;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __50__TRIDeactivateBMLTDeploymentTask_mergeTelemetry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  v3 = (void *)v6[2];
  if (v3)
  {
    objc_msgSend(v3, "mergeFrom:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = (void *)v6[2];
    v6[2] = v4;

  }
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
  v9 = __Block_byref_object_copy__61;
  v10 = __Block_byref_object_dispose__61;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__TRIDeactivateBMLTDeploymentTask_metrics__block_invoke;
  v5[3] = &unk_1E9336C88;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__TRIDeactivateBMLTDeploymentTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
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

- (id)trialSystemTelemetry
{
  void *v3;
  _PASLock *lock;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__61;
  v12 = __Block_byref_object_dispose__61;
  v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__TRIDeactivateBMLTDeploymentTask_trialSystemTelemetry__block_invoke;
  v7[3] = &unk_1E9336CB0;
  v7[4] = self;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  objc_autoreleasePoolPop(v3);
  return v5;
}

void __55__TRIDeactivateBMLTDeploymentTask_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;

  v11 = a2;
  v3 = (void *)v11[2];
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC0FA8]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "backgroundMLTaskId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ensureBMLTFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClientBmltId:", v9);

}

- (id)dimensions
{
  return 0;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  unint64_t triggerEvent;

  v3 = (void *)objc_opt_new();
  -[TRIBMLTDeployment backgroundMLTaskId](self->_bmltDeployment, "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundMlTaskId:", v4);

  objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId"));
  triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 6)
    objc_msgSend(v3, "setTriggerEvent:", (triggerEvent + 1));
  if (self->_bmltBatchNotificationIdentifier)
    objc_msgSend(v3, "setBmltBatchNotificationId:");
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIDeactivateBMLTDeploymentTask _asPersistedTask](self, "_asPersistedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateBMLTDeploymentTask.m"), 348, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  +[TRIPBMessage parseFromData:error:](TRIDeactivateBMLTDeploymentPersistedTask, "parseFromData:error:", a3, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (!v4)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIDeactivateBMLTDeploymentPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "hasBackgroundMlTaskId") & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v23;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: backgroundMlTaskId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    v18 = "Cannot decode message of type %@ with missing field: backgroundMlTaskId";
    goto LABEL_20;
  }
  objc_msgSend(v4, "backgroundMlTaskId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      v18 = "Cannot decode message of type %@ with field of length 0: backgroundMlTaskId";
LABEL_20:
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

    }
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  if ((objc_msgSend(v4, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      v18 = "Cannot decode message of type %@ with missing field: deploymentId";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v8 = objc_msgSend(v4, "triggerEvent") - 2;
  if (v8 < 6)
    v9 = v8 + 1;
  else
    v9 = 0;
  v10 = (void *)MEMORY[0x1E0DC09A8];
  objc_msgSend(v4, "backgroundMlTaskId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deploymentWithBackgroundMLTaskId:deploymentId:", v11, objc_msgSend(v4, "deploymentId"));
  v12 = objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasBmltBatchNotificationId") & 1) != 0)
  {
    objc_msgSend(v4, "bmltBatchNotificationId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v12, v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v12, v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v14;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIBMLTDeployment shortDesc](self->_bmltDeployment, "shortDesc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDeactivateBMLTDeploymentTask)initWithCoder:(id)a3
{
  id v4;
  TRIDeactivateBMLTDeploymentTask *v5;
  void *v6;
  TRIDeactivateBMLTDeploymentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
  v5 = -[TRIDeactivateBMLTDeploymentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIDeactivateBMLTDeploymentTask *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateBMLTDeploymentTask.m"), 407, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIDeactivateBMLTDeploymentTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
}

@end
