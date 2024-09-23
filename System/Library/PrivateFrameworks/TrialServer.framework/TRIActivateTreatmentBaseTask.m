@implementation TRIActivateTreatmentBaseTask

- (TRIActivateTreatmentBaseTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 requiresTreatmentInstallation:(BOOL)a6
{
  TRIActivateTreatmentBaseTask *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIActivateTreatmentBaseTask;
  result = -[TRITreatmentBaseTask initWithExperiment:treatmentId:taskAttributing:](&v8, sel_initWithExperiment_treatmentId_taskAttributing_, a3, a4, a5);
  if (result)
    result->_requiresTreatmentInstallation = a6;
  return result;
}

- (id)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRefWithContentIdentifier:", v6);

  -[TRIExperimentBaseTask containerForFirstNamespaceInExperimentWithContext:](self, "containerForFirstNamespaceInExperimentWithContext:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:container:](TRIContentTracker, "contentIdentifierForTreatmentArtifactWithTreatmentId:container:", v8, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addRefWithContentIdentifier:", v9);
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIExperimentBaseTask containerForFirstNamespaceInExperimentWithContext:](self, "containerForFirstNamespaceInExperimentWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:container:](TRIContentTracker, "contentIdentifierForTreatmentArtifactWithTreatmentId:container:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dropRefWithContentIdentifier:", v7);

  if ((v9 & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v16;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for treatment %@.", (uint8_t *)&v19, 0xCu);

    }
  }

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dropRefWithContentIdentifier:", v12);

  if ((v14 & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shortDesc");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@.", (uint8_t *)&v19, 0xCu);

    }
  }

}

- (BOOL)_experimentRecord:(id)a3 hasConflictWithExperimentsInDatabase:(id)a4 conflictEndTime:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  TRIActivateTreatmentBaseTask *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  SEL v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "namespaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "_pas_leftFoldWithInitialObject:accumulate:", v12, &__block_literal_global_33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__56;
  v66 = __Block_byref_object_dispose__56;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__56;
  v60 = __Block_byref_object_dispose__56;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__56;
  v54 = __Block_byref_object_dispose__56;
  v55 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_17;
  v41[3] = &unk_1E9336930;
  v14 = v9;
  v42 = v14;
  v45 = &v62;
  v15 = v13;
  v46 = &v68;
  v47 = &v56;
  v48 = &v50;
  v49 = a2;
  v43 = v15;
  v44 = self;
  v16 = (void *)MEMORY[0x1D8232C48](v41);
  v17 = (void *)MEMORY[0x1D8232A5C]();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E9364050, &unk_1E9364068, 0);
  objc_autoreleasePoolPop(v17);
  if ((objc_msgSend(v14, "isShadow") & 1) == 0
    && objc_msgSend(v14, "type") != 3
    && (objc_msgSend(v10, "enumerateExperimentRecordsMatchingStatuses:block:", v18, v16) & 1) == 0)
  {
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "experimentDeployment");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "shortDesc");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v33;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "unable to check if treatment can be activated for %{public}@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (*((_BYTE *)v69 + 24))
  {
    if (!v57[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentBaseTask.m"), 184, CFSTR("detected a conflict but experiment id is nil"));

    }
    if (!v51[5])
    {
      v22 = *a5;
      *a5 = 0;

      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "treatmentId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "experimentDeployment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "shortDesc");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v63[5], "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v57[5];
        *(_DWORD *)buf = 138413058;
        v73 = v37;
        v74 = 2114;
        v75 = v23;
        v76 = 2114;
        v77 = v25;
        v78 = 2114;
        v79 = v26;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for %{public}@: namespace %{public}@ is currently used in experiment %{public}@ which has no end date", buf, 0x2Au);

      }
      goto LABEL_20;
    }
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "treatmentId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "experimentDeployment");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "shortDesc");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v63[5], "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v57[5], "shortDesc");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v73 = v38;
      v74 = 2114;
      v75 = v35;
      v76 = 2114;
      v77 = v30;
      v78 = 2112;
      v79 = v31;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: namespace %{public}@ is currently used in experiment %@", buf, 0x2Au);

    }
    if (objc_msgSend(v14, "type") == 1)
    {
      v20 = *a5;
      *a5 = 0;
LABEL_20:

      v21 = 1;
      goto LABEL_21;
    }
    v27 = (id)v51[5];
LABEL_19:
    v20 = *a5;
    *a5 = v27;
    goto LABEL_20;
  }
  v21 = 0;
LABEL_21:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  return v21;
}

id __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a2;
  objc_msgSend(a3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

void __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_17(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "experimentDeployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "experimentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0 && (objc_msgSend(v5, "isShadow") & 1) == 0)
  {
    objc_msgSend(v5, "namespaces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "namespaces");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_18;
      v40[3] = &unk_1E9334C20;
      v41 = *(id *)(a1 + 40);
      objc_msgSend(v12, "_pas_filteredArrayWithTest:", v40);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count")
        && objc_msgSend(v5, "type") != 3
        && objc_msgSend(v5, "type") == 1
        && objc_msgSend(v5, "status") == 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        objc_msgSend(v5, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
          if (!v17
            || (objc_msgSend(v5, "endDate"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v17, "compare:", v18),
                v18,
                v19 == -1))
          {
            objc_msgSend(v5, "experimentDeployment");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = v24;

            objc_msgSend(v5, "endDate");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
            v29 = *(void **)(v28 + 40);
            *(_QWORD *)(v28 + 40) = v27;

          }
          else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), CFSTR("TRIActivateTreatmentBaseTask.m"), 159, CFSTR("expected end date of conflicting experiment to be non-nil here"));

          }
        }
        else
        {
          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "experimentDeployment");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "shortDesc");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "shortDesc");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v43 = v37;
            v44 = 2112;
            v45 = v39;
            _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "active experiment %@ has no end date, which prevents treatment for %@ from getting activated", buf, 0x16u);

          }
          objc_msgSend(v5, "experimentDeployment");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v33 = *(void **)(v32 + 40);
          *(_QWORD *)(v32 + 40) = v31;

          v34 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v35 = *(void **)(v34 + 40);
          *(_QWORD *)(v34 + 40) = 0;

          *a3 = 1;
        }
      }
      v21 = v41;
    }
    else
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "experimentDeployment");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDesc");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v23;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "experiment record for %{public}@ is missing namespaces", buf, 0xCu);

      }
    }

  }
}

uint64_t __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)_writeNamespaceDescriptorsWithPaths:(id)a3 toTreatmentLayer:(unint64_t)a4 forExperiment:(id)a5 treatmentURLs:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  __int128 v70;
  BOOL v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v80;
  id obj;
  id v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _QWORD v98[2];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v83 = a7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v11, "namespaces");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v11, "namespaces");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v11, "namespaces");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
  v21 = v19 == 0;
  v85 = v19;
  if (v19)
  {
    obj = v18;
    v73 = v19 == 0;
    v74 = v11;
    v22 = *(_QWORD *)v94;
    v84 = 1;
    *(_QWORD *)&v20 = 138543618;
    v70 = v20;
    v76 = v10;
    v78 = v12;
    v79 = *(_QWORD *)v94;
    while (2)
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v94 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v23);
        objc_msgSend(v24, "name", v70);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = v12;
          v27 = v10;
          v28 = v10;
          objc_msgSend(v83, "namespaceDatabase");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "dynamicNamespaceRecordWithNamespaceName:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v88 = v31;
          if (v31
            && (objc_msgSend(v31, "appContainer"),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v32,
                v32))
          {
            objc_msgSend(v31, "appContainer");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "pathsForContainer:asClientProcess:", v33, 0);
            v34 = objc_claimAutoreleasedReturnValue();

            v28 = (id)v34;
            v10 = v27;
            if (!v34)
            {
              TRILogCategory_Server();
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
              v12 = v26;
              if (v59)
              {
                objc_msgSend(v88, "appContainer");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "identifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v100 = v69;
                _os_log_error_impl(&dword_1D207F000, v58, OS_LOG_TYPE_ERROR, "Can't write descriptor for dynamic namespace to missing container: %{public}@", buf, 0xCu);

              }
              goto LABEL_45;
            }
          }
          else
          {
            v10 = v27;
          }
          v86 = v28;
          objc_msgSend(v28, "namespaceDescriptorsPathForLayer:", a4);
          v12 = v26;
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v87)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentBaseTask.m"), 240, CFSTR("namespace descriptor directory is NIL"));

          }
          objc_msgSend(v24, "name");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(v36, "triPathAsOwner:", 0);
            v37 = objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              v38 = v37;
              if ((-[NSObject isAbsolutePath](v37, "isAbsolutePath") & 1) != 0)
              {
                v39 = v38;
              }
              else
              {
                objc_msgSend(v28, "containerDir");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v75 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v28, "containerDir");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v98[0] = v42;
                  v98[1] = v38;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "pathWithComponents:", v43);
                  v39 = objc_claimAutoreleasedReturnValue();

                  v12 = v78;
                }
                else
                {
                  v39 = v38;
                }

              }
              if ((objc_msgSend(v80, "fileExistsAtPath:", v39) & 1) != 0)
              {
                if (v88)
                {
                  objc_msgSend(v88, "appContainer");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v88, "cloudKitContainer");
                }
                else
                {
                  v44 = 0;
                  v45 = 1;
                }
                v47 = (void *)objc_opt_new();
                objc_msgSend(v47, "setFactorsURL:", v36);
                objc_msgSend(v47, "setAppContainer:", v44);
                objc_msgSend(v47, "setCloudKitContainerId:", v45);
                v48 = objc_alloc(MEMORY[0x1E0DC0AD8]);
                objc_msgSend(v24, "name");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = (void *)objc_msgSend(v48, "initWithNamespaceName:downloadNCV:optionalParams:", v49, objc_msgSend(v24, "compatibilityVersion"), v47);

                objc_msgSend(v77, "addObject:", v50);
                objc_msgSend(v17, "addObject:", v87);
                v84 &= objc_msgSend(v50, "saveToDirectory:", v87);

                v40 = 1;
                v10 = v76;
                v12 = v78;
              }
              else
              {
                TRILogCategory_Server();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v74, "experimentDeployment");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "shortDesc");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "name");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v70;
                  v100 = v55;
                  v101 = 2114;
                  v102 = v56;
                  _os_log_error_impl(&dword_1D207F000, v46, OS_LOG_TYPE_ERROR, "treatment file does not exist for experiment %{public}@ on namespace %{public}@", buf, 0x16u);

                  v12 = v78;
                }

                v40 = 0;
                v84 = 0;
              }
              v22 = v79;
            }
            else
            {
              TRILogCategory_Server();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v74, "experimentDeployment");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "shortDesc");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "name");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v100 = v36;
                v101 = 2114;
                v102 = v52;
                v103 = 2114;
                v104 = v53;
                _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "can't resolve factorsPath for URL %@ from experiment %{public}@ on namespace %{public}@", buf, 0x20u);

                v12 = v78;
                v22 = v79;
              }
              v40 = 0;
              v84 = 0;
            }

          }
          else
          {
            v40 = 1;
          }

          if (!v40)
            goto LABEL_40;
        }
        else
        {
          v84 = 0;
        }
        ++v23;
      }
      while (v85 != v23);
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
      if (v85)
        continue;
      break;
    }
LABEL_40:

    if ((v84 & 1) != 0)
    {
      v21 = 1;
      v11 = v74;
      goto LABEL_55;
    }
LABEL_45:
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v18 = v77;
    v60 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
    if (v60)
    {
      v61 = v60;
      v62 = 0;
      v63 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v90 != v63)
            objc_enumerationMutation(v18);
          v65 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(v17, "objectAtIndexedSubscript:", v62 + i);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "removeFromDirectory:", v66);

        }
        v61 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        v62 += i;
      }
      while (v61);
      v10 = v76;
    }
    v11 = v74;
    v21 = v73;
  }

LABEL_55:
  return v21;
}

- (BOOL)updateLoggingWithExperimentRecord:(id)a3 paths:(id)a4 trackingId:(id)a5 newLogTreatmentAddedOut:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  char v63;
  void *v64;
  void *v66;
  void *v68;
  id obj;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  _QWORD v79[5];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  void *v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v74 = a4;
  objc_msgSend(v8, "artifact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "experiment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "projectId");

  v12 = (void *)objc_opt_new();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "experimentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExperimentId:", v14);

  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTreatmentId:", v15);

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDeploymentId:", objc_msgSend(v16, "deploymentId"));

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(v8, "namespaces");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v93 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)MEMORY[0x1E0DC0F18];
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i), "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addNamespaceId:", objc_msgSend(v22, "namespaceIdFromName:", v23));

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
    }
    while (v19);
  }
  v72 = v12;

  v24 = v74;
  +[TRILogTreatmentProvider providerWithProjectId:paths:](TRILogTreatmentProvider, "providerWithProjectId:paths:", v11, v74);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v8;
  objc_msgSend(v8, "namespaces");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v25;
  objc_msgSend(v25, "fetchRolloutLogNamespaces");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v27;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v73)
  {
    v70 = *(_QWORD *)v89;
    v71 = v28;
    do
    {
      for (j = 0; j != v73; ++j)
      {
        if (*(_QWORD *)v89 != v70)
          objc_enumerationMutation(obj);
        v30 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
        v31 = (void *)objc_opt_new();
        v32 = (void *)MEMORY[0x1E0DC0AD8];
        objc_msgSend(v24, "namespaceDescriptorsDefaultDir");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v30;
        objc_msgSend(v32, "loadWithNamespaceName:fromDirectory:", v30, v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v76 = (void *)v34;
        if (v34)
        {
          objc_msgSend(MEMORY[0x1E0DC0AE0], "factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:", v34, v24, 0, 0);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "factorLevels");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v85;
            do
            {
              for (k = 0; k != v37; ++k)
              {
                if (*(_QWORD *)v85 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
                objc_msgSend(v40, "factor");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v41, "hasName"))
                {
                  objc_msgSend(v41, "name");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "length");

                  if (v43)
                  {
                    objc_msgSend(v41, "name");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", v40, v44);

                  }
                }

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
            }
            while (v37);
          }

          v24 = v74;
        }
        else
        {
          v77 = 0;
        }
        objc_msgSend(MEMORY[0x1E0DC0AE0], "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v78, v24, 2, 0, 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "factorLevels");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v81;
          do
          {
            for (m = 0; m != v47; ++m)
            {
              if (*(_QWORD *)v81 != v48)
                objc_enumerationMutation(v45);
              v50 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * m);
              objc_msgSend(v50, "factor");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v51, "hasName"))
              {
                objc_msgSend(v51, "name");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "length");

                if (v53)
                {
                  objc_msgSend(v51, "name");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v50, v54);

                }
              }

            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
          }
          while (v47);
        }
        objc_msgSend(v31, "allValues");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "sortedArrayUsingComparator:", &__block_literal_global_48);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC0EC0], "hashForFactorLevels:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke_3;
        v79[3] = &unk_1E9336998;
        v79[4] = v78;
        v28 = v71;
        v58 = objc_msgSend(v71, "indexOfObjectPassingTest:", v79);
        if (v58 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v59 = 0;
        }
        else
        {
          objc_msgSend(v71, "objectAtIndexedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v24 = v74;
        v60 = objc_alloc_init(MEMORY[0x1E0DC0EE8]);
        objc_msgSend(v60, "setName:", v78);
        if (v57)
        {
          objc_msgSend(v60, "setHashData:", v57);
          objc_msgSend(v60, "setHashIncludesDefaults:", v77 != 0);
          TRILogCategory_Server();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v97 = v78;
            v98 = 2112;
            v99 = v57;
            _os_log_impl(&dword_1D207F000, v61, OS_LOG_TYPE_DEFAULT, "updated namespace %{public}@ with hash %@", buf, 0x16u);
          }

        }
        objc_msgSend(v59, "latestRolloutId");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setLatestRolloutId:", v62);

        objc_msgSend(v60, "setRolloutCount:", objc_msgSend(v59, "rolloutCount"));
        objc_msgSend(v72, "addNamespace:", v60);

      }
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v73);
  }

  if (a6)
    objc_storeStrong(a6, v72);
  v63 = objc_msgSend(v66, "addTreatment:", v72);
  if ((v63 & 1) == 0)
  {
    objc_msgSend(v72, "treatmentId");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "removeTreatment:", v64);

  }
  return v63;
}

uint64_t __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "factor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)runTaskUsingContext:(id)a3 experiment:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentBaseTask.m"), 376, CFSTR("method not implemented"));

  return +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, MEMORY[0x1E0C9AA60], 0);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  TRIActivateTreatmentBaseTask *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  v10 = (void *)os_transaction_create();
  if ((-[TRIActivateTreatmentBaseTask conformsToProtocol:](self, "conformsToProtocol:", &unk_1EFC7A788) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentBaseTask.m"), 387, CFSTR("TRIActivateTreatmentBaseTask subclass of type %@ is not a TRITask"), v21);

  }
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "taskTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelTasksWithTag:excludingTasks:", v12, v13);

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "experimentId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelTasksWithTag:excludingTasks:", v15, v16);

  -[TRIActivateTreatmentBaseTask runTaskUsingContext:](self, "runTaskUsingContext:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v17;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 3)
    return MEMORY[0x1E0C9AA60];
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

- (id)runTaskUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v37;
  double v38;
  double v39;
  NSObject *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BYTE buf[12];
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "experimentDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentRecordWithExperimentDeployment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "failed to retrieve experiment record from database", buf, 2u);
    }

    -[TRIActivateTreatmentBaseTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 1;
    v30 = v7;
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "type") == 3)
    -[TRIExperimentBaseTask logAsRollout:](self, "logAsRollout:", 1);
  v8 = (void *)objc_opt_new();
  TRIDeploymentEnvironment_EnumDescriptor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textFormatNameForValue:", objc_msgSend(v7, "deploymentEnvironment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)objc_msgSend(v7, "deploymentEnvironment"));
  objc_msgSend(v8, "setClientDeploymentEnv:", v10);
  -[TRIExperimentBaseTask mergeTelemetry:](self, "mergeTelemetry:", v8);

  objc_msgSend(v7, "treatmentId");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_8;
  v12 = (void *)v11;
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "treatmentId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
LABEL_8:
    objc_msgSend(v7, "treatmentId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "experimentDeployment");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "shortDesc");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "treatmentId");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v47;
        v59 = 2112;
        v60 = v48;
        v61 = 2112;
        v62 = v49;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "experiment %{public}@ already has treatment %@ assigned.  Overwriting with treatment %@", buf, 0x20u);

      }
    }
    objc_msgSend(v4, "experimentDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "experimentDeployment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "setTreatmentId:forExperimentDeployment:usingTransaction:", v19, v20, 0);

    if (!v21)
    {
      v30 = (void *)MEMORY[0x1E0C9AA60];
      v29 = 1;
LABEL_26:
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v29, 1, v30, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "copyWithReplacementTreatmentId:", v22);

    v7 = (void *)v23;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSince1970");
  v26 = v25;

  -[TRIActivateTreatmentBaseTask endTime](self, "endTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    -[TRIActivateTreatmentBaseTask endTime](self, "endTime");
  else
    objc_msgSend(v7, "endDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSince1970");
  v33 = v32;

  if (v33 > 0.0 && v33 <= v26)
  {
    TRILogCategory_Server();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "shortDesc");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v50;
      v59 = 2114;
      v60 = v52;
      v61 = 2112;
      v62 = v53;
      _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: end time %@ is in the past", buf, 0x20u);

    }
    v30 = (void *)MEMORY[0x1E0C9AA60];
    v29 = 3;
    goto LABEL_26;
  }
  objc_msgSend(v7, "startDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timeIntervalSince1970");
  v39 = v38;

  if (v39 <= 0.0 || v39 <= v26)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(v4, "experimentDatabase");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[TRIActivateTreatmentBaseTask _experimentRecord:hasConflictWithExperimentsInDatabase:conflictEndTime:](self, "_experimentRecord:hasConflictWithExperimentsInDatabase:conflictEndTime:", v7, v42, buf);

    if (v43)
    {
      if (*(_QWORD *)buf)
        v44 = 1;
      else
        v44 = 3;
      -[TRIActivateTreatmentBaseTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v44, 1, v45, *(_QWORD *)buf);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[TRIActivateTreatmentBaseTask runTaskUsingContext:experiment:](self, "runTaskUsingContext:experiment:", v4, v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    TRILogCategory_Server();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "shortDesc");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startDate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v54;
      v59 = 2114;
      v60 = v56;
      v61 = 2112;
      v62 = v57;
      _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: start time %@ is in the future", buf, 0x20u);

    }
    objc_msgSend(v7, "startDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, MEMORY[0x1E0C9AA60], v41);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:

  return v35;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTreatmentBaseTask;
  return self->_requiresTreatmentInstallation + 37 * -[TRITreatmentBaseTask hash](&v3, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  TRIActivateTreatmentBaseTask *v4;
  unsigned int v5;
  BOOL v6;
  objc_super v8;

  v4 = (TRIActivateTreatmentBaseTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIActivateTreatmentBaseTask;
    v5 = -[TRITreatmentBaseTask isEqual:](&v8, sel_isEqual_, v4);
    v6 = 0;
    if (v4 && v5)
    {
      objc_opt_class();
      v6 = (objc_opt_isKindOfClass() & 1) != 0
        && self->_requiresTreatmentInstallation == v4->_requiresTreatmentInstallation;
    }
  }

  return v6;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (BOOL)requiresTreatmentInstallation
{
  return self->_requiresTreatmentInstallation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
